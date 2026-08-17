unit IvDBGrid;

{$I IVMULTI.INC}

interface

{$IFDEF IVBIDI}
uses
  DBGrids;

type
  TIvDBGrid = class(TDBGrid)
  end;
{$ELSE}

{$R-}

uses
  Windows, SysUtils, Messages, Classes, Controls, Forms, StdCtrls,
  Graphics, IvGrids, DBCtrls, Db, Menus;

type
  TIvColumnValue = (cvColor, cvWidth, cvFont, cvAlignment, cvReadOnly,
    cvTitleColor, cvTitleCaption, cvTitleAlignment, cvTitleFont
{$IFDEF IVIME}
    , cvImeMode, cvImeName
{$ENDIF}
    );
  TIvColumnValues = set of TIvColumnValue;

const
  ColumnTitleValues = [cvTitleColor..cvTitleFont];
  cm_DeferLayout = WM_USER + 100;

type
  TIvColumn = class;
  TIvCustomDBGrid = class;

  TIvColumnTitle = class(TPersistent)
  private
    FColumn: TIvColumn;
    FCaption: String;
    FFont: TFont;
    FColor: TColor;
    FAlignment: TAlignment;

    procedure FontChanged(Sender: TObject);
    function GetAlignment: TAlignment;
    function GetColor: TColor;
    function GetCaption: String;
    function GetFont: TFont;
    function IsAlignmentStored: Boolean;
    function IsColorStored: Boolean;
    function IsFontStored: Boolean;
    function IsCaptionStored: Boolean;
    procedure SetAlignment(Value: TAlignment);
    procedure SetColor(Value: TColor);
    procedure SetFont(Value: TFont);
    procedure SetCaption(const Value: String); virtual;

  protected
    procedure RefreshDefaultFont;

  public
    constructor Create(Column: TIvColumn);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function DefaultAlignment: TAlignment;
    function DefaultColor: TColor;
    function DefaultFont: TFont;
    function DefaultCaption: String;
    procedure RestoreDefaults; virtual;

  published
    property Alignment: TAlignment read GetAlignment write SetAlignment stored IsAlignmentStored;
    property Caption: String read GetCaption write SetCaption stored IsCaptionStored;
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property Font: TFont read GetFont write SetFont stored IsFontStored;
  end;

  TIvColumnButtonStyle = (cbsAuto, cbsEllipsis, cbsNone);

  TIvColumn = class(TCollectionItem)
  private
    FField: TField;
    FFieldName: String;
    FColor: TColor;
    FWidth: Integer;
    FTitle: TIvColumnTitle;
    FFont: TFont;
    FPickList: TStrings;
    FPopupMenu: TPopupMenu;
    FDropDownRows: Cardinal;
    FButtonStyle: TIvColumnButtonStyle;
    FAlignment: TAlignment;
    FReadonly: Boolean;
    FAssignedValues: TIvColumnValues;
{$IFDEF IVIME}
    FImeMode: TImeMode;
    FImeName: TImeName;

    function  GetImeMode: TImeMode;
    function  GetImeName: TImeName;
    procedure SetImeMode(Value: TImeMode); virtual;
    procedure SetImeName(Value: TImeName); virtual;
{$ENDIF}

    procedure FontChanged(Sender: TObject);
    function  GetAlignment: TAlignment;
    function  GetColor: TColor;
    function  GetField: TField;
    function  GetFont: TFont;
    function  GetPickList: TStrings;
    function  GetReadOnly: Boolean;
    function  GetWidth: Integer;
    function  IsAlignmentStored: Boolean;
    function  IsColorStored: Boolean;
    function  IsFontStored: Boolean;
{$IFDEF IVIME}
    function  IsImeModeStored: Boolean;
    function  IsImeNameStored: Boolean;
{$ENDIF}
    function  IsReadOnlyStored: Boolean;
    function  IsWidthStored: Boolean;
    procedure SetAlignment(Value: TAlignment); virtual;
    procedure SetButtonStyle(Value: TIvColumnButtonStyle);
    procedure SetColor(Value: TColor);
    procedure SetField(Value: TField); virtual;
    procedure SetFieldName(const Value: String);
    procedure SetFont(Value: TFont);
    procedure SetPickList(Value: TStrings);
    procedure SetPopupMenu(Value: TPopupMenu);
    procedure SetReadOnly(Value: Boolean); virtual;
    procedure SetTitle(Value: TIvColumnTitle);
    procedure SetWidth(Value: Integer); virtual;

  protected
    function  CreateTitle: TIvColumnTitle; virtual;
    function  GetGrid: TIvCustomDBGrid;
{$IFDEF IVWIDE}
    function GetDisplayName: String; override;
{$ENDIF}
    procedure RefreshDefaultFont;

  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;
    function  DefaultAlignment: TAlignment;
    function  DefaultColor: TColor;
    function  DefaultFont: TFont;
{$IFDEF IVIME}
    function  DefaultImeMode: TImeMode;
    function  DefaultImeName: TImeName;
{$ENDIF}
    function  DefaultReadOnly: Boolean;
    function  DefaultWidth: Integer;
    procedure RestoreDefaults; virtual;

    property  Grid: TIvCustomDBGrid read GetGrid;
    property  AssignedValues: TIvColumnValues read FAssignedValues;
    property  Field: TField read GetField write SetField;

  published
    property  Alignment: TAlignment read GetAlignment write SetAlignment stored IsAlignmentStored;
    property  ButtonStyle: TIvColumnButtonStyle read FButtonStyle write SetButtonStyle default cbsAuto;
    property  Color: TColor read GetColor write SetColor stored IsColorStored;
    property  DropDownRows: Cardinal read FDropDownRows write FDropDownRows default 7;
    property  FieldName: String read FFieldName write SetFieldName;
    property  Font: TFont read GetFont write SetFont stored IsFontStored;
    property  PickList: TStrings read GetPickList write SetPickList;
    property  PopupMenu: TPopupMenu read FPopupMenu write SetPopupMenu;
    property  ReadOnly: Boolean read GetReadOnly write SetReadOnly stored IsReadOnlyStored;
    property  Title: TIvColumnTitle read FTitle write SetTitle;
    property  Width: Integer read GetWidth write SetWidth stored IsWidthStored;
{$IFDEF IVIME}
    property  ImeMode: TImeMode read GetImeMode write SetImeMode stored IsImeModeStored;
    property  ImeName: TImeName read GetImeName write SetImeName stored IsImeNameStored;
{$ENDIF}
  end;

  TIvColumnClass = class of TIvColumn;

  TIvDBGridColumnsState = (csDefault, csCustomized);

  TIvDBGridColumns = class(TCollection)
  private
    FGrid: TIvCustomDBGrid;

    function GeTIvColumn(Index: Integer): TIvColumn;
    function GetState: TIvDBGridColumnsState;
    procedure SeTIvColumn(Index: Integer; Value: TIvColumn);
    procedure SetState(NewState: TIvDBGridColumnsState);

  protected
{$IFDEF IVWIDE}
    function GetOwner: TPersistent; override;
{$ENDIF}
    procedure Update(Item: TCollectionItem); override;

  public
    constructor Create(Grid: TIvCustomDBGrid; ColumnClass: TIvColumnClass);

    function  Add: TIvColumn;
    procedure LoadFromFile(const Filename: string);
    procedure LoadFromStream(S: TStream);
    procedure RestoreDefaults;
    procedure RebuildColumns;
    procedure SaveToFile(const Filename: string);
    procedure SaveToStream(S: TStream);

    property State: TIvDBGridColumnsState read GetState write SetState;
    property Grid: TIvCustomDBGrid read FGrid;
    property Items[Index: Integer]: TIvColumn read GeTIvColumn write SeTIvColumn; default;
  end;

  TIvGridDataLink = class(TDataLink)
  private
    FGrid: TIvCustomDBGrid;
    FFieldCount: Integer;
    FFieldMapSize: Integer;
    FFieldMap: Pointer;
    FModified: Boolean;
    FInUpdateData: Boolean;
    FSparseMap: Boolean;

    function GetDefaultFields: Boolean;
    function GetFields(I: Integer): TField;

  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure EditingChanged; override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
    function  GetMappedIndex(ColIndex: Integer): Integer;

  public
    constructor Create(AGrid: TIvCustomDBGrid);
    destructor Destroy; override;

    function AddMapping(const FieldName: string): Boolean;
    procedure ClearMapping;
    procedure Modified;
    procedure Reset;

    property DefaultFields: Boolean read GetDefaultFields;
    property FieldCount: Integer read FFieldCount;
    property Fields[I: Integer]: TField read GetFields;
    property SparseMap: Boolean read FSparseMap write FSparseMap;
  end;

  TIvBookmarkList = class
  private
    FList: TStringList;
    FGrid: TIvCustomDBGrid;
    FCache: TBookmarkStr;
    FCacheIndex: Integer;
    FCacheFind: Boolean;
    FLinkActive: Boolean;
    function GetCount: Integer;
    function GetCurrentRowSelected: Boolean;
    function GetItem(Index: Integer): TBookmarkStr;
    procedure SetCurrentRowSelected(Value: Boolean);
    procedure StringsChanged(Sender: TObject);
  protected
    function CurrentRow: TBookmarkStr;
    function Compare(const Item1, Item2: TBookmarkStr): Integer;
    procedure LinkActive(Value: Boolean);
  public
    constructor Create(AGrid: TIvCustomDBGrid);
    destructor Destroy; override;
    procedure Clear;           // free all bookmarks
    procedure Delete;          // delete all selected rows from dataset
    function  Find(const Item: TBookmarkStr; var Index: Integer): Boolean;
    function  IndexOf(const Item: TBookmarkStr): Integer;
    function  Refresh: Boolean;// drop orphaned bookmarks; True = orphans found
    property Count: Integer read GetCount;
    property CurrentRowSelected: Boolean read GetCurrentRowSelected
      write SetCurrentRowSelected;
    property Items[Index: Integer]: TBookmarkStr read GetItem; default;
  end;

  TIvDBGridOption = (dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator,
    dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect,
    dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect);
  TIvDBGridOptions = set of TIvDBGridOption;

  TIvDrawDataCellEvent = procedure (Sender: TObject; const Rect: TRect; Field: TField;
    State: TIvGridDrawState) of object;

  TIvDrawColumnCellEvent = procedure (Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TIvColumn; State: TIvGridDrawState) of object;
  TIvDBGridClickEvent = procedure (Column: TIvColumn) of object;

  TIvCustomDBGrid = class(TIvCustomGrid)
  private
    FIndicators: TImageList;
    FTitleFont: TFont;
    FReadOnly: Boolean;
    FUserChange: Boolean;
    FLayoutFromDataset: Boolean;
    FOptions: TIvDBGridOptions;
    FTitleOffset, FIndicatorOffset: Byte;
    FUpdateLock: Byte;
    FLayoutLock: Byte;
    FInColExit: Boolean;
    FDefaultDrawing: Boolean;
    FSelfChangingTitleFont: Boolean;
    FSelecting: Boolean;
    FSelRow: Integer;
    FDataLink: TIvGridDataLink;
    FOnColEnter: TNotifyEvent;
    FOnColExit: TNotifyEvent;
    FOnDrawDataCell: TIvDrawDataCellEvent;
    FOnDrawColumnCell: TIvDrawColumnCellEvent;
    FEditText: String;
    FColumns: TIvDBGridColumns;
    FOnEditButtonClick: TNotifyEvent;
    FOnColumnMoved: TIvMovedEvent;
    FBookmarks: TIvBookmarkList;
    FSelectionAnchor: TBookmarkStr;
{$IFDEF IVIME}
    FOriginalImeName: TImeName;
    FOriginalImeMode: TImeMode;
{$ENDIF}
    FOnCellClick: TIvDBGridClickEvent;
    FOnTitleClick:TIvDBGridClickEvent;

    function AcquireFocus: Boolean;
    procedure DataChanged;
    procedure EditingChanged;
    function GetDataSource: TDataSource;
    function GetFieldCount: Integer;
    function GetFields(FieldIndex: Integer): TField;
    function GetSelectedField: TField;
    function GetSelectedIndex: Integer;
    procedure InternalLayout;
    procedure MoveCol(RawCol: Integer);
{$IFDEF IVWIDE}
    procedure ReadColumns(Reader: TReader);
    procedure WriteColumns(Writer: TWriter);
{$ENDIF}
    procedure RecordChanged(Field: TField);
    procedure SeTIvColumns(Value: TIvDBGridColumns);
    procedure SetDataSource(Value: TDataSource);
    procedure SetOptions(Value: TIvDBGridOptions);
    procedure SetSelectedField(Value: TField);
    procedure SetSelectedIndex(Value: Integer);
    procedure SetTitleFont(Value: TFont);
    procedure TitleFontChanged(Sender: TObject);
    procedure UpdateData;
    procedure UpdateActive;
{$IFDEF IVIME}
    procedure SetIme;
    procedure UpdateIme;
{$ENDIF}
    procedure UpdateScrollBar;
    procedure UpdateRowCount;
    procedure CMExit(var Message: TMessage); message CM_EXIT;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMParentFontChanged(var Message: TMessage); message CM_PARENTFONTCHANGED;
    procedure CMDeferLayout(var Message); message cm_DeferLayout;
    procedure CMDesignHitTest(var Msg: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
{$IFDEF IVIME}
    procedure WMIMEStartComp(var Message: TMessage); message WM_IME_STARTCOMPOSITION;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SetFOCUS;
    procedure WMKillFocus(var Message: TMessage); message WM_KillFocus;
{$ENDIF}

  protected
    FUpdateFields: Boolean;
    FAcquireFocus: Boolean;
    FUpdatingEditor: Boolean;

    function  RawToDataColumn(ACol: Integer): Integer;
    function  DataToRawColumn(ACol: Integer): Integer;
    function  AcquireLayoutLock: Boolean;
    procedure BeginLayout;
    procedure BeginUpdate;
    procedure CancelLayout;
    function  CanEditAcceptKey(Key: Char): Boolean; override;
    function  CanEditModify: Boolean; override;
    function  CanEditShow: Boolean; override;
    procedure CellClick(Column: TIvColumn); dynamic;
    procedure ColumnMoved(FromIndex, ToIndex: Longint); override;
    procedure ColEnter; dynamic;
    procedure ColExit; dynamic;
    procedure ColWidthsChanged; override;
    function  CreateColumns: TIvDBGridColumns; dynamic;
    function  CreateEditor: TIvInplaceEdit; override;
    procedure CreateWnd; override;
    procedure DeferLayout;
    procedure DefaultHandler(var Msg); override;
    procedure DefineFieldMap; virtual;
{$IFDEF IVWIDE}
    procedure DefineProperties(Filer: TFiler); override;
{$ENDIF}
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TIvGridDrawState); override;
    procedure DrawDataCell(const Rect: TRect; Field: TField;
      State: TIvGridDrawState); dynamic; { obsolete }
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer;
      Column: TIvColumn; State: TIvGridDrawState); dynamic;
    procedure EditButtonClick; dynamic;
    procedure EndLayout;
    procedure EndUpdate;
    function  GetColField(DataCol: Integer): TField;
    function  GetEditLimit: Integer; override;
    function  GetEditMask(ACol, ARow: Longint): string; override;
    function  GetEditText(ACol, ARow: Longint): string; override;
    function  GetFieldValue(ACol: Integer): string;
    function  HighlightCell(DataCol, DataRow: Integer; const Value: string;
      AState: TIvGridDrawState): Boolean; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure LayoutChanged; virtual;
    procedure LinkActive(Value: Boolean); virtual;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Scroll(Distance: Integer); virtual;
    procedure SeTIvColumnAttributes; virtual;
    procedure SetEditText(ACol, ARow: Longint; const Value: string); override;
    function  StoreColumns: Boolean;
    procedure TimedScroll(Direction: TIvGridScrollDirection); override;
    procedure TitleClick(Column: TIvColumn); dynamic;

    property Columns: TIvDBGridColumns read FColumns write SeTIvColumns;
    property DefaultDrawing: Boolean read FDefaultDrawing write FDefaultDrawing default True;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataLink: TIvGridDataLink read FDataLink;
    property IndicatorOffset: Byte read FIndicatorOffset;
    property LayoutLock: Byte read FLayoutLock;
    property Options: TIvDBGridOptions read FOptions write SetOptions
      default [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines,
      dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit];
    property ParentColor default False;
    property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
    property SelectedRows: TIvBookmarkList read FBookmarks;
    property TitleFont: TFont read FTitleFont write SetTitleFont;
    property UpdateLock: Byte read FUpdateLock;
    property OnColEnter: TNotifyEvent read FOnColEnter write FOnColEnter;
    property OnColExit: TNotifyEvent read FOnColExit write FOnColExit;
    property OnDrawDataCell: TIvDrawDataCellEvent read FOnDrawDataCell
      write FOnDrawDataCell; { obsolete }
    property OnDrawColumnCell: TIvDrawColumnCellEvent read FOnDrawColumnCell
      write FOnDrawColumnCell;
    property OnEditButtonClick: TNotifyEvent read FOnEditButtonClick
      write FOnEditButtonClick;
    property OnColumnMoved: TIvMovedEvent read FOnColumnMoved write FOnColumnMoved;
    property OnCellClick: TIvDBGridClickEvent read FOnCellClick write FOnCellClick;
    property OnTitleClick: TIvDBGridClickEvent read FOnTitleClick write FOnTitleClick;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure DefaultDrawDataCell(const Rect: TRect; Field: TField;
      State: TIvGridDrawState); { obsolete }
    procedure DefaultDrawColumnCell(const Rect: TRect; DataCol: Integer;
      Column: TIvColumn; State: TIvGridDrawState);
    function ValidFieldIndex(FieldIndex: Integer): Boolean;

    property EditorMode;
    property FieldCount: Integer read GetFieldCount;
    property Fields[FieldIndex: Integer]: TField read GetFields;
    property SelectedField: TField read GetSelectedField write SetSelectedField;
    property SelectedIndex: Integer read GetSelectedIndex write SetSelectedIndex;
  end;

  TIvDBGrid = class(TIvCustomDBGrid)
  public
    property Canvas;
    property SelectedRows;
    //property ColLocale;

  published
    property Align;
    property BorderStyle;
    property Color;
    property Columns stored False; //StoreColumns;
    property Ctl3D;
    property DataSource;
    property DefaultDrawing;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FixedColor;
    property Font;
    property Options;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property TitleFont;
    property Visible;
{$IFDEF IVIME}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property OnCellClick;
    property OnColEnter;
    property OnColExit;
    property OnColumnMoved;
    property OnDrawDataCell;  { obsolete }
    property OnDrawColumnCell;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditButtonClick;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDrag;
    property OnTitleClick;
  end;

const
  IndicatorWidth = 11;
{$ENDIF}

implementation

{$IFNDEF IVBIDI}
uses
{$IFNDEF IVWIDE}
  BDE, DBTables,
{$ENDIF}
  DBConsts, Dialogs,
  IvDictio, IvMlUtil;

{$R IVDBGRID.RES}

const
  bmArrow = 'IVDBGARROW';
  bmEdit = 'IVDBEDIT';
  bmInsert = 'IVDBINSERT';
  bmMultiDot = 'IVDBMULTIDOT';
  bmMultiArrow = 'IVDBMULTIARROW';

  MaxMapSize = (MaxInt div 2) div SizeOf(Integer);  { 250 million }

{ Error reporting }

{$IFDEF IVWIDE}
procedure RaiseGridError(const S: String);
begin
  raise EIvInvalidGridOperation.Create(S);
end;
{$ELSE}
procedure RaiseGridError(const id: Integer);
begin
  raise EIvInvalidGridOperation.CreateRes(id);
end;
{$ENDIF}

procedure KillMessage(Wnd: HWnd; Msg: Integer);
// Delete the requested message from the queue, but throw back
// any WM_QUIT msgs that PeekMessage may also return
var
  M: TMsg;
begin
  M.Message := 0;
  if PeekMessage(M, Wnd, Msg, Msg, pm_Remove) and (M.Message = WM_QUIT) then
    PostQuitMessage(M.wparam);
end;

{ TIvDBGridInplaceEdit }

{ TIvDBGridInplaceEdit adds support for a button on the in-place editor,
  which can be used to drop down a table-based lookup list, a stringlist-based
  pick list, or (if button style is esEllipsis) fire the grid event
  OnEditButtonClick.  }

type
  TEditStyle = (esSimple, esEllipsis, esPickList, esDataList);
  TPopupListbox = class;

  TIvDBGridInplaceEdit = class(TIvInplaceEdit)
  private
    FButtonWidth: Integer;
    FDataList: TDBLookupListBox;
    FPickList: TPopupListbox;
    FActiveList: TWinControl;
    FLookupSource: TDatasource;
    FEditStyle: TEditStyle;
    FListVisible: Boolean;
    FTracking: Boolean;
    FPressed: Boolean;
    procedure ListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SetEditStyle(Value: TEditStyle);
    procedure StopTracking;
    procedure TrackButton(X,Y: Integer);
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CancelMode;
    procedure WMCancelMode(var Message: TMessage); message WM_CancelMode;
    procedure WMKillFocus(var Message: TMessage); message WM_KillFocus;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message wm_LButtonDblClk;
    procedure WMPaint(var Message: TWMPaint); message wm_Paint;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SetCursor;
  protected
    procedure BoundsChanged; override;
    procedure CloseUp(Accept: Boolean);
    procedure DoDropDownKeys(var Key: Word; Shift: TShiftState);
    procedure DropDown;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure PaintWindow(DC: HDC); override;
    procedure UpdateContents; override;
    procedure WndProc(var Message: TMessage); override;
    property  EditStyle: TEditStyle read FEditStyle write SetEditStyle;
    property  ActiveList: TWinControl read FActiveList write FActiveList;
    property  DataList: TDBLookupListBox read FDataList;
    property  PickList: TPopupListbox read FPickList;
  public
    constructor Create(Owner: TComponent); override;
  end;

{ TPopupListbox }

  TPopupListbox = class(TCustomListbox)
  private
    FSearchText: String;
    FSearchTickCount: Longint;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  end;

procedure TPopupListBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TPopupListbox.CreateWnd;
begin
  inherited CreateWnd;
  Windows.SetParent(Handle, 0);
  CallWindowProc(DefWndProc, Handle, wm_SetFocus, 0, 0);
end;

procedure TPopupListbox.Keypress(var Key: Char);
var
  TickCount: Integer;
begin
  case Key of
    #8, #27: FSearchText := '';
    #32..#255:
      begin
        TickCount := GetTickCount;
        if TickCount - FSearchTickCount > 2000 then FSearchText := '';
        FSearchTickCount := TickCount;
        if Length(FSearchText) < 32 then FSearchText := FSearchText + Key;
        SendMessage(Handle, LB_SelectString, WORD(-1), Longint(PChar(FSearchText)));
        Key := #0;
      end;
  end;
  inherited Keypress(Key);
end;

procedure TPopupListbox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  TIvDBGridInPlaceEdit(Owner).CloseUp((X >= 0) and (Y >= 0) and
      (X < Width) and (Y < Height));
end;


constructor TIvDBGridInplaceEdit.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FLookupSource := TDataSource.Create(Self);
  FButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
  FEditStyle := esSimple;
end;

procedure TIvDBGridInplaceEdit.BoundsChanged;
var
  R: TRect;
begin
  SetRect(R, 2, 2, Width - 2, Height);
  if FEditStyle <> esSimple then Dec(R.Right, FButtonWidth);
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@R));
  SendMessage(Handle, EM_SCROLLCARET, 0, 0);
{$IFDEF IVWIDE}
  if SysLocale.Fareast then
    SetImeCompositionWindow(Font, R.Left, R.Top);
{$ENDIF}
end;

procedure TIvDBGridInplaceEdit.CloseUp(Accept: Boolean);
var
  MasterField: TField;
  ListValue: Variant;
begin
  if FListVisible then
  begin
    if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
    if FActiveList = FDataList then
      ListValue := FDataList.KeyValue
    else
      if FPickList.ItemIndex <> -1 then
        ListValue := FPickList.Items[FPicklist.ItemIndex];
    SetWindowPos(FActiveList.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    FListVisible := False;
    if Assigned(FDataList) then
      FDataList.ListSource := nil;
    FLookupSource.Dataset := nil;
    Invalidate;
    if Accept then
      if FActiveList = FDataList then
        with TIvCustomDBGrid(Grid), Columns[SelectedIndex].Field do
        begin
          MasterField := DataSet.FieldByName(KeyFields);
          if MasterField.CanModify then
          begin
            DataSet.Edit;
            MasterField.Value := ListValue;
          end;
        end
      else
        if (not VarIsNull(ListValue)) and EditCanModify then
          with TIvCustomDBGrid(Grid), Columns[SelectedIndex].Field do
            Text := ListValue;
  end;
end;

procedure TIvDBGridInplaceEdit.DoDropDownKeys(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP, VK_DOWN:
      if ssAlt in Shift then
      begin
        if FListVisible then CloseUp(True) else DropDown;
        Key := 0;
      end;
    VK_RETURN, VK_ESCAPE:
      if FListVisible and not (ssAlt in Shift) then
      begin
        CloseUp(Key = VK_RETURN);
        Key := 0;
      end;
  end;
end;

procedure TIvDBGridInplaceEdit.DropDown;
var
  P: TPoint;
  I,J,Y: Integer;
  Column: TIvColumn;
begin
  if not FListVisible and Assigned(FActiveList) then
  begin
    FActiveList.Width := Width;
    with TIvCustomDBGrid(Grid) do
      Column := Columns[SelectedIndex];
    if FActiveList = FDataList then
    with Column.Field do
    begin
      FDataList.Color := Color;
      FDataList.Font := Font;
      FDataList.RowCount := Column.DropDownRows;
      FLookupSource.DataSet := LookupDataSet;
      FDataList.KeyField := LookupKeyFields;
      FDataList.ListField := LookupResultField;
      FDataList.ListSource := FLookupSource;
      FDataList.KeyValue := DataSet.FieldByName(KeyFields).Value;
{      J := Column.DefaultWidth;
      if J > FDataList.ClientWidth then
        FDataList.ClientWidth := J;
}    end
    else
    begin
      FPickList.Color := Color;
      FPickList.Font := Font;
      FPickList.Items := Column.Picklist;
      if FPickList.Items.Count >= Column.DropDownRows then
        FPickList.Height := Column.DropDownRows * FPickList.ItemHeight + 4
      else
        FPickList.Height := FPickList.Items.Count * FPickList.ItemHeight + 4;
      if Column.Field.IsNull then
        FPickList.ItemIndex := -1
      else
        FPickList.ItemIndex := FPickList.Items.IndexOf(Column.Field.Value);
      J := FPickList.ClientWidth;
      for I := 0 to FPickList.Items.Count - 1 do
      begin
        Y := FPickList.Canvas.TextWidth(FPickList.Items[I]);
        if Y > J then J := Y;
      end;
      FPickList.ClientWidth := J;
    end;
    P := Parent.ClientToScreen(Point(Left, Top));
    Y := P.Y + Height;
    if Y + FActiveList.Height > Screen.Height then Y := P.Y - FActiveList.Height;
    SetWindowPos(FActiveList.Handle, HWND_TOP, P.X, Y, 0, 0,
      SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
    FListVisible := True;
    Invalidate;
    Windows.SetFocus(Handle);
  end;
end;

type
  TWinControlCracker = class(TWinControl) end;

procedure TIvDBGridInplaceEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (EditStyle = esEllipsis) and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
  begin
    TIvCustomDBGrid(Grid).EditButtonClick;
    KillMessage(Handle, WM_CHAR);
  end
  else
    inherited KeyDown(Key, Shift);
end;

procedure TIvDBGridInplaceEdit.ListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    CloseUp(PtInRect(FActiveList.ClientRect, Point(X, Y)));
end;

procedure TIvDBGridInplaceEdit.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if (Button = mbLeft) and (FEditStyle <> esSimple) and
    PtInRect(Rect(Width - FButtonWidth, 0, Width, Height), Point(X,Y)) then
  begin
    if FListVisible then
      CloseUp(False)
    else
    begin
      MouseCapture := True;
      FTracking := True;
      TrackButton(X, Y);
      if Assigned(FActiveList) then
        DropDown;
    end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TIvDBGridInplaceEdit.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ListPos: TPoint;
  MousePos: TSmallPoint;
begin
  if FTracking then
  begin
    TrackButton(X, Y);
    if FListVisible then
    begin
      ListPos := FActiveList.ScreenToClient(ClientToScreen(Point(X, Y)));
      if PtInRect(FActiveList.ClientRect, ListPos) then
      begin
        StopTracking;
        MousePos := PointToSmallPoint(ListPos);
        SendMessage(FActiveList.Handle, WM_LBUTTONDOWN, 0, Integer(MousePos));
        Exit;
      end;
    end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TIvDBGridInplaceEdit.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  WasPressed: Boolean;
begin
  WasPressed := FPressed;
  StopTracking;
  if (Button = mbLeft) and (FEditStyle = esEllipsis) and WasPressed then
    TIvCustomDBGrid(Grid).EditButtonClick;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TIvDBGridInplaceEdit.PaintWindow(DC: HDC);
var
  R: TRect;
  Flags: Integer;
  W: Integer;
begin
  if FEditStyle <> esSimple then
  begin
    SetRect(R, Width - FButtonWidth, 0, Width, Height);
    Flags := 0;
    if FEditStyle in [esDataList, esPickList] then
    begin
      if FActiveList = nil then
        Flags := DFCS_INACTIVE
      else if FPressed then
        Flags := DFCS_FLAT or DFCS_PUSHED;
      DrawFrameControl(DC, R, DFC_SCROLL, Flags or DFCS_SCROLLCOMBOBOX);
    end
    else   { esEllipsis }
    begin
      if FPressed then
        Flags := BF_FLAT;
      DrawEdge(DC, R, EDGE_RAISED, BF_RECT or BF_MIDDLE or Flags);
      Flags := ((R.Right - R.Left) shr 1) - 1 + Ord(FPressed);
      W := Height shr 3;
      if W = 0 then W := 1;
      PatBlt(DC, R.Left + Flags, R.Top + Flags, W, W, BLACKNESS);
      PatBlt(DC, R.Left + Flags - (W * 2), R.Top + Flags, W, W, BLACKNESS);
      PatBlt(DC, R.Left + Flags + (W * 2), R.Top + Flags, W, W, BLACKNESS);
    end;
    ExcludeClipRect(DC, R.Left, R.Top, R.Right, R.Bottom);
  end;
  inherited PaintWindow(DC);
end;

procedure TIvDBGridInplaceEdit.SetEditStyle(Value: TEditStyle);
begin
  if Value = FEditStyle then Exit;
  FEditStyle := Value;
  case Value of
    esPickList:
      begin
        if FPickList = nil then
        begin
          FPickList := TPopupListbox.Create(Self);
          FPickList.Visible := False;
          FPickList.Parent := Self;
          FPickList.OnMouseUp := ListMouseUp;
          FPickList.IntegralHeight := True;
          FPickList.ItemHeight := 11;
        end;
        FActiveList := FPickList;
      end;
    esDataList:
      begin
        if FDataList = nil then
        begin
          FDataList := TPopupDataList.Create(Self);
          FDataList.Visible := False;
          FDataList.Parent := Self;
          FDataList.OnMouseUp := ListMouseUp;
        end;
        FActiveList := FDataList;
      end;
  else  { cbsNone, cbsEllipsis, or read only field }
    FActiveList := nil;
  end;
  with TIvCustomDBGrid(Grid) do
    Self.ReadOnly := Columns[SelectedIndex].ReadOnly;
  Repaint;
end;

procedure TIvDBGridInplaceEdit.StopTracking;
begin
  if FTracking then
  begin
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TIvDBGridInplaceEdit.TrackButton(X,Y: Integer);
var
  NewState: Boolean;
  R: TRect;
begin
  SetRect(R, ClientWidth - FButtonWidth, 0, ClientWidth, ClientHeight);
  NewState := PtInRect(R, Point(X, Y));
  if FPressed <> NewState then
  begin
    FPressed := NewState;
    InvalidateRect(Handle, @R, False);
  end;
end;

procedure TIvDBGridInplaceEdit.UpdateContents;
var
  Column: TIvColumn;
  NewStyle: TEditStyle;
  MasterField: TField;
begin
  with TIvCustomDBGrid(Grid) do
    Column := Columns[SelectedIndex];
  NewStyle := esSimple;
  case Column.ButtonStyle of
   cbsEllipsis: NewStyle := esEllipsis;
   cbsAuto:
     if Assigned(Column.Field) then
     with Column.Field do
     begin
       { Show the dropdown button only if the field is editable }
       if FieldKind = fkLookup then
       begin
         MasterField := Dataset.FieldByName(KeyFields);
         { Column.DefaultReadonly will always be True for a lookup field.
           Test if Column.ReadOnly has been assigned a value of True }
         if Assigned(MasterField) and MasterField.CanModify and
           not ((cvReadOnly in Column.AssignedValues) and Column.ReadOnly) then
           with TIvCustomDBGrid(Grid) do
             if not ReadOnly and DataLink.Active and not Datalink.ReadOnly then
               NewStyle := esDataList
       end
       else
       if Assigned(Column.Picklist) and (Column.PickList.Count > 0) and
         not Column.Readonly then
         NewStyle := esPickList;
     end;
  end;
  EditStyle := NewStyle;
  inherited UpdateContents;
end;

procedure TIvDBGridInplaceEdit.CMCancelMode(var Message: TCMCancelMode);
begin
  if (Message.Sender <> Self) and (Message.Sender <> FActiveList) then
    CloseUp(False);
end;

procedure TIvDBGridInplaceEdit.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TIvDBGridInplaceEdit.WMKillFocus(var Message: TMessage);
begin
{$IFDEF IVIME}
  if SysLocale.FarEast then
  begin
    ImeName := Screen.DefaultIme;
    ImeMode := imDontCare;
  end;
{$ENDIF}
  inherited;
  CloseUp(False);
end;

procedure TIvDBGridInplaceEdit.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  with Message do
  if (FEditStyle <> esSimple) and
    PtInRect(Rect(Width - FButtonWidth, 0, Width, Height), Point(XPos, YPos)) then
    Exit;
  inherited;
end;

procedure TIvDBGridInplaceEdit.WMPaint(var Message: TWMPaint);
begin
  PaintHandler(Message);
end;

procedure TIvDBGridInplaceEdit.WMSetCursor(var Message: TWMSetCursor);
var
  P: TPoint;
begin
  GetCursorPos(P);
  if (FEditStyle <> esSimple) and
    PtInRect(Rect(Width - FButtonWidth, 0, Width, Height), ScreenToClient(P)) then
    Windows.SetCursor(LoadCursor(0, idc_Arrow))
  else
    inherited;
end;

procedure TIvDBGridInplaceEdit.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    wm_KeyDown, wm_SysKeyDown, wm_Char:
      if EditStyle in [esPickList, esDataList] then
      with TWMKey(Message) do
      begin
        DoDropDownKeys(CharCode, KeyDataToShiftState(KeyData));
        if (CharCode <> 0) and FListVisible then
        begin
          with TMessage(Message) do
            SendMessage(FActiveList.Handle, Msg, WParam, LParam);
          Exit;
        end;
      end
  end;
  inherited;
end;


{ TIvGridDataLink }

type
  TIntArray = array[0..MaxMapSize] of Integer;
  PIntArray = ^TIntArray;

constructor TIvGridDataLink.Create(AGrid: TIvCustomDBGrid);
begin
  inherited Create;
  FGrid := AGrid;
end;

destructor TIvGridDataLink.Destroy;
begin
  ClearMapping;
  inherited Destroy;
end;

function TIvGridDataLink.GetDefaultFields: Boolean;
var
  I: Integer;
begin
  Result := True;
  if DataSet <> nil then Result := DataSet.DefaultFields;
  if Result and SparseMap then
  for I := 0 to FFieldCount-1 do
    if PIntArray(FFieldMap)^[I] < 0 then
    begin
      Result := False;
      Exit;
    end;
end;

function TIvGridDataLink.GetFields(I: Integer): TField;
begin
  if (0 <= I) and (I < FFieldCount) and (PIntArray(FFieldMap)^[I] >= 0) then
    Result := DataSet.Fields[PIntArray(FFieldMap)^[I]]
  else
    Result := nil;
end;

function TIvGridDataLink.AddMapping(const FieldName: string): Boolean;
var
  Field: TField;
  NewSize: Integer;
begin
  Result := True;
  if FFieldCount >= MaxMapSize then
    RaiseGridError(STooManyColumns);
  if SparseMap then
    Field := DataSet.FindField(FieldName)
  else
    Field := DataSet.FieldByName(FieldName);

  if FFieldCount = FFieldMapSize then
  begin
    NewSize := FFieldMapSize;
    if NewSize = 0 then
      NewSize := 8
    else
      Inc(NewSize, NewSize);
    if (NewSize < FFieldCount) then
      NewSize := FFieldCount + 1;
    if (NewSize > MaxMapSize) then
      NewSize := MaxMapSize;
    ReallocMem(FFieldMap, NewSize * SizeOf(Integer));
    FFieldMapSize := NewSize;
  end;
  if Assigned(Field) then
  begin
    PIntArray(FFieldMap)^[FFieldCount] := Field.Index;
    Field.FreeNotification(FGrid);
  end
  else
    PIntArray(FFieldMap)^[FFieldCount] := -1;
  Inc(FFieldCount);
end;

procedure TIvGridDataLink.ActiveChanged;
begin
  FGrid.LinkActive(Active);
end;

procedure TIvGridDataLink.ClearMapping;
begin
  if FFieldMap <> nil then
  begin
    FreeMem(FFieldMap, FFieldMapSize * SizeOf(Integer));
    FFieldMap := nil;
    FFieldMapSize := 0;
    FFieldCount := 0;
  end;
end;

procedure TIvGridDataLink.Modified;
begin
  FModified := True;
end;

procedure TIvGridDataLink.DataSetChanged;
begin
  FGrid.DataChanged;
  FModified := False;
end;

procedure TIvGridDataLink.DataSetScrolled(Distance: Integer);
begin
  FGrid.Scroll(Distance);
end;

procedure TIvGridDataLink.LayoutChanged;
var
  SaveState: Boolean;
begin
  { FLayoutFromDataset determines whether default column width is forced to
    be at least wide enough for the column title.  }
  SaveState := FGrid.FLayoutFromDataset;
  FGrid.FLayoutFromDataset := True;
  try
    FGrid.LayoutChanged;
  finally
    FGrid.FLayoutFromDataset := SaveState;
  end;
  inherited LayoutChanged;
end;

procedure TIvGridDataLink.FocusControl(Field: TFieldRef);
begin
  if Assigned(Field) and Assigned(Field^) then
  begin
    FGrid.SelectedField := Field^;
    if (FGrid.SelectedField = Field^) and FGrid.AcquireFocus then
    begin
      Field^ := nil;
      FGrid.ShowEditor;
    end;
  end;
end;

procedure TIvGridDataLink.EditingChanged;
begin
  FGrid.EditingChanged;
end;

procedure TIvGridDataLink.RecordChanged(Field: TField);
begin
  FGrid.RecordChanged(Field);
  FModified := False;
end;

procedure TIvGridDataLink.UpdateData;
begin
  FInUpdateData := True;
  try
    if FModified then FGrid.UpdateData;
    FModified := False;
  finally
    FInUpdateData := False;
  end;
end;

function TIvGridDataLink.GetMappedIndex(ColIndex: Integer): Integer;
begin
  if (0 <= ColIndex) and (ColIndex < FFieldCount) then
    Result := PIntArray(FFieldMap)^[ColIndex]
  else
    Result := -1;
end;

procedure TIvGridDataLink.Reset;
begin
  if FModified then RecordChanged(nil) else Dataset.Cancel;
end;


{ TIvColumnTitle }
constructor TIvColumnTitle.Create(Column: TIvColumn);
begin
  inherited Create;
  FColumn := Column;
  FFont := TFont.Create;
  FFont.Assign(DefaultFont);
  FFont.OnChange := FontChanged;
end;

destructor TIvColumnTitle.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;

procedure TIvColumnTitle.Assign(Source: TPersistent);
begin
  if Source is TIvColumnTitle then
  begin
    if cvTitleAlignment in TIvColumnTitle(Source).FColumn.FAssignedValues then
      Alignment := TIvColumnTitle(Source).Alignment;
    if cvTitleColor in TIvColumnTitle(Source).FColumn.FAssignedValues then
      Color := TIvColumnTitle(Source).Color;
    if cvTitleCaption in TIvColumnTitle(Source).FColumn.FAssignedValues then
      Caption := TIvColumnTitle(Source).Caption;
    if cvTitleFont in TIvColumnTitle(Source).FColumn.FAssignedValues then
      Font := TIvColumnTitle(Source).Font;
  end
  else
    inherited Assign(Source);
end;

function TIvColumnTitle.DefaultAlignment: TAlignment;
begin
  Result := taLeftJustify;
end;

function TIvColumnTitle.DefaultColor: TColor;
var
  Grid: TIvCustomDBGrid;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) then
    Result := Grid.FixedColor
  else
    Result := clBtnFace;
end;

function TIvColumnTitle.DefaultFont: TFont;
var
  Grid: TIvCustomDBGrid;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) then
    Result := Grid.TitleFont
  else
    Result := FColumn.Font;
end;

function TIvColumnTitle.DefaultCaption: string;
var
  Field: TField;
begin
  Field := FColumn.Field;
  if Assigned(Field) then
    Result := Field.DisplayName
  else
    Result := FColumn.FieldName;
end;

procedure TIvColumnTitle.FontChanged(Sender: TObject);
begin
  Include(FColumn.FAssignedValues, cvTitleFont);
  FColumn.Changed(True);
end;

function TIvColumnTitle.GetAlignment: TAlignment;
begin
  if cvTitleAlignment in FColumn.FAssignedValues then
    Result := FAlignment
  else
    Result := DefaultAlignment;
end;

function TIvColumnTitle.GetColor: TColor;
begin
  if cvTitleColor in FColumn.FAssignedValues then
    Result := FColor
  else
    Result := DefaultColor;
end;

function TIvColumnTitle.GetCaption: string;
begin
  if cvTitleCaption in FColumn.FAssignedValues then
    Result := FCaption
  else
    Result := DefaultCaption;
end;

function TIvColumnTitle.GetFont: TFont;
var
  Save: TNotifyEvent;
  Def: TFont;
begin
  if not (cvTitleFont in FColumn.FAssignedValues) then
  begin
    Def := DefaultFont;
    if (FFont.Handle <> Def.Handle) or (FFont.Color <> Def.Color) then
    begin
      Save := FFont.OnChange;
      FFont.OnChange := nil;
      FFont.Assign(DefaultFont);
      FFont.OnChange := Save;
    end;
  end;
  Result := FFont;
end;

function TIvColumnTitle.IsAlignmentStored: Boolean;
begin
  Result := (cvTitleAlignment in FColumn.FAssignedValues) and
    (FAlignment <> DefaultAlignment);
end;

function TIvColumnTitle.IsColorStored: Boolean;
begin
  Result := (cvTitleColor in FColumn.FAssignedValues) and
    (FColor <> DefaultColor);
end;

function TIvColumnTitle.IsFontStored: Boolean;
begin
  Result := (cvTitleFont in FColumn.FAssignedValues);
end;

function TIvColumnTitle.IsCaptionStored: Boolean;
begin
  Result := (cvTitleCaption in FColumn.FAssignedValues) and
    (FCaption <> DefaultCaption);
end;

procedure TIvColumnTitle.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if (cvTitleFont in FColumn.FAssignedValues) then Exit;
  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TIvColumnTitle.RestoreDefaults;
var
  FontAssigned: Boolean;
begin
  FontAssigned := cvTitleFont in FColumn.FAssignedValues;
  FColumn.FAssignedValues := FColumn.FAssignedValues - ColumnTitleValues;
  FCaption := '';
  RefreshDefaultFont;
  { If font was assigned, changing it back to default may affect grid title
    height, and title height changes require layout and redraw of the grid. }
  FColumn.Changed(FontAssigned);
end;

procedure TIvColumnTitle.SetAlignment(Value: TAlignment);
begin
  if (cvTitleAlignment in FColumn.FAssignedValues) and (Value = FAlignment) then Exit;
  FAlignment := Value;
  Include(FColumn.FAssignedValues, cvTitleAlignment);
  FColumn.Changed(False);
end;

procedure TIvColumnTitle.SetColor(Value: TColor);
begin
  if (cvTitleColor in FColumn.FAssignedValues) and (Value = FColor) then Exit;
  FColor := Value;
  Include(FColumn.FAssignedValues, cvTitleColor);
  FColumn.Changed(False);
end;

procedure TIvColumnTitle.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TIvColumnTitle.SetCaption(const Value: string);
begin
  if (cvTitleCaption in FColumn.FAssignedValues) and (Value = FCaption) then Exit;
  FCaption := Value;
  Include(FColumn.FAssignedValues, cvTitleCaption);
  FColumn.Changed(False);
end;


{ TIvColumn }

constructor TIvColumn.Create(Collection: TCollection);
var
  Grid: TIvCustomDBGrid;
begin
  Grid := nil;
  if Assigned(Collection) and (Collection is TIvDBGridColumns) then
    Grid := TIvDBGridColumns(Collection).Grid;
  if Assigned(Grid) then
    Grid.BeginLayout;
  try
    inherited Create(Collection);
    FDropDownRows := 7;
    FButtonStyle := cbsAuto;
    FFont := TFont.Create;
    FFont.Assign(DefaultFont);
    FFont.OnChange := FontChanged;
{$IFDEF IVIME}
    FImeMode := imDontCare;
    FImeName := Screen.DefaultIme;
{$ENDIF}
    FTitle := CreateTitle;
  finally
    if Assigned(Grid) then
      Grid.EndLayout;
  end;
end;

destructor TIvColumn.Destroy;
begin
  FTitle.Free;
  FFont.Free;
  FPickList.Free;
  inherited Destroy;
end;

procedure TIvColumn.Assign(Source: TPersistent);
begin
  if Source is TIvColumn then
  begin
    if Assigned(Collection) then Collection.BeginUpdate;
    try
      RestoreDefaults;
      FieldName := TIvColumn(Source).FieldName;
      if cvColor in TIvColumn(Source).AssignedValues then
        Color := TIvColumn(Source).Color;
      if cvWidth in TIvColumn(Source).AssignedValues then
        Width := TIvColumn(Source).Width;
      if cvFont in TIvColumn(Source).AssignedValues then
        Font := TIvColumn(Source).Font;
{$IFDEF IVIME}
      if cvImeMode in TIvColumn(Source).AssignedValues then
        ImeMode := TIvColumn(Source).ImeMode;
      if cvImeName in TIvColumn(Source).AssignedValues then
        ImeName := TIvColumn(Source).ImeName;
{$ENDIF}
      if cvAlignment in TIvColumn(Source).AssignedValues then
        Alignment := TIvColumn(Source).Alignment;
      if cvReadOnly in TIvColumn(Source).AssignedValues then
        ReadOnly := TIvColumn(Source).ReadOnly;
      Title := TIvColumn(Source).Title;
      DropDownRows := TIvColumn(Source).DropDownRows;
      ButtonStyle := TIvColumn(Source).ButtonStyle;
      PickList := TIvColumn(Source).PickList;
      PopupMenu := TIvColumn(Source).PopupMenu;
    finally
      if Assigned(Collection) then Collection.EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

function TIvColumn.CreateTitle: TIvColumnTitle;
begin
  Result := TIvColumnTitle.Create(Self);
end;

function TIvColumn.DefaultAlignment: TAlignment;
begin
  if Assigned(Field) then
    Result := FField.Alignment
  else
    Result := taLeftJustify;
end;

function TIvColumn.DefaultColor: TColor;
var
  Grid: TIvCustomDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.Color
  else
    Result := clWindow;
end;

function TIvColumn.DefaultFont: TFont;
var
  Grid: TIvCustomDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.Font
  else
    Result := FFont;
end;

{$IFDEF IVIME}
function TIvColumn.DefaultImeMode: TImeMode;
var
  Grid: TIvCustomDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.ImeMode
  else
    Result := FImeMode;
end;

function TIvColumn.DefaultImeName: TImeName;
var
  Grid: TIvCustomDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.ImeName
  else
    Result := FImeName;
end;
{$ENDIF}

function TIvColumn.DefaultReadOnly: Boolean;
var
  Grid: TIvCustomDBGrid;
begin
  Grid := GetGrid;
  Result := (Assigned(Grid) and Grid.ReadOnly) or (Assigned(Field) and FField.ReadOnly);
end;

function TIvColumn.DefaultWidth: Integer;
var
  W: Integer;
  RestoreCanvas: Boolean;
  TM: TTextMetric;
begin
  if GetGrid = nil then
  begin
    Result := 64;
    Exit;
  end;
  with GetGrid do
  begin
    if Assigned(Field) then
    begin
      RestoreCanvas := not HandleAllocated;
      if RestoreCanvas then
        Canvas.Handle := GetDC(0);
      try
        Canvas.Font := Self.Font;
        GetTextMetrics(Canvas.Handle, TM);
        Result := Field.DisplayWidth * (Canvas.TextWidth('0') - TM.tmOverhang)
          + TM.tmOverhang + 4;
        if dgTitles in Options then
        begin
          Canvas.Font := Title.Font;
          W := Canvas.TextWidth(Title.Caption) + 4;
          if Result < W then
            Result := W;
        end;
      finally
        if RestoreCanvas then
        begin
          ReleaseDC(0,Canvas.Handle);
          Canvas.Handle := 0;
        end;
      end;
    end
    else
      Result := DefaultColWidth;
  end;
end;

procedure TIvColumn.FontChanged;
begin
  Include(FAssignedValues, cvFont);
  Title.RefreshDefaultFont;
  Changed(False);
end;

function TIvColumn.GetAlignment: TAlignment;
begin
  if cvAlignment in FAssignedValues then
    Result := FAlignment
  else
    Result := DefaultAlignment;
end;

function TIvColumn.GetColor: TColor;
begin
  if cvColor in FAssignedValues then
    Result := FColor
  else
    Result := DefaultColor;
end;

function TIvColumn.GetField: TField;
var
  Grid: TIvCustomDBGrid;
begin    { Returns Nil if FieldName can't be found in dataset }
  Grid := GetGrid;
  if (FField = nil) and (Length(FFieldName) > 0) and Assigned(Grid) and
    Assigned(Grid.DataLink.DataSet) then
  with Grid.Datalink.Dataset do
    if Active or (not DefaultFields) then
      SetField(FindField(FieldName));
  Result := FField;
end;

function TIvColumn.GetFont: TFont;
var
  Save: TNotifyEvent;
begin
  if not (cvFont in FAssignedValues) and (FFont.Handle <> DefaultFont.Handle) then
  begin
    Save := FFont.OnChange;
    FFont.OnChange := nil;
    FFont.Assign(DefaultFont);
    FFont.OnChange := Save;
  end;
  Result := FFont;
end;

function TIvColumn.GetGrid: TIvCustomDBGrid;
begin
  if Assigned(Collection) and (Collection is TIvDBGridColumns) then
    Result := TIvDBGridColumns(Collection).Grid
  else
    Result := nil;
end;

{$IFDEF IVWIDE}
function TIvColumn.GetDisplayName: string;
begin
  Result := FFieldName;
  if Result = '' then Result := inherited GetDisplayName;
end;
{$ENDIF}

{$IFDEF IVIME}
function TIvColumn.GetImeMode: TImeMode;
begin
  if cvImeMode in FAssignedValues then
    Result := FImeMode
  else
    Result := DefaultImeMode;
end;

function TIvColumn.GetImeName: TImeName;
begin
  if cvImeName in FAssignedValues then
    Result := FImeName
  else
    Result := DefaultImeName;
end;
{$ENDIF}

function TIvColumn.GetPickList: TStrings;
begin
  if FPickList = nil then
    FPickList := TStringList.Create;
  Result := FPickList;
end;

function TIvColumn.GetReadOnly: Boolean;
begin
  if cvReadOnly in FAssignedValues then
    Result := FReadOnly
  else
    Result := DefaultReadOnly;
end;

function TIvColumn.GetWidth: Integer;
begin
  if cvWidth in FAssignedValues then
    Result := FWidth
  else
    Result := DefaultWidth;
end;

function TIvColumn.IsAlignmentStored: Boolean;
begin
  Result := (cvAlignment in FAssignedValues) and (FAlignment <> DefaultAlignment);
end;

function TIvColumn.IsColorStored: Boolean;
begin
  Result := (cvColor in FAssignedValues) and (FColor <> DefaultColor);
end;

function TIvColumn.IsFontStored: Boolean;
begin
  Result := (cvFont in FAssignedValues);
end;

{$IFDEF IVIME}
function TIvColumn.IsImeModeStored: Boolean;
begin
  Result := (cvImeMode in FAssignedValues) and (FImeMode <> DefaultImeMode);
end;

function TIvColumn.IsImeNameStored: Boolean;
begin
  Result := (cvImeName in FAssignedValues) and (FImeName <> DefaultImeName);
end;
{$ENDIF}

function TIvColumn.IsReadOnlyStored: Boolean;
begin
  Result := (cvReadOnly in FAssignedValues) and (FReadOnly <> DefaultReadOnly);
end;

function TIvColumn.IsWidthStored: Boolean;
begin
  Result := (cvWidth in FAssignedValues) and (FWidth <> DefaultWidth);
end;

procedure TIvColumn.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if cvFont in FAssignedValues then Exit;
  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TIvColumn.RestoreDefaults;
var
  FontAssigned: Boolean;
begin
  FontAssigned := cvFont in FAssignedValues;
  FTitle.RestoreDefaults;
  FAssignedValues := [];
  RefreshDefaultFont;
  FPickList.Free;
  FPickList := nil;
  ButtonStyle := cbsAuto;
  Changed(FontAssigned);
end;

procedure TIvColumn.SetAlignment(Value: TAlignment);
begin
  if (cvAlignment in FAssignedValues) and (Value = FAlignment) then Exit;
  FAlignment := Value;
  Include(FAssignedValues, cvAlignment);
  Changed(False);
end;

procedure TIvColumn.SetButtonStyle(Value: TIvColumnButtonStyle);
begin
  if Value = FButtonStyle then Exit;
  FButtonStyle := Value;
  Changed(False);
end;

procedure TIvColumn.SetColor(Value: TColor);
begin
  if (cvColor in FAssignedValues) and (Value = FColor) then Exit;
  FColor := Value;
  Include(FAssignedValues, cvColor);
  Changed(False);
end;

procedure TIvColumn.SetField(Value: TField);
begin
  if FField = Value then Exit;
  FField := Value;
  if Assigned(Value) then
    FFieldName := Value.FieldName;
  Changed(False);
end;

procedure TIvColumn.SetFieldName(const Value: String);
var
  AField: TField;
  Grid: TIvCustomDBGrid;
begin
  AField := nil;
  Grid := GetGrid;
  if Assigned(Grid) and Assigned(Grid.DataLink.DataSet) and
    not (csLoading in Grid.ComponentState) and (Length(Value) > 0) then
      AField := Grid.DataLink.DataSet.FindField(Value); { no exceptions }
  FFieldName := Value;
  SetField(AField);
  Changed(False);
end;

procedure TIvColumn.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
  Include(FAssignedValues, cvFont);
  Changed(False);
end;

{$IFDEF IVIME}
procedure TIvColumn.SetImeMode(Value: TImeMode);
begin
  if (cvImeMode in FAssignedValues) or (Value <> DefaultImeMode) then
  begin
    FImeMode := Value;
    Include(FAssignedValues, cvImeMode);
  end;
  Changed(False);
end;

procedure TIvColumn.SetImeName(Value: TImeName);
begin
  if (cvImeName in FAssignedValues) or (Value <> DefaultImeName) then
  begin
    FImeName := Value;
    Include(FAssignedValues, cvImeName);
  end;
  Changed(False);
end;
{$ENDIF}

procedure TIvColumn.SetPickList(Value: TStrings);
begin
  if Value = nil then
  begin
    FPickList.Free;
    FPickList := nil;
    Exit;
  end;
  PickList.Assign(Value);
end;

procedure TIvColumn.SetPopupMenu(Value: TPopupMenu);
begin
  FPopupMenu := Value;
  if Value <> nil then Value.FreeNotification(GetGrid);
end;

procedure TIvColumn.SetReadOnly(Value: Boolean);
begin
  if (cvReadOnly in FAssignedValues) and (Value = FReadOnly) then Exit;
  FReadOnly := Value;
  Include(FAssignedValues, cvReadOnly);
  Changed(False);
end;

procedure TIvColumn.SetTitle(Value: TIvColumnTitle);
begin
  FTitle.Assign(Value);
end;

procedure TIvColumn.SetWidth(Value: Integer);
begin
  if (cvWidth in FAssignedValues) or (Value <> DefaultWidth) then
  begin
    FWidth := Value;
    Include(FAssignedValues, cvWidth);
  end;
  Changed(False);
end;

{ TPassthroughColumn }

type
  TPassthroughColumnTitle = class(TIvColumnTitle)
  private
    procedure SetCaption(const Value: string); override;
  end;

  TPassthroughColumn = class(TIvColumn)
  private
    procedure SetAlignment(Value: TAlignment); override;
    procedure SetField(Value: TField); override;
    procedure SetIndex(Value: Integer); override;
    procedure SetReadOnly(Value: Boolean); override;
    procedure SetWidth(Value: Integer); override;
  protected
    function CreateTitle: TIvColumnTitle; override;
  end;

{ TPassthroughColumnTitle }

procedure TPassthroughColumnTitle.SetCaption(const Value: string);
var
  Grid: TIvCustomDBGrid;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) and (Grid.Datalink.Active) and Assigned(FColumn.Field) then
    FColumn.Field.DisplayLabel := Value
  else
    inherited SetCaption(Value);
end;


{ TPassthroughColumn }

function TPassthroughColumn.CreateTitle: TIvColumnTitle;
begin
  Result := TPassthroughColumnTitle.Create(Self);
end;

procedure TPassthroughColumn.SetAlignment(Value: TAlignment);
var
  Grid: TIvCustomDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) and (Grid.Datalink.Active) and Assigned(Field) then
    Field.Alignment := Value
  else
    inherited SetAlignment(Value);
end;

procedure TPassthroughColumn.SetField(Value: TField);
begin
  inherited SetField(Value);
  if Value = nil then
    FFieldName := '';
  RestoreDefaults;
end;

procedure TPassthroughColumn.SetIndex(Value: Integer);
var
  Grid: TIvCustomDBGrid;
  Fld: TField;
begin
  Grid := GetGrid;
  if Assigned(Grid) and Grid.Datalink.Active then
  begin
    Fld := Grid.Datalink.Fields[Value];
    if Assigned(Fld) then
      Field.Index := Fld.Index;
  end;
  inherited SetIndex(Value);
end;

procedure TPassthroughColumn.SetReadOnly(Value: Boolean);
var
  Grid: TIvCustomDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) and Grid.Datalink.Active and Assigned(Field) then
    Field.ReadOnly := Value
  else
    inherited SetReadOnly(Value);
end;

procedure TPassthroughColumn.SetWidth(Value: Integer);
var
  Grid: TIvCustomDBGrid;
  TM: TTextMetric;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
  begin
    if Grid.HandleAllocated and Assigned(Field) and Grid.FUpdateFields then
    with Grid do
    begin
      Canvas.Font := Self.Font;
      GetTextMetrics(Canvas.Handle, TM);
      Field.DisplayWidth := (Value + (TM.tmAveCharWidth div 2) - TM.tmOverhang - 3)
        div TM.tmAveCharWidth;
    end;
    if (not Grid.FLayoutFromDataset) or (cvWidth in FAssignedValues) then
      inherited SetWidth(Value);
  end
  else
    inherited SetWidth(Value);
end;


{ TIvDBGridColumns }

constructor TIvDBGridColumns.Create(Grid: TIvCustomDBGrid; ColumnClass: TIvColumnClass);
begin
  inherited Create(ColumnClass);
  FGrid := Grid;
end;

function TIvDBGridColumns.Add: TIvColumn;
begin
  Result := TIvColumn(inherited Add);
end;

function TIvDBGridColumns.GeTIvColumn(Index: Integer): TIvColumn;
begin
  Result := TIvColumn(inherited Items[Index]);
end;

{$IFDEF IVWIDE}
function TIvDBGridColumns.GetOwner: TPersistent;
begin
  Result := FGrid;
end;
{$ENDIF}

function TIvDBGridColumns.GetState: TIvDBGridColumnsState;
begin
  Result := TIvDBGridColumnsState((Count > 0) and not (Items[0] is TPassthroughColumn));
end;

procedure TIvDBGridColumns.LoadFromFile(const Filename: string);
var
  S: TFileStream;
begin
  S := TFileStream.Create(Filename, fmOpenRead);
  try
    LoadFromStream(S);
  finally
    S.Free;
  end;
end;

type
  TIvColumnsWrapper = class(TComponent)
  private
    FColumns: TIvDBGridColumns;
  published
    property Columns: TIvDBGridColumns read FColumns write FColumns;
  end;

procedure TIvDBGridColumns.LoadFromStream(S: TStream);
var
  Wrapper: TIvColumnsWrapper;
begin
  Wrapper := TIvColumnsWrapper.Create(nil);
  try
    Wrapper.Columns := FGrid.CreateColumns;
    S.ReadComponent(Wrapper);
    Assign(Wrapper.Columns);
  finally
    Wrapper.Columns.Free;
    Wrapper.Free;
  end;
end;

procedure TIvDBGridColumns.RestoreDefaults;
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to Count-1 do
      Items[I].RestoreDefaults;
  finally
    EndUpdate;
  end;
end;

procedure TIvDBGridColumns.RebuildColumns;
var
  I: Integer;
begin
  if Assigned(FGrid) and Assigned(FGrid.DataSource) and
    Assigned(FGrid.Datasource.Dataset) then
  begin
    FGrid.BeginLayout;
    try
      Clear;
      with FGrid.Datasource.Dataset do
        for I := 0 to FieldCount-1 do
          Add.FieldName := Fields[I].FieldName
    finally
      FGrid.EndLayout;
    end
  end
  else
    Clear;
end;

procedure TIvDBGridColumns.SaveToFile(const Filename: string);
var
  S: TStream;
begin
  S := TFileStream.Create(Filename, fmCreate);
  try
    SaveToStream(S);
  finally
    S.Free;
  end;
end;

procedure TIvDBGridColumns.SaveToStream(S: TStream);
var
  Wrapper: TIvColumnsWrapper;
begin
  Wrapper := TIvColumnsWrapper.Create(nil);
  try
    Wrapper.Columns := Self;
    S.WriteComponent(Wrapper);
  finally
    Wrapper.Free;
  end;
end;

procedure TIvDBGridColumns.SeTIvColumn(Index: Integer; Value: TIvColumn);
begin
  Items[Index].Assign(Value);
end;

procedure TIvDBGridColumns.SetState(NewState: TIvDBGridColumnsState);
begin
  if NewState = State then Exit;
  if NewState = csDefault then
    Clear
  else
    RebuildColumns;
end;

procedure TIvDBGridColumns.Update(Item: TCollectionItem);
var
  Raw: Integer;
begin
  if (FGrid = nil) or (csLoading in FGrid.ComponentState) then Exit;
  if Item = nil then
  begin
    FGrid.LayoutChanged;
  end
  else
  begin
    Raw := FGrid.DataToRawColumn(Item.Index);
    FGrid.InvalidateCol(Raw);
    FGrid.ColWidths[Raw] := TIvColumn(Item).Width;
  end;
end;

{ TIvBookmarkList }

constructor TIvBookmarkList.Create(AGrid: TIvCustomDBGrid);
begin
  inherited Create;
  FList := TStringList.Create;
  FList.OnChange := StringsChanged;
  FGrid := AGrid;
end;

destructor TIvBookmarkList.Destroy;
begin
  Clear;
  FList.Free;
  inherited Destroy;
end;

procedure TIvBookmarkList.Clear;
begin
  if FList.Count = 0 then Exit;
  FList.Clear;
  FGrid.Invalidate;
end;

function TIvBookmarkList.Compare(const Item1, Item2: TBookmarkStr): Integer;
{$IFNDEF IVWIDE}
  const Filter: array[Boolean, Boolean] of ShortInt = ((2,-1),(1,0));
{$ENDIF}
begin
{$IFDEF IVWIDE}
  with FGrid.Datalink.Datasource.Dataset do
    Result := CompareBookmarks(TBookmark(Item1), TBookmark(Item2));
{$ELSE}
  Result := Filter[Length(Item1) = 0, Length(Item2) = 0];
  if Result < 2 then
    Exit;
  with FGrid.Datalink.Datasource.Dataset do
    DB.Check(DbiCompareBookmarks(Handle, Pointer(Item1), Pointer(Item2), Result));
  if Result = 2 then
    Result := 0;
{$ENDIF}
end;

function TIvBookmarkList.CurrentRow: TBookmarkStr;
begin
  if not FLinkActive then RaiseGridError(sDataSetClosed);
  Result := FGrid.Datalink.Datasource.Dataset.Bookmark;
end;

function TIvBookmarkList.GetCurrentRowSelected: Boolean;
var
  Index: Integer;
begin
  Result := Find(CurrentRow, Index);
end;

function TIvBookmarkList.Find(const Item: TBookmarkStr; var Index: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  if (Item = FCache) and (FCacheIndex >= 0) then
  begin
    Index := FCacheIndex;
    Result := FCacheFind;
    Exit;
  end;
  Result := False;
  L := 0;
  H := FList.Count - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := Compare(FList[I], Item);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := L;
  FCache := Item;
  FCacheIndex := Index;
  FCacheFind := Result;
end;

function TIvBookmarkList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TIvBookmarkList.GetItem(Index: Integer): TBookmarkStr;
begin
  Result := FList[Index];
end;

function TIvBookmarkList.IndexOf(const Item: TBookmarkStr): Integer;
begin
  if not Find(Item, Result) then
    Result := -1;
end;

procedure TIvBookmarkList.LinkActive(Value: Boolean);
begin
  Clear;
  FLinkActive := Value;
end;

procedure TIvBookmarkList.Delete;
var
  I: Integer;
begin
  with FGrid.Datalink.Datasource.Dataset do
  begin
    DisableControls;
    try
      for I := FList.Count-1 downto 0 do
      begin
        Bookmark := FList[I];
        Delete;
        FList.Delete(I);
      end;
    finally
      EnableControls;
    end;
  end;
end;

function TIvBookmarkList.Refresh: Boolean;
var
  I: Integer;
begin
  Result := False;
  with FGrid.DataLink.Datasource.Dataset do
  try
    CheckBrowseMode;
    for I := FList.Count - 1 downto 0 do
{$IFDEF IVWIDE}
      if not BookmarkValid(TBookmark(FList[I])) then
{$ELSE}
      if DBISetToBookmark(Handle, Pointer(FList[I])) <> 0 then
{$ENDIF}
      begin
        Result := True;
        FList.Delete(I);
      end;
  finally
    UpdateCursorPos;
    if Result then FGrid.Invalidate;
  end;
end;

procedure TIvBookmarkList.SetCurrentRowSelected(Value: Boolean);
var
  Index: Integer;
  Current: TBookmarkStr;
begin
  Current := CurrentRow;
  if (Length(Current) = 0) or (Find(Current, Index) = Value) then Exit;
  if Value then
    FList.Insert(Index, Current)
  else
    FList.Delete(Index);
  FGrid.InvalidateRow(FGrid.Row);
end;

procedure TIvBookmarkList.StringsChanged(Sender: TObject);
begin
  FCache := '';
  FCacheIndex := -1;
end;


{ TIvCustomDBGrid }

var
  DrawBitmap: TBitmap;
  UserCount: Integer;

procedure UsesBitmap;
begin
  if UserCount = 0 then
    DrawBitmap := TBitmap.Create;
  Inc(UserCount);
end;

procedure ReleaseBitmap;
begin
  Dec(UserCount);
  if UserCount = 0 then DrawBitmap.Free;
end;

function Max(X, Y: Integer): Integer;
begin
  Result := Y;
  if X > Y then Result := X;
end;

procedure WriteText(
  ACanvas: TCanvas;
  ARect: TRect;
  DX, DY: Integer;
  const Text: String;
  Alignment: TAlignment;
  bidi: Boolean);
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX );
var
  B, R: TRect;
  I, Left, flags: Integer;
begin
  I := ColorToRGB(ACanvas.Brush.Color);
  if GetNearestColor(ACanvas.Handle, I) = I then
  begin                       { Use ExtTextOut for solid colors }
    case Alignment of
      taLeftJustify:
        if bidi then
          Left := ARect.Right - ACanvas.TextWidth(Text) - 3
        else
          Left := ARect.Left + DX;

      taRightJustify:
        if bidi then
          Left := ARect.Left + DX
        else
          Left := ARect.Right - ACanvas.TextWidth(Text) - 3;
    else
      { taCenter }
      Left := ARect.Left + (ARect.Right - ARect.Left) shr 1
        - (ACanvas.TextWidth(Text) shr 1);
    end;

    flags := ETO_OPAQUE or ETO_CLIPPED;
{$IFDEF IVPRO32}
    if bidi then
      flags := flags or ETO_RTLREADING;
{$ENDIF}
    ExtTextOut(
      ACanvas.Handle,
      Left,
      ARect.Top + DY,
      flags,
      @ARect,
      PChar(Text),
      Length(Text),
      nil);
  end
  else
  begin
    { Use FillRect and Drawtext for dithered colors }

{$IFDEF IVWIDE}
    DrawBitmap.Canvas.Lock;
{$ENDIF}
    try
      with DrawBitmap, ARect do { Use offscreen bitmap to eliminate flicker and }
      begin                     { brush origin tics in painting / scrolling.    }
        Width := Max(Width, Right - Left);
        Height := Max(Height, Bottom - Top);
        R := Rect(DX, DY, Right - Left - 1, Bottom - Top - 1);
        B := Rect(0, 0, Right - Left, Bottom - Top);
      end;
      with DrawBitmap.Canvas do
      begin
        Font := ACanvas.Font;
        Font.Color := ACanvas.Font.Color;
        Brush := ACanvas.Brush;
        Brush.Style := bsSolid;
        FillRect(B);
        SetBkMode(Handle, TRANSPARENT);

        flags := AlignFlags[Alignment];
{$IFDEF IVPRO32}
        if bidi then
          flags := flags or DT_RIGHT or DT_RTLREADING;
{$ENDIF}
        DrawText(Handle, PChar(Text), Length(Text), R, flags);
      end;
      ACanvas.CopyRect(ARect, DrawBitmap.Canvas, B);
    finally
{$IFDEF IVWIDE}
      DrawBitmap.Canvas.Unlock;
{$ENDIF}
    end;
  end;
end;

constructor TIvCustomDBGrid.Create(AOwner: TComponent);
var
  Bmp: TBitmap;
begin
  inherited Create(AOwner);
  inherited DefaultDrawing := False;
  FAcquireFocus := True;
  Bmp := TBitmap.Create;
  try
    Bmp.LoadFromResourceName(HInstance, bmArrow);
    FIndicators := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmEdit);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmInsert);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmMultiDot);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmMultiArrow);
    FIndicators.AddMasked(Bmp, clWhite);
  finally
    Bmp.Free;
  end;
  FTitleOffset := 1;
  FIndicatorOffset := 1;
  FUpdateFields := True;
  FOptions := [dgEditing, dgTitles, dgIndicator, dgColumnResize,
    dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit];
  DesignOptionsBoost := [goColSizing];
  VirtualView := True;
  UsesBitmap;
  ScrollBars := ssHorizontal;
  inherited Options := [goFixedHorzLine, goFixedVertLine, goHorzLine,
    goVertLine, goColSizing, goColMoving, goTabs, goEditing];
  FColumns := CreateColumns;
  inherited RowCount := 2;
  inherited ColCount := 2;
  FDataLink := TIvGridDataLink.Create(Self);
  Color := clWindow;
  ParentColor := False;
  FTitleFont := TFont.Create;
  FTitleFont.OnChange := TitleFontChanged;
  FSaveCellExtents := False;
  FUserChange := True;
  FDefaultDrawing := True;
  FUpdatingEditor := False;
  FBookmarks := TIvBookmarkList.Create(Self);
  HideEditor;
end;

destructor TIvCustomDBGrid.Destroy;
begin
  FColumns.Free;
  FColumns := nil;
  FDataLink.Free;
  FDataLink := nil;
  FIndicators.Free;
  FTitleFont.Free;
  FTitleFont := nil;
  FBookmarks.Free;
  FBookmarks := nil;
  inherited Destroy;
  ReleaseBitmap;
end;

function TIvCustomDBGrid.AcquireFocus: Boolean;
begin
  Result := True;
  if FAcquireFocus and CanFocus and not (csDesigning in ComponentState) then
  begin
    SetFocus;
    Result := Focused or (InplaceEditor <> nil) and InplaceEditor.Focused;
  end;
end;

function TIvCustomDBGrid.RawToDataColumn(ACol: Integer): Integer;
begin
  Result := ACol - FIndicatorOffset;
end;

function TIvCustomDBGrid.DataToRawColumn(ACol: Integer): Integer;
begin
  Result := ACol + FIndicatorOffset;
end;

function TIvCustomDBGrid.AcquireLayoutLock: Boolean;
begin
  Result := (FUpdateLock = 0) and (FLayoutLock = 0);
  if Result then BeginLayout;
end;

procedure TIvCustomDBGrid.BeginLayout;
begin
  BeginUpdate;
  if FLayoutLock = 0 then Columns.BeginUpdate;
  Inc(FLayoutLock);
end;

procedure TIvCustomDBGrid.BeginUpdate;
begin
  Inc(FUpdateLock);
end;

procedure TIvCustomDBGrid.CancelLayout;
begin
  if FLayoutLock > 0 then
  begin
    if FLayoutLock = 1 then
      Columns.EndUpdate;
    Dec(FLayoutLock);
    EndUpdate;
  end;
end;

function TIvCustomDBGrid.CanEditAcceptKey(Key: Char): Boolean;
begin
  with Columns[SelectedIndex] do
    Result := FDatalink.Active and Assigned(Field) and Field.IsValidChar(Key);
end;

function TIvCustomDBGrid.CanEditModify: Boolean;
begin
  Result := False;
  if not ReadOnly and FDatalink.Active and not FDatalink.Readonly then
  with Columns[SelectedIndex] do
    if (not ReadOnly) and Assigned(Field) and Field.CanModify
      and (not
{$IFDEF IVWIDE}
      Field.IsBlob
{$ELSE}
      (Field is TBlobField)
{$ENDIF}
      or Assigned(Field.OnSetText)) then
    begin
      FDatalink.Edit;
      Result := FDatalink.Editing;
      if Result then FDatalink.Modified;
    end;
end;

function TIvCustomDBGrid.CanEditShow: Boolean;
begin
  Result := (LayoutLock = 0) and inherited CanEditShow;
end;

procedure TIvCustomDBGrid.CellClick(Column: TIvColumn);
begin
  if Assigned(FOnCellClick) then
    FOnCellClick(Column);
end;

procedure TIvCustomDBGrid.ColEnter;
begin
{$IFDEF IVIME}
  UpdateIme;
{$ENDIF}
  if Assigned(FOnColEnter) then
    FOnColEnter(Self);
end;

procedure TIvCustomDBGrid.ColExit;
begin
  if Assigned(FOnColExit) then
    FOnColExit(Self);
end;

procedure TIvCustomDBGrid.ColumnMoved(FromIndex, ToIndex: Longint);
begin
  FromIndex := RawToDataColumn(FromIndex);
  ToIndex := RawToDataColumn(ToIndex);
  Columns[FromIndex].Index := ToIndex;
  if Assigned(FOnColumnMoved) then
    FOnColumnMoved(Self, FromIndex, ToIndex);
end;

procedure TIvCustomDBGrid.ColWidthsChanged;
var
  I: Integer;
begin
  inherited ColWidthsChanged;
  if (FDatalink.Active or (FColumns.State = csCustomized)) and
    AcquireLayoutLock then
  try
    for I := FIndicatorOffset to ColCount - 1 do
      FColumns[I - FIndicatorOffset].Width := ColWidths[I];
  finally
    EndLayout;
  end;
end;

function TIvCustomDBGrid.CreateColumns: TIvDBGridColumns;
begin
  Result := TIvDBGridColumns.Create(Self, TIvColumn);
end;

function TIvCustomDBGrid.CreateEditor: TIvInplaceEdit;
begin
  Result := TIvDBGridInplaceEdit.Create(Self);
end;

procedure TIvCustomDBGrid.CreateWnd;
begin
  BeginUpdate;   { prevent updates in WMSize message that follows WMCreate }
  try
    inherited CreateWnd;
  finally
    EndUpdate;
  end;
  UpdateRowCount;
  UpdateActive;
  UpdateScrollBar;
{$IFDEF IVIME}
  FOriginalImeName := ImeName;
  FOriginalImeMode := ImeMode;
{$ENDIF}
end;

procedure TIvCustomDBGrid.DataChanged;
begin
  if not HandleAllocated then Exit;
  UpdateRowCount;
  UpdateScrollBar;
  UpdateActive;
  InvalidateEditor;
  ValidateRect(Handle, nil);
  Invalidate;
end;

procedure TIvCustomDBGrid.DefaultHandler(var Msg);
var
  P: TPopupMenu;
  Cell: TIvGridCoord;
begin
  inherited DefaultHandler(Msg);
  if TMessage(Msg).Msg = wm_RButtonUp then
    with TWMRButtonUp(Msg) do
    begin
      Cell := MouseCoord(XPos, YPos);
      if (Cell.X < FIndicatorOffset) or (Cell.Y < 0) then Exit;
      P := Columns[RawToDataColumn(Cell.X)].PopupMenu;
      if (P <> nil) and P.AutoPopup then
      begin
        SendCancelMode(nil);
        P.PopupComponent := Self;
        with ClientToScreen(SmallPointToPoint(Pos)) do
          P.Popup(X, Y);
        Result := 1;
      end;
    end;
end;

procedure TIvCustomDBGrid.DeferLayout;
var
  M: TMsg;
begin
  if HandleAllocated and
    not PeekMessage(M, Handle, cm_DeferLayout, cm_DeferLayout, pm_NoRemove) then
    PostMessage(Handle, cm_DeferLayout, 0, 0);
  CancelLayout;
end;

procedure TIvCustomDBGrid.DefineFieldMap;
var
  I: Integer;
begin
  if FColumns.State = csCustomized then
  begin   { Build the column/field map from the column attributes }
    DataLink.SparseMap := True;
    for I := 0 to FColumns.Count-1 do
      FDataLink.AddMapping(FColumns[I].FieldName);
  end
  else   { Build the column/field map from the field list order }
  begin
    FDataLink.SparseMap := False;
    with Datalink.Dataset do
      for I := 0 to FieldCount - 1 do
        with Fields[I] do if Visible then Datalink.AddMapping(FieldName);
  end;
end;

procedure TIvCustomDBGrid.DefaultDrawDataCell(
  const Rect: TRect;
  Field: TField;
  State: TIvGridDrawState);
var
  Alignment: TAlignment;
  Value: string;
begin
  Alignment := taLeftJustify;
  Value := '';
  if Assigned(Field) then
  begin
    Alignment := Field.Alignment;
    Value := Field.DisplayText;
  end;
{$IFDEF IVPRO32}
  if IvIsLocaleBidirectional(ColLocale[Field.Index]) then //if IvIsLocaleBidirectional(Locale) then
    WriteText(Canvas, Rect, 2, 2, Value, Alignment, True)
  else
{$ENDIF}
    WriteText(Canvas, Rect, 2, 2, Value, Alignment, False);
end;

procedure TIvCustomDBGrid.DefaultDrawColumnCell(
  const Rect: TRect;
  DataCol: Integer;
  Column: TIvColumn;
  State: TIvGridDrawState);
var
  Value: string;
begin
  Value := '';
  if Assigned(Column.Field) then
    Value := Column.Field.DisplayText;
{$IFDEF IVPRO32}
  if IvIsLocaleBidirectional(ColLocale[DataCol]) then //if IvIsLocaleBidirectional(Locale) then
    WriteText(Canvas, Rect, 2, 2, Value, Column.Alignment, True)
  else
{$ENDIF}
    WriteText(Canvas, Rect, 2, 2, Value, Column.Alignment, False);
end;

{$IFDEF IVWIDE}
procedure TIvCustomDBGrid.ReadColumns(Reader: TReader);
begin
  Columns.Clear;
  Reader.ReadValue;
  Reader.ReadCollection(Columns);
end;

procedure TIvCustomDBGrid.WriteColumns(Writer: TWriter);
begin
  Writer.WriteCollection(Columns);
end;

procedure TIvCustomDBGrid.DefineProperties(Filer: TFiler);
begin
  Filer.DefineProperty('Columns', ReadColumns, WriteColumns,
    ((Columns.State = csCustomized) and (Filer.Ancestor = nil)) or
    ((Filer.Ancestor <> nil) and
     ((Columns.State <> TIvCustomDBGrid(Filer.Ancestor).Columns.State) or
      (not CollectionsEqual(Columns, TIvCustomDBGrid(Filer.Ancestor).Columns)) )));
end;
{$ENDIF}

procedure TIvCustomDBGrid.DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TIvGridDrawState);

  function RowIsMultiSelected: Boolean;
  var
    Index: Integer;
  begin
    Result := (dgMultiSelect in Options) and Datalink.Active and
      FBookmarks.Find(Datalink.Datasource.Dataset.Bookmark, Index);
  end;

var
  OldActive: Integer;
  Indicator: Integer;
  Highlight: Boolean;
  Value: string;
  DrawColumn: TIvColumn;
  FrameOffs: Byte;
  MultiSelected: Boolean;
begin
  if csLoading in ComponentState then
  begin
    Canvas.Brush.Color := Color;
    Canvas.FillRect(ARect);
    Exit;
  end;

  Dec(ARow, FTitleOffset);
  Dec(ACol, FIndicatorOffset);

  if (gdFixed in AState) and ([dgRowLines, dgColLines] * Options =
    [dgRowLines, dgColLines]) then
  begin
    InflateRect(ARect, -1, -1);
    FrameOffs := 1;
  end
  else
    FrameOffs := 2;

  if (gdFixed in AState) and (ACol < 0) then
  begin
    Canvas.Brush.Color := FixedColor;
    Canvas.FillRect(ARect);
    if Assigned(DataLink) and DataLink.Active  then
    begin
      MultiSelected := False;
      if ARow >= 0 then
      begin
        OldActive := FDataLink.ActiveRecord;
        try
          FDatalink.ActiveRecord := ARow;
          MultiSelected := RowIsMultiselected;
        finally
          FDatalink.ActiveRecord := OldActive;
        end;
      end;
      if (ARow = FDataLink.ActiveRecord) or MultiSelected then
      begin
        Indicator := 0;
        if FDataLink.DataSet <> nil then
          case FDataLink.DataSet.State of
            dsEdit: Indicator := 1;
            dsInsert: Indicator := 2;
            dsBrowse:
              if MultiSelected then
                if (ARow <> FDatalink.ActiveRecord) then
                  Indicator := 3
                else
                  Indicator := 4;  // multiselected and current row
          end;
        FIndicators.BkColor := FixedColor;
        FIndicators.Draw(Canvas, ARect.Right - FIndicators.Width - FrameOffs,
          (ARect.Top + ARect.Bottom - FIndicators.Height) shr 1, Indicator);
        if ARow = FDatalink.ActiveRecord then
          FSelRow := ARow + FTitleOffset;
      end;
    end;
  end
  else with Canvas do
  begin
    DrawColumn := Columns[ACol];
    if gdFixed in AState then
    begin
      Font := DrawColumn.Title.Font;
      Brush.Color := DrawColumn.Title.Color;
    end
    else
    begin
      Font := DrawColumn.Font;
      Brush.Color := DrawColumn.Color;
    end;
    if ARow < 0 then with DrawColumn.Title do
    begin
{$IFDEF IVPRO32}
      if IvIsLocaleBidirectional(Locale) then //if IvIsLocaleBidirectional(ColLocale[ACol]) then
        WriteText(Canvas, ARect, FrameOffs, FrameOffs, Caption, Alignment, True)
      else
{$ENDIF}
        WriteText(Canvas, ARect, FrameOffs, FrameOffs, Caption, Alignment, False)
    end
    else if (FDataLink = nil) or not FDataLink.Active then
      FillRect(ARect)
    else
    begin
      Value := '';
      OldActive := FDataLink.ActiveRecord;
      try
        FDataLink.ActiveRecord := ARow;
        if Assigned(DrawColumn.Field) then
          Value := DrawColumn.Field.DisplayText;
        Highlight := HighlightCell(ACol, ARow, Value, AState);
        if Highlight then
        begin
          Brush.Color := clHighlight;
          Font.Color := clHighlightText;
        end;
        if FDefaultDrawing then
        begin
{$IFDEF IVPRO32}
          if IvIsLocaleBidirectional(ColLocale[ACol]) then
            WriteText(Canvas, ARect, 2, 2, Value, DrawColumn.Alignment, True)
          else
{$ENDIF}
            WriteText(Canvas, ARect, 2, 2, Value, DrawColumn.Alignment, False);
        end;
        if Columns.State = csDefault then
          DrawDataCell(ARect, DrawColumn.Field, AState);
        DrawColumnCell(ARect, ACol, DrawColumn, AState);
      finally
        FDataLink.ActiveRecord := OldActive;
      end;
      if FDefaultDrawing and (gdSelected in AState)
        and ((dgAlwaysShowSelection in Options) or Focused)
        and not (csDesigning in ComponentState)
        and not (dgRowSelect in Options)
        and (UpdateLock = 0)
        and (ValidParentForm(Self).ActiveControl = Self) then
        Windows.DrawFocusRect(Handle, ARect);
    end;
  end;
  if (gdFixed in AState) and ([dgRowLines, dgColLines] * Options =
    [dgRowLines, dgColLines]) then
  begin
    InflateRect(ARect, 1, 1);
    DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
    DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_TOPLEFT);
  end;
end;

procedure TIvCustomDBGrid.DrawDataCell(const Rect: TRect; Field: TField;
  State: TIvGridDrawState);
begin
  if Assigned(FOnDrawDataCell) then FOnDrawDataCell(Self, Rect, Field, State);
end;

procedure TIvCustomDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TIvColumn; State: TIvGridDrawState);
begin
  if Assigned(OnDrawColumnCell) then
    OnDrawColumnCell(Self, Rect, DataCol, Column, State);
end;

procedure TIvCustomDBGrid.EditButtonClick;
begin
  if Assigned(FOnEditButtonClick) then FOnEditButtonClick(Self);
end;

procedure TIvCustomDBGrid.EditingChanged;
begin
  if dgIndicator in Options then InvalidateCell(0, FSelRow);
end;

procedure TIvCustomDBGrid.EndLayout;
begin
  if FLayoutLock > 0 then
  begin
    try
      try
        if FLayoutLock = 1 then
          InternalLayout;
      finally
        if FLayoutLock = 1 then
          FColumns.EndUpdate;
      end;
    finally
      Dec(FLayoutLock);
      EndUpdate;
    end;
  end;
end;

procedure TIvCustomDBGrid.EndUpdate;
begin
  if FUpdateLock > 0 then
    Dec(FUpdateLock);
end;

function TIvCustomDBGrid.GetColField(DataCol: Integer): TField;
begin
  Result := nil;
  if (DataCol >= 0) and FDatalink.Active and (DataCol < Columns.Count) then
    Result := Columns[DataCol].Field;
end;

function TIvCustomDBGrid.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TIvCustomDBGrid.GetEditLimit: Integer;
begin
  Result := 0;
  if Assigned(SelectedField) and (SelectedField.DataType = ftString) then
    Result := SelectedField.Size;
end;

function TIvCustomDBGrid.GetEditMask(ACol, ARow: Longint): string;
begin
  Result := '';
  if FDatalink.Active then
  with Columns[RawToDataColumn(ACol)] do
    if Assigned(Field) then
      Result := Field.EditMask;
end;

function TIvCustomDBGrid.GetEditText(ACol, ARow: Longint): string;
begin
  Result := '';
  if FDatalink.Active then
  with Columns[RawToDataColumn(ACol)] do
    if Assigned(Field) then
      Result := Field.Text;
  FEditText := Result;
end;

function TIvCustomDBGrid.GetFieldCount: Integer;
begin
  Result := FDatalink.FieldCount;
end;

function TIvCustomDBGrid.GetFields(FieldIndex: Integer): TField;
begin
  Result := FDatalink.Fields[FieldIndex];
end;

function TIvCustomDBGrid.GetFieldValue(ACol: Integer): string;
var
  Field: TField;
begin
  Result := '';
  Field := GetColField(ACol);
  if Field <> nil then Result := Field.DisplayText;
end;

function TIvCustomDBGrid.GetSelectedField: TField;
var
  Index: Integer;
begin
  Index := SelectedIndex;
  if Index <> -1 then
    Result := Columns[Index].Field
  else
    Result := nil;
end;

function TIvCustomDBGrid.GetSelectedIndex: Integer;
begin
  Result := RawToDataColumn(Col);
end;

function TIvCustomDBGrid.HighlightCell(DataCol, DataRow: Integer;
  const Value: string; AState: TIvGridDrawState): Boolean;
var
  Index: Integer;
begin
  Result := False;
  if (dgMultiSelect in Options) and Datalink.Active then
    Result := FBookmarks.Find(Datalink.Datasource.Dataset.Bookmark, Index);
  if not Result then
    Result := (gdSelected in AState)
      and ((dgAlwaysShowSelection in Options) or Focused)
        { updatelock eliminates flicker when tabbing between rows }
      and ((UpdateLock = 0) or (dgRowSelect in Options));
end;

procedure TIvCustomDBGrid.KeyDown(var Key: Word; Shift: TShiftState);
var
  KeyDownEvent: TKeyEvent;

  procedure ClearSelection;
  begin
    if (dgMultiSelect in Options) then
    begin
      FBookmarks.Clear;
      FSelecting := False;
    end;
  end;

  procedure DoSelection(Select: Boolean; Direction: Integer);
  var
    AddAfter: Boolean;
  begin
    AddAfter := False;
    BeginUpdate;
    try
      if (dgMultiSelect in Options) and FDatalink.Active then
        if Select and (ssShift in Shift) then
        begin
          if not FSelecting then
          begin
            FSelectionAnchor := FBookmarks.CurrentRow;
            FBookmarks.CurrentRowSelected := True;
            FSelecting := True;
            AddAfter := True;
          end
          else
          with FBookmarks do
          begin
            AddAfter := Compare(CurrentRow, FSelectionAnchor) <> -Direction;
            if not AddAfter then
              CurrentRowSelected := False;
          end
        end
        else
          ClearSelection;
      FDatalink.Dataset.MoveBy(Direction);
      if AddAfter then FBookmarks.CurrentRowSelected := True;
    finally
      EndUpdate;
    end;
  end;

  procedure NextRow(Select: Boolean);
  begin
    with FDatalink.Dataset do
    begin
      if (State = dsInsert) and not Modified and not FDatalink.FModified then
        if EOF then Exit else Cancel
      else
        DoSelection(Select, 1);
      if EOF and CanModify and (not ReadOnly) and (dgEditing in Options) then
        Append;
    end;
  end;

  procedure PriorRow(Select: Boolean);
  begin
    with FDatalink.Dataset do
      if (State = dsInsert) and not Modified and EOF and
        not FDatalink.FModified then
        Cancel
      else
        DoSelection(Select, -1);
  end;

  procedure Tab(GoForward: Boolean);
  var
    ACol, Original: Integer;
  begin
    ACol := Col;
    Original := ACol;
    BeginUpdate;    { Prevent highlight flicker on tab to next/prior row }
    try
      while True do
      begin
        if GoForward then
          Inc(ACol) else
          Dec(ACol);
        if ACol >= ColCount then
        begin
          NextRow(False);
          ACol := FIndicatorOffset;
        end
        else if ACol < FIndicatorOffset then
        begin
          PriorRow(False);
          ACol := ColCount;
        end;
        if ACol = Original then Exit;
        if TabStops[ACol] then
        begin
          MoveCol(ACol);
          Exit;
        end;
      end;
    finally
      EndUpdate;
    end;
  end;

  function DeletePrompt: Boolean;
  var
    Msg: String;
  begin
    if (FBookmarks.Count > 1) then
      Msg := 'Delete all selected records?'
    else
      Msg := 'Delete record?';
    Result :=
      not (dgConfirmDelete in Options) or
      (MessageDlg(Msg, mtConfirmation, mbOKCancel, 0) <> idCancel);
  end;

const
  RowMovementKeys = [VK_UP, VK_PRIOR, VK_DOWN, VK_NEXT, VK_HOME, VK_END];

begin
  KeyDownEvent := OnKeyDown;
  if Assigned(KeyDownEvent) then KeyDownEvent(Self, Key, Shift);
  if not FDatalink.Active or not CanGridAcceptKey(Key, Shift) then Exit;
  with FDatalink.DataSet do
    if ssCtrl in Shift then
    begin
      if (Key in RowMovementKeys) then ClearSelection;
      case Key of
        VK_UP, VK_PRIOR: MoveBy(-FDatalink.ActiveRecord);
        VK_DOWN, VK_NEXT: MoveBy(FDatalink.BufferCount - FDatalink.ActiveRecord - 1);
        VK_LEFT: MoveCol(FIndicatorOffset);
        VK_RIGHT: MoveCol(ColCount - 1);
        VK_HOME: First;
        VK_END: Last;
        VK_DELETE:
          if (not ReadOnly) and
{$IFDEF IVWIDE}
            not IsEmpty and
{$ENDIF}
            CanModify and DeletePrompt then
          begin
            if FBookmarks.Count > 0 then
              FBookmarks.Delete
            else
              Delete;
          end;
      end
    end
    else
      case Key of
        VK_UP: PriorRow(True);
        VK_DOWN: NextRow(True);
        VK_LEFT:
{$IFDEF IVPRO32}
          if IvIsLocaleBidirectional(Self.Locale) then
          begin
            if dgRowSelect in Options then
              NextRow(False)
            else
              MoveCol(Col + 1);
          end
          else
{$ENDIF}
          begin
            if dgRowSelect in Options then
              PriorRow(False)
            else
              MoveCol(Col - 1);
          end;

        VK_RIGHT:
{$IFDEF IVPRO32}
          if IvIsLocaleBidirectional(Self.Locale) then
          begin
            if dgRowSelect in Options then
              PriorRow(False)
            else
              MoveCol(Col - 1);
          end
          else
{$ENDIF}
          begin
            if dgRowSelect in Options then
              NextRow(False)
            else
              MoveCol(Col + 1);
          end;

        VK_HOME:
          if (ColCount = FIndicatorOffset+1)
            or (dgRowSelect in Options) then
          begin
            ClearSelection;
            First;
          end
          else
            MoveCol(FIndicatorOffset);
        VK_END:
          if (ColCount = FIndicatorOffset+1)
            or (dgRowSelect in Options) then
          begin
            ClearSelection;
            Last;
          end
          else
            MoveCol(ColCount - 1);
        VK_NEXT:
          begin
            ClearSelection;
            MoveBy(VisibleRowCount);
          end;
        VK_PRIOR:
          begin
            ClearSelection;
            MoveBy(-VisibleRowCount);
          end;
        VK_INSERT:
          if CanModify and (not ReadOnly) and (dgEditing in Options) then
          begin
            ClearSelection;
            Insert;
          end;
        VK_TAB: if not (ssAlt in Shift) then Tab(not (ssShift in Shift));
        VK_ESCAPE:
          begin
            FDatalink.Reset;
            ClearSelection;
            if not (dgAlwaysShowEditor in Options) then HideEditor;
          end;
        VK_F2: EditorMode := True;
      end;
end;

procedure TIvCustomDBGrid.KeyPress(var Key: Char);
begin
  if not (dgAlwaysShowEditor in Options) and (Key = #13) then
    FDatalink.UpdateData;
  inherited KeyPress(Key);
end;

{ InternalLayout is called with layout locks and column locks in effect }
procedure TIvCustomDBGrid.InternalLayout;
var
  I, J, K: Integer;
  Fld: TField;
  Column: TIvColumn;
  SeenPassthrough: Boolean;
  RestoreCanvas: Boolean;

  function FieldIsMapped(F: TField): Boolean;
  var
    X: Integer;
  begin
    Result := False;
    if F = nil then Exit;
    for X := 0 to FDatalink.FieldCount-1 do
      if FDatalink.Fields[X] = F then
      begin
        Result := True;
        Exit;
      end;
  end;

begin
  if (csLoading in ComponentState) then Exit;

  if HandleAllocated then KillMessage(Handle, cm_DeferLayout);

  { Check for Columns.State flip-flop }
  SeenPassthrough := False;
  for I := 0 to FColumns.Count-1 do
  begin
    if (FColumns[I] is TPassthroughColumn) then
      SeenPassthrough := True
    else
      if SeenPassthrough then
      begin   { We have both custom and passthrough columns. Kill the latter }
        for J := FColumns.Count-1 downto 0 do
        begin
          Column := FColumns[J];
          if Column is TPassthroughColumn then
            Column.Free;
        end;
        Break;
      end;
  end;

  FIndicatorOffset := 0;
  if dgIndicator in Options then
    Inc(FIndicatorOffset);
  FDatalink.ClearMapping;
  if FDatalink.Active then DefineFieldMap;
  if FColumns.State = csDefault then
  begin
     { Destroy columns whose fields have been destroyed or are no longer
       in field map }
    if (not FDataLink.Active) and (FDatalink.DefaultFields) then
      FColumns.Clear
    else
      for J := FColumns.Count-1 downto 0 do
        with FColumns[J] do
        if not Assigned(Field)
          or not FieldIsMapped(Field) then Free;
    I := FDataLink.FieldCount;
    if (I = 0) and (FColumns.Count = 0) then Inc(I);
    for J := 0 to I-1 do
    begin
      Fld := FDatalink.Fields[J];
      if Assigned(Fld) then
      begin
        K := J;
         { Pointer compare is valid here because the grid sets matching
           column.field properties to nil in response to field object
           free notifications.  Closing a dataset that has only default
           field objects will destroy all the fields and set associated
           column.field props to nil. }
        while (K < FColumns.Count) and (FColumns[K].Field <> Fld) do
          Inc(K);
        if K < FColumns.Count then
          Column := FColumns[K]
        else
        begin
          Column := TPassthroughColumn.Create(FColumns);
          Column.Field := Fld;
        end;
      end
      else
        Column := TPassthroughColumn.Create(FColumns);
      Column.Index := J;
    end;
  end
  else
  begin
    { Force columns to reaquire fields (in case dataset has changed) }
    for I := 0 to FColumns.Count-1 do
      FColumns[I].Field := nil;
  end;
  ColCount := FColumns.Count + FIndicatorOffset;
  inherited FixedCols := FIndicatorOffset;
  FTitleOffset := 0;
  if dgTitles in Options then FTitleOffset := 1;
  RestoreCanvas := not HandleAllocated;
  if RestoreCanvas then
    Canvas.Handle := GetDC(0);
  try
    Canvas.Font := Font;
    K := Canvas.TextHeight('Wg') + 3;
    if dgRowLines in Options then
      Inc(K, GridLineWidth);
    DefaultRowHeight := K;
    if dgTitles in Options then
    begin
      K := 0;
      for I := 0 to FColumns.Count-1 do
      begin
        Canvas.Font := FColumns[I].Title.Font;
        J := Canvas.TextHeight('Wg') + 4;
        if J > K then K := J;
      end;
      if K = 0 then
      begin
        Canvas.Font := FTitleFont;
        K := Canvas.TextHeight('Wg') + 4;
      end;
      RowHeights[0] := K;
    end;
  finally
    if RestoreCanvas then
    begin
      ReleaseDC(0,Canvas.Handle);
      Canvas.Handle := 0;
    end;
  end;
  UpdateRowCount;
  SeTIvColumnAttributes;
  UpdateActive;
  Invalidate;
end;

procedure TIvCustomDBGrid.LayoutChanged;
begin
  if AcquireLayoutLock then
    EndLayout;
end;

procedure TIvCustomDBGrid.LinkActive(Value: Boolean);
begin
  if not Value then HideEditor;
  FBookmarks.LinkActive(Value);
  LayoutChanged;
  UpdateScrollBar;
  if Value and (dgAlwaysShowEditor in Options) then ShowEditor;
end;

procedure TIvCustomDBGrid.Loaded;
begin
  inherited Loaded;
  if FColumns.Count > 0 then
    ColCount := FColumns.Count;
  LayoutChanged;
end;

procedure TIvCustomDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  Cell: TIvGridCoord;
  OldCol,OldRow: Integer;
begin
  if not AcquireFocus then Exit;
  if (ssDouble in Shift) and (Button = mbLeft) then
  begin
    DblClick;
    Exit;
  end;
  if Sizing(X, Y) then
  begin
    FDatalink.UpdateData;
    inherited MouseDown(Button, Shift, X, Y)
  end
  else
  begin
    Cell := MouseCoord(X, Y);
    if ((csDesigning in ComponentState) or (dgColumnResize in Options)) and
      (Cell.Y < FTitleOffset) then
    begin
      FDataLink.UpdateData;
      inherited MouseDown(Button, Shift, X, Y)
    end
    else
      if FDatalink.Active then
        with Cell do
        begin
          BeginUpdate;   { eliminates highlight flicker when selection moves }
          try
            HideEditor;
            OldCol := Col;
            OldRow := Row;
            if (Y >= FTitleOffset) and (Y - Row <> 0) then
              FDatalink.Dataset.MoveBy(Y - Row);
            if X >= FIndicatorOffset then
              MoveCol(X);
            if (dgMultiSelect in Options) and FDatalink.Active then
              with FBookmarks do
              begin
                FSelecting := False;
                if ssCtrl in Shift then
                  CurrentRowSelected := not CurrentRowSelected
                else
                begin
                  Clear;
                  CurrentRowSelected := True;
                end;
              end;
            if (Button = mbLeft) and
              (((X = OldCol) and (Y = OldRow)) or (dgAlwaysShowEditor in Options)) then
              ShowEditor         { put grid in edit mode }
            else
              InvalidateEditor;  { draw editor, if needed }
          finally
            EndUpdate;
          end;
        end;
  end;
end;

procedure TIvCustomDBGrid.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  Cell: TIvGridCoord;
  SaveState: TIvGridState;
begin
  SaveState := FGridState;
  inherited MouseUp(Button, Shift, X, Y);
  if (SaveState = gsRowSizing) or (SaveState = gsColSizing) or
    ((InplaceEditor <> nil) and (InplaceEditor.Visible) and
     (PtInRect(InplaceEditor.BoundsRect, Point(X,Y)))) then Exit;
  Cell := MouseCoord(X,Y);
  if (Button = mbLeft) and (Cell.X >= FIndicatorOffset) and (Cell.Y >= 0) then
    if Cell.Y < FTitleOffset then
      TitleClick(Columns[RawToDataColumn(Cell.X)])
    else
      CellClick(Columns[SelectedIndex]);
end;

procedure TIvCustomDBGrid.MoveCol(RawCol: Integer);
var
  OldCol: Integer;
begin
  FDatalink.UpdateData;
  if RawCol >= ColCount then
    RawCol := ColCount - 1;
  if RawCol < FIndicatorOffset then RawCol := FIndicatorOffset;
  OldCol := Col;
  if RawCol <> OldCol then
  begin
    if not FInColExit then
    begin
      FInColExit := True;
      try
        ColExit;
      finally
        FInColExit := False;
      end;
      if Col <> OldCol then Exit;
    end;
    if not (dgAlwaysShowEditor in Options) then HideEditor;
    Col := RawCol;
    ColEnter;
  end;
end;

procedure TIvCustomDBGrid.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  I: Integer;
  NeedLayout: Boolean;
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
    if (AComponent is TPopupMenu) then
    begin
      for I := 0 to Columns.Count-1 do
        if Columns[I].PopupMenu = AComponent then
          Columns[I].PopupMenu := nil;
    end
    else if (FDataLink <> nil) then
      if (AComponent = DataSource)  then
        DataSource := nil
      else if (AComponent is TField) then
      begin
        NeedLayout := False;
        BeginLayout;
        try
          for I := 0 to Columns.Count-1 do
            with Columns[I] do
              if Field = AComponent then
              begin
                Field := nil;
                NeedLayout := True;
              end;
        finally
          if NeedLayout and Assigned(FDatalink.Dataset)
            and not FDatalink.Dataset.ControlsDisabled then
            EndLayout
          else
            DeferLayout;
        end;
      end;
  end;
end;

procedure TIvCustomDBGrid.RecordChanged(Field: TField);
var
  I: Integer;
  CField: TField;
begin
  if not HandleAllocated then Exit;
  if Field = nil then
    Invalidate
  else
  begin
    for I := 0 to Columns.Count - 1 do
      if Columns[I].Field = Field then
        InvalidateCol(DataToRawColumn(I));
  end;
  CField := SelectedField;
  if ((Field = nil) or (CField = Field)) and
    (Assigned(CField) and (CField.Text <> FEditText)) then
  begin
    InvalidateEditor;
    if InplaceEditor <> nil then InplaceEditor.Deselect;
  end;
end;

procedure TIvCustomDBGrid.Scroll(Distance: Integer);
var
  OldRect, NewRect: TRect;
  RowHeight: Integer;
begin
  if not HandleAllocated then Exit;
  OldRect := BoxRect(0, Row, ColCount - 1, Row);
  if (FDataLink.ActiveRecord >= RowCount - FTitleOffset) then UpdateRowCount;
  UpdateScrollBar;
  UpdateActive;
  NewRect := BoxRect(0, Row, ColCount - 1, Row);
  ValidateRect(Handle, @OldRect);
  InvalidateRect(Handle, @OldRect, False);
  InvalidateRect(Handle, @NewRect, False);
  if Distance <> 0 then
  begin
    HideEditor;
    try
      if Abs(Distance) > VisibleRowCount then
      begin
        Invalidate;
        Exit;
      end
      else
      begin
        RowHeight := DefaultRowHeight;
        if dgRowLines in Options then Inc(RowHeight, GridLineWidth);
        if dgIndicator in Options then
        begin
          OldRect := BoxRect(0, FSelRow, ColCount - 1, FSelRow);
          InvalidateRect(Handle, @OldRect, False);
        end;
        NewRect := BoxRect(0, FTitleOffset, ColCount - 1, 1000);
        ScrollWindowEx(Handle, 0, -RowHeight*Distance, @NewRect, @NewRect,
          0, nil, SW_Invalidate);
        if dgIndicator in Options then
        begin
          NewRect := BoxRect(0, Row, ColCount - 1, Row);
          InvalidateRect(Handle, @NewRect, False);
        end;
      end;
    finally
      if dgAlwaysShowEditor in Options then ShowEditor;
    end;
  end;
  if UpdateLock = 0 then Update;
end;

procedure TIvCustomDBGrid.SeTIvColumns(Value: TIvDBGridColumns);
begin
  Columns.Assign(Value);
end;

function ReadOnlyField(Field: TField): Boolean;
var
  MasterField: TField;
begin
  Result := Field.ReadOnly;
  if not Result and (Field.FieldKind = fkLookup) then
  begin
    Result := True;
    if Field.DataSet = nil then Exit;
    MasterField := Field.Dataset.FindField(Field.KeyFields);
    if MasterField = nil then Exit;
    Result := MasterField.ReadOnly;
  end;
end;

procedure TIvCustomDBGrid.SeTIvColumnAttributes;
var
  I: Integer;
begin
  for I := 0 to FColumns.Count-1 do
  with FColumns[I] do
  begin
    TabStops[I + FIndicatorOffset] := not ReadOnly and DataLink.Active and
      Assigned(Field) and not (Field.FieldKind = fkCalculated) and not ReadOnlyField(Field);
    ColWidths[I + FIndicatorOffset] := Width;
  end;
  if (dgIndicator in Options) then
    ColWidths[0] := IndicatorWidth;
end;

procedure TIvCustomDBGrid.SetDataSource(Value: TDataSource);
begin
  if Value = FDatalink.Datasource then Exit;
  FBookmarks.Clear;
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
  LinkActive(FDataLink.Active);
end;

procedure TIvCustomDBGrid.SetEditText(ACol, ARow: Longint; const Value: string);
begin
  FEditText := Value;
end;

procedure TIvCustomDBGrid.SetOptions(Value: TIvDBGridOptions);
const
  LayoutOptions = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator,
    dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection];
var
  NewGridOptions: TIvGridOptions;
  ChangedOptions: TIvDBGridOptions;
begin
  if FOptions <> Value then
  begin
    NewGridOptions := [];
    if dgColLines in Value then
      NewGridOptions := NewGridOptions + [goFixedVertLine, goVertLine];
    if dgRowLines in Value then
      NewGridOptions := NewGridOptions + [goFixedHorzLine, goHorzLine];
    if dgColumnResize in Value then
      NewGridOptions := NewGridOptions + [goColSizing, goColMoving];
    if dgTabs in Value then Include(NewGridOptions, goTabs);
    if dgRowSelect in Value then
    begin
      Include(NewGridOptions, goRowSelect);
      Exclude(Value, dgAlwaysShowEditor);
      Exclude(Value, dgEditing);
    end;
    if dgEditing in Value then Include(NewGridOptions, goEditing);
    if dgAlwaysShowEditor in Value then Include(NewGridOptions, goAlwaysShowEditor);
    inherited Options := NewGridOptions;
    if dgMultiSelect in (FOptions - Value) then FBookmarks.Clear;
    ChangedOptions := (FOptions + Value) - (FOptions * Value);
    FOptions := Value;
    if ChangedOptions * LayoutOptions <> [] then LayoutChanged;
  end;
end;

procedure TIvCustomDBGrid.SetSelectedField(Value: TField);
var
  I: Integer;
begin
  if Value = nil then Exit;
  for I := 0 to Columns.Count - 1 do
    if Columns[I].Field = Value then
      MoveCol(DataToRawColumn(I));
end;

procedure TIvCustomDBGrid.SetSelectedIndex(Value: Integer);
begin
  MoveCol(DataToRawColumn(Value));
end;

procedure TIvCustomDBGrid.SetTitleFont(Value: TFont);
begin
  FTitleFont.Assign(Value);
  if dgTitles in Options then LayoutChanged;
end;

function TIvCustomDBGrid.StoreColumns: Boolean;
begin
  Result := Columns.State = csCustomized;
end;

procedure TIvCustomDBGrid.TimedScroll(Direction: TIvGridScrollDirection);
begin
  if FDatalink.Active then
  begin
    with FDatalink do
    begin
      if sdUp in Direction then
      begin
        DataSet.MoveBy(-ActiveRecord - 1);
        Exclude(Direction, sdUp);
      end;
      if sdDown in Direction then
      begin
        DataSet.MoveBy(RecordCount - ActiveRecord);
        Exclude(Direction, sdDown);
      end;
    end;
    if Direction <> [] then inherited TimedScroll(Direction);
  end;
end;

procedure TIvCustomDBGrid.TitleClick(Column: TIvColumn);
begin
  if Assigned(FOnTitleClick) then FOnTitleClick(Column);
end;

procedure TIvCustomDBGrid.TitleFontChanged(Sender: TObject);
begin
  if (not FSelfChangingTitleFont) and not (csLoading in ComponentState) then
    ParentFont := False;
  if dgTitles in Options then LayoutChanged;
end;

procedure TIvCustomDBGrid.UpdateActive;
var
  NewRow: Integer;
  Field: TField;
begin
  if FDatalink.Active and HandleAllocated and not (csLoading in ComponentState) then
  begin
    NewRow := FDatalink.ActiveRecord + FTitleOffset;
    if Row <> NewRow then
    begin
      if not (dgAlwaysShowEditor in Options) then HideEditor;
      MoveColRow(Col, NewRow, False, False);
      InvalidateEditor;
    end;
    Field := SelectedField;
    if Assigned(Field) and (Field.Text <> FEditText) then
      InvalidateEditor;
  end;
end;

procedure TIvCustomDBGrid.UpdateData;
var
  Field: TField;
begin
  Field := SelectedField;
  if Assigned(Field) then
    Field.Text := FEditText;
end;

procedure TIvCustomDBGrid.UpdateRowCount;
begin
  if RowCount <= FTitleOffset then RowCount := FTitleOffset + 1;
  FixedRows := FTitleOffset;
  with FDataLink do
    if not Active or (RecordCount = 0) or not HandleAllocated then
      RowCount := 1 + FTitleOffset
    else
    begin
      RowCount := 1000;
      FDataLink.BufferCount := VisibleRowCount;
      RowCount := RecordCount + FTitleOffset;
      if dgRowSelect in Options then TopRow := FixedRows;
      UpdateActive;
    end;
end;

procedure TIvCustomDBGrid.UpdateScrollBar;
var
{$IFDEF IVWIDE}
  SIOld, SINew: TScrollInfo;
{$ELSE}
  Pos: Integer;
{$ENDIF}
begin
  if FDatalink.Active and HandleAllocated then
    with FDatalink.DataSet do
    begin
{$IFDEF IVWIDE}
      SIOld.cbSize := sizeof(SIOld);
      SIOld.fMask := SIF_ALL;
      GetScrollInfo(Self.Handle, SB_VERT, SIOld);
      SINew := SIOld;
      if IsSequenced then
      begin
        SINew.nMin := 1;
        SINew.nPage := Self.VisibleRowCount;
        SINew.nMax := RecordCount + SINew.nPage -1;
        if State in [dsInactive, dsBrowse, dsEdit] then
          SINew.nPos := RecNo;  // else keep old pos
      end
      else
      begin
        SINew.nMin := 0;
        SINew.nPage := 0;
        SINew.nMax := 4;
        if BOF then SINew.nPos := 0
        else if EOF then SINew.nPos := 4
        else SINew.nPos := 2;
      end;
      if (SINew.nMin <> SIOld.nMin) or (SINew.nMax <> SIOld.nMax) or
        (SINew.nPage <> SIOld.nPage) or (SINew.nPos <> SIOld.nPos) then
        SetScrollInfo(Self.Handle, SB_VERT, SINew, True);
{$ELSE}
      SetScrollRange(Self.Handle, SB_VERT, 0, 4, False);
      if BOF then
        Pos := 0
      else if EOF then
        Pos := 4
      else
        Pos := 2;
      if GetScrollPos(Self.Handle, SB_VERT) <> Pos then
        SetScrollPos(Self.Handle, SB_VERT, Pos, True);
{$ENDIF}
    end;
end;

function TIvCustomDBGrid.ValidFieldIndex(FieldIndex: Integer): Boolean;
begin
  Result := DataLink.GetMappedIndex(FieldIndex) >= 0;
end;

procedure TIvCustomDBGrid.CMParentFontChanged(var Message: TMessage);
begin
  inherited;
  if ParentFont then
  begin
    FSelfChangingTitleFont := True;
    try
      TitleFont := Font;
    finally
      FSelfChangingTitleFont := False;
    end;
    LayoutChanged;
  end;
end;

procedure TIvCustomDBGrid.CMExit(var Message: TMessage);
begin
  try
    if FDatalink.Active then
      with FDatalink.Dataset do
        if (dgCancelOnExit in Options) and (State = dsInsert) and
          not Modified and not FDatalink.FModified then
          Cancel else
          FDataLink.UpdateData;
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TIvCustomDBGrid.CMFontChanged(var Message: TMessage);
var
  I: Integer;
begin
  inherited;
  BeginLayout;
  try
    for I := 0 to Columns.Count-1 do
      Columns[I].RefreshDefaultFont;
  finally
    EndLayout;
  end;
end;

procedure TIvCustomDBGrid.CMDeferLayout(var Message);
begin
  if AcquireLayoutLock then
    EndLayout
  else
    DeferLayout;
end;

procedure TIvCustomDBGrid.CMDesignHitTest(var Msg: TCMDesignHitTest);
begin
  inherited;
  if (Msg.Result = 1) and ((FDataLink = nil) or
    ((Columns.State = csDefault) and
     (FDataLink.DefaultFields or (not FDataLink.Active)))) then
    Msg.Result := 0;
end;

procedure TIvCustomDBGrid.WMSetCursor(var Msg: TWMSetCursor);
begin
  if (csDesigning in ComponentState) and ((FDataLink = nil) or
     ((Columns.State = csDefault) and
      (FDataLink.DefaultFields or (not FDataLink.Active)))) then
    Windows.SetCursor(LoadCursor(0, IDC_ARROW))
  else inherited;
end;

procedure TIvCustomDBGrid.WMSize(var Message: TWMSize);
begin
  inherited;
  if UpdateLock = 0 then UpdateRowCount;
end;

procedure TIvCustomDBGrid.WMVScroll(var Message: TWMVScroll);
{$IFDEF IVWIDE}
var
  SI: TScrollInfo;
{$ENDIF}
begin
  if not AcquireFocus then Exit;
  if FDatalink.Active then
    with Message, FDataLink.DataSet do
      case ScrollCode of
        SB_LINEUP: MoveBy(-FDatalink.ActiveRecord - 1);
        SB_LINEDOWN: MoveBy(FDatalink.RecordCount - FDatalink.ActiveRecord);
        SB_PAGEUP: MoveBy(-VisibleRowCount);
        SB_PAGEDOWN: MoveBy(VisibleRowCount);
        SB_THUMBPOSITION:
          begin
{$IFDEF IVWIDE}
            if IsSequenced then
            begin
              SI.cbSize := sizeof(SI);
              SI.fMask := SIF_ALL;
              GetScrollInfo(Self.Handle, SB_VERT, SI);
              if SI.nTrackPos <= 1 then First
              else if SI.nTrackPos >= RecordCount then Last
              else RecNo := SI.nTrackPos;
            end
            else
{$ENDIF}
              case Pos of
                0: First;
                1: MoveBy(-VisibleRowCount);
                2: Exit;
                3: MoveBy(VisibleRowCount);
                4: Last;
              end;
          end;
        SB_BOTTOM: Last;
        SB_TOP: First;
      end;
end;

{$IFDEF IVIME}
procedure TIvCustomDBGrid.SetIme;
var
  Column: TIvColumn;
begin
  if not SysLocale.Fareast then
    Exit;

  if FUpdatingEditor or FDataLink.FInUpdateData then
  begin
    ImeName := Screen.DefaultIme;
    ImeMode := imDontCare;
  end
  else
  begin
    Column := Columns[SelectedIndex];
    ImeName := FOriginalImeName;
    ImeMode := FOriginalImeMode;
    if cvImeMode in Column.FAssignedValues then
    begin
      ImeName := Column.ImeName;
      ImeMode := Column.ImeMode;
    end;
  end;

  if InplaceEditor <> nil then
  begin
    TIvDBGridInplaceEdit(Self).ImeName := ImeName;
    TIvDBGridInplaceEdit(Self).ImeMode := ImeMode;
  end;
end;

procedure TIvCustomDBGrid.UpdateIme;
begin
  if not SysLocale.Fareast then Exit;
  SetIme;
  if InplaceEditor <> nil then
    TIvDBGridInplaceEdit(Self).SetIme;
end;

procedure TIvCustomDBGrid.WMIMEStartComp(var Message: TMessage);
begin
  inherited;
  FUpdatingEditor := True;
  ShowEditor;
  FUpdatingEditor := False;
end;

procedure TIvCustomDBGrid.WMSetFocus(var Message: TWMSetFocus);
begin
  SetIme;
  inherited;
end;

procedure TIvCustomDBGrid.WMKillFocus(var Message: TMessage);
begin
  ImeName := Screen.DefaultIme;
  ImeMode := imDontCare;
  inherited;
end;
{$ENDIF}

{$ENDIF}

end.
