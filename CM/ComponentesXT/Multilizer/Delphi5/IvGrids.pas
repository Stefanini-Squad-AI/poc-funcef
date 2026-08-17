unit IvGrids;

{$I IVMULTI.INC}

interface

{$IFDEF IVBIDI}
uses
  Grids;

type
  TIvDrawGrid = class(TDrawGrid)
  end;

  TIvStringGrid = class(TStringGrid)
  end;
{$ELSE}

{$R-}

uses
  Windows, SysUtils, Messages, Classes, Graphics, Menus, Controls, Forms,
  StdCtrls, Mask;

const
  IvMaxCustomExtents = MaxListSize;
  IvMaxShortInt = High(ShortInt);

type
  EIvInvalidGridOperation = class(Exception);

  TIvGetExtentsFunc = function(Index: Longint): Integer of object;

  TIvGridAxisType = (gaHorizontal, gaVertical);

  TIvGridAxisDrawInfo = record
    AxisType: TIvGridAxisType;
    EffectiveLineWidth: Integer;
    FixedBoundary: Integer;
    GridBoundary: Integer;
    GridExtent: Integer;
    LastFullVisibleCell: Longint;
    FullVisBoundary: Integer;
    FixedCellCount: Integer;
    FirstGridCell: Integer;
    GridCellCount: Integer;
    GetExtent: TIvGetExtentsFunc;
  end;

  TIvGridDrawInfo = record
    Horz, Vert: TIvGridAxisDrawInfo;
  end;

  TIvGridState = (gsNormal, gsSelecting, gsRowSizing, gsColSizing, gsRowMoving,
    gsColMoving);

  { TIvInplaceEdit }

  TIvCustomGrid = class;

  TIvInplaceEdit = class(TCustomMaskEdit)
  private
    FGrid: TIvCustomGrid;
    FClickTime: Longint;

    procedure SetGrid(value: TIvCustomGrid);

    procedure InternalMove(const Loc: TRect; Redraw: Boolean);

    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMPaste(var Message); message WM_PASTE;
    procedure WMCut(var Message); message WM_CUT;
    procedure WMClear(var Message); message WM_CLEAR;

  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DblClick; override;
    function EditCanModify: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure BoundsChanged; virtual;
    procedure UpdateContents; virtual;
    procedure WndProc(var Message: TMessage); override;

    property Grid: TIvCustomGrid read FGrid;

  public
    constructor Create(AOwner: TComponent); override;

    procedure Deselect;
    procedure Hide;
    procedure Invalidate; override;
    procedure Move(const Loc: TRect);
    function PosEqual(const Rect: TRect): Boolean;
    procedure SetFocus; override;
    procedure UpdateLoc(const Loc: TRect);
    procedure UpdateBidi(value: Boolean);
    function Visible: Boolean;
  end;

  { TIvCustomGrid }

  TIvGridOption = (goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
    goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving,
    goColMoving, goEditing, goTabs, goRowSelect,
    goAlwaysShowEditor, goThumbTracking);
  TIvGridOptions = set of TIvGridOption;
  TIvGridDrawState = set of (gdSelected, gdFocused, gdFixed);
  TIvGridScrollDirection = set of (sdLeft, sdRight, sdUp, sdDown);

  TIvGridCoord = record
    X: Longint;
    Y: Longint;
  end;

  TIvGridRect = record
    case Integer of
      0: (Left, Top, Right, Bottom: Longint);
      1: (TopLeft, BottomRight: TIvGridCoord);
  end;

  TIvSelectCellEvent = procedure (Sender: TObject; Col, Row: Longint;
    var CanSelect: Boolean) of object;
  TIvDrawCellEvent = procedure (Sender: TObject; Col, Row: Longint;
    Rect: TRect; State: TIvGridDrawState) of object;

  TIvCustomGrid = class(TCustomControl)
  private
    FAnchor: TIvGridCoord;
    FBorderStyle: TBorderStyle;
    FCanEditModify: Boolean;
    FColCount: Longint;
    FColWidths: Pointer;
    FTabStops: Pointer;
    FCurrent: TIvGridCoord;
    FDefaultColWidth: Integer;
    FDefaultRowHeight: Integer;
    FFixedCols: Integer;
    FFixedRows: Integer;
    FFixedColor: TColor;
    FGridLineWidth: Integer;
    FOptions: TIvGridOptions;
    FRowCount: Longint;
    FRowHeights: Pointer;
    FScrollBars: TScrollStyle;
    FTopLeft: TIvGridCoord;
    FSizingIndex: Longint;
    FSizingPos, FSizingOfs: Integer;
    FMoveIndex, FMovePos: Longint;
    FHitTest: TPoint;
    FInplaceEdit: TIvInplaceEdit;
    FInplaceCol, FInplaceRow: Longint;
    FColOffset: Integer;
    FDefaultDrawing: Boolean;
    FEditorMode: Boolean;
    FLocale: Integer;
    FColLocale: TList;

    procedure SetLocale(value: Integer);

    function GetColLocale(index: Integer): Integer;
    procedure SetColLocale(index: Integer; value: Integer);

    function CalcCoordFromPoint(X, Y: Integer;
      const DrawInfo: TIvGridDrawInfo): TIvGridCoord;
    procedure CalcDrawInfo(var DrawInfo: TIvGridDrawInfo);
    procedure CalcDrawInfoXY(var DrawInfo: TIvGridDrawInfo;
      UseWidth, UseHeight: Integer);
    procedure CalcFixedInfo(var DrawInfo: TIvGridDrawInfo);
    function CalcMaxTopLeft(const Coord: TIvGridCoord;
      const DrawInfo: TIvGridDrawInfo): TIvGridCoord;
    procedure CalcSizingState(X, Y: Integer; var State: TIvGridState;
      var Index: Longint; var SizingPos, SizingOfs: Integer;
      var FixedInfo: TIvGridDrawInfo);
    procedure ChangeSize(NewColCount, NewRowCount: Longint);
    procedure ClampInView(const Coord: TIvGridCoord);
    procedure DrawSizingLine(const DrawInfo: TIvGridDrawInfo);
    procedure DrawMove;
    procedure FocusCell(ACol, ARow: Longint; MoveAnchor: Boolean);
    procedure GridRectToScreenRect(
      GridRect: TIvGridRect;
      var ScreenRect: TRect;
      IncludeLine: Boolean);
    procedure HideEdit;
    procedure Initialize;
    procedure InvalidateGrid;
    procedure InvalidateRect(ARect: TIvGridRect);
    procedure ModifyScrollBar(ScrollBar, ScrollCode, Pos: Cardinal);
    procedure MoveAdjust(var CellPos: Longint; FromIndex, ToIndex: Longint);
    procedure MoveAnchor(const NewAnchor: TIvGridCoord);
    procedure MoveAndScroll(Mouse, CellHit: Integer; var DrawInfo: TIvGridDrawInfo;
      var Axis: TIvGridAxisDrawInfo; Scrollbar: Integer);
    procedure MoveCurrent(ACol, ARow: Longint; MoveAnchor, Show: Boolean);
    procedure MoveTopLeft(ALeft, ATop: Longint);
    procedure ResizeCol(Index: Longint; OldSize, NewSize: Integer);
    procedure ResizeRow(Index: Longint; OldSize, NewSize: Integer);
    procedure SelectionMoved(const OldSel: TIvGridRect);
    procedure ScrollDataInfo(DX, DY: Integer; var DrawInfo: TIvGridDrawInfo);
    procedure TopLeftMoved(const OldTopLeft: TIvGridCoord);
    procedure UpdateScrollPos;
    procedure UpdateScrollRange;
    function GetColWidths(Index: Longint): Integer;
    function GetRowHeights(Index: Longint): Integer;
    function GetSelection: TIvGridRect;
    function GetTabStops(Index: Longint): Boolean;
    function GetVisibleColCount: Integer;
    function GetVisibleRowCount: Integer;
    function IsActiveControl: Boolean;
    procedure ReadColWidths(Reader: TReader);
    procedure ReadRowHeights(Reader: TReader);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetCol(Value: Longint);
    procedure SetColCount(Value: Longint);
    procedure SetColWidths(Index: Longint; Value: Integer);
    procedure SetDefaultColWidth(Value: Integer);
    procedure SetDefaultRowHeight(Value: Integer);
    procedure SetEditorMode(Value: Boolean);
    procedure SetFixedColor(Value: TColor);
    procedure SetFixedCols(Value: Integer);
    procedure SetFixedRows(Value: Integer);
    procedure SetGridLineWidth(Value: Integer);
    procedure SetLeftCol(Value: Longint);
    procedure SetOptions(Value: TIvGridOptions);
    procedure SetRow(Value: Longint);
    procedure SetRowCount(Value: Longint);
    procedure SetRowHeights(Index: Longint; Value: Integer);
    procedure SetScrollBars(Value: TScrollStyle);
    procedure SetSelection(Value: TIvGridRect);
    procedure SetTabStops(Index: Longint; Value: Boolean);
    procedure SetTopRow(Value: Longint);
    procedure UpdateEdit;
    procedure UpdateText;
    procedure WriteColWidths(Writer: TWriter);
    procedure WriteRowHeights(Writer: TWriter);
    procedure CMCancelMode(var Msg: TMessage); message CM_CANCELMODE;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMDesignHitTest(var Msg: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CMWantSpecialKey(var Msg: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
    procedure WMChar(var Msg: TWMChar); message WM_CHAR;
    procedure WMCommand(var Message: TWMCommand); message WM_COMMAND;
    procedure WMGetDlgCode(var Msg: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMHScroll(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure WMKillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMLButtonDown(var Message: TMessage); message WM_LBUTTONDOWN;
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
    procedure WMSize(var Msg: TWMSize); message WM_SIZE;
    procedure WMTimer(var Msg: TWMTimer); message WM_TIMER;
    procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;

  protected
    FGridState: TIvGridState;
    FSaveCellExtents: Boolean;
    DesignOptionsBoost: TIvGridOptions;
    VirtualView: Boolean;

    function CreateEditor: TIvInplaceEdit; virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure AdjustSize(Index, Amount: Longint; Rows: Boolean);dynamic;
    function BoxRect(ALeft, ATop, ARight, ABottom: Longint): TRect;
    procedure DoExit; override;
    function CellRect(ACol, ARow: Longint): TRect;
    function CanEditAcceptKey(Key: Char): Boolean; dynamic;
    function CanGridAcceptKey(Key: Word; Shift: TShiftState): Boolean; dynamic;
    function CanEditModify: Boolean; dynamic;
    function CanEditShow: Boolean; virtual;
    function GetEditText(ACol, ARow: Longint): string; dynamic;
    procedure SetEditText(ACol, ARow: Longint; const Value: string); dynamic;
    function GetEditMask(ACol, ARow: Longint): string; dynamic;
    function GetEditLimit: Integer; dynamic;
    function GetGridWidth: Integer;
    function GetGridHeight: Integer;
    procedure HideEditor;
    procedure ShowEditor;
    procedure ShowEditorChar(Ch: Char);
    procedure InvalidateEditor;
    procedure MoveColumn(FromIndex, ToIndex: Longint);
    procedure ColumnMoved(FromIndex, ToIndex: Longint); dynamic;
    procedure MoveRow(FromIndex, ToIndex: Longint);
    procedure RowMoved(FromIndex, ToIndex: Longint); dynamic;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TIvGridDrawState); virtual; abstract;
    procedure DefineProperties(Filer: TFiler); override;
    procedure MoveColRow(ACol, ARow: Longint; MoveAnchor, Show: Boolean);
    function SelectCell(ACol, ARow: Longint): Boolean; virtual;
    procedure SizeChanged(OldColCount, OldRowCount: Longint); dynamic;
    function Sizing(X, Y: Integer): Boolean;
    procedure ScrollData(DX, DY: Integer);
    procedure InvalidateCell(ACol, ARow: Longint);
    procedure InvalidateCol(ACol: Longint);
    procedure InvalidateRow(ARow: Longint);
    procedure TopLeftChanged; dynamic;
    procedure TimedScroll(Direction: TIvGridScrollDirection); dynamic;
    procedure Paint; override;
    procedure ColWidthsChanged; dynamic;
    procedure RowHeightsChanged; dynamic;
    procedure DeleteColumn(ACol: Longint);
    procedure DeleteRow(ARow: Longint);
    procedure UpdateDesigner;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Col: Longint read FCurrent.X write SetCol;
    property Color default clWindow;
    property ColCount: Longint read FColCount write SetColCount default 5;
    property ColWidths[Index: Longint]: Integer read GetColWidths write SetColWidths;
    property DefaultColWidth: Integer read FDefaultColWidth write SetDefaultColWidth default 64;
    property DefaultDrawing: Boolean read FDefaultDrawing write FDefaultDrawing default True;
    property DefaultRowHeight: Integer read FDefaultRowHeight write SetDefaultRowHeight default 24;
    property EditorMode: Boolean read FEditorMode write SetEditorMode;
    property FixedColor: TColor read FFixedColor write SetFixedColor default clBtnFace;
    property FixedCols: Integer read FFixedCols write SetFixedCols default 1;
    property FixedRows: Integer read FFixedRows write SetFixedRows default 1;
    property GridHeight: Integer read GetGridHeight;
    property GridLineWidth: Integer read FGridLineWidth write SetGridLineWidth default 1;
    property GridWidth: Integer read GetGridWidth;
    property HitTest: TPoint read FHitTest;
    property InplaceEditor: TIvInplaceEdit read FInplaceEdit;
    property LeftCol: Longint read FTopLeft.X write SetLeftCol;
    property Options: TIvGridOptions read FOptions write SetOptions
      default [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
      goRangeSelect];
    property ParentColor default False;
    property Row: Longint read FCurrent.Y write SetRow;
    property RowCount: Longint read FRowCount write SetRowCount default 5;
    property RowHeights[Index: Longint]: Integer read GetRowHeights write SetRowHeights;
    property ScrollBars: TScrollStyle read FScrollBars write SetScrollBars default ssBoth;
    property Selection: TIvGridRect read GetSelection write SetSelection;
    property TabStops[Index: Longint]: Boolean read GetTabStops write SetTabStops;
    property TopRow: Longint read FTopLeft.Y write SetTopRow;
    property VisibleColCount: Integer read GetVisibleColCount;
    property VisibleRowCount: Integer read GetVisibleRowCount;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function MouseCoord(X, Y: Integer): TIvGridCoord;

    property ColLocale[index: Integer]: Integer read GetColLocale write SetColLocale;

  published
    property Locale: Integer read FLocale write SetLocale stored False;
    property TabStop default True;
  end;

  { TDrawGrid }

  TIvGetEditEvent = procedure (Sender: TObject; ACol, ARow: Longint; var Value: string) of object;
  TIvSetEditEvent = procedure (Sender: TObject; ACol, ARow: Longint; const Value: string) of object;
  TIvMovedEvent = procedure (Sender: TObject; FromIndex, ToIndex: Longint) of object;

  TIvDrawGrid = class(TIvCustomGrid)
  private
    FOnColumnMoved: TIvMovedEvent;
    FOnDrawCell: TIvDrawCellEvent;
    FOnGetEditMask: TIvGetEditEvent;
    FOnGetEditText: TIvGetEditEvent;
    FOnRowMoved: TIvMovedEvent;
    FOnSelectCell: TIvSelectCellEvent;
    FOnSetEditText: TIvSetEditEvent;
    FOnTopLeftChanged: TNotifyEvent;

  protected
    procedure ColumnMoved(FromIndex, ToIndex: Longint); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TIvGridDrawState); override;
    function GetEditMask(ACol, ARow: Longint): string; override;
    function GetEditText(ACol, ARow: Longint): string; override;
    procedure RowMoved(FromIndex, ToIndex: Longint); override;
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure SetEditText(ACol, ARow: Longint; const Value: string); override;
    procedure TopLeftChanged; override;

  public
    function CellRect(ACol, ARow: Longint): TRect;
    procedure MouseToCell(X, Y: Integer; var ACol, ARow: Longint);
    property Canvas;
    property Col;
    property ColWidths;
    property EditorMode;
    property GridHeight;
    property GridWidth;
    property LeftCol;
    property Selection;
    property Row;
    property RowHeights;
    property TabStops;
    property TopRow;

  published
    property Align;
    property BorderStyle;
    property Color;
    property ColCount;
    property Ctl3D;
    property DefaultColWidth;
    property DefaultRowHeight;
    property DefaultDrawing;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FixedColor;
    property FixedCols;
    property RowCount;
    property FixedRows;
    property Font;
    property GridLineWidth;
    property Options;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ScrollBars;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property VisibleColCount;
    property VisibleRowCount;
    property OnClick;
    property OnColumnMoved: TIvMovedEvent read FOnColumnMoved write FOnColumnMoved;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawCell: TIvDrawCellEvent read FOnDrawCell write FOnDrawCell;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetEditMask: TIvGetEditEvent read FOnGetEditMask write FOnGetEditMask;
    property OnGetEditText: TIvGetEditEvent read FOnGetEditText write FOnGetEditText;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnRowMoved: TIvMovedEvent read FOnRowMoved write FOnRowMoved;
    property OnSelectCell: TIvSelectCellEvent read FOnSelectCell write FOnSelectCell;
    property OnSetEditText: TIvSetEditEvent read FOnSetEditText write FOnSetEditText;
    property OnStartDrag;
    property OnTopLeftChanged: TNotifyEvent read FOnTopLeftChanged write FOnTopLeftChanged;
  end;

  { TIvStringGrid }

  TIvStringGrid = class;

  TIvStringGridStrings = class(TStrings)
  private
    FGrid: TIvStringGrid;
    FIndex: Integer;

    procedure CalcXY(Index: Integer; var X, Y: Integer);

  protected
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): TObject; override;
    procedure Put(Index: Integer; const S: string); override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetUpdateState(Updating: Boolean); override;

  public
    constructor Create(AGrid: TIvStringGrid; AIndex: Longint);

    procedure Clear; override;
    function Add(const S: string): Integer; override;

    procedure Assign(Source: TPersistent); override;
{$IFDEF IVWIDE}
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
{$ENDIF}
  end;

  TIvStringGrid = class(TIvDrawGrid)
  private
    FData: Pointer;
    FRows: Pointer;
    FCols: Pointer;
    FUpdating: Boolean;
    FNeedsUpdating: Boolean;
    FEditUpdate: Integer;

    procedure DisableEditUpdate;
    procedure EnableEditUpdate;
    procedure Initialize;
    procedure UpdateCell(ACol, ARow: Integer);
    procedure SetUpdateState(Updating: Boolean);
    function GetCells(ACol, ARow: Integer): string;
    function GetCols(Index: Integer): TStrings;
    function GetObjects(ACol, ARow: Integer): TObject;
    function GetRows(Index: Integer): TStrings;
    procedure SetCells(ACol, ARow: Integer; const Value: string);
    procedure SetCols(Index: Integer; Value: TStrings);
    procedure SetObjects(ACol, ARow: Integer; Value: TObject);
    procedure SetRows(Index: Integer; Value: TStrings);
    function EnsureColRow(Index: Integer; IsCol: Boolean): TIvStringGridStrings;
    function EnsureDataRow(ARow: Integer): Pointer;

  protected
    procedure ColumnMoved(FromIndex, ToIndex: Longint); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TIvGridDrawState); override;
    function GetEditText(ACol, ARow: Longint): string; override;
    procedure SetEditText(ACol, ARow: Longint; const Value: string); override;
    procedure RowMoved(FromIndex, ToIndex: Longint); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Cells[ACol, ARow: Integer]: string read GetCells write SetCells;
    property Cols[Index: Integer]: TStrings read GetCols write SetCols;
    property Objects[ACol, ARow: Integer]: TObject read GetObjects write SetObjects;
    property Rows[Index: Integer]: TStrings read GetRows write SetRows;
  end;
{$ENDIF}

implementation

{$IFNDEF IVBIDI}
uses
  Consts, IvDictio;

type
  PIntArray = ^TIntArray;
  TIntArray = array[0..IvMaxCustomExtents] of Integer;

{$IFDEF IVWIDE}
procedure InvalidOp(const id: String);
begin
  raise EIvInvalidGridOperation.Create(id);
end;
{$ELSE}
procedure InvalidOp(const id: Integer);
begin
  raise EIvInvalidGridOperation.CreateRes(id);
end;
{$ENDIF}

function IMin(A, B: Integer): Integer;
begin
  Result := B;
  if A < B then Result := A;
end;

function IMax(A, B: Integer): Integer;
begin
  Result := B;
  if A > B then Result := A;
end;

function GridRect(Coord1, Coord2: TIvGridCoord): TIvGridRect;
begin
  with Result do
  begin
    Left := Coord2.X;
    if Coord1.X < Coord2.X then
      Left := Coord1.X;

    Right := Coord1.X;
    if Coord1.X < Coord2.X then
      Right := Coord2.X;

    Top := Coord2.Y;
    if Coord1.Y < Coord2.Y then
      Top := Coord1.Y;

    Bottom := Coord1.Y;
    if Coord1.Y < Coord2.Y then
      Bottom := Coord2.Y;
  end;
end;

function PointInGridRect(Col, Row: Longint; const Rect: TIvGridRect): Boolean;
begin
  Result := (Col >= Rect.Left) and (Col <= Rect.Right) and (Row >= Rect.Top)
    and (Row <= Rect.Bottom);
end;

type
  TXorRects = array[0..3] of TRect;

procedure XorRects(const R1, R2: TRect; var XorRects: TXorRects);
var
  Intersect, Union: TRect;

  function PtInRect(X, Y: Integer; const Rect: TRect): Boolean;
  begin
    with Rect do Result := (X >= Left) and (X <= Right) and (Y >= Top) and
      (Y <= Bottom);
  end;

  function Includes(const P1: TPoint; var P2: TPoint): Boolean;
  begin
    with P1 do
    begin
      Result := PtInRect(X, Y, R1) or PtInRect(X, Y, R2);
      if Result then P2 := P1;
    end;
  end;

  function Build(var R: TRect; const P1, P2, P3: TPoint): Boolean;
  begin
    Build := True;
    with R do
      if Includes(P1, TopLeft) then
      begin
        if not Includes(P3, BottomRight) then BottomRight := P2;
      end
      else if Includes(P2, TopLeft) then BottomRight := P3
      else Build := False;
  end;

begin
  FillChar(XorRects, SizeOf(XorRects), 0);
  if not Bool(IntersectRect(Intersect, R1, R2)) then
  begin
    { Don't intersect so its simple }
    XorRects[0] := R1;
    XorRects[1] := R2;
  end
  else
  begin
    UnionRect(Union, R1, R2);
    if Build(XorRects[0],
      Point(Union.Left, Union.Top),
      Point(Union.Left, Intersect.Top),
      Point(Union.Left, Intersect.Bottom)) then
      XorRects[0].Right := Intersect.Left;
    if Build(XorRects[1],
      Point(Intersect.Left, Union.Top),
      Point(Intersect.Right, Union.Top),
      Point(Union.Right, Union.Top)) then
      XorRects[1].Bottom := Intersect.Top;
    if Build(XorRects[2],
      Point(Union.Right, Intersect.Top),
      Point(Union.Right, Intersect.Bottom),
      Point(Union.Right, Union.Bottom)) then
      XorRects[2].Left := Intersect.Right;
    if Build(XorRects[3],
      Point(Union.Left, Union.Bottom),
      Point(Intersect.Left, Union.Bottom),
      Point(Intersect.Right, Union.Bottom)) then
      XorRects[3].Top := Intersect.Bottom;
  end;
end;

procedure ModifyExtents(var Extents: Pointer; Index, Amount: Longint;
  Default: Integer);
var
  LongSize: LongInt;
  NewSize: Cardinal;
  OldSize: Cardinal;
  I: Cardinal;
begin
  if Amount <> 0 then
  begin
    if not Assigned(Extents) then OldSize := 0
    else OldSize := PIntArray(Extents)^[0];
    if (Index < 0) or (Integer(OldSize) < Index) then
      InvalidOp(SIndexOutOfRange);
    LongSize := Integer(OldSize) + Amount;
    if LongSize < 0 then InvalidOp(STooManyDeleted)
    else if LongSize >= MaxListSize - 1 then InvalidOp(SGridTooLarge);
    NewSize := Cardinal(LongSize);
    if NewSize > 0 then Inc(NewSize);
    ReallocMem(Extents, NewSize * SizeOf(Integer));
    if Assigned(Extents) then
    begin
      I := Index;
      while I < NewSize do
      begin
        PIntArray(Extents)^[I] := Default;
        Inc(I);
      end;
      PIntArray(Extents)^[0] := NewSize-1;
    end;
  end;
end;

procedure UpdateExtents(var Extents: Pointer; NewSize: Longint;
  Default: Integer);
var
  OldSize: Integer;
begin
  OldSize := 0;
  if Assigned(Extents) then OldSize := PIntArray(Extents)^[0];
  ModifyExtents(Extents, OldSize, NewSize - OldSize, Default);
end;

procedure MoveExtent(var Extents: Pointer; FromIndex, ToIndex: Longint);
var
  Extent: Integer;
begin
  if Assigned(Extents) then
  begin
    Extent := PIntArray(Extents)^[FromIndex];
    if FromIndex < ToIndex then
      Move(PIntArray(Extents)^[FromIndex + 1], PIntArray(Extents)^[FromIndex],
        (ToIndex - FromIndex) * SizeOf(Integer))
    else if FromIndex > ToIndex then
      Move(PIntArray(Extents)^[ToIndex], PIntArray(Extents)^[ToIndex + 1],
        (FromIndex - ToIndex) * SizeOf(Integer));
    PIntArray(Extents)^[ToIndex] := Extent;
  end;
end;

function CompareExtents(E1, E2: Pointer): Boolean;
var
  I: Integer;
begin
  Result := False;
  if E1 <> nil then
  begin
    if E2 <> nil then
    begin
      for I := 0 to PIntArray(E1)^[0] do
        if PIntArray(E1)^[I] <> PIntArray(E2)^[I] then Exit;
      Result := True;
    end
  end
  else Result := E2 = nil;
end;

{ Private. LongMulDiv multiplys the first two arguments and then
  divides by the third.  This is used so that real number
  (floating point) arithmetic is not necessary.  This routine saves
  the possible 64-bit value in a temp before doing the divide.  Does
  not do error checking like divide by zero.  Also assumes that the
  result is in the 32-bit range (Actually 31-bit, since this algorithm
  is for unsigned). }

function LongMulDiv(Mult1, Mult2, Div1: Longint): Longint; stdcall;
  external 'kernel32.dll' name 'MulDiv';

type
  TSelection = record
    StartPos, EndPos: Integer;
  end;

constructor TIvInplaceEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ParentCtl3D := False;
  Ctl3D := False;
  TabStop := False;
  BorderStyle := bsNone;
end;

procedure TIvInplaceEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_MULTILINE;
end;

procedure TIvInplaceEdit.SetGrid(Value: TIvCustomGrid);
begin
  FGrid := Value;
end;

procedure TIvInplaceEdit.CMShowingChanged(var Message: TMessage);
begin
  { Ignore showing using the Visible property }
end;

procedure TIvInplaceEdit.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  if goTabs in Grid.Options then
    Message.Result := Message.Result or DLGC_WANTTAB;
end;

procedure TIvInplaceEdit.WMPaste(var Message);
begin
  if not EditCanModify then Exit;
  inherited
end;

procedure TIvInplaceEdit.WMClear(var Message);
begin
  if not EditCanModify then Exit;
  inherited;
end;

procedure TIvInplaceEdit.WMCut(var Message);
begin
  if not EditCanModify then Exit;
  inherited;
end;

procedure TIvInplaceEdit.DblClick;
begin
  Grid.DblClick;
end;

function TIvInplaceEdit.EditCanModify: Boolean;
begin
  Result := Grid.CanEditModify;
end;

procedure TIvInplaceEdit.KeyDown(var Key: Word; Shift: TShiftState);

  procedure SendToParent;
  begin
    Grid.KeyDown(Key, Shift);
    Key := 0;
  end;

  procedure ParentEvent;
  var
    GridKeyDown: TKeyEvent;
  begin
    GridKeyDown := Grid.OnKeyDown;
    if Assigned(GridKeyDown) then GridKeyDown(Grid, Key, Shift);
  end;

  function ForwardMovement: Boolean;
  begin
    Result := goAlwaysShowEditor in Grid.Options;
  end;

  function Ctrl: Boolean;
  begin
    Result := ssCtrl in Shift;
  end;

  function Selection: TSelection;
  begin
    SendMessage(Handle, EM_GETSEL, Longint(@Result.StartPos), Longint(@Result.EndPos));
  end;

  function RightSide: Boolean;
  begin
    with Selection do
      Result := ((StartPos = 0) or (EndPos = StartPos)) and
        (EndPos = GetTextLen);
   end;

  function LeftSide: Boolean;
  begin
    with Selection do
      Result := (StartPos = 0) and ((EndPos = 0) or (EndPos = GetTextLen));
  end;

begin
  case Key of
    VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, VK_ESCAPE: SendToParent;
    VK_INSERT:
      if Shift = [] then SendToParent
      else if (Shift = [ssShift]) and not Grid.CanEditModify then Key := 0;
    VK_LEFT: if ForwardMovement and (Ctrl or LeftSide) then SendToParent;
    VK_RIGHT: if ForwardMovement and (Ctrl or RightSide) then SendToParent;
    VK_HOME: if ForwardMovement and (Ctrl or LeftSide) then SendToParent;
    VK_END: if ForwardMovement and (Ctrl or RightSide) then SendToParent;
    VK_F2:
      begin
        ParentEvent;
        if Key = VK_F2 then
        begin
          Deselect;
          Exit;
        end;
      end;
    VK_TAB: if not (ssAlt in Shift) then SendToParent;
  end;
  if (Key = VK_DELETE) and not Grid.CanEditModify then Key := 0;
  if Key <> 0 then
  begin
    ParentEvent;
    inherited KeyDown(Key, Shift);
  end;
end;

procedure TIvInplaceEdit.KeyPress(var Key: Char);
var
  Selection: TSelection;
begin
  Grid.KeyPress(Key);
  if (Key in [#32..#255]) and not Grid.CanEditAcceptKey(Key) then
  begin
    Key := #0;
    MessageBeep(0);
  end;
  case Key of
    #9, #27: Key := #0;
    #13:
      begin
        SendMessage(Handle, EM_GETSEL, Longint(@Selection.StartPos), Longint(@Selection.EndPos));
        if (Selection.StartPos = 0) and (Selection.EndPos = GetTextLen) then
          Deselect else
          SelectAll;
        Key := #0;
      end;
    ^H, ^V, ^X, #32..#255:
      if not Grid.CanEditModify then Key := #0;
  end;
  if Key <> #0 then inherited KeyPress(Key);
end;

procedure TIvInplaceEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
  Grid.KeyUp(Key, Shift);
end;

procedure TIvInplaceEdit.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_SETFOCUS:
      begin
        if (GetParentForm(Self) = nil) or GetParentForm(Self).SetFocusedControl(Grid) then Dispatch(Message);
        Exit;
      end;
    WM_LBUTTONDOWN:
      begin
        if GetMessageTime - FClickTime < GetDoubleClickTime then
          Message.Msg := WM_LBUTTONDBLCLK;
        FClickTime := 0;
      end;
  end;
  inherited WndProc(Message);
end;

procedure TIvInplaceEdit.Deselect;
begin
  SendMessage(Handle, EM_SETSEL, $7FFFFFFF, Longint($FFFFFFFF));
end;

procedure TIvInplaceEdit.Invalidate;
var
  Cur: TRect;
begin
  ValidateRect(Handle, nil);
  InvalidateRect(Handle, nil, True);
  Windows.GetClientRect(Handle, Cur);
  MapWindowPoints(Handle, Grid.Handle, Cur, 2);
  ValidateRect(Grid.Handle, @Cur);
  InvalidateRect(Grid.Handle, @Cur, False);
end;

procedure TIvInplaceEdit.Hide;
begin
  if HandleAllocated and IsWindowVisible(Handle) then
  begin
    Invalidate;
    SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_HIDEWINDOW or SWP_NOZORDER or
      SWP_NOREDRAW);
    if Focused then Windows.SetFocus(Grid.Handle);
  end;
end;

function TIvInplaceEdit.PosEqual(const Rect: TRect): Boolean;
var
  Cur: TRect;
begin
  GetWindowRect(Handle, Cur);
  MapWindowPoints(HWND_DESKTOP, Grid.Handle, Cur, 2);
  Result := EqualRect(Rect, Cur);
end;

procedure TIvInplaceEdit.InternalMove(const Loc: TRect; Redraw: Boolean);
begin
  if IsRectEmpty(Loc) then Hide
  else
  begin
    CreateHandle;
    Redraw := Redraw or not IsWindowVisible(Handle);
    Invalidate;
    with Loc do
      SetWindowPos(Handle, HWND_TOP, Left, Top, Right - Left, Bottom - Top,
        SWP_SHOWWINDOW or SWP_NOREDRAW);
    BoundsChanged;
    if Redraw then Invalidate;
    if Grid.Focused then
      Windows.SetFocus(Handle);
  end;
end;

procedure TIvInplaceEdit.BoundsChanged;
var
  R: TRect;
begin
  R := Rect(2, 2, Width - 2, Height);
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@R));
  SendMessage(Handle, EM_SCROLLCARET, 0, 0);
end;

procedure TIvInplaceEdit.UpdateLoc(const Loc: TRect);
begin
  InternalMove(Loc, False);
end;

procedure TIvInplaceEdit.UpdateBidi(value: Boolean);
var
  style, newStyle: Integer;
begin
  { Extended style }

  style := GetWindowLong(Handle, GWL_EXSTYLE);
  if value then
    newStyle := style or WS_EX_RIGHT or WS_EX_LEFTSCROLLBAR or WS_EX_RTLREADING
  else
    newStyle := style and not (WS_EX_RIGHT or WS_EX_LEFTSCROLLBAR or WS_EX_RTLREADING);
  if newStyle <> style then
    SetWindowLong(Handle, GWL_EXSTYLE, newStyle);
end;

function TIvInplaceEdit.Visible: Boolean;
begin
  Result := IsWindowVisible(Handle);
end;

procedure TIvInplaceEdit.Move(const Loc: TRect);
begin
  InternalMove(Loc, True);
end;

procedure TIvInplaceEdit.SetFocus;
begin
  if IsWindowVisible(Handle) then
    Windows.SetFocus(Handle);
end;

procedure TIvInplaceEdit.UpdateContents;
begin
  Text := '';
  EditMask := Grid.GetEditMask(Grid.Col, Grid.Row);
  Text := Grid.GetEditText(Grid.Col, Grid.Row);
  MaxLength := Grid.GetEditLimit;
end;

{ TIvCustomGrid }

constructor TIvCustomGrid.Create(AOwner: TComponent);
const
  GridStyle = [csCaptureMouse, csOpaque, csDoubleClicks];
begin
  inherited Create(AOwner);
  if NewStyleControls then
    ControlStyle := GridStyle else
    ControlStyle := GridStyle + [csFramed];
  FCanEditModify := True;
  FColCount := 5;
  FRowCount := 5;
  FFixedCols := 1;
  FFixedRows := 1;
  FGridLineWidth := 1;
  FOptions := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
    goRangeSelect];
  DesignOptionsBoost := [goColSizing, goRowSizing];
  FFixedColor := clBtnFace;
  FScrollBars := ssBoth;
  FBorderStyle := bsSingle;
  FDefaultColWidth := 64;
  FDefaultRowHeight := 24;
  FDefaultDrawing := True;
  FSaveCellExtents := True;
  FEditorMode := False;

  FLocale := 0;
  FColLocale := TList.Create;
  while FColLocale.Count < FColCount do
    FColLocale.Add(Pointer(0));

  Color := clWindow;
  ParentColor := False;
  TabStop := True;
  SetBounds(
    Left,
    Top,
    FColCount*FDefaultColWidth,
    FRowCount*FDefaultRowHeight);
  Initialize;
end;

destructor TIvCustomGrid.Destroy;
begin
  while FColLocale.Count > 0 do
    FColLocale.Delete(0);
  FColLocale.Free;

  FInplaceEdit.Free;
  inherited Destroy;
  FreeMem(FColWidths);
  FreeMem(FRowHeights);
  FreeMem(FTabStops);
end;

procedure TIvCustomGrid.SetLocale(value: Integer);
begin
  if value <> FLocale then
  begin
    FLocale := value;
    Invalidate;
  end;
end;

function TIvCustomGrid.GetColLocale(index: Integer): Integer;
begin
  Result := Integer(FColLocale[index]);
  if Result = 0 then
    Result := Locale;
end;

procedure TIvCustomGrid.SetColLocale(index: Integer; value: Integer);
begin
  if value <> ColLocale[index] then
  begin
    FColLocale[index] := Pointer(value);
    Invalidate;
  end;
end;

procedure TIvCustomGrid.AdjustSize(Index, Amount: Longint; Rows: Boolean);
var
  NewCur: TIvGridCoord;
  OldRows, OldCols: Longint;
  MovementX, MovementY: Longint;
  MoveRect: TIvGridRect;
  ScrollArea: TRect;
  AbsAmount: Longint;

  function DoSizeAdjust(var Count: Longint; var Extents: Pointer;
    DefaultExtent: Integer; var Current: Longint): Longint;
  var
    I: Integer;
    NewCount: Longint;
  begin
    NewCount := Count + Amount;
    if NewCount < Index then InvalidOp(STooManyDeleted);
    if (Amount < 0) and Assigned(Extents) then
    begin
      Result := 0;
      for I := Index to Index - Amount - 1 do
        Inc(Result, PIntArray(Extents)^[I]);
    end
    else
      Result := Amount * DefaultExtent;
    if Extents <> nil then
      ModifyExtents(Extents, Index, Amount, DefaultExtent);
    Count := NewCount;
    if Current >= Index then
      if (Amount < 0) and (Current < Index - Amount) then Current := Index
      else Inc(Current, Amount);
  end;

begin
  if Amount = 0 then
    Exit;
  NewCur := FCurrent;
  OldCols := ColCount;
  OldRows := RowCount;
  MoveRect.Left := FixedCols;
  MoveRect.Right := ColCount - 1;
  MoveRect.Top := FixedRows;
  MoveRect.Bottom := RowCount - 1;
  MovementX := 0;
  MovementY := 0;
  AbsAmount := Amount;
  if AbsAmount < 0 then AbsAmount := -AbsAmount;
  if Rows then
  begin
    MovementY := DoSizeAdjust(FRowCount, FRowHeights, DefaultRowHeight, NewCur.Y);
    MoveRect.Top := Index;
    if Index + AbsAmount <= TopRow then
      MoveRect.Bottom := TopRow - 1;
  end
  else
  begin
    MovementX := DoSizeAdjust(FColCount, FColWidths, DefaultColWidth, NewCur.X);
    MoveRect.Left := Index;
    if Index + AbsAmount <= LeftCol then
      MoveRect.Right := LeftCol - 1;
  end;
  GridRectToScreenRect(MoveRect, ScrollArea, True);
  if not IsRectEmpty(ScrollArea) then
  begin
    ScrollWindow(Handle, MovementX, MovementY, @ScrollArea, @ScrollArea);
    UpdateWindow(Handle);
  end;
  SizeChanged(OldCols, OldRows);
  if (NewCur.X <> FCurrent.X) or (NewCur.Y <> FCurrent.Y) then
    MoveCurrent(NewCur.X, NewCur.Y, True, True);
end;

function TIvCustomGrid.BoxRect(ALeft, ATop, ARight, ABottom: Longint): TRect;
var
  gridRect: TIvGridRect;
begin
  gridRect.Left := ALeft;
  gridRect.Right := ARight;
  gridRect.Top := ATop;
  gridRect.Bottom := ABottom;
  GridRectToScreenRect(gridRect, Result, False);
end;

procedure TIvCustomGrid.DoExit;
begin
  inherited DoExit;
  if not (goAlwaysShowEditor in Options) then
    HideEditor;
end;

function TIvCustomGrid.CellRect(ACol, ARow: Longint): TRect;
begin
  Result := BoxRect(ACol, ARow, ACol, ARow);
end;

function TIvCustomGrid.CanEditAcceptKey(Key: Char): Boolean;
begin
  Result := True;
end;

function TIvCustomGrid.CanGridAcceptKey(Key: Word; Shift: TShiftState): Boolean;
begin
  Result := True;
end;

function TIvCustomGrid.CanEditModify: Boolean;
begin
  Result := FCanEditModify;
end;

function TIvCustomGrid.CanEditShow: Boolean;
begin
  Result := ([goRowSelect, goEditing]*Options = [goEditing]) and
    FEditorMode and not (csDesigning in ComponentState) and HandleAllocated and
    ((goAlwaysShowEditor in Options) or IsActiveControl);
end;

function TIvCustomGrid.IsActiveControl: Boolean;
{$IFDEF IVWIDE}
var
  H: Hwnd;
  ParentForm: TCustomForm;
{$ENDIF}
begin
{$IFDEF IVWIDE}
  Result := False;
  ParentForm := GetParentForm(Self);
  if Assigned(ParentForm) then
  begin
    if (ParentForm.ActiveControl = Self) then
      Result := True
  end
  else
  begin
    H := GetFocus;
    while IsWindow(H) and (Result = False) do
    begin
      if H = WindowHandle then
        Result := True
      else
        H := GetParent(H);
    end;
  end;
{$ELSE}
  Result := ValidParentForm(Self).ActiveControl = Self;
{$ENDIF}
end;

function TIvCustomGrid.GetEditMask(ACol, ARow: Longint): string;
begin
  Result := '';
end;

function TIvCustomGrid.GetEditText(ACol, ARow: Longint): string;
begin
  Result := '';
end;

procedure TIvCustomGrid.SetEditText(ACol, ARow: Longint; const Value: string);
begin
end;

function TIvCustomGrid.GetEditLimit: Integer;
begin
  Result := 0;
end;

procedure TIvCustomGrid.HideEditor;
begin
  FEditorMode := False;
  HideEdit;
end;

procedure TIvCustomGrid.ShowEditor;
begin
  FEditorMode := True;
  UpdateEdit;
end;

procedure TIvCustomGrid.ShowEditorChar(Ch: Char);
begin
  ShowEditor;
  if FInplaceEdit <> nil then
    PostMessage(FInplaceEdit.Handle, WM_CHAR, Word(Ch), 0);
end;

procedure TIvCustomGrid.InvalidateEditor;
begin
  FInplaceCol := -1;
  FInplaceRow := -1;
  UpdateEdit;
end;

procedure TIvCustomGrid.ReadColWidths(Reader: TReader);
var
  I: Integer;
begin
  with Reader do
  begin
    ReadListBegin;
    for I := 0 to ColCount - 1 do ColWidths[I] := ReadInteger;
    ReadListEnd;
  end;
end;

procedure TIvCustomGrid.ReadRowHeights(Reader: TReader);
var
  I: Integer;
begin
  with Reader do
  begin
    ReadListBegin;
    for I := 0 to RowCount - 1 do RowHeights[I] := ReadInteger;
    ReadListEnd;
  end;
end;

procedure TIvCustomGrid.WriteColWidths(Writer: TWriter);
var
  I: Integer;
begin
  with Writer do
  begin
    WriteListBegin;
    for I := 0 to ColCount - 1 do WriteInteger(ColWidths[I]);
    WriteListEnd;
  end;
end;

procedure TIvCustomGrid.WriteRowHeights(Writer: TWriter);
var
  I: Integer;
begin
  with Writer do
  begin
    WriteListBegin;
    for I := 0 to RowCount - 1 do WriteInteger(RowHeights[I]);
    WriteListEnd;
  end;
end;

procedure TIvCustomGrid.DefineProperties(Filer: TFiler);

  function DoColWidths: Boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not CompareExtents(TIvCustomGrid(Filer.Ancestor).FColWidths, FColWidths)
    else
      Result := FColWidths <> nil;
  end;

  function DoRowHeights: Boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not CompareExtents(TIvCustomGrid(Filer.Ancestor).FRowHeights, FRowHeights)
    else
      Result := FRowHeights <> nil;
  end;


begin
  inherited DefineProperties(Filer);
  if FSaveCellExtents then
    with Filer do
    begin
      DefineProperty('ColWidths', ReadColWidths, WriteColWidths, DoColWidths);
      DefineProperty('RowHeights', ReadRowHeights, WriteRowHeights, DoRowHeights);
    end;
end;

procedure TIvCustomGrid.MoveColumn(FromIndex, ToIndex: Longint);
var
  Rect: TIvGridRect;
begin
  if FromIndex = ToIndex then
    Exit;

  if Assigned(FColWidths) then
  begin
    MoveExtent(FColWidths, FromIndex + 1, ToIndex + 1);
    MoveExtent(FTabStops, FromIndex + 1, ToIndex + 1);
  end;
  MoveAdjust(FCurrent.X, FromIndex, ToIndex);
  MoveAdjust(FAnchor.X, FromIndex, ToIndex);
  MoveAdjust(FInplaceCol, FromIndex, ToIndex);
  Rect.Top := 0;
  Rect.Bottom := VisibleRowCount;
  if FromIndex < ToIndex then
  begin
    Rect.Left := FromIndex;
    Rect.Right := ToIndex;
  end
  else
  begin
    Rect.Left := ToIndex;
    Rect.Right := FromIndex;
  end;
  InvalidateRect(Rect);
  ColumnMoved(FromIndex, ToIndex);
  if Assigned(FColWidths) then
    ColWidthsChanged;
  UpdateEdit;
end;

procedure TIvCustomGrid.ColumnMoved(FromIndex, ToIndex: Longint);
begin
end;

procedure TIvCustomGrid.MoveRow(FromIndex, ToIndex: Longint);
begin
  if Assigned(FRowHeights) then
    MoveExtent(FRowHeights, FromIndex + 1, ToIndex + 1);
  MoveAdjust(FCurrent.Y, FromIndex, ToIndex);
  MoveAdjust(FAnchor.Y, FromIndex, ToIndex);
  MoveAdjust(FInplaceRow, FromIndex, ToIndex);
  RowMoved(FromIndex, ToIndex);
  if Assigned(FRowHeights) then
    RowHeightsChanged;
  UpdateEdit;
end;

procedure TIvCustomGrid.RowMoved(FromIndex, ToIndex: Longint);
begin
end;

function TIvCustomGrid.MouseCoord(X, Y: Integer): TIvGridCoord;
var
  DrawInfo: TIvGridDrawInfo;
begin
  CalcDrawInfo(DrawInfo);
  Result := CalcCoordFromPoint(X, Y, DrawInfo);
  if Result.X < 0 then Result.Y := -1
  else if Result.Y < 0 then Result.X := -1;
end;

procedure TIvCustomGrid.MoveColRow(ACol, ARow: Longint; MoveAnchor,
  Show: Boolean);
begin
  MoveCurrent(ACol, ARow, MoveAnchor, Show);
end;

function TIvCustomGrid.SelectCell(ACol, ARow: Longint): Boolean;
begin
  Result := True;
end;

procedure TIvCustomGrid.SizeChanged(OldColCount, OldRowCount: Longint);
begin
end;

function TIvCustomGrid.Sizing(X, Y: Integer): Boolean;
var
  DrawInfo: TIvGridDrawInfo;
  State: TIvGridState;
  Index: Longint;
  Pos, Ofs: Integer;
begin
  State := FGridState;
  if State = gsNormal then
  begin
    CalcDrawInfo(DrawInfo);
    CalcSizingState(X, Y, State, Index, Pos, Ofs, DrawInfo);
  end;
  Result := State <> gsNormal;
end;

procedure TIvCustomGrid.TopLeftChanged;
begin
  if FEditorMode and (FInplaceEdit <> nil) then
    FInplaceEdit.UpdateLoc(CellRect(Col, Row));
end;

procedure FillDWord(var Dest; Count, Value: Integer); register;
asm
  XCHG  EDX, ECX
  PUSH  EDI
  MOV   EDI, EAX
  MOV   EAX, EDX
  REP   STOSD
  POP   EDI
end;

{ StackAlloc allocates a 'small' block of memory from the stack by
  decrementing SP.  This provides the allocation speed of a local variable,
  but the runtime size flexibility of heap allocated memory.  }
function StackAlloc(Size: Integer): Pointer; register;
asm
  POP   ECX          { return address }
  MOV   EDX, ESP
  ADD   EAX, 3
  AND   EAX, not 3   // round up to keep ESP dword aligned
  CMP   EAX, 4092
  JLE   @@2
@@1:
  SUB   ESP, 4092
  PUSH  EAX          { make sure we touch guard page, to grow stack }
  SUB   EAX, 4096
  JNS   @@1
  ADD   EAX, 4096
@@2:
  SUB   ESP, EAX
  MOV   EAX, ESP     { function result = low memory address of block }
  PUSH  EDX          { save original SP, for cleanup }
  MOV   EDX, ESP
  SUB   EDX, 4
  PUSH  EDX          { save current SP, for sanity check  (sp = [sp]) }
  PUSH  ECX          { return to caller }
end;

{ StackFree pops the memory allocated by StackAlloc off the stack.
- Calling StackFree is optional - SP will be restored when the calling routine
  exits, but it's a good idea to free the stack allocated memory ASAP anyway.
- StackFree must be called in the same stack context as StackAlloc - not in
  a subroutine or finally block.
- Multiple StackFree calls must occur in reverse order of their corresponding
  StackAlloc calls.
- Built-in sanity checks guarantee that an improper call to StackFree will not
  corrupt the stack. Worst case is that the stack block is not released until
  the calling routine exits. }
procedure StackFree(P: Pointer); register;
asm
  POP   ECX                     { return address }
  MOV   EDX, DWORD PTR [ESP]
  SUB   EAX, 8
  CMP   EDX, ESP                { sanity check #1 (SP = [SP]) }
  JNE   @@1
  CMP   EDX, EAX                { sanity check #2 (P = this stack block) }
  JNE   @@1
  MOV   ESP, DWORD PTR [ESP+4]  { restore previous SP  }
@@1:
  PUSH  ECX                     { return to caller }
end;

procedure TIvCustomGrid.Paint;
var
  LineColor: TColor;
  drawInfo: TIvGridDrawInfo;
  Sel: TIvGridRect;
  UpdateRect: TRect;
  FocRect: TRect;
  PointsList: PIntArray;
  StrokeList: PIntArray;
  MaxStroke: Integer;
  FrameFlags1, FrameFlags2: DWORD;

  procedure DrawLines(
    DoHorz, DoVert: Boolean;
    Col, Row: Longint;
    const CellBounds: array of Integer;
    OnColor, OffColor: TColor);

  { Cellbounds is 4 integers: StartX, StartY, StopX, StopY
    Horizontal lines:  MajorIndex = 0
    Vertical lines:    MajorIndex = 1 }

  const
    FlatPenStyle = PS_Geometric or PS_Solid or PS_EndCap_Flat or PS_Join_Miter;

    procedure DrawAxisLines(
      const AxisInfo: TIvGridAxisDrawInfo;
      horiz: Boolean;
      Cell, MajorIndex: Integer;
      UseOnColor: Boolean);
    var
      Line: Integer;
      LogBrush: TLOGBRUSH;
      Index: Integer;
      Points: PIntArray;
      StopMajor, StartMinor, StopMinor: Integer;
    begin
      with Canvas, AxisInfo do
      begin
        if EffectiveLineWidth <> 0 then
        begin
          Pen.Width := GridLineWidth;
          if UseOnColor then
            Pen.Color := OnColor
          else
            Pen.Color := OffColor;
          if Pen.Width > 1 then
          begin
            LogBrush.lbStyle := BS_Solid;
            LogBrush.lbColor := Pen.Color;
            LogBrush.lbHatch := 0;
            Pen.Handle := ExtCreatePen(FlatPenStyle, Pen.Width, LogBrush, 0, nil);
          end;
          Points := PointsList;
          Line := CellBounds[MajorIndex] + EffectiveLineWidth shr 1 +
            GetExtent(Cell);
          StartMinor := CellBounds[MajorIndex xor 1];
          StopMinor := CellBounds[2 + (MajorIndex xor 1)];
          StopMajor := CellBounds[2 + MajorIndex] + EffectiveLineWidth;
          Index := 0;
          repeat
{$IFDEF IVPRO32}
            if IvIsLocaleBidirectional(FLocale) then
            begin
              if horiz then
              begin
                Points^[Index + MajorIndex] := ClientWidth - Line - 1;  { MoveTo }
                Points^[Index + (MajorIndex xor 1)] :=  StartMinor;
                Inc(Index, 2);
                Points^[Index + MajorIndex] := ClientWidth - Line - 1;  { LineTo }
                Points^[Index + (MajorIndex xor 1)] := StopMinor;
                Inc(Index, 2);
              end
              else
              begin
                Points^[Index + MajorIndex] := Line;  { MoveTo }
                Points^[Index + (MajorIndex xor 1)] := ClientWidth - StartMinor;
                Inc(Index, 2);
                Points^[Index + MajorIndex] := Line;  { LineTo }
                Points^[Index + (MajorIndex xor 1)] := ClientWidth - StopMinor;
                Inc(Index, 2);
              end;
            end
            else
{$ENDIF}
            begin
              Points^[Index + MajorIndex] := Line;         { MoveTo }
              Points^[Index + (MajorIndex xor 1)] := StartMinor;
              Inc(Index, 2);
              Points^[Index + MajorIndex] := Line;         { LineTo }
              Points^[Index + (MajorIndex xor 1)] := StopMinor;
              Inc(Index, 2);
            end;
            Inc(Cell);
            Inc(Line, GetExtent(Cell) + EffectiveLineWidth);
          until Line > StopMajor;
           { 2 integers per point, 2 points per line -> Index div 4 }
          PolyPolyLine(Canvas.Handle, Points^, StrokeList^, Index shr 2);
        end;
      end;
    end;

  begin
    if (CellBounds[0] = CellBounds[2]) or (CellBounds[1] = CellBounds[3]) then
      Exit;

    if not DoHorz then
    begin
      DrawAxisLines(DrawInfo.Vert, False, Row, 1, DoHorz);
      DrawAxisLines(DrawInfo.Horz, True, Col, 0, DoVert);
    end
    else
    begin
      DrawAxisLines(DrawInfo.Horz, True, Col, 0, DoVert);
      DrawAxisLines(DrawInfo.Vert, False, Row, 1, DoHorz);
    end;
  end;

  procedure DrawCells(
    aCol, aRow: Longint;
    startX, startY, stopX, stopY: Integer;
    color: TColor;
    includeDrawState: TIvGridDrawState);
  var
    curCol, curRow: Longint;
    where, tempRect: TRect;
    drawState: TIvGridDrawState;
    focused: Boolean;
  begin
{$IFDEF IVPRO32}
    if IvIsLocaleBidirectional(FLocale) then
    begin
      // Right-aligned grid

      startX := ClientWidth - startX;
      stopX := ClientWidth - stopX;

      curRow := aRow;
      where.Top := startY;
      while (where.Top < stopY) and (curRow < rowCount) do
      begin
        curCol := aCol;
        where.Left := startX - ColWidths[curCol];
        where.Right := where.Left + ColWidths[curCol];
        where.Bottom := where.Top + RowHeights[curRow];

        while (where.Right > stopX) and (curCol < colCount) do
        begin
          if RectVisible(Canvas.Handle, Where) then
          begin
            DrawState := IncludeDrawState;
            Focused := IsActiveControl;
            if Focused and (CurRow = Row) and (CurCol = Col)  then
              Include(DrawState, gdFocused);
            if PointInGridRect(CurCol, CurRow, Sel) then
              Include(DrawState, gdSelected);

            if not (gdFocused in DrawState) or not (goEditing in Options) or
              not FEditorMode or (csDesigning in ComponentState) then
            begin
              if DefaultDrawing or (csDesigning in ComponentState) then
              begin
                with Canvas do
                begin
                  Font := Self.Font;
                  if (gdSelected in DrawState) and
                    (not (gdFocused in DrawState) or
                    ([goDrawFocusSelected, goRowSelect] * Options <> [])) then
                  begin
                    Brush.Color := clHighlight;
                    Font.Color := clHighlightText;
                  end
                  else
                    Brush.Color := Color;
                  FillRect(where);
                end;
              end;

              DrawCell(curCol, curRow, where, drawState);

              if DefaultDrawing and (gdFixed in DrawState) and Ctl3D and
                ((FrameFlags1 or FrameFlags2) <> 0) then
              begin
                tempRect := where;
                if (FrameFlags1 and BF_RIGHT) = 0 then
                  Inc(tempRect.Right, DrawInfo.Horz.EffectiveLineWidth)
                else if (FrameFlags1 and BF_BOTTOM) = 0 then
                  Inc(tempRect.Bottom, DrawInfo.Vert.EffectiveLineWidth);
                DrawEdge(Canvas.Handle, tempRect, BDR_RAISEDINNER, FrameFlags1);
                DrawEdge(Canvas.Handle, tempRect, BDR_RAISEDINNER, FrameFlags2);
              end;

              if DefaultDrawing and not (csDesigning in ComponentState) and
                (gdFocused in DrawState) and
                ([goEditing, goAlwaysShowEditor]*Options <> [goEditing, goAlwaysShowEditor]) and
                not (goRowSelect in Options) then
              begin
                DrawFocusRect(Canvas.Handle, where);
              end;
            end;
          end;
          Inc(curCol);
          where.Left := where.Left - ColWidths[curCol] - drawInfo.Horz.EffectiveLineWidth;
          where.Right := where.Left + ColWidths[curCol];
        end;
        where.Top := where.Bottom + drawInfo.Vert.EffectiveLineWidth;
        Inc(curRow);
      end;
    end
    else
{$ENDIF}
    begin
      // Left-aligned grid

      curRow := aRow;
      where.Top := startY;
      while (where.Top < stopY) and (curRow < rowCount) do
      begin
        curCol := aCol;
        where.Left := StartX;
        where.Bottom := where.Top + RowHeights[CurRow];

        while (where.Left < stopX) and (curCol < colCount) do
        begin
          where.Right := where.Left + ColWidths[CurCol];
          if RectVisible(Canvas.Handle, Where) then
          begin
            DrawState := IncludeDrawState;
            Focused := IsActiveControl;
            if Focused and (CurRow = Row) and (CurCol = Col)  then
              Include(DrawState, gdFocused);
            if PointInGridRect(CurCol, CurRow, Sel) then
              Include(DrawState, gdSelected);

            if not (gdFocused in DrawState) or not (goEditing in Options) or
              not FEditorMode or (csDesigning in ComponentState) then
            begin
              if DefaultDrawing or (csDesigning in ComponentState) then
              begin
                with Canvas do
                begin
                  Font := Self.Font;
                  if (gdSelected in DrawState) and
                    (not (gdFocused in DrawState) or
                    ([goDrawFocusSelected, goRowSelect] * Options <> [])) then
                  begin
                    Brush.Color := clHighlight;
                    Font.Color := clHighlightText;
                  end
                  else
                    Brush.Color := Color;
                  FillRect(where);
                end;
              end;

              DrawCell(curCol, curRow, where, drawState);

              if DefaultDrawing and (gdFixed in DrawState) and Ctl3D and
                ((FrameFlags1 or FrameFlags2) <> 0) then
              begin
                tempRect := where;
                if (FrameFlags1 and BF_RIGHT) = 0 then
                  Inc(tempRect.Right, DrawInfo.Horz.EffectiveLineWidth)
                else if (FrameFlags1 and BF_BOTTOM) = 0 then
                  Inc(tempRect.Bottom, DrawInfo.Vert.EffectiveLineWidth);
                DrawEdge(Canvas.Handle, tempRect, BDR_RAISEDINNER, FrameFlags1);
                DrawEdge(Canvas.Handle, tempRect, BDR_RAISEDINNER, FrameFlags2);
              end;

              if DefaultDrawing and not (csDesigning in ComponentState) and
                (gdFocused in DrawState) and
                ([goEditing, goAlwaysShowEditor]*Options <> [goEditing, goAlwaysShowEditor]) and
                not (goRowSelect in Options) then
              begin
                DrawFocusRect(Canvas.Handle, where);
              end;
            end;
          end;
          where.Left := where.Right + drawInfo.Horz.EffectiveLineWidth;
          Inc(curCol);
        end;
        where.Top := where.Bottom + drawInfo.Vert.EffectiveLineWidth;
        Inc(curRow);
      end;
    end;
  end;

begin
  UpdateRect := Canvas.ClipRect;
  CalcDrawInfo(DrawInfo);

  if (drawInfo.Horz.EffectiveLineWidth > 0) or (drawInfo.Vert.EffectiveLineWidth > 0) then
  begin
    { Draw the grid line in the four areas (fixed, fixed), (variable, fixed),
      (fixed, variable) and (variable, variable) }

    LineColor := clSilver;
    MaxStroke := IMax(drawInfo.Horz.LastFullVisibleCell - LeftCol + FixedCols,
                      drawInfo.Vert.LastFullVisibleCell - TopRow + FixedRows) + 3;
    PointsList := StackAlloc(MaxStroke * sizeof(TPoint) * 2);
    StrokeList := StackAlloc(MaxStroke * sizeof(Integer));
    FillDWord(StrokeList^, MaxStroke, 2);

    if ColorToRGB(Color) = clSilver then
      LineColor := clGray;
    DrawLines(goFixedHorzLine in Options, goFixedVertLine in Options,
      0, 0, [0, 0, drawInfo.Horz.FixedBoundary, drawInfo.Vert.FixedBoundary], clBlack, FixedColor);
    DrawLines(goFixedHorzLine in Options, goFixedVertLine in Options,
      LeftCol, 0, [drawInfo.Horz.FixedBoundary, 0, drawInfo.Horz.GridBoundary,
      drawInfo.Vert.FixedBoundary], clBlack, FixedColor);
    DrawLines(goFixedHorzLine in Options, goFixedVertLine in Options,
      0, TopRow, [0, drawInfo.Vert.FixedBoundary, drawInfo.Horz.FixedBoundary,
      drawInfo.Vert.GridBoundary], clBlack, FixedColor);
    DrawLines(goHorzLine in Options, goVertLine in Options, LeftCol,
      TopRow, [drawInfo.Horz.FixedBoundary, drawInfo.Vert.FixedBoundary, drawInfo.Horz.GridBoundary,
      drawInfo.Vert.GridBoundary], LineColor, Color);

    StackFree(StrokeList);
    StackFree(PointsList);
  end;

  { Draw the cells in the four areas }
  Sel := Selection;
  FrameFlags1 := 0;
  FrameFlags2 := 0;
  if goFixedVertLine in Options then
  begin
    FrameFlags1 := BF_RIGHT;
    FrameFlags2 := BF_LEFT;
  end;
  if goFixedHorzLine in Options then
  begin
    FrameFlags1 := FrameFlags1 or BF_BOTTOM;
    FrameFlags2 := FrameFlags2 or BF_TOP;
  end;
  DrawCells(0, 0, 0, 0, drawInfo.Horz.FixedBoundary, drawInfo.Vert.FixedBoundary, FixedColor,
    [gdFixed]);
  DrawCells(LeftCol, 0, drawInfo.Horz.FixedBoundary - FColOffset, 0, drawInfo.Horz.GridBoundary,  //!! clip
    drawInfo.Vert.FixedBoundary, FixedColor, [gdFixed]);
  DrawCells(0, TopRow, 0, drawInfo.Vert.FixedBoundary, drawInfo.Horz.FixedBoundary,
    drawInfo.Vert.GridBoundary, FixedColor, [gdFixed]);
  DrawCells(LeftCol, TopRow, drawInfo.Horz.FixedBoundary - FColOffset,                   //!! clip
    drawInfo.Vert.FixedBoundary, drawInfo.Horz.GridBoundary, drawInfo.Vert.GridBoundary, Color, []);

  if not (csDesigning in ComponentState) and
    (goRowSelect in Options) and DefaultDrawing and Focused then
  begin
    GridRectToScreenRect(GetSelection, FocRect, False);
    Canvas.DrawFocusRect(FocRect);
  end;

  { Fill in area not occupied by cells }
  if drawInfo.Horz.GridBoundary < drawInfo.Horz.GridExtent then
  begin
    Canvas.Brush.Color := Color;
{$IFDEF IVPRO32}
    if IvIsLocaleBidirectional(FLocale) then
      Canvas.FillRect(Rect(ClientWidth - drawInfo.Horz.GridBoundary, 0, ClientWidth - drawInfo.Horz.GridExtent, drawInfo.Vert.GridBoundary))
    else
{$ENDIF}
      Canvas.FillRect(Rect(drawInfo.Horz.GridBoundary, 0, drawInfo.Horz.GridExtent, drawInfo.Vert.GridBoundary));
  end;
  if drawInfo.Vert.GridBoundary < drawInfo.Vert.GridExtent then
  begin
    Canvas.Brush.Color := Color;
    Canvas.FillRect(Rect(0, drawInfo.Vert.GridBoundary, drawInfo.Horz.GridExtent, drawInfo.Vert.GridExtent));
  end;
end;

function TIvCustomGrid.CalcCoordFromPoint(
  x, y: Integer;
  const drawInfo: TIvGridDrawInfo): TIvGridCoord;

  function DoCalc(const axisInfo: TIvGridAxisDrawInfo; n: Integer): Integer;
  var
    i, start, stop: Longint;
    line: Integer;
  begin
{$IFDEF IVPRO32}
    if IvIsLocaleBidirectional(FLocale) and (axisInfo.AxisType = gaHorizontal) then
    begin
      if n > ClientWidth - axisInfo.FixedBoundary then
      begin
        start := 0;
        stop := axisInfo.FixedCellCount - 1;
        line := 0;
      end
      else
      begin
        start := axisInfo.FirstGridCell;
        stop := axisInfo.GridCellCount - 1;
        line := ClientWidth - axisInfo.FixedBoundary;
      end;

      Result := -1;
      for i := Start to Stop do
      begin
        Dec(Line, axisInfo.GetExtent(i) + axisInfo.EffectiveLineWidth);
        if n > line then
        begin
          Result := i;
          Exit;
        end;
      end;
    end
    else
{$ENDIF}
    begin
      if n < axisInfo.FixedBoundary then
      begin
        Start := 0;
        Stop := axisInfo.FixedCellCount - 1;
        Line := 0;
      end
      else
      begin
        Start := axisInfo.FirstGridCell;
        Stop := axisInfo.GridCellCount - 1;
        Line := axisInfo.FixedBoundary;
      end;

      Result := -1;
      for i := Start to Stop do
      begin
        Inc(line, axisInfo.GetExtent(i) + axisInfo.EffectiveLineWidth);
        if n < line then
        begin
          Result := i;
          Exit;
        end;
      end;
    end;
  end;

begin
  Result.X := DoCalc(drawInfo.Horz, x);
  Result.Y := DoCalc(drawInfo.Vert, y);
end;

procedure TIvCustomGrid.CalcDrawInfo(var DrawInfo: TIvGridDrawInfo);
begin
  CalcDrawInfoXY(DrawInfo, ClientWidth, ClientHeight);
end;

procedure TIvCustomGrid.CalcDrawInfoXY(
  var drawInfo: TIvGridDrawInfo;
  useWidth, useHeight: Integer);

  procedure CalcAxis(var axisInfo: TIvGridAxisDrawInfo; useExtent: Integer);
  var
    i: Integer;
  begin
    axisInfo.GridExtent := useExtent;
    axisInfo.GridBoundary := axisInfo.FixedBoundary;
    axisInfo.FullVisBoundary := axisInfo.FixedBoundary;
    axisInfo.LastFullVisibleCell := axisInfo.FirstGridCell;
    for i := axisInfo.FirstGridCell to axisInfo.GridCellCount - 1 do
    begin
      Inc(axisInfo.GridBoundary, axisInfo.GetExtent(i) + axisInfo.EffectiveLineWidth);
      if axisInfo.GridBoundary > axisInfo.GridExtent + axisInfo.EffectiveLineWidth then
      begin
        axisInfo.GridBoundary := axisInfo.GridExtent;
        Break;
      end;
      axisInfo.LastFullVisibleCell := i;
      axisInfo.FullVisBoundary := axisInfo.GridBoundary;
    end;
  end;

begin
  drawInfo.Horz.AxisType := gaHorizontal;
  drawInfo.Vert.AxisType := gaVertical;
  CalcFixedInfo(drawInfo);
  CalcAxis(drawInfo.Horz, useWidth);
  CalcAxis(drawInfo.Vert, useHeight);
end;

procedure TIvCustomGrid.CalcFixedInfo(var drawInfo: TIvGridDrawInfo);

  procedure CalcFixedAxis(
    var axis: TIvGridAxisDrawInfo;
    lineOptions: TIvGridOptions;
    fixedCount, firstCell, cellCount: Integer;
    getExtentFunc: TIvGetExtentsFunc);
  var
    i: Integer;
  begin
    if lineOptions*options = [] then
      axis.EffectiveLineWidth := 0
    else
      axis.EffectiveLineWidth := GridLineWidth;
      
    axis.FixedBoundary := 0;
    for i := 0 to fixedCount - 1 do
      Inc(axis.FixedBoundary, GetExtentFunc(i) + axis.EffectiveLineWidth);

    axis.FixedCellCount := fixedCount;
    axis.FirstGridCell := firstCell;
    axis.GridCellCount := cellCount;
    axis.GetExtent := getExtentFunc;
  end;

begin
  CalcFixedAxis(
    drawInfo.Horz,
    [goFixedVertLine, goVertLine],
    fixedCols,
    leftCol,
    colCount,
    getColWidths);
  CalcFixedAxis(
    drawInfo.Vert,
    [goFixedHorzLine, goHorzLine],
    fixedRows,
    topRow,
    rowCount,
    getRowHeights);
end;

{ Calculates the TopLeft that will put the given Coord in view }
function TIvCustomGrid.CalcMaxTopLeft(const Coord: TIvGridCoord;
  const DrawInfo: TIvGridDrawInfo): TIvGridCoord;

  function CalcMaxCell(const Axis: TIvGridAxisDrawInfo; Start: Integer): Integer;
  var
    Line: Integer;
    I: Longint;
  begin
    Result := Start;
    with Axis do
    begin
      Line := GridExtent + EffectiveLineWidth;
      for I := Start downto FixedCellCount do
      begin
        Dec(Line, GetExtent(I));
        Dec(Line, EffectiveLineWidth);
        if Line < FixedBoundary then Break;
        Result := I;
      end;
    end;
  end;

begin
  Result.X := CalcMaxCell(DrawInfo.Horz, Coord.X);
  Result.Y := CalcMaxCell(DrawInfo.Vert, Coord.Y);
end;

procedure TIvCustomGrid.CalcSizingState(
  x, y: Integer;
  var state: TIvGridState;
  var index: Longint;
  var sizingPos, sizingOfs: Integer;
  var fixedInfo: TIvGridDrawInfo);

  procedure CalcAxisState(
    const axisInfo: TIvGridAxisDrawInfo;
    pos: Integer;
    newState: TIvGridState);
  var
    i, line, back, range: Integer;
  begin
{$IFDEF IVPRO32}
    if IvIsLocaleBidirectional(FLocale) and (axisInfo.AxisType = gaHorizontal) then
      line := ClientWidth - axisInfo.FixedBoundary
    else
{$ENDIF}
      line := axisInfo.FixedBoundary;

    range := axisInfo.EffectiveLineWidth;
    back := 0;
    if range < 7 then
    begin
      range := 7;
      back := (range - axisInfo.EffectiveLineWidth) shr 1;
    end;

    for i := axisInfo.FirstGridCell to axisInfo.GridCellCount - 1 do
    begin
{$IFDEF IVPRO32}
      if IvIsLocaleBidirectional(FLocale) and (axisInfo.AxisType = gaHorizontal) then
        Dec(line, axisInfo.GetExtent(I))
      else
{$ENDIF}
        Inc(line, axisInfo.GetExtent(I));

      // If line is out of grid breaks

{$IFDEF IVPRO32}
      if IvIsLocaleBidirectional(FLocale) and (axisInfo.AxisType = gaHorizontal) then
      begin
        if line < ClientWidth - axisInfo.GridBoundary then
          Break;
      end
      else
{$ENDIF}
      begin
        if line > axisInfo.GridBoundary then
          Break;
      end;

      if (pos >= line - back) and (pos <= line - back + range) then
      begin
        state := newState;
        sizingPos := line;
        sizingOfs := line - pos;
        index := i;
        Exit;
      end;

{$IFDEF IVPRO32}
      if IvIsLocaleBidirectional(FLocale) and (axisInfo.AxisType = gaHorizontal) then
        Dec(line, axisInfo.EffectiveLineWidth)
      else
{$ENDIF}
        Inc(line, axisInfo.EffectiveLineWidth);
    end;

    if (axisInfo.GridBoundary = axisInfo.GridExtent) and
      (pos >= axisInfo.GridExtent - back) and
      (pos <= axisInfo.GridExtent) then
    begin
      state := newState;
      sizingPos := axisInfo.GridExtent;
      sizingOfs := axisInfo.GridExtent - pos;
      index := axisInfo.LastFullVisibleCell + 1;
    end;
  end;

var
  effectiveOptions: TIvGridOptions;
begin
  state := gsNormal;
  index := -1;
  effectiveOptions := Options;
  if csDesigning in ComponentState then
    effectiveOptions := effectiveOptions + DesignOptionsBoost;

  if [goColSizing, goRowSizing]*effectiveOptions <> [] then
  begin
    fixedInfo.Vert.GridExtent := ClientHeight;
    fixedInfo.Horz.GridExtent := ClientWidth;
{$IFDEF IVPRO32}
    if IvIsLocaleBidirectional(FLocale) then
    begin
      if (x < ClientWidth - fixedInfo.Horz.FixedBoundary) and (goColSizing in effectiveOptions) then
      begin
        if y >= fixedInfo.Vert.FixedBoundary then
          Exit;
        CalcAxisState(fixedInfo.Horz, x, gsColSizing);
      end
      else if (y > fixedInfo.Vert.FixedBoundary) and (goRowSizing in EffectiveOptions) then
      begin
        if x < ClientWidth - fixedInfo.Horz.FixedBoundary then
          Exit;
        CalcAxisState(fixedInfo.Vert, Y, gsRowSizing);
      end;
    end
    else
{$ENDIF}
    begin
      if (x > fixedInfo.Horz.FixedBoundary) and (goColSizing in effectiveOptions) then
      begin
        if y >= fixedInfo.Vert.FixedBoundary then
          Exit;
        CalcAxisState(fixedInfo.Horz, x, gsColSizing);
      end
      else if (y > fixedInfo.Vert.FixedBoundary) and (goRowSizing in EffectiveOptions) then
      begin
        if x >= fixedInfo.Horz.FixedBoundary then
          Exit;
        CalcAxisState(fixedInfo.Vert, Y, gsRowSizing);
      end;
    end;
  end;
end;

procedure TIvCustomGrid.ChangeSize(NewColCount, NewRowCount: Longint);
var
  OldColCount, OldRowCount: Longint;
  OldDrawInfo: TIvGridDrawInfo;

  procedure MinRedraw(const OldInfo, NewInfo: TIvGridAxisDrawInfo; Axis: Integer);
  var
    R: TRect;
    First: Integer;
  begin
    if (OldInfo.LastFullVisibleCell = NewInfo.LastFullVisibleCell) then Exit;
    First := IMin(OldInfo.LastFullVisibleCell, NewInfo.LastFullVisibleCell);
    // Get the rectangle around the leftmost or topmost cell in the target range.
    R := CellRect(First and not Axis, First and Axis);
    R.Bottom := Height;
    R.Right := Width;
    Windows.InvalidateRect(Handle, @R, False);
  end;

  procedure DoChange;
  var
    Coord: TIvGridCoord;
    NewDrawInfo: TIvGridDrawInfo;
  begin
    if FColWidths <> nil then
    begin
      UpdateExtents(FColWidths, ColCount, DefaultColWidth);
      UpdateExtents(FTabStops, ColCount, Integer(True));
    end;

    if FRowHeights <> nil then
      UpdateExtents(FRowHeights, RowCount, DefaultRowHeight);

    Coord := FCurrent;
    if Row >= RowCount then
      Coord.Y := RowCount - 1;
    if Col >= ColCount then
      Coord.X := ColCount - 1;
    if (FCurrent.X <> Coord.X) or (FCurrent.Y <> Coord.Y) then
      MoveCurrent(Coord.X, Coord.Y, True, True);
    if (FAnchor.X <> Coord.X) or (FAnchor.Y <> Coord.Y) then
      MoveAnchor(Coord);
    if VirtualView or
      (LeftCol <> OldDrawInfo.Horz.FirstGridCell) or
      (TopRow <> OldDrawInfo.Vert.FirstGridCell) then
      InvalidateGrid
    else if HandleAllocated then
    begin
      CalcDrawInfo(NewDrawInfo);
      MinRedraw(OldDrawInfo.Horz, NewDrawInfo.Horz, 0);
      MinRedraw(OldDrawInfo.Vert, NewDrawInfo.Vert, -1);
    end;
    while FColLocale.Count < FColCount do
      FColLocale.Add(Pointer(0));
    UpdateScrollRange;
    SizeChanged(OldColCount, OldRowCount);
  end;

begin
  if HandleAllocated then
    CalcDrawInfo(OldDrawInfo);
  OldColCount := FColCount;
  OldRowCount := FRowCount;
  FColCount := NewColCount;
  FRowCount := NewRowCount;
  if FixedCols > NewColCount then FFixedCols := NewColCount - 1;
  if FixedRows > NewRowCount then FFixedRows := NewRowCount - 1;
  try
    DoChange;
  except
    { Could not change size so try to clean up by setting the size back }
    FColCount := OldColCount;
    FRowCount := OldRowCount;
    DoChange;
    InvalidateGrid;
    raise;
  end;
end;

{ Will move TopLeft so that Coord is in view }
procedure TIvCustomGrid.ClampInView(const Coord: TIvGridCoord);
var
  DrawInfo: TIvGridDrawInfo;
  MaxTopLeft: TIvGridCoord;
  OldTopLeft: TIvGridCoord;
begin
  if not HandleAllocated then Exit;
  CalcDrawInfo(DrawInfo);
  with DrawInfo, Coord do
  begin
    if (X > Horz.LastFullVisibleCell) or
      (Y > Vert.LastFullVisibleCell) or (X < LeftCol) or (Y < TopRow) then
    begin
      OldTopLeft := FTopLeft;
      MaxTopLeft := CalcMaxTopLeft(Coord, DrawInfo);
      Update;
      if X < LeftCol then FTopLeft.X := X
      else if X > Horz.LastFullVisibleCell then FTopLeft.X := MaxTopLeft.X;
      if Y < TopRow then FTopLeft.Y := Y
      else if Y > Vert.LastFullVisibleCell then FTopLeft.Y := MaxTopLeft.Y;
      TopLeftMoved(OldTopLeft);
    end;
  end;
end;

procedure TIvCustomGrid.DrawSizingLine(const DrawInfo: TIvGridDrawInfo);
var
  OldPen: TPen;
begin
  OldPen := TPen.Create;
  try
    with Canvas, DrawInfo do
    begin
      OldPen.Assign(Pen);
      Pen.Style := psDot;
      Pen.Mode := pmXor;
      Pen.Width := 1;
      try
        if FGridState = gsRowSizing then
        begin
{$IFDEF IVPRO32}
          if IvIsLocaleBidirectional(FLocale) then
          begin
            MoveTo(ClientWidth - Horz.GridBoundary, FSizingPos);
            LineTo(ClientWidth, FSizingPos);
          end
          else
{$ENDIF}
          begin
            MoveTo(0, FSizingPos);
            LineTo(Horz.GridBoundary, FSizingPos);
          end;
        end
        else
        begin
          MoveTo(FSizingPos, 0);
          LineTo(FSizingPos, Vert.GridBoundary);
        end;
      finally
        Pen := OldPen;
      end;
    end;
  finally
    OldPen.Free;
  end;
end;

procedure TIvCustomGrid.DrawMove;
var
  OldPen: TPen;
  Pos: Integer;
  R: TRect;
begin
  OldPen := TPen.Create;
  try
    with Canvas do
    begin
      OldPen.Assign(Pen);
      try
        Pen.Style := psDot;
        Pen.Mode := pmXor;
        Pen.Width := 5;
        if FGridState = gsRowMoving then
        begin
          R := CellRect(0, FMovePos);
          if FMovePos > FMoveIndex then
            Pos := R.Bottom else
            Pos := R.Top;
          MoveTo(0, Pos);
          LineTo(ClientWidth, Pos);
        end
        else
        begin
          R := CellRect(FMovePos, 0);
          if FMovePos > FMoveIndex then
            Pos := R.Right else
            Pos := R.Left;
          MoveTo(Pos, 0);
          LineTo(Pos, ClientHeight);
        end;
      finally
        Canvas.Pen := OldPen;
      end;
    end;
  finally
    OldPen.Free;
  end;
end;

procedure TIvCustomGrid.FocusCell(ACol, ARow: Longint; MoveAnchor: Boolean);
begin
  MoveCurrent(ACol, ARow, MoveAnchor, True);
  UpdateEdit;
  Click;
end;

procedure TIvCustomGrid.GridRectToScreenRect(
  gridRect: TIvGridRect;
  var screenRect: TRect;
  includeLine: Boolean);

  function LinePos(const axisInfo: TIvGridAxisDrawInfo; line: Integer): Integer;
  var
    start, i: Longint;
  begin
    Result := 0;
    if line < axisInfo.FixedCellCount then
      Start := 0
    else
    begin
      if Line >= axisInfo.FirstGridCell then
        Result := axisInfo.FixedBoundary;
      Start := axisInfo.FirstGridCell;
    end;

    for I := Start to Line - 1 do
    begin
      Inc(Result, axisInfo.GetExtent(I) + axisInfo.EffectiveLineWidth);
      if Result > axisInfo.GridExtent then
      begin
        Result := 0;
        Exit;
      end;
    end;
  end;

  function CalcAxis(
    const axisInfo: TIvGridAxisDrawInfo;
    gridRectMin, gridRectMax: Integer;
    var screenRectMin, screenRectMax: Integer): Boolean;
  begin
    Result := False;
    if (GridRectMin >= axisInfo.FixedCellCount) and (GridRectMin < axisInfo.FirstGridCell) then
    begin
      if GridRectMax < axisInfo.FirstGridCell then
      begin
        FillChar(ScreenRect, SizeOf(ScreenRect), 0); { erase partial results }
        Exit;
      end
      else
        GridRectMin := axisInfo.FirstGridCell;
    end;

    if GridRectMax > axisInfo.LastFullVisibleCell then
    begin
      GridRectMax := axisInfo.LastFullVisibleCell;
      if GridRectMax < axisInfo.GridCellCount - 1 then
        Inc(GridRectMax);
      if LinePos(AxisInfo, GridRectMax) = 0 then
        Dec(GridRectMax);
    end;

    screenRectMin := LinePos(AxisInfo, GridRectMin);
    screenRectMax := LinePos(AxisInfo, GridRectMax);
    if screenRectMax = 0 then
      screenRectMax := screenRectMin + axisInfo.GetExtent(GridRectMin)
    else
      Inc(screenRectMax, axisInfo.GetExtent(GridRectMax));

    if screenRectMax > axisInfo.GridExtent then
      screenRectMax := axisInfo.GridExtent;

    if IncludeLine then
      Inc(screenRectMax, axisInfo.EffectiveLineWidth);

    Result := True;
  end;

var
{$IFDEF IVPRO32}
  rect: TRect;
{$ENDIF}
  drawInfo: TIvGridDrawInfo;
begin
  FillChar(screenRect, SizeOf(screenRect), 0);
  if (gridRect.Left > gridRect.Right) or (gridRect.Top > gridRect.Bottom) then
    Exit;
  CalcDrawInfo(drawInfo);

  if gridRect.Left > drawInfo.Horz.LastFullVisibleCell + 1 then
    Exit;
  if gridRect.Top > drawInfo.Vert.LastFullVisibleCell + 1 then
    Exit;

  if CalcAxis(drawInfo.Horz, gridRect.Left, gridRect.Right, screenRect.Left, screenRect.Right) then
  begin
    CalcAxis(
      drawInfo.Vert,
      gridRect.Top,
      gridRect.Bottom,
      screenRect.Top,
      screenRect.Bottom);
  end;

{$IFDEF IVPRO32}
  if IvIsLocaleBidirectional(FLocale) then
  begin
    rect := screenRect;
    rect.Left := ClientWidth - screenRect.Left;
    rect.Right := ClientWidth - screenRect.Right;
    screenRect.Left := rect.Right;
    screenRect.Right := rect.Left;
  end;
{$ENDIF}
end;

procedure TIvCustomGrid.Initialize;
begin
  FTopLeft.X := FixedCols;
  FTopLeft.Y := FixedRows;
  FCurrent := FTopLeft;
  FAnchor := FCurrent;
  if goRowSelect in Options then
    FAnchor.X := ColCount - 1;
end;

procedure TIvCustomGrid.InvalidateCell(ACol, ARow: Longint);
var
  Rect: TIvGridRect;
begin
  Rect.Top := ARow;
  Rect.Left := ACol;
  Rect.Bottom := ARow;
  Rect.Right := ACol;
  InvalidateRect(Rect);
end;

procedure TIvCustomGrid.InvalidateCol(ACol: Longint);
var
  Rect: TIvGridRect;
begin
  if not HandleAllocated then Exit;
  Rect.Top := 0;
  Rect.Left := ACol;
  Rect.Bottom := VisibleRowCount+1;
  Rect.Right := ACol;
  InvalidateRect(Rect);
end;

procedure TIvCustomGrid.InvalidateRow(ARow: Longint);
var
  Rect: TIvGridRect;
begin
  if not HandleAllocated then Exit;
  Rect.Top := ARow;
  Rect.Left := 0;
  Rect.Bottom := ARow;
  Rect.Right := VisibleColCount+1;
  InvalidateRect(Rect);
end;

procedure TIvCustomGrid.InvalidateGrid;
begin
  Invalidate;
end;

procedure TIvCustomGrid.InvalidateRect(ARect: TIvGridRect);
var
  InvalidRect: TRect;
begin
  if not HandleAllocated then Exit;
  GridRectToScreenRect(ARect, InvalidRect, True);
  Windows.InvalidateRect(Handle, @InvalidRect, False);
end;

procedure TIvCustomGrid.ModifyScrollBar(ScrollBar, ScrollCode, Pos: Cardinal);
var
  NewTopLeft, MaxTopLeft: TIvGridCoord;
  DrawInfo: TIvGridDrawInfo;

  function Min: Longint;
  begin
    if ScrollBar = SB_HORZ then
      Result := FixedCols
    else
      Result := FixedRows;
  end;

  function Max: Longint;
  begin
    if ScrollBar = SB_HORZ then
      Result := MaxTopLeft.X
    else
      Result := MaxTopLeft.Y;
  end;

  function PageUp: Longint;
  var
    MaxTopLeft: TIvGridCoord;
  begin
    MaxTopLeft := CalcMaxTopLeft(FTopLeft, DrawInfo);
    if ScrollBar = SB_HORZ then
      Result := FTopLeft.X - MaxTopLeft.X else
      Result := FTopLeft.Y - MaxTopLeft.Y;
    if Result < 1 then Result := 1;
  end;

  function PageDown: Longint;
  var
    DrawInfo: TIvGridDrawInfo;
  begin
    CalcDrawInfo(DrawInfo);
    with DrawInfo do
      if ScrollBar = SB_HORZ then
        Result := Horz.LastFullVisibleCell - FTopLeft.X else
        Result := Vert.LastFullVisibleCell - FTopLeft.Y;
    if Result < 1 then Result := 1;
  end;

  function CalcVerticalScrollBar(Value: Longint): Longint;
  begin
    Result := Value;
    case ScrollCode of
      SB_LINEUP:
        Result := Value - 1;

      SB_LINEDOWN:
        Result := Value + 1;

      SB_PAGEUP:
        Result := Value - PageUp;

      SB_PAGEDOWN:
        Result := Value + PageDown;

      SB_THUMBPOSITION, SB_THUMBTRACK:
        if (goThumbTracking in Options) or (ScrollCode = SB_THUMBPOSITION) then
          Result := Min + LongMulDiv(Pos, Max - Min, IvMaxShortInt);

      SB_BOTTOM:
        Result := Min;

      SB_TOP:
        Result := Min;
    end;
  end;

  function CalcHorizontalScrollBar(Value: Longint): Longint;
  begin
    Result := Value;
    case ScrollCode of
      SB_LINEUP:
{$IFDEF IVPRO32}
        if IvIsLocaleBidirectional(FLocale) then
          Result := Value + 1
        else
{$ENDIF}
          Result := Value - 1;

      SB_LINEDOWN:
{$IFDEF IVPRO32}
        if IvIsLocaleBidirectional(FLocale) then
          Result := Value - 1
        else
{$ENDIF}
          Result := Value + 1;

      SB_PAGEUP:
{$IFDEF IVPRO32}
        if IvIsLocaleBidirectional(FLocale) then
          Result := Value + PageUp
        else
{$ENDIF}
          Result := Value - PageUp;

      SB_PAGEDOWN:
{$IFDEF IVPRO32}
        if IvIsLocaleBidirectional(FLocale) then
          Result := Value - PageDown
        else
{$ENDIF}
          Result := Value + PageDown;

      SB_THUMBPOSITION, SB_THUMBTRACK:
        if (goThumbTracking in Options) or (ScrollCode = SB_THUMBPOSITION) then
        begin
{$IFDEF IVPRO32}
          if IvIsLocaleBidirectional(FLocale) then
            Result := MaxTopLeft.X - (LongMulDiv(Pos, Max - Min, IvMaxShortInt))
          else
{$ENDIF}
            Result := Min + LongMulDiv(Pos, Max - Min, IvMaxShortInt);
        end;

      SB_BOTTOM:
{$IFDEF IVPRO32}
        if IvIsLocaleBidirectional(FLocale) then
          Result := Max
        else
{$ENDIF}
          Result := Min;

      SB_TOP:
{$IFDEF IVPRO32}
        if IvIsLocaleBidirectional(FLocale) then
          Result := Max
        else
{$ENDIF}
          Result := Min;
    end;
  end;

  procedure ModifyPixelScrollBar(Code, Pos: Cardinal);
  var
    NewOffset: Integer;
    OldOffset: Integer;
    R: TIvGridRect;
    GridSpace, ColWidth: Integer;
  begin
    NewOffset := FColOffset;
    ColWidth := ColWidths[DrawInfo.Horz.FirstGridCell];
    GridSpace := ClientWidth - DrawInfo.Horz.FixedBoundary;
    case Code of
      SB_LINEUP: Dec(NewOffset, Canvas.TextWidth('0'));
      SB_LINEDOWN: Inc(NewOffset, Canvas.TextWidth('0'));
      SB_PAGEUP: Dec(NewOffset, GridSpace);
      SB_PAGEDOWN: Inc(NewOffset, GridSpace);
      SB_THUMBPOSITION: NewOffset := Pos;
      SB_THUMBTRACK: if goThumbTracking in Options then NewOffset := Pos;
      SB_BOTTOM: NewOffset := 0;
      SB_TOP: NewOffset := ColWidth - GridSpace;
    end;
    if NewOffset < 0 then
      NewOffset := 0
    else if NewOffset >= ColWidth - GridSpace then
      NewOffset := ColWidth - GridSpace;
    if NewOffset <> FColOffset then
    begin
      OldOffset := FColOffset;
      FColOffset := NewOffset;
      ScrollData(OldOffset - NewOffset, 0);
      FillChar(R, SizeOf(R), 0);
      R.Bottom := FixedRows;
      InvalidateRect(R);
      Update;
      UpdateScrollPos;
    end;
  end;

begin
  if Visible and CanFocus and TabStop and not (csDesigning in ComponentState) then
    SetFocus;
  CalcDrawInfo(DrawInfo);
  if (ScrollBar = SB_HORZ) and (ColCount = 1) then
  begin
    ModifyPixelScrollBar(ScrollCode, Pos);
    Exit;
  end;

  MaxTopLeft.X := ColCount - 1;
  MaxTopLeft.Y := RowCount - 1;
  MaxTopLeft := CalcMaxTopLeft(MaxTopLeft, DrawInfo);
  NewTopLeft := FTopLeft;

  if ScrollBar = SB_HORZ then
    NewTopLeft.X := CalcHorizontalScrollBar(NewTopLeft.X)
  else
    NewTopLeft.Y := CalcVerticalScrollBar(NewTopLeft.Y);

  if NewTopLeft.X < FixedCols then
    NewTopLeft.X := FixedCols
  else if NewTopLeft.X > MaxTopLeft.X then
    NewTopLeft.X := MaxTopLeft.X;

  if NewTopLeft.Y < FixedRows then
    NewTopLeft.Y := FixedRows
  else if NewTopLeft.Y > MaxTopLeft.Y then
    NewTopLeft.Y := MaxTopLeft.Y;

  if (NewTopLeft.X <> FTopLeft.X) or (NewTopLeft.Y <> FTopLeft.Y) then
    MoveTopLeft(NewTopLeft.X, NewTopLeft.Y);
end;

procedure TIvCustomGrid.MoveAdjust(var CellPos: Longint; FromIndex, ToIndex: Longint);
var
  Min, Max: Longint;
begin
  if CellPos = FromIndex then CellPos := ToIndex
  else
  begin
    Min := FromIndex;
    Max := ToIndex;
    if FromIndex > ToIndex then
    begin
      Min := ToIndex;
      Max := FromIndex;
    end;
    if (CellPos >= Min) and (CellPos <= Max) then
      if FromIndex > ToIndex then
        Inc(CellPos) else
        Dec(CellPos);
  end;
end;

procedure TIvCustomGrid.MoveAnchor(const NewAnchor: TIvGridCoord);
var
  OldSel: TIvGridRect;
begin
  if [goRangeSelect, goEditing] * Options = [goRangeSelect] then
  begin
    OldSel := Selection;
    FAnchor := NewAnchor;
    if goRowSelect in Options then FAnchor.X := ColCount - 1;
    ClampInView(NewAnchor);
    SelectionMoved(OldSel);
  end
  else
    MoveCurrent(NewAnchor.X, NewAnchor.Y, True, True);
end;

procedure TIvCustomGrid.MoveCurrent(
  aCol, aRow: Longint;
  moveAnchor, show: Boolean);
var
  oldSel: TIvGridRect;
  oldCurrent: TIvGridCoord;
begin
  if (aCol < 0) or (aRow < 0) or (aCol >= ColCount) or (aRow >= RowCount) then
    InvalidOp(SIndexOutOfRange);

  if SelectCell(aCol, aRow) then
  begin
    oldSel := Selection;
    oldCurrent := FCurrent;
    FCurrent.X := aCol;
    FCurrent.Y := aRow;
    if not (goAlwaysShowEditor in Options) then
      HideEditor;
    if MoveAnchor or not (goRangeSelect in Options) then
    begin
      FAnchor := FCurrent;
      if goRowSelect in Options then
        FAnchor.X := ColCount - 1;
    end;
    if goRowSelect in Options then
      FCurrent.X := FixedCols;
    if Show then
      ClampInView(FCurrent);
    SelectionMoved(OldSel);
    InvalidateCell(oldCurrent.X, oldCurrent.Y);
    InvalidateCell(aCol, aRow);
  end;
end;

procedure TIvCustomGrid.MoveTopLeft(ALeft, ATop: Longint);
var
  OldTopLeft: TIvGridCoord;
begin
  if (ALeft = FTopLeft.X) and (ATop = FTopLeft.Y) then Exit;
  Update;
  OldTopLeft := FTopLeft;
  FTopLeft.X := ALeft;
  FTopLeft.Y := ATop;
  TopLeftMoved(OldTopLeft);
end;

procedure TIvCustomGrid.ResizeCol(Index: Longint; OldSize, NewSize: Integer);
begin
  InvalidateGrid;
end;

procedure TIvCustomGrid.ResizeRow(Index: Longint; OldSize, NewSize: Integer);
begin
  InvalidateGrid;
end;

procedure TIvCustomGrid.SelectionMoved(const OldSel: TIvGridRect);
var
  OldRect, NewRect: TRect;
  AXorRects: TXorRects;
  I: Integer;
begin
  if not HandleAllocated then
    Exit;

  GridRectToScreenRect(OldSel, OldRect, True);
  GridRectToScreenRect(Selection, NewRect, True);
  XorRects(OldRect, NewRect, AXorRects);
  for I := Low(AXorRects) to High(AXorRects) do
    Windows.InvalidateRect(Handle, @AXorRects[I], False);
end;

procedure TIvCustomGrid.ScrollDataInfo(DX, DY: Integer;
  var DrawInfo: TIvGridDrawInfo);
var
  ScrollArea: TRect;
  ScrollFlags: Integer;
begin
  with DrawInfo do
  begin
    ScrollFlags := SW_INVALIDATE;
    if not DefaultDrawing then
      ScrollFlags := ScrollFlags or SW_ERASE;
    { Scroll the area }
    if DY = 0 then
    begin
      { Scroll both the column titles and data area at the same time }
{$IFDEF IVPRO32}
      if IvIsLocaleBidirectional(FLocale) then
      begin
        ScrollArea := Rect(ClientWidth - Horz.GridExtent, 0, ClientWidth - Horz.FixedBoundary, Vert.GridExtent);
        ScrollWindowEx(Handle, -DX, 0, @ScrollArea, @ScrollArea, 0, nil, ScrollFlags);
      end
      else
{$ENDIF}
      begin
        ScrollArea := Rect(Horz.FixedBoundary, 0, Horz.GridExtent, Vert.GridExtent);
        ScrollWindowEx(Handle, DX, 0, @ScrollArea, @ScrollArea, 0, nil, ScrollFlags);
      end;
    end
    else if DX = 0 then
    begin
      { Scroll both the row titles and data area at the same time }
      ScrollArea := Rect(0, Vert.FixedBoundary, Horz.GridExtent, Vert.GridExtent);
      ScrollWindowEx(Handle, 0, DY, @ScrollArea, @ScrollArea, 0, nil, ScrollFlags);
    end
    else
    begin
      { Scroll titles and data area separately }
      { Column titles }
      ScrollArea := Rect(Horz.FixedBoundary, 0, Horz.GridExtent, Vert.FixedBoundary);
      ScrollWindowEx(Handle, DX, 0, @ScrollArea, @ScrollArea, 0, nil, ScrollFlags);
      { Row titles }
      ScrollArea := Rect(0, Vert.FixedBoundary, Horz.FixedBoundary, Vert.GridExtent);
      ScrollWindowEx(Handle, 0, DY, @ScrollArea, @ScrollArea, 0, nil, ScrollFlags);
      { Data area }
      ScrollArea := Rect(Horz.FixedBoundary, Vert.FixedBoundary, Horz.GridExtent,
        Vert.GridExtent);
      ScrollWindowEx(Handle, DX, DY, @ScrollArea, @ScrollArea, 0, nil, ScrollFlags);
    end;
  end;
end;

procedure TIvCustomGrid.ScrollData(DX, DY: Integer);
var
  DrawInfo: TIvGridDrawInfo;
begin
  CalcDrawInfo(DrawInfo);
  ScrollDataInfo(DX, DY, DrawInfo);
end;

procedure TIvCustomGrid.TopLeftMoved(const OldTopLeft: TIvGridCoord);

  function CalcScroll(const AxisInfo: TIvGridAxisDrawInfo;
    OldPos, CurrentPos: Integer; var Amount: Longint): Boolean;
  var
    Start, Stop: Longint;
    I: Longint;
  begin
    Result := False;
    with AxisInfo do
    begin
      if OldPos < CurrentPos then
      begin
        Start := OldPos;
        Stop := CurrentPos;
      end
      else
      begin
        Start := CurrentPos;
        Stop := OldPos;
      end;
      Amount := 0;
      for I := Start to Stop - 1 do
      begin
        Inc(Amount, GetExtent(I) + EffectiveLineWidth);
        if Amount > (GridBoundary - FixedBoundary) then
        begin
          { Scroll amount too big, redraw the whole thing }
          InvalidateGrid;
          Exit;
        end;
      end;
      if OldPos < CurrentPos then Amount := -Amount;
    end;
    Result := True;
  end;

var
  DrawInfo: TIvGridDrawInfo;
  Delta: TIvGridCoord;
begin
  UpdateScrollPos;
  CalcDrawInfo(DrawInfo);
  if CalcScroll(DrawInfo.Horz, OldTopLeft.X, FTopLeft.X, Delta.X) and
    CalcScroll(DrawInfo.Vert, OldTopLeft.Y, FTopLeft.Y, Delta.Y) then
    ScrollDataInfo(Delta.X, Delta.Y, DrawInfo);
  TopLeftChanged;
end;

procedure TIvCustomGrid.UpdateScrollPos;
var
  DrawInfo: TIvGridDrawInfo;
  MaxTopLeft: TIvGridCoord;

  procedure SetScroll(Code: Word; Value: Integer);
  begin
    if GetScrollPos(Handle, Code) <> Value then
      SetScrollPos(Handle, Code, Value, True);
  end;

var
  GridSpace, ColWidth: Integer;

begin
  if (not HandleAllocated) or (ScrollBars = ssNone) then Exit;
  CalcDrawInfo(DrawInfo);
  MaxTopLeft.X := ColCount - 1;
  MaxTopLeft.Y := RowCount - 1;
  MaxTopLeft := CalcMaxTopLeft(MaxTopLeft, DrawInfo);
  if ScrollBars in [ssHorizontal, ssBoth] then
    if ColCount = 1 then
    begin
      ColWidth := ColWidths[DrawInfo.Horz.FirstGridCell];
      GridSpace := ClientWidth - DrawInfo.Horz.FixedBoundary;
      if (FColOffset > 0) and (GridSpace > (ColWidth - FColOffset)) then
        ModifyScrollbar(SB_HORZ, SB_THUMBPOSITION, ColWidth - GridSpace)
      else
        SetScroll(SB_HORZ, FColOffset)
    end
    else
    begin
{$IFDEF IVPRO32}
      if IvIsLocaleBidirectional(FLocale) then
        SetScroll(
          SB_HORZ,
          IvMaxShortInt - LongMulDiv(FTopLeft.X - FixedCols, IvMaxShortInt, MaxTopLeft.X - FixedCols))
      else
{$ENDIF}
        SetScroll(
          SB_HORZ,
          LongMulDiv(FTopLeft.X - FixedCols, IvMaxShortInt, MaxTopLeft.X - FixedCols));
    end;
  if ScrollBars in [ssVertical, ssBoth] then
    SetScroll(SB_VERT, LongMulDiv(FTopLeft.Y - FixedRows, IvMaxShortInt,
      MaxTopLeft.Y - FixedRows));
end;

procedure TIvCustomGrid.UpdateScrollRange;
var
  MaxTopLeft, OldTopLeft: TIvGridCoord;
  DrawInfo: TIvGridDrawInfo;
  OldScrollBars: TScrollStyle;
  Updated: Boolean;

  procedure DoUpdate;
  begin
    if not Updated then
    begin
      Update;
      Updated := True;
    end;
  end;

  function ScrollBarVisible(Code: Word): Boolean;
  var
    Min, Max: Integer;
  begin
    Result := False;
    if (ScrollBars = ssBoth) or
      ((Code = SB_HORZ) and (ScrollBars = ssHorizontal)) or
      ((Code = SB_VERT) and (ScrollBars = ssVertical)) then
    begin
      GetScrollRange(Handle, Code, Min, Max);
      Result := Min <> Max;
    end;
  end;

  procedure CalcSizeInfo;
  begin
    CalcDrawInfoXY(DrawInfo, DrawInfo.Horz.GridExtent, DrawInfo.Vert.GridExtent);
    MaxTopLeft.X := ColCount - 1;
    MaxTopLeft.Y := RowCount - 1;
    MaxTopLeft := CalcMaxTopLeft(MaxTopLeft, DrawInfo);
  end;

  procedure SetAxisRange(var Max, Old, Current: Longint; Code: Word;
    Fixeds: Integer);
  begin
    CalcSizeInfo;
    if Fixeds < Max then
      SetScrollRange(Handle, Code, 0, IvMaxShortInt, True)
    else
      SetScrollRange(Handle, Code, 0, 0, True);
    if Old > Max then
    begin
      DoUpdate;
      Current := Max;
    end;
  end;

  procedure SetHorzRange;
  var
    Range: Integer;
  begin
    if OldScrollBars in [ssHorizontal, ssBoth] then
      if ColCount = 1 then
      begin
        Range := ColWidths[0] - ClientWidth;
        if Range < 0 then Range := 0;
        SetScrollRange(Handle, SB_HORZ, 0, Range, True);
      end
      else
        SetAxisRange(MaxTopLeft.X, OldTopLeft.X, FTopLeft.X, SB_HORZ, FixedCols);
  end;

  procedure SetVertRange;
  begin
    if OldScrollBars in [ssVertical, ssBoth] then
      SetAxisRange(MaxTopLeft.Y, OldTopLeft.Y, FTopLeft.Y, SB_VERT, FixedRows);
  end;

begin
  if (ScrollBars = ssNone) or not HandleAllocated then Exit;
  with DrawInfo do
  begin
    Horz.GridExtent := ClientWidth;
    Vert.GridExtent := ClientHeight;
    { Ignore scroll bars for initial calculation }
    if ScrollBarVisible(SB_HORZ) then
      Inc(Vert.GridExtent, GetSystemMetrics(SM_CYHSCROLL));
    if ScrollBarVisible(SB_VERT) then
      Inc(Horz.GridExtent, GetSystemMetrics(SM_CXVSCROLL));
  end;
  OldTopLeft := FTopLeft;
  { Temporarily mark us as not having scroll bars to avoid recursion }
  OldScrollBars := FScrollBars;
  FScrollBars := ssNone;
  Updated := False;
  try
    { Update scrollbars }
    SetHorzRange;
    DrawInfo.Vert.GridExtent := ClientHeight;
    SetVertRange;
    if DrawInfo.Horz.GridExtent <> ClientWidth then
    begin
      DrawInfo.Horz.GridExtent := ClientWidth;
      SetHorzRange;
    end;
  finally
    FScrollBars := OldScrollBars;
  end;
  UpdateScrollPos;
  if (FTopLeft.X <> OldTopLeft.X) or (FTopLeft.Y <> OldTopLeft.Y) then
    TopLeftMoved(OldTopLeft);
end;

function TIvCustomGrid.CreateEditor: TIvInplaceEdit;
begin
  Result := TIvInplaceEdit.Create(Self);
end;

procedure TIvCustomGrid.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_TABSTOP;
    if FScrollBars in [ssVertical, ssBoth] then Style := Style or WS_VSCROLL;
    if FScrollBars in [ssHorizontal, ssBoth] then Style := Style or WS_HSCROLL;
    WindowClass.style := CS_DBLCLKS;
    if FBorderStyle = bsSingle then
      if NewStyleControls and Ctl3D then
      begin
        Style := Style and not WS_BORDER;
        ExStyle := ExStyle or WS_EX_CLIENTEDGE;
      end
      else
        Style := Style or WS_BORDER;
  end;
end;

procedure TIvCustomGrid.KeyDown(var Key: Word; Shift: TShiftState);
var
  NewTopLeft, NewCurrent, MaxTopLeft: TIvGridCoord;
  DrawInfo: TIvGridDrawInfo;
  PageWidth, PageHeight: Integer;

  procedure CalcPageExtents;
  begin
    CalcDrawInfo(DrawInfo);
    PageWidth := DrawInfo.Horz.LastFullVisibleCell - LeftCol;
    if PageWidth < 1 then PageWidth := 1;
    PageHeight := DrawInfo.Vert.LastFullVisibleCell - TopRow;
    if PageHeight < 1 then PageHeight := 1;
  end;

  procedure Restrict(var Coord: TIvGridCoord; MinX, MinY, MaxX, MaxY: Longint);
  begin
    with Coord do
    begin
      if X > MaxX then X := MaxX
      else if X < MinX then X := MinX;
      if Y > MaxY then Y := MaxY
      else if Y < MinY then Y := MinY;
    end;
  end;

begin
  inherited KeyDown(Key, Shift);
  if not CanGridAcceptKey(Key, Shift) then Key := 0;
  NewCurrent := FCurrent;
  NewTopLeft := FTopLeft;
  CalcPageExtents;
  if ssCtrl in Shift then
    case Key of
      VK_UP: Dec(NewTopLeft.Y);
      VK_DOWN: Inc(NewTopLeft.Y);
      VK_LEFT:
        if not (goRowSelect in Options) then
        begin
          Dec(NewCurrent.X, PageWidth);
          Dec(NewTopLeft.X, PageWidth);
        end;
      VK_RIGHT:
        if not (goRowSelect in Options) then
        begin
          Inc(NewCurrent.X, PageWidth);
          Inc(NewTopLeft.X, PageWidth);
        end;
      VK_PRIOR: NewCurrent.Y := TopRow;
      VK_NEXT: NewCurrent.Y := DrawInfo.Vert.LastFullVisibleCell;
      VK_HOME:
        begin
          NewCurrent.X := FixedCols;
          NewCurrent.Y := FixedRows;
        end;
      VK_END:
        begin
          NewCurrent.X := ColCount - 1;
          NewCurrent.Y := RowCount - 1;
        end;
    end
  else
    case Key of
      VK_UP: Dec(NewCurrent.Y);
      VK_DOWN: Inc(NewCurrent.Y);
      VK_LEFT:
        if goRowSelect in Options then
          Dec(NewCurrent.Y) else
          Dec(NewCurrent.X);
      VK_RIGHT:
        if goRowSelect in Options then
          Inc(NewCurrent.Y) else
          Inc(NewCurrent.X);
      VK_NEXT:
        begin
          Inc(NewCurrent.Y, PageHeight);
          Inc(NewTopLeft.Y, PageHeight);
        end;
      VK_PRIOR:
        begin
          Dec(NewCurrent.Y, PageHeight);
          Dec(NewTopLeft.Y, PageHeight);
        end;
      VK_HOME:
        if goRowSelect in Options then
          NewCurrent.Y := FixedRows else
          NewCurrent.X := FixedCols;
      VK_END:
        if goRowSelect in Options then
          NewCurrent.Y := RowCount - 1 else
          NewCurrent.X := ColCount - 1;
      VK_TAB:
        if not (ssAlt in Shift) then
        repeat
          if ssShift in Shift then
          begin
            Dec(NewCurrent.X);
            if NewCurrent.X < FixedCols then
            begin
              NewCurrent.X := ColCount - 1;
              Dec(NewCurrent.Y);
              if NewCurrent.Y < FixedRows then NewCurrent.Y := RowCount - 1;
            end;
            Shift := [];
          end
          else
          begin
            Inc(NewCurrent.X);
            if NewCurrent.X >= ColCount then
            begin
              NewCurrent.X := FixedCols;
              Inc(NewCurrent.Y);
              if NewCurrent.Y >= RowCount then NewCurrent.Y := FixedRows;
            end;
          end;
        until TabStops[NewCurrent.X] or (NewCurrent.X = FCurrent.X);
      VK_F2: EditorMode := True;
    end;
  MaxTopLeft.X := ColCount - 1;
  MaxTopLeft.Y := RowCount - 1;
  MaxTopLeft := CalcMaxTopLeft(MaxTopLeft, DrawInfo);
  Restrict(NewTopLeft, FixedCols, FixedRows, MaxTopLeft.X, MaxTopLeft.Y);
  if (NewTopLeft.X <> LeftCol) or (NewTopLeft.Y <> TopRow) then
    MoveTopLeft(NewTopLeft.X, NewTopLeft.Y);
  Restrict(NewCurrent, FixedCols, FixedRows, ColCount - 1, RowCount - 1);
  if (NewCurrent.X <> Col) or (NewCurrent.Y <> Row) then
    FocusCell(NewCurrent.X, NewCurrent.Y, not (ssShift in Shift));
end;

procedure TIvCustomGrid.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if not (goAlwaysShowEditor in Options) and (Key = #13) then
  begin
    if FEditorMode then
      HideEditor else
      ShowEditor;
    Key := #0;
  end;
end;

procedure TIvCustomGrid.MouseDown(
  button: TMouseButton;
  shift: TShiftState;
  x, y: Integer);
var
  CellHit: TIvGridCoord;
  DrawInfo: TIvGridDrawInfo;
  MoveDrawn: Boolean;
begin
  MoveDrawn := False;
  HideEdit;
  if not (csDesigning in ComponentState) and
    (CanFocus or (GetParentForm(Self) = nil)) then
  begin
    SetFocus;
    if not IsActiveControl then
    begin
      MouseCapture := False;
      Exit;
    end;
  end;
  if (Button = mbLeft) and (ssDouble in Shift) then
    DblClick
  else if Button = mbLeft then
  begin
    CalcDrawInfo(DrawInfo);
    { Check grid sizing }
    CalcSizingState(X, Y, FGridState, FSizingIndex, FSizingPos, FSizingOfs,
      DrawInfo);
    if FGridState <> gsNormal then
    begin
      DrawSizingLine(DrawInfo);
      Exit;
    end;
    CellHit := CalcCoordFromPoint(X, Y, DrawInfo);
    if (CellHit.X >= FixedCols) and (CellHit.Y >= FixedRows) then
    begin
      if goEditing in Options then
      begin
        if (CellHit.X = FCurrent.X) and (CellHit.Y = FCurrent.Y) then
          ShowEditor
        else
        begin
          MoveCurrent(CellHit.X, CellHit.Y, True, True);
          UpdateEdit;
        end;
        Click;
      end
      else
      begin
        FGridState := gsSelecting;
        SetTimer(Handle, 1, 60, nil);
        if ssShift in Shift then
          MoveAnchor(CellHit)
        else
          MoveCurrent(CellHit.X, CellHit.Y, True, True);
      end;
    end
    else if (goRowMoving in Options) and (CellHit.X >= 0) and
      (CellHit.X < FixedCols) and (CellHit.Y >= FixedRows) then
    begin
      FGridState := gsRowMoving;
      FMoveIndex := CellHit.Y;
      FMovePos := FMoveIndex;
      Update;
      DrawMove;
      MoveDrawn := True;
      SetTimer(Handle, 1, 60, nil);
    end
    else if (goColMoving in Options) and (CellHit.Y >= 0) and
      (CellHit.Y < FixedRows) and (CellHit.X >= FixedCols) then
    begin
      FGridState := gsColMoving;
      FMoveIndex := CellHit.X;
      FMovePos := FMoveIndex;
      Update;
      DrawMove;
      MoveDrawn := True;
      SetTimer(Handle, 1, 60, nil);
    end;
  end;
  try
    inherited MouseDown(Button, Shift, X, Y);
  except
    if MoveDrawn then DrawMove;
  end;
end;

procedure TIvCustomGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  DrawInfo: TIvGridDrawInfo;
  CellHit: TIvGridCoord;
begin
  CalcDrawInfo(DrawInfo);
  case FGridState of
    gsSelecting, gsColMoving, gsRowMoving:
      begin
        CellHit := CalcCoordFromPoint(X, Y, DrawInfo);
        if (CellHit.X >= FixedCols) and (CellHit.Y >= FixedRows) and
          (CellHit.X <= DrawInfo.Horz.LastFullVisibleCell+1) and
          (CellHit.Y <= DrawInfo.Vert.LastFullVisibleCell+1) then
          case FGridState of
            gsSelecting:
              if ((CellHit.X <> FAnchor.X) or (CellHit.Y <> FAnchor.Y)) then
                MoveAnchor(CellHit);
            gsColMoving:
              MoveAndScroll(X, CellHit.X, DrawInfo, DrawInfo.Horz, SB_HORZ);
            gsRowMoving:
              MoveAndScroll(Y, CellHit.Y, DrawInfo, DrawInfo.Vert, SB_VERT);
          end;
      end;
    gsRowSizing, gsColSizing:
      begin
        DrawSizingLine(DrawInfo); { XOR it out }
        if FGridState = gsRowSizing then
          FSizingPos := Y + FSizingOfs else
          FSizingPos := X + FSizingOfs;
        DrawSizingLine(DrawInfo); { XOR it back in }
      end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TIvCustomGrid.MouseUp(
  button: TMouseButton;
  shift: TShiftState;
  x, y: Integer);
var
  drawInfo: TIvGridDrawInfo;
  newSize: Integer;

  function ResizeLine(const axisInfo: TIvGridAxisDrawInfo): Integer;
  var
    i: Integer;
  begin
    Result := axisInfo.FixedBoundary;
    for i := axisInfo.FirstGridCell to FSizingIndex - 1 do
      Inc(Result, axisInfo.GetExtent(i) + axisInfo.EffectiveLineWidth);
{$IFDEF IVPRO32}
    if IvIsLocaleBidirectional(FLocale) and (axisInfo.AxisType = gaHorizontal) then
      Result := ClientWidth - FSizingPos - Result
    else
{$ENDIF}
      Result := FSizingPos - Result;
  end;

begin
  try
    case FGridState of
      gsSelecting:
        begin
          MouseMove(Shift, X, Y);
          KillTimer(Handle, 1);
          UpdateEdit;
          Click;
        end;

      gsRowSizing, gsColSizing:
        begin
          CalcDrawInfo(drawInfo);
          DrawSizingLine(drawInfo);
          if FGridState = gsColSizing then
          begin
            newSize := ResizeLine(drawInfo.Horz);
            if newSize > 1 then
            begin
              ColWidths[FSizingIndex] := newSize;
              UpdateDesigner;
            end;
          end
          else
          begin
            newSize := ResizeLine(drawInfo.Vert);
            if newSize > 1 then
            begin
              RowHeights[FSizingIndex] := newSize;
              UpdateDesigner;
            end;
          end;
        end;

      gsColMoving, gsRowMoving:
        begin
          DrawMove;
          KillTimer(Handle, 1);
          if FMoveIndex <> FMovePos then
          begin
            if FGridState = gsColMoving then
              MoveColumn(FMoveIndex, FMovePos)
            else
              MoveRow(FMoveIndex, FMovePos);
            UpdateDesigner;
          end;
          UpdateEdit;
        end;
    else
      UpdateEdit;
    end;
    inherited MouseUp(Button, Shift, X, Y);
  finally
    FGridState := gsNormal;
  end;
end;

procedure TIvCustomGrid.MoveAndScroll(Mouse, CellHit: Integer;
  var DrawInfo: TIvGridDrawInfo; var Axis: TIvGridAxisDrawInfo; ScrollBar: Integer);
begin
  if (CellHit <> FMovePos) and
    not((FMovePos = Axis.FixedCellCount) and (Mouse < Axis.FixedBoundary)) and
    not((FMovePos = Axis.GridCellCount-1) and (Mouse > Axis.GridBoundary)) then
  begin
    DrawMove;
    if (Mouse < Axis.FixedBoundary) then
    begin
      if (FMovePos > Axis.FixedCellCount) then
      begin
        ModifyScrollbar(ScrollBar, SB_LINEUP, 0);
        Update;
        CalcDrawInfo(DrawInfo);    // this changes contents of Axis var
      end;
      CellHit := Axis.FirstGridCell;
    end
    else if (Mouse >= Axis.FullVisBoundary) then
    begin
      if (FMovePos = Axis.LastFullVisibleCell) and
        (FMovePos < Axis.GridCellCount -1) then
      begin
        ModifyScrollBar(Scrollbar, SB_LINEDOWN, 0);
        Update;
        CalcDrawInfo(DrawInfo);    // this changes contents of Axis var
      end;
      CellHit := Axis.LastFullVisibleCell;
    end
    else if CellHit < 0 then CellHit := FMovePos;
    FMovePos := CellHit;
    DrawMove;
  end;
end;

function TIvCustomGrid.GetColWidths(Index: Longint): Integer;
begin
  if (FColWidths = nil) or (Index >= ColCount) then
    Result := DefaultColWidth
  else
    Result := PIntArray(FColWidths)^[Index + 1];
end;

function TIvCustomGrid.GetRowHeights(Index: Longint): Integer;
begin
  if (FRowHeights = nil) or (Index >= RowCount) then
    Result := DefaultRowHeight
  else
    Result := PIntArray(FRowHeights)^[Index + 1];
end;

function TIvCustomGrid.GetGridWidth: Integer;
var
  DrawInfo: TIvGridDrawInfo;
begin
  CalcDrawInfo(DrawInfo);
  Result := DrawInfo.Horz.GridBoundary;
end;

function TIvCustomGrid.GetGridHeight: Integer;
var
  DrawInfo: TIvGridDrawInfo;
begin
  CalcDrawInfo(DrawInfo);
  Result := DrawInfo.Vert.GridBoundary;
end;

function TIvCustomGrid.GetSelection: TIvGridRect;
begin
  Result := GridRect(FCurrent, FAnchor);
end;

function TIvCustomGrid.GetTabStops(Index: Longint): Boolean;
begin
  if FTabStops = nil then Result := True
  else Result := Boolean(PIntArray(FTabStops)^[Index + 1]);
end;

function TIvCustomGrid.GetVisibleColCount: Integer;
var
  DrawInfo: TIvGridDrawInfo;
begin
  CalcDrawInfo(DrawInfo);
  Result := DrawInfo.Horz.LastFullVisibleCell - LeftCol + 1;
end;

function TIvCustomGrid.GetVisibleRowCount: Integer;
var
  DrawInfo: TIvGridDrawInfo;
begin
  CalcDrawInfo(DrawInfo);
  Result := DrawInfo.Vert.LastFullVisibleCell - TopRow + 1;
end;

procedure TIvCustomGrid.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TIvCustomGrid.SetCol(Value: Longint);
begin
  if Col <> Value then FocusCell(Value, Row, True);
end;

procedure TIvCustomGrid.SetColCount(Value: Longint);
begin
  if FColCount <> Value then
  begin
    if Value < 1 then
      Value := 1;
    if Value <= FixedCols then
      FixedCols := Value - 1;
    ChangeSize(Value, RowCount);
    if goRowSelect in Options then
    begin
      FAnchor.X := ColCount - 1;
      Invalidate;
    end;
  end;
end;

procedure TIvCustomGrid.SetColWidths(Index: Longint; Value: Integer);
begin
  if FColWidths = nil then
    UpdateExtents(FColWidths, ColCount, DefaultColWidth);

  if Index >= ColCount then
    InvalidOp(SIndexOutOfRange);

  if Value <> PIntArray(FColWidths)^[Index + 1] then
  begin
    ResizeCol(Index, PIntArray(FColWidths)^[Index + 1], Value);
    PIntArray(FColWidths)^[Index + 1] := Value;
    ColWidthsChanged;
  end;
end;

procedure TIvCustomGrid.SetDefaultColWidth(Value: Integer);
begin
  if FColWidths <> nil then UpdateExtents(FColWidths, 0, 0);
  FDefaultColWidth := Value;
  ColWidthsChanged;
  InvalidateGrid;
end;

procedure TIvCustomGrid.SetDefaultRowHeight(Value: Integer);
begin
  if FRowHeights <> nil then UpdateExtents(FRowHeights, 0, 0);
  FDefaultRowHeight := Value;
  RowHeightsChanged;
  InvalidateGrid;
end;

procedure TIvCustomGrid.SetFixedColor(Value: TColor);
begin
  if FFixedColor <> Value then
  begin
    FFixedColor := Value;
    InvalidateGrid;
  end;
end;

procedure TIvCustomGrid.SetFixedCols(Value: Integer);
begin
  if FFixedCols <> Value then
  begin
    if Value < 0 then InvalidOp(SIndexOutOfRange);
    if Value >= ColCount then InvalidOp(SFixedColTooBig);
    FFixedCols := Value;
    Initialize;
    InvalidateGrid;
  end;
end;

procedure TIvCustomGrid.SetFixedRows(Value: Integer);
begin
  if FFixedRows <> Value then
  begin
    if Value < 0 then InvalidOp(SIndexOutOfRange);
    if Value >= RowCount then InvalidOp(SFixedRowTooBig);
    FFixedRows := Value;
    Initialize;
    InvalidateGrid;
  end;
end;

procedure TIvCustomGrid.SetEditorMode(Value: Boolean);
begin
  if not Value then
    HideEditor
  else
  begin
    ShowEditor;
    if FInplaceEdit <> nil then FInplaceEdit.Deselect;
  end;
end;

procedure TIvCustomGrid.SetGridLineWidth(Value: Integer);
begin
  if FGridLineWidth <> Value then
  begin
    FGridLineWidth := Value;
    InvalidateGrid;
  end;
end;

procedure TIvCustomGrid.SetLeftCol(Value: Longint);
begin
  if FTopLeft.X <> Value then MoveTopLeft(Value, TopRow);
end;

procedure TIvCustomGrid.SetOptions(Value: TIvGridOptions);
begin
  if FOptions <> Value then
  begin
    if goRowSelect in Value then
      Exclude(Value, goAlwaysShowEditor);
    FOptions := Value;
    if not FEditorMode then
      if goAlwaysShowEditor in Value then
        ShowEditor else
        HideEditor;
    if goRowSelect in Value then MoveCurrent(Col, Row,  True, False);
    InvalidateGrid;
  end;
end;

procedure TIvCustomGrid.SetRow(Value: Longint);
begin
  if Row <> Value then FocusCell(Col, Value, True);
end;

procedure TIvCustomGrid.SetRowCount(Value: Longint);
begin
  if FRowCount <> Value then
  begin
    if Value < 1 then Value := 1;
    if Value <= FixedRows then FixedRows := Value - 1;
    ChangeSize(ColCount, Value);
  end;
end;

procedure TIvCustomGrid.SetRowHeights(Index: Longint; Value: Integer);
begin
  if FRowHeights = nil then
    UpdateExtents(FRowHeights, RowCount, DefaultRowHeight);
  if Index >= RowCount then InvalidOp(SIndexOutOfRange);
  if Value <> PIntArray(FRowHeights)^[Index + 1] then
  begin
    ResizeRow(Index, PIntArray(FRowHeights)^[Index + 1], Value);
    PIntArray(FRowHeights)^[Index + 1] := Value;
    RowHeightsChanged;
  end;
end;

procedure TIvCustomGrid.SetScrollBars(Value: TScrollStyle);
begin
  if FScrollBars <> Value then
  begin
    FScrollBars := Value;
    RecreateWnd;
  end;
end;

procedure TIvCustomGrid.SetSelection(Value: TIvGridRect);
var
  OldSel: TIvGridRect;
begin
  OldSel := Selection;
  FAnchor := Value.TopLeft;
  FCurrent := Value.BottomRight;
  SelectionMoved(OldSel);
end;

procedure TIvCustomGrid.SetTabStops(Index: Longint; Value: Boolean);
begin
  if FTabStops = nil then
    UpdateExtents(FTabStops, ColCount, Integer(True));
  if Index >= ColCount then InvalidOp(SIndexOutOfRange);
  PIntArray(FTabStops)^[Index + 1] := Integer(Value);
end;

procedure TIvCustomGrid.SetTopRow(Value: Longint);
begin
  if FTopLeft.Y <> Value then MoveTopLeft(LeftCol, Value);
end;

procedure TIvCustomGrid.HideEdit;
begin
  if FInplaceEdit <> nil then
    try
      UpdateText;
    finally
      FInplaceCol := -1;
      FInplaceRow := -1;
      FInplaceEdit.Hide;
    end;
end;

procedure TIvCustomGrid.UpdateEdit;

  procedure UpdateEditor;
  begin
    FInplaceCol := Col;
    FInplaceRow := Row;
    FInplaceEdit.UpdateContents;
    if FInplaceEdit.MaxLength = -1 then
      FCanEditModify := False
    else
      FCanEditModify := True;
    FInplaceEdit.SelectAll;
  end;

begin
  if CanEditShow then
  begin
    if FInplaceEdit = nil then
    begin
{      FInplaceEdit := CreateEditor;
      FInplaceEdit.SetGrid(Self);
      FInplaceEdit.Parent := Self;
      UpdateEditor;}
    end
    else
    begin
      if (Col <> FInplaceCol) or (Row <> FInplaceRow) then
      begin
        HideEdit;
        UpdateEditor;
      end;
    end;

    FInplaceEdit.Free;
    FInplaceEdit := CreateEditor;
    FInplaceEdit.SetGrid(Self);
    FInplaceEdit.Parent := Self;
    UpdateEditor;

    FInplaceEdit.UpdateBidi(IvIsLocaleBidirectional(ColLocale[Col]));

    if CanEditShow then
      FInplaceEdit.Move(CellRect(Col, Row));
  end;
end;

procedure TIvCustomGrid.UpdateText;
begin
  if (FInplaceCol <> -1) and (FInplaceRow <> -1) then
    SetEditText(FInplaceCol, FInplaceRow, FInplaceEdit.Text);
end;

procedure TIvCustomGrid.WMChar(var Msg: TWMChar);
begin
  if (goEditing in Options) and (Char(Msg.CharCode) in [^H, #32..#255]) then
    ShowEditorChar(Char(Msg.CharCode))
  else
    inherited;
end;

procedure TIvCustomGrid.WMCommand(var Message: TWMCommand);
begin
  with Message do
  begin
    if (FInplaceEdit <> nil) and (Ctl = FInplaceEdit.Handle) then
      case NotifyCode of
        EN_CHANGE: UpdateText;
      end;
  end;
end;

procedure TIvCustomGrid.WMGetDlgCode(var Msg: TWMGetDlgCode);
begin
  Msg.Result := DLGC_WANTARROWS;
  if goRowSelect in Options then Exit;
  if goTabs in Options then Msg.Result := Msg.Result or DLGC_WANTTAB;
  if goEditing in Options then Msg.Result := Msg.Result or DLGC_WANTCHARS;
end;

procedure TIvCustomGrid.WMKillFocus(var Msg: TWMKillFocus);
begin
  inherited;
  InvalidateRect(Selection);
  if (FInplaceEdit <> nil) and (Msg.FocusedWnd <> FInplaceEdit.Handle) then
    HideEdit;
end;

procedure TIvCustomGrid.WMLButtonDown(var Message: TMessage);
begin
  inherited;
  if FInplaceEdit <> nil then FInplaceEdit.FClickTime := GetMessageTime;
end;

procedure TIvCustomGrid.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  DefaultHandler(Msg);
  FHitTest := ScreenToClient(SmallPointToPoint(Msg.Pos));
end;

procedure TIvCustomGrid.WMSetCursor(var Msg: TWMSetCursor);
var
  DrawInfo: TIvGridDrawInfo;
  State: TIvGridState;
  Index: Longint;
  Pos, Ofs: Integer;
  Cur: HCURSOR;
begin
  Cur := 0;
  with Msg do
  begin
    if HitTest = HTCLIENT then
    begin
      if FGridState = gsNormal then
      begin
        CalcDrawInfo(DrawInfo);
        CalcSizingState(
          FHitTest.X,
          FHitTest.Y,
          State,
          Index,
          Pos,
          Ofs,
          DrawInfo);
      end
      else
        State := FGridState;

      if State = gsRowSizing then
        Cur := Screen.Cursors[crVSplit]
      else if State = gsColSizing then
        Cur := Screen.Cursors[crHSplit]
    end;
  end;

  if Cur <> 0 then
    SetCursor(Cur)
  else
    inherited;
end;

procedure TIvCustomGrid.WMSetFocus(var Msg: TWMSetFocus);
begin
  inherited;
  if (FInplaceEdit = nil) or (Msg.FocusedWnd <> FInplaceEdit.Handle) then
  begin
    InvalidateRect(Selection);
    UpdateEdit;
  end;
end;

procedure TIvCustomGrid.WMSize(var Msg: TWMSize);
begin
  inherited;
  UpdateScrollRange;
end;

procedure TIvCustomGrid.WMVScroll(var Msg: TWMVScroll);
begin
  ModifyScrollBar(SB_VERT, Msg.ScrollCode, Msg.Pos);
end;

procedure TIvCustomGrid.WMHScroll(var Msg: TWMHScroll);
begin
  ModifyScrollBar(SB_HORZ, Msg.ScrollCode, Msg.Pos);
end;

procedure TIvCustomGrid.CMCancelMode(var Msg: TMessage);
begin
  if Assigned(FInplaceEdit) then FInplaceEdit.WndProc(Msg);
  inherited;
end;

procedure TIvCustomGrid.CMFontChanged(var Message: TMessage);
begin
  if FInplaceEdit <> nil then FInplaceEdit.Font := Font;
  inherited;
end;

procedure TIvCustomGrid.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  RecreateWnd;
end;

procedure TIvCustomGrid.CMDesignHitTest(var Msg: TCMDesignHitTest);
begin
  Msg.Result := Longint(BOOL(Sizing(Msg.Pos.X, Msg.Pos.Y)));
end;

procedure TIvCustomGrid.CMWantSpecialKey(var Msg: TCMWantSpecialKey);
begin
  inherited;
  if (goEditing in Options) and (Char(Msg.CharCode) = #13) then Msg.Result := 1;
end;

procedure TIvCustomGrid.TimedScroll(Direction: TIvGridScrollDirection);
var
  MaxAnchor, NewAnchor: TIvGridCoord;
begin
  NewAnchor := FAnchor;
  MaxAnchor.X := ColCount - 1;
  MaxAnchor.Y := RowCount - 1;
  if (sdLeft in Direction) and (FAnchor.X > FixedCols) then Dec(NewAnchor.X);
  if (sdRight in Direction) and (FAnchor.X < MaxAnchor.X) then Inc(NewAnchor.X);
  if (sdUp in Direction) and (FAnchor.Y > FixedRows) then Dec(NewAnchor.Y);
  if (sdDown in Direction) and (FAnchor.Y < MaxAnchor.Y) then Inc(NewAnchor.Y);
  if (FAnchor.X <> NewAnchor.X) or (FAnchor.Y <> NewAnchor.Y) then
    MoveAnchor(NewAnchor);
end;

procedure TIvCustomGrid.WMTimer(var Msg: TWMTimer);
var
  Point: TPoint;
  DrawInfo: TIvGridDrawInfo;
  ScrollDirection: TIvGridScrollDirection;
  CellHit: TIvGridCoord;
begin
  if not (FGridState in [gsSelecting, gsRowMoving, gsColMoving]) then Exit;
  GetCursorPos(Point);
  Point := ScreenToClient(Point);
  CalcDrawInfo(DrawInfo);
  ScrollDirection := [];
  with DrawInfo do
  begin
    CellHit := CalcCoordFromPoint(Point.X, Point.Y, DrawInfo);
    case FGridState of
      gsColMoving:
        MoveAndScroll(Point.X, CellHit.X, DrawInfo, Horz, SB_HORZ);
      gsRowMoving:
        MoveAndScroll(Point.Y, CellHit.Y, DrawInfo, Vert, SB_VERT);
      gsSelecting:
      begin
        if Point.X < Horz.FixedBoundary then Include(ScrollDirection, sdLeft)
        else if Point.X > Horz.FullVisBoundary then Include(ScrollDirection, sdRight);
        if Point.Y < Vert.FixedBoundary then Include(ScrollDirection, sdUp)
        else if Point.Y > Vert.FullVisBoundary then Include(ScrollDirection, sdDown);
        if ScrollDirection <> [] then  TimedScroll(ScrollDirection);
      end;
    end;
  end;
end;

procedure TIvCustomGrid.ColWidthsChanged;
begin
  UpdateScrollRange;
  UpdateEdit;
end;

procedure TIvCustomGrid.RowHeightsChanged;
begin
  UpdateScrollRange;
  UpdateEdit;
end;

procedure TIvCustomGrid.DeleteColumn(ACol: Longint);
begin
  MoveColumn(ACol, ColCount-1);
  ColCount := ColCount - 1;
end;

procedure TIvCustomGrid.DeleteRow(ARow: Longint);
begin
  MoveRow(ARow, RowCount - 1);
  RowCount := RowCount - 1;
end;

procedure TIvCustomGrid.UpdateDesigner;
{$IFDEF IVWIDE}
var
  ParentForm: TCustomForm;
begin
  if (csDesigning in ComponentState) and HandleAllocated and
    not (csUpdating in ComponentState) then
  begin
    ParentForm := GetParentForm(Self);
    if Assigned(ParentForm) and Assigned(ParentForm.Designer) then
      ParentForm.Designer.Modified;
  end;
end;
{$ELSE}
var
  ParentForm: TForm;
begin
  if (csDesigning in ComponentState) and HandleAllocated and
    not (csUpdating in ComponentState) then
  begin
    ParentForm := GetParentForm(Self);
    if Assigned(ParentForm) and Assigned(ParentForm.Designer) then
      ParentForm.Designer.Modified;
  end;
end;
{$ENDIF}


{ TIvDrawGrid }

function TIvDrawGrid.CellRect(ACol, ARow: Longint): TRect;
begin
  Result := inherited CellRect(ACol, ARow);
end;

procedure TIvDrawGrid.MouseToCell(X, Y: Integer; var ACol, ARow: Longint);
var
  Coord: TIvGridCoord;
begin
  Coord := MouseCoord(X, Y);
  ACol := Coord.X;
  ARow := Coord.Y;
end;

procedure TIvDrawGrid.ColumnMoved(FromIndex, ToIndex: Longint);
begin
  if Assigned(FOnColumnMoved) then FOnColumnMoved(Self, FromIndex, ToIndex);
end;

function TIvDrawGrid.GetEditMask(ACol, ARow: Longint): string;
begin
  Result := '';
  if Assigned(FOnGetEditMask) then FOnGetEditMask(Self, ACol, ARow, Result);
end;

function TIvDrawGrid.GetEditText(ACol, ARow: Longint): string;
begin
  Result := '';
  if Assigned(FOnGetEditText) then FOnGetEditText(Self, ACol, ARow, Result);
end;

procedure TIvDrawGrid.RowMoved(FromIndex, ToIndex: Longint);
begin
  if Assigned(FOnRowMoved) then FOnRowMoved(Self, FromIndex, ToIndex);
end;

function TIvDrawGrid.SelectCell(ACol, ARow: Longint): Boolean;
begin
  Result := True;
  if Assigned(FOnSelectCell) then FOnSelectCell(Self, ACol, ARow, Result);
end;

procedure TIvDrawGrid.SetEditText(ACol, ARow: Longint; const Value: string);
begin
  if Assigned(FOnSetEditText) then FOnSetEditText(Self, ACol, ARow, Value);
end;

procedure TIvDrawGrid.DrawCell(ACol, ARow: Longint; ARect: TRect;
  AState: TIvGridDrawState);
begin
  if Assigned(FOnDrawCell) then FOnDrawCell(Self, ACol, ARow, ARect, AState);
end;

procedure TIvDrawGrid.TopLeftChanged;
begin
  inherited TopLeftChanged;
  if Assigned(FOnTopLeftChanged) then FOnTopLeftChanged(Self);
end;

{ StrItem management for TStringSparseList }

type
  PStrItem = ^TStrItem;
  TStrItem = record
    FObject: TObject;
    FString: string;
  end;

function NewStrItem(const AString: string; AObject: TObject): PStrItem;
begin
  New(Result);
  Result^.FObject := AObject;
  Result^.FString := AString;
end;

procedure DisposeStrItem(P: PStrItem);
begin
  Dispose(P);
end;

{ Sparse array classes for TStringGrid }

type

  PPointer = ^Pointer;

{ Exception classes }

  EStringSparseListError = class(Exception);

{ TSparsePointerArray class}

{ Used by TSparseList.  Based on Sparse1Array, but has Pointer elements
  and Integer index, just like TPointerList/TList, and less indirection }

  { Apply function for the applicator:
        TheIndex        Index of item in array
        TheItem         Value of item (i.e pointer element) in section
        Returns: 0 if success, else error code. }
  TSPAApply = function(TheIndex: Integer; TheItem: Pointer): Integer;

  TSecDir = array[0..4095] of Pointer;  { Enough for up to 12 bits of sec }
  PSecDir = ^TSecDir;
  TSPAQuantum = (SPASmall, SPALarge);   { Section size }

  TSparsePointerArray = class(TObject)
  private
    secDir: PSecDir;
    slotsInDir: Word;
    indexMask, secShift: Word;
    FHighBound: Integer;
    FSectionSize: Word;
    cachedIndex: Integer;
    cachedPointer: Pointer;
    { Return item[i], nil if slot outside defined section. }
    function  GetAt(Index: Integer): Pointer;
    { Return address of item[i], creating slot if necessary. }
    function  MakeAt(Index: Integer): PPointer;
    { Store item at item[i], creating slot if necessary. }
    procedure PutAt(Index: Integer; Item: Pointer);
  public
    constructor Create(Quantum: TSPAQuantum);
    destructor  Destroy; override;

    { Traverse SPA, calling apply function for each defined non-nil
      item.  The traversal terminates if the apply function returns
      a value other than 0. }
    { NOTE: must be static method so that we can take its address in
      TSparseList.ForAll }
    function  ForAll(ApplyFunction: Pointer {TSPAApply}): Integer;

    { Ratchet down HighBound after a deletion }
    procedure ResetHighBound;

    property HighBound: Integer read FHighBound;
    property SectionSize: Word read FSectionSize;
    property Items[Index: Integer]: Pointer read GetAt write PutAt; default;
  end;

{ TSparseList class }

  TSparseList = class(TObject)
  private
    FList: TSparsePointerArray;
    FCount: Integer;    { 1 + HighBound, adjusted for Insert/Delete }
    FQuantum: TSPAQuantum;
    procedure NewList(Quantum: TSPAQuantum);
  protected
    procedure Error; virtual;
    function  Get(Index: Integer): Pointer;
    procedure Put(Index: Integer; Item: Pointer);
  public
    constructor Create(Quantum: TSPAQuantum);
    destructor  Destroy; override;
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function ForAll(ApplyFunction: Pointer {TSPAApply}): Integer;
    procedure Insert(Index: Integer; Item: Pointer);
    procedure Move(CurIndex, NewIndex: Integer);
    property Count: Integer read FCount;
    property Items[Index: Integer]: Pointer read Get write Put; default;
  end;
  PSparseList = ^TSparseList;

{ TStringSparseList class }

  TStringSparseList = class(TStrings)
  private
    FList: TSparseList;                 { of StrItems }
    FOnChange: TNotifyEvent;
  protected
    function  Get(Index: Integer): String; override;
    function  GetCount: Integer; override;
    function  GetObject(Index: Integer): TObject; override;
    procedure Put(Index: Integer; const S: String); override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure Changed; virtual;
    procedure Error; virtual;
  public
    constructor Create(Quantum: TSPAQuantum);
    destructor  Destroy; override;
    procedure ReadData(Reader: TReader);
    procedure WriteData(Writer: TWriter);
    procedure DefineProperties(Filer: TFiler); override;
    procedure Delete(Index: Integer); override;
    procedure Exchange(Index1, Index2: Integer); override;
    procedure Insert(Index: Integer; const S: String); override;
    procedure Clear; override;
    property List: TSparseList read FList;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

{ TSparsePointerArray }

const
  SPAIndexMask: array[TSPAQuantum] of Byte = (15, 255);
  SPASecShift: array[TSPAQuantum] of Byte = (4, 8);

{ Expand Section Directory to cover at least `newSlots' slots. Returns: Possibly
  updated pointer to the Section Directory. }
function  ExpandDir(secDir: PSecDir; var slotsInDir: Word;
  newSlots: Word): PSecDir;
begin
  Result := secDir;
  ReallocMem(Result, newSlots * SizeOf(Pointer));
  FillChar(Result^[slotsInDir], (newSlots - slotsInDir) * SizeOf(Pointer), 0);
  slotsInDir := newSlots;
end;

{ Allocate a section and set all its items to nil. Returns: Pointer to start of
  section. }
function  MakeSec(SecIndex: Integer; SectionSize: Word): Pointer;
var
  SecP: Pointer;
  Size: Word;
begin
  Size := SectionSize * SizeOf(Pointer);
  GetMem(secP, size);
  FillChar(secP^, size, 0);
  MakeSec := SecP
end;

constructor TSparsePointerArray.Create(Quantum: TSPAQuantum);
begin
  SecDir := nil;
  SlotsInDir := 0;
  FHighBound := -1;
  FSectionSize := Word(SPAIndexMask[Quantum]) + 1;
  IndexMask := Word(SPAIndexMask[Quantum]);
  SecShift := Word(SPASecShift[Quantum]);
  CachedIndex := -1
end;

destructor TSparsePointerArray.Destroy;
var
  i:  Integer;
  size: Word;
begin
  { Scan section directory and free each section that exists. }
  i := 0;
  size := FSectionSize * SizeOf(Pointer);
  while i < slotsInDir do begin
    if secDir^[i] <> nil then
      FreeMem(secDir^[i], size);
    Inc(i)
  end;

  { Free section directory. }
  if secDir <> nil then
    FreeMem(secDir, slotsInDir * SizeOf(Pointer));
end;

function  TSparsePointerArray.GetAt(Index: Integer): Pointer;
var
  byteP: PChar;
  secIndex: Cardinal;
begin
  { Index into Section Directory using high order part of
    index.  Get pointer to Section. If not null, index into
    Section using low order part of index. }
  if Index = cachedIndex then
    Result := cachedPointer
  else begin
    secIndex := Index shr secShift;
    if secIndex >= slotsInDir then
      byteP := nil
    else begin
      byteP := secDir^[secIndex];
      if byteP <> nil then begin
        Inc(byteP, (Index and indexMask) * SizeOf(Pointer));
      end
    end;
    if byteP = nil then Result := nil else Result := PPointer(byteP)^;
    cachedIndex := Index;
    cachedPointer := Result
  end
end;

function  TSparsePointerArray.MakeAt(Index: Integer): PPointer;
var
  dirP: PSecDir;
  p: Pointer;
  byteP: PChar;
  secIndex: Word;
begin
  { Expand Section Directory if necessary. }
  secIndex := Index shr secShift;       { Unsigned shift }
  if secIndex >= slotsInDir then
    dirP := expandDir(secDir, slotsInDir, secIndex + 1)
  else
    dirP := secDir;

  { Index into Section Directory using high order part of
    index.  Get pointer to Section. If null, create new
    Section.  Index into Section using low order part of index. }
  secDir := dirP;
  p := dirP^[secIndex];
  if p = nil then begin
    p := makeSec(secIndex, FSectionSize);
    dirP^[secIndex] := p
  end;
  byteP := p;
  Inc(byteP, (Index and indexMask) * SizeOf(Pointer));
  if Index > FHighBound then
    FHighBound := Index;
  Result := PPointer(byteP);
  cachedIndex := -1
end;

procedure TSparsePointerArray.PutAt(Index: Integer; Item: Pointer);
begin
  if (Item <> nil) or (GetAt(Index) <> nil) then
  begin
    MakeAt(Index)^ := Item;
    if Item = nil then
      ResetHighBound
  end
end;

function  TSparsePointerArray.ForAll(ApplyFunction: Pointer {TSPAApply}):
  Integer;
var
  itemP: PChar;                         { Pointer to item in section }
  item: Pointer;
  i, callerBP: Cardinal;
  j, index: Integer;
begin
  { Scan section directory and scan each section that exists,
    calling the apply function for each non-nil item.
    The apply function must be a far local function in the scope of
    the procedure P calling ForAll.  The trick of setting up the stack
    frame (taken from TurboVision's TCollection.ForEach) allows the
    apply function access to P's arguments and local variables and,
    if P is a method, the instance variables and methods of P's class }
  Result := 0;
  i := 0;
  asm
    mov   eax,[ebp]                     { Set up stack frame for local }
    mov   callerBP,eax
  end;
  while (i < slotsInDir) and (Result = 0) do begin
    itemP := secDir^[i];
    if itemP <> nil then begin
      j := 0;
      index := i shl SecShift;
      while (j < FSectionSize) and (Result = 0) do begin
        item := PPointer(itemP)^;
        if item <> nil then
          { ret := ApplyFunction(index, item.Ptr); }
          asm
            mov   eax,index
            mov   edx,item
            push  callerBP
            call  ApplyFunction
            pop   ecx
            mov   @Result,eax
          end;
        Inc(itemP, SizeOf(Pointer));
        Inc(j);
        Inc(index)
      end
    end;
    Inc(i)
  end;
end;

procedure TSparsePointerArray.ResetHighBound;
var
  NewHighBound: Integer;

  function  Detector(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    if TheIndex > FHighBound then
      Result := 1
    else
    begin
      Result := 0;
      if TheItem <> nil then NewHighBound := TheIndex
    end
  end;

begin
  NewHighBound := -1;
  ForAll(@Detector);
  FHighBound := NewHighBound
end;

{ TSparseList }

constructor TSparseList.Create(Quantum: TSPAQuantum);
begin
  NewList(Quantum)
end;

destructor TSparseList.Destroy;
begin
  if FList <> nil then FList.Destroy
end;


procedure TSparseList.Clear;
begin
  FList.Destroy;
  NewList(FQuantum);
  FCount := 0
end;

procedure TSparseList.Delete(Index: Integer);
var
  I: Integer;
begin
  if (Index < 0) or (Index >= FCount) then Exit;
  for I := Index to FCount - 1 do
    FList[I] := FList[I + 1];
  FList[FCount] := nil;
  Dec(FCount);
end;

procedure TSparseList.Error;
begin
{$IFDEF IVWIDE}
  raise EListError.Create(SListIndexError);
{$ELSE}
  raise EListError.CreateRes(SListIndexError);
{$ENDIF}
end;

procedure TSparseList.Exchange(Index1, Index2: Integer);
var
  temp: Pointer;
begin
  temp := Get(Index1);
  Put(Index1, Get(Index2));
  Put(Index2, temp);
end;

{ Jump to TSparsePointerArray.ForAll so that it looks like it was called
  from our caller, so that the BP trick works. }

function TSparseList.ForAll(ApplyFunction: Pointer {TSPAApply}): Integer; assembler;
asm
        MOV     EAX,[EAX].TSparseList.FList
        JMP     TSparsePointerArray.ForAll
end;

function  TSparseList.Get(Index: Integer): Pointer;
begin
  if Index < 0 then Error;
  Result := FList[Index]
end;

procedure TSparseList.Insert(Index: Integer; Item: Pointer);
var
  i: Integer;
begin
  if Index < 0 then Error;
  I := FCount;
  while I > Index do
  begin
    FList[i] := FList[i - 1];
    Dec(i)
  end;
  FList[Index] := Item;
  if Index > FCount then FCount := Index;
  Inc(FCount)
end;

procedure TSparseList.Move(CurIndex, NewIndex: Integer);
var
  Item: Pointer;
begin
  if CurIndex <> NewIndex then
  begin
    Item := Get(CurIndex);
    Delete(CurIndex);
    Insert(NewIndex, Item);
  end;
end;

procedure TSparseList.NewList(Quantum: TSPAQuantum);
begin
  FQuantum := Quantum;
  FList := TSparsePointerArray.Create(Quantum)
end;

procedure TSparseList.Put(Index: Integer; Item: Pointer);
begin
  if Index < 0 then Error;
  FList[Index] := Item;
  FCount := FList.HighBound + 1
end;

{ TStringSparseList }

constructor TStringSparseList.Create(Quantum: TSPAQuantum);
begin
  FList := TSparseList.Create(Quantum)
end;

destructor  TStringSparseList.Destroy;
begin
  if FList <> nil then begin
    Clear;
    FList.Destroy
  end
end;

procedure TStringSparseList.ReadData(Reader: TReader);
var
  i: Integer;
begin
  with Reader do begin
    i := Integer(ReadInteger);
    while i > 0 do begin
      InsertObject(Integer(ReadInteger), ReadString, nil);
      Dec(i)
    end
  end
end;

procedure TStringSparseList.WriteData(Writer: TWriter);
var
  itemCount: Integer;

  function  CountItem(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    Inc(itemCount);
    Result := 0
  end;

  function  StoreItem(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    with Writer do
    begin
      WriteInteger(TheIndex);           { Item index }
      WriteString(PStrItem(TheItem)^.FString);
    end;
    Result := 0
  end;

begin
  with Writer do
  begin
    itemCount := 0;
    FList.ForAll(@CountItem);
    WriteInteger(itemCount);
    FList.ForAll(@StoreItem);
  end
end;

procedure TStringSparseList.DefineProperties(Filer: TFiler);
begin
  Filer.DefineProperty('List', ReadData, WriteData, True);
end;

function  TStringSparseList.Get(Index: Integer): String;
var
  p: PStrItem;
begin
  p := PStrItem(FList[Index]);
  if p = nil then Result := '' else Result := p^.FString
end;

function  TStringSparseList.GetCount: Integer;
begin
  Result := FList.Count
end;

function  TStringSparseList.GetObject(Index: Integer): TObject;
var
  p: PStrItem;
begin
  p := PStrItem(FList[Index]);
  if p = nil then Result := nil else Result := p^.FObject
end;

procedure TStringSparseList.Put(Index: Integer; const S: String);
var
  p: PStrItem;
  obj: TObject;
begin
  p := PStrItem(FList[Index]);
  if p = nil then obj := nil else obj := p^.FObject;
  if (S = '') and (obj = nil) then   { Nothing left to store }
    FList[Index] := nil
  else
    FList[Index] := NewStrItem(S, obj);
  if p <> nil then DisposeStrItem(p);
  Changed
end;

procedure TStringSparseList.PutObject(Index: Integer; AObject: TObject);
var
  p: PStrItem;
begin
  p := PStrItem(FList[Index]);
  if p <> nil then
    p^.FObject := AObject
  else if AObject <> nil then
    FList[Index] := NewStrItem('',AObject);
  Changed
end;

procedure TStringSparseList.Changed;
begin
  if Assigned(FOnChange) then FOnChange(Self)
end;

procedure TStringSparseList.Error;
begin
{$IFDEF IVWIDE}
  raise EStringSparseListError.Create(SPutObjectError);
{$ELSE}
  raise EStringSparseListError.CreateRes(SPutObjectError);
{$ENDIF}
end;

procedure TStringSparseList.Delete(Index: Integer);
var
  p: PStrItem;
begin
  p := PStrItem(FList[Index]);
  if p <> nil then DisposeStrItem(p);
  FList.Delete(Index);
  Changed
end;

procedure TStringSparseList.Exchange(Index1, Index2: Integer);
begin
  FList.Exchange(Index1, Index2);
end;

procedure TStringSparseList.Insert(Index: Integer; const S: String);
begin
  FList.Insert(Index, NewStrItem(S, nil));
  Changed
end;

procedure TStringSparseList.Clear;

  function  ClearItem(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    DisposeStrItem(PStrItem(TheItem));    { Item guaranteed non-nil }
    Result := 0
  end;

begin
  FList.ForAll(@ClearItem);
  FList.Clear;
  Changed
end;

{ TIvStringGridStrings }

constructor TIvStringGridStrings.Create(AGrid: TIvStringGrid; AIndex: Longint);
begin
  inherited Create;
  FGrid := AGrid;
  FIndex := AIndex;
end;

procedure TIvStringGridStrings.Assign(Source: TPersistent);
var
  I, Max: Integer;
begin
  if Source is TStrings then
  begin
    BeginUpdate;
    Max := TStrings(Source).Count - 1;
    if Max >= Count then Max := Count - 1;
    try
      for I := 0 to Max do
      begin
        Put(I, TStrings(Source).Strings[I]);
        PutObject(I, TStrings(Source).Objects[I]);
      end;
    finally
      EndUpdate;
    end;
    Exit;
  end;
  inherited Assign(Source);
end;

procedure TIvStringGridStrings.CalcXY(Index: Integer; var X, Y: Integer);
begin
  if FIndex = 0 then
  begin
    X := -1; Y := -1;
  end else if FIndex > 0 then
  begin
    X := Index;
    Y := FIndex - 1;
  end else
  begin
    X := -FIndex - 1;
    Y := Index;
  end;
end;

{ Changes the meaning of Add to mean copy to the first empty string }
function TIvStringGridStrings.Add(const S: string): Integer;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if Strings[I] = '' then
    begin
      Strings[I] := S;
      Result := I;
      Exit;
    end;
  Result := -1;
end;

procedure TIvStringGridStrings.Clear;
var
  SSList: TStringSparseList;
  I: Integer;

  function BlankStr(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    Objects[TheIndex] := nil;
    Strings[TheIndex] := '';
    Result := 0;
  end;

begin
  if FIndex > 0 then
  begin
    SSList := TStringSparseList(TSparseList(FGrid.FData)[FIndex - 1]);
    if SSList <> nil then SSList.List.ForAll(@BlankStr);
  end
  else if FIndex < 0 then
    for I := Count - 1 downto 0 do
    begin
      Objects[I] := nil;
      Strings[I] := '';
    end;
end;

{$IFDEF IVWIDE}
procedure TIvStringGridStrings.Delete(Index: Integer);
begin
  InvalidOp(sInvalidStringGridOp);
end;

procedure TIvStringGridStrings.Insert(Index: Integer; const S: string);
begin
  InvalidOp(sInvalidStringGridOp);
end;
{$ENDIF}

function TIvStringGridStrings.Get(Index: Integer): string;
var
  X, Y: Integer;
begin
  CalcXY(Index, X, Y);
  if X < 0 then Result := '' else Result := FGrid.Cells[X, Y];
end;

function TIvStringGridStrings.GetCount: Integer;
begin
  { Count of a row is the column count, and vice versa }
  if FIndex = 0 then Result := 0
  else if FIndex > 0 then Result := Integer(FGrid.ColCount)
  else Result := Integer(FGrid.RowCount);
end;

function TIvStringGridStrings.GetObject(Index: Integer): TObject;
var
  X, Y: Integer;
begin
  CalcXY(Index, X, Y);
  if X < 0 then Result := nil else Result := FGrid.Objects[X, Y];
end;

procedure TIvStringGridStrings.Put(Index: Integer; const S: string);
var
  X, Y: Integer;
begin
  CalcXY(Index, X, Y);
  FGrid.Cells[X, Y] := S;
end;

procedure TIvStringGridStrings.PutObject(Index: Integer; AObject: TObject);
var
  X, Y: Integer;
begin
  CalcXY(Index, X, Y);
  FGrid.Objects[X, Y] := AObject;
end;

procedure TIvStringGridStrings.SetUpdateState(Updating: Boolean);
begin
  FGrid.SetUpdateState(Updating);
end;

{ TIvStringGrid }

constructor TIvStringGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Initialize;
end;

destructor TIvStringGrid.Destroy;

  function FreeItem(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    TObject(TheItem).Free;
    Result := 0;
  end;

begin
  if FRows <> nil then
  begin
    TSparseList(FRows).ForAll(@FreeItem);
    TSparseList(FRows).Free;
  end;

  if FCols <> nil then
  begin
    TSparseList(FCols).ForAll(@FreeItem);
    TSparseList(FCols).Free;
  end;

  if FData <> nil then
  begin
    TSparseList(FData).ForAll(@FreeItem);
    TSparseList(FData).Free;
  end;

  inherited Destroy;
end;

procedure TIvStringGrid.ColumnMoved(FromIndex, ToIndex: Longint);

  function MoveColData(Index: Integer; ARow: TStringSparseList): Integer; far;
  begin
    ARow.Move(FromIndex, ToIndex);
    Result := 0;
  end;

begin
  TSparseList(FData).ForAll(@MoveColData);
  Invalidate;
  inherited ColumnMoved(FromIndex, ToIndex);
end;

procedure TIvStringGrid.RowMoved(FromIndex, ToIndex: Longint);
begin
  TSparseList(FData).Move(FromIndex, ToIndex);
  Invalidate;
  inherited RowMoved(FromIndex, ToIndex);
end;

function TIvStringGrid.GetEditText(ACol, ARow: Longint): string;
begin
  Result := Cells[ACol, ARow];
  if Assigned(FOnGetEditText) then FOnGetEditText(Self, ACol, ARow, Result);
end;

procedure TIvStringGrid.SetEditText(ACol, ARow: Longint; const Value: string);
begin
  DisableEditUpdate;
  try
    if Value <> Cells[ACol, ARow] then Cells[ACol, ARow] := Value;
  finally
    EnableEditUpdate;
  end;
  inherited SetEditText(ACol, ARow, Value);
end;

procedure TIvStringGrid.DrawCell(
  ACol, ARow: Longint;
  ARect: TRect;
  AState: TIvGridDrawState);
var
  str: String;
  flags: Integer;
begin
  if DefaultDrawing then
  begin
    str := Cells[ACol, ARow];
{$IFDEF IVPRO32}
    if IvIsLocaleBidirectional(ColLocale[ACol]) then
    begin
      InflateRect(ARect, -3, -2);
      flags := DT_RIGHT or DT_RTLREADING;
    end
    else
{$ENDIF}
    begin
      InflateRect(ARect, -2, -2);
      flags := DT_LEFT;
    end;
    DrawTextEx(
      Canvas.Handle,
      PChar(str),
      Length(str),
      ARect,
      flags,
      nil);
  end;
  inherited DrawCell(ACol, ARow, ARect, AState);
end;

procedure TIvStringGrid.DisableEditUpdate;
begin
  Inc(FEditUpdate);
end;

procedure TIvStringGrid.EnableEditUpdate;
begin
  Dec(FEditUpdate);
end;

procedure TIvStringGrid.Initialize;
var
  quantum: TSPAQuantum;
begin
  if FCols = nil then
  begin
    if ColCount > 512 then quantum := SPALarge else quantum := SPASmall;
    FCols := TSparseList.Create(quantum);
  end;
  if RowCount > 256 then quantum := SPALarge else quantum := SPASmall;
  if FRows = nil then FRows := TSparseList.Create(quantum);
  if FData = nil then FData := TSparseList.Create(quantum);
end;

procedure TIvStringGrid.SetUpdateState(Updating: Boolean);
begin
  FUpdating := Updating;
  if not Updating and FNeedsUpdating then
  begin
    InvalidateGrid;
    FNeedsUpdating := False;
  end;
end;

procedure TIvStringGrid.UpdateCell(ACol, ARow: Integer);
begin
  if not FUpdating then InvalidateCell(ACol, ARow)
  else FNeedsUpdating := True;
  if (ACol = Col) and (ARow = Row) and (FEditUpdate = 0) then InvalidateEditor;
end;

function  TIvStringGrid.EnsureColRow(Index: Integer; IsCol: Boolean):
  TIvStringGridStrings;
var
  RCIndex: Integer;
  PList: PSparseList;
begin
  if IsCol then
    PList := PSparseList(@FCols)
  else
    PList := PSparseList(@FRows);
  Result := TIvStringGridStrings(PList^[Index]);
  if Result = nil then
  begin
    if IsCol then RCIndex := -Index - 1 else RCIndex := Index + 1;
    Result := TIvStringGridStrings.Create(Self, RCIndex);
    PList^[Index] := Result;
  end;
end;

function  TIvStringGrid.EnsureDataRow(ARow: Integer): Pointer;
var
  quantum: TSPAQuantum;
begin
  Result := TStringSparseList(TSparseList(FData)[ARow]);
  if Result = nil then
  begin
    if ColCount > 512 then quantum := SPALarge else quantum := SPASmall;
    Result := TStringSparseList.Create(quantum);
    TSparseList(FData)[ARow] := Result;
  end;
end;

function TIvStringGrid.GetCells(ACol, ARow: Integer): string;
var
  ssl: TStringSparseList;
begin
  ssl := TStringSparseList(TSparseList(FData)[ARow]);
  if ssl = nil then Result := '' else Result := ssl[ACol];
end;

function TIvStringGrid.GetCols(Index: Integer): TStrings;
begin
  Result := EnsureColRow(Index, True);
end;

function TIvStringGrid.GetObjects(ACol, ARow: Integer): TObject;
var
  ssl: TStringSparseList;
begin
  ssl := TStringSparseList(TSparseList(FData)[ARow]);
  if ssl = nil then Result := nil else Result := ssl.Objects[ACol];
end;

function TIvStringGrid.GetRows(Index: Integer): TStrings;
begin
  Result := EnsureColRow(Index, False);
end;

procedure TIvStringGrid.SetCells(ACol, ARow: Integer; const Value: string);
begin
  TIvStringGridStrings(EnsureDataRow(ARow))[ACol] := Value;
  EnsureColRow(ACol, True);
  EnsureColRow(ARow, False);
  UpdateCell(ACol, ARow);
end;

procedure TIvStringGrid.SetCols(Index: Integer; Value: TStrings);
begin
  EnsureColRow(Index, True).Assign(Value);
end;

procedure TIvStringGrid.SetObjects(ACol, ARow: Integer; Value: TObject);
begin
  TIvStringGridStrings(EnsureDataRow(ARow)).Objects[ACol] := Value;
  EnsureColRow(ACol, True);
  EnsureColRow(ARow, False);
  UpdateCell(ACol, ARow);
end;

procedure TIvStringGrid.SetRows(Index: Integer; Value: TStrings);
begin
  EnsureColRow(Index, False).Assign(Value);
end;
{$ENDIF}

end.


