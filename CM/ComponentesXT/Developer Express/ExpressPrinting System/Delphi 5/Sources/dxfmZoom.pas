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

unit dxfmZoom;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  ExtCtrls, StdCtrls, ComCtrls, Commctrl, Buttons, {$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxExtCtrls, dxPreVw, dxPSForm;

type
  TfmZoom = class(TCustomdxPSForm)
    btnOK: TButton;
    btnCancel: TButton;
    gbxPreview: TGroupBox;
    btnHelp: TButton;
    Panel1: TPanel;
    stxtFontPreview: TStaticText;
    gbxZoomTo: TGroupBox;
    rbtn500: TRadioButton;
    rbtn200: TRadioButton;
    rbtn150: TRadioButton;
    rbtn100: TRadioButton;
    rbtn75: TRadioButton;
    rbtn50: TRadioButton;
    rbtn10: TRadioButton;
    rbtn25: TRadioButton;
    rbtnTwoPages: TRadioButton;
    rbtnWholePage: TRadioButton;
    rbtnPageWidth: TRadioButton;
    rbtnFourPages: TRadioButton;
    rbtnManyPages: TRadioButton;
    lblPercent: TLabel;
    bvlPercentHolder: TBevel;
    bvlFontPreviewHolder: TBevel;
    bvlPreviewHolder: TBevel;
    btnManyPages: TBitBtn;
    ilStub: TImageList;
    procedure lblPercentClick(Sender: TObject);
    procedure rbtnClick(Sender: TObject);
    procedure btnManyPagesClick(Sender: TObject);
  private
    FModified: Boolean;
    FpnlFontPreview: TCustomControl;
    FpnlPreview: TCustomControl;
    FPreview: TdxPreview;
    FPreviewOwnerSize: TPoint;
    FsePercent: TCustomEdit;
    FUpdateCount: Integer;

    procedure BeginUpdate;
    procedure CreateControls;
    procedure EndUpdate;
    function Execute: Boolean;
    procedure FontPreviewPaint(Sender: TObject);
    procedure InitControls;
    procedure InitPreview(APreview: TdxPreview);
    procedure LoadStrings;
    procedure PercentButtonClick(Sender: TObject; ButtonType: TdxButtonType; Button: TUDBtnType);
    procedure PercentChange(Sender: TObject);
    procedure PercentExit(Sender: TObject);
    procedure PreviewPaint(Sender: TObject);
    procedure SetZoomFactor(Value: Integer);
    procedure UncheckAll;
    procedure UpdateControlsState;
    procedure ZoomKeyPress(Sender: TObject; var Key: Char);
  public
    constructor Create(AOwner: TComponent); override;
  end;

function dxZoomDlg(APreview: TdxPreview): Boolean;

implementation

{$R *.DFM}

uses
  dxPSGlbl, dxPSImgs, dxPSRes, dxPSUtl, dxfmMnPg, Math;

function dxZoomDlg(APreview: TdxPreview): Boolean;
var
  fmZoom: TfmZoom;
begin
  fmZoom := TfmZoom.Create(nil);
  try
    with fmZoom do
    begin
      CreateControls;
      InitPreview(APreview);
      if (APreview.Owner <> nil) and (APreview.Owner is TControl) then
        FPreviewOwnerSize := Point(TControl(APreview.Owner).Width, TControl(APreview.Owner).Height)
      else
        FPreviewOwnerSize := Point(APreview.Width, APreview.Height);
      Result := Execute;
      if Result then
      begin
        APreview.ZoomMode := fmZoom.FPreview.ZoomMode;
        APreview.SetPageXYCount(fmZoom.FPreview.ColCount, fmZoom.FPreview.RowCount);
        APreview.ZoomFactor := fmZoom.FPreview.ZoomFactor;
      end;
    end;
  finally
    fmZoom.Free;
  end;
end;

{ = ========================================================================== }
{ TfmZoom class realization                                                    }
{ = ========================================================================== }

constructor TfmZoom.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HelpContext := dxhcZoomDlg;
  if (HelpContext <> 0) then
    BorderIcons := BorderIcons + [biHelp];
  btnHelp.Visible := (HelpContext <> 0);
  if not btnHelp.Visible then
  begin
    btnOK.BoundsRect := btnCancel.BoundsRect;
    btnCancel.BoundsRect := btnHelp.BoundsRect;
  end;
  FPreview := TdxPreview.Create(Self);
  FPreview.Visible := False;
  FPreview.MinZoomFactor := 10;
  FPreview.Parent := Self;
end;

procedure TfmZoom.UpdateControlsState;
begin
  //btnOK.Enabled := FModified;
end;

type
  TdxPreviewHack = class(TdxPreview);
  
procedure TfmZoom.InitPreview(APreview: TdxPreview);
var
  i: Integer;
begin
  FPreview.MeasurementUnits := APreview.MeasurementUnits;
  FPreview.Orientation := APreview.Orientation;
  FPreview.OriginalPageSize := APreview.OriginalPageSize;
  for i := 0 to APreview.PageCount - 1 do
    TdxPreviewHack(FPreview).AddPage;
  FPreview.PageXCount := APreview.PageXCount;
  FPreview.PageYCount := APreview.PageYCount;
  FPreview.Width := APreview.Width;
  FPreview.Height := APreview.Height;
  FPreview.ZoomFactor := APreview.ZoomFactor;
  FPreview.ZoomMode := APreview.ZoomMode;
end;

procedure TfmZoom.CreateControls;
begin
  FsePercent := TdxPSSpinEdit.Create(Self);
  with TdxPSSpinEdit(FsePercent) do
  begin
    Parent := gbxZoomTo;
    BoundsRect := bvlPercentHolder.BoundsRect;
    MinValue := FPreview.MinZoomFactor;
    MaxValue := FPreview.MaxZoomFactor;
    Value := FPreview.ZoomFactor;
    LegendText := '%';
    OnKeyPress := ZoomKeyPress;
    OnButtonClick := PercentButtonClick;
    OnExit := PercentExit;
    OnChange := PercentChange;
  end;
  lblPercent.FocusControl := FsePercent;

  FpnlPreview := TdxPSPaintPanel.Create(Self);
  with TdxPSPaintPanel(FpnlPreview) do
  begin
    Parent := gbxPreview;
    BoundsRect := bvlPreviewHolder.BoundsRect;
    OnPaint := PreviewPaint;
    EdgeInner := esNone;
    EdgeOuter := esNone;
  end;

  FpnlFontPreview := TdxPSPaintPanel.Create(Self);
  with TdxPSPaintPanel(FpnlFontPreview) do
  begin
    Parent := gbxPreview;
    BoundsRect := bvlFontPreviewHolder.BoundsRect;
    OnPaint := FontPreviewPaint;
    EdgeInner := esNone;
    EdgeOuter := esNone;
  end;
end;

procedure TfmZoom.SetZoomFactor(Value: Integer);
begin
  TdxPSSpinEdit(FsePercent).AsInteger := Value;
  FPreview.ZoomFactor := Value;
  FpnlFontPreview.Invalidate;
  FpnlPreview.Invalidate;
end;

function TfmZoom.Execute: Boolean;
begin
  LoadStrings;
  InitControls;
  FModified := False;
  UpdateControlsState;
  Result := (ShowModal = mrOK) and FModified;
end;

procedure TfmZoom.LoadStrings;
begin
  btnOK.Caption := sdxBtnOK;
  btnCancel.Caption := sdxBtnCancel;
  btnHelp.Caption := sdxBtnHelp;

  Caption := sdxZoomDlgCaption;
  gbxZoomTo.Caption := sdxZoomDlgZoomTo;
  rbtnPageWidth.Caption := sdxZoomDlgPageWidth;
  rbtnWholePage.Caption := sdxZoomDlgWholePage;
  rbtnTwoPages.Caption := sdxZoomDlgTwoPages;
  rbtnFourPages.Caption := sdxZoomDlgFourPages;
  rbtnManyPages.Caption := sdxZoomDlgManyPages;
  lblPercent.Caption := sdxZoomDlgPercent;
  gbxPreview.Caption := sdxZoomDlgPreview;
  stxtFontPreview.Caption := sdxZoomDlgFontPreview;
end;

procedure TfmZoom.InitControls;
begin
  case FPreview.ZoomMode of
    pzmNone:
      begin
        if (FPreview.ZoomFactor = 500) then
        begin
          rbtn500.Checked := True;
          ActiveControl := rbtn500;
        end  
        else 
          if (FPreview.ZoomFactor = 200) then
          begin
            rbtn200.Checked := True;
            ActiveControl := rbtn200;
          end  
          else 
            if (FPreview.ZoomFactor = 150) then
            begin
              rbtn150.Checked := True;
              ActiveControl := rbtn150;
            end  
            else 
              if (FPreview.ZoomFactor = 100) then
              begin
                rbtn100.Checked := True;
                ActiveControl := rbtn100;
              end  
              else 
                if (FPreview.ZoomFactor = 75) then
                begin
                  rbtn75.Checked := True;
                  ActiveControl := rbtn75;
                end  
                else 
                  if (FPreview.ZoomFactor = 50) then
                  begin
                    rbtn50.Checked := True;
                    ActiveControl := rbtn50;
                  end  
                  else 
                    if (FPreview.ZoomFactor = 25) then
                    begin
                      rbtn25.Checked := True;
                      ActiveControl := rbtn25;
                    end
                    else 
                      if (FPreview.ZoomFactor = 10) then
                      begin
                        rbtn10.Checked := True;
                        ActiveControl := rbtn10;
                      end;
        TdxPSSpinEdit(FsePercent).Value := FPreview.ZoomFactor;
      end;
    pzmPageWidth:
      rbtnPageWidth.Checked := True;
    pzmPages:
      if (FPreview.ColCount = 1) then
        rbtnWholePage.Checked := True
      else if (FPreview.ColCount = 2) then
        rbtnTwoPages.Checked := True
      else if (FPreview.ColCount = 4) then
        rbtnFourPages.Checked := True
      else
        rbtnManyPages.Checked := True;
  end;
  rbtnTwoPages.Enabled := (FPreview.PageCount > 1);
  rbtnFourPages.Enabled := (FPreview.PageCount > 3);
end;

procedure TfmZoom.lblPercentClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
end;

procedure TfmZoom.rbtnClick(Sender: TObject);
const
  cZoomFactors: array[0..7] of Integer = (500, 200, 150, 100, 75, 50, 25, 10);
var
  T: Integer;
begin
  T := TComponent(Sender).Tag;
  if (T < 8) then
  begin
    TdxPSSpinEdit(FsePercent).AsInteger := cZoomFactors[T];
    FPreview.ZoomMode := pzmNone;
    SetZoomFactor(cZoomFactors[T]);
  end
  else if (T < 12) then
  begin
    SetZoomFactor(FPreview.ZoomFactor);
    if (T = 8) then
      FPreview.ZoomMode := pzmPageWidth
    else
    begin
      FPreview.ZoomMode := pzmPages;
      case T of
        9: FPreview.SetPageXYCount(1, 1);
        10: FPreview.SetPageXYCount(2, 1);
        11: FPreview.SetPageXYCount(2, 2);
      end;
    end;
    SetZoomFactor(FPreview.ZoomFactor);
  end
  else
    SetZoomFactor(FPreview.ZoomFactor);
  FModified := True;
  UpdateControlsState;
end;

procedure TfmZoom.PercentChange(Sender: TObject);
begin
  FModified := True;
  UpdateControlsState;
end;

procedure TfmZoom.PercentExit(Sender: TObject);
begin
  SetZoomFactor(TdxPSSpinEdit(Sender).AsInteger);
end;

procedure TfmZoom.ZoomKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Char(VK_RETURN)) then
  begin
    SetZoomFactor(TdxPSSpinEdit(Sender).AsInteger);
    UpdateControlsState;
  end;
end;

procedure TfmZoom.PercentButtonClick(Sender: TObject; ButtonType: TdxButtonType; Button: TUDBtnType);
var
  V: Integer;
begin
  BeginUpdate;
  try
    SetZoomFactor(TdxPSSpinEdit(Sender).AsInteger);
    V := TdxPSSpinEdit(Sender).AsInteger;
    if (V = 500) then
      rbtn500.Checked := True
    else if (V = 200) then
      rbtn200.Checked := True
    else if (V = 150) then
      rbtn150.Checked := True
    else if (V = 100) then
      rbtn100.Checked := True
    else if (V = 75) then
      rbtn75.Checked := True
    else if (V = 50) then
      rbtn50.Checked := True
    else if (V = 25) then
      rbtn25.Checked := True
    else if (V = 10) then
      rbtn10.Checked := True
    else
      UncheckAll;
  finally
    EndUpdate;
  end;
end;

procedure TfmZoom.UncheckAll;
var
  i: Integer;
begin
  for i := 0 to gbxZoomTo.ControlCount - 1 do
    if (gbxZoomTo.Controls[i] is TRadioButton) and 
      TRadioButton(gbxZoomTo.Controls[i]).Checked 
    then
    begin
      TRadioButton(gbxZoomTo.Controls[i]).Checked := False;
      Exit;
    end;
end;

procedure TfmZoom.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TfmZoom.EndUpdate;
begin
  Dec(FUpdateCount);
  if (FUpdateCount = 0) then
  begin
    FpnlFontPreview.Invalidate;
    FpnlPreview.Invalidate;
  end;
end;

procedure TfmZoom.btnManyPagesClick(Sender: TObject);
var
  AOrigin: TPoint;
  AYShift: Integer;
  AMaxColCount, AMaxRowCount: Integer;
  ARowCount, AColCount: Integer;
begin
  AOrigin := TButton(Sender).ClientOrigin;
  AYShift := TButton(Sender).Height;
  Inc(AOrigin.Y, AYShift);
  {
  AMaxColCount := Floor((FPreview.Width - 2 * FPreview.Indent) /
    (FPreview.Indent + MulDiv(FPreview.PageSize.X, FPreview.MinZoomFactor, 100)));
  AMaxRowCount := Floor((FPreview.Height - 2 * FPreview.Indent) /
    (FPreview.Indent + MulDiv(FPreview.PageSize.Y, FPreview.MinZoomFactor, 100)));
   } 
  AMaxColCount := FPreview.Width div MulDiv(FPreview.PageSize.X, FPreview.MinZoomFactor, 100);
  AMaxRowCount := FPreview.Height div MulDiv(FPreview.PageSize.Y, 2 * FPreview.MinZoomFactor, 100);
  if (AMaxColCount = 0) then AMaxColCount := 1;
  if (AMaxRowCount = 0) then AMaxRowCount := 1;
  if (AMaxColCount > 3) then
    AColCount := 3
  else
    AColCount := AMaxColCount;
  if (AMaxRowCount > 3) then
    ARowCount := 2
  else
    ARowCount := AMaxRowCount;
  if dxChooseMultiplePages(ilStub, 0, AOrigin, AYShift, AMaxColCount,
    AMaxRowCount, AColCount, ARowCount) then
  begin
    FPreview.ZoomMode := pzmPages;
    FPreview.SetPageXYCount(AColCount, ARowCount);
    if rbtnManyPages.Checked then
    begin
      SetZoomFactor(FPreview.ZoomFactor);
      FModified := True;
      UpdateControlsState;
    end
    else
      rbtnManyPages.Checked := True;
  end;
end;

procedure TfmZoom.PreviewPaint(Sender: TObject);
const
  ScreenRect: TRect = (Left: 12; Top: 10; Right: 170; Bottom: 93);
  Offset: TPoint = (X: 10; Y: 2);
var
  ADesktop, DestR, R, R2: TRect;
  i, AWidth, AHeight, W, H, V: Integer;
  DC: hDC;
  APrevRgn: HRGN;

  function MapRect(const ARect: TRect): TRect;
  begin
    Result := ScaleRect(ARect, DestR.Right - DestR.Left, FPreview.Width,
      DestR.Right - DestR.Left, FPreview.Width);
  end;

  procedure DrawBorder;
  var
    R2: TRect;
  begin
    R2 := R;
    FrameRect(DC, R2, GetSysColorBrush(COLOR_3DDKSHADOW));
    InflateRect(R2, -1, -1);
    FrameRect(DC, R2, GetSysColorBrush(COLOR_3DDKSHADOW));
    InflateRect(R2, -1, -1);
    FillRect(DC, R2, HBRUSH(COLOR_BTNSHADOW + 1));
  end;

  procedure DrawMonitor;
  var
    R2, R3: TRect;
    L: Integer;
    Pen: HPEN;
    Brush: HBRUSH;
  begin
{Monitor}
    R2 := R;
    R2.Bottom := MulDiv(R2.Bottom, 104, 122);
    DrawEdge(DC, R2, EDGE_RAISED, BF_RECT);
    InflateRect(R2, -11, -10);
    Dec(R2.Bottom);
    DrawEdge(DC, R2, BDR_SUNKENOUTER, BF_RECT or BF_MONO);
    Inc(R2.Bottom);
    InflateRect(R2, 11, 10);
{under screen side borders}
    L := R.Left + MulDiv(R.Right - R.Left, 35, R.Right - R.Left);
    FillRect(DC, Bounds(L + 1, R2.Bottom, 1, 4), HBRUSH(COLOR_3DDKSHADOW + 1));
    FillRect(DC, Bounds(R.Right - L - 1, R2.Bottom, 1, 4), HBRUSH(COLOR_3DDKSHADOW + 1));
    R2 := Classes.Rect(L, R2.Bottom, R.Right - L, MulDiv(R.Bottom, 108, 122));
{interior}
    R3 := R2;
    InflateRect(R2, -3, 0);
    Inc(R2.Left);
    Dec(R2.Bottom);
    FillRect(DC, Rect(R2.Left, R2.Top, R2.Right, R2.Top + 2), HBRUSH(COLOR_BTNSHADOW + 1));
    FillRect(DC, Bounds(R2.Right, R2.Top, 2, 4), HBRUSH(COLOR_BTNSHADOW + 1));
    FillRect(DC, Bounds(R2.Left - 2, R2.Bottom - 1, 2, 2), HBRUSH(COLOR_BTNHIGHLIGHT + 1));
    Dec(R2.Left);
    InflateRect(R2, -3, 0);
    OffsetRect(R2, 0, 6);
    Dec(R2.Bottom);
{side right}
    MoveToEx(DC, R3.Right - 1, R3.Bottom - 1, nil);
    LineTo(DC, R2.Right - 1, R2.Bottom + 1);
    Pen := SelectObject(DC, CreatePen(PS_SOLID, 0, GetSysColor(COLOR_BTNSHADOW)));
    MoveToEx(DC, R3.Right - 2, R3.Bottom - 1, nil);
    LineTo(DC, R2.Right - 2, R2.Bottom + 1);
    MoveToEx(DC, R3.Right - 2, R3.Bottom - 2, nil);
    LineTo(DC, R2.Right - 2, R2.Bottom);
    MoveToEx(DC, R3.Right - 2, R3.Bottom - 3, nil);
    LineTo(DC, R2.Right - 2, R2.Bottom - 1);
    DeleteObject(SelectObject(DC, Pen));
{side left}
    MoveToEx(DC, R3.Left + 1, R3.Bottom - 1, nil);
    LineTo(DC, R2.Left + 1, R2.Bottom + 1);
    Pen := SelectObject(DC, CreatePen(PS_SOLID, 0, GetSysColor(COLOR_BTNHIGHLIGHT)));
    MoveToEx(DC, R3.Left + 2, R3.Bottom - 1, nil);
    LineTo(DC, R2.Left + 2, R2.Bottom + 1);
    MoveToEx(DC, R3.Left + 2, R3.Bottom - 2, nil);
    LineTo(DC, R2.Left + 2, R2.Bottom);
    DeleteObject(SelectObject(DC, Pen));
    R3 := R2;
{button}
    R2 := Bounds(R2.Right - 19, R2.Top - 5, 10, 4);
    DrawEdge(DC, R2, BDR_RAISEDINNER, BF_LEFT or BF_RIGHT or BF_BOTTOM);
    FillRect(DC, Bounds(R2.Left, R2.Top, 10, 1), HBRUSH(COLOR_BTNFACE + 1));
{lamp}
    InflateRect(R2, -3, 0);
    OffsetRect(R2, -11, 0);
    DrawEdge(DC, R2, BDR_SUNKENOUTER, BF_RECT or BF_SOFT);
    InflateRect(R2, -1, -1);
    Brush := CreateSolidBrush(clLime);
    FillRect(DC, R2, Brush);
    DeleteObject(Brush);
    R2 := R3;

    FillRect(DC, R2, hBrush(COLOR_BTNSHADOW + 1));
    OffsetRect(R2, 0, 2);
    Dec(R2.Bottom);
    FillRect(DC, R2, hBrush(COLOR_3DDKSHADOW + 1));
    InflateRect(R2, -4, 0);
    Inc(R2.Top, 1);
    Inc(R2.Bottom, 4);
    DrawEdge(DC, R2, BDR_SUNKENOUTER, BF_FLAT or BF_MONO or BF_LEFT or BF_RIGHT);
    R3 := R2;
{Interior}
    InflateRect(R2, -1, -1);
    OffsetRect(R2, 0, -1);
    Inc(R2.Left, 2);
    FillRect(DC, R2, hBrush(COLOR_BTNSHADOW + 1));
    FillRect(DC, Bounds(R2.Right - 2, R2.Bottom, 2, 2), HBRUSH(COLOR_BTNSHADOW + 1));
    FillRect(DC, Bounds(R2.Left - 2, R2.Bottom, 2, 2), HBRUSH(COLOR_BTNHIGHLIGHT + 1));
{bottom}
    R2 := R3;
    InflateRect(R2, (R2.Left - R.Left) div 2, 0);
    OffsetRect(R2, 0, 4);
    Inc(R2.Bottom, 1);
    DrawButtonFace(TdxPSPaintPanel(Sender).Canvas, R2, 0, bsWin31, True, False, False);
    Inc(R2.Left);
    Inc(R2.Top);
    DrawEdge(DC, R2, EDGE_RAISED, BF_SOFT or BF_RECT);
    SetPixel(DC, R2.Right - 1, R2.Bottom - 1, GetSysColor(COLOR_BTNFACE));
  end;

begin
  if (FUpdateCount <> 0) then Exit;
  ADesktop := GetDesktopWorkArea;
  with TdxPSPaintPanel(Sender) do
  begin
    Windows.GetClientRect(Handle, R);
    DC := Canvas.Handle;
  end;
  FillRect(DC, R, HBRUSH(COLOR_BTNFACE + 1));
  DrawMonitor;
  AWidth := MulDiv(ScreenRect.Right - ScreenRect.Left - 2 * Offset.X,
    FPreviewOwnerSize.X, ADesktop.Right - ADesktop.Left);
  AHeight := MulDiv(ScreenRect.Bottom - ScreenRect.Top - 2 * Offset.Y,
    FPreviewOwnerSize.Y, ADesktop.Bottom - ADesktop.Top);

  with ScreenRect do
  begin
    W := Right - Left;
    H := Bottom - Top;
    if (AWidth / AHeight > W / H) then
    begin
      V := MulDiv(AHeight, W, AWidth);
      R := Bounds(Left, Top + (H - V) div 2, W, V);
    end
    else
    begin
      V := MulDiv(AWidth, H, AHeight);
      R := Bounds(Left + (W - V) div 2, Top, V, H);
    end;
  end;
  DestR := R;
  DrawBorder;

  InflateRect(R, -1, -1);
  Dec(R.Top);
  APrevRgn := CreateRectRgn(0, 0, 0, 0);
  if (GetClipRgn(DC, APrevRgn) <> 1) then 
  begin
    DeleteObject(APrevRgn);     
    APrevRgn := 0;
  end;  
  with R do
    IntersectClipRect(DC, Left, Top, Right, Bottom);
  FPreview.CalcPagesBounds(FPreview.TopPos, FPreview.VirtualWidth, FPreview.VirtualHeight);
  for i := 0 to FPreview.PageCount - 1 do
  begin
    R := MapRect(FPreview.Pages[i].Bounds);
    OffsetRect(R, 0, 4);
    if (R.Right - R.Left) < (DestR.Right - DestR.Left) then
      OffsetRect(R, 1, 0);
    OffsetRect(R, DestR.Left, DestR.Top);
    if IntersectRect(R2, R, DestR) then
      DrawEdge(DC, R, BDR_SUNKENOUTER, BF_RECT or BF_MIDDLE or BF_MONO);
  end;
  SelectClipRgn(DC, APrevRgn);
  if (APrevRgn <> 0) then DeleteObject(APrevRgn);
end;

procedure TfmZoom.FontPreviewPaint(Sender: TObject);
var
  R: TRect;
  DC: hDC;
  i: Integer;
  AHeight: Integer;
  APrevMode: Integer;
begin
  if (FUpdateCount <> 0) then Exit;
  with TdxPSPaintPanel(Sender) do
  begin
    Windows.GetClientRect(Handle, R);
    DC := Canvas.Handle;
    DrawEdge(DC, R, BDR_SUNKENOUTER, BF_RECT or BF_MIDDLE or BF_MONO);
    Canvas.Font.Size := Round(10 * FPreview.ZoomFactor / 100);
    Canvas.Font.Name := 'Times New Roman';
    AHeight := Canvas.TextHeight(sdxZoomDlgFontPreviewString);
  end;
  R := Rect(R.Left + 1, R.Top + 1, R.Right - 1, AHeight);
  APrevMode := SetBkMode(DC, TRANSPARENT);
  for i := 0 to 6 do
  begin
//    if (Canvas.Font.Size > 4) then 
    DrawText(DC, PChar(sdxZoomDlgFontPreviewString), Length(sdxZoomDlgFontPreviewString), 
      R, DT_SINGLELINE or DT_CENTER or DT_VCENTER);
//   else      
    OffsetRect(R, 0, AHeight);
  end;
  SetBkMode(DC, APrevMode);
end;

end.

