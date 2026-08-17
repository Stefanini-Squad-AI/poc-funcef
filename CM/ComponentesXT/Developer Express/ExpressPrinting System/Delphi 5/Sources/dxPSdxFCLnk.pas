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

unit dxPSdxFCLnk;

interface

{$I dxPSVer.inc}

uses
  Classes, Windows, Graphics, Controls, Forms, StdCtrls, ComCtrls, ExtCtrls,
  dxFlChrt, dxPSCore {$IFDEF DELPHI4}, ImgList{$ENDIF};

type
  TdxFlowChartReportLink = class(TBasedxReportLink)
  private
    FBorderColor: TColor;
    FDrawBorder: Boolean;
    FTransparentColor: TColor;
    FUseMetafile: Boolean;
    
    function GetFlowChart: TdxFlowChart;
    procedure SetBorderColor(Value: TColor);
    procedure SetDrawBorder(Value: Boolean);
    procedure SetTransparentColor(Value: TColor);
    
    procedure FlowChartUsefulRect(var R: TRect);
  protected
    procedure ConstructReport(AReportCells: TdxReportCells); override;
    procedure InternalRestoreDefaults; override;
    procedure InternalRestoreFromOriginal; override;    
  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source: TPersistent); override;

    property FlowChart: TdxFlowChart read GetFlowChart;
  published
    property BorderColor: TColor read FBorderColor write SetBorderColor
      default clBlack;
    property Color;
    property DrawBorder: Boolean read FDrawBorder write SetDrawBorder
      default False;
    property Transparent;
    property TransparentColor: TColor read FTransparentColor write SetTransparentColor
      default clWindow;
    property UseMetafile: Boolean read FUseMetafile write FUseMetafile
      default True;
  end;

  TdxFCReportLinkDesignWindow = class(TAbstractdxReportLinkDesignWindow)
    PageControl1: TPageControl;
    tshOptions: TTabSheet;
    pnlOptions: TPanel;
    gbxTransparent: TGroupBox;
    lblColor: TLabel;
    bvlColorHolder: TBevel;
    chbxTransparent: TCheckBox;
    gbxBorder: TGroupBox;
    lblGridLinesColor: TLabel;
    bvlLineColorHolder: TBevel;
    chbxDrawBorder: TCheckBox;
    pnlPreview: TPanel;
    lblPreview: TStaticText;
    Panel10: TPanel;
    ilFlowChart: TImageList;
    procedure lblColorClick(Sender: TObject);
    procedure chbxDrawBorderClick(Sender: TObject);
    procedure chbxTransparentClick(Sender: TObject);
  private
    procedure ccbxColorChange(Sender: TObject);
    procedure CreateControls;
    function GetFlowChartReportLink: TdxFlowChartReportLink;
    procedure pbxPreviewPaint(Sender: TObject);
  protected
    procedure DoInitialize; override;
    procedure LoadStrings; override;
    procedure PaintPreview(ACanvas: TCanvas; R: TRect); override;
    procedure UpdatePreview; override;
    procedure UpdateControlsState; override;
  public
    ccbxColor: TCustomComboBox;
    ccbxGridLineColor: TCustomComboBox;
    FPreviewBox: TCustomControl;
    
    constructor Create(AOwner: TComponent); override;
    property FlowChartReportLink: TdxFlowChartReportLink read GetFlowChartReportLink;
  end;

implementation

{$R *.DFM}

uses
  SysUtils, dxPSUtl, dxExtCtrls, dxPSRes, dxPSGlbl;

const
  sdxStrings: array[0..4] of string =
    (sdxPlan, sdxSwimmingPool, sdxAdministration, sdxPark, sdxCarParking);
  
{ TdxFlowChartReportLink }

constructor TdxFlowChartReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBorderColor := dxDefaultGridLineColor;
  FDrawBorder := False;
  FTransparentColor := clWindow;
  FUseMetafile := True;
end;

procedure TdxFlowChartReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxFlowChartReportLink) then
  begin
    BorderColor := TdxFlowChartReportLink(Source).BorderColor;
    DrawBorder := TdxFlowChartReportLink(Source).DrawBorder;
    TransparentColor := TdxFlowChartReportLink(Source).TransparentColor;
    UseMetafile := TdxFlowChartReportLink(Source).UseMetafile;
  end;
end;

procedure TdxFlowChartReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  BorderColor := dxDefaultGridLineColor;
  DrawBorder := False;
end;

procedure TdxFlowChartReportLink.InternalRestoreFromOriginal;
begin
  inherited InternalRestoreFromOriginal;
  if (FlowChart <> nil) then TransparentColor := FlowChart.Color;
end;

procedure TdxFlowChartReportLink.SetTransparentColor(Value: TColor);
begin
  if (FTransparentColor <> Value) then 
  begin
    FTransparentColor := Value;
    LinkModified(True);
  end;
end;

procedure TdxFlowChartReportLink.SetBorderColor(Value: TColor);
begin
  if (FBorderColor <> Value) then
  begin
    FBorderColor := Value;
    LinkModified(True);
  end;
end;

procedure TdxFlowChartReportLink.SetDrawBorder(Value: Boolean);
begin
  if (FDrawBorder <> Value) then
  begin
    FDrawBorder := Value;
    LinkModified(True);
  end;
end;

function TdxFlowChartReportLink.GetFlowChart: TdxFlowChart;
begin
  Result := TdxFlowChart(Component);
end;

type
  TdxFlowChartAccess = class(TdxFlowChart);
  TdxFcConnectionAccess = class(TdxFcConnection);

procedure TdxFlowChartReportLink.FlowChartUsefulRect(var R: TRect);
var
  C: Integer;
  R2: TRect;

  procedure SwapInt(var V1, V2: Integer);
  asm
    MOV ECX, [EAX]
    XCHG ECX, [EDX]
    MOV [EAX], ECX
  end;

  procedure AddRect(const R2: TRect);
  begin
    if not IsRectEmpty(R2) then
    begin
      if (C = 0) then
        R := R2
      else
        UnionRect(R, R, R2);
      Inc(C);
    end;
  end;

  procedure Iterate(AObject: TdxFcObject);
  var
    CC, I, J: Integer;
    List: TList;
    P: TPoint;
    Rgn: HRGN;
    R2: TRect;
  begin
    if not AObject.Visible then Exit;
    with AObject do
      R2 := Bounds(RealLeft - Owner.LeftEdge, RealTop - Owner.TopEdge, RealWidth, RealHeight);
    AddRect(R2);

    if AObject.ConnectionCount > 0 then
    begin
      List := TList.Create;
      try
        for I := 0 to AObject.ConnectionCount - 1 do
        begin
          List.Clear;
          CC := AObject.Connections[I].PointCount;
          if AObject.Connections[I].ObjectSource <> nil then Inc(CC);
          if AObject.Connections[I].ObjectDest <> nil then Inc(CC);
          for J := 0 to CC - 1 do
          begin
            P := TdxFcConnectionAccess(AObject.Connections[I]).RealPoints[J];
            List.Add(Pointer(P.X));
            List.Add(Pointer(P.Y));
          end;
          if List.Count = 4 {two points} then
          begin
            R2 := PRect(List.List)^;
            if (R2.Right < R2.Left) then SwapInt(R2.Right, R2.Left);
            if (R2.Bottom < R2.Top) then SwapInt(R2.Bottom, R2.Top);
            AddRect(R2);
          end
          else 
            if List.Count > 4 {> two points} then
            begin
              Rgn := CreatePolygonRgn(List.List^, List.Count div 2, WINDING);
              GetRgnBox(Rgn, R2);
              Windows.DeleteObject(Rgn);
              AddRect(R2);
            end;
        end;
      finally
        List.Free;
      end;
    end;
    for I := 0 to AObject.ObjectCount - 1 do
      Iterate(AObject.Objects[I]);
  end;

var
  CC, I, J: Integer;
  List: TList;
  P: TPoint;
  Rgn: hRgn;
begin
  C := 0;
  with FlowChart do
  begin
    for I := 0 to FlowChart.ObjectCount - 1 do
      Iterate(FlowChart.Objects[I]);

    if ConnectionCount > 0 then
    begin
      List := TList.Create;
      try
        for I := 0 to ConnectionCount - 1 do
        begin
          List.Clear;
          CC := Connections[I].PointCount;
          if Connections[I].ObjectSource <> nil then Inc(CC);
          if Connections[I].ObjectDest <> nil then Inc(CC);
          for J := 0 to CC - 1 do
          begin
            P := TdxFcConnectionAccess(Connections[I]).RealPoints[J];
            List.Add(Pointer(P.X));
            List.Add(Pointer(P.Y));
          end;
          if List.Count = 4 {two points} then
          begin
            R2 := PRect(List.List)^;
            if (R2.Right < R2.Left) then SwapInt(R2.Right, R2.Left);
            if (R2.Bottom < R2.Top) then SwapInt(R2.Bottom, R2.Top);
            AddRect(R2);
          end
          else 
            if List.Count > 4 {> two points} then
            begin
              Rgn := CreatePolygonRgn(List.List^, List.Count div 2, WINDING);
              GetRgnBox(Rgn, R2);
              Windows.DeleteObject(Rgn);
              AddRect(R2);
            end;
        end;
      finally
        List.Free;
      end;
    end;
  end;
  if C = 0 then R := Rect(0, 0, 0, 0);
end;

procedure TdxFlowChartReportLink.ConstructReport(AReportCells: TdxReportCells);
const
  cH: Integer = 10;
  cV: Integer = 10;
  GraphicClasses: array[Boolean] of TGraphicClass = (TBitmap, TMetafile);
  Borders: array[Boolean] of TdxCellSides = ([], csAll);
var
  G: TGraphic;
  ACanvas: TCanvas;
  DC: HDC;
  Br: HBRUSH;
  R: TRect;
  Data: TdxReportCellGraphic;
  Cell: TdxReportCell;
  SaveSelected: TdxFcObject;
  SaveTopEdge: Integer;
  OffsetX, OffsetY: Integer;
begin
  if FlowChart = nil then Exit;
  inherited ConstructReport(AReportCells);
  if FlowChart.ObjectCount = 0 then 
    Exit;
   
  AReportCells.Cells.Color := Color;
  AReportCells.Cells.CellSides := [];
  AReportCells.BorderColor := BorderColor;
  Cell := TdxReportCell.Create(AReportCells.Cells);
  Cell.CellSides := []; 
  Data := TdxReportCellGraphic.Create(Cell);
  with Data do
  begin
    Transparent := Self.Transparent;
    CellSides := Borders[DrawBorder];
    ImageTransparent := True;
  end;
  SaveSelected := FlowChart.SelectedObject;
  FlowChart.SelectedObject := nil;
  SaveTopEdge := FlowChart.TopEdge;  
  FlowChart.TopEdge := 0;
  FlowChartUsefulRect(R);
  InflateRect(R, cH, cV);
  G := Data.CreateImage(GraphicClasses[UseMetafile]);
  G.Width := R.Right - R.Left;
  G.Height := R.Bottom - R.Top;
  if UseMetafile then
    ACanvas := TMetafileCanvas.Create(TMetafile(G), 0)
  else
    ACanvas := TBitmap(G).Canvas;
    
  try
    OffsetX := Max(R.Left, -cH);
    OffsetY := Max(R.Top, -cV);
    DC := ACanvas.Handle;
    if not UseMetafile and Transparent then 
    begin
      Br := CreateSolidBrush(ColorToRGB(TransparentColor));
      FillRect(DC, Rect(0, 0, G.Width, G.Height), Br);
      DeleteObject(Br);
    end;  
    MoveWindowOrg(DC, -OffsetX, -OffsetY);
    FlowChart.ControlState := FlowChart.ControlState + [csPaintCopy];
    try
      TdxFlowChartAccess(FlowChart).PaintWindow(DC);
    finally
      FlowChart.ControlState := FlowChart.ControlState - [csPaintCopy];
    end;  
    MoveWindowOrg(DC, OffsetX, OffsetY);
    if not UseMetafile and Transparent then 
      TBitmap(G).TransparentColor := TransparentColor;
  finally
    if UseMetafile then ACanvas.Free;
  end;
  FlowChart.SelectedObject := SaveSelected;
  FlowChart.TopEdge := SaveTopEdge;
  
  Data.BoundsRect := Rect(0, 0, G.Width, G.Height);
  Cell.BoundsRect := Data.BoundsRect;
  AReportCells.Cells.BoundsRect := Cell.BoundsRect;
  AReportCells.DoProgress(100);
end;


{ TdxFCReportLinkDesignWindow }

constructor TdxFCReportLinkDesignWindow.Create(AOwner: TComponent);
begin
  HelpContext := dxhcFlowChartReportLinkDesigner;
  inherited Create(AOwner);
  CreateControls;
  PageControl1.ActivePage := PageControl1.Pages[0];
end;
  
procedure TdxFCReportLinkDesignWindow.CreateControls;
var
  R: TRect;
begin
  ccbxColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(ccbxColor) do
  begin
    BoundsRect := bvlColorHolder.BoundsRect;
    Tag := 0;
    Parent := gbxTransparent;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultColor;
//    DropDownCount := Items.Count;
    OnChange := ccbxColorChange;
  end;
  lblColor.FocusControl := ccbxColor;

  ccbxGridLineColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(ccbxGridLineColor) do
  begin
    BoundsRect := bvlLineColorHolder.BoundsRect;
    Tag := 1;
    Parent := gbxBorder;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultGridLineColor;
//    DropDownCount := Items.Count;
    OnChange := ccbxColorChange;
  end;
  lblGridLinesColor.FocusControl := ccbxGridLineColor;
  FPreviewBox := TdxPSPaintPanel.Create(Self);
  with TdxPSPaintPanel(FPreviewBox) do
  begin
    Parent := pnlPreview;
    R := pnlPreview.BoundsRect;
    OffsetRect(R, -R.Left, -R.Top);
    InflateRect(R, -1, -1);
    BoundsRect := R;
    EdgeInner := esNone;
    EdgeOuter := esNone;
    OnPaint := pbxPreviewPaint;
  end;
end;

procedure TdxFCReportLinkDesignWindow.LoadStrings;
begin
  inherited LoadStrings;
  tshOptions.Caption := sdxOptions;
  
  chbxDrawBorder.Caption := sdxBorderLines;
  chbxTransparent.Caption := sdxTransparent;
  lblColor.Caption := sdxColor;
  lblGridLinesColor.Caption := sdxGridLinesColor;
  lblPreview.Caption := DropAmpersand(sdxPreview);
end;

procedure TdxFCReportLinkDesignWindow.DoInitialize;
begin
  inherited DoInitialize;
  chbxDrawBorder.Checked := FlowChartReportLink.DrawBorder;
  chbxTransparent.Checked := FlowChartReportLink.Transparent;
  TdxPSColorCombo(ccbxColor).ColorValue := ColorToRGB(FlowChartReportLink.Color);
  TdxPSColorCombo(ccbxGridLineColor).ColorValue := ColorToRGB(FlowChartReportLink.BorderColor);
end;

procedure TdxFCReportLinkDesignWindow.UpdateControlsState;
begin
  inherited UpdateControlsState;
  
  ccbxColor.Enabled := not chbxTransparent.Checked;
  lblColor.Enabled := not chbxTransparent.Checked;
  ccbxGridLineColor.Enabled := chbxDrawBorder.Checked;
  lblGridLinesColor.Enabled := chbxDrawBorder.Checked;
end;

procedure TdxFCReportLinkDesignWindow.pbxPreviewPaint(Sender: TObject);
begin
  with TdxPSPaintPanel(Sender) do
    PaintPreview(Canvas, ClientRect);
end;

procedure TdxFCReportLinkDesignWindow.PaintPreview(ACanvas: TCanvas; R: TRect);
const
  uFormat: UINT = DT_CENTER or DT_VCENTER or DT_SINGLELINE;
var
  R2: TRect;
  DC: hDC;
  ABrush: hBrush;
  AFont: hFont;
  AFontStyle: TFontStyles;
  W, H: Integer;
  S: string;
begin
  DC := ACanvas.Handle;
  FillRect(DC, R, hBrush(COLOR_WINDOW + 1));
  OffsetRect(R, -R.Left, -R.Top);
  InflateRect(R, -4, -4);
  {border}
  if FlowChartReportLink.DrawBorder then
  begin
    InflateRect(R, 1, 1);
    ABrush := CreateSolidBrush(ColorToRGB(FlowChartReportLink.BorderColor));
    FrameRect(DC, R, ABrush);
    DeleteObject(ABrush);
    InflateRect(R, -1, -1);    
  end;  
  {interior}
  if not FlowChartReportLink.Transparent then
  begin
    ABrush := CreateSolidBrush(ColorToRGB(FlowChartReportLink.Color));
    FillRect(DC, R, ABrush);
    DeleteObject(ABrush);
  end;
  {charts}
  W := R.Right - R.Left;
  H := R.Bottom - R.Top;
  {plan}
  SetBkMode(DC, TRANSPARENT);
  S := sdxStrings[0];
  R2 := Bounds(R.Left + 2, 4, R.Right, 12);
  AFontStyle := Canvas.Font.Style;
  Canvas.Font.Style := [fsBold];
  AFont := SelectObject(DC, Canvas.Font.Handle);
  DrawText(DC, PChar(S), Length(S), R2, uFormat);
  SelectObject(DC, AFont);
  Canvas.Font.Style := AFontStyle;
  R2 := Rect(R.Left + 30, R2.Bottom + 2, R.Right - 30, R2.Bottom + 3);
  FillRect(DC, R2, hBrush(COLOR_WINDOWTEXT + 1));
  {swimming-pool}           
  R2 := Bounds(R.Left + 2, 27, R.Left + W div 2 - 22, H div 4);
  RoundRect(DC, R2.Left, R2.Top, R2.Right, R2.Bottom, 10, 10);
  S := sdxStrings[1];
  DrawText(DC, PChar(S), Length(S), R2, uFormat);
  {administration}    
  OffsetRect(R2, R2.Right - R2.Left + 30, 0);
  Rectangle(DC, R2.Left, R2.Top, R2.Right, R2.Bottom);
  S := sdxStrings[2];
  DrawText(DC, PChar(S), Length(S), R2, uFormat);  
  {park}      
  OffsetRect(R2, 0, R2.Bottom - R2.Top + 30);
  Inc(R2.Bottom, R2.Bottom - R2.Top);
  Ellipse(DC, R2.Left, R2.Top, R2.Right, R2.Bottom);
  ilFlowChart.Draw(ACanvas, R2.Left + (R2.Right - R2.Left) div 2 - ilFlowChart.Width div 2, R2.Top + 10, 0);  
  ilFlowChart.Draw(ACanvas, R2.Left + (R2.Right - R2.Left) div 2 - 2 * ilFlowChart.Width, R2.Top + ilFlowChart.Height + 20, 0);  
  ilFlowChart.Draw(ACanvas, R2.Left + (R2.Right - R2.Left) div 2 + ilFlowChart.Width, R2.Top + ilFlowChart.Height + 20, 0);  
  S := sdxStrings[3];  
  DrawText(DC, PChar(S), Length(S), R2, uFormat);  
  {car-parking}
  OffsetRect(R2, -R2.Right + R2.Left - 30, 0);
  Rectangle(DC, R2.Left, R2.Top, R2.Right, R2.Bottom);
  S := sdxStrings[4];
  DrawText(DC, PChar(S), Length(S), R2, uFormat);  
  {crosses}
  SetBkMode(DC, OPAQUE);  
  R2 := Rect(R.Left + W div 2 - 10, 27, R.Left + W div 2 + 8, R.Bottom - 2);
  FillRect(DC, R2, hBrush(COLOR_BTNSHADOW + 1));
  R2 := Rect(R.Left + 2, R.Top + 28 + H div 4, R.Right - 2, R.Top + 27 + H div 4 + 20);
  FillRect(DC, R2, hBrush(COLOR_BTNSHADOW + 1));
end;

function TdxFCReportLinkDesignWindow.GetFlowChartReportLink: TdxFlowChartReportLink;
begin
  Result := TdxFlowChartReportLink(ReportLink);
end;

procedure TdxFCReportLinkDesignWindow.ccbxColorChange(Sender: TObject);
var
  Color: TColor;
begin
  if LockControlsUpdate then Exit;
  Color := TdxPSColorCombo(Sender).ColorValue;
  case TdxPSColorCombo(Sender).Tag of
    0: FlowChartReportLink.Color := Color;
    1: FlowChartReportLink.BorderColor := Color;
  end;
  Modified := True;
  UpdatePreview;
end;

procedure TdxFCReportLinkDesignWindow.UpdatePreview;
begin
  FPreviewBox.Invalidate;
end;
  
procedure TdxFCReportLinkDesignWindow.chbxTransparentClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  FlowChartReportLink.Transparent := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview;
end;

procedure TdxFCReportLinkDesignWindow.chbxDrawBorderClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  FlowChartReportLink.DrawBorder := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview;
end;

procedure TdxFCReportLinkDesignWindow.lblColorClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TCustomComboBox(ActiveControl).DroppedDown := True;
end;

initialization
  dxPSRegisterReportLink(TdxFlowChartReportLink, TdxFlowChart, TdxFCReportLinkDesignWindow);

finalization
  dxPSUnregisterReportLink(TdxFlowChartReportLink, TdxFlowChart, TdxFCReportLinkDesignWindow);

end.

