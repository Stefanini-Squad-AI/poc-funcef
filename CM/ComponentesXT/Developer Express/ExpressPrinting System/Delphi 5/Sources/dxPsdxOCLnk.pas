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

unit dxPSdxOCLnk;

interface

{$I dxPSVer.inc}

uses
  Classes, Windows, Graphics, Controls, Forms, StdCtrls, ExtCtrls, ComCtrls,
  dxOrgChr, dxPSCore;

type
  TCustomdxOrgChartReportLink = class(TBasedxReportLink)
  private
    FBorderColor: TColor;
    FDrawBorder: Boolean;
    FFullExpand: Boolean;
    FTransparentColor: TColor;
    FUseMetafile: Boolean;

    function GetOrgChart: TdxOrgChart;
    procedure SetTransparentColor(Value: TColor);
    procedure SetBorderColor(Value: TColor);
    procedure SetFullExpand(Value: Boolean);
    procedure SetDrawBorder(Value: Boolean);
  protected
    procedure ConstructReport(AReportCells: TdxReportCells); override;
    procedure InternalRestoreDefaults; override;
    procedure InternalRestoreFromOriginal; override;    
    procedure PrepareConstruct; virtual;
    procedure UnPrepareConstruct; virtual;

    property OrgChart: TdxOrgChart read GetOrgChart;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source: TPersistent); override;
    
    property BorderColor: TColor read FBorderColor write SetBorderColor
      default clBlack; {dxDefaultGridLineColor}
    property Color;
    property DrawBorder: Boolean read FDrawBorder write SetDrawBorder
      default False;
    property FullExpand: Boolean read FFullExpand write SetFullExpand
      default False;
    property Transparent;
    property TransparentColor: TColor read FTransparentColor write SetTransparentColor
      default clWindow; {dxDefaultGridLineColor}
    property UseMetafile: Boolean read FUseMetafile write FUseMetafile
      default True;
  end;

  TdxOrgChartReportLink = class(TCustomdxOrgChartReportLink)
  public
    property OrgChart;
  published
    property BorderColor;
    property Color;
    property DrawBorder;
    property FullExpand;
    property Transparent;
    property TransparentColor;
    property UseMetafile;
  end;

  TdxOCReportLinkDesignWindow = class(TAbstractdxReportLinkDesignWindow)
    PageControl1: TPageControl;
    tshOptions: TTabSheet;
    pnlOptions: TPanel;
    chbxFullExpand: TCheckBox;
    lblPreview: TStaticText;
    Panel10: TPanel;
    pnlPreview: TPanel;
    chbxDrawBorder: TCheckBox;
    gbxTransparent: TGroupBox;
    lblColor: TLabel;
    bvlColorHolder: TBevel;
    chbxTransparent: TCheckBox;
    gbxBorder: TGroupBox;
    lblGridLinesColor: TLabel;
    bvlLineColorHolder: TBevel;
    ocPreview: TdxOrgChart;
    procedure lblColorClick(Sender: TObject);
    procedure chbxFullExpandClick(Sender: TObject);
    procedure chbxDrawBorderClick(Sender: TObject);
    procedure chbxTransparentClick(Sender: TObject);
  private
    FOCBmp: TBitmap;
    procedure ccbxColorChange(Sender: TObject);
    procedure CreateControls;
    function GetOrgChartReportLink: TdxOrgChartReportLink;
    procedure pbxPreviewPaint(Sender: TObject);
    procedure CMDialogChar(var Msg: TCMDialogChar); message CM_DIALOGCHAR;
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
    destructor Destroy; override;
    property OrgChartReportLink: TdxOrgChartReportLink read GetOrgChartReportLink;
  end;

implementation

{$R *.DFM}

uses
  SysUtils, Messages, dxPSRes, dxPSUtl, dxPSGlbl, dxExtCtrls;

{ TCustomdxOrgChartReportLink }

constructor TCustomdxOrgChartReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTransparentColor := clWindow;
  FBorderColor := dxDefaultGridLineColor;
  FDrawBorder := False;
  FFullExpand := False;
  FUseMetafile := True;
end;

procedure TCustomdxOrgChartReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TCustomdxOrgChartReportLink) then
  begin
    TransparentColor := TCustomdxOrgChartReportLink(Source).TransparentColor;
    BorderColor := TCustomdxOrgChartReportLink(Source).BorderColor;
    DrawBorder := TCustomdxOrgChartReportLink(Source).DrawBorder;
    FullExpand := TCustomdxOrgChartReportLink(Source).FullExpand;
    UseMetafile := TCustomdxOrgChartReportLink(Source).UseMetafile;
  end;
end;

procedure TCustomdxOrgChartReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  TransparentColor := clWindow;
  BorderColor := dxDefaultGridLineColor;
  DrawBorder := False;
  FullExpand := False;
end;

procedure TCustomdxOrgChartReportLink.InternalRestoreFromOriginal;
begin
  inherited InternalRestoreFromOriginal;
  if OrgChart <> nil then TransparentColor := OrgChart.Color;
end;

procedure TCustomdxOrgChartReportLink.SetTransparentColor(Value: TColor);
begin
  if (FTransparentColor <> Value) then 
  begin
    FTransparentColor := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxOrgChartReportLink.SetBorderColor(Value: TColor);
begin
  if (FBorderColor <> Value) then
  begin
    FBorderColor := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxOrgChartReportLink.SetFullExpand(Value: Boolean);
begin
  if (FFullExpand <> Value) then
  begin
    FFullExpand := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxOrgChartReportLink.SetDrawBorder(Value: Boolean);
begin
  if (FDrawBorder <> Value) then
  begin
    FDrawBorder := Value;
    LinkModified(True);
  end;
end;

function TCustomdxOrgChartReportLink.GetOrgChart: TdxOrgChart;
begin
  Result := TdxOrgChart(Component);
end;

procedure TCustomdxOrgChartReportLink.PrepareConstruct;
begin
  if OrgChart.HandleAllocated then
    SendMessage(OrgChart.Handle, WM_SETREDRAW, 0, 0);
end;

procedure TCustomdxOrgChartReportLink.UnPrepareConstruct;
begin
  if OrgChart.HandleAllocated then
  begin
    SendMessage(OrgChart.Handle, WM_SETREDRAW, 1, 0);
    OrgChart.Invalidate;
  end;
end;

procedure ProcessPaintMessages;
var
  Msg: TMsg;
begin                         
  while PeekMessage(Msg, 0, WM_PAINT, WM_PAINT, PM_NOREMOVE) do
  begin
    case Integer(GetMessage(Msg, 0, WM_PAINT, WM_PAINT)) of
      -1: Break;
      0: begin
           PostQuitMessage(Msg.wParam);
           Break;
         end;
    end;
    DispatchMessage(Msg);
  end;
end;

type
  TdxOrgChartAccess = class(TdxCustomOrgChart);

procedure TCustomdxOrgChartReportLink.ConstructReport(AReportCells: TdxReportCells);
const 
  GraphicClasses: array[Boolean] of TGraphicClass = (TBitmap, TMetafile);
  Borders: array[Boolean] of TdxCellSides = ([], csAll);  
var
  G: TGraphic;
  ACanvas: TCanvas;
  DC: HDC;
  Br: HBRUSH;
  Data: TdxReportCellGraphic;
  Cell: TdxReportCell;
  SaveSelected: TdxOcNode;
  SaveAnimated: Boolean;
begin
  if OrgChart = nil then Exit;
  inherited ConstructReport(AReportCells);
  if OrgChart.Count = 0 then 
    Exit;
  
  AReportCells.Cells.Color := Color;
  AReportCells.BorderColor := BorderColor;
  AReportCells.Cells.Transparent := True;
  
  Cell := TdxReportCell.Create(AReportCells.Cells);
  Cell.Transparent := True;  
  Cell.CellSides := [];
  Data := TdxReportCellGraphic.Create(Cell);
  with Data do
  begin
    Transparent := Self.Transparent;
    CellSides := Borders[DrawBorder];
    ImageTransparent := True;
  end;
  SaveSelected := TdxOrgChartAccess(OrgChart).Selected;
  OrgChart.Selected := nil;
  SaveAnimated := ocAnimate in OrgChart.Options;
  if SaveAnimated then
    OrgChart.Options := TdxOrgChartAccess(OrgChart).Options - [ocAnimate];
  if FullExpand then 
  begin 
    OrgChart.FullExpand;
    ProcessPaintMessages;
  end;  
  G := Data.CreateImage(GraphicClasses[UseMetafile]);
  G.Width := OrgChart.FullWidth + 5;
  G.Height := OrgChart.FullHeight + 5;
  if UseMetafile then 
    ACanvas := TMetafileCanvas.Create(TMetafile(G), 0)
  else
    ACanvas := TBitmap(G).Canvas;
      
  try
    DC := ACanvas.Handle;
    if not UseMetafile and Transparent then 
    begin
      Br := CreateSolidBrush(ColorToRGB(TransparentColor));
      FillRect(DC, Rect(0, 0, G.Width, G.Height), Br);
      DeleteObject(Br);
    end;  
    MoveWindowOrg(DC, OrgChart.LeftEdge, OrgChart.TopEdge);
    OrgChart.ControlState := OrgChart.ControlState + [csPaintCopy];
    try
      TdxOrgChartAccess(OrgChart).PaintWindow(DC);
    finally
      OrgChart.ControlState := OrgChart.ControlState - [csPaintCopy];
    end;  
    MoveWindowOrg(DC, -OrgChart.LeftEdge, -OrgChart.TopEdge);
    if not UseMetafile and Transparent then
      TBitmap(G).TransparentColor := TransparentColor;
  finally
    if UseMetafile then ACanvas.Free;
  end;  
  
  if SaveAnimated then
    OrgChart.Options := OrgChart.Options + [ocAnimate];
  OrgChart.Selected := SaveSelected;

  Data.BoundsRect := Rect(0, 0, G.Width, G.Height);
  Cell.BoundsRect := Data.BoundsRect;
  AReportCells.Cells.BoundsRect := Cell.BoundsRect;
  AReportCells.DoProgress(100);
end;

{ TdxOCReportLinkDesignWindow }

constructor TdxOCReportLinkDesignWindow.Create(AOwner: TComponent);
begin
  HelpContext := dxhcOrgChartReportLinkDesigner;
  inherited Create(AOwner);
  CreateControls;
  PageControl1.ActivePage := PageControl1.Pages[0];
  FOCBmp := TBitmap.Create;
  ocPreview.FullExpand;
  FOCBmp.Width := ocPreview.FullWidth + 1;
  FOCBmp.Height := ocPreview.FullHeight + 1;
  TdxOrgChartAccess(ocPreview).PaintWindow(FOCBmp.Canvas.Handle);
end;

destructor TdxOCReportLinkDesignWindow.Destroy;
begin
  FOCBmp.Free;
  inherited Destroy;
end;

procedure TdxOCReportLinkDesignWindow.CMDialogChar(var Msg: TCMDialogChar);
var
  i: Integer;
begin
  inherited;
  with PageControl1 do
    for i := 0 to PageCount - 1 do
      if IsAccel(Msg.CharCode, Pages[i].Caption) then
      begin
        Msg.Result := 1;
        ActivePage := Pages[i];
        Exit;
      end;
end;

procedure TdxOCReportLinkDesignWindow.CreateControls;
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

procedure TdxOCReportLinkDesignWindow.LoadStrings;
var
  Item: TdxOcNode;
begin
  inherited LoadStrings;
  tshOptions.Caption := sdxOptions;

  Item := ocPreview.Items[0];
  Item.Text := sdxCorporateHeadquarters; 
  Item[0].Text := sdxSalesAndMarketing;
  Item[0].Items[0].Text := sdxFieldOfficeCanada;
  Item[1].Text := sdxEngineering;
  
  chbxDrawBorder.Caption := sdxBorderLines;
  chbxTransparent.Caption := sdxTransparent;
  lblColor.Caption := sdxColor;
  lblGridLinesColor.Caption := sdxGridLinesColor;
  lblPreview.Caption := DropAmpersand(sdxPreview);
end;

procedure TdxOCReportLinkDesignWindow.DoInitialize;
begin
  inherited DoInitialize;
  chbxTransparent.Visible := not OrgChartReportLink.UseMetafile;
  if not chbxTransparent.Visible then 
    chbxDrawBorder.BoundsRect := chbxTransparent.BoundsRect;
  gbxTransparent.Visible := chbxTransparent.Visible;
  if not gbxTransparent.Visible then 
    gbxBorder.BoundsRect := gbxTransparent.BoundsRect;
  chbxFullExpand.Checked := OrgChartReportLink.FullExpand;
  chbxDrawBorder.Checked := OrgChartReportLink.DrawBorder;
  chbxTransparent.Checked := OrgChartReportLink.Transparent;
  TdxPSColorCombo(ccbxColor).ColorValue := ColorToRGB(OrgChartReportLink.Color);
  TdxPSColorCombo(ccbxGridLineColor).ColorValue := ColorToRGB(OrgChartReportLink.BorderColor);
end;

procedure TdxOCReportLinkDesignWindow.UpdateControlsState;
begin
  inherited UpdateControlsState;
  
  ccbxColor.Enabled := not chbxTransparent.Checked;
  lblColor.Enabled := not chbxTransparent.Checked;
  ccbxGridLineColor.Enabled := chbxDrawBorder.Checked;
  lblGridLinesColor.Enabled := chbxDrawBorder.Checked;
end;

procedure TdxOCReportLinkDesignWindow.pbxPreviewPaint(Sender: TObject);
begin
  with TdxPSPaintPanel(Sender) do
    PaintPreview(Canvas, ClientRect);
end;

procedure TdxOCReportLinkDesignWindow.PaintPreview(ACanvas: TCanvas; R: TRect);
var
  DC: hDC;
  ABrush: HBRUSH;
  APrevStyle: TBrushStyle;
  OffsetX, OffsetY: Integer;
begin
  DC := ACanvas.Handle;
  FillRect(DC, R, HBRUSH(COLOR_WINDOW + 1));
  OffsetRect(R, -R.Left, -R.Top);
  InflateRect(R, -4, -4);
{border}
  if OrgChartReportLink.DrawBorder then
  begin
    InflateRect(R, 1, 1);
    ABrush := CreateSolidBrush(ColorToRGB(OrgChartReportLink.BorderColor));
    FrameRect(DC, R, ABrush);
    DeleteObject(ABrush);
    InflateRect(R, -1, -1);
  end;
{interior}
  if not OrgChartReportLink.Transparent then
  begin
    ABrush := CreateSolidBrush(ColorToRGB(OrgChartReportLink.Color));
    FillRect(DC, R, ABrush);
    DeleteObject(ABrush);
  end;
{charts}
  OffsetX := R.Left + (R.Right - R.Left - FOCBmp.Width) div 2;
  OffsetY := R.Top + (R.Bottom - R.Top - FOCBmp.Height) div 2;
  APrevStyle := ACanvas.Brush.Style;
  ACanvas.Brush.Style := bsClear;
  ACanvas.BrushCopy(Bounds(OffsetX, OffsetY, FOCBmp.Width, FOCBmp.Height),
    FOCBmp, Rect(0, 0, FOCBmp.Width, FOCBmp.Height),
    FOCBmp.Canvas.Pixels[0, FOCBmp.Height - 1]);
  ACanvas.Brush.Style := APrevStyle;
end;

function TdxOCReportLinkDesignWindow.GetOrgChartReportLink: TdxOrgChartReportLink;
begin
  Result := TdxOrgChartReportLink(ReportLink);
end;

procedure TdxOCReportLinkDesignWindow.ccbxColorChange(Sender: TObject);
var
  AColor: TColor;
begin
  if LockControlsUpdate then Exit;
  AColor := TdxPSColorCombo(Sender).ColorValue;
  case TdxPSColorCombo(Sender).Tag of
    0: OrgChartReportLink.Color := AColor;
    1: OrgChartReportLink.BorderColor := AColor;
  end;
  Modified := True;
  UpdatePreview; 
end;

procedure TdxOCReportLinkDesignWindow.UpdatePreview;
begin
  FPreviewBox.Invalidate;
end;
  
procedure TdxOCReportLinkDesignWindow.lblColorClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TCustomComboBox(ActiveControl).DroppedDown := True;
end;

procedure TdxOCReportLinkDesignWindow.chbxFullExpandClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  OrgChartReportLink.FullExpand := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview; 
end;

procedure TdxOCReportLinkDesignWindow.chbxDrawBorderClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  OrgChartReportLink.DrawBorder := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview; 
end;

procedure TdxOCReportLinkDesignWindow.chbxTransparentClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  OrgChartReportLink.Transparent := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview; 
end;

initialization
  dxPSRegisterReportLink(TdxOrgChartReportLink, TdxOrgChart, TdxOCReportLinkDesignWindow);

finalization
  dxPSUnregisterReportLink(TdxOrgChartReportLink, TdxOrgChart, TdxOCReportLinkDesignWindow);

end.

 