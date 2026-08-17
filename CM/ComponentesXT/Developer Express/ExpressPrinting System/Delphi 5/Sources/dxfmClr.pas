{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressPrinting System(tm) COMPONENT SUITE                  }
{                                                                   }
{       Copyright (C) 1998-2001 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSPRINTINGSYSTEM AND            }
{   ALL ACCOMPANYING VCL CONTROLS AS PART OF AN                     }
{   EXECUTABLE PROGRAM ONLY.                                        }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxfmClr;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons,
  dxBkgnd;


type
  TdxfmColorPalette = class(TForm)
    pnlTop: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton40: TSpeedButton;
    pnlBottom: TPanel;
    sBtnMoreColors: TSpeedButton;
    sBtnFillEffects: TSpeedButton;
    bvlNoFillHolder: TBevel;
    pnlMiddle: TPanel;
    Bevel1: TBevel;
    procedure sBtnMoreColorsClick(Sender: TObject);
    procedure sBtnFillEffectsClick(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
  private
    FAutoColor: TColor;
    FBackground: TdxBackground;
    FColor: TColor;
    FNoBtnCaption: string;
    FResult: TModalResult;
    FShowFillEffects: Boolean;
    FShowMoreColors: Boolean;
    sbtnNoFill: TSpeedButton;
    procedure AdjustHeight;
    function GetBorderStyle: TBorderStyle;
    procedure FindButtonColor;
    procedure InitControls;
    procedure LoadStrings;
    procedure SetAutoColor(Value: TColor);
    procedure SetBackground(Value: TdxBackground);
    procedure SetBackgroundColor(AColor: TColor);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetColor(Value: TColor);
    procedure SetNoBtnCaption(const Value: string);
    procedure SetShowFillEffects(Value: Boolean);
    procedure SetShowMoreColors(Value: Boolean);
    procedure SetupButtons;
    function TagToColor(ATag: Integer): TColor;
    procedure UpButtons;
    procedure WMKillFocus(var message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCCreate(var message: TWMNCCreate); message WM_NCCREATE;
    procedure WMNCDestroy(var message: TWMNCDestroy); message WM_NCDESTROY;
    procedure WMNCPaint(var message: TMessage); message WM_NCPAINT;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    property Color: TColor read FColor write SetColor;
  public
    constructor Create(AOwner: TComponent); override;
    function Execute: Boolean;
    property AutoColor: TColor read FAutoColor write SetAutoColor;
    property Background: TdxBackground read FBackground write SetBackground;
    property BorderStyle: TBorderStyle read GetBorderStyle write SetBorderStyle;
    property NoBtnCaption: string read FNoBtnCaption write SetNoBtnCaption;
    property ShowFillEffects: Boolean read FShowFillEffects write SetShowFillEffects;
    property ShowMoreColors: Boolean read FShowMoreColors write SetShowMoreColors;
  end;

  PdxBackgroundDlgData = ^TdxBackgroundDlgData;
  TdxBackgroundDlgData = packed record
    BorderStyle: TBorderStyle;
    FormCaption: string;
    NoBtnCaption: string;
    AutoColor: TColor;
    ShowFillEffects: Boolean;
    ShowMoreColors: Boolean;
  end;

function dxChooseBackgroundDlg(ABackground: TdxBackground; APosition: TPoint;
  const AParams: PdxBackgroundDlgData): Boolean;
  
const
  dxPaletteColors: array[0..7, 0..4] of TColor = 
   (($00000000, $00000484, $000004FF, $00FF04FF, $00CE9EFF), 
    ($00003498, $00006AFF, $00009AFF, $0000CBFF, $0098CFFF),
    ($00003C39, $00007D7B, $0000CF9C, $0000FFFF, $0098FFFF),
    ($00003400, $00008200, $0084A242, $0000FF00, $00CEFFCE),
    ($00633400, $00848600, $00CECF39, $00FFFF00, $00FFFFCE),
    ($00840400, $00FF0400, $00FF6531, $00FFCF00, $00FFCF9C),
    ($00943431, $009C6563, $00840484, $006B349C, $00FF9ECE),
    ($00313431, $007B7D7B, $00949694, $00C6C6C7, $00FFFFFF));
      
implementation
uses
  dxPSRes, dxPSUtl, dxPSCore, dxPSImgs, dxPSGlbl;
{$R *.DFM}

function dxChooseBackgroundDlg(ABackground: TdxBackground; APosition: TPoint;
  const AParams: PdxBackgroundDlgData): Boolean;
var
  R: TRect;
begin
  Result := False;
  if ABackground = nil then Exit;
  with TdxfmColorPalette.Create(nil) do
  try
    Background := ABackground;
    Left := APosition.X;
    Top := APosition.Y;
    if AParams <> nil then
    begin
      BorderStyle := AParams^.BorderStyle;
      Caption := AParams^.FormCaption;
      NoBtnCaption := AParams^.NoBtnCaption;
      AutoColor := AParams^.AutoColor;
      ShowFillEffects := AParams^.ShowFillEffects;
      ShowMoreColors := AParams^.ShowMoreColors;
    end
    else
    begin
      Caption := sdxPageBackground;
      NoBtnCaption := sdxBtnNoFill;
      AutoColor := clBlack;
      ShowFillEffects := True;
      ShowMoreColors := True;
    end;
    R := GetDesktopWorkArea();
    if (Left < R.Left) then
      Left := R.Left
    else if (Left + Width > R.Right) then
      Left := R.Right - Width;
    if (Top + Height > R.Bottom) then Top := R.Bottom - Height;
    Result := Execute;
  finally
    Free;
  end;
end;

var
  FColorDialog: TColorDialog;

type
  TdxNoFillButton = class(TSpeedButton)
  private
    FColorGlyph: TBitmap;
    FColorValue: TColor;
    FShowColorValue: Boolean;
    procedure SetColorValue(Value: TColor);
    procedure SetShowColorValue(Value: Boolean);
    procedure ChangeColorGlyph;
    procedure CreateColorGlyph;
    procedure DestroyColorGlyph;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ShowColorValue: Boolean read FShowColorValue write SetShowColorValue;
    property ColorValue: TColor read FColorValue write SetColorValue;
  end;


constructor TdxNoFillButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FColorValue := clBlack;
  ShowColorValue := False;
end;

destructor TdxNoFillButton.Destroy;
begin
  DestroyColorGlyph;
  inherited Destroy;
end;

procedure TdxNoFillButton.Paint;
var
  R: TRect;
begin
  inherited Paint;
  R := ClientRect;
  InflateRect(R, -2, -2);
  if (Screen.PixelsPerInch > 96) then
    InflateRect(R, -2, -2);
  DrawEdge(Canvas.Handle, R, BDR_SUNKENOUTER, BF_RECT or BF_FLAT);
end;

procedure TdxNoFillButton.CreateColorGlyph;
var
  R: TRect;
  DC: hDC;
begin
  FColorGlyph := TBitmap.Create;
  R := ClientRect;
  InflateRect(R, -2, -2);
  OffsetRect(R, -R.Left, -R.Top);
  R.Right := R.Bottom - R.Top;
  FColorGlyph.Width := R.Right;
  FColorGlyph.Height := R.Bottom;
  DC := FColorGlyph.Canvas.Handle;
  FrameRect(DC, R, GetSysColorBrush(COLOR_BTNSHADOW));
  ChangeColorGlyph;
end;

procedure TdxNoFillButton.DestroyColorGlyph;
begin
  Glyph := nil;
  if Assigned(FColorGlyph) then
  begin
    FColorGlyph.Free;
    FColorGlyph := nil;
  end;
end;

procedure TdxNoFillButton.ChangeColorGlyph;
var
  R: TRect;
  ABrush: hBrush;
begin
  R := Rect(0, 0, FColorGlyph.Width, FColorGlyph.Height);
  InflateRect(R, -1, -1);
  ABrush := CreateSolidBrush(ColorToRGB(ColorValue));
  FillRect(FColorGlyph.Canvas.Handle, R, ABrush);
  DeleteObject(ABrush);
  Glyph := FColorGlyph;
end;

procedure TdxNoFillButton.SetColorValue(Value: TColor);
begin
  if (FColorValue <> Value) then
  begin
    FColorValue := Value;
    if ShowColorValue then
    begin
      ChangeColorGlyph;
      Invalidate;
    end;
  end;
end;

procedure TdxNoFillButton.SetShowColorValue(Value: Boolean);
begin
  if (FShowColorValue <> Value) then
  begin
    FShowColorValue := Value;
    if FShowColorValue then
      CreateColorGlyph
    else
      DestroyColorGlyph;
    Invalidate;
  end;
end;

var
  cButtons: array[0..7, 0..4] of TSpeedButton;

constructor TdxfmColorPalette.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csCaptureMouse];
  FShowFillEffects := True;
  FShowMoreColors := True;
  InitControls;
  LoadStrings;
  sbtnNoFill := TdxNoFillButton.Create(Self);
  with sbtnNoFill do
  begin
    BoundsRect := bvlNoFillHolder.BoundsRect;
    Parent := pnlTop;
    Down := True;
    AllowAllUp := False;
    GroupIndex := 1;
    Tag := -1;
    Flat := True;
    Caption := FNoBtnCaption;
    OnClick := ButtonClick;
  end;
  FormStyle := fsStayOnTop;
end;

function TdxfmColorPalette.Execute: Boolean;
begin
  FResult := mrNone;
  Show;
  while (FResult = mrNone) do
    Application.HandleMessage;
//    Application.ProcessMessages;
  Result := (FResult = mrOK);
end;

procedure TdxfmColorPalette.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WindowClass.Style := Params.WindowClass.Style or CS_SAVEBITS;
end;

procedure TdxfmColorPalette.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) or (ssAlt in Shift) then
    Close
  else if (Key = Ord('f')) then
    sBtnFillEffects.Click
  else if (Key = Ord('b')) then
    sBtnMoreColors.Click
  else
    inherited;
end;

procedure TdxfmColorPalette.WMKillFocus(var message: TWMKillFocus);
begin
  inherited;
  FResult := mrCancel;
  Hide;
end;

procedure TdxfmColorPalette.WMNCCreate(var message: TWMNCCreate);
var
  SysMenu: hMenu;
begin
  inherited;
  SysMenu := GetSystemMenu(Handle, False);
  DeleteMenu(Sysmenu, SC_RESTORE, MF_BYCOMMAND);
  DeleteMenu(Sysmenu, SC_MINIMIZE, MF_BYCOMMAND);
  DeleteMenu(Sysmenu, SC_MAXIMIZE, MF_BYCOMMAND);
  DeleteMenu(Sysmenu, SC_SIZE, MF_BYCOMMAND);
end;

procedure TdxfmColorPalette.WMNCDestroy(var message: TWMNCDestroy);
begin
  GetSystemMenu(Handle, True);
  inherited;
end;

procedure TdxfmColorPalette.WMNCCalcSize(var message: TWMNCCalcSize);
begin
//  InflateRect(TWMNCCalcSize(message).CalcSize_Params^.rgrc[0], -1, -1);
  if BorderStyle = bsNone then
    InflateRect(TWMNCCalcSize(message).CalcSize_Params^.rgrc[0], -2, -2)
  else
    inherited;
end;

procedure TdxfmColorPalette.WMNCPaint(var message: TMessage);
var
  R: TRect;
  DC: hDC;
begin
  if BorderStyle = bsNone then
  begin
    GetWindowRect(Handle, R);
    OffsetRect(R, -R.Left, -R.Top);
    DC := GetWindowDC(Handle);
    try
      //DrawEdge(DC, R, BDR_SUNKENOUTER, BF_RECT or BF_MONO);
      DrawEdge(DC, R, EDGE_RAISED, BF_ADJUST or BF_RECT);
    finally
      ReleaseDC(Handle, DC);
    end;
  end
  else
    inherited;
end;

procedure TdxfmColorPalette.SetNoBtnCaption(const Value: string);
begin
  if CompareStr(FNoBtnCaption, Value) <> 0 then
  begin
    FNoBtnCaption := Value;
    sbtnNoFill.Caption := FNoBtnCaption;
  end;
end;

procedure TdxfmColorPalette.SetShowFillEffects(Value: Boolean);
begin
  if FShowFillEffects <> Value then
  begin
    FShowFillEffects := Value;
    pnlBottom.Visible := FShowMoreColors or FShowFillEffects;
    pnlMiddle.Visible := pnlBottom.Visible;
    AdjustHeight;
  end;
end;

procedure TdxfmColorPalette.SetShowMoreColors(Value: Boolean);
begin
  if FShowMoreColors <> Value then
  begin
    FShowMoreColors := Value;
    pnlBottom.Visible := FShowMoreColors or FShowFillEffects;
    pnlMiddle.Visible := pnlBottom.Visible;
    AdjustHeight;
  end;
end;

function TdxfmColorPalette.GetBorderStyle: TBorderStyle;
begin
  Result := inherited BorderStyle;
end;

procedure TdxfmColorPalette.SetBorderStyle(Value: TBorderStyle);
begin
  inherited BorderStyle := Value;
  AdjustHeight;
end;

procedure TdxfmColorPalette.AdjustHeight;
var
  H: Integer;
begin
  H := pnlTop.Height;
  if pnlMiddle.Visible then Inc(H, pnlMiddle.Height);
  if pnlBottom.Visible then Inc(H, pnlBottom.Height);
  ClientHeight := H;
end;

procedure TdxfmColorPalette.InitControls;
const
  W = 16;
  H = 16;
var
  I, J, Ind: Integer;
  AName: string;
  R: TRect;
begin
  R := Rect(0, 0, W, H);
  for J := 0 to 4 do
    for I := 0 to 7 do
    begin
      Ind := J * 8 + I;
      AName := 'SpeedButton' + Trim(IntToStr(Ind + 1));
      cButtons[I, J] := TSpeedButton(Self.FindComponent(AName));
      cButtons[I, J].Tag := Ind;
      cButtons[I, J].Glyph.Width := W;
      cButtons[I, J].Glyph.Height := H;
      with cButtons[I, J].Glyph.Canvas  do 
      begin
        Brush.Color := GetSysColor(COLOR_BTNFACE);
        FillRect(R);
        InflateRect(R, -2, -2);        
        Brush.Color := GetSysColor(COLOR_BTNSHADOW);
        FrameRect(R);
        InflateRect(R, -1, -1);
        Brush.Color := ColorToRGB(dxPaletteColors[I, J]);
        FillRect(R);
        InflateRect(R, 3, 3);        
      end;
    end;
end;

procedure TdxfmColorPalette.LoadStrings;
begin
  sBtnMoreColors.Caption := sdxBtnMoreColors;
  sBtnFillEffects.Caption := sdxBtnFillEffects;
  
  SpeedButton1.Hint := sdxColorBlack;
  SpeedButton9.Hint := sdxColorDarkRed;
  SpeedButton17.Hint := sdxColorRed;
  SpeedButton25.Hint := sdxColorPink;
  SpeedButton33.Hint := sdxColorRose;
  SpeedButton2.Hint := sdxColorBrown;
  SpeedButton10.Hint := sdxColorOrange;
  SpeedButton18.Hint := sdxColorLightOrange;
  SpeedButton26.Hint := sdxColorGold;
  SpeedButton34.Hint := sdxColorTan;
  SpeedButton3.Hint := sdxColorOliveGreen;
  SpeedButton11.Hint := sdxColorDrakYellow;
  SpeedButton19.Hint := sdxColorLime;
  SpeedButton27.Hint := sdxColorYellow;
  SpeedButton35.Hint := sdxColorLightYellow;
  SpeedButton4.Hint := sdxColorDarkGreen;
  SpeedButton12.Hint := sdxColorGreen;
  SpeedButton20.Hint := sdxColorSeaGreen;
  SpeedButton28.Hint := sdxColorBrighthGreen;
  SpeedButton36.Hint := sdxColorLightGreen;
  SpeedButton5.Hint := sdxColorDarkTeal;
  SpeedButton13.Hint := sdxColorTeal;
  SpeedButton21.Hint := sdxColorAqua;
  SpeedButton29.Hint := sdxColorTurquoise;
  SpeedButton37.Hint := sdxColorLightTurquoise;
  SpeedButton6.Hint := sdxColorDarkBlue;
  SpeedButton14.Hint := sdxColorBlue;
  SpeedButton22.Hint := sdxColorLightBlue;
  SpeedButton30.Hint := sdxColorSkyBlue;
  SpeedButton38.Hint := sdxColorPaleBlue;
  SpeedButton7.Hint := sdxColorIndigo;
  SpeedButton15.Hint := sdxColorBlueGray;
  SpeedButton23.Hint := sdxColorViolet;
  SpeedButton31.Hint := sdxColorPlum;
  SpeedButton39.Hint := sdxColorLavender;
  SpeedButton8.Hint := sdxColorGray80;
  SpeedButton16.Hint := sdxColorGray50;
  SpeedButton24.Hint := sdxColorGray40;
  SpeedButton32.Hint := sdxColorGray25;
  SpeedButton40.Hint := sdxColorWhite;
end;

procedure TdxfmColorPalette.SetColor(Value: TColor);
begin
  FColor := Value;
  FindButtonColor;
end;

procedure TdxfmColorPalette.FindButtonColor;
var
  I, J: Integer;
begin
  for I := 0 to 7 do
    for J := 0 to 4 do
      if (FColor = dxPaletteColors[I, J]) then
      begin
        cButtons[I, J].Down := True;
        Exit;
      end;
  UpButtons;
end;

procedure TdxfmColorPalette.UpButtons;
var
  I, J: Integer;
begin
  for I := 0 to 7 do
    for J := 0 to 4 do
    begin
      cButtons[I, J].AllowAllUp := True;
      cButtons[I, J].Down := False;
    end;
  sbtnNoFill.AllowAllUp := True;
  sbtnNoFill.Down := False;
end;

procedure TdxfmColorPalette.sBtnMoreColorsClick(Sender: TObject);
begin
  Hide;
  FColorDialog.Color := FColor;
  if FColorDialog.Execute then
  begin
    SetBackgroundColor(FColorDialog.Color);
    FResult := mrOK;
  end
  else
    FResult := mrCancel;
end;

procedure TdxfmColorPalette.sBtnFillEffectsClick(Sender: TObject);
const
  ModalResults: array[Boolean] of TModalResult = (mrCancel, mrOK);
begin
  Hide;
  Application.ProcessMessages;
  FResult := ModalResults[Background.SetupEffects()];
end;

procedure TdxfmColorPalette.SetupButtons;
begin
  if FBackground <> nil then
    case FBackground.Mode of
      bmNone:
        sbtnNoFill.Down := True;
      bmBrush:
        Color := FBackground.Brush.Color
    else // bmBrushBitmap, bmPicture
      UpButtons;
    end;
end;

procedure TdxfmColorPalette.SetAutoColor(Value: TColor);
begin
  if FAutoColor <> Value then
  begin
    FAutoColor := Value;
    TdxNoFillButton(sbtnNoFill).ColorValue := FAutoColor;
  end;
end;

procedure TdxfmColorPalette.SetBackground(Value: TdxBackground);
begin
  FBackground := Value;
  SetupButtons;
end;

function TdxfmColorPalette.TagToColor(ATag: Integer): TColor;
begin
  Result := dxPaletteColors[ATag - (ATag div 8) * 8, ATag div 8];
end;

procedure TdxfmColorPalette.SetBackgroundColor(AColor: TColor);
begin
  with Background do
  begin 
    BeginUpdate;
    try
      Mode := bmBrush;
      Brush.Style := bsSolid;
      Brush.Color := AColor;
    finally
      EndUpdate;
    end;
  end;  
end;

procedure TdxfmColorPalette.ButtonClick(Sender: TObject);
begin
  if TSpeedButton(Sender).Tag = -1 then // No Fill
    Background.Mode := bmNone
  else
    SetBackgroundColor(TagToColor(TSpeedButton(Sender).Tag));
  FResult := mrOk;
end;

initialization
  FColorDialog := TColorDialog.Create(nil);

finalization
  FColorDialog.Free;

end.

