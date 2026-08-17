{
//
// Components : TwwSpinButton
//
// Copyright (c) 1998 by Woll2Woll Software
//
}
unit wwspin;

interface

uses Wintypes, winprocs, Classes, StdCtrls, ExtCtrls, Controls, Messages, SysUtils,
  Forms, Graphics, Menus, Buttons;

type

  TwwTimerSpeedButton = class;

  TwwSpinButton = class (TWinControl)
  private
    FUpButton: TwwTimerSpeedButton;
    FDownButton: TwwTimerSpeedButton;
    FOnUpClick: TNotifyEvent;
    FOnDownClick: TNotifyEvent;
    function CreateButton: TwwTimerSpeedButton;
    function GetUpGlyph: TBitmap;
    function GetDownGlyph: TBitmap;
    procedure SetUpGlyph(Value: TBitmap);
    procedure SetDownGlyph(Value: TBitmap);
    procedure BtnClick(Sender: TObject);
//    procedure BtnMouseDown(Sender: TObject; Button: TMouseButton;
//     Shift: TShiftState; X, Y: Integer);
    procedure AdjustSizes (var W: Integer; var H: Integer);
    procedure WMSize(var Message: TWMSize);  message WM_SIZE;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBkgnd;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure SetFlat(val: boolean);
    function GetFlat: boolean;
    procedure PaintTransparentBackground;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    property DownGlyph: TBitmap read GetDownGlyph write SetDownGlyph;
    property UpGlyph: TBitmap read GetUpGlyph write SetUpGlyph;
    property OnDownClick: TNotifyEvent read FOnDownClick write FOnDownClick;
    property OnUpClick: TNotifyEvent read FOnUpClick write FOnUpClick;
  published
    property Flat : boolean read GetFlat write SetFlat;
  end;


{ TwwTimerSpeedButton }

  TTimeBtnState = set of (tbFocusRect, tbAllowTimer);

  TwwTimerSpeedButton = class(TSpeedButton)
  private
    FRepeatTimer: TTimer;
    FTimeBtnState: TTimeBtnState;
    procedure TimerExpired(Sender: TObject);
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
  public
    destructor Destroy; override;
    property TimeBtnState: TTimeBtnState read FTimeBtnState write FTimeBtnState;
  end;

implementation

uses wwcommon, wwdbspin;

const
  InitRepeatPause = 400;  { pause before repeat timer (ms) }
  RepeatPause     = 100;  { pause before hint window displays (ms)}

{ TwwSpinButton }
constructor TwwSpinButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption] +
    [csFramed, csOpaque];

  FUpButton := CreateButton;
  FDownButton := CreateButton;
  UpGlyph := nil;
  DownGlyph := nil;

  Width := 20;
  Height := 25;
{  FFocusedButton := FUpButton;}
end;

function TwwSpinButton.CreateButton: TwwTimerSpeedButton;
begin
  Result := TwwTimerSpeedButton.Create (Self);
  Result.OnClick := BtnClick;
  Result.Visible := True;
  Result.Enabled := True;
  Result.TimeBtnState := [tbAllowTimer];
  Result.NumGlyphs := 1;
  Result.Parent := Self;
end;

procedure TwwSpinButton.AdjustSizes (var W: Integer; var H: Integer);
begin
  if (FUpButton = nil) or (csLoading in ComponentState) then Exit;
  if W < 15 then W := 15;
  FUpButton.SetBounds (0, 0, W, (H div 2));
  FDownButton.SetBounds (0, FUpButton.Height - 1, W, H - FUpButton.Height + 1);
end;

procedure TwwSpinButton.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  W, H: Integer;
begin
  W := AWidth;
  H := AHeight;
  AdjustSizes (W, H);
  inherited SetBounds (ALeft, ATop, W, H);
end;

procedure TwwSpinButton.WMSize(var Message: TWMSize);
var
  W, H: Integer;
begin
  inherited;

  { check for minimum size }
  W := Width;
  H := Height;
  AdjustSizes (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds(Left, Top, W, H);
  Message.Result := 0;
end;

procedure TwwSpinButton.BtnClick(Sender: TObject);
begin
  if Sender = FUpButton then
  begin
    if Assigned(FOnUpClick) then FOnUpClick(Self);
  end
  else
    if Assigned(FOnDownClick) then FOnDownClick(Self);
end;

procedure TwwSpinButton.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := DLGC_WANTARROWS;
end;

procedure TwwSpinButton.Loaded;
var
  W, H: Integer;
begin
  inherited Loaded;
  W := Width;
  H := Height;
  AdjustSizes (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds (Left, Top, W, H);
end;

function TwwSpinButton.GetUpGlyph: TBitmap;
begin
  Result := FUpButton.Glyph;
end;

procedure TwwSpinButton.SetUpGlyph(Value: TBitmap);
begin
  if Value <> nil then
    FUpButton.Glyph := Value
  else
  begin
    FUpButton.Glyph.Handle := LoadBitmap(HInstance, 'wwSpinUp');
    FUpButton.NumGlyphs := 1;
    FUpButton.Invalidate;
  end;
end;

function TwwSpinButton.GetDownGlyph: TBitmap;
begin
  Result := FDownButton.Glyph;
end;

procedure TwwSpinButton.SetDownGlyph(Value: TBitmap);
begin
  if Value <> nil then
    FDownButton.Glyph := Value
  else
  begin
    FDownButton.Glyph.Handle := LoadBitmap(HInstance, 'wwSpinDown');
    FDownButton.NumGlyphs := 1;
    FDownButton.Invalidate;
  end;
end;

{TwwTimerSpeedButton}
destructor TwwTimerSpeedButton.Destroy;
begin
  if FRepeatTimer <> nil then
    FRepeatTimer.Free;
  inherited Destroy;
end;

procedure TwwSpinButton.PaintTransparentBackground;
var r: TRect;
begin
  with parent as TwwDBSpinEdit do begin
   if ButtonEffects.Flat or ButtonEffects.Transparent then begin
     with self do begin
         r:= Rect(parent.left + Left, parent.Top+top,
                 parent.left + left+ Width, parent.top + Top + Height);
        { Calling with True causes flicker for any control that is invalidated.
          Test with False to see if any side effects  }
         InvalidateRect(parent.parent.handle, @r, False);
         parent.parent.Update;
     end
   end;
  end;
end;

procedure TwwTimerSpeedButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown (Button, Shift, X, Y);

  (parent as TwwSpinButton).PaintTransparentBackground;

  if tbAllowTimer in FTimeBtnState then
  begin
    if FRepeatTimer = nil then
      FRepeatTimer := TTimer.Create(Self);

    FRepeatTimer.OnTimer := TimerExpired;
    FRepeatTimer.Interval := InitRepeatPause;
    FRepeatTimer.Enabled  := True;
  end;
end;

procedure TwwTimerSpeedButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
                                  X, Y: Integer);
begin
  inherited MouseUp (Button, Shift, X, Y);
  if FRepeatTimer <> nil then
    FRepeatTimer.Enabled  := False;

  (parent as TwwSpinButton).PaintTransparentBackground;
end;

procedure TwwTimerSpeedButton.TimerExpired(Sender: TObject);
begin
  FRepeatTimer.Interval := RepeatPause;
  if (FState = bsDown) and MouseCapture then
  begin
    try
      Click;
    except
      FRepeatTimer.Enabled := False;
      raise;
    end;
  end;
end;

procedure TwwTimerSpeedButton.Paint;
var
  R: TRect;
  DrawFlags: Integer;
begin
   if TwwDBSpinEdit(parent.parent).SkipUpdate then exit;

{   with parent.parent as TwwDBSpinEdit do begin
     if FlatButton and FlatButtonTransparent then begin
       with self.parent do begin
         r:= Rect(parent.left + Left+self.left, parent.Top+top+self.top,
                 parent.left + left+ self.left + self.Width, parent.top + Top + self.top + self.Height);
         inflaterect(r, -1, -1);
         SkipUpdate:= True;
         InvalidateRect(parent.parent.handle, @r, True);
         parent.parent.Update;
         SkipUpdate:= False;
       end
     end;
   end;
}
   if (csPaintCopy in ControlState) and
      not (csDesigning in ComponentState) and IsInGrid(parent.parent) then exit;

   with TwwDBSpinEdit(parent.parent) do begin
      if MouseInControl or HasFocus or wwisClass(parent.classType, 'TwwDBGrid') then
         if not (ButtonEffects.Transparent) then
         begin
           DrawFlags := DFCS_BUTTONPUSH or DFCS_ADJUSTRECT;
           if FState in [bsDown, bsExclusive] then
              DrawFlags := DrawFlags or DFCS_PUSHED;
           R := Rect(0, 0, Width, Height);
           DrawFrameControl(Canvas.Handle, R, DFC_BUTTON, DrawFlags);
         end;
   end;

  inherited Paint;
{  if tbFocusRect in FTimeBtnState then
  begin
    R := Bounds(0, 0, Width, Height);
    InflateRect(R, -3, -3);
    if FState = bsDown then
      OffsetRect(R, 1, 1);
    DrawFocusRect(Canvas.Handle, R);
  end;
}
  { Draw edges  }
   with TwwDBSpinEdit(Parent.Parent) do
   begin
      SetRect(R, 0, 0, self.ClientWidth, self.ClientHeight);

      if MouseInControl or (not ButtonEffects.Flat) or
         HasFocus or wwisClass(Parent.classType, 'TwwDBGrid') then
      begin
         if FState=bsDown then
            DrawEdge(Canvas.Handle, R, EDGE_SUNKEN, BF_RECT)
         else
            DrawEdge(Canvas.Handle, R, EDGE_RAISED, BF_RECT);

      end
   end;


end;

procedure TwwSpinButton.SetFlat(val: boolean);
begin
   FUpButton.Flat:= val;
   FDownButton.flat:= val;
end;

function TwwSpinButton.GetFlat: boolean;
begin
   result:= FUpButton.Flat;
end;

procedure TwwSpinButton.WMEraseBkgnd(var Message: TWmEraseBkgnd);
var r: TRect;
    dtp: TwwDBSpinEdit;
begin
  dtp:= TwwDBSpinEdit(parent);
  if dtp.skipupdate then exit;
  if (IsInwwObjectViewPaint(parent) or
     dtp.isTransparentEffective)  then
  begin
     { Fixes paint problem when mouse is clicked in button and moved outside
       region, but it is not released }
     if (dtp.ButtonEffects.Flat or dtp.ButtonEffects.Transparent) and
        ((csLButtonDown in FUpButton.ControlState) or
         (csLButtonDown in FDownButton.ControlState)) then
     begin
        r:= Rect(parent.left + Left , parent.Top+top,
                 parent.left + left + Width, parent.top + Top + Height);
        InvalidateRect(parent.parent.handle, @r, False);
        dtp.skipupdate:= true;
        parent.parent.update;
        dtp.skipupdate:= False;
     end;
     Message.result:= 1;
     exit;
{
     r:= Rect(parent.left + Left , parent.Top+top,
                 parent.left + left + Width, parent.top + Top + Height);
     InvalidateRect(parent.parent.handle, @r, False);
     TwwDBSpinEdit(parent).skipupdate:= true;
     parent.parent.update;
     Message.result:= 1;
     TwwDBSpinEdit(parent).skipupdate:= False;
     exit;}
  end
  else inherited;
end;

procedure TwwSpinButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Flat then
  begin
     Invalidate;
  end
end;

procedure TwwSpinButton.CMMouseLeave(var Message: TMessage);
var r: TRect;
    offset: integer;
    EditControl: TwwDBSpinEdit;
begin
  EditControl:= TwwDBSpinEdit(parent);

  if not EditControl.ButtonEffects.Flat then exit;

  if EditControl.BorderStyle=bsSingle then offset:=2 else offset:= 0;
  if not EditControl.HasFocus then begin
     if EditControl.IsTransparentEffective then begin
        r:= Rect(parent.left + Left + offset, parent.Top+top+offset,
                 parent.left + left + offset + Width, parent.top + offset + Top + Height);
        InvalidateRect(parent.parent.handle, @r, True);
        Invalidate;
     end;
     Invalidate;
  end

end;


end.


