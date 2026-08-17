unit Meter;

interface

{$IFDEF VER100}      {Delphi 3}
  {$DEFINE D3OR4}
{$ENDIF}
{$IFDEF VER110}      {C++Builder 3}
  {$DEFINE D3OR4}
{$ENDIF}
{$IFDEF VER120}      {Delphi 4}
  {$DEFINE D3OR4}
{$ENDIF}
{$IFDEF VER130}      {Delphi 5}
  {$DEFINE D3OR4}
{$ENDIF}

uses 
{$IFDEF WIN32}
  SysUtils, Windows,
{$ELSE}
  WinTypes,          
{$ENDIF}
  Messages, Classes, Graphics, Controls, Forms, StdCtrls;

type

  TMeterKind = (gkText, gkHorizontalBar, gkVerticalBar, gkPie, gkNeedle);

  TMeter = class(TGraphicControl)
  private
    FMinValue: Longint;
    FMaxValue: Longint;
    FCurValue: Longint;
    FKind: TMeterKind;
    FShowText: Boolean;
    FBorderStyle: TBorderStyle;
    FForeColor: TColor;
    FBackColor: TColor;
    procedure PaintBackground(AnImage: TBitmap);
    procedure PaintAsText(AnImage: TBitmap; PaintRect: TRect);
    procedure PaintAsNothing(AnImage: TBitmap; PaintRect: TRect);
    procedure PaintAsBar(AnImage: TBitmap; PaintRect: TRect);
    procedure PaintAsPie(AnImage: TBitmap; PaintRect: TRect);
    procedure PaintAsNeedle(AnImage: TBitmap; PaintRect: TRect);
    procedure SetMeterKind(Value: TMeterKind);
    procedure SetShowText(Value: Boolean);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetForeColor(Value: TColor);
    procedure SetBackColor(Value: TColor);
    procedure SetMinValue(Value: Longint);
    procedure SetMaxValue(Value: Longint);
    procedure SetProgress(Value: Longint);
    function GetPercentDone: Longint;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AddProgress(Value: Longint);
    property PercentDone: Longint read GetPercentDone;
  published
    property Align;
    property Color;
    property Enabled;
    property Kind: TMeterKind read FKind write SetMeterKind default gkHorizontalBar;
    property ShowText: Boolean read FShowText write SetShowText default True;
    property Font;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property ForeColor: TColor read FForeColor write SetForeColor default clBlack;
    property BackColor: TColor read FBackColor write SetBackColor default clWhite;
    property MinValue: Longint read FMinValue write SetMinValue default 0;
    property MaxValue: Longint read FMaxValue write SetMaxValue default 100;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property Progress: Longint read FCurValue write SetProgress;
    property ShowHint;
    property Visible;
  end;

implementation

uses 
{$IFDEF WIN32}
  Consts;
{$ELSE}
  WinProcs, SysUtils;
{$ENDIF}

type
  TBltBitmap = class(TBitmap)
    procedure MakeLike(ATemplate: TBitmap);
  end;

procedure TBltBitmap.MakeLike(ATemplate: TBitmap);
begin
  Width := ATemplate.Width;
  Height := ATemplate.Height;
  Canvas.Brush.Color := clWindowFrame;
  Canvas.Brush.Style := bsSolid;
  Canvas.FillRect(Rect(0, 0, Width, Height));
end;

{ This function solves for x in the equation "x is y% of z". }
function SolveForX(Y, Z: Longint): Longint;
begin
  Result := Trunc( Z * (Y * 0.01) );
end;

{ This function solves for y in the equation "x is y% of z". }
function SolveForY(X, Z: Longint): Longint;
begin
  if Z = 0 then Result := 0
  else Result := Trunc( (X * 100.0) / Z );
end;

{ TMeter }

constructor TMeter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csFramed, csOpaque];
  { default values }
  FMinValue := 0;
  FMaxValue := 100;
  FCurValue := 0;
  FKind := gkHorizontalBar;
  FShowText := True;
  FBorderStyle := bsSingle;
  FForeColor := clBlack;
  FBackColor := clWhite;
  Width := 100;
  Height := 100;
end;

function TMeter.GetPercentDone: Longint;
begin
  Result := SolveForY(FCurValue - FMinValue, FMaxValue - FMinValue);
end;

procedure TMeter.Paint;
var
  TheImage: TBitmap;
  OverlayImage: TBltBitmap;
  PaintRect: TRect;
begin
  with Canvas do
  begin
    TheImage := TBitmap.Create;
    try
      TheImage.Height := Height;
      TheImage.Width := Width;
      PaintBackground(TheImage);
      PaintRect := ClientRect;
      if FBorderStyle = bsSingle then InflateRect(PaintRect, -1, -1);
      OverlayImage := TBltBitmap.Create;
      try
        OverlayImage.MakeLike(TheImage);
        PaintBackground(OverlayImage);
        case FKind of
          gkText: PaintAsNothing(OverlayImage, PaintRect);
          gkHorizontalBar, gkVerticalBar: PaintAsBar(OverlayImage, PaintRect);
          gkPie: PaintAsPie(OverlayImage, PaintRect);
          gkNeedle: PaintAsNeedle(OverlayImage, PaintRect);
        end;
        TheImage.Canvas.CopyMode := cmSrcInvert;
        TheImage.Canvas.Draw(0, 0, OverlayImage);
        TheImage.Canvas.CopyMode := cmSrcCopy;
        if ShowText then PaintAsText(TheImage, PaintRect);
      finally
        OverlayImage.Free;
      end;
      Canvas.CopyMode := cmSrcCopy;
      Canvas.Draw(0, 0, TheImage);
    finally
      TheImage.Destroy;
    end;
  end;
end;

procedure TMeter.PaintBackground(AnImage: TBitmap);
var
  ARect: TRect;
begin
  with AnImage.Canvas do
  begin
    CopyMode := cmBlackness;
    ARect := Rect(0, 0, Width, Height);
    CopyRect(ARect, Animage.Canvas, ARect);
    CopyMode := cmSrcCopy;
  end;
end;

procedure TMeter.PaintAsText(AnImage: TBitmap; PaintRect: TRect);
var
  S: string;
  X, Y: Integer;
  OverRect: TBltBitmap;
begin
  OverRect := TBltBitmap.Create;
  try
    OverRect.MakeLike(AnImage);
    PaintBackground(OverRect);
    S := Format('%d%%', [PercentDone]);
    with OverRect.Canvas do
    begin
      Brush.Style := bsClear;
      Font := Self.Font;
      Font.Color := clWhite;
      with PaintRect do
      begin
        X := (Right - Left + 1 - TextWidth(S)) div 2;
        Y := (Bottom - Top + 1 - TextHeight(S)) div 2;
      end;
      TextRect(PaintRect, X, Y, S);
    end;
    AnImage.Canvas.CopyMode := cmSrcInvert;
    AnImage.Canvas.Draw(0, 0, OverRect);
  finally
    OverRect.Free;
  end;
end;

procedure TMeter.PaintAsNothing(AnImage: TBitmap; PaintRect: TRect);
begin
  with AnImage do
  begin
    Canvas.Brush.Color := BackColor;
    Canvas.FillRect(PaintRect);
  end;
end;

procedure TMeter.PaintAsBar(AnImage: TBitmap; PaintRect: TRect);
var
  FillSize: Longint;
  W, H: Integer;
begin
  W := PaintRect.Right - PaintRect.Left + 1;
  H := PaintRect.Bottom - PaintRect.Top + 1;
  with AnImage.Canvas do
  begin
    Brush.Color := BackColor;
    FillRect(PaintRect);
    Pen.Color := ForeColor;
    Pen.Width := 1;
    Brush.Color := ForeColor;
    case FKind of
      gkHorizontalBar:
        begin
          FillSize := SolveForX(PercentDone, W);
          if FillSize > W then FillSize := W;
          if FillSize > 0 then FillRect(Rect(PaintRect.Left, PaintRect.Top,
            FillSize, H));
        end;
      gkVerticalBar:
        begin
          FillSize := SolveForX(PercentDone, H);
          if FillSize >= H then FillSize := H - 1;
          FillRect(Rect(PaintRect.Left, H - FillSize, W, H));
        end;
    end;
  end;
end;

procedure TMeter.PaintAsPie(AnImage: TBitmap; PaintRect: TRect);
var
  MiddleX, MiddleY: Integer;
  Angle: Double;
  W, H: Integer;
begin
  W := PaintRect.Right - PaintRect.Left;
  H := PaintRect.Bottom - PaintRect.Top;
  if FBorderStyle = bsSingle then
  begin
    Inc(W);
    Inc(H);
  end;
  with AnImage.Canvas do
  begin
    Brush.Color := Color;
    FillRect(PaintRect);
    Brush.Color := BackColor;
    Pen.Color := ForeColor;
    Pen.Width := 1;
    Ellipse(PaintRect.Left, PaintRect.Top, W, H);
    if PercentDone > 0 then
    begin
      Brush.Color := ForeColor;
      MiddleX := W div 2;
      MiddleY := H div 2;
      Angle := (Pi * ((PercentDone / 50) + 0.5));
      Pie(PaintRect.Left, PaintRect.Top, W, H, Round(MiddleX * (1 - Cos(Angle))),
        Round(MiddleY * (1 - Sin(Angle))), MiddleX, 0);
    end;
  end;
end;

procedure TMeter.PaintAsNeedle(AnImage: TBitmap; PaintRect: TRect);
var
  MiddleX: Integer;
  Angle: Double;
  X, Y, W, H: Integer;
begin
  with PaintRect do
  begin
    X := Left;
    Y := Top;
    W := Right - Left;
    H := Bottom - Top;
    if FBorderStyle = bsSingle then
    begin
      Inc(W);
      Inc(H);
    end;
  end;
  with AnImage.Canvas do
  begin
    Brush.Color := Color;
    FillRect(PaintRect);
    Brush.Color := BackColor;
    Pen.Color := ForeColor;
    Pen.Width := 1;
    Pie(X, Y, W, H * 2 - 1, X + W, PaintRect.Bottom - 1, X, PaintRect.Bottom - 1);
    MoveTo(X, PaintRect.Bottom);
    LineTo(X + W, PaintRect.Bottom);
    if PercentDone > 0 then
    begin
      Pen.Color := ForeColor;
      MiddleX := Width div 2;
      MoveTo(MiddleX, PaintRect.Bottom - 1);
      Angle := (Pi * ((PercentDone / 100)));
      LineTo(Round(MiddleX * (1 - Cos(Angle))), Round((PaintRect.Bottom - 1) *
        (1 - Sin(Angle))));
    end;
  end;
end;

procedure TMeter.SetMeterKind(Value: TMeterKind);
begin
  if Value <> FKind then
  begin
    FKind := Value;
    Refresh;
  end;
end;

procedure TMeter.SetShowText(Value: Boolean);
begin
  if Value <> FShowText then
  begin
    FShowText := Value;
    Refresh;
  end;
end;

procedure TMeter.SetBorderStyle(Value: TBorderStyle);
begin
  if Value <> FBorderStyle then
  begin
    FBorderStyle := Value;
    Refresh;
  end;
end;

procedure TMeter.SetForeColor(Value: TColor);
begin
  if Value <> FForeColor then
  begin
    FForeColor := Value;
    Refresh;
  end;
end;

procedure TMeter.SetBackColor(Value: TColor);
begin
  if Value <> FBackColor then
  begin
    FBackColor := Value;
    Refresh;
  end;
end;

procedure TMeter.SetMinValue(Value: Longint);
begin
  if Value <> FMinValue then
  begin
    if Value > FMaxValue then
      if not (csLoading in ComponentState) then
   {$IFDEF WIN32} {Delphi 2 }
    {$IFDEF D3OR4}  {Delphi 3,4 or C++Builder}
          raise EInvalidOperation.CreateFmt(SOutOfRange, [-MaxInt, FMaxValue - 1]);
    {$ELSE}
          raise EInvalidOperation.CreateResFmt(SOutOfRange, [-MaxInt, FMaxValue - 1]);
    {$ENDIF}
   {$ELSE} {Delphi 1 Just show the message}
        raise EInvalidOperation.Create('Integer out of range');
   {$ENDIF}
    FMinValue := Value;
    if FCurValue < Value then FCurValue := Value;
    Refresh;
  end;



end;

procedure TMeter.SetMaxValue(Value: Longint);
begin
  if Value <> FMaxValue then
  begin
    if Value < FMinValue then
      if not (csLoading in ComponentState) then
   {$IFDEF WIN32} {Delphi 2 }
    {$IFDEF D3OR4}
        raise EInvalidOperation.CreateFmt(SOutOfRange, [-MaxInt, FMaxValue - 1]);
    {$ELSE}
        raise EInvalidOperation.CreateResFmt(SOutOfRange, [-MaxInt, FMaxValue - 1]);
    {$ENDIF}
   {$ELSE} {Delphi 1 Just show the message}
        raise EInvalidOperation.Create('Integer out of range');
   {$ENDIF}


    FMaxValue := Value;
    if FCurValue > Value then FCurValue := Value;
    Refresh;
  end;
end;

procedure TMeter.SetProgress(Value: Longint);
var
  TempPercent: Longint;
begin
  TempPercent := GetPercentDone;  { remember where we were }
  if Value < FMinValue then
    Value := FMinValue
  else if Value > FMaxValue then
    Value := FMaxValue;
  if FCurValue <> Value then
  begin
    FCurValue := Value;
    if TempPercent <> GetPercentDone then { only refresh if percentage changed }
      Refresh;
  end;
end;

procedure TMeter.AddProgress(Value: Longint);
begin
  Progress := FCurValue + Value;
  Refresh;
end;

end.
