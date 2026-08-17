unit CMStrGrd;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids;

type
  TCMStringGrid = class(TStringGrid)
  private
    { Private declarations }
    FBeforeDrawText: TDrawCellEvent;
  protected
    { Protected declarations }
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TGridDrawState); override;
    procedure DoBeforeDrawText(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
  public
    { Public declarations }
    procedure CalcDrawInfo(var DrawInfo: TGridDrawInfo);
    procedure CalcDrawInfoXY(var DrawInfo: TGridDrawInfo;
                             UseWidth, UseHeight: Integer);
    procedure CalcFixedInfo(var DrawInfo: TGridDrawInfo);
    procedure GridRectToScreenRect(GridRect: TGridRect;
                                   var ScreenRect: TRect; IncludeLine: Boolean);
    procedure InvalidateRect(ARect: TGridRect);
    procedure InvalidateRow(ARow: Longint);
    procedure InvalidateCell(ACol, ARow: Longint);
    function GetColWidths(Index: Longint): Integer;
    function GetRowHeights(Index: Longint): Integer;
  published
    { Published declarations }
    property BeforeDrawText: TDrawCellEvent read FBeforeDrawText write FBeforeDrawText;
  end;


implementation

function TCMStringGrid.GetColWidths(Index: Longint): Integer;
begin
   Result := ColWidths[index];
end;

function TCMStringGrid.GetRowHeights(Index: Longint): Integer;
begin
   Result := RowHeights[index];
end;

procedure TCMStringGrid.DrawCell(ACol, ARow: Longint; ARect: TRect;
  AState: TGridDrawState);
begin
  DoBeforeDrawText(ACol, ARow, ARect, AState);
  inherited DrawCell(ACol, ARow, ARect, AState);
end;

procedure TCMStringGrid.DoBeforeDrawText(ACol, ARow: Longint; ARect: TRect;
  AState: TGridDrawState);
begin
  if Assigned(FBeforeDrawText) then FBeforeDrawText(Self, ACol, ARow, ARect, AState);
end;

procedure TCMStringGrid.InvalidateCell(ACol, ARow: Longint);
var
  Rect: TGridRect;

begin
  Rect.Top := ARow;
  Rect.Left := ACol;
  Rect.Bottom := ARow;
  Rect.Right := ACol;
  InvalidateRect(Rect);
end;

procedure TCMStringGrid.InvalidateRow(ARow: Longint);
var
  Rect: TGridRect;

begin
  Rect.Top := ARow;
  Rect.Left := 0;
  Rect.Bottom := ARow;
  Rect.Right := VisibleColCount - 1;
  InvalidateRect(Rect);
end;

procedure TCMStringGrid.InvalidateRect(ARect: TGridRect);
var
  InvalidRect: TRect;
begin
  if not HandleAllocated then Exit;
  GridRectToScreenRect(ARect, InvalidRect, True);
  WinProcs.InvalidateRect(Handle, @InvalidRect, False);
end;

procedure TCMStringGrid.GridRectToScreenRect(GridRect: TGridRect;
  var ScreenRect: TRect; IncludeLine: Boolean);

  function LinePos(const AxisInfo: TGridAxisDrawInfo; Line: Integer): Integer;
  var
    Start, I: Longint;
  begin
    with AxisInfo do
    begin
      Result := 0;
      if Line < FixedCellCount then
        Start := 0
      else
      begin
        if Line >= FirstGridCell then
          Result := FixedBoundary;
        Start := FirstGridCell;
      end;
      for I := Start to Line - 1 do
      begin
        Inc(Result, GetExtent(I) + EffectiveLineWidth);
        if Result > GridExtent then
        begin
          Result := 0;
          Exit;
        end;
      end;
    end;
  end;

  function CalcAxis(const AxisInfo: TGridAxisDrawInfo;
    GridRectMin, GridRectMax: Integer;
    var ScreenRectMin, ScreenRectMax: Integer): Boolean;
  begin
    Result := False;
    with AxisInfo do
    begin
      if (GridRectMin >= FixedCellCount) and (GridRectMin < FirstGridCell) then
        if GridRectMax < FirstGridCell then
        begin
          FillChar(ScreenRect, SizeOf(ScreenRect), 0); { erase partial results }
          Exit;
        end
        else
          GridRectMin := FirstGridCell;
      if GridRectMax > LastFullVisibleCell then
      begin
        GridRectMax := LastFullVisibleCell;
        if GridRectMax < GridCellCount - 1 then Inc(GridRectMax);
        if LinePos(AxisInfo, GridRectMax) = 0 then
          Dec(GridRectMax);
      end;

      ScreenRectMin := LinePos(AxisInfo, GridRectMin);
      ScreenRectMax := LinePos(AxisInfo, GridRectMax);
      if ScreenRectMax = 0 then
        ScreenRectMax := ScreenRectMin + GetExtent(GridRectMin)
      else
        Inc(ScreenRectMax, GetExtent(GridRectMax));
      if ScreenRectMax > GridExtent then
        ScreenRectMax := GridExtent;
      if IncludeLine then Inc(ScreenRectMax, EffectiveLineWidth);
    end;
    Result := True;
  end;

var
  DrawInfo: TGridDrawInfo;
begin
  FillChar(ScreenRect, SizeOf(ScreenRect), 0);
  if (GridRect.Left > GridRect.Right) or (GridRect.Top > GridRect.Bottom) then
    Exit;
  CalcDrawInfo(DrawInfo);
  with DrawInfo do
  begin
    if GridRect.Left > Horz.LastFullVisibleCell + 1 then Exit;
    if GridRect.Top > Vert.LastFullVisibleCell + 1 then Exit;

    if CalcAxis(Horz, GridRect.Left, GridRect.Right, ScreenRect.Left,
      ScreenRect.Right) then
    begin
      CalcAxis(Vert, GridRect.Top, GridRect.Bottom, ScreenRect.Top,
        ScreenRect.Bottom);
    end;
  end;
end;

procedure TCMStringGrid.CalcDrawInfo(var DrawInfo: TGridDrawInfo);
begin
  CalcDrawInfoXY(DrawInfo, ClientWidth, ClientHeight);
end;

procedure TCMStringGrid.CalcDrawInfoXY(var DrawInfo: TGridDrawInfo;
  UseWidth, UseHeight: Integer);

  procedure CalcAxis(var AxisInfo: TGridAxisDrawInfo; UseExtent: Integer);
  var
    I: Integer;
  begin
    with AxisInfo do
    begin
      GridExtent := UseExtent;
      GridBoundary := FixedBoundary;
      FullVisBoundary := FixedBoundary;
      LastFullVisibleCell := FirstGridCell;
      for I := FirstGridCell to GridCellCount - 1 do
      begin
        Inc(GridBoundary, GetExtent(I) + EffectiveLineWidth);
        if GridBoundary > GridExtent + EffectiveLineWidth then
        begin
          GridBoundary := GridExtent;
          Break;
        end;
        LastFullVisibleCell := I;
        FullVisBoundary := GridBoundary;
      end;
    end;
  end;

begin
  CalcFixedInfo(DrawInfo);
  CalcAxis(DrawInfo.Horz, UseWidth);
  CalcAxis(DrawInfo.Vert, UseHeight);
end;

procedure TCMStringGrid.CalcFixedInfo(var DrawInfo: TGridDrawInfo);

  procedure CalcFixedAxis(var Axis: TGridAxisDrawInfo; LineOptions: TGridOptions;
    FixedCount, FirstCell, CellCount: Integer; GetExtentFunc: TGetExtentsFunc);
  var
    I: Integer;
  begin
    with Axis do
    begin
      if LineOptions * Options = [] then
        EffectiveLineWidth := 0
      else
        EffectiveLineWidth := GridLineWidth;

      FixedBoundary := 0;
      for I := 0 to FixedCount - 1 do
        Inc(FixedBoundary, GetExtentFunc(I) + EffectiveLineWidth);

      FixedCellCount := FixedCount;
      FirstGridCell := FirstCell;
      GridCellCount := CellCount;
      GetExtent := GetExtentFunc;
    end;
  end;

begin
  CalcFixedAxis(DrawInfo.Horz, [goFixedVertLine, goVertLine], FixedCols,
    LeftCol, ColCount, GetColWidths);
  CalcFixedAxis(DrawInfo.Vert, [goFixedHorzLine, goHorzLine], FixedRows,
    TopRow, RowCount, GetRowHeights);
end;

end.
