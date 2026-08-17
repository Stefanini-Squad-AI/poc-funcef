
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

unit dxPSStdGrLnk;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, 
  StdCtrls, ExtCtrls, ComCtrls, checklst, dxPSRes, dxPSCore, dxPSGrLnks, dxPSGlbl;

type
  TStddxGridReportLink = class(TCustomdxGridReportLink)
  protected
    class function IsDrawGridLink: Boolean; virtual;
    class function IsStringGridLink: Boolean; virtual;
  end;

  
  TdxCustomDrawTextCellEvent = procedure(Sender: TBasedxReportLink;
    ACol, ARow: Integer; ACanvas: TCanvas; ABoundsRect, AClientRect: TRect;
    var AText: string; AFont: TFont; var AColor: TColor;
    var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
    var ADone: Boolean) of object;
    
  TdxStringGridReportLink = class(TStddxGridReportLink)
  private
    FTextAlignX: TdxTextAlignX;
    FTextAlignY: TdxTextAlignY;
    FOnCustomDrawCell: TdxCustomDrawTextCellEvent;

    FSaveFont: TFont;
    FCustomDrawFontChanged: Boolean;

    function GetStringGrid: TStringGrid;
    procedure SetTextAlignX(Value: TdxTextAlignX);
    procedure SetTextAlignY(Value: TdxTextAlignY);

    procedure CustomDrawFontChanged(Sender: TObject);
  protected
    procedure InternalRestoreDefaults; override;
      
    function GetCellText(ACol, ARow: Integer): string; override;
    function GetTextAlignX(ACol, ARow: Integer): TdxTextAlignX; override;
    function GetTextAlignY(ACol, ARow: Integer): TdxTextAlignY; override;
    procedure SetDrawMode(Value: TdxGridDrawMode); override;
    
    procedure CustomDraw(AItem: TAbstractdxReportCellData; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var ADone: Boolean); override;
    procedure DoCustomDrawCell(ACol, ARow: Integer; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var AText: string; AFont: TFont;
      var AColor: TColor; var ATextAlignX: TdxTextAlignX;
      var ATextAlignY: TdxTextAlignY; var ADone: Boolean); virtual;
    function IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean; override;
    
    class function IsStringGridLink: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    property StringGrid: TStringGrid read GetStringGrid;
  published
    property Color;
    property DrawMode;
    property Effects3D;
    property EndEllipsis;
    property EvenColor;
    property EvenFont;
    property FixedColor;
    property FixedFont;
    property FixedTransparent;
    property Font;
    property GridLineColor;
    property HeadersOnEveryPage;
    property IncludeFixed;
    property Multiline;
    property OddColor;
    property OddFont;
    property OnlySelected;
    property Options;
    property RowAutoHeight;
    property ScaleFonts;
    property Soft3D;
    property SupportedCustomDraw;
    property TextAlignX: TdxTextAlignX read FTextAlignX write SetTextAlignX
      default taLeft;
    property TextAlignY: TdxTextAlignY read FTextAlignY write SetTextAlignY
      default taCenterY;
    property Transparent;
    property UseHorzDelimiters;
    property UseVertDelimiters;

    property OnCustomDrawCell: TdxCustomDrawTextCellEvent read FOnCustomDrawCell write FOnCustomDrawCell;
  end;


  TdxCustomDrawCellEvent = procedure(Sender: TBasedxReportLink;
    ACol, ARow: Integer; ACanvas: TCanvas; ABoundsRect, AClientRect: TRect) of object;
  
  TdxDrawGridReportLink = class(TStddxGridReportLink)
  private
    FDefaultDrawing: Boolean;
    FOnCustomDrawCell: TdxCustomDrawCellEvent;
    
    function GetDrawGrid: TDrawGrid;
    procedure SetDefaultDrawing(Value: Boolean);
  protected
    procedure InternalRestoreDefaults; override;
    procedure InternalRestoreFromOriginal; override;

    function GetCellText(ACol, ARow: Integer): string; override;
    function GetDataItemClass(ACol: Integer): TdxReportCellDataClass; override;
    procedure SetDrawMode(Value: TdxGridDrawMode); override;

    procedure CustomDraw(AItem: TAbstractdxReportCellData; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var ADone: Boolean); override;
    procedure DoCustomDrawCell(ACol, ARow: Integer; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect); virtual;
    function IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean; override;

    class function IsDrawGridLink: Boolean; override;
  public
    procedure Assign(Source: TPersistent); override;

    property DrawGrid: TDrawGrid read GetDrawGrid;
  published
    property Color;
    property DefaultDrawing: Boolean read FDefaultDrawing write SetDefaultDrawing
      default True;
    property DrawMode;
    property Effects3D;
    property EvenColor;
    property EvenFont;
    property FixedColor;
    property FixedFont;
    property FixedTransparent;
    property Font;
    property GridLineColor;
    property HeadersOnEveryPage;
    property IncludeFixed;
    property OddColor;
    property OnlySelected;
    property Options;
    property ScaleFonts;
    property Soft3D;
    property SupportedCustomDraw default True;
    property Transparent;
    property UseHorzDelimiters;
    property UseVertDelimiters;
    
    property OnCustomDrawCell: TdxCustomDrawCellEvent read FOnCustomDrawCell write FOnCustomDrawCell;
  end;
  
  TdxGridReportLinkDesignWindow = class(TAbstractdxReportLinkDesignWindow)
    FD: TFontDialog;
    PageControl1: TPageControl;
    tshOptions: TTabSheet;
    tshColor: TTabSheet;
    tshFont: TTabSheet;
    pnlOptions: TPanel;
    pnlColor: TPanel;
    pnlFont: TPanel;
    lblGridLinesColor: TLabel;
    btnFont: TButton;
    edFont: TEdit;
    btnFixedFont: TButton;
    edFixedFont: TEdit;
    Panel10: TPanel;
    lblPreview: TStaticText;
    chbxTransparent: TCheckBox;
    gbxTransparent: TGroupBox;
    lblColor: TLabel;
    chbxFixedTransparent: TCheckBox;
    gbxFixedTransparent: TGroupBox;
    lblFixedColor: TLabel;
    bvlFixedColorHolder: TBevel;
    bvlLineColorHolder: TBevel;
    bvlColorHolder: TBevel;
    pnlPreview: TPanel;
    lblEvenColor: TLabel;
    bvlEvenColorHolder: TBevel;
    btnEvenFont: TButton;
    edEvenFont: TEdit;
    chbxShowVertLines: TCheckBox;
    chbxShowFixedHorzLines: TCheckBox;
    chbxShowFixedVertLines: TCheckBox;
    chbxShowBorders: TCheckBox;
    chbxShowHorzLines: TCheckBox;
    lblShow: TLabel;
    Bevel11: TBevel;
    tshBehaviors: TTabSheet;
    Panel1: TPanel;
    chbxIncludeFixed: TCheckBox;
    chbxOnlySelected: TCheckBox;
    chbxFixedRowsOnEveryPage: TCheckBox;
    Image3: TImage;
    lblSelection: TLabel;
    Bevel3: TBevel;
    lblOnEveryPage: TLabel;
    Image1: TImage;
    Bevel10: TBevel;
    lblMiscellaneous: TLabel;
    lblDrawMode: TLabel;
    cbxDrawMode: TComboBox;
    Bevel4: TBevel;
    chbxRowAutoHeight: TCheckBox;
    lbl3DEffects: TLabel;
    Bevel15: TBevel;
    Image8: TImage;
    chbxUse3DEffects: TCheckBox;
    chbxUseSoft3D: TCheckBox;
    procedure ccbxColorChange(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure pbxPreViewPaint(Sender: TObject);
    procedure chbxOnlySelectedClick(Sender: TObject);
    procedure chbxIncludeFixedClick(Sender: TObject);
    procedure chbxTransparentClick(Sender: TObject);
    procedure lblColorClick(Sender: TObject);
    procedure chbxRowAutoHeightClick(Sender: TObject);
    procedure chbxFixedRowsOnEveryPageClick(Sender: TObject);
    procedure chbxShowBordersClick(Sender: TObject);
    procedure cbxDrawModeChange(Sender: TObject);
    procedure chbxUse3DEffectsClick(Sender: TObject);
    procedure chbxUseSoft3DClick(Sender: TObject);
  private
    FccbxColor: TCustomComboBox;
    FccbxEvenColor: TCustomComboBox;
    FccbxFixedColor: TCustomComboBox;
    FccbxGridLineColor: TCustomComboBox;
    FPreviewBox: TCustomControl;
    
    FColCount: Integer;
    FPaintHeight: Integer;
    FPaintWidth: Integer;
    FPreviewFont: TFont;
    FRectWidth: Integer;
    FRectHeight: Integer;
    FRowCount: Integer;
    
    procedure CreateControls;
    function GetGridReportLink: TStddxGridReportLink;
    procedure CMDialogChar(var message: TCMDialogChar); message CM_DIALOGCHAR;
    
    property GridReportLink: TStddxGridReportLink read GetGridReportLink;    
  protected
    procedure DoInitialize; override;
    procedure LoadStrings; override;
    procedure PaintPreview(ACanvas: TCanvas; R: TRect); override;
    procedure UpdateControlsState; override;
    procedure UpdatePreview; override;   
  public
    constructor Create(AOwner: TComponent); override;   
    destructor Destroy; override;   
  end;

const
  sdxGridStrings: array[0..5, 0..7] of string =
    ((     '',  'Jan', 'Feb', 'March', 'April', 'May', 'June', sdxTotal),
     ( sdxEast,   '7',  '12',    '27',    '11',  '11',   '16',     '84'), 
     ( sdxWest,   '8',   '6',    '17',    '12',  '11',   '16',     '70'),
     (sdxSouth,  '23',  '32',    '21',    '15',  '10',   '26',    '127'),
     (sdxNorth,  '22',  '12',    '12',    '32',  '32',   '12',    '122'),     
     (sdxTotal,  '60',  '62',    '77',    '70',  '64',   '70',    '403'));
  
implementation

{$R *.DFM}

uses
  dxExtCtrls, dxPrnDev, dxPSUtl;

{ TStddxGridReportLink }

class function TStddxGridReportLink.IsDrawGridLink: Boolean;
begin
  Result := False;
end;

class function TStddxGridReportLink.IsStringGridLink: Boolean;
begin
  Result := False;
end;


{ TdxStringGridReportLink }

constructor TdxStringGridReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSaveFont := TFont.Create;
  FSaveFont.OnChange := CustomDrawFontChanged;
end;

destructor TdxStringGridReportLink.Destroy;
begin
  FSaveFont.Free;
  inherited Destroy;
end;

procedure TdxStringGridReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxStringGridReportLink) then
  begin
    TextAlignX := TdxStringGridReportLink(Source).TextAlignX;
    TextAlignY := TdxStringGridReportLink(Source).TextAlignY;
  end;
end;

class function TdxStringGridReportLink.IsStringGridLink: Boolean;
begin
  Result := True;
end;

procedure TdxStringGridReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  TextAlignX := dxPSCore.dxDefaultTextAlignX; {taLeft}
  TextAlignY := dxPSCore.dxDefaultTextAlignY; {taCenterY}
end;

function TdxStringGridReportLink.GetStringGrid: TStringGrid;
begin
  Result := TStringGrid(Component);
end;

function TdxStringGridReportLink.GetTextAlignX(ACol, ARow: Integer): TdxTextAlignX;
begin
  Result := FTextAlignX;
end;

function TdxStringGridReportLink.GetTextAlignY(ACol, ARow: Integer): TdxTextAlignY;
begin
  Result := FTextAlignY;
end;

procedure TdxStringGridReportLink.SetTextAlignX(Value: TdxTextAlignX);
begin
  if (FTextAlignX <> Value) then
  begin
    FTextAlignX := Value;
    LinkModified(True);
  end;
end;

function TdxStringGridReportLink.GetCellText(ACol, ARow: Integer): string;
begin
  Result := StringGrid.Cells[ACol, ARow];
end;

procedure TdxStringGridReportLink.SetTextAlignY(Value: TdxTextAlignY);
begin
  if (FTextAlignY <> Value) then
  begin
    FTextAlignY := Value;
    LinkModified(True);
  end;
end;

procedure TdxStringGridReportLink.SetDrawMode(Value: TdxGridDrawMode);
begin
  if (Value > gdmChess) then Value := gdmChess;
  inherited SetDrawMode(Value);
end;

procedure TdxStringGridReportLink.CustomDrawFontChanged(Sender: TObject);
begin
  FCustomDrawFontChanged := True;
end;

function TdxStringGridReportLink.IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean;
begin
  Result := inherited IsSupportedCustomDraw(Item) and Assigned(FOnCustomDrawCell);
end;

procedure TdxStringGridReportLink.CustomDraw(AItem: TAbstractdxReportCellData;
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var ADone: Boolean);
var
  AColor: TColor;
  AText: string;
  ACol, ARow: Integer;
  ATextAlignX: TdxTextAlignX;
  ATextAlignY: TdxTextAlignY;
begin
  with TdxReportCellString(AItem) do
  begin
    GetCellColRow(AItem, ACol, ARow);
    ParentColor := False;
    AColor := ColorToRGB(Color);
    if Transparent then AColor := clNone;
    FSaveFont.Assign(Font);
    FCustomDrawFontChanged := False;
    AText := Text;
    ATextAlignX := TextAlignX;
    ATextAlignY := TextAlignY;
    DoCustomDrawCell(ACol, ARow, ACanvas, ABoundsRect, AClientRect, AText, 
      FSaveFont, AColor, ATextAlignX, ATextAlignY, ADone);
    if not ADone then
    begin
      if FCustomDrawFontChanged then
      begin
        SelectObject(ACanvas.Handle, FSaveFont.Handle);
        SetTextColor(ACanvas.Handle, ColorToRGB(FSaveFont.Color));
        FontIndex := -1;
      end;
      if (AColor <> clNone) then
      begin
        AItem.Color := AColor;
        AItem.Transparent := False;
      end;
      Text := AText;
      TextAlignX := ATextAlignX;
      TextAlignY := ATextAlignY;
    end;
  end;
end;

procedure TdxStringGridReportLink.DoCustomDrawCell(ACol, ARow: Integer; ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect; var AText: string; AFont: TFont; var AColor: TColor;
  var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawCell) then
    FOnCustomDrawCell(Self, ACol, ARow, ACanvas, ABoundsRect, AClientRect, AText,
      AFont, AColor, ATextAlignX, ATextAlignY, ADone);
end;


type  
  TdxReportCustomDrawCellData = class(TAbstractdxReportCellData)
  private
    FDefaultDrawing: Boolean;
  protected
    procedure DrawContent(DC: hDC; var R: TRect; AClientRect: TRect; 
      var ADone: Boolean); override;
  public
    constructor Create(AParent: TdxReportCell); override;
    procedure Assign(Source: TPersistent); override;
    
    property DefaultDrawing: Boolean read FDefaultDrawing write FDefaultDrawing;
  end;

constructor TdxReportCustomDrawCellData.Create(AParent: TdxReportCell);
begin
  inherited Create(AParent);
  DefaultDrawing := True;
end;

procedure TdxReportCustomDrawCellData.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxReportCustomDrawCellData) then 
    DefaultDrawing := TdxReportCustomDrawCellData(Source).DefaultDrawing;
end;
  
procedure TdxReportCustomDrawCellData.DrawContent(DC: hDC; var R: TRect; 
  AClientRect: TRect; var ADone: Boolean);
begin
  if DefaultDrawing then 
  begin
    if IsEdgeDrawn then     
      Renderer.DrawEdge(DC, R, EdgeMode, InnerEdge, OuterEdge, CellSides);
    if not Transparent then 
      Renderer.FillRect(DC, R, Color);  
  end; 
  ADone := True;
  inherited DrawContent(DC, R, AClientRect, ADone);
end;  


{ TdxDrawGridReportLink }

procedure TdxDrawGridReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxDrawGridReportLink) then
    DefaultDrawing := TdxDrawGridReportLink(Source).DefaultDrawing;
end;

class function TdxDrawGridReportLink.IsDrawGridLink: Boolean;
begin
  Result := True;
end;

procedure TdxDrawGridReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  DefaultDrawing := True;
  SupportedCustomDraw := True;
end;

function TdxDrawGridReportLink.GetCellText(ACol, ARow: Integer): string;
begin
  Result := '';
end;

procedure TdxDrawGridReportLink.InternalRestoreFromOriginal;
begin
  inherited InternalRestoreFromOriginal;
  if Assigned(DrawGrid) then
    DefaultDrawing := DrawGrid.DefaultDrawing;
end;

function TdxDrawGridReportLink.GetDrawGrid: TDrawGrid;
begin
  Result := TDrawGrid(Component);
end;

procedure TdxDrawGridReportLink.SetDefaultDrawing(Value: Boolean);
begin
  if (DefaultDrawing <> Value) then
  begin
    FDefaultDrawing := Value;
    if SupportedCustomDraw then LinkModified(True);
  end;
end;

procedure TdxDrawGridReportLink.SetDrawMode(Value: TdxGridDrawMode);
begin
  if (Value > gdmChess) then Value := gdmChess;
  inherited SetDrawMode(Value);
end;

function TdxDrawGridReportLink.GetDataItemClass(ACol: Integer): TdxReportCellDataClass;
begin
  Result := TdxReportCustomDrawCellData;
end;

function TdxDrawGridReportLink.IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean;
begin
  Result := inherited IsSupportedCustomDraw(Item) and Assigned(FOnCustomDrawCell);
end;

procedure TdxDrawGridReportLink.CustomDraw(AItem: TAbstractdxReportCellData;
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var ADone: Boolean);
var
  ACol, ARow: Integer;
begin
  with TdxReportCustomDrawCellData(AItem) do
  begin
    GetCellColRow(AItem, ACol, ARow);
    DoCustomDrawCell(ACol, ARow, ACanvas, ABoundsRect, AClientRect);
  end;
  ADone := True;
end;
  
procedure TdxDrawGridReportLink.DoCustomDrawCell(ACol, ARow: Integer; ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect);
begin
  if Assigned(FOnCustomDrawCell) then 
    FOnCustomDrawCell(Self, ACol, ARow, ACanvas, ABoundsRect, AClientRect);
end;


{ TdxSGrReportLinkDesignWindow }

constructor TdxGridReportLinkDesignWindow.Create(AOwner: TComponent);
begin
  HelpContext := dxhcStringGridReportLinkDesigner;
  inherited Create(AOwner);
  CreateControls;
  FColCount := 5;
  FRowCount := 5;
  FRectWidth := (FPreviewBox.Width - 10) div FColCount;
  FRectHeight := (FPreviewBox.Height - 10) div FRowCount;
  FPaintWidth := FColCount * FRectWidth + 5;
  FPaintHeight := FRowCount * (FRectHeight + 1);
  PageControl1.ActivePage := PageControl1.Pages[0];
  FPreviewFont := TFont.Create;
end;

destructor TdxGridReportLinkDesignWindow.Destroy;
begin
  FPreviewFont.Free;
  inherited Destroy;
end;

procedure TdxGridReportLinkDesignWindow.CreateControls;
var
  R: TRect;
begin
  FccbxColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxColor) do
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
  lblColor.FocusControl := FccbxColor;

  FccbxEvenColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxEvenColor) do
  begin
    BoundsRect := bvlEvenColorHolder.BoundsRect;
    Tag := 1;
    Parent := gbxTransparent;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultColor;
//    DropDownCount := Items.Count;
    OnChange := ccbxColorChange;
  end;
  lblEvenColor.FocusControl := FccbxEvenColor;

  FccbxFixedColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxFixedColor) do
  begin
    BoundsRect := bvlFixedColorHolder.BoundsRect;
    Tag := 2;
    Parent := gbxFixedTransparent;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultFixedColor;
//    DropDownCount := Items.Count;
    OnChange := ccbxColorChange;
  end;
  lblFixedColor.FocusControl := FccbxFixedColor;

  FccbxGridLineColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxGridLineColor) do
  begin
    BoundsRect := bvlLineColorHolder.BoundsRect;
    Tag := 3;
    Parent := pnlColor;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultGridLineColor;
//    DropDownCount := Items.Count;
    OnChange := ccbxColorChange;
  end;
  lblGridLinesColor.FocusControl := FccbxGridLineColor;
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

function TdxGridReportLinkDesignWindow.GetGridReportLink: TStddxGridReportLink;
begin
  Result := TStddxGridReportLink(ReportLink);
end;

procedure TdxGridReportLinkDesignWindow.LoadStrings;
var
  Ind: Integer;
begin
  inherited LoadStrings;
  tshOptions.Caption := sdxOptions;
  tshFont.Caption := sdxFonts;
  tshColor.Caption := sdxColors;
  tshBehaviors.Caption := sdxBehaviors;
  lblPreview.Caption := DropAmpersand(sdxPreview);

  lblShow.Caption := sdxShow;
  chbxShowBorders.Caption := sdxBorderLines;
  chbxShowHorzLines.Caption := sdxHorzLines;
  chbxShowVertLines.Caption := sdxVertLines;
  chbxShowFixedHorzLines.Caption := sdxFixedHorzLines;
  chbxShowFixedVertLines.Caption := sdxFixedVertLines;

  lblMiscellaneous.Caption := sdxMiscellaneous;
  chbxRowAutoHeight.Caption := sdxRowAutoHeight;
  lblDrawMode.Caption := sdxDrawMode;
  Ind := cbxDrawMode.ItemIndex;
  cbxDrawMode.Items.BeginUpdate;
  try
    cbxDrawMode.Items.Clear;
    cbxDrawMode.Items.Add(sdxDrawModeStrict);
    cbxDrawMode.Items.Add(sdxDrawModeOddEven);
    cbxDrawMode.Items.Add(sdxDrawModeChess);
  finally
    cbxDrawMode.Items.EndUpdate;
  end;
  cbxDrawMode.ItemIndex := Ind;

  chbxTransparent.Caption := sdxTransparent;
  lblColor.Caption := sdxColor;
  lblEvenColor.Caption := sdxEvenColor;
  chbxFixedTransparent.Caption := sdxFixedTransparent;
  lblFixedColor.Caption := sdxFixedColor;
  lblGridLinesColor.Caption := sdxGridLinesColor;

  btnFont.Caption := sdxBtnFont;
  btnEvenFont.Caption := sdxBtnEvenFont;
  btnFixedFont.Caption := sdxBtnFixedFont;

  lblOnEveryPage.Caption := sdxOnEveryPage;
  chbxFixedRowsOnEveryPage.Caption := sdxFixedRowOnEveryPage;

  lblSelection.Caption := sdxSelection;
  chbxOnlySelected.Caption := sdxOnlySelected;
  chbxIncludeFixed.Caption := sdxIncludeFixed;

  lbl3DEffects.Caption := sdx3DEffects;
  chbxUse3DEffects.Caption := sdxUse3DEffects;
  chbxUseSoft3D.Caption := sdxSoft3D;
end;

procedure TdxGridReportLinkDesignWindow.CMDialogChar(var message: TCMDialogChar);
var
  I: Integer;
begin
  inherited;
  with PageControl1 do
    for I := 0 to PageCount - 1 do
      if IsAccel(message.CharCode, Pages[I].Caption) then
      begin
        message.Result := 1;
        ActivePage := Pages[I];
        Exit;
      end;
end;

procedure TdxGridReportLinkDesignWindow.UpdateControlsState;
begin
  inherited UpdateControlsState;
  FccbxColor.Enabled := not chbxTransparent.Checked;
  lblColor.Enabled := FccbxColor.Enabled;
  FccbxEvenColor.Enabled := not chbxTransparent.Checked and
    (GridReportLink.DrawMode in [gdmOddEven, gdmChess]);
  lblEvenColor.Enabled := FccbxEvenColor.Enabled;
  FccbxFixedColor.Enabled := not chbxFixedTransparent.Checked;
  lblFixedColor.Enabled := FccbxFixedColor.Enabled;

  btnEvenFont.Enabled := GridReportLink.DrawMode in [gdmOddEven, gdmChess];
  if (GridReportLink.DrawMode in [gdmOddEven, gdmChess]) then
  begin
    lblColor.Caption := sdxOddColor;
    btnFont.Caption := sdxBtnOddFont;
  end
  else
  begin
    lblColor.Caption := sdxColor;
    btnFont.Caption := sdxBtnFont;
  end;
  chbxIncludeFixed.Enabled := chbxOnlySelected.Enabled and chbxOnlySelected.Checked;
  chbxUseSoft3D.Enabled := chbxUse3DEffects.Checked;
end;

procedure TdxGridReportLinkDesignWindow.DoInitialize;
begin
  inherited DoInitialize;
  if GridReportLink.IsDrawGridLink then 
  begin
    chbxRowAutoHeight.Visible := False;
    lblDrawMode.Top := lblDrawMode.Top - 15;
    cbxDrawMode.Top := cbxDrawMode.Top - 15;    
  end;
  
  chbxShowBorders.Checked := (gpoBorder in GridReportLink.Options);
  chbxShowHorzLines.Checked := (gpoHorzLines in GridReportLink.Options);
  chbxShowVertLines.Checked := (gpoVertLines in GridReportLink.Options);
  chbxShowFixedHorzLines.Checked := (gpoFixedHorzLines in GridReportLink.Options);
  chbxShowFixedVertLines.Checked := (gpoFixedVertLines in GridReportLink.Options);
  if GridReportLink.IsStringGridLink then 
    chbxRowAutoHeight.Checked := TdxStringGridReportLink(GridReportLink).RowAutoHeight;
  
  cbxDrawMode.ItemIndex := Integer(GridReportLink.DrawMode);

  chbxTransparent.Checked := GridReportLink.Transparent;
  TdxPSColorCombo(FccbxColor).ColorValue := ColorToRGB(GridReportLink.Color);
  TdxPSColorCombo(FccbxEvenColor).ColorValue := ColorToRGB(GridReportLink.EvenColor);
  chbxFixedTransparent.Checked := GridReportLink.FixedTransparent;
  TdxPSColorCombo(FccbxFixedColor).ColorValue := ColorToRGB(GridReportLink.FixedColor);
  TdxPSColorCombo(FccbxGridLineColor).ColorValue := ColorToRGB(GridReportLink.GridLineColor);

  FontInfoToText(GridReportLink.Font, edFont);
  FontInfoToText(GridReportLink.EvenFont, edEvenFont);
  FontInfoToText(GridReportLink.FixedFont, edFixedFont);          
  
  chbxFixedRowsOnEveryPage.Checked := GridReportLink.HeadersOnEveryPage;
  chbxOnlySelected.Checked := GridReportLink.OnlySelected;
  chbxIncludeFixed.Checked := GridReportLink.IncludeFixed;

  chbxUse3DEffects.Checked := GridReportLink.Effects3D;
  chbxUseSoft3D.Checked := GridReportLink.Soft3D;
end;

procedure TdxGridReportLinkDesignWindow.PaintPreview(ACanvas: TCanvas; R: TRect);
const 
  xCount = 6;
  yCount = 8;
  xFixedCount = 1;
  yFixedCount = 1;
  Opaque: array[Boolean] of UINT = (0, ETO_OPAQUE);
  OuterEdge: array[Boolean] of UINT = (0, BDR_RAISEDOUTER);  
  
  function IsFixedCol(ACol: Integer): Boolean;
  begin
    Result := (ACol < xFixedCount);
  end;

  function IsFixedRow(ARow: Integer): Boolean;
  begin
    Result := (ARow < yFixedCount);
  end;
  
  function IsFixedCell(ACol, ARow: Integer): Boolean;
  begin
    Result := IsFixedCol(ACol) or IsFixedRow(ARow);
  end;

  function GetCellSides(ACol, ARow: Integer): TdxCellSides;
  var
    ABeginCol, AEndCol, ABeginRow, AEndRow: Integer;
  begin
    Result := csAll;
    if not GridReportLink.IsDrawBorder then
    begin
      if ACol = 0 then Exclude(Result, csLeft);
      if ACol = xCount - 1 then Exclude(Result, csRight);
      if ARow = 0 then Exclude(Result, csTop);
      if ARow = yCount - 1 then Exclude(Result, csBottom);
    end;
    if IsFixedCell(ACol, ARow) then
    begin
      if not GridReportLink.IsDrawFixedHorzLines then
      begin
        if (ARow > 0) then Exclude(Result, csTop);
        if IsFixedCol(ACol) then 
          if (ARow < yCount - 1) then 
            Exclude(Result, csBottom)
          else
        else
          if (ARow < yFixedCount - Byte(GridReportLink.IsDrawHorzLines)) then 
            Exclude(Result, csBottom);  
      end;
      if not GridReportLink.IsDrawFixedVertLines then 
      begin
        if (ACol > 0) then Exclude(Result, csLeft);
        if IsFixedRow(ARow) then 
          if (ACol < xCount - 1) then 
            Exclude(Result, csRight)
          else
        else
          if (ACol < xFixedCount - Byte(GridReportLink.IsDrawVertLines)) then 
            Exclude(Result, csRight);  
      end;
    end
    else
    begin
      if not GridReportLink.IsDrawHorzLines then 
      begin
        ABeginRow := 0;
        AEndRow := yCount - 1;
        if (ARow < AEndRow) then
          if (ARow > ABeginRow) then 
            Result := Result - [csTop, csBottom]          
          else
            Exclude(Result, csBottom)
        else if (ARow > ABeginRow) then 
          Exclude(Result, csTop);
      end;
      if not GridReportLink.IsDrawVertLines then 
      begin 
        ABeginCol := 0;
        AEndCol := xCount - 1;
        if (ACol < AEndCol) then
          if (ACol > ABeginCol) then 
            Result := Result - [csLeft, csRight]          
          else
            Exclude(Result, csRight)
        else if (ACol > ABeginCol) then 
          Exclude(Result, csLeft)
      end;    
    end;
  end;     
  
var
  R2: TRect;
  DC: hDC;
  I, J, W, H, OffsetX, OffsetY: Integer;
  Sides: TdxCellSides;
  FixedCell: Boolean;
  AColor: TColor;
  AFont: TFont;
  S: string;
  IsTransparent: Boolean;
  APrevBkColor: COLORREF;
  APrevFontColor: COLORREF;
  APrevBkMode: Integer;
  APrevFont: HFONT;
  BorderBrush: HBRUSH;
begin
  DC := ACanvas.Handle;
  FillRect(DC, R, HBRUSH(COLOR_WINDOW + 1));
  InflateRect(R, -5, -5);
  W := (R.Right - R.Left) div xCount;
  H := (R.Bottom - R.Top) div yCount;
  OffsetX := R.Left + (R.Right - R.Left - xCount * W) div 2;
  OffsetY := R.Top + (R.Bottom - R.Top - yCount * H) div 2;
  APrevBkColor := GetBkColor(DC);
  APrevBkMode := GetBkMode(DC);
  APrevFont := GetCurrentObject(DC, OBJ_FONT);
  APrevFontColor := GetTextColor(DC);
  BorderBrush := CreateSolidBrush(ColorToRGB(GridReportLink.GridLineColor));
  for I := 0 to xCount - 1 do 
    for J := 0 to yCount - 1 do 
    begin
      FixedCell := IsFixedCell(I, J);
      IsTransparent := (FixedCell and GridReportLink.FixedTransparent) or 
        (not FixedCell and GridReportLink.Transparent);
      R2 := Bounds(OffsetX + I * W, OffsetY + J * H, W + 1, H + 1);
      Sides := GetCellSides(I, J);
      if not FixedCell or not GridReportLink.Effects3D then 
      begin
        if (csLeft in Sides) then 
          FrameRect(DC, Rect(R2.Left, R2.Top + Byte(not GridReportLink.IsDrawBorder), 
            R2.Left + 1, R2.Bottom), BorderBrush);
        if (csTop in Sides) then 
          FrameRect(DC, Rect(R2.Left + Byte(not GridReportLink.IsDrawBorder), 
            R2.Top, R2.Right, R2.Top + 1), BorderBrush);
        if (csRight in Sides) then 
          FrameRect(DC, Rect(R2.Right - 1, R2.Top + Byte(not GridReportLink.IsDrawBorder), 
            R2.Right, R2.Bottom), BorderBrush);
        if (csBottom in Sides) then 
          FrameRect(DC, Rect(R2.Left + Byte(not GridReportLink.IsDrawBorder), 
            R2.Bottom - 1, R2.Right, R2.Bottom), BorderBrush);
        InflateRect(R2, -1, -1);      
      end  
      else
      begin
        if GridReportLink.IsDrawFixedHorzLines then Inc(R2.Top);
        if GridReportLink.IsDrawFixedVertLines then Inc(R2.Left);
        Windows.DrawEdge(DC, R2, BDR_RAISEDINNER or OuterEdge[not GridReportLink.Soft3D], UINT(Byte(Sides)));
        if (csLeft in Sides) then
          FrameRect(DC, Rect(R2.Left - 1, R2.Top + Byte(not GridReportLink.IsDrawBorder), 
            R2.Left, R2.Bottom), BorderBrush);
        if (csTop in Sides) then 
          FrameRect(DC, Rect(R2.Left + Byte(not GridReportLink.IsDrawBorder), 
            R2.Top - 1, R2.Right, R2.Top), BorderBrush);
        if (csRight in Sides) and (I = xCount - 1) then
          FrameRect(DC, Rect(R2.Right - 1, R2.Top, R2.Right, R2.Bottom), BorderBrush);
        if (csBottom in Sides) and (J = yCount - 1) then
          FrameRect(DC, Rect(R2.Left + Byte(not GridReportLink.IsDrawBorder), 
            R2.Bottom - 1, R2.Right, R2.Bottom), BorderBrush);
        InflateRect(R2, -1 - Byte(not GridReportLink.Soft3D), -1 - Byte(not GridReportLink.Soft3D));
      end;
      
      if not (csBottom in Sides) then Inc(R2.Bottom);
      if not (csRight in Sides) then Inc(R2.Right);      
      
      AColor := clNone;
      if FixedCell then 
      begin
        if not IsTransparent then AColor := GridReportLink.FixedColor;
        AFont := GridReportLink.FixedFont;
      end  
      else 
        case GridReportLink.DrawMode of
          gdmStrict: 
            begin 
              if not IsTransparent then AColor := GridReportLink.Color; 
              AFont := GridReportLink.Font;
            end; 
          gdmOddEven: 
            if Odd(J) then 
            begin 
              if not IsTransparent then AColor := GridReportLink.OddColor;
              AFont := GridReportLink.OddFont;                
            end   
            else
            begin
              if not IsTransparent then AColor := GridReportLink.EvenColor;
              AFont := GridReportLink.EvenFont;
            end;  
        else {gdmChess}
          if not Odd((I - xFixedCount) + (J - yFixedCount)) then 
          begin
            if not IsTransparent then AColor := GridReportLink.OddColor;
            AFont := GridReportLink.OddFont;
          end  
          else 
          begin
            if not IsTransparent then AColor := GridReportLink.EvenColor;
            AFont := GridReportLink.EvenFont;
          end;  
        end;
        
      if not IsTransparent then
        SetBkColor(DC, ColorToRGB(AColor))
      else  
        SetBkMode(DC, Windows.TRANSPARENT);
      FPreviewFont.Assign(AFont);
      FPreviewFont.Size := 8;
      SetTextColor(DC, ColorToRGB(FPreviewFont.Color));
      SelectObject(DC, FPreviewFont.Handle);
      S := sdxGridStrings[I, J];
      ExtTextOut(DC, R2.Left + 2, R2.Top + 2, ETO_CLIPPED or Opaque[not IsTransparent], 
        @R2, PChar(S), Length(S), nil);
    end;
  DeleteObject(BorderBrush);
  SetTextColor(DC, APrevFontColor);
  SelectObject(DC, APrevFont);
  SetBkColor(DC, APrevBkColor);
  SetBkMode(DC, APrevBkMode);
end;

procedure TdxGridReportLinkDesignWindow.pbxPreviewPaint(Sender: TObject);
begin
  with TdxPSPaintPanel(Sender) do
    PaintPreview(Canvas, ClientRect);
end;

procedure TdxGridReportLinkDesignWindow.UpdatePreview;
begin
  FPreviewBox.Invalidate;
end;
  
procedure TdxGridReportLinkDesignWindow.ccbxColorChange(Sender: TObject);
var
  AColor: TColor;
begin
  if LockControlsUpdate then Exit;
  AColor := TdxPSColorCombo(Sender).ColorValue;
  case TdxPSColorCombo(Sender).Tag of
    0: GridReportLink.Color := AColor;
    1: GridReportLink.EvenColor := AColor;
    2: GridReportLink.FixedColor := AColor;
    3: GridReportLink.GridLineColor := AColor;
  end;
  Modified := True;
  UpdatePreview;
end;

procedure TdxGridReportLinkDesignWindow.btnFontClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  case TButton(Sender).Tag of
    0: FD.Font := GridReportLink.Font;
    1: FD.Font := GridReportLink.EvenFont;
    2: FD.Font := GridReportLink.FixedFont;
  end;
  if (dxPrintDevice.Printers.Count > 0) then
    FD.Device := fdPrinter
  else
    FD.Device := fdScreen;
  if FD.Execute then
  begin
    case TButton(Sender).Tag of
      0:
        begin
          GridReportLink.Font := FD.Font;
          FontInfoToText(GridReportLink.Font, edFont);
        end;
      1:
        begin
          GridReportLink.EvenFont := FD.Font;
          FontInfoToText(GridReportLink.EvenFont, edEvenFont);
        end;
      2:
        begin
          GridReportLink.FixedFont := FD.Font;
          FontInfoToText(GridReportLink.FixedFont, edFixedFont);          
        end;
    end;
    Modified := True;
    UpdatePreview;
  end;
end;

procedure TdxGridReportLinkDesignWindow.chbxRowAutoHeightClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  if GridReportLink.IsStringGridLink then 
    TdxStringGridReportLink(GridReportLink).RowAutoHeight := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxGridReportLinkDesignWindow.cbxDrawModeChange(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  GridReportLink.DrawMode := TdxGridDrawMode(TComboBox(Sender).ItemIndex);
  Modified := True;
  UpdatePreview;  
end;

procedure TdxGridReportLinkDesignWindow.chbxOnlySelectedClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  GridReportLink.OnlySelected := TCheckBox(Sender).checked;
  Modified := True;
end;

procedure TdxGridReportLinkDesignWindow.chbxIncludeFixedClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  GridReportLink.IncludeFixed := TCheckBox(Sender).checked;
  Modified := True;
end;

procedure TdxGridReportLinkDesignWindow.chbxUse3DEffectsClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  GridReportLink.Effects3D := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview;
end;

procedure TdxGridReportLinkDesignWindow.chbxUseSoft3DClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  GridReportLink.Soft3D := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview;
end;

procedure TdxGridReportLinkDesignWindow.chbxShowBordersClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  with TCheckBox(Sender) do
    if Checked then
      GridReportLink.Options := GridReportLink.Options + [TdxGridPaintOption(Tag)]
    else
      GridReportLink.Options := GridReportLink.Options - [TdxGridPaintOption(Tag)];
  Modified := True;
  UpdatePreview;
end;

procedure TdxGridReportLinkDesignWindow.chbxFixedRowsOnEveryPageClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  GridReportLink.HeadersOnEveryPage := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxGridReportLinkDesignWindow.chbxTransparentClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  case TCheckBox(Sender).Tag of
    0: GridReportLink.Transparent := TCheckBox(Sender).checked;
    1: GridReportLink.FixedTransparent := TCheckBox(Sender).checked;
  end;
  Modified := True;
  UpdatePreview;
end;

procedure TdxGridReportLinkDesignWindow.lblColorClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TCustomComboBox(ActiveControl).DroppedDown := True;
end;

initialization
  dxPSRegisterReportLink(TdxStringGridReportLink, TStringGrid, TdxGridReportLinkDesignWindow);
  dxPSRegisterReportLink(TdxDrawGridReportLink, TDrawGrid, TdxGridReportLinkDesignWindow);  

finalization
  dxPSUnRegisterReportLink(TdxDrawGridReportLink, TDrawGrid, TdxGridReportLinkDesignWindow);  
  dxPSUnRegisterReportLink(TdxStringGridReportLink, TStringGrid, TdxGridReportLinkDesignWindow);

end.

