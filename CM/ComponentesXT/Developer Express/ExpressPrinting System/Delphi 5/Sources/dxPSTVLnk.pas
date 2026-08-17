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

unit dxPSTVLnk;

interface

{$I dxPSVer.inc}

uses
  Classes, Windows, Messages, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, {$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxPSCore, dxPSGlbl;

type
  TdxTreeViewPaintOption = (tvpoBorder, tvpoGrid, tvpoStateImages, tvpoImages);
  TdxTreeViewPaintOptions = set of TdxTreeViewPaintOption;
  
  TdxTVCustomDrawNodeEvent = procedure(Sender: TBasedxReportLink; ANode: TTreeNode; 
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var AText: string; 
    AFont: TFont; var AColor: TColor; var ATextAlignX: TdxTextAlignX; 
    var ATextAlignY: TdxTextAlignY; var ADone: Boolean) of object;

  TCustomdxTreeViewReportLink = class(TBasedxReportLink)
  private
    FAutoNodesExpand: Boolean;
    FAutoWidth: Boolean;
    FExpandLevel: Integer;
    FGridLineColor: TColor;
    FNodeAutoHeight: Boolean;
    FOptions: TdxTreeViewPaintOptions;
    FSupportedCustomDraw: Boolean;
    FWidth: Integer;
    FOnCustomDrawNode: TdxTVCustomDrawNodeEvent;
    
    FCustomDrawFontChanged: Boolean;
    FIndent: Integer;
    FNodeHeight: Integer;
    FNodeHeights: TList;
    FNodeList: TList;
    FRealWidth: Integer;
    FSaveFont: TFont;    

    function GetOptions: TdxTreeViewPaintOptions;
    function GetTreeView: TTreeView;
    function IsWidthStored: Boolean;
    procedure SetAutoNodesExpand(Value: Boolean);
    procedure SetAutoWidth(Value: Boolean);
    procedure SetExpandLevel(Value: Integer);
    procedure SetGridLineColor(Value: TColor);
    procedure SetNodeAutoHeight(Value: Boolean);
    procedure SetOptions(Value: TdxTreeViewPaintOptions);
    procedure SetSupportedCustomDraw(Value: Boolean);
    procedure SetWidth(Value: Integer);

    procedure CustomDrawFontChanged(Sender: TObject);    
    function GetCellSides(ANode: TTreeNode): TdxCellSides;
    function GetNodeHeight(Index: Integer): Integer;    
    function IsDrawBorder: Boolean;
    function IsDrawGrid: Boolean;
    function CanDrawImages: Boolean;
    function CanDrawStateImages: Boolean;
    function IsDrawImages(ANode: TTreeNode): Boolean;
    function IsDrawStateImages(ANode: TTreeNode): Boolean;
    function IsFirstNode(ANode: TTreeNode): Boolean;
    function IsLastNode(ANode: TTreeNode): Boolean;
  protected
    procedure AssignData(ANode: TTreeNode; ADataItem: TAbstractdxReportCellData); virtual;    
    procedure ConstructReport(AReportCells: TdxReportCells); override;  
    procedure InternalRestoreDefaults; override;
    function IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean; override;    
    procedure MakeDelimiters(AReportCells: TdxReportCells; AHorzDelimiters, 
      AVertDelimiters: TList); override;
    procedure PrepareContruct; virtual;
    procedure UnprepareContruct; virtual;

    { custom draw support }
    procedure CustomDraw(AItem: TAbstractdxReportCellData; ACanvas: TCanvas; 
      ABoundsRect, AClientRect: TRect; var ADone: Boolean); override;
    procedure DoCustomDrawNode(ANode: TTreeNode; ACanvas: TCanvas; 
      ABoundsRect, AClientRect: TRect; var AText: string; AFont: TFont; 
      var AColor: TColor; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
      var ADone: Boolean); virtual;
      
    property TreeView: TTreeView read GetTreeView;
    property OnCustomDrawNode: TdxTVCustomDrawNodeEvent read FOnCustomDrawNode 
      write FOnCustomDrawNode;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    property AutoNodesExpand: Boolean read FAutoNodesExpand write SetAutoNodesExpand
      default False;
    property AutoWidth: Boolean read FAutoWidth write SetAutoWidth
      default True;
    property ExpandLevel: Integer read FExpandLevel write SetExpandLevel
      default -1;
    property GridLineColor: TColor read FGridLineColor write SetGridLineColor
      default clBlack;
    property Options: TdxTreeViewPaintOptions read GetOptions write SetOptions
      default [tvpoStateImages, tvpoImages];
    property NodeAutoHeight: Boolean read FNodeAutoHeight write SetNodeAutoHeight
      default False;
    property ScaleFonts;
    property SupportedCustomDraw: Boolean read FSupportedCustomDraw write SetSupportedCustomDraw
      default False;
    property Width: Integer read FWidth write SetWidth
      stored IsWidthStored;
  end;

  TdxTreeViewReportLink = class(TCustomdxTreeViewReportLink)
  public
    property TreeView;
  published
    property AutoNodesExpand;
    property AutoWidth;
    property Color;
    property ExpandLevel;
    property Font;
    property GridLineColor;
    property Options;
    property ScaleFonts;
    property SupportedCustomDraw;
    property Transparent;
    property UseVertDelimiters;
    property Width;
    
    property OnCustomDrawNode;
  end;

  TdxTVReportLinkDesignWindow = class(TAbstractdxReportLinkDesignWindow)
    PageControl1: TPageControl;
    tshOptions: TTabSheet;
    pnlOptions: TPanel;
    tshColors: TTabSheet;
    pnlColor: TPanel;
    lblGridLinesColor: TLabel;
    bvlLineColorHolder: TBevel;
    gbxTransparent: TGroupBox;
    lblColor: TLabel;
    bvlColorHolder: TBevel;
    chbxTransparent: TCheckBox;
    tshFonts: TTabSheet;
    pnlFont: TPanel;
    btnFont: TButton;
    edFont: TEdit;
    FD: TFontDialog;
    pnlPreview: TPanel;
    lblPreview: TStaticText;
    Panel10: TPanel;
    ilPreview: TImageList;
    lblShow: TLabel;
    chbxShowBorders: TCheckBox;
    Bevel11: TBevel;
    chbxShowGrid: TCheckBox;
    chbxShowStateImages: TCheckBox;
    chbxShowImages: TCheckBox;
    Bevel1: TBevel;
    tshBehaviors: TTabSheet;
    pnlBehaviors: TPanel;
    lblExpanding: TLabel;
    Bevel13: TBevel;
    chbxAutoNodesExpand: TCheckBox;
    bvlExpandLevelHolder: TBevel;
    lblExpandLevel: TLabel;
    lblMiscellaneous: TLabel;
    chbxNodeAutoHeight: TCheckBox;
    Image4: TImage;
    chbxAutoWidth: TCheckBox;
    procedure btnFontClick(Sender: TObject);
    procedure chbxTransparentClick(Sender: TObject);
    procedure lblExpandLevelClick(Sender: TObject);
    procedure lblColorClick(Sender: TObject);    
    procedure chbxAutoNodesExpandClick(Sender: TObject);
    procedure chbxNodeAutoHeightClick(Sender: TObject);
    procedure chbxShowBordersClick(Sender: TObject);
    procedure chbxAutoWidthClick(Sender: TObject);
  private
    FccbxColor: TCustomComboBox;
    FccbxGridLineColor: TCustomComboBox;
    FseExpandLevel: TCustomEdit;
    FPreviewBox: TCustomControl;
    FPreviewFont: TFont;
    procedure ccbxColorChange(Sender: TObject);
    procedure CreateControls;
    procedure ExpandLevelChange(Sender: TObject);
    function GetTreeViewReportLink: TdxTreeViewReportLink;
    procedure pbxPreviewPaint(Sender: TObject);
    procedure CMDialogChar(var message: TCMDialogChar); message CM_DIALOGCHAR;
  protected
    procedure DoInitialize; override;
    procedure LoadStrings; override;
    procedure PaintPreview(ACanvas: TCanvas; R: TRect); override;
    procedure UpdateControlsState; override;
    procedure UpdatePreview; override;
  public
    constructor Create(AOwner: TComponent); override;    
    destructor Destroy; override;
    property TreeViewReportLink: TdxTreeViewReportLink read GetTreeViewReportLink;
  end;

const
  dxDefaultTreeViewPaintOptions: TdxTreeViewPaintOptions = [tvpoStateImages, tvpoImages];
  
  sdxTVStrings: array[0..5] of string =
    ('Technical Department', 'Software Department', 'System Programmers',
    'EndUser Programmers', 'Beta Testers', 'Human Resource Department');

implementation

{$R *.DFM}

uses
  dxPSRes, SysUtils, dxPrnDev, dxPSUtl, dxExtCtrls;

const
  dxDefaultTVLinkWidth = 400;
  
{ TCustomdxTreeViewReportLink }

constructor TCustomdxTreeViewReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InternalRestoreDefaults;    
  LinkModified(False);
  FNodeList := TList.Create;
  FSaveFont := TFont.Create;
  FSaveFont.OnChange := CustomDrawFontChanged;
end;

destructor TCustomdxTreeViewReportLink.Destroy;
begin
  FSaveFont.Free;
  FNodeList.Free;
  inherited Destroy;
end;

procedure TCustomdxTreeViewReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TCustomdxTreeViewReportLink) then
  begin
    AutoNodesExpand := TCustomdxTreeViewReportLink(Source).AutoNodesExpand;
    AutoWidth := TCustomdxTreeViewReportLink(Source).AutoWidth;
    ExpandLevel := TCustomdxTreeViewReportLink(Source).ExpandLevel;
    GridLineColor := TCustomdxTreeViewReportLink(Source).GridLineColor;
    Options := TCustomdxTreeViewReportLink(Source).Options;
    SupportedCustomDraw := TCustomdxTreeViewReportLink(Source).SupportedCustomDraw;    
    Width := TCustomdxTreeViewReportLink(Source).Width;
  end;
end;

procedure TCustomdxTreeViewReportLink.SetAutoNodesExpand(Value: Boolean);
begin
  if (FAutoNodesExpand <> Value) then
  begin
    FAutoNodesExpand := Value;
    LinkModified(True);
  end; 
end;

procedure TCustomdxTreeViewReportLink.SetSupportedCustomDraw(Value: Boolean);
begin
  if (FSupportedCustomDraw <> Value) then
  begin
    FSupportedCustomDraw := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeViewReportLink.SetExpandLevel(Value: Integer);
begin
  if (FExpandLevel <> Value) then
  begin
    if (Value < -1) then Value := -1;
    FExpandLevel := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeViewReportLink.PrepareContruct;
const
  CalcFormat = DT_CALCRECT or DT_WORDBREAK or DT_LEFT or DT_TOP or DT_EXPANDTABS;
var
  APrevFont: HFONT;
  ANode: TTreeNode;
  ASize: TSize;
  I, H, W: Integer;
  S: string;
  R: TRect;
  DC: hDC;  
begin
  FIndent := 19;
  if TreeView.HandleAllocated then
    SendMessage(TreeView.Handle, WM_SETREDRAW, 0, 0);
  DC := GetDC(0);
  try
    APrevFont := SelectObject(DC, Font.Handle);
    GetTextExtentPoint32(DC, 'Wg', Length('Wg'), ASize);
    FNodeHeight := ASize.cY + 6;
    if CanDrawStateImages then
      if (FNodeHeight < TreeView.StateImages.Height + 2) then
        FNodeHeight := TreeView.StateImages.Height + 2;
    if CanDrawImages then
      if (FNodeHeight < TreeView.Images.Height + 2) then
        FNodeHeight := TreeView.Images.Height + 2;
    if AutoWidth then 
      FRealWidth := 0
    else 
      if NodeAutoHeight then 
      begin
        FRealWidth := TreeView.Width;      
        FNodeHeights := TList.Create;
        FNodeHeights.Capacity := FNodeList.Count;
        for I := 0 to FNodeList.Count - 1 do
        begin
          ANode := FNodeList.List^[I];
          W := FRealWidth - (ANode.Level + 1) * FIndent;
          if CanDrawStateImages then Dec(W, TreeView.StateImages.Width + 2);
          if CanDrawImages then Dec(W, TreeView.Images.Width + 2);
          R := Rect(0, 0, W, 0);
          S := ANode.Text;
          H := Windows.DrawText(DC, PChar(S), Length(S), R, CalcFormat);
          if (H < FNodeHeight) then H := FNodeHeight;
          FNodeHeights.Add(Pointer(H));
        end;
      end  
      else
        FRealWidth := Self.Width;
    SelectObject(DC, APrevFont);
  finally
    ReleaseDC(0, DC);  
  end;
end;

procedure TCustomdxTreeViewReportLink.UnPrepareContruct;
begin
  if Assigned(FNodeHeights) then FNodeHeights.Free;
  FNodeHeights := nil;
  if TreeView.HandleAllocated then
    SendMessage(TreeView.Handle, WM_SETREDRAW, 1, 0);
  TreeView.Invalidate;
end;

function TCustomdxTreeViewReportLink.GetTreeView: TTreeView;
begin
  Result := TTreeView(Component);
end;

function TCustomdxTreeViewReportLink.GetNodeHeight(Index: Integer): Integer;
begin
  if (FNodeHeights <> nil) then 
    Result := Integer(FNodeHeights.List^[Index])
  else 
    Result := FNodeHeight;
end;

function TCustomdxTreeViewReportLink.IsWidthStored: Boolean;
begin
  Result := not AutoWidth;
end;

procedure TCustomdxTreeViewReportLink.SetAutoWidth(Value: Boolean);
begin
  if (FAutoWidth <> Value) then 
  begin
    FAutoWidth := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeViewReportLink.SetWidth(Value: Integer);
begin
  if (FWidth <> Value) then 
  begin
    FWidth := Value;
    if not AutoWidth then LinkModified(True);
  end;
end;

function TCustomdxTreeViewReportLink.IsDrawBorder: Boolean;
begin
  Result := (tvpoBorder in Options);
end;

function TCustomdxTreeViewReportLink.IsDrawGrid: Boolean;
begin
  Result := (tvpoGrid in Options);
end;

function TCustomdxTreeViewReportLink.CanDrawStateImages: Boolean;
begin
  Result := (tvpoStateImages in Options) and Assigned(TreeView.StateImages);
end;

function TCustomdxTreeViewReportLink.CanDrawImages: Boolean;
begin
  Result := (tvpoImages in Options) and Assigned(TreeView.Images);
end;

function TCustomdxTreeViewReportLink.IsDrawImages(ANode: TTreeNode): Boolean;
begin
  Result := CanDrawImages and (ANode.ImageIndex > -1) and 
    (ANode.ImageIndex < TreeView.Images.Count);
end;

function TCustomdxTreeViewReportLink.IsDrawStateImages(ANode: TTreeNode): Boolean;
begin
  Result := CanDrawStateImages and (ANode.StateIndex > -1) and 
    (ANode.StateIndex < TreeView.StateImages.Count);
end;

procedure TCustomdxTreeViewReportLink.SetNodeAutoHeight(Value: Boolean);
begin
  if (FNodeAutoHeight <> Value) then
  begin
    FNodeAutoHeight := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeViewReportLink.SetGridLineColor(Value: TColor);
begin
  if (FGridLineColor <> Value) then
  begin
    FGridLineColor := Value;
    LinkModified(True);
  end;
end;

function TCustomdxTreeViewReportLink.GetOptions: TdxTreeViewPaintOptions;
begin
  Result := FOptions;
end;

procedure TCustomdxTreeViewReportLink.SetOptions(Value: TdxTreeViewPaintOptions);
begin
  if (FOptions <> Value) then
  begin
    FOptions := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeViewReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  FAutoNodesExpand := False;
  FAutoWidth := True;
  FExpandLevel := -1;
  FGridLineColor := dxDefaultGridlineColor;
  FNodeAutoHeight := False;
  FOptions := dxDefaultTreeViewPaintOptions;
  FSupportedCustomDraw := False;
  FWidth := dxDefaultTVLinkWidth;
end;

procedure TCustomdxTreeViewReportLink.CustomDrawFontChanged(Sender: TObject);
begin
  FCustomDrawFontChanged := True;
end;

function TCustomdxTreeViewReportLink.IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean;
begin
  Result := SupportedCustomDraw and Assigned(FOnCustomDrawNode);
end;

procedure TCustomdxTreeViewReportLink.CustomDraw(AItem: TAbstractdxReportCellData;
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var ADone: Boolean);
var
  AColor: TColor;
  AText: string;
  ATextAlignX: TdxTextAlignX;
  ATextAlignY: TdxTextAlignY;
begin
  if (AItem.Data = 0) then Exit;
  with TdxReportCellString(AItem) do
  begin
    ParentColor := False;
    AColor := ColorToRGB(Color);
    if Transparent then AColor := clNone;    
    FSaveFont.Assign(Font);
    FCustomDrawFontChanged := False;
    AText := Text;
    ATextAlignX := TextAlignX;
    ATextAlignY := TextAlignY;
    DoCustomDrawNode(TTreeNode(Data), ACanvas, ABoundsRect, AClientRect, AText, 
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
        Color := AColor;
        Transparent := False;
      end;
      Text := AText;
      TextAlignX := ATextAlignX;
      TextAlignY := ATextAlignY;
    end;
  end;
end;

procedure TCustomdxTreeViewReportLink.DoCustomDrawNode(ANode: TTreeNode; 
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var AText: string; AFont: TFont; 
  var AColor: TColor;  var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
  var ADone: Boolean);
begin
  FOnCustomDrawNode(Self, ANode, ACanvas, ABoundsRect, AClientRect, AText, AFont, 
    AColor, ATextAlignX, ATextAlignY, ADone);
end;
    
procedure TCustomdxTreeViewReportLink.MakeDelimiters(AReportCells: TdxReportCells;
  AHorzDelimiters, AVertDelimiters: TList);
var
  I: Integer;
begin
  inherited MakeDelimiters(AReportCells, AHorzDelimiters, AVertDelimiters);
  if UseVertDelimiters then 
    with AReportCells, Cells do
      for I := 1 to CellCount - 2 do
        AVertDelimiters.Add(Pointer(Cells[I].BoundsRect.Bottom));
end;

function TCustomdxTreeViewReportLink.GetCellSides(ANode: TTreeNode): TdxCellSides;
var
  IsAnyImagesExists: Boolean;
begin
  Result := [];
  IsAnyImagesExists := IsDrawImages(ANode) or IsDrawStateImages(ANode);
  if IsDrawGrid then
  begin
    if not IsFirstNode(ANode) or IsDrawBorder then 
      Include(Result, csTop);
    if not IsLastNode(ANode) or IsDrawBorder then 
      Include(Result, csBottom);    
    if IsDrawBorder and (ANode.Level = 0) and not IsAnyImagesExists then 
      Include(Result, csLeft);        
  end;
  if IsDrawBorder then
  begin
    Include(Result, csRight);
    if (ANode.Level = 0) and not IsAnyImagesExists then 
      Include(Result, csLeft);        
    if IsFirstNode(ANode) then 
      Include(Result, csTop);    
    if IsLastNode(ANode) then 
      Include(Result, csBottom);        
  end;
end;

procedure TCustomdxTreeViewReportLink.AssignData(ANode: TTreeNode; ADataItem: TAbstractdxReportCellData);
begin
  ADataItem.Data := Integer(ANode);
  ADataItem.CellSides := GetCellSides(ANode);
  ADataItem.Transparent := Transparent;
  TdxReportCellString(ADataItem).Text := ANode.Text;
  TdxReportCellString(ADataItem).Multiline := NodeAutoHeight and not AutoWidth;
end;

function TCustomdxTreeViewReportLink.IsFirstNode(ANode: TTreeNode): Boolean;
begin
  Result := ANode = FNodeList.First;
end;

function TCustomdxTreeViewReportLink.IsLastNode(ANode: TTreeNode): Boolean;
begin
  Result := ANode = FNodeList.Last;
end;

procedure TCustomdxTreeViewReportLink.ConstructReport(AReportCells: TdxReportCells);
var
  ALevel, ALeft, W: Integer;
  
  procedure ProcessNode(ANode: TTreeNode; Index: Integer);
  var
    I, V: Integer;
    ACell: TdxReportCell;
    PrevSibl: TdxReportVisualItem;
    ADataItem: TAbstractdxReportCellData;
  begin
    ACell := TdxReportCell.Create(AReportCells.Cells);
    with ACell do
    begin
      Transparent := Self.Transparent;
      PrevSibl := TdxReportVisualItem(GetPrevSibling);
      V := 0;
      if Assigned(PrevSibl) then 
        V := PrevSibl.BoundsRect.Bottom;
      BoundsRect := Bounds(0, V, FRealWidth, GetNodeHeight(Index));
      CellSides := [];
      if IsDrawBorder then
      begin
        CellSides := CellSides + [csLeft, csRight];
        if IsFirstNode(ANode) then
          CellSides := CellSides + [csTop];
        if IsLastNode(ANode) then
          CellSides := CellSides + [csBottom];
      end;
    end;

    ALevel := ANode.Level - 1;
    for I := 0 to ALevel do
    begin
      ADataItem := TAbstractdxReportCellData.Create(ACell);
      with ADataItem do
      begin
        PrevSibl := TdxReportVisualItem(GetPrevSibling);
        V := 0;
        if Assigned(PrevSibl) then V := PrevSibl.BoundsRect.Right;
        BoundsRect := Bounds(V, 0, FIndent + 1, Parent.Height);
        CellSides := [];
        if IsDrawGrid then
        begin
          if (I = 0) then
            if IsDrawBorder then
              CellSides := CellSides + [csLeft]
            else
          else
            CellSides := CellSides + [csRight, csLeft];
{2.0}     if (I = ALevel) or ((ANode.Parent = nil) and (not IsFirstNode(ANode) or IsDrawBorder)) then
            CellSides := CellSides + [csTop];
          if (ANode.Count = 0) or (not ANode.Expanded and not AutoNodesExpand) then
            if (I = ALevel) then
            begin
              if not IsFirstNode(ANode) or IsDrawBorder then
                CellSides := CellSides + [csTop];
              if not IsLastNode(ANode) or IsDrawBorder then
                CellSides := CellSides + [csBottom];
            end
            else if not Assigned(ANode.Parent) or (ANode.Index = ANode.Parent.Count - 1) then 
              CellSides := CellSides + [csBottom];
        end;
        
        if IsDrawBorder then
        begin
          if (I = 0) then
            CellSides := CellSides + [csLeft];
          if IsFirstNode(ANode) then
            CellSides := CellSides + [csTop];
          if IsLastNode(ANode) then
            CellSides := CellSides + [csBottom];
        end;
      end;
    end;
    ALeft := ANode.Level * (FIndent + 1);

    {state images}
    if IsDrawStateImages(ANode) then
    begin
      ADataItem := TdxReportCellGraphic.Create(ACell);
      with TdxReportCellGraphic(ADataItem) do
      begin
        CellSides := [];
        if IsDrawBorder then
        begin
          if (ANode.Level = 0) then
            CellSides := CellSides + [csLeft];
          if IsFirstNode(ANode) then
            CellSides := CellSides + [csTop];
          if IsLastNode(ANode) then
            CellSides := CellSides + [csBottom];
        end;
        if IsDrawGrid then
        begin
          if not IsFirstNode(ANode) or IsDrawBorder then
            CellSides := CellSides + [csTop];
          if not IsLastNode(ANode) or IsDrawBorder then
            CellSides := CellSides + [csBottom];
        end;
        DrawMode := gdmCenter;
        Transparent := True;
        W := TreeView.StateImages.Width + 2;
        if (W < FIndent + 1) then W := FIndent + 1;
        BoundsRect := Bounds(ALeft, 0, W, Parent.Height);
        Inc(ALeft, W);
        ImageList := TreeView.StateImages;
        ImageIndex := ANode.StateIndex;
      end;
    end;

    {images}
    if IsDrawImages(ANode) then
    begin
      ADataItem := TdxReportCellGraphic.Create(ACell);
      with TdxReportCellGraphic(ADataItem) do
      begin
        CellSides := [];
        if IsDrawBorder then
        begin
          if (ANode.Level = 0) and not IsDrawStateImages(ANode) then
            CellSides := CellSides + [csLeft];
          if IsFirstNode(ANode) then
            CellSides := CellSides + [csTop];
          if IsLastNode(ANode) then
            CellSides := CellSides + [csBottom];
        end;
        if IsDrawGrid then
        begin
          if not IsFirstNode(ANode) or IsDrawBorder then
            CellSides := CellSides + [csTop];
          if not IsLastNode(ANode) or IsDrawBorder then
            CellSides := CellSides + [csBottom];
        end;
        Transparent := True;
        DrawMode := gdmCenter;
        W := TreeView.Images.Height + 2;
        if (W < FIndent + 1) then W := FIndent + 1;
        BoundsRect := Bounds(ALeft, 0, W, Parent.Height);
        Inc(ALeft, W);
        ImageList := TreeView.Images;
        ImageIndex := ANode.ImageIndex;
      end;
    end;

    ADataItem := TdxReportCellString.Create(ACell);
    ADataItem.BoundsRect := Rect(ALeft, 0, FRealWidth, ADataItem.Parent.Height);
    AssignData(ANode, ADataItem);
  end;

  function GetRealWidth: Integer;
  var
    W, I: Integer;
    ASize: TSize;
    Item: TdxReportVisualItem;
    APrevFont: HFONT;
    ANode: TTreeNode;
    DC: hDC;
  begin
    Result := 0;
    DC := GetDC(0);
    try
      APrevFont := SelectObject(DC, Font.Handle);
      for I := 0 to AReportCells.Cells.CellCount - 1 do
      begin
        W := 0;
        ANode := TTreeNode(FNodeList.List[I]);
        Inc(W, ANode.Level * FIndent);
        if IsDrawStateImages(ANode) then 
          Inc(W, TreeView.StateImages.Width + 2);
        if IsDrawImages(ANode) then 
          Inc(W, TreeView.Images.Width + 2);
        with AReportCells.Cells[I] do
          Item := DataItems[DataItemCount - 1];
        with TdxReportCellString(Item) do 
          GetTextExtentPoint32(DC, PChar(Text), Length(Text), ASize);
        Inc(W, ASize.cX + 10);
        if (W > Result) then Result := W;
      end;
      SelectObject(DC, APrevFont);
    finally
      ReleaseDC(0, DC);
    end;  
  end;

  procedure AdjustCellsWidth;
  var
    I: Integer;
    Item: TdxReportVisualItem;
  begin
    FRealWidth := GetRealWidth;
    for I := 0 to AReportCells.Cells.CellCount - 1 do
    begin
      Item := AReportCells.Cells[I];
      Item.Width := FRealWidth;
      with TdxReportCell(Item) do
        Item := DataItems[DataItemCount - 1];
      with Item, BoundsRect do
        BoundsRect := Rect(Left, Top, FRealWidth, Bottom);
    end;
  end;

  procedure AddNodes;
  
    procedure AddNode(ANode: TTreeNode);
    var
      I: Integer;
    begin
      FNodeList.Add(ANode);
      if ANode.Expanded or AutoNodesExpand then
        for I := 0 to ANode.Count - 1 do
          if (ExpandLevel = -1) or (ANode.Level < ExpandLevel) then
            AddNode(ANode[I]);
    end;
    
  var
    Node: TTreeNode;
  begin
    FNodeList.Clear;
    if TreeView.Items.Count = 0 then Exit;
    Node := TreeView.Items[0];
    while (Node <> nil) do 
    begin
      AddNode(Node);
      Node := Node.GetNextSibling;
    end;  
  end;

  procedure IterateNodes;
  var
    I: Integer;
  begin
    with FNodeList do 
      for I := 0 to Count - 1 do
      begin
        ProcessNode(TTreeNode(List^[I]), I);
        AReportCells.DoProgress(MulDiv(I, 100, Count));
      end;
  end;
  
begin
  if TreeView = nil then Exit;
  inherited ConstructReport(AReportCells);
  AddNodes;
  if FNodeList.Count = 0 then Exit;  
  
  AReportCells.Cells.FontIndex := 0;
  AReportCells.Cells.Transparent := Transparent;
  AReportCells.Cells.Color := Color;
  AReportCells.BorderColor := GridLineColor;
  PrepareContruct;
  try
    IterateNodes;
    if AutoWidth then AdjustCellsWidth;
  finally
    UnPrepareContruct;
  end;
  with AReportCells, Cells do
    BoundsRect := Rect(0, 0, FRealWidth, LastCell.BoundsRect.Bottom);
end;


{ TdxTVReportLinkDesignWindow }

constructor TdxTVReportLinkDesignWindow.Create(AOwner: TComponent);
begin
  HelpContext := dxhcTreeViewReportLinkDesigner;
  inherited Create(AOwner);
  CreateControls;
  PageControl1.ActivePage := PageControl1.Pages[0];
  FPreviewFont := TFont.Create;
end;

destructor TdxTVReportLinkDesignWindow.Destroy;
begin
  FPreviewFont.Free;
  inherited Destroy;
end;

procedure TdxTVReportLinkDesignWindow.CMDialogChar(var message: TCMDialogChar);
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

procedure TdxTVReportLinkDesignWindow.DoInitialize;
begin
  inherited DoInitialize;
  chbxShowBorders.Checked := TreeViewReportLink.IsDrawBorder;
  chbxShowGrid.Checked := TreeViewReportLink.IsDrawGrid;  
  chbxShowStateImages.Checked := tvpoStateImages in TreeViewReportLink.Options;
  chbxShowImages.Checked := tvpoImages in TreeViewReportLink.Options;
 
  chbxTransparent.Checked := TreeViewReportLink.Transparent;
  TdxPSColorCombo(FccbxColor).ColorValue := ColorToRGB(TreeViewReportLink.Color);
  TdxPSColorCombo(FccbxGridLineColor).ColorValue := ColorToRGB(TreeViewReportLink.GridLineColor);
  
  FontInfoToText(TreeViewReportLink.Font, edFont);

  chbxAutoWidth.Checked := TreeViewReportLink.AutoWidth;
  chbxNodeAutoHeight.Checked := TreeViewReportLink.NodeAutoHeight;
    
  chbxAutoNodesExpand.Checked := TreeViewReportLink.AutoNodesExpand;
  TdxPSSpinEdit(FseExpandLevel).Value := TreeViewReportLink.ExpandLevel;
end;

procedure TdxTVReportLinkDesignWindow.UpdateControlsState;
begin
  inherited UpdateControlsState;
  chbxNodeAutoHeight.Enabled := not chbxAutoWidth.Checked;
  FccbxColor.Enabled := not chbxTransparent.Checked;
  lblColor.Enabled := not chbxTransparent.Checked;
  FseExpandLevel.Enabled := chbxAutoNodesExpand.Checked;
end;

procedure TdxTVReportLinkDesignWindow.PaintPreview(ACanvas: TCanvas; R: TRect);
const
  C: Integer = 6;
  uFlags: UINT = DT_LEFT or DT_VCENTER or DT_SINGLELINE;
var
  BR: TRect;
  ALeft, H: Integer;
  APrevMode: Integer;
  APrevColor: COLORREF;
  APrevFont: HFONT;
  DC: hDC;
  ABorderBrush: HBRUSH;
  AFillBrush: HBRUSH;
  S: string;
begin
  ABorderBrush := CreateSolidBrush(ColorToRGB(TreeViewReportLink.GridLineColor));
  BR := R;
  OffsetRect(BR, -BR.Left, -BR.Top);
  InflateRect(BR, -3, -3);
  H := (BR.Bottom - BR.Top) div C;
  BR.Bottom := BR.Top + H * C + 1;
  DC := ACanvas.Handle;
  if TreeViewReportLink.IsDrawBorder and RectVisible(DC, BR) then
    FrameRect(DC, BR, ABorderBrush);
  if not TreeViewReportLink.Transparent then
  begin
    if TreeViewReportLink.IsDrawBorder then InflateRect(BR, -1, -1);
    if RectVisible(DC, BR) then  
    begin
      AFillBrush := CreateSolidBrush(ColorToRGB(TreeViewReportLink.Color));
      FillRect(DC, BR, AFillBrush);
      DeleteObject(AFillBrush);
    end;  
    if TreeViewReportLink.IsDrawBorder then InflateRect(BR, 1, 1);
  end;
  ALeft := 0;
  {lines}
  if TreeViewReportLink.IsDrawGrid then
  begin
    {horz}
    FillRect(DC, Rect(BR.Left, BR.Top + H, BR.Right, BR.Top + H + 1), ABorderBrush);
    FillRect(DC, Rect(BR.Left + H, BR.Top + 2 * H, BR.Right, BR.Top + 2 * H + 1), ABorderBrush);
    FillRect(DC, Rect(BR.Left + H, BR.Top + 3 * H, BR.Right, BR.Top + 3 * H + 1), ABorderBrush);
    FillRect(DC, Rect(BR.Left + H, BR.Top + 4 * H, BR.Right, BR.Top + 4 * H + 1), ABorderBrush);
    FillRect(DC, Rect(BR.Left, BR.Top + 5 * H, BR.Right, BR.Top + 5 * H + 1), ABorderBrush);
    {vert}
    FillRect(DC, Rect(BR.Left + H, BR.Top + H, BR.Left + H + 1, BR.Top + 5 * H), ABorderBrush);
    FillRect(DC, Rect(BR.Left + 2 * H, BR.Top + 2 * H, BR.Left + 2 * H + 1, BR.Top + 4 * H), ABorderBrush);
  end;
  {images}
  if tvpoStateImages in TreeViewReportLink.Options then
  begin
    ilPreview.Draw(ACanvas, BR.Left + 1, BR.Top + 3, 0);
    ilPreview.Draw(ACanvas, BR.Left + H + 1, BR.Top + H + 3, 0);
    ilPreview.Draw(ACanvas, BR.Left + 2 * H + 1, BR.Top + 2 * H + 3, 0);
    ilPreview.Draw(ACanvas, BR.Left + 2 * H + 1, BR.Top + 3 * H + 3, 0);
    ilPreview.Draw(ACanvas, BR.Left + H + 1, BR.Top + 4 * H + 3, 0);
    ilPreview.Draw(ACanvas, BR.Left + 1, BR.Top + 5 * H + 3, 0);
    Inc(ALeft, ilPreview.Width + 1);
  end;
  if tvpoImages in TreeViewReportLink.Options then  
  begin
    ilPreview.Draw(ACanvas, BR.Left + ALeft, BR.Top + 3, 1);
    ilPreview.Draw(ACanvas, BR.Left + ALeft + H, BR.Top + H + 3, 1);
    ilPreview.Draw(ACanvas, BR.Left + ALeft + 2 * H, BR.Top + 2 * H + 3, 1);
    ilPreview.Draw(ACanvas, BR.Left + ALeft + 2 * H, BR.Top + 3 * H + 3, 1);
    ilPreview.Draw(ACanvas, BR.Left + ALeft + H, BR.Top + 4 * H + 3, 1);
    ilPreview.Draw(ACanvas, BR.Left + ALeft + 1, BR.Top + 5 * H + 3, 1);
    Inc(ALeft, ilPreview.Width + 1);
  end;

  {text}
  if (ALeft = 0) then Inc(ALeft, 2);
  APrevMode := SetBkMode(DC, TRANSPARENT);
  FPreviewFont.Assign(TreeViewReportLink.Font);
  FPreviewFont.Size := 8;
  APrevFont := SelectObject(DC, FPreviewFont.Handle);
  APrevColor := SetTextColor(DC, ColorToRGB(FPreviewFont.Color));
  S := sdxTVStrings[0];
  R := Rect(BR.Left + ALeft, BR.Top, BR.Right, BR.Top + H);
  if RectVisible(DC, R) then  
    DrawText(DC, PChar(S), Length(S), R, uFlags);
  S := sdxTVStrings[1];
  R := Rect(BR.Left + H + ALeft, BR.Top + H, BR.Right, BR.Top + 2 * H);
  if RectVisible(DC, R) then  
    DrawText(DC, PChar(S), Length(S), R, uFlags);
  S := sdxTVStrings[2];
  R := Rect(BR.Left + 2 * H + ALeft, BR.Top + 2 * H, BR.Right, BR.Top + 3 * H);
  if RectVisible(DC, R) then
    DrawText(DC, PChar(S), Length(S), R, uFlags);
  S := sdxTVStrings[3];
  R := Rect(BR.Left + 2 * H + ALeft, BR.Top + 3 * H, BR.Right, BR.Top + 4 * H);
  if RectVisible(DC, R) then  
    DrawText(DC, PChar(S), Length(S), R, uFlags);
  S := sdxTVStrings[4];
  R := Rect(BR.Left + H + ALeft, BR.Top + 4 * H, BR.Right, BR.Top + 5 * H);
  if RectVisible(DC, R) then  
    DrawText(DC, PChar(S), Length(S), R, uFlags);
  S := sdxTVStrings[5];
  R := Rect(BR.Left + ALeft, BR.Top + 5 * H, BR.Right, BR.Top + 6 * H);
  if RectVisible(DC, R) then  
    DrawText(DC, PChar(S), Length(S), R, uFlags);
  SelectObject(DC, APrevFont);
  SetTextColor(DC, APrevColor);
  SetBkMode(DC, APrevMode);
  DeleteObject(ABorderBrush);
end;

procedure TdxTVReportLinkDesignWindow.pbxPreviewPaint(Sender: TObject);
begin
  with TdxPSPaintPanel(Sender) do
  begin
    FillRect(Canvas.Handle, ClientRect, hBrush(COLOR_WINDOW + 1));
    PaintPreview(Canvas, ClientRect);
  end;
end;

function TdxTVReportLinkDesignWindow.GetTreeViewReportLink: TdxTreeViewReportLink;
begin
  Result := TdxTreeViewReportLink(ReportLink);
end;

procedure TdxTVReportLinkDesignWindow.CreateControls;
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
    //DropDownCount := Items.Count;
    OnChange := ccbxColorChange;
  end;
  lblColor.FocusControl := FccbxColor;
  
  FccbxGridLineColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxGridLineColor) do
  begin
    BoundsRect := bvlLineColorHolder.BoundsRect;
    Tag := 1;
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
  FseExpandLevel := TdxPSSpinEdit.Create(Self);
  with TdxPSSpinEdit(FseExpandLevel) do
  begin
    BoundsRect := bvlExpandLevelHolder.BoundsRect;
    MinValue := -1;
    MaxValue := 100;
    Flat := False;
    Parent := pnlBehaviors;
    OnChange := ExpandLevelChange;
  end;
  lblExpandLevel.FocusControl := FseExpandLevel;
end;

procedure TdxTVReportLinkDesignWindow.LoadStrings;
begin
  inherited LoadStrings;
  tshOptions.Caption := sdxOptions;
  tshFonts.Caption := sdxFonts;
  tshColors.Caption := sdxColors;
  tshBehaviors.Caption := sdxBehaviors;
  lblPreview.Caption := DropAmpersand(sdxPreview);

  lblShow.Caption := sdxShow;
  chbxShowBorders.Caption := sdxBorderLines;
  chbxShowGrid.Caption := sdxGrid;
  chbxShowImages.Caption := sdxImages;
  chbxShowStateImages.Caption := sdxStateImages;
  
  lblMiscellaneous.Caption := sdxMiscellaneous;
  chbxAutoWidth.Caption := sdxAutoWidth;
  chbxNodeAutoHeight.Caption := sdxNodeAutoHeight;
  
  chbxTransparent.Caption := sdxTransparent;
  lblColor.Caption := sdxColor;
  lblGridLinesColor.Caption := sdxGridLinesColor;

  btnFont.Caption := sdxBtnFont;

  lblExpanding.Caption := sdxNodeExpanding;
  chbxAutoNodesExpand.Caption := sdxAutoNodesExpand;
end;

procedure TdxTVReportLinkDesignWindow.chbxShowBordersClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  with TCheckBox(Sender) do
    if Checked then
      TreeViewReportLink.Options := TreeViewReportLink.Options + [TdxTreeViewPaintOption(Tag)]
    else  
      TreeViewReportLink.Options := TreeViewReportLink.Options - [TdxTreeViewPaintOption(Tag)];
  Modified := True;
  UpdatePreview;
end;

procedure TdxTVReportLinkDesignWindow.chbxAutoWidthClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeViewReportLink.AutoWidth := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxTVReportLinkDesignWindow.chbxNodeAutoHeightClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeViewReportLink.NodeAutoHeight := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxTVReportLinkDesignWindow.btnFontClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  FD.Font := TreeViewReportLink.Font;
  if (dxPrintDevice.Printers.Count > 0) then
    FD.Device := fdPrinter
  else
    FD.Device := fdScreen;
  if FD.Execute then
  begin
    TreeViewReportLink.Font := FD.Font;
    FontInfoToText(TreeViewReportLink.Font, edFont);
    Modified := True;
    UpdatePreview;
  end;
end;

procedure TdxTVReportLinkDesignWindow.chbxTransparentClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeViewReportLink.Transparent := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview;
end;

procedure TdxTVReportLinkDesignWindow.ccbxColorChange(Sender: TObject);
var
  AColor: TColor;
begin
  if LockControlsUpdate then Exit;
  AColor := TdxPSColorCombo(Sender).ColorValue;
  case TdxPSColorCombo(Sender).Tag of
    0: TreeViewReportLink.Color := AColor;
    1: TreeViewReportLink.GridLineColor := AColor;
  end;
  Modified := True;
  UpdatePreview;
end;

procedure TdxTVReportLinkDesignWindow.UpdatePreview;
begin
  FPreviewBox.Invalidate;
end;
  
procedure TdxTVReportLinkDesignWindow.chbxAutoNodesExpandClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeViewReportLink.AutoNodesExpand := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxTVReportLinkDesignWindow.lblExpandLevelClick(Sender: TObject);
begin
  if Assigned(TLabel(Sender).FocusControl) then
    ActiveControl := TLabel(Sender).FocusControl;
end;

procedure TdxTVReportLinkDesignWindow.ExpandLevelChange(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeViewReportLink.ExpandLevel := TdxPSSpinEdit(Sender).AsInteger;
  Modified := True;
end;

procedure TdxTVReportLinkDesignWindow.lblColorClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TCustomComboBox(ActiveControl).DroppedDown := True;
end;

initialization
  dxPSRegisterReportLink(TdxTreeViewReportLink, TTreeView, TdxTVReportLinkDesignWindow);

finalization
  dxPSUnregisterReportLink(TdxTreeViewReportLink, TTreeView, TdxTVReportLinkDesignWindow);

end.

