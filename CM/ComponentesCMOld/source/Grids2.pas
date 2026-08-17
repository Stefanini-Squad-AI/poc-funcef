
{*******************************************************}
{                                                       }
{       Delphi Visual Component Library                 }
{                                                       }
{       Copyright (c) 1995,96 Borland International     }
{                                                       }
{*******************************************************}

unit Grids2;

{$R-}

interface

uses SysUtils, Messages, Windows, Classes, Graphics, Menus, Controls, Forms,
  StdCtrls, Mask, Grids;

type
  { TDrawGrid2 }

  { A grid relies on the OnDrawCell event to display the cells.
     CellRect
       This method returns control relative screen coordinates of the cell or
       an empty rectangle if the cell is not visible.
     EditorMode
       Setting to true shows the editor, as if the F2 key was pressed, when
       goEditing is turned on and goAlwaysShowEditor is turned off.
     MouseToCell
       Takes control relative screen X, Y location and fills in the column and
       row that contain that point.
     OnColumnMoved
       Called when the user request to move a column with the mouse when
       the goColMoving option is on.
     OnDrawCell
       This event is passed the same information as the DrawCell method
       discussed above.
     OnGetEditMask
       Called to retrieve edit mask in the inplace editor when goEditing is
       turned on.
     OnGetEditText
       Called to retrieve text to edit when goEditing is turned on.
     OnRowMoved
       Called when the user request to move a row with the mouse when
       the goRowMoving option is on.
     OnSetEditText
       Called when goEditing is turned on to reflect changes to the text
       made by the editor.
     OnTopLeftChanged
       Invoked when TopRow or LeftCol change. }

  TDrawGrid2 = class(TCustomGrid)
  private
    FOnColumnMoved: TMovedEvent;
    FOnDrawCell: TDrawCellEvent;
    FOnGetEditMask: TGetEditEvent;
    FOnGetEditText: TGetEditEvent;
    FOnRowMoved: TMovedEvent;
    FOnSelectCell: TSelectCellEvent;
    FOnSetEditText: TSetEditEvent;
    FOnTopLeftChanged: TNotifyEvent;
  protected
    procedure ColumnMoved(FromIndex, ToIndex: Longint); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TGridDrawState); override;
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
    property OnColumnMoved: TMovedEvent read FOnColumnMoved write FOnColumnMoved;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawCell: TDrawCellEvent read FOnDrawCell write FOnDrawCell;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetEditMask: TGetEditEvent read FOnGetEditMask write FOnGetEditMask;
    property OnGetEditText: TGetEditEvent read FOnGetEditText write FOnGetEditText;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnRowMoved: TMovedEvent read FOnRowMoved write FOnRowMoved;
    property OnSelectCell: TSelectCellEvent read FOnSelectCell write FOnSelectCell;
    property OnSetEditText: TSetEditEvent read FOnSetEditText write FOnSetEditText;
    property OnStartDrag;
    property OnTopLeftChanged: TNotifyEvent read FOnTopLeftChanged write FOnTopLeftChanged;
  public
    procedure InvalidateRow_(ARow: Longint);
    procedure InvalidateCell_(ACol, ARow: Longint);
  end;

implementation

uses Consts;

{ TDrawGrid2 }

function TDrawGrid2.CellRect(ACol, ARow: Longint): TRect;
begin
  Result := inherited CellRect(ACol, ARow);
end;

procedure TDrawGrid2.MouseToCell(X, Y: Integer; var ACol, ARow: Longint);
var
  Coord: TGridCoord;
begin
  Coord := MouseCoord(X, Y);
  ACol := Coord.X;
  ARow := Coord.Y;
end;

procedure TDrawGrid2.ColumnMoved(FromIndex, ToIndex: Longint);
begin
  if Assigned(FOnColumnMoved) then FOnColumnMoved(Self, FromIndex, ToIndex);
end;

function TDrawGrid2.GetEditMask(ACol, ARow: Longint): string;
begin
  Result := '';
  if Assigned(FOnGetEditMask) then FOnGetEditMask(Self, ACol, ARow, Result);
end;

function TDrawGrid2.GetEditText(ACol, ARow: Longint): string;
begin
  Result := '';
  if Assigned(FOnGetEditText) then FOnGetEditText(Self, ACol, ARow, Result);
end;

procedure TDrawGrid2.RowMoved(FromIndex, ToIndex: Longint);
begin
  if Assigned(FOnRowMoved) then FOnRowMoved(Self, FromIndex, ToIndex);
end;

function TDrawGrid2.SelectCell(ACol, ARow: Longint): Boolean;
begin
  Result := True;
  if Assigned(FOnSelectCell) then FOnSelectCell(Self, ACol, ARow, Result);
end;

procedure TDrawGrid2.SetEditText(ACol, ARow: Longint; const Value: string);
begin
  if Assigned(FOnSetEditText) then FOnSetEditText(Self, ACol, ARow, Value);
end;

procedure TDrawGrid2.DrawCell(ACol, ARow: Longint; ARect: TRect;
  AState: TGridDrawState);
begin
  if Assigned(FOnDrawCell) then FOnDrawCell(Self, ACol, ARow, ARect, AState);
end;

procedure TDrawGrid2.TopLeftChanged;
begin
  inherited TopLeftChanged;
  if Assigned(FOnTopLeftChanged) then FOnTopLeftChanged(Self);
end;

procedure TDrawGrid2.InvalidateRow_(ARow: Longint);
begin
   InvalidateRow(ARow);
end;

procedure TDrawGrid2.InvalidateCell_(ACol, ARow: Longint);
begin
   InvalidateCell(ACol, ARow);
end;


end.


