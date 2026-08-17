unit IvDBMlCt;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs, DBLookup,
{$ENDIF}
  Messages, Forms, Graphics, Classes, Controls, DB, DBCtrls, IvMLCtrl;

type
  TIvDBText = class(TDBText)
{$IFNDEF IVBIDI}
  private
  {$IFDEF WIN32}
    {$IFNDEF VER110}
    procedure DoDrawText(var rect: TRect; flags: Integer);
    {$ENDIF}
  {$ENDIF}

  protected
    FLocale: Integer;

    procedure SetLocale(value: Integer);

  {$IFDEF WIN32}
    {$IFDEF VER110}
    procedure DoDrawText(var rect: TRect; flags: Word); override;
    {$ENDIF}
    procedure Paint; override;
  {$ENDIF}

  public
    constructor Create(owner: TComponent); override;

  published
    property Locale: Integer read FLocale write SetLocale stored False;
{$ENDIF}
  end;

  TIvDBRadioGroup = class(TDBRadioGroup)
{$IFNDEF IVBIDI}
  protected
    FLocale: Integer;

    procedure SetLocale(value: Integer);

  {$IFDEF WIN32}
    procedure Paint; override;
  {$ENDIF}

  public
    constructor Create(owner: TComponent); override;

  published
    property Locale: Integer read FLocale write SetLocale stored False;
{$ENDIF}
  end;

  TIvDBListBox = class(TDBListBox)
{$IFNDEF IVBIDI}
  private
    FLocale: Integer;

    procedure SetLocale(value: Integer);

  protected
    procedure CreateParams(var Params: TCreateParams); override;

  public
    constructor Create(owner: TComponent); override;

  published
    property Locale: Integer read FLocale write SetLocale stored False;
{$ENDIF}
  end;

  TIvDBComboBox = class(TDBComboBox)
{$IFNDEF IVBIDI}
  private
    FLocale: Integer;

    procedure SetLocale(value: Integer);

  protected
    procedure CreateParams(var Params: TCreateParams); override;

  public
    constructor Create(owner: TComponent); override;

  published
    property Locale: Integer read FLocale write SetLocale stored False;
{$ENDIF}
  end;

{$IFDEF WIN32}
{$IFDEF IVBIDI}
  TIvDBLookupControl = class(TDBLookupControl)
  end;
{$ELSE}
  TIvDBLookupControl = class;

  TIvDataSourceLink = class(TDataLink)
  private
    FDBLookupControl: TIvDBLookupControl;

  protected
    procedure FocusControl(Field: TFieldRef); override;
    procedure ActiveChanged; override;
    procedure RecordChanged(Field: TField); override;
  end;

  TIvListSourceLink = class(TDataLink)
  private
    FDBLookupControl: TIvDBLookupControl;

  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
  end;

  TIvDBLookupControl = class(TCustomControl)
  private
    FLocale: Integer;
    FLookupSource: TDataSource;
    FDataLink: TIvDataSourceLink;
    FListLink: TIvListSourceLink;
    FDataFieldName: string;
    FKeyFieldName: string;
    FListFieldName: string;
    FListFieldIndex: Integer;
    FDataField: TField;
    FMasterField: TField;
    FKeyField: TField;
    FListField: TField;
    FListFields: TList;
    FKeyValue: Variant;
    FSearchText: string;
    FLookupMode: Boolean;
    FListActive: Boolean;
    FFocused: Boolean;

    procedure SetLocale(value: Integer);
    function CanModify: Boolean;
    procedure CheckNotCircular;
    procedure CheckNotLookup;
    procedure DataLinkActiveChanged;
    procedure DataLinkRecordChanged(Field: TField);
    function GetBorderSize: Integer;
    function GetDataSource: TDataSource;
    function GetKeyFieldName: string;
    function GetListSource: TDataSource;
    function GetReadOnly: Boolean;
    function GetTextHeight: Integer;
    procedure KeyValueChanged; virtual;
    procedure ListLinkActiveChanged; virtual;
    procedure ListLinkDataChanged; virtual;
    function LocateKey: Boolean;
    procedure ProcessSearchKey(Key: Char);
    procedure SelectKeyValue(const Value: Variant);
    procedure SetDataFieldName(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetKeyFieldName(const Value: string);
    procedure SetKeyValue(const Value: Variant);
    procedure SetListFieldName(const Value: string);
    procedure SetListSource(Value: TDataSource);
    procedure SetLookupMode(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure WMGetDlgCode(var Message: TMessage); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TMessage); message WM_KILLFOCUS;
    procedure WMSetFocus(var Message: TMessage); message WM_SETFOCUS;

  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    property DataField: string read FDataFieldName write SetDataFieldName;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property KeyField: string read GetKeyFieldName write SetKeyFieldName;
    property KeyValue: Variant read FKeyValue write SetKeyValue;
    property ListField: string read FListFieldName write SetListFieldName;
    property ListFieldIndex: Integer read FListFieldIndex write FListFieldIndex default 0;
    property ListSource: TDataSource read GetListSource write SetListSource;
    property ParentColor default False;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property TabStop default True;

    procedure PaintItem(Canvas: TCanvas; const str: String; rect: TRect; x, y: Integer);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read FDataField;

  published
    property Locale: Integer read FLocale write SetLocale stored False;
  end;
{$ENDIF}

{$IFDEF IVBIDI}
  TIvDBLookupListBox = class(TDBLookupListBox)
  end;
{$ELSE}
  TIvDBLookupListBox = class(TIvDBLookupControl)
  private
    FRecordIndex: Integer;
    FRecordCount: Integer;
    FRowCount: Integer;
    FBorderStyle: TBorderStyle;
    FPopup: Boolean;
    FKeySelected: Boolean;
    FTracking: Boolean;
    FTimerActive: Boolean;
    FLockPosition: Boolean;
    FMousePos: Integer;
    FSelectedItem: string;

    function GetKeyIndex: Integer;
    procedure KeyValueChanged; override;
    procedure ListLinkActiveChanged; override;
    procedure ListLinkDataChanged; override;
    procedure SelectCurrent;
    procedure SelectItemAt(X, Y: Integer);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetRowCount(Value: Integer);
    procedure StopTimer;
    procedure StopTracking;
    procedure TimerScroll;
    procedure UpdateScrollBar;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMCancelMode(var Message: TMessage); message WM_CANCELMODE;
    procedure WMTimer(var Message: TMessage); message WM_TIMER;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;

  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Paint; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

  public
    constructor Create(owner: TComponent); override;

    property KeyValue;
    property SelectedItem: string read FSelectedItem;

  published
    property Align;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Color;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
{$IFDEF IVWIDE}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property KeyField;
    property ListField;
    property ListFieldIndex;
    property ListSource;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property RowCount: Integer read FRowCount write SetRowCount stored False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;
{$ENDIF}

{$IFDEF IVBIDI}
  TIvDBLookupComboBox = class(TDBLookupComboBox)
  end;
{$ELSE}
  TIvPopupDataList = class(TIvDBLookupListBox)
  private
    procedure WMMouseActivate(var Message: TMessage); message WM_MOUSEACTIVATE;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TIvDropDownAlign = (daLeft, daRight, daCenter);

  TIvDBLookupComboBox = class(TIvDBLookupControl)
  private
    FDataList: TIvPopupDataList;
    FButtonWidth: Integer;
    FText: string;
    FDropDownRows: Integer;
    FDropDownWidth: Integer;
    FDropDownAlign: TIvDropDownAlign;
    FListVisible: Boolean;
    FPressed: Boolean;
    FTracking: Boolean;
    FAlignment: TAlignment;
    FLookupMode: Boolean;
    FOnDropDown: TNotifyEvent;
    FOnCloseUp: TNotifyEvent;

    procedure KeyValueChanged; override;
    procedure ListLinkActiveChanged; override;
    procedure ListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StopTracking;
    procedure TrackButton(X, Y: Integer);
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure WMCancelMode(var Message: TMessage); message WM_CANCELMODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;

  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

  public
    constructor Create(AOwner: TComponent); override;

    procedure CloseUp(Accept: Boolean);
    procedure DropDown;

    property KeyValue;
    property ListVisible: Boolean read FListVisible;
    property Text: string read FText;

  published
    property Color;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragMode;
    property DropDownAlign: TIvDropDownAlign read FDropDownAlign write FDropDownAlign default daLeft;
    property DropDownRows: Integer read FDropDownRows write FDropDownRows default 7;
    property DropDownWidth: Integer read FDropDownWidth write FDropDownWidth default 0;
    property Enabled;
    property Font;
{$IFDEF IVWIDE}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property KeyField;
    property ListField;
    property ListFieldIndex;
    property ListSource;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;
{$ENDIF}
{$ELSE}
  TIvDBLookupListBox = class(TDBLookupList)
  end;

  TIvDBLookupComboBox = class(TDBLookupCombo)
  end;
{$ENDIF}

implementation

{$IFNDEF IVBIDI}
uses
  SysUtils,
  DBConsts, IvDictio, IvMulti;

{ TIvDBText }

constructor TIvDBText.Create(owner: TComponent);
begin
  inherited Create(owner);
  FLocale := 0;
end;

procedure TIvDBText.SetLocale(value: Integer);
begin
  if value <> FLocale then
  begin
    FLocale := value;
    Invalidate;
  end;
end;

{$IFDEF WIN32}
  {$IFDEF VER110}
procedure TIvDBText.DoDrawText(var rect: TRect; flags: Word);
  {$ELSE}
procedure TIvDBText.DoDrawText(var rect: TRect; flags: Integer);
  {$ENDIF}
var
  Text: String;
begin
  Text := GetLabelText;
  if (Flags and DT_CALCRECT <> 0) and ((Text = '') or ShowAccelChar and
    (Text[1] = '&') and (Text[2] = #0)) then Text := Text + ' ';
  if not ShowAccelChar then
    Flags := Flags or DT_NOPREFIX;
  Canvas.Font := Font;

{$IFDEF IVPRO32}
 if IvIsLocaleBidirectional(FLocale) then
   Flags := Flags or DT_RTLREADING;
{$ENDIF}

{$IFDEF IVWIDE}
  if not Enabled then
  begin
    OffsetRect(Rect, 1, 1);
    Canvas.Font.Color := clBtnHighlight;
    DrawTextEx(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags, nil);
    OffsetRect(Rect, -1, -1);
    Canvas.Font.Color := clBtnShadow;
    DrawTextEx(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags, nil);
  end
  else
    DrawTextEx(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags, nil);
{$ELSE}
  if not Enabled then
    Canvas.Font.Color := clGrayText;
  DrawTextEx(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags, nil);
{$ENDIF}
end;

procedure TIvDBText.Paint;
const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
  BidiAlignments: array[TAlignment] of Word = (DT_RIGHT, DT_LEFT, DT_CENTER);
  WordWraps: array[Boolean] of Word = (0, DT_WORDBREAK);
var
  Rect: TRect;
  DrawStyle: Integer;
begin
  with Canvas do
  begin
    if not Transparent then
    begin
      Brush.Color := Self.Color;
      Brush.Style := bsSolid;
      FillRect(ClientRect);
    end;
    Brush.Style := bsClear;
    Rect := ClientRect;
    DrawStyle := DT_EXPANDTABS or WordWraps[WordWrap];
{$IFDEF IVPRO32}
    if IvIsLocaleBidirectional(FLocale) then
      DrawStyle := DrawStyle or BidiAlignments[Alignment]
    else
{$ENDIF}
      DrawStyle := DrawStyle or Alignments[Alignment];
    DoDrawText(Rect, DrawStyle);
  end;
end;
{$ENDIF}


{ TIvDBRadioGroup }

constructor TIvDBRadioGroup.Create(owner: TComponent);
begin
  inherited Create(owner);
  FLocale := 0;
end;

procedure TIvDBRadioGroup.SetLocale(value: Integer);
begin
  if FLocale <> Value then
  begin
    FLocale := Value;
    Invalidate;
  end;
end;

{$IFDEF WIN32}
procedure TIvDBRadioGroup.Paint;
var
{$IFDEF IVPRO32}
  w: Integer;
{$ENDIF}
  H: Integer;
  R: TRect;
begin
  with Canvas do
  begin
    Font := Self.Font;
    H := TextHeight('0');
    R := Rect(0, H div 2 - 1, Width, Height);
    if Ctl3D then
    begin
      Inc(R.Left);
      Inc(R.Top);
      Brush.Color := clBtnHighlight;
      FrameRect(R);
      OffsetRect(R, -1, -1);
      Brush.Color := clBtnShadow;
    end else
      Brush.Color := clWindowFrame;
    FrameRect(R);
    if Text <> '' then
    begin
      R := Rect(8, 0, Width - 16, H);
      DrawText(
        Handle,
        PChar(Text),
        Length(Text),
        R,
        DT_LEFT or DT_SINGLELINE or DT_CALCRECT);
      Brush.Color := Color;
{$IFDEF IVPRO32}
      w := R.right - R.left;
      if IvIsLocaleBidirectional(FLocale) then
      begin
        R.right := Width - 8;
        R.left := R.right - w;
      end;
{$ENDIF}

      DrawText(
        Handle,
        PChar(Text),
        Length(Text),
        R,
        DT_LEFT or DT_SINGLELINE);
    end;
  end;
end;
{$ENDIF}

{ TIvDBListBox }

constructor TIvDBListBox.Create(owner: TComponent);
begin
  inherited Create(owner);
  FLocale := 0;
end;

procedure TIvDBListBox.SetLocale(value: Integer);
begin
  if value <> FLocale then
  begin
    FLocale := value;
{$IFDEF IVPRO32}
    RecreateWnd;
{$ENDIF}
  end;
end;

procedure TIvDBListBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(params);
{$IFDEF IVPRO32}
  if IvIsLocaleBidirectional(FLocale) then
    Params.ExStyle := Params.ExStyle or WS_EX_RIGHT or WS_EX_LEFTSCROLLBAR or WS_EX_RTLREADING;
{$ENDIF}
end;


{ TIvDBComboBox }

constructor TIvDBComboBox.Create(owner: TComponent);
begin
  inherited Create(owner);
  FLocale := 0;
end;

procedure TIvDBComboBox.SetLocale(value: Integer);
begin
  if value <> FLocale then
  begin
    FLocale := value;
{$IFDEF IVPRO32}
    RecreateWnd;
{$ENDIF}
  end;
end;

procedure TIvDBComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(params);
{$IFDEF IVPRO32}
  if IvIsLocaleBidirectional(FLocale) then
    Params.ExStyle := Params.ExStyle or WS_EX_RIGHT or WS_EX_LEFTSCROLLBAR or WS_EX_RTLREADING;
{$ENDIF}
end;


{$IFDEF WIN32}
{ TIvDataSourceLink }

procedure TIvDataSourceLink.ActiveChanged;
begin
  if FDBLookupControl <> nil then
    FDBLookupControl.DataLinkActiveChanged;
end;

procedure TIvDataSourceLink.RecordChanged(Field: TField);
begin
  if FDBLookupControl <> nil then
    FDBLookupControl.DataLinkRecordChanged(Field);
end;

procedure TIvDataSourceLink.FocusControl(Field: TFieldRef);
begin
  if (Field^ <> nil) and (Field^ = FDBLookupControl.Field) and
    (FDBLookupControl <> nil) and FDBLookupControl.CanFocus then
  begin
    Field^ := nil;
    FDBLookupControl.SetFocus;
  end;
end;


{ TIvListSourceLink }

procedure TIvListSourceLink.ActiveChanged;
begin
  if FDBLookupControl <> nil then
    FDBLookupControl.ListLinkActiveChanged;
end;

procedure TIvListSourceLink.DataSetChanged;
begin
  if FDBLookupControl <> nil then
    FDBLookupControl.ListLinkDataChanged;
end;


{ TIvDBLookupControl }

function VarEquals(const V1, V2: Variant): Boolean;
begin
  Result := False;
  try
    Result := V1 = V2;
  except
  end;
end;

var
  SearchTickCount: Integer = 0;

constructor TIvDBLookupControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLocale := 0;
  if NewStyleControls then
    ControlStyle := [csOpaque] else
    ControlStyle := [csOpaque, csFramed];
  ParentColor := False;
  TabStop := True;
  FLookupSource := TDataSource.Create(Self);
  FDataLink := TIvDataSourceLink.Create;
  FDataLink.FDBLookupControl := Self;
  FListLink := TIvListSourceLink.Create;
  FListLink.FDBLookupControl := Self;
  FListFields := TList.Create;
  FKeyValue := Null;
end;

destructor TIvDBLookupControl.Destroy;
begin
  FListFields.Free;
  FListLink.FDBLookupControl := nil;
  FListLink.Free;
  FDataLink.FDBLookupControl := nil;
  FDataLink.Free;
  inherited Destroy;
end;

procedure TIvDBLookupControl.PaintItem(
  Canvas: TCanvas;
  const str: String;
  rect: TRect;
  x, y: Integer);
var
  flags: Integer;
begin
{$IFDEF IVPRO32}
  if IvIsLocaleBidirectional(FLocale) then
    Flags := DT_RIGHT + DT_RTLREADING
  else
{$ENDIF}
    Flags := DT_LEFT;
  Canvas.Pen.Style := psClear;
  Canvas.Rectangle(rect.Left, rect.Top, rect.Right + 1, rect.Bottom + 1);
  Inc(rect.Left, x);
  Inc(rect.Top, y);
  DrawTextEx(Canvas.Handle, PChar(str), Length(str), rect, flags, nil);
end;

procedure TIvDBLookupControl.SetLocale(value: Integer);
begin
  if value <> FLocale then
  begin
    FLocale := value;
{$IFDEF IVPRO32}
    RecreateWnd;
{$ENDIF}
  end;
end;

function TIvDBLookupControl.CanModify: Boolean;
begin
  Result := FListActive and not ReadOnly and ((FDataLink.DataSource = nil) or
    (FMasterField <> nil) and FMasterField.CanModify);
end;

procedure TIvDBLookupControl.CheckNotCircular;
begin
  if FDataLink.Active and FDataLink.DataSet.IsLinkedTo(ListSource) then
{$IFDEF IVWIDE}
    DatabaseError(SCircularDataLink);
{$ELSE}
    DatabaseError(LoadStr(SCircularDataLink));
{$ENDIF}
  if FListLink.Active and FListLink.DataSet.IsLinkedTo(DataSource) then
{$IFDEF IVWIDE}
    DatabaseError(SCircularDataLink);
{$ELSE}
    DatabaseError(LoadStr(SCircularDataLink));
{$ENDIF}
end;

procedure TIvDBLookupControl.CheckNotLookup;
begin
  if FLookupMode then
{$IFDEF IVWIDE}
    DatabaseError(SPropDefByLookup);
{$ELSE}
    DatabaseError(LoadStr(SPropDefByLookup));
{$ENDIF}
  if FDataLink.DataSourceFixed then
{$IFDEF IVWIDE}
    DatabaseError(SDataSourceFixed);
{$ELSE}
    DatabaseError(LoadStr(SPropDefByLookup));
{$ENDIF}
end;

procedure TIvDBLookupControl.DataLinkActiveChanged;
begin
  FDataField := nil;
  FMasterField := nil;
  if FDataLink.Active and (FDataFieldName <> '') then
  begin
    CheckNotCircular;
{$IFDEF IVWIDE}
    FDataField := GetFieldProperty(FDataLink.DataSet, Self, FDataFieldName);
{$ELSE}
    FDataField := FDataLink.DataSet.FieldByName(FDataFieldName);
{$ENDIF}
    FMasterField := FDataField;
  end;
  SetLookupMode((FDataField <> nil) and (FDataField.FieldKind = fkLookup));
  DataLinkRecordChanged(nil);
end;

procedure TIvDBLookupControl.DataLinkRecordChanged(Field: TField);
begin
  if (Field = nil) or (Field = FMasterField) then
    if FMasterField <> nil then
      SetKeyValue(FMasterField.Value) else
      SetKeyValue(Null);
end;

function TIvDBLookupControl.GetBorderSize: Integer;
var
  Params: TCreateParams;
  R: TRect;
begin
  CreateParams(Params);
  SetRect(R, 0, 0, 0, 0);
  AdjustWindowRectEx(R, Params.Style, False, Params.ExStyle);
  Result := R.Bottom - R.Top;
end;

function TIvDBLookupControl.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TIvDBLookupControl.GetKeyFieldName: string;
begin
  if FLookupMode then Result := '' else Result := FKeyFieldName;
end;

function TIvDBLookupControl.GetListSource: TDataSource;
begin
  if FLookupMode then Result := nil else Result := FListLink.DataSource;
end;

function TIvDBLookupControl.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

function TIvDBLookupControl.GetTextHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  Result := Metrics.tmHeight;
end;

procedure TIvDBLookupControl.KeyValueChanged;
begin
end;

procedure TIvDBLookupControl.ListLinkActiveChanged;
var
  DataSet: TDataSet;
  ResultField: TField;
begin
  FListActive := False;
  FKeyField := nil;
  FListField := nil;
  FListFields.Clear;
  if FListLink.Active and (FKeyFieldName <> '') then
  begin
    CheckNotCircular;
    DataSet := FListLink.DataSet;
{$IFDEF IVWIDE}
    FKeyField := GetFieldProperty(DataSet, Self, FKeyFieldName);
{$ELSE}
    FKeyField := DataSet.FieldByName(FKeyFieldName);
{$ENDIF}
    try
      DataSet.GetFieldList(FListFields, FListFieldName);
    except
{$IFDEF IVWIDE}
      DatabaseErrorFmt(SFieldNotFound, [Self.Name, FListFieldName]);
{$ENDIF}
    end;
    if FLookupMode then
    begin
{$IFDEF IVWIDE}
      ResultField := GetFieldProperty(DataSet, Self, FDataField.LookupResultField);
{$ELSE}
      ResultField := DataSet.FieldByName(FDataField.LookupResultField);
{$ENDIF}
      if FListFields.IndexOf(ResultField) < 0 then
        FListFields.Insert(0, ResultField);
      FListField := ResultField;
    end else
    begin
      if FListFields.Count = 0 then FListFields.Add(FKeyField);
      if (FListFieldIndex >= 0) and (FListFieldIndex < FListFields.Count) then
        FListField := FListFields[FListFieldIndex] else
        FListField := FListFields[0];
    end;
    FListActive := True;
  end;
end;

procedure TIvDBLookupControl.ListLinkDataChanged;
begin
end;

function TIvDBLookupControl.LocateKey: Boolean;
begin
  Result := False;
  try
    if not VarIsNull(FKeyValue) and
      FListLink.DataSet.Locate(FKeyFieldName, FKeyValue, []) then
      Result := True;
  except
  end;
end;

procedure TIvDBLookupControl.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if (FDataLink <> nil) and (AComponent = DataSource) then DataSource := nil;
    if (FListLink <> nil) and (AComponent = ListSource) then ListSource := nil;
  end;
end;

procedure TIvDBLookupControl.ProcessSearchKey(Key: Char);
var
  TickCount: Integer;
  S: string;
begin
  if (FListField <> nil) and (FListField.FieldKind = fkData) and
    (FListField.DataType = ftString) then
    case Key of
      #8, #27: FSearchText := '';
      #32..#255:
        if CanModify then
        begin
          TickCount := GetTickCount;
          if TickCount - SearchTickCount > 2000 then FSearchText := '';
          SearchTickCount := TickCount;
          if Length(FSearchText) < 32 then
          begin
            S := FSearchText + Key;
            if FListLink.DataSet.Locate(FListField.FieldName, S,
              [loCaseInsensitive, loPartialKey]) then
            begin
              SelectKeyValue(FKeyField.Value);
              FSearchText := S;
            end;
          end;
        end;
    end;
end;

procedure TIvDBLookupControl.SelectKeyValue(const Value: Variant);
begin
  if FMasterField <> nil then
  begin
    if FDataLink.Edit then
      FMasterField.Value := Value;
  end else
    SetKeyValue(Value);
  Repaint;
  Click;
end;

procedure TIvDBLookupControl.SetDataFieldName(const Value: string);
begin
  if FDataFieldName <> Value then
  begin
    FDataFieldName := Value;
    DataLinkActiveChanged;
  end;
end;

procedure TIvDBLookupControl.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TIvDBLookupControl.SetKeyFieldName(const Value: string);
begin
  CheckNotLookup;
  if FKeyFieldName <> Value then
  begin
    FKeyFieldName := Value;
    ListLinkActiveChanged;
  end;
end;

procedure TIvDBLookupControl.SetKeyValue(const Value: Variant);
begin
  if not VarEquals(FKeyValue, Value) then
  begin
    FKeyValue := Value;
    KeyValueChanged;
  end;
end;

procedure TIvDBLookupControl.SetListFieldName(const Value: string);
begin
  if FListFieldName <> Value then
  begin
    FListFieldName := Value;
    ListLinkActiveChanged;
  end;
end;

procedure TIvDBLookupControl.SetListSource(Value: TDataSource);
begin
  CheckNotLookup;
  FListLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TIvDBLookupControl.SetLookupMode(Value: Boolean);
begin
  if FLookupMode <> Value then
    if Value then
    begin
{$IFDEF IVWIDE}
      FMasterField := GetFieldProperty(FDataField.DataSet, Self, FDataField.KeyFields);
{$ELSE}
      FMasterField := FDataField.DataSet.FieldByName(FDataField.KeyFields);
{$ENDIF}
      FLookupSource.DataSet := FDataField.LookupDataSet;
      FKeyFieldName := FDataField.LookupKeyFields;
      FLookupMode := True;
      FListLink.DataSource := FLookupSource;
    end else
    begin
      FListLink.DataSource := nil;
      FLookupMode := False;
      FKeyFieldName := '';
      FLookupSource.DataSet := nil;
      FMasterField := FDataField;
    end;
end;

procedure TIvDBLookupControl.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

procedure TIvDBLookupControl.WMGetDlgCode(var Message: TMessage);
begin
  Message.Result := DLGC_WANTARROWS or DLGC_WANTCHARS;
end;

procedure TIvDBLookupControl.WMKillFocus(var Message: TMessage);
begin
  FFocused := False;
  Inherited;
  Invalidate;
end;

procedure TIvDBLookupControl.WMSetFocus(var Message: TMessage);
begin
  FFocused := True;
  Inherited;
  Invalidate;
end;


{ TIvDBLookupListBox }

constructor TIvDBLookupListBox.Create(owner: TComponent);
begin
  inherited Create(owner);
  ControlStyle := ControlStyle + [csDoubleClicks];
  Width := 121;
  FBorderStyle := bsSingle;
  RowCount := 7;
end;

procedure TIvDBLookupListBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    if FBorderStyle = bsSingle then
      if NewStyleControls and Ctl3D then
        ExStyle := ExStyle or WS_EX_CLIENTEDGE
      else
        Style := Style or WS_BORDER;
{$IFDEF IVPRO32}
  if IvIsLocaleBidirectional(FLocale) then
    Params.ExStyle := Params.ExStyle or WS_EX_RIGHT or WS_EX_LEFTSCROLLBAR or WS_EX_RTLREADING;
{$ENDIF}
end;

procedure TIvDBLookupListBox.CreateWnd;
begin
  inherited CreateWnd;
  UpdateScrollBar;
end;

function TIvDBLookupListBox.GetKeyIndex: Integer;
var
  FieldValue: Variant;
begin
  if not VarIsNull(FKeyValue) then
    for Result := 0 to FRecordCount - 1 do
    begin
      FListLink.ActiveRecord := Result;
      FieldValue := FKeyField.Value;
      FListLink.ActiveRecord := FRecordIndex;
      if VarEquals(FieldValue, FKeyValue) then Exit;
    end;
  Result := -1;
end;

procedure TIvDBLookupListBox.KeyDown(var Key: Word; Shift: TShiftState);
var
  Delta, KeyIndex: Integer;
begin
  inherited KeyDown(Key, Shift);
  if CanModify then
  begin
    Delta := 0;
    case Key of
      VK_UP, VK_LEFT: Delta := -1;
      VK_DOWN, VK_RIGHT: Delta := 1;
      VK_PRIOR: Delta := 1 - FRowCount;
      VK_NEXT: Delta := FRowCount - 1;
      VK_HOME: Delta := -Maxint;
      VK_END: Delta := Maxint;
    end;
    if Delta <> 0 then
    begin
      FSearchText := '';
      if Delta = -Maxint then FListLink.DataSet.First else
        if Delta = Maxint then FListLink.DataSet.Last else
        begin
          KeyIndex := GetKeyIndex;
          if KeyIndex >= 0 then
            FListLink.DataSet.MoveBy(KeyIndex - FRecordIndex)
          else
          begin
            KeyValueChanged;
            Delta := 0;
          end;
          FListLink.DataSet.MoveBy(Delta);
        end;
      SelectCurrent;
    end;
  end;
end;

procedure TIvDBLookupListBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  ProcessSearchKey(Key);
end;

procedure TIvDBLookupListBox.KeyValueChanged;
begin
  if FListActive and not FLockPosition then
    if not LocateKey then FListLink.DataSet.First;
  if FListField <> nil then
    FSelectedItem := FListField.DisplayText else
    FSelectedItem := '';
end;

procedure TIvDBLookupListBox.ListLinkActiveChanged;
begin
  try
    inherited;
  finally
    if FListActive then KeyValueChanged else ListLinkDataChanged;
  end;
end;

procedure TIvDBLookupListBox.ListLinkDataChanged;
begin
  if FListActive then
  begin
    FRecordIndex := FListLink.ActiveRecord;
    FRecordCount := FListLink.RecordCount;
    FKeySelected := not VarIsNull(FKeyValue) or
      not FListLink.DataSet.BOF;
  end else
  begin
    FRecordIndex := 0;
    FRecordCount := 0;
    FKeySelected := False;
  end;
  if HandleAllocated then
  begin
    UpdateScrollBar;
    Invalidate;
  end;
end;

procedure TIvDBLookupListBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    FSearchText := '';
    if not FPopup then
    begin
      SetFocus;
      if not FFocused then Exit;
    end;
    if CanModify then
      if ssDouble in Shift then
      begin
        if FRecordIndex = Y div GetTextHeight then DblClick;
      end else
      begin
        MouseCapture := True;
        FTracking := True;
        SelectItemAt(X, Y);
      end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TIvDBLookupListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if FTracking then
  begin
    SelectItemAt(X, Y);
    FMousePos := Y;
    TimerScroll;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TIvDBLookupListBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if FTracking then
  begin
    StopTracking;
    SelectItemAt(X, Y);
  end;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TIvDBLookupListBox.Paint;
var
  I, J, W, X, TextWidth, TextHeight, LastFieldIndex: Integer;
  S: string;
  R: TRect;
  Selected: Boolean;
  Field: TField;
begin
  Canvas.Font := Font;
  TextWidth := Canvas.TextWidth('0');
  TextHeight := Canvas.TextHeight('0');
  LastFieldIndex := FListFields.Count - 1;
  if ColorToRGB(Color) <> ColorToRGB(clBtnFace) then
    Canvas.Pen.Color := clBtnFace else
    Canvas.Pen.Color := clBtnShadow;
  for I := 0 to FRowCount - 1 do
  begin
    Canvas.Font.Color := Font.Color;
    Canvas.Brush.Color := Color;
    Selected := not FKeySelected and (I = 0);
    R.Top := I * TextHeight;
    R.Bottom := R.Top + TextHeight;
    if I < FRecordCount then
    begin
      FListLink.ActiveRecord := I;
      if not VarIsNull(FKeyValue) and
        VarEquals(FKeyField.Value, FKeyValue) then
      begin
        Canvas.Font.Color := clHighlightText;
        Canvas.Brush.Color := clHighlight;
        Selected := True;
      end;
      R.Right := 0;
      for J := 0 to LastFieldIndex do
      begin
        Field := FListFields[J];
        if J < LastFieldIndex then
          W := Field.DisplayWidth * TextWidth + 4 else
          W := ClientWidth - R.Right;
        S := Field.DisplayText;
        X := 2;
        case Field.Alignment of
          taRightJustify: X := W - Canvas.TextWidth(S) - 3;
          taCenter: X := (W - Canvas.TextWidth(S)) div 2;
        end;
        R.Left := R.Right;
        R.Right := R.Right + W;

        { This has been changed from the standard VCL }

        {Canvas.TextRect(R, R.Left + X, R.Top, S);}
        PaintItem(Canvas, S, R, X, 0);

        if J < LastFieldIndex then
        begin
          Canvas.MoveTo(R.Right, R.Top);
          Canvas.LineTo(R.Right, R.Bottom);
          Inc(R.Right);
          if R.Right >= ClientWidth then Break;
        end;
      end;
    end;
    R.Left := 0;
    R.Right := ClientWidth;
    if I >= FRecordCount then Canvas.FillRect(R);
    if Selected and (FFocused or FPopup) then Canvas.DrawFocusRect(R);
  end;
  if FRecordCount <> 0 then FListLink.ActiveRecord := FRecordIndex;
end;

procedure TIvDBLookupListBox.SelectCurrent;
begin
  FLockPosition := True;
  try
    SelectKeyValue(FKeyField.Value);
  finally
    FLockPosition := False;
  end;
end;

procedure TIvDBLookupListBox.SelectItemAt(X, Y: Integer);
var
  Delta: Integer;
begin
  if Y < 0 then Y := 0;
  if Y >= ClientHeight then Y := ClientHeight - 1;
  Delta := Y div GetTextHeight - FRecordIndex;
  FListLink.DataSet.MoveBy(Delta);
  SelectCurrent;
end;

procedure TIvDBLookupListBox.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
    RowCount := RowCount;
  end;
end;

procedure TIvDBLookupListBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  BorderSize, TextHeight, Rows: Integer;
begin
  BorderSize := GetBorderSize;
  TextHeight := GetTextHeight;
  Rows := (AHeight - BorderSize) div TextHeight;
  if Rows < 1 then Rows := 1;
  FRowCount := Rows;
  if FListLink.BufferCount <> Rows then
  begin
    FListLink.BufferCount := Rows;
    ListLinkDataChanged;
  end;
  inherited SetBounds(ALeft, ATop, AWidth, Rows * TextHeight + BorderSize);
end;

procedure TIvDBLookupListBox.SetRowCount(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if Value > 100 then Value := 100;
  Height := Value * GetTextHeight + GetBorderSize;
end;

procedure TIvDBLookupListBox.StopTimer;
begin
  if FTimerActive then
  begin
    KillTimer(Handle, 1);
    FTimerActive := False;
  end;
end;

procedure TIvDBLookupListBox.StopTracking;
begin
  if FTracking then
  begin
    StopTimer;
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TIvDBLookupListBox.TimerScroll;
var
  Delta, Distance, Interval: Integer;
begin
  Delta := 0;
  Distance := 0;
  if FMousePos < 0 then
  begin
    Delta := -1;
    Distance := -FMousePos;
  end;
  if FMousePos >= ClientHeight then
  begin
    Delta := 1;
    Distance := FMousePos - ClientHeight + 1;
  end;
  if Delta = 0 then StopTimer else
  begin
    if FListLink.DataSet.MoveBy(Delta) <> 0 then SelectCurrent;
    Interval := 200 - Distance * 15;
    if Interval < 0 then Interval := 0;
    SetTimer(Handle, 1, Interval, nil);
    FTimerActive := True;
  end;
end;

procedure TIvDBLookupListBox.UpdateScrollBar;
var
  Pos, Max: Integer;
  ScrollInfo: TScrollInfo;
begin
  Pos := 0;
  Max := 0;
  if FRecordCount = FRowCount then
  begin
    Max := 4;
    if not FListLink.DataSet.BOF then
      if not FListLink.DataSet.EOF then Pos := 2 else Pos := 4;
  end;
  ScrollInfo.cbSize := SizeOf(TScrollInfo);
  ScrollInfo.fMask := SIF_POS or SIF_RANGE;
  if not GetScrollInfo(Handle, SB_VERT, ScrollInfo) or
    (ScrollInfo.nPos <> Pos) or (ScrollInfo.nMax <> Max) then
  begin
    ScrollInfo.nMin := 0;
    ScrollInfo.nMax := Max;
    ScrollInfo.nPos := Pos;
    SetScrollInfo(Handle, SB_VERT, ScrollInfo, True);
  end;
end;

procedure TIvDBLookupListBox.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then
  begin
    RecreateWnd;
    RowCount := RowCount;
  end;
  inherited;
end;

procedure TIvDBLookupListBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Height := Height;
end;

procedure TIvDBLookupListBox.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TIvDBLookupListBox.WMTimer(var Message: TMessage);
begin
  TimerScroll;
end;

procedure TIvDBLookupListBox.WMVScroll(var Message: TWMVScroll);
begin
  FSearchText := '';
  with Message, FListLink.DataSet do
    case ScrollCode of
      SB_LINEUP: MoveBy(-FRecordIndex - 1);
      SB_LINEDOWN: MoveBy(FRecordCount - FRecordIndex);
      SB_PAGEUP: MoveBy(-FRecordIndex - FRecordCount + 1);
      SB_PAGEDOWN: MoveBy(FRecordCount - FRecordIndex + FRecordCount - 2);
      SB_THUMBPOSITION:
        begin
          case Pos of
            0: First;
            1: MoveBy(-FRecordIndex - FRecordCount + 1);
            2: Exit;
            3: MoveBy(FRecordCount - FRecordIndex + FRecordCount - 2);
            4: Last;
          end;
        end;
      SB_BOTTOM: Last;
      SB_TOP: First;
    end;
end;


{ TIvPopupDataList }

constructor TIvPopupDataList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csNoDesignVisible, csReplicatable];
  FPopup := True;
end;

procedure TIvPopupDataList.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW;
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TIvPopupDataList.WMMouseActivate(var Message: TMessage);
begin
  Message.Result := MA_NOACTIVATE;
end;


{ TIvDBLookupComboBox }

constructor TIvDBLookupComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  Width := 145;
  Height := 0;
  FDataList := TIvPopupDataList.Create(Self);
  FDataList.Visible := False;
  FDataList.Parent := Self;
  FDataList.OnMouseUp := ListMouseUp;
  FButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
  FDropDownRows := 7;
end;

procedure TIvDBLookupComboBox.CloseUp(Accept: Boolean);
var
  ListValue: Variant;
begin
  if FListVisible then
  begin
    if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
    ListValue := FDataList.KeyValue;
    SetWindowPos(FDataList.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    FListVisible := False;
    FDataList.ListSource := nil;
    Invalidate;
    FSearchText := '';
    if Accept and CanModify then SelectKeyValue(ListValue);
    if Assigned(FOnCloseUp) then FOnCloseUp(Self);
  end;
end;

procedure TIvDBLookupComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    if NewStyleControls and Ctl3D then
      ExStyle := ExStyle or WS_EX_CLIENTEDGE
    else
      Style := Style or WS_BORDER;
{$IFDEF IVPRO32}
  if IvIsLocaleBidirectional(FLocale) then
    Params.ExStyle := Params.ExStyle or WS_EX_RIGHT or WS_EX_LEFTSCROLLBAR or WS_EX_RTLREADING;
{$ENDIF}
end;

procedure TIvDBLookupComboBox.DropDown;
var
  P: TPoint;
  I, Y: Integer;
  S: string;
begin
  if not FListVisible and FListActive then
  begin
    if Assigned(FOnDropDown) then FOnDropDown(Self);
    FDataList.Color := Color;
    FDataList.Font := Font;
    if FDropDownWidth > 0 then
      FDataList.Width := FDropDownWidth else
      FDataList.Width := Width;
    FDataList.ReadOnly := not CanModify;
    FDataList.RowCount := FDropDownRows;
    FDataList.KeyField := FKeyFieldName;
    for I := 0 to FListFields.Count - 1 do
      S := S + TField(FListFields[I]).FieldName + ';';
    FDataList.ListField := S;
    FDataList.ListFieldIndex := FListFields.IndexOf(FListField);
    FDataList.ListSource := FListLink.DataSource;
    FDataList.KeyValue := KeyValue;
    P := Parent.ClientToScreen(Point(Left, Top));
    Y := P.Y + Height;
    if Y + FDataList.Height > Screen.Height then Y := P.Y - FDataList.Height;
    case FDropDownAlign of
      daRight: Dec(P.X, FDataList.Width - Width);
      daCenter: Dec(P.X, (FDataList.Width - Width) div 2);
    end;
    SetWindowPos(FDataList.Handle, HWND_TOP, P.X, Y, 0, 0,
      SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
    FListVisible := True;
    Repaint;
  end;
end;

procedure TIvDBLookupComboBox.KeyDown(var Key: Word; Shift: TShiftState);
var
  Delta: Integer;
begin
  inherited KeyDown(Key, Shift);
  if FListActive and ((Key = VK_UP) or (Key = VK_DOWN)) then
    if ssAlt in Shift then
    begin
      if FListVisible then CloseUp(True) else DropDown;
      Key := 0;
    end else
      if not FListVisible then
      begin
        if not LocateKey then
          FListLink.DataSet.First
        else
        begin
          if Key = VK_UP then Delta := -1 else Delta := 1;
          FListLink.DataSet.MoveBy(Delta);
        end;
        SelectKeyValue(FKeyField.Value);
        Key := 0;
      end;
  if (Key <> 0) and FListVisible then FDataList.KeyDown(Key, Shift);
end;

procedure TIvDBLookupComboBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if FListVisible then
    if Key in [#13, #27] then
      CloseUp(Key = #13)
    else
      FDataList.KeyPress(Key)
  else
    ProcessSearchKey(Key);
end;

procedure TIvDBLookupComboBox.KeyValueChanged;
begin
  if FLookupMode then
  begin
    FText := FDataField.DisplayText;
    FAlignment := FDataField.Alignment;
  end else
  if FListActive and LocateKey then
  begin
    FText := FListField.DisplayText;
    FAlignment := FListField.Alignment;
  end else
  begin
    FText := '';
    FAlignment := taLeftJustify;
  end;
  Invalidate;
end;

procedure TIvDBLookupComboBox.ListLinkActiveChanged;
begin
  inherited;
  KeyValueChanged;
end;

procedure TIvDBLookupComboBox.ListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    CloseUp(PtInRect(FDataList.ClientRect, Point(X, Y)));
end;

procedure TIvDBLookupComboBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    SetFocus;
    if not FFocused then Exit;
    if FListVisible then CloseUp(False) else
      if FListActive then
      begin
        MouseCapture := True;
        FTracking := True;
        TrackButton(X, Y);
        DropDown;
      end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TIvDBLookupComboBox.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ListPos: TPoint;
  MousePos: TSmallPoint;
begin
  if FTracking then
  begin
    TrackButton(X, Y);
    if FListVisible then
    begin
      ListPos := FDataList.ScreenToClient(ClientToScreen(Point(X, Y)));
      if PtInRect(FDataList.ClientRect, ListPos) then
      begin
        StopTracking;
        MousePos := PointToSmallPoint(ListPos);
        SendMessage(FDataList.Handle, WM_LBUTTONDOWN, 0, Integer(MousePos));
        Exit;
      end;
    end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TIvDBLookupComboBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  StopTracking;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TIvDBLookupComboBox.Paint;
var
  W, X, Flags: Integer;
  Text: string;
  Alignment: TAlignment;
  Selected: Boolean;
  R: TRect;
begin
  Canvas.Font := Font;
  Canvas.Brush.Color := Color;
  Selected := FFocused and not FListVisible and
    not (csPaintCopy in ControlState);
  if Selected then
  begin
    Canvas.Font.Color := clHighlightText;
    Canvas.Brush.Color := clHighlight;
  end;
  if (csPaintCopy in ControlState) and (FDataField <> nil) then
  begin
    Text := FDataField.DisplayText;
    Alignment := FDataField.Alignment;
  end else
  begin
    Text := FText;
    Alignment := FAlignment;
  end;
  W := ClientWidth - FButtonWidth;
  X := 2;
  case Alignment of
    taRightJustify: X := W - Canvas.TextWidth(Text) - 3;
    taCenter: X := (W - Canvas.TextWidth(Text)) div 2;
  end;
  SetRect(R, 1, 1, W - 1, ClientHeight - 1);

  { This has been changed from the standard VCL }

  {Canvas.TextRect(R, X, 2, Text);}
  PaintItem(Canvas, Text, R, X - 1, 1);

  if Selected then Canvas.DrawFocusRect(R);
  SetRect(R, W, 0, ClientWidth, ClientHeight);
  if not FListActive then
    Flags := DFCS_SCROLLCOMBOBOX or DFCS_INACTIVE
  else if FPressed then
    Flags := DFCS_SCROLLCOMBOBOX or DFCS_FLAT or DFCS_PUSHED
  else
    Flags := DFCS_SCROLLCOMBOBOX;
  DrawFrameControl(Canvas.Handle, R, DFC_SCROLL, Flags);
end;

procedure TIvDBLookupComboBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, GetTextHeight + GetBorderSize + 4);
end;

procedure TIvDBLookupComboBox.StopTracking;
begin
  if FTracking then
  begin
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TIvDBLookupComboBox.TrackButton(X, Y: Integer);
var
  NewState: Boolean;
begin
  NewState := PtInRect(Rect(ClientWidth - FButtonWidth, 0, ClientWidth,
    ClientHeight), Point(X, Y));
  if FPressed <> NewState then
  begin
    FPressed := NewState;
    Repaint;
  end;
end;

procedure TIvDBLookupComboBox.CMCancelMode(var Message: TCMCancelMode);
begin
  if (Message.Sender <> Self) and (Message.Sender <> FDataList) then
    CloseUp(False);
end;

procedure TIvDBLookupComboBox.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls then
  begin
    RecreateWnd;
    Height := 0;
  end;
  inherited;
end;

procedure TIvDBLookupComboBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Height := 0;
end;

procedure TIvDBLookupComboBox.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

procedure TIvDBLookupComboBox.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TIvDBLookupComboBox.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  CloseUp(False);
end;
{$ENDIF}
{$ENDIF}

end.
