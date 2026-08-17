unit IvDateTi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IvButtons, Menus, IvDictio;

type
  TIvCalendarButton = class(TIvFrameButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TIvCalendarGrid = class(TGraphicControl)
  private
    FDate: TDateTime;
    FFirstDate: TDateTime;
    FColCount: Integer;
    FColWidth: Integer;
    FRowCount: Integer;
    FRowHeight: Integer;
    FOldPos: TPoint;
    FTracking: Boolean;
    FOnChange: TNotifyEvent;
    FOnSelect: TNotifyEvent;

    function GetDay: Word;
    function GetMonth: Word;
    function GetYear: Word;
    function GetWeek: Word;
    function GetWeeks(row: Integer): Integer;
    function GetDates(col, row: Integer): TDateTime;

    procedure SetDay(value: Word);
    procedure SetMonth(value: Word);
    procedure SetYear(value: Word);
    procedure SetWeek(value: Word);
    procedure SetDate(value: TDateTime);

    function CellAt(x, y: Integer): TPoint;
    function CellRect(col, row: Integer): TRect;
    function AcceptCell(col, row: Integer): Boolean;
    procedure ToggleCell(col, row: Integer);

  protected
    function GetLocaleData: TIvLocale;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;

    procedure Paint; override;

  public
    constructor Create(AOwner: TComponent); override;

    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

    property Day: Word read GetDay write SetDay;
    property Month: Word read GetMonth write SetMonth;
    property Year: Word read GetYear write SetYear;
    property Week: Word read GetWeek write SetWeek;
    property Date: TDateTime read FDate write SetDate;
    property Weeks[row: Integer]: Integer read GetWeeks;
    property Dates[col, row: Integer]: TDateTime read GetDates;

  protected
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnSelect: TNotifyEvent read FOnSelect write FOnSelect;
  end;

  TIvCalendar = class(TCustomControl)
  private
    FMargin: Integer;
    FPriorMonth: TIvCalendarButton;
    FNextMonth: TIvCalendarButton;
    FPriorYear: TIvCalendarButton;
    FNextYear: TIvCalendarButton;
    FMonth: TLabel;
    FMonthMenu: TPopupMenu;
    FYear: TLabel;
    FToday: TLabel;
    FTodayCaption: String;
    FGrid: TIvCalendarGrid;
    FOnSelect: TNotifyEvent;

    function GetDate: TDateTime;
    function GetWeek: Integer;

    procedure SetTodayCaption(const value: String);
    procedure SetDate(value: TDateTime);
    procedure SetWeek(value: Integer);

    procedure PriorMonthClick(Sender: TObject);
    procedure NextMonthClick(Sender: TObject);
    procedure PriorYearClick(Sender: TObject);
    procedure NextYearClick(Sender: TObject);
    procedure MonthClick(Sender: TObject);
    procedure MonthMenuClick(Sender: TObject);
    procedure TodayClick(Sender: TObject);
    procedure ValueChange(Sender: TObject);
    procedure ValueSelect(Sender: TObject);

  protected
    procedure Paint; override;

  public
    constructor Create(AOwner: TComponent); override;

    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

    property Date: TDateTime read GetDate write SetDate;
    property Week: Integer read GetWeek write SetWeek;

  published
    //property Width default 100;
    //property Height default 100;
    property TodayCaption: String read FTodayCaption write SetTodayCaption;
    property OnSelect: TNotifyEvent read FOnSelect write FOnSelect;
  end;

  TIvDateTimeList = class(TIvCalendar)
  private
    procedure WMMouseActivate(var Message: TMessage); message WM_MOUSEACTIVATE;

  protected
    procedure CreateParams(var Params: TCreateParams); override;

  public
    constructor Create(AOwner: TComponent); override;
  end;

  TIvDateTimeButton = class(TIvFrameButton)
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;

  public
    constructor Create(AOwner: TComponent); override;
  end;

  TIvDateTimeKind = (dtkYear, dtkMonth, dtkWeek, dtkDate, dtkTime);

  TIvCustomDateTimeEdit = class(TCustomEdit)
  private
    FButton: TIvFrameButton;
    FKind: TIvDateTimeKind;
    FList: TIvDateTimeList;
    FListVisible: Boolean;

    function GetAsDate: TDateTime;
    function GetAsString: String;
    function GetListHeight: Integer;
    function GetListWidth: Integer;

    procedure SetAsDate(value: TDateTime);
    procedure SetAsString(const value: String);
    procedure SetKind(value: TIvDateTimeKind);
    procedure SetListHeight(value: Integer);
    procedure SetListWidth(value: Integer);

    procedure SetEditRect;

    procedure ListSelect(Sender: TObject);

    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;

  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyPress(var Key: Char); override;

    function AcceptChar(key: Char): Boolean; virtual;
    procedure SelectListValue; virtual;

  public
    constructor Create(AOwner: TComponent); override;

    procedure DropDown;
    procedure CloseUp(accept: Boolean);

    procedure Clear; override;

    property AsDate: TDateTime read GetAsDate write SetAsDate;
    property AsString: String read GetAsString write SetAsString;
    property ListVisible: Boolean read FListVisible;

  published
    property Kind: TIvDateTimeKind read FKind write SetKind;
    property ListHeight: Integer read GetListHeight write SetListHeight;
    property ListWidth: Integer read GetListWidth write SetListWidth;
  end;

  TIvDateTimeEdit = class(TIvCustomDateTimeEdit)
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ Utils }

procedure IvDrawTextRect(
  canvas: TCanvas;
  const text: String;
  rect: TRect;
  alignment: TAlignment);

implementation

uses
  IvMlUtil;

// Utils

procedure IvDrawTextRect(
  canvas: TCanvas;
  const text: String;
  rect: TRect;
  alignment: TAlignment);
const
  alignments: array[TAlignment] of Integer = (DT_LEFT, DT_RIGHT, DT_CENTER);
begin
  DrawText(
    canvas.Handle,
    PChar(text),
    StrLen(PChar(text)),
    rect,
    alignments[alignment] or DT_VCENTER or DT_SINGLELINE);
end;

procedure DrawTodayMark(canvas: TCanvas; rect: TRect);
begin
  canvas.Pen.Color := clRed;
  canvas.Pen.Style := psSolid;
  canvas.Pen.Width := 2;
  canvas.Brush.Style := bsClear;
  canvas.Ellipse(rect.Left, rect.Top, rect.Right, rect.Bottom);
end;


// TIvCalendarButton

constructor TIvCalendarButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Timed := True;
  FrameType := DFC_SCROLL;
end;


// TIvCalendarGrid

constructor TIvCalendarGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FColCount := 8;
  FRowCount := 7;
end;

function TIvCalendarGrid.GetDay: Word;
var
  year, month, day: Word;
begin
  DecodeDate(Date, year, month, day);
  Result := day;
end;

procedure TIvCalendarGrid.SetDay(value: Word);
var
  year, month, day: Word;
begin
  DecodeDate(Date, year, month, day);

  if day <> value then
    Date := EncodeDate(year, month, value);
end;

function TIvCalendarGrid.GetMonth: Word;
var
  year, month, day: Word;
begin
  DecodeDate(Date, year, month, day);
  Result := month;
end;

procedure TIvCalendarGrid.SetMonth(value: Word);
var
  year, month, day: Word;
begin
  DecodeDate(Date, year, month, day);

  if month <> value then
    Date := IncMonth(FDate, value - month);
end;

function TIvCalendarGrid.GetYear: Word;
var
  year, month, day: Word;
begin
  DecodeDate(Date, year, month, day);
  Result := year;
end;

procedure TIvCalendarGrid.SetYear(value: Word);
var
  year, month, day: Word;
begin
  DecodeDate(Date, year, month, day);

  if year <> value then
    Date := EncodeDate(value, month, day);
end;

function TIvCalendarGrid.GetLocaleData: TIvLocale;
begin
  Result := IvDictio.GetDefaultDictionary.LocaleData;
end;

function TIvCalendarGrid.GetWeek: Word;
begin
  with GetLocaleData do
    Result := IvWeek(FDate, FirstWeekOfYear, FirstDayOfWeek);
end;

procedure TIvCalendarGrid.SetWeek(value: Word);
begin
end;

procedure TIvCalendarGrid.SetDate(value: TDateTime);
begin
  if FDate <> value then
  begin
    FDate := value;
    with GetLocaleData do
    begin
      FFirstDate := IvFirstDayOfWeek(IvFirstDayOfMonth(FDate), FirstDayOfWeek);

      if IvDayOfWeekNumber(IvFirstDayOfMonth(FDate), FirstDayOfWeek) = 1 then
        FFirstDate := FFirstDate - 7;
    end;

    if Assigned(FOnChange) then
      FOnChange(Self);

    Invalidate;
  end;
end;

function TIvCalendarGrid.GetDates(col, row: Integer): TDateTime;
begin
  Result := FFirstDate + (FColCount - 1)*row + col;
end;

function TIvCalendarGrid.GetWeeks(row: Integer): Integer;
begin
  with GetLocaleData do
    Result := (IvWeek(FFirstDate, FirstWeekOfYear, FirstDayOfWeek) + row - 1) mod 52 + 1;
end;

procedure TIvCalendarGrid.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  FColWidth := Width div FColCount;
  FRowHeight := Height div FRowCount;
end;

function TIvCalendarGrid.CellAt(x, y: Integer): TPoint;
begin
  Result.X := x div FColWidth;
  Result.Y := y div FRowHeight;
end;

function TIvCalendarGrid.CellRect(col, row: Integer): TRect;
begin
  Result.Left := col*FColWidth;
  Result.Top := row*FRowHeight;
  Result.Right := Result.Left + FColWidth;
  Result.Bottom := Result.Top + FRowHeight;
end;

procedure TIvCalendarGrid.ToggleCell(col, row: Integer);
begin
  DrawFocusRect(Canvas.Handle, CellRect(col, row));
end;

function TIvCalendarGrid.AcceptCell(col, row: Integer): Boolean;
begin
  Result := (0 < col) and (col < FColCount) and
    (0 < row) and (row < FRowCount);
end;

procedure TIvCalendarGrid.MouseDown(
  Button: TMouseButton;
  Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);

  if Button = mbLeft then
  begin
    with CellAt(x, y) do
    begin
      if AcceptCell(x, y) then
      begin
        ToggleCell(x, y);
        FOldPos := Point(x, y);
        FTracking := True;
      end;
    end;
  end;
end;

procedure TIvCalendarGrid.MouseUp(
  Button: TMouseButton;
  Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);

  if FTracking then
  begin
    ToggleCell(FOldPos.x, FOldPos.y);

    with CellAt(x, y) do
      if AcceptCell(x, y) then
      begin
        Date := Dates[x - 1, y - 1];

        if Assigned(FOnSelect) then
          FOnSelect(Self);
      end;

    FTracking := False;
  end;
end;

procedure TIvCalendarGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);

  if FTracking then
  begin
    with CellAt(x, y) do
      if AcceptCell(x, y) then
      begin
        ToggleCell(FOldPos.x, FOldPos.y);
        ToggleCell(x, y);
        FOldPos := Point(x, y);
      end;
  end;
end;

procedure TIvCalendarGrid.Paint;
var
  item: TDateTime;
  year, month, day: Word;
  color: TColor;
  i, j: Integer;

  procedure DrawCell(
    col, row: Integer;
    const text: String;
    color: TColor;
    selected: Boolean;
    mark: Boolean);
  var
    cell: TRect;
  begin
    cell := CellRect(col, row);

    if selected then
    begin
      Canvas.Pen.Style := psClear;
      Canvas.Brush.Style := bsSolid;
      Canvas.Brush.Color := clNavy;
      Canvas.Rectangle(cell.Left, cell.Top, cell.Right, cell.Bottom);
      Canvas.Font.Color := clWhite;
    end
    else
    begin
      Canvas.Brush.Style := bsClear;
      Canvas.Font.Color := color;
    end;

    IvDrawTextRect(Canvas, text, cell, taCenter);

    if mark then
      DrawTodayMark(Canvas, cell);
  end;

begin
  { Lines }
  Canvas.Pen.Color := clBlack;
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Width := 1;
  Canvas.MoveTo(0, FRowHeight - 1);
  Canvas.LineTo(Width, FRowHeight - 1);

  Canvas.MoveTo(FColWidth - 1, 0);
  Canvas.LineTo(FColWidth - 1, FRowCount*FRowHeight);

  { Days of Week }
  Canvas.Brush.Style := bsClear;
  Canvas.Font.Style := [fsBold];
  DrawCell(0, 0, 'no', clNavy, False, False);
  Canvas.Font.Style := [];

  for i := 1 to 7 do
    DrawCell(i, 0, ShortDayNames[IvVCLDayToDay(i)], clNavy, False, False);

  { Weeks }
  Canvas.Font.Color := clRed;

  for i := 1 to FRowCount - 1 do
    DrawCell(0, i, IntToStr(Weeks[i - 1]), clRed, False, False);

  { Days }
  Canvas.Font.Color := clBlack;

  for j := 1 to FRowCount - 1 do
    for i := 1 to FColCount - 1 do
    begin
      item := Dates[i - 1, j - 1];
      DecodeDate(item, year, month, day);
      color := clSilver;

      if month = GetMonth then
        color := clBlack;

      DrawCell(i, j, IntToStr(day), color, item = FDate, item = SysUtils.Date);
    end;
end;


// TIvCalendar

constructor TIvCalendar.Create(AOwner: TComponent);
var
  i: Integer;
  item: TMenuItem;
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle + [csOpaque];
  Width := 100;
  Height := 100;

  FTodayCaption := 'Today:';
  FMargin := 4;

  { month }
  FPriorMonth := TIvCalendarButton.Create(Self);
  FPriorMonth.Parent := Self;
  FPriorMonth.FrameState := DFCS_SCROLLLEFT;
  FPriorMonth.OnClick := PriorMonthClick;

  FNextMonth := TIvCalendarButton.Create(Self);
  FNextMonth.Parent := Self;
  FNextMonth.FrameState := DFCS_SCROLLRIGHT;
  FNextMonth.OnClick := NextMonthClick;

  FMonthMenu := TPopupMenu.Create(Self);

  for i := 1 to 12 do
  begin
    item := TMenuItem.Create(Self);
    item.Caption := LongMonthNames[i];
    item.OnClick := MonthMenuClick;
    FMonthMenu.Items.Add(item);
  end;

  FMonth := TLabel.Create(Self);
  FMonth.Parent := Self;
  FMonth.Font.Color := clWhite;
  FMonth.Font.Style := [fsBold];
  FMonth.Transparent := True;
  FMonth.OnClick := MonthClick;

  { year }
  FPriorYear := TIvCalendarButton.Create(Self);
  FPriorYear.Parent := Self;
  FPriorYear.FrameState := DFCS_SCROLLLEFT;
  FPriorYear.OnClick := PriorYearClick;

  FNextYear := TIvCalendarButton.Create(Self);
  FNextYear.Parent := Self;
  FNextYear.FrameState := DFCS_SCROLLRIGHT;
  FNextYear.OnClick := NextYearClick;

  FYear := TLabel.Create(Self);
  FYear.Parent := Self;
  FYear.AutoSize := True;
  FYear.Font.Color := clWhite;
  FYear.Font.Style := [fsBold];
  FYear.Transparent := True;

  { grid }
  FGrid := TIvCalendarGrid.Create(Self);
  FGrid.Parent := Self;
  FGrid.OnSelect := ValueSelect;
  FGrid.OnChange := ValueChange;

  { today }
  FToday := TLabel.Create(Self);
  FToday.Parent := Self;
  FToday.Font.Color := clBlack;
  FToday.Font.Style := [fsBold];
  FToday.Caption := Format('%s %s', [FTodayCaption, DateToStr(SysUtils.Date)]);
  FToday.Transparent := True;
  FToday.OnClick := TodayClick;

  Date := SysUtils.Date;
end;

procedure TIvCalendar.SetTodayCaption(const value: String);
begin
  if FTodayCaption <> value then
  begin
    FTodayCaption := value;
    if FToday <> nil then
      FToday.Caption := Format('%s %s', [FTodayCaption, DateToStr(SysUtils.Date)]);
  end;
end;

function TIvCalendar.GetDate: TDateTime;
begin
  Result := FGrid.Date;
end;

procedure TIvCalendar.SetDate(value: TDateTime);
begin
  FGrid.Date := value;
end;

function TIvCalendar.GetWeek: Integer;
begin
  Result := FGrid.Week;
end;

procedure TIvCalendar.SetWeek(value: Integer);
begin
  FGrid.Week := value;
end;

procedure TIvCalendar.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
const
  buttonHeight = 17;
  buttonWidth = 16;
  upDownWidth = 12;
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);

  { year }

  if (FYear <> nil) and (FNextYear <> nil) and (FPriorYear <> nil) then
  begin
    FNextYear.SetBounds(
      Width - FMargin - buttonWidth,
      FMargin,
      buttonWidth,
      buttonHeight);

    FPriorYear.SetBounds(
      FNextYear.Left - FYear.Width - buttonWidth - 2*FMargin,
      FMargin,
      buttonWidth,
      buttonHeight);

    FYear.Left := FPriorYear.Left + buttonWidth + FMargin;
    FYear.Top := FPriorYear.Top + (buttonHeight - FYear.Height) div 2;
  end;

  { month }

  if (FMonth <> nil) and (FNextMonth <> nil) and (FPriorMonth <> nil) then
  begin
    FPriorMonth.SetBounds(
      FMargin,
      FMargin,
      buttonWidth,
      buttonHeight);

    FNextMonth.SetBounds(
      FPriorYear.Left - buttonWidth - FMargin,
      FMargin,
      buttonWidth,
      buttonHeight);

    FMonth.Left := FPriorMonth.Left + buttonWidth + FMargin;
    FMonth.Top := FYear.Top;
    FMonth.Width := FNextMonth.Left - FPriorMonth.Left - buttonWidth - 2*FMargin;
  end;

  { grid }

  if FGrid <> nil then
    FGrid.SetBounds(
      FMargin,
      3*FMargin + buttonHeight,
      Width - 2*FMargin,
      Height - FGrid.Top - 20);

  if FToday <> nil then
  begin
    FToday.Left := 30;
    FToday.Top := Height - FMargin - FToday.Height;
  end;
end;

procedure TIvCalendar.PriorMonthClick(Sender: TObject);
begin
  FGrid.Month := FGrid.Month - 1;
end;

procedure TIvCalendar.NextMonthClick(Sender: TObject);
begin
  FGrid.Month := FGrid.Month + 1;
end;

procedure TIvCalendar.PriorYearClick(Sender: TObject);
begin
  FGrid.Year := FGrid.Year - 1;
end;

procedure TIvCalendar.NextYearClick(Sender: TObject);
begin
  FGrid.Year := FGrid.Year + 1;
end;

procedure TIvCalendar.MonthClick(Sender: TObject);
begin
  with ClientToScreen(Point(FMonth.Left, FMonth.Top)) do
    FMonthMenu.Popup(x, y);
end;

procedure TIvCalendar.MonthMenuClick(Sender: TObject);
begin
  FGrid.Month := (Sender as TMenuItem).MenuIndex + 1;
end;

procedure TIvCalendar.TodayClick(Sender: TObject);
begin
  Date := SysUtils.Date;
end;

procedure TIvCalendar.ValueChange(Sender: TObject);
begin
  FMonth.Caption := LongMonthNames[FGrid.Month];
  FYear.Caption := IntToStr(FGrid.Year);
  Invalidate;
end;

procedure TIvCalendar.ValueSelect(Sender: TObject);
begin
  if Assigned(FOnSelect) then
    FOnSelect(Self);
end;

procedure TIvCalendar.Paint;
begin
  { Border }
  Canvas.Pen.Color := clBlack;
  Canvas.Pen.Width := 1;
  Canvas.Brush.Color := clWhite;
  Canvas.Brush.Style := bsSolid;
  Canvas.Rectangle(0, 0, Width, Height);

  { Caption }
  Canvas.Pen.Color := clNavy;
  Canvas.Brush.Color := clNavy;
  Canvas.Rectangle(0, 0, Width, FPriorMonth.Width + 2*FMargin);

  { Today mark }
  DrawTodayMark(
    Canvas,
    Rect(
      2*FMargin,
      FToday.Top,
      2*FMargin + Canvas.TextWidth('000'),
      FToday.Top + Canvas.TextHeight('0')));
end;


// TIvDateTimeList

constructor TIvDateTimeList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csNoDesignVisible, csReplicatable];
end;

procedure TIvDateTimeList.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := WS_POPUP;
  Params.ExStyle := WS_EX_TOOLWINDOW;
  Params.WindowClass.Style := CS_SAVEBITS;
end;

procedure TIvDateTimeList.WMMouseActivate(var Message: TMessage);
begin
  Message.Result := MA_NOACTIVATE;
end;


// TIvDateTimeButton

constructor TIvDateTimeButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FrameType := DFC_SCROLL;
end;

procedure TIvDateTimeButton.MouseDown(
  Button: TMouseButton;
  Shift: TShiftState;
  X, Y: Integer);
var
  edit: TIvCustomDateTimeEdit;
begin
  inherited MouseDown(Button, Shift, X, Y);

  if Button = mbLeft then
  begin
    edit := Owner as TIvCustomDateTimeEdit;

    if edit.ListVisible then
    begin
      edit.CloseUp(False);
      Exit;
    end;

    edit.DropDown;
  end;
end;


// TIvCustomDateTimeEdit

constructor TIvCustomDateTimeEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csSetCaption];
  FKind := dtkDate;

  FButton := TIvDateTimeButton.Create(Self);
  FButton.Parent := Self;
  FButton.Width := 16;
  FButton.Height := 17;
  FButton.Visible := True;
  FButton.FrameState := DFCS_SCROLLCOMBOBOX;

  FList := TIvDateTimeList.Create(Self);
  FList.Parent := Self;
  FList.Visible := False;
  FList.Width := 200;
  FList.Height := 160;
  FList.OnSelect := ListSelect;
end;

function TIvCustomDateTimeEdit.GetAsDate: TDateTime;
begin
  Result := StrToDate(Text);
end;

procedure TIvCustomDateTimeEdit.SetAsDate(value: TDateTime);
begin
  Text := DateToStr(value);
end;

function TIvCustomDateTimeEdit.GetAsString: String;
begin
  Result := Text;
end;

procedure TIvCustomDateTimeEdit.SetAsString(const value: String);
begin
  Text := value;
end;

function TIvCustomDateTimeEdit.GetListHeight: Integer;
begin
  Result := FList.Height;
end;

procedure TIvCustomDateTimeEdit.SetListHeight(value: Integer);
begin
  FList.Height := value;
end;

function TIvCustomDateTimeEdit.GetListWidth: Integer;
begin
  Result := FList.Width;
end;

procedure TIvCustomDateTimeEdit.SetListWidth(value: Integer);
begin
  FList.Width := value;
end;

procedure TIvCustomDateTimeEdit.SetKind(value: TIvDateTimeKind);
begin
  if FKind <> value then
  begin
    FKind := value;
    Invalidate;
  end;
end;

procedure TIvCustomDateTimeEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN;
end;

procedure TIvCustomDateTimeEdit.CreateWnd;
begin
  inherited CreateWnd;
  SetEditRect;
end;

procedure TIvCustomDateTimeEdit.ListSelect(Sender: TObject);
begin
  CloseUp(True);
end;

procedure TIvCustomDateTimeEdit.SetEditRect;
var
  loc: TRect;
begin
  SendMessage(Handle, EM_GETRECT, 0, LongInt(@loc));
  loc.Bottom := ClientHeight + 1;
  loc.Right := ClientWidth - FButton.Width - 2;
  loc.Top := 0;
  loc.Left := 0;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@loc));
end;

procedure TIvCustomDateTimeEdit.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  CloseUp(False);
end;

procedure TIvCustomDateTimeEdit.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  CloseUp(False);
end;

procedure TIvCustomDateTimeEdit.WMSize(var Message: TWMSize);
begin
  inherited;
  FButton.SetBounds(Width - FButton.Width - 4, 0, FButton.Width, Height - 4);
  SetEditRect;
end;

procedure TIvCustomDateTimeEdit.DropDown;
var
  tmp: TPoint;
begin
  tmp := Parent.ClientToScreen(Point(Left, Top + Height));
  SetFocus;
  SelectAll;

  SetWindowPos(
    FList.Handle,
    HWND_TOP,
    tmp.X,
    tmp.Y,
    0,
    0,
    SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);

  if Text <> '' then
    case FKind of
      dtkWeek: FList.Week := StrToInt(Text);
      dtkDate: FList.Date := StrToDate(Text);
      dtkTime: FList.Date := StrToTime(Text);
    end;

  FListVisible := True;
end;

procedure TIvCustomDateTimeEdit.SelectListValue;
begin
  case FKind of
    dtkWeek: Text := IntToStr(FList.Week);
    dtkDate: Text := DateToStr(FList.Date);
    dtkTime: Text := TimeToStr(FList.Date);
  end;

  SelectAll;
end;

procedure TIvCustomDateTimeEdit.Clear;
begin
  inherited Clear;
  FList.Date := SysUtils.Date;
end;

procedure TIvCustomDateTimeEdit.CloseUp(accept: Boolean);
begin
  if not ListVisible then
    Exit;

  SetWindowPos(
    FList.Handle,
    0,
    0,
    0,
    0,
    0,
    SWP_NOZORDER or SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);

  FListVisible := False;

  if accept then
    SelectListValue;
end;

function TIvCustomDateTimeEdit.AcceptChar(key: Char): Boolean;

  function IsNumeric(key: Char): Boolean;
  begin
    Result := (key >= '0') and (key <= '9');
  end;

begin
  Result := True;

  if Key = #8 then
    Exit;

  case FKind of
    dtkWeek: Result := IsNumeric(key);
    dtkDate: Result := (IsNumeric(key) or (key = DateSeparator));
    dtkTime: Result := (IsNumeric(key) or (key = TimeSeparator));
  end;
end;

procedure TIvCustomDateTimeEdit.KeyPress(var key: Char);
begin
  inherited KeyPress(key);

  if (Key in [#13, #27]) and ListVisible then
  begin
    CloseUp(Key = #13);
    key := #0;
    Exit;
  end;

  if (Key in [#32..#255]) and not AcceptChar(key) then
  begin
    MessageBeep(0);
    key := #0;
  end;
end;


// TIvDateTimeEdit

constructor TIvDateTimeEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

end.
