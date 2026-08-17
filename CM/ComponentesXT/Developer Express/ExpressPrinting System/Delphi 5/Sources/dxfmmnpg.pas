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

unit dxfmMnPg;

interface

{$I dxPSVer.inc}

uses
  Windows, Classes, Controls, {$IFDEF DELPHI4}ImgList, {$ENDIF}Graphics;

function dxChooseMultiplePages(AImageList: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF};
  AImageIndex: Integer; AOrigin: TPoint; AYShift: Integer; AMaxColCount, AMaxRowCount: Integer;
  var AColCount, ARowCount: Integer): Boolean;

implementation
uses
  Messages, SysUtils, Forms, CommCtrl, Math,
  dxPSRes, dxPSUtl;

const
  CellSize = 26;

type
  TdxGrowDirection = (gdTopLeft, gdTopRight, gdBottomRight, gdBottomLeft);

  TfmPageChooser = class(TCustomForm)
  private
    FColCount: Integer;
    FDesktop: TRect;
    FGrowDirection: TdxGrowDirection;
    FilCell: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF};
    FImageIndex: Integer;
    FLastMousePos: TPoint;
    FMaxColCount: Integer;
    FMaxRowCount: Integer;
    FMouseDownFlag: Boolean;
    FResult: TModalResult;
    FRowCount: Integer;
    FSelColCount: Integer;
    FSelRowCount: Integer;
    FTextPosIsBottom: Boolean;
    function GetBottomRect: TRect;
    function GetCellRect(ACol, ARow: Integer): TRect;
    function GetSelectedRect: TRect;
    function IsSelectedCell(ACol, ARow: Integer): Boolean;
    procedure SetColCount(Value: Integer);
    procedure SetRowCount(Value: Integer);
    procedure SetSelColCount(Value: Integer);
    procedure SetSelRowCount(Value: Integer);
    procedure SetSelCells(ACol, ARow: Integer);
    function CellHeight: Integer;
    function CellWidth: Integer;
    procedure DoSelectCells(X, Y: Integer);
    function GetBottomHeight: Integer;
    procedure ProcessKey(var Key: Word);    
    procedure ProcessSelect(AColCount, ARowCount: Integer; GrowFlag: Boolean);    
    
    procedure WMEraseBkgnd(var message: TWmEraseBkgnd); message WM_ERASEBKGND;
    procedure WMKillFocus(var message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMLButtonUp(var message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMNCCalcSize(var message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var message: TMessage); message WM_NCPAINT;
    procedure WMNCLButtonDown(var message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;

    property ColCount: Integer read FColCount write SetColCount;
    property MaxColCount: Integer read FMaxColCount;
    property MaxRowCount: Integer read FMaxRowCount;
    property RowCount: Integer read FRowCount write SetRowCount;
    property SelColCount: Integer read FSelColCount write SetSelColCount;
    property SelRowCount: Integer read FSelRowCount write SetSelRowCount;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
  public
    constructor CreateNew(AOwner: TComponent{$IFDEF DELPHI4}; 
      Dummy: Integer = 0{$ENDIF}); {$IFDEF DELPHI4}override; {$ENDIF}
  end;

  
function dxChooseMultiplePages(AImageList: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF};
  AImageIndex: Integer; AOrigin: TPoint; AYShift: Integer; AMaxColCount, AMaxRowCount: Integer;
  var AColCount, ARowCount: Integer): Boolean;
var
  AForm: TfmPageChooser;
begin
  AForm := TfmPageChooser.CreateNew(nil);
  try
    with AForm do
    begin
      FilCell := AImageList;
      FImageIndex := AImageIndex;
      FMaxColCount := AMaxColCount;
      FMaxRowCount := AMaxRowCount;
      Left := AOrigin.X;
      Top := AOrigin.Y;
      
      if (AOrigin.Y + AColCount * CellWidth + 4 {non client} + 2 {frame} > FDesktop.Bottom) then
        if (AOrigin.X + AColCount * CellWidth + 4 {non client} + 2 {frame} > FDesktop.Right) then
          FGrowDirection := gdTopLeft
        else
          FGrowDirection := gdTopRight
      else
        if (AOrigin.X + AColCount * CellWidth + 4 {non client} + 2 {frame} > FDesktop.Right) then
          FGrowDirection := gdBottomLeft
        else
          FGrowDirection := gdBottomRight;
          
      if (FGrowDirection in [gdTopLeft, gdBottomLeft]) then
        Left := FDesktop.Right - Width;
        
      if (FGrowDirection in [gdTopLeft, gdTopRight]) then
        Top := Top - Height - AYShift;
      FTextPosIsBottom := (FGrowDirection in [gdBottomRight, gdBottomLeft]);
      ColCount := AColCount;
      RowCount := ARowCount;

      Show;
      MouseCapture := True;
      try
        while (FResult = mrNone) do Application.ProcessMessages;
      finally
        MouseCapture := False;
      end;
      Result := (FResult = mrOK) and (SelColCount > 0) and (SelRowCount > 0);
      if Result then
      begin
        AColCount := SelColCount;
        ARowCount := SelRowCount;
      end;
    end
  finally
    AForm.Free;
  end;
end;


{ = ========================================================================== }
{ TfmPageChooser class realization                                             }
{ = ========================================================================== }

constructor TfmPageChooser.CreateNew(AOwner: TComponent{$IFDEF DELPHI4}; Dummy: Integer = 0{$ENDIF});
begin
  inherited CreateNew(AOwner{$IFDEF DELPHI4}, Dummy{$ENDIF});
  BorderStyle := bsNone;
  BorderIcons := [];
  FMouseDownFlag := False;
  FTextPosIsBottom := True;
  FDesktop := GetDeskTopWorkArea();
end;

procedure TfmPageChooser.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (ssAlt in Shift) or (Key = VK_ESCAPE) then
    FResult := mrCancel
  else 
    if (Key = VK_RETURN) then
      FResult := mrOk
    else 
      if (Key in [VK_LEFT, VK_UP, VK_RIGHT, VK_DOWN]) then 
        ProcessKey(Key);
end;

procedure TfmPageChooser.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WindowClass.Style := Params.WindowClass.Style or CS_SAVEBITS;
end;

procedure TfmPageChooser.WMLButtonUp(var message: TWMLButtonUp);
begin
  inherited;
  if (SelRowCount * SelColCount > 0) then
    FResult := mrOk
  else
    FResult := mrCancel;
end;

procedure TfmPageChooser.WMNCLButtonDown(var message: TWMNCLButtonDown);
begin
  inherited;
  FResult := mrCancel;
end;

procedure TfmPageChooser.WMKillFocus(var message: TWMKillFocus);
begin
  inherited;
  FResult := mrCancel;
end;

procedure TfmPageChooser.WMNCCalcSize(var message: TWMNCCalcSize);
begin
  InflateRect(TWMNCCalcSize(message).CalcSize_Params^.rgrc[0], -2, -2);
end;

procedure TfmPageChooser.WMNCPaint(var message: TMessage);
var
  R: TRect;
  DC: hDC;
begin
  GetWindowRect(Handle, R);
  OffsetRect(R, -R.Left, -R.Top);
  DC := GetWindowDC(Handle);
  try
    DrawEdge(DC, R, EDGE_RAISED, BF_ADJUST or BF_RECT);
  finally
    ReleaseDC(Handle, DC);
  end;
  inherited;
end;

procedure TfmPageChooser.WMEraseBkgnd(var message: TWmEraseBkgnd);
begin
  message.Result := 1;
end;

procedure TfmPageChooser.Paint;
var
  DC: hDC;
  R: TRect;
  i, j: Integer;

  procedure DrawCell(ACol, ARow: Integer);
  const
    AFillColor: array[Boolean] of COLORREF = (COLOR_WINDOW, COLOR_HIGHLIGHT);
  begin
    R := GetCellRect(ACol, ARow);
    if RectVisible(DC, R) then
    begin
      FrameRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
      InflateRect(R, -1, -1);
      FrameRect(DC, R, GetSysColorBrush(COLOR_BTNSHADOW));
      InflateRect(R, -1, -1);
      FillRect(DC, R, HBRUSH(AFillColor[IsSelectedCell(ACol, ARow)] + 1));
      InflateRect(R, -3, -3);
      if Assigned(FilCell) and (FImageIndex > -1) and (FImageIndex < FilCell.Count) then
        ImageList_DrawEx(FilCell.Handle, FImageIndex, DC, R.Left, R.Top, 0, 0, CLR_NONE, CLR_NONE, ILD_TRANSPARENT);
    end;
  end;

  procedure DrawBottom;
  var
    S: string;
    APrevMode: Integer;
  begin
    R := GetBottomRect();
    if RectVisible(DC, R) then
    begin
      if FTextPosIsBottom then
      begin
        FillRect(DC, Rect(R.Left, R.Top, R.Right, R.Top + 1), hBrush(COLOR_BTNFACE + 1));
        Inc(R.Top);
      end
      else
      begin
        Dec(R.Bottom);
        FillRect(DC, Rect(R.Left, R.Bottom, R.Right, R.Bottom + 1), hBrush(COLOR_BTNFACE + 1));
      end;
      FrameRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
      InflateRect(R, -1, -1);
      DrawEdge(DC, R, BDR_SUNKENOUTER, BF_RECT or BF_MIDDLE);
      InflateRect(R, -1, -1);
      if (FSelRowCount > 0) and (FSelColCount > 0) then
        S := Format('%d x %d %s', [FSelRowCount, FSelColCount, sdxPages])
      else
        S := sdxCancel;
      APrevMode := SetBkMode(DC, TRANSPARENT);
      DrawText(DC, PChar(S), Length(S), R, DT_SINGLELINE or DT_CENTER or DT_VCENTER);
      SetBkMode(DC, APrevMode);
    end;
  end;

begin
  DC := Canvas.Handle;
  Windows.GetClientRect(Handle, R);
  FrameRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
  for i := 0 to ColCount - 1 do
    for j := 0 to RowCount - 1 do
      DrawCell(i, j);
  DrawBottom;
end;

procedure TfmPageChooser.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if PtInRect(ClientRect, Point(X, Y)) then
    FMouseDownFlag := True
  else
    FResult := mrCancel;
end;
                           
procedure TfmPageChooser.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if (FLastMousePos.X <> X) or (FLastMousePos.Y <> Y) then 
  begin 
    DoSelectCells(X, Y);
    FLastMousePos := Point(X, Y);
  end;  
end;

procedure TfmPageChooser.DoSelectCells(X, Y: Integer);
var
  AColCount, ARowCount: Integer;
begin
  if (FGrowDirection in [gdTopLeft, gdBottomLeft]) then
    AColCount := Ceil((Width - X - 2 {frame} - 4 {non client}) / CellWidth)
  else
    AColCount := Ceil(X / CellWidth);

  if FTextPosIsBottom then
    ARowCount := Ceil(Y / CellHeight)
  else
    ARowCount := Ceil((Height - Y - 2 {frame} - 4 {non client}) / CellHeight);

  if (FGrowDirection in [gdTopRight, gdBottomRight]) and
    (Left + (AColCount * CellWidth + 2 {frame}) + 4 {non client} > FDesktop.Right)
    then Dec(AColCount);
  if (FGrowDirection in [gdTopLeft, gdTopRight]) and
    (Top + (ARowCount * CellHeight + GetBottomHeight() + 2 {frame}) + 4 {non client} > FDesktop.Bottom)
    then Dec(ARowCount);
  ProcessSelect(AColCount, ARowCount, FMouseDownFlag);  
end;

procedure TfmPageChooser.ProcessSelect(AColCount, ARowCount: Integer; GrowFlag: Boolean);
begin
  if GrowFlag then
  begin
    if (SelRowCount <> 0) and (SelColCount <> 0) then
    begin
      RowCount := ARowCount;
      ColCount := AColCount;
    end
  end
  else
  begin
    if (AColCount > ColCount) then AColCount := 0;
    if (ARowCount > RowCount) then ARowCount := 0;
  end;
  if (AColCount < 0) then
    AColCount := 0
  else if (AColCount > ColCount) then
    AColCount := ColCount;
  if (ARowCount < 0) then
    ARowCount := 0
  else if (ARowCount > RowCount) then
    ARowCount := RowCount;
  SetSelCells(AColCount, ARowCount);
end;

procedure TfmPageChooser.ProcessKey(var Key: Word);
var
  AColCount, ARowCount: Integer;
begin
  AColCount := 0;
  ARowCount := 0;
  case Key of 
    VK_LEFT:
      if (FGrowDirection in [gdTopLeft, gdBottomLeft]) then 
      begin
        AColCount := SelColCount + 1;
        ARowCount := SelRowCount;
        if (ARowCount = 0) then ARowCount := 1;
      end
      else
      begin
        AColCount := SelColCount - 1;
        if (AColCount < 1) then AColCount := 1;            
        ARowCount := SelRowCount;
      end;
    VK_UP:
      if (FGrowDirection in [gdTopRight, gdTopLeft]) then 
      begin
        ARowCount := SelRowCount + 1;
        AColCount := SelColCount;
        if (AColCount = 0) then AColCount := 1;
      end
      else
      begin
        ARowCount := SelRowCount - 1;
        if (ARowCount < 1) then ARowCount := 1;
        AColCount := SelColCount;
      end;  
    VK_RIGHT:
      if (FGrowDirection in [gdTopLeft, gdBottomLeft]) then 
      begin
        AColCount := SelColCount - 1;
        if (AColCount < 1) then AColCount := 1;            
        ARowCount := SelRowCount;
      end
      else
      begin
        AColCount := SelColCount + 1;
        ARowCount := SelRowCount;
        if (ARowCount = 0) then ARowCount := 1;
      end;
    VK_DOWN:
      if (FGrowDirection in [gdTopRight, gdTopLeft]) then 
      begin
        ARowCount := SelRowCount - 1;
        if (ARowCount < 1) then ARowCount := 1;
        AColCount := SelColCount;
      end
      else
      begin
        ARowCount := SelRowCount + 1;
        AColCount := SelColCount;
        if (AColCount = 0) then AColCount := 1;
      end;
  end;
  ProcessSelect(AColCount, ARowCount, True);
  Key := 0;
end;

function TfmPageChooser.CellHeight: Integer;
begin
  if Assigned(FilCell) then
    Result := MulDiv(FilCell.Height, 3, 2) + 2
  else
    Result := CellSize;
end;

function TfmPageChooser.CellWidth: Integer;
begin
  if Assigned(FilCell) then
    Result := MulDiv(FilCell.Width, 3, 2) + 2
  else
    Result := CellSize;
end;

function TfmPageChooser.GetBottomHeight: Integer;
begin
  Result := MulDiv(-Font.Height, PixelsPerInch, 72) + 6;
end;

function TfmPageChooser.IsSelectedCell(ACol, ARow: Integer): Boolean;
begin
  Result := (ACol < SelColCount) and (ARow < SelRowCount);
end;

function TfmPageChooser.GetCellRect(ACol, ARow: Integer): TRect;
var
  CR: TRect;
  ATop, ALeft: Integer;
begin
  Windows.GetClientRect(Handle, CR);
  case FGrowDirection of
    gdTopLeft:
      begin
        ALeft := CR.Right - (ACol + 1) * CellWidth - 1;
        ATop := CR.Bottom - (ARow + 1) * CellHeight - 1;
        if FTextPosIsBottom then Dec(ATop, GetBottomHeight());
      end;

    gdTopRight:
      begin
        ALeft := 1 + ACol * CellWidth;
        ATop := CR.Bottom - (ARow + 1) * CellHeight - 1;
        if FTextPosIsBottom then Dec(ATop, GetBottomHeight());
      end;

    gdBottomRight:
      begin
        ALeft := 1 + ACol * CellWidth;
        ATop := 1 + ARow * CellHeight;
        if not FTextPosIsBottom then Inc(ATop, GetBottomHeight());
      end;

  else {gdBottomLeft}
    begin
      ALeft := CR.Right - (ACol + 1) * CellWidth - 1;
      ATop := 1 + ARow * CellHeight;
      if not FTextPosIsBottom then Inc(ATop, GetBottomHeight());
    end;
  end;
  Result := Bounds(ALeft, ATop, CellWidth, CellHeight);
end;

function TfmPageChooser.GetBottomRect: TRect;
var
  R: TRect;
begin
  Windows.GetClientRect(Handle, R);
  if FTextPosIsBottom then
    Result := Rect(R.Left + 1, R.Top + RowCount * CellWidth + 1, R.Right - 1, R.Bottom - 1)
  else
    Result := Rect(R.Left + 1, R.Top + 1, R.Right - 1, R.Top + GetBottomHeight() + 1);
end;

procedure TfmPageChooser.SetColCount(Value: Integer);
var
  AWidth: Integer;
begin
  if (FColCount = 0) or ((Value > FColCount) and (Value <= MaxColCount)) then
  begin
    FColCount := Value;
    AWidth := Value * CellWidth + 2 {frame};
    if (FGrowDirection in [gdTopLeft, gdBottomLeft]) then
    begin
      Inc(AWidth, 4 {non client});
      SetBounds(Left - (AWidth - Width), Top, AWidth, Height);
      Inc(FLastMousePos.X, CellWidth);
    end
    else
      ClientWidth := AWidth;
    SelColCount := FColCount - 1;
    UpdateWindow(Handle);
  end;
end;

procedure TfmPageChooser.SetRowCount(Value: Integer);
var
  AHeight: Integer;
  R1, R2: TRect;
begin
  if (FRowCount = 0) or ((Value > FRowCount) and (Value <= MaxRowCount)) then
  begin
    FRowCount := Value;
    AHeight := Value * CellHeight + GetBottomHeight() + 2;
    if (FGrowDirection in [gdTopLeft, gdTopRight]) then
    begin
      Inc(AHeight, 4 {not client});
      SetBounds(Left, Top - (AHeight - Height), Width, AHeight);
      Inc(FLastMousePos.Y, CellWidth);
    end
    else
      ClientHeight := AHeight;

    if (SelColCount < ColCount) then
    begin
      R1 := GetCellRect(SelColCount - 1, SelRowCount - 1);
      if not (FGrowDirection in [gdTopLeft, gdBottomLeft]) then
        OffsetRect(R1, CellWidth, CellHeight);
      R2 := GetCellRect(ColCount - 1, RowCount - 1);
      if not (FGrowDirection in [gdTopLeft, gdBottomLeft]) then
        OffsetRect(R2, CellWidth, CellHeight);
      UnionRect(R1, R1, R2);
      InvalidateRect(Handle, @R1, False);
    end;
    SelRowCount := FRowCount - 1;
  end;
end;

procedure TfmPageChooser.SetSelColCount(Value: Integer);
begin
  SetSelCells(Value, SelRowCount);
end;

procedure TfmPageChooser.SetSelRowCount(Value: Integer);
begin
  SetSelCells(SelColCount, Value);
end;

function TfmPageChooser.GetSelectedRect: TRect;
var
  ALeft, ATop, ARight, ABottom: Integer;
begin
  Result := Rect(0, 0, 0, 0);
  if (SelColCount > 0) or (SelRowCount > 0) then
  begin
    case FGrowDirection of
      gdTopLeft:
        begin
          with GetCellRect(SelColCount - 1, SelRowCount - 1) do
          begin
            ALeft := Left;
            ATop := Top;
          end;
          with GetCellRect(0, 0) do
          begin
            ARight := Right;
            ABottom := Bottom;
          end;
        end;

      gdTopRight:
        begin
          with GetCellRect(0, 0) do
          begin
            ALeft := Left;
            ABottom := Bottom;
          end;
          with GetCellRect(SelColCount - 1, SelRowCount - 1) do
          begin
            ARight := Right;
            ATop := Top;
          end;
        end;

      gdBottomRight:
        begin
          with GetCellRect(0, 0) do
          begin
            ALeft := Left;
            ATop := Top;
          end;
          with GetCellRect(SelColCount - 1, SelRowCount - 1) do
          begin
            ARight := Right;
            ABottom := Bottom;
          end;
        end;

    else {gdBottomLeft}
      begin
        with GetCellRect(SelColCount - 1, SelRowCount - 1) do
        begin
          ALeft := Left;
          ABottom := Bottom;
        end;
        with GetCellRect(0, 0) do
        begin
          ARight := Right;
          ATop := Top;
        end;
      end;
    end;
    Result := Rect(ALeft, ATop, ARight, ABottom);
  end;
end;

procedure TfmPageChooser.SetSelCells(ACol, ARow: Integer);
var
  Rgn1, Rgn2: HRGN;
begin
  Rgn1 := CreateRectRgnIndirect(GetSelectedRect);
  Rgn2 := CreateRectRgnIndirect(GetBottomRect);
  CombineRgn(Rgn1, Rgn1, Rgn2, RGN_OR);
  DeleteObject(Rgn2);  
  FSelColCount := ACol;
  FSelRowCount := ARow;
  Rgn2 := CreateRectRgnIndirect(GetSelectedRect);
  CombineRgn(Rgn1, Rgn1, Rgn2, RGN_XOR);
  DeleteObject(Rgn2);
  InvalidateRgn(Handle, Rgn1, False);
  Rgn2 := CreateRectRgnIndirect(GetBottomRect);
  CombineRgn(Rgn1, Rgn1, Rgn2, RGN_OR);
  DeleteObject(Rgn2);
  InvalidateRgn(Handle, Rgn1, False);
  DeleteObject(Rgn1);
end;

end.

