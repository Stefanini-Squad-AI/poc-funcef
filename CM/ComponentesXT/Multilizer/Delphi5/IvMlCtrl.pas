unit IvMlCtrl;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Classes, Graphics, Controls, Menus, Forms, Stdctrls, ExtCtrls;

type
  { Label }

{$IFNDEF IVBIDI}
  TIvCustomLabel = class(TCustomLabel)
  private
  {$IFDEF WIN32}
    {$IFNDEF VER110}
    procedure DoDrawText(var rect: TRect; flags: Integer);
    {$ENDIF}
  {$ENDIF}

  protected
    FLocale: Integer;

    procedure SetLocale(value: Integer);

  {$IFDEF VER110}
    procedure DoDrawText(var rect: TRect; flags: Word); override;
  {$ENDIF}
  {$IFDEF WIN32}
    procedure Paint; override;
  {$ENDIF}

  public
    constructor Create(owner: TComponent); override;

    property Locale: Integer read FLocale write SetLocale;
  end;
{$ENDIF}

{$IFDEF IVBIDI}
  TIvLabel = class(TLabel)
  end;
{$ELSE}
  TIvLabel = class(TIvCustomLabel)
  published
    property Align;
    property Alignment;
    property AutoSize;
    property Caption;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property Locale stored False;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property Transparent;
  {$IFDEF IVWIDE}
    property Layout;
  {$ENDIF}
    property Visible;
    property WordWrap;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  {$IFDEF WIN32}
    property OnStartDrag;
  {$ENDIF}
  end;
{$ENDIF}

  { Group box }

{$IFNDEF IVBIDI}
  TIvCustomGroupBox = class(TCustomGroupBox)
  protected
    FLocale: Integer;

    procedure SetLocale(value: Integer);

  {$IFDEF WIN32}
    procedure Paint; override;
  {$ENDIF}

  public
    constructor Create(owner: TComponent); override;

    property Locale: Integer read FLocale write SetLocale;
  end;
{$ENDIF}

{$IFDEF IVBIDI}
  TIvGroupBox = class(TGroupBox)
  end;
{$ELSE}
  TIvGroupBox = class(TIvCustomGroupBox)
  published
    property Align;
    property Caption;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property Locale stored False;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
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
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  {$IFDEF WIN32}
    property OnStartDrag;
  {$ENDIF}
  end;
{$ENDIF}

  { Radio box }

{$IFNDEF IVBIDI}
  TIvCustomRadioGroup = class(TCustomRadioGroup)
  protected
    FLocale: Integer;

    procedure SetLocale(value: Integer);

  {$IFDEF WIN32}
    procedure Paint; override;
  {$ENDIF}

  public
    constructor Create(owner: TComponent); override;

    property Locale: Integer read FLocale write SetLocale;
  end;
{$ENDIF}

{$IFDEF IVBIDI}
  TIvRadioGroup = class(TRadioGroup)
  end;
{$ELSE}
  TIvRadioGroup = class(TIvCustomRadioGroup)
  published
    property Align;
    property Caption;
    property Color;
    property Columns;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ItemIndex;
    property Items;
    property Locale stored False;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
  {$IFDEF WIN32}
    property OnStartDrag;
  {$ENDIF}
  end;
{$ENDIF}

  { List box }

{$IFNDEF IVBIDI}
  TIvCustomListBox = class(TCustomListBox)
  private
    FLocale: Integer;

    procedure SetLocale(value: Integer);

  protected
    procedure CreateParams(var Params: TCreateParams); override;

  public
    constructor Create(owner: TComponent); override;

    property Locale: Integer read FLocale write SetLocale;
  end;
{$ENDIF}

{$IFDEF IVBIDI}
  TIvListBox = class(TListBox)
  end;
{$ELSE}
  TIvListBox = class(TIvCustomListBox)
  published
    property Align;
    property BorderStyle;
    property Color;
    property Columns;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property ExtendedSelect;
    property Font;
  {$IFDEF IVIME}
    property ImeMode;
    property ImeName;
  {$ENDIF}
    property IntegralHeight;
    property ItemHeight;
    property Items;
    property Locale stored False;
    property MultiSelect;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Sorted;
    property Style;
    property TabOrder;
    property TabStop;
  {$IFDEF WIN32}
    property TabWidth;
  {$ENDIF}
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  {$IFDEF WIN32}
    property OnStartDrag;
  {$ENDIF}
  end;
{$ENDIF}

  { Combo box }

{$IFNDEF IVBIDI}
  TIvCustomComboBox = class(TCustomComboBox)
  private
    FLocale: Integer;

    procedure SetLocale(value: Integer);

  protected
    procedure CreateParams(var Params: TCreateParams); override;

  public
    constructor Create(owner: TComponent); override;

    property Locale: Integer read FLocale write SetLocale;
  end;
{$ENDIF}

{$IFDEF IVBIDI}
  TIvComboBox = class(TComboBox)
  end;
{$ELSE}
  TIvComboBox = class(TIvCustomComboBox)
  published
    property Style; {Must be published before Items}
    property Color;
    property Ctl3D;
    property DragMode;
    property DragCursor;
    property DropDownCount;
    property Enabled;
    property Font;
  {$IFDEF IVIME}
    property ImeMode;
    property ImeName;
  {$ENDIF}
    property ItemHeight;
    property Items;
    property Locale stored False;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
  {$IFDEF WIN32}
    property OnStartDrag;
  {$ENDIF}
  end;
{$ENDIF}

implementation

{$IFNDEF IVBIDI}
uses
  {$IFNDEF WIN32}
  SysUtils,
  {$ENDIF}
  IvDictio, IvMulti;

{ TIvCustomLabel }

constructor TIvCustomLabel.Create(owner: TComponent);
begin
  inherited Create(owner);
  FLocale := 0;
end;

procedure TIvCustomLabel.SetLocale(value: Integer);
begin
  if value <> FLocale then
  begin
    FLocale := value;
    Invalidate;
  end;
end;

{$IFDEF WIN32}
  {$IFDEF VER110}
procedure TIvCustomLabel.DoDrawText(var rect: TRect; flags: Word);
  {$ELSE}
procedure TIvCustomLabel.DoDrawText(var rect: TRect; flags: Integer);
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

procedure TIvCustomLabel.Paint;
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
{$IFDEF IVWIDE}
    { Calculate vertical layout }
    if Layout <> tlTop then
    begin
      DoDrawText(Rect, DrawStyle or DT_CALCRECT);
      if Layout = tlBottom then
        OffsetRect(Rect, 0, Height - Rect.Bottom)
      else
        OffsetRect(Rect, 0, (Height - Rect.Bottom) div 2);
    end;
{$ENDIF}
    DoDrawText(Rect, DrawStyle);
  end;
end;
{$ENDIF}


{ TIvCustomGroupBox }

constructor TIvCustomGroupBox.Create(owner: TComponent);
begin
  inherited Create(owner);
  FLocale := 0;
end;

procedure TIvCustomGroupBox.SetLocale(value: Integer);
begin
  if value <> FLocale then
  begin
    FLocale := value;
    Invalidate;
  end;
end;

{$IFDEF WIN32}
procedure TIvCustomGroupBox.Paint;
var
{$IFDEF IVPRO32}
  w: Integer;
{$ENDIF}
  H, flags: Integer;
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
{$IFDEF IVPRO32}
      if IvIsLocaleBidirectional(FLocale) then
        flags := DT_RTLREADING
      else
{$ENDIF}
        flags := 0;

      R := Rect(8, 0, Width - 16, H);
      DrawTextEx(
        Handle,
        PChar(Text),
        Length(Text),
        R,
        flags or DT_LEFT or DT_SINGLELINE or DT_CALCRECT,
        nil);

      Brush.Color := Color;
{$IFDEF IVPRO32}
      w := R.right - R.left;
      if IvIsLocaleBidirectional(FLocale) then
      begin
        R.right := Width - 8;
        R.left := R.right - w;
      end;
{$ENDIF}

      DrawTextEx(
        Handle,
        PChar(Text),
        Length(Text),
        R,
        flags or DT_LEFT or DT_SINGLELINE,
        nil);
    end;
  end;
end;
{$ENDIF}


{ TIvCustomRadioGroup }

constructor TIvCustomRadioGroup.Create(owner: TComponent);
begin
  inherited Create(owner);
  FLocale := 0;
end;

procedure TIvCustomRadioGroup.SetLocale(value: Integer);
begin
  if value <> FLocale then
  begin
    FLocale := value;
    Invalidate;
  end;
end;

{$IFDEF WIN32}
procedure TIvCustomRadioGroup.Paint;
var
  H, flags: Integer;
  R: TRect;
{$IFDEF IVPRO32}
  w: Integer;
{$ENDIF}
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
{$IFDEF IVPRO32}
      if IvIsLocaleBidirectional(FLocale) then
        flags := DT_RTLREADING
      else
{$ENDIF}
        flags := 0;

      R := Rect(8, 0, Width - 16, H);
      DrawTextEx(
        Handle,
        PChar(Text),
        Length(Text),
        R,
        flags or DT_LEFT or DT_SINGLELINE or DT_CALCRECT,
        nil);

      Brush.Color := Color;
{$IFDEF IVPRO32}
      w := R.right - R.left;
      if IvIsLocaleBidirectional(FLocale) then
      begin
        R.right := Width - 8;
        R.left := R.right - w;
      end;
{$ENDIF}

      DrawTextEx(
        Handle,
        PChar(Text),
        Length(Text),
        R,
        flags or DT_LEFT or DT_SINGLELINE,
        nil);
    end;
  end;
end;
{$ENDIF}

{ TIvCustomListBox }

constructor TIvCustomListBox.Create(owner: TComponent);
begin
  inherited Create(owner);
  FLocale := 0;
end;

procedure TIvCustomListBox.SetLocale(value: Integer);
begin
  if value <> FLocale then
  begin
    FLocale := value;
{$IFDEF IVPRO32}
    RecreateWnd;
{$ENDIF}
  end;
end;

procedure TIvCustomListBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(params);
{$IFDEF IVPRO32}
  if IvIsLocaleBidirectional(FLocale) then
    Params.ExStyle := Params.ExStyle or WS_EX_RIGHT or WS_EX_LEFTSCROLLBAR or WS_EX_RTLREADING;
{$ENDIF}
end;


{ TIvCustomComboBox }

constructor TIvCustomComboBox.Create(owner: TComponent);
begin
  inherited Create(owner);
  FLocale := 0;
end;

procedure TIvCustomComboBox.SetLocale(value: Integer);
begin
  if value <> FLocale then
  begin
    FLocale := value;
{$IFDEF IVPRO32}
    RecreateWnd;
{$ENDIF}
  end;
end;

procedure TIvCustomComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(params);
{$IFDEF IVPRO32}
  if IvIsLocaleBidirectional(FLocale) then
    Params.ExStyle := Params.ExStyle or WS_EX_RIGHT or WS_EX_LEFTSCROLLBAR or WS_EX_RTLREADING;
{$ENDIF}
end;
{$ENDIF}

end.
