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

unit dxPSdxInsLnk;

interface

{$I dxPSVer.inc}

uses
  Classes, Windows, Graphics, ExtCtrls, StdCtrls, Controls, ComCtrls, Forms, Messages, 
  dxPSGlbl, dxPSCore, dxInspct, Dialogs;

type
  TdxInspectorPaintOption = (ipoBorder, ipoHorzLines, ipoVertLines, ipoFlatCheckMarks);
  TdxInspectorPaintOptions = set of TdxInspectorPaintOption;

  TdxInspectorReportLinkCustomEvent = procedure(Sender: TBasedxReportLink; 
    ARow: TdxInspectorRow; ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; 
    var AText: string; var AColor: TColor; AFont: TFont; 
    var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
    var ADone: Boolean) of object;

  TCustomdxInspectorReportLink = class(TBasedxReportLink)
  private
    FAutoNodesExpand: Boolean;
    FAutoWidth: Boolean;
    FFixedTransparent: Boolean;
    FFixedColor: TColor;
    FFixedFont: TFont;
    FGridLineColor: TColor;
    FGroupColor: TColor;
    FGroupFont: TFont;
    FOddFont: TFont;
    FOptions: TdxInspectorPaintOptions;
    FSupportedCustomDraw: Boolean;

    FOnCustomDrawCaption: TdxInspectorReportLinkCustomEvent;
    FOnCustomDrawValue: TdxInspectorReportLinkCustomEvent;

    FCaptionWidth: Integer;
    FCategoryRowHeight: Integer;
    FCustomDrawFontChanged: Boolean;
    FFixedFontIndex: Integer;
    FGroupFontIndex: Integer;
    FFullWidth: Integer;
    FIndent: Integer;
    FRowHeight: Integer;
    FRows: TList;
    FSaveFont: TFont;

    function GetCustomInspector: TCustomdxInspectorControl;
    function GetOddColor: TColor;
    function GetOptions: TdxInspectorPaintOptions;
    procedure SetAutoNodesExpand(Value: Boolean);
    procedure SetAutoWidth(Value: Boolean);
    procedure SetFixedTransparent(Value: Boolean);
    procedure SetGridLineColor(Value: TColor);
    procedure SetGroupNodeColor(Value: TColor);
    procedure SetGroupFont(Value: TFont);
    procedure SetFixedColor(Value: TColor);
    procedure SetFixedFont(Value: TFont);
    procedure SetOddFont(Value: TFont);
    procedure SetOddColor(Value: TColor);
    procedure SetOnCustomDrawCaption(Value: TdxInspectorReportLinkCustomEvent);
    procedure SetOnCustomDrawValue(Value: TdxInspectorReportLinkCustomEvent);
    procedure SetOptions(Value: TdxInspectorPaintOptions);
    procedure SetSupportCustomDraw(Value: Boolean);

    procedure AddRows;
    procedure CalcAutoWidth;
    procedure CalcRowHeights;
    procedure CustomDrawFontChanged(Sender: TObject);
    function GetCellSides(ARow: TdxInspectorRow): TdxCellSides;
    function GetFixedCellSides(ARow: TdxInspectorRow): TdxCellSides;
    function GetRowHeight(ARow: TdxInspectorRow): Integer;

    function IsDrawAnyLines: Boolean;
    function IsDrawBorder: Boolean;
    function IsDrawVertLines: Boolean;
    function IsDrawHorzLines: Boolean;
    function IsFlatCheckMarks: Boolean;

    function IsBottomRow(ARow: TdxInspectorRow): Boolean;
    function IsTopRow(ARow: TdxInspectorRow): Boolean;
  protected
    procedure ConstructReport(AReportCells: TdxReportCells); override;
    procedure InternalRestoreDefaults; override;
    procedure InternalRestoreFromOriginal; override;
    procedure MakeDelimiters(AReportCells: TdxReportCells; AHorzDelimiters,
      AVertDelimiters: TList); override;

    procedure AssignValues(ADataItem: TAbstractdxReportCellData;
      ARow: TdxInspectorRow); virtual;
    function GetDataClass(ARow: TdxInspectorRow): TdxReportCellDataClass; virtual;
    procedure PrepareConstruct(AReportCells: TdxReportCells); virtual;
    procedure UnprepareConstruct(AReportCells: TdxReportCells); virtual;

    procedure CustomDraw(AItem: TAbstractdxReportCellData; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var ADone: Boolean); override;
    procedure DoCustomDrawCaption(ARow: TdxInspectorRow; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var AText: string; var AColor: TColor; 
      AFont: TFont; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
      var ADone: Boolean); virtual;
    procedure DoCustomDrawValue(ARow: TdxInspectorRow; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var AText: string; var AColor: TColor; 
      AFont: TFont;  var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
      var ADone: Boolean); virtual;
    function IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean; override;
    
    property CustomInspector: TCustomdxInspectorControl read GetCustomInspector;
  published
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    property AutoNodesExpand: Boolean read FAutoNodesExpand write SetAutoNodesExpand
      default False;
    property AutoWidth: Boolean read FAutoWidth write SetAutoWidth
      default False;
    property Color;
    property FixedTransparent: Boolean read FFixedTransparent write SetFixedTransparent
      default False;
    property FixedColor: TColor read FFixedColor write SetFixedColor
      default clSilver; {dxDefaultFixedColor}
    property FixedFont: TFont read FFixedFont write SetFixedFont;
    property Font;
    property GridLineColor: TColor read FGridLineColor write SetGridLineColor
      default clBlack; {dxDefaultGridLineColor}
    property GroupFont: TFont read FGroupFont write SetGroupFont;
    property GroupColor: TColor read FGroupColor write SetGroupNodeColor
      default clSilver; {dxDefaultFixedColor}
    property OddColor: TColor read GetOddColor write SetOddColor
      default clWhite; {clDefaultColor}
    property OddFont: TFont read FOddFont write SetOddFont;
    property Options: TdxInspectorPaintOptions read GetOptions write SetOptions
      default [ipoBorder..ipoFlatCheckMarks]; {dxDefaultInspectorPaintOptions}
    property ScaleFonts;
    property SupportedCustomDraw: Boolean read FSupportedCustomDraw write SetSupportCustomDraw
      default False;
    property Transparent;
    property UseHorzDelimiters;    
    property UseVertDelimiters;
    
    property OnCustomDrawCaption: TdxInspectorReportLinkCustomEvent
      read FOnCustomDrawCaption write SetOnCustomDrawCaption;
    property OnCustomDrawValue: TdxInspectorReportLinkCustomEvent
      read FOnCustomDrawValue write SetOnCustomDrawValue;
  end;

  TdxInspectorReportLink = class(TCustomdxInspectorReportLink)
  private
    function GetInspector: TdxInspector;
  public
    property Inspector: TdxInspector read GetInspector;
  end;

  TdxInspectorDesignWindow = class(TAbstractdxReportLinkDesignWindow)
    PageControl1: TPageControl;
    tshOptions: TTabSheet;
    tshColors: TTabSheet;
    tshFonts: TTabSheet;
    pnlPreview: TPanel;
    lblPreview: TStaticText;
    Panel10: TPanel;
    Bevel1: TBevel;
    chbxTransparent: TCheckBox;
    gbxTransparent: TGroupBox;
    lblColor: TLabel;
    bvlColorHolder: TBevel;
    chbxFixedTransparent: TCheckBox;
    gbxFixedTransparent: TGroupBox;
    lblFixedColor: TLabel;
    bvlFixedColorHolder: TBevel;
    lblGroupColor: TLabel;
    bvlGroupColorHolder: TBevel;
    lblGridLinesColor: TLabel;
    bvlGridLineColorHolder: TBevel;
    Bevel2: TBevel;
    lblShow: TLabel;
    Bevel11: TBevel;
    chbxShowBorders: TCheckBox;
    chbxShowHorzLines: TCheckBox;
    chbxShowVertLines: TCheckBox;
    chbxFlatCheckMarks: TCheckBox;
    lblMiscellaneous: TLabel;
    Bevel4: TBevel;
    chbxAutoWidth: TCheckBox;
    Bevel3: TBevel;
    FD: TFontDialog;
    btnFont: TButton;
    edFont: TEdit;
    btnGroupFont: TButton;
    edGroupFont: TEdit;
    btnFixedFont: TButton;
    edFixedFont: TEdit;
    chbxAutoNodesExpand: TCheckBox;
    procedure chbxAutoNodesExpandClick(Sender: TObject);
    procedure chbxTransparentClick(Sender: TObject);
    procedure chbxAutoWidthClick(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure chbxShowHorzLinesClick(Sender: TObject);
  private
    FccbxColor: TCustomComboBox;
    FccbxFixedColor: TCustomComboBox;
    FccbxGroupColor: TCustomComboBox;
    FccbxGridLineColor: TCustomComboBox;
    FPreviewBox: TCustomControl;
  
    FLastIndex: Integer;
    FPreviewFont: TFont;
    
    procedure ccbxColorChange(Sender: TObject);    
    procedure CreateControls;
    procedure pbxPreviewPaint(Sender: TObject);    
    function GetInspectorReportLink: TCustomdxInspectorReportLink;
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
    property InspectorReportLink: TCustomdxInspectorReportLink read GetInspectorReportLink;
  end;

  TdxInspectorColumnMapperProc = function(ARow: TdxInspectorRow;
    AReportLink: TCustomdxInspectorReportLink): TdxReportCellDataClass;
  TdxInspectorAssignDataProc = procedure(AReportLink: TCustomdxInspectorReportLink;
    ADataItem: TAbstractdxReportCellData; AInspector: TCustomdxInspector; 
    ARow: TdxInspectorRow);

function DefaultdxInspectorMapperProc(ARow: TdxInspectorRow;
  AReportLink: TCustomdxInspectorReportLink): TdxReportCellDataClass;
procedure DefaultdxInspectorAssignDataProc(AReportLink: TCustomdxInspectorReportLink;
  ADataItem: TAbstractdxReportCellData; AInspector: TCustomdxInspector;
  ARow: TdxInspectorRow);

const
  FdxInspectorAssignDataProc: TdxInspectorAssignDataProc = DefaultdxInspectorAssignDataProc;
  FdxInspectorColumnMapperProc: TdxInspectorColumnMapperProc = DefaultdxInspectorMapperProc;

  dxDefaultInspectorPaintOptions: TdxInspectorPaintOptions = [ipoBorder..ipoFlatCheckMarks];

implementation

{$R *.DFM}

uses
  SysUtils, 
  dxExEdtr, dxInspRw, dxExtCtrls, dxPSRes, dxPrnDev, dxPSUtl;

const
  sdxInspectorStrings: array[0..1, 0..7] of string =
    ((sdxJanuary, sdxFebruary, sdxMarch, sdxApril, sdxMay, sdxJune, sdxJuly, sdxAugust),
     ('$1.000.000', '$1.200.000', '$1.100.000', '$1.900.000', '$2.200.000', 
      '$2.100.000', '$2.000.000', '$1.850.000'));
  
type
  TdxInspectorCellType = (ictNone, ictCaption, ictValue);

(*
  TdxInspectorRow, TdxInspectorMaskRow, TdxInspectorDateRow,
  TdxInspectorCheckRow, TdxInspectorCalcRow, TdxInspectorButtonRow,
  TdxInspectorSpinRow, TdxInspectorPickRow, TdxInspectorImageRow,
  TdxInspectorTimeRow, TdxInspectorCurrencyRow, TdxInspectorHyperLinkRow
*)

function DefaultdxInspectorMapperProc(ARow: TdxInspectorRow;
  AReportLink: TCustomdxInspectorReportLink): TdxReportCellDataClass;
begin
  if ARow is TdxInspectorCheckRow then
    Result := TdxReportCellCheck
  else 
    if ARow is TdxInspectorImageRow then
      if TdxInspectorImageRow(ARow).ShowDescription then
        Result := TdxReportCellImage
      else
        Result := TdxReportCellGraphic
    else
      Result := TdxReportCellString;
end;

type
  TCustomdxInspectorControlAccess = class(TCustomdxInspectorControl);
  TdxInspectorRowAccess = class(TdxInspectorRow);

procedure DefaultdxInspectorAssignDataProc(AReportLink: TCustomdxInspectorReportLink;
  ADataItem: TAbstractdxReportCellData; AInspector: TCustomdxInspector;
  ARow: TdxInspectorRow);
var
  AState: TCheckBoxState;
  ANullStyle: TdxShowNullFieldStyle;
  AImageIndex, ATextIndex: Integer;
  S: string;
begin
  if TdxInspectorCellType(ADataItem.Data) = ictCaption then
  begin
    TdxReportCellString(ADataItem).Text := ARow.Caption;
    TdxReportCellString(ADataItem).Indent := AReportLink.FIndent * (ARow.Node.Level + 1);
    TdxReportCellString(ADataItem).EndEllipsis := 
      (ioDrawEndEllipsis in TCustomdxInspectorControlAccess(AInspector).Options);
    TdxReportVisualItem(ADataItem).CellSides := AReportLink.GetFixedCellSides(ARow);
    TdxReportVisualItem(ADataItem).Transparent := AReportLink.FixedTransparent;
    if not TdxReportVisualItem(ADataItem).Transparent then
      if ARow.IsCategory then
        TdxReportVisualItem(ADataItem).Color := AReportLink.GroupColor
      else
        TdxReportVisualItem(ADataItem).Color := AReportLink.FixedColor;
    if ARow.IsCategory then
      TdxReportVisualItem(ADataItem).FontIndex := AReportLink.FGroupFontIndex
    else
      TdxReportVisualItem(ADataItem).FontIndex := AReportLink.FFixedFontIndex;
  end
  else 
    if TdxInspectorCellType(ADataItem.Data) = ictValue then
    begin
      TdxReportVisualItem(ADataItem).CellSides := AReportLink.GetCellSides(ARow);
      TdxReportVisualItem(ADataItem).Transparent := AReportLink.Transparent;
      if not TdxReportVisualItem(ADataItem).Transparent then
        TdxReportVisualItem(ADataItem).Color := AReportLink.Color;
      if ADataItem is TdxReportCellCheck then
        with TdxReportCellCheck(ADataItem) do
        begin
          AState := TCheckBoxState(TdxInspectorCheckRow(ARow).GetCheckBoxState(
            TdxInspectorRowAccess(ARow).GetDisplayText));
          ANullStyle := TdxInspectorCheckRow(ARow).ShowNullFieldStyle;
          Enabled := not ((AState = cbGrayed) and (ANullStyle > nsUnchecked));
          Checked := (AState = cbChecked) or 
            ((AState = cbGrayed) and (ANullStyle = nsGrayedChecked));
          FlatBorder := AReportLink.IsFlatCheckMarks;
        end
      else 
        if ADataItem is TdxReportCellImage then
          with TdxReportCellImage(ADataItem) do
          begin
            S := TdxInspectorRowAccess(ARow).GetDisplayText;
            TdxInspectorImageRow(ARow).GetIndexes(S, AImageIndex, ATextIndex);
            if ATextIndex <> -1 then 
              Text := TdxInspectorImageRow(ARow).Descriptions[ATextIndex];
            ImageList := TdxInspectorImageRow(ARow).Images;
            ImageIndex := AImageIndex;
            MakeSpaceForEmptyImage := True;
            EndEllipsis := True;
            Multiline := TdxInspectorImageRow(ARow).MultilineText;
            TextAlignX := dxTextAlignX[ARow.Alignment];
            TextAlignY := dxMultilineTextAlignY[Multiline];
          end
        else 
          if ADataItem is TdxReportCellGraphic then
            with TdxReportCellGraphic(ADataItem) do
            begin
              S := TdxInspectorRowAccess(ARow).GetDisplayText;
              TdxInspectorImageRow(ARow).GetIndexes(S, AImageIndex, ATextIndex);
              ImageList := TdxInspectorImageRow(ARow).Images;
              ImageIndex := AImageIndex;
              DrawMode := gdmCenter;
            end
          else
           { TdxInspectorTextRow, TdxInspectorMaskRow, TdxInspectorDateRow
             TdxInspectorCalcRow, TdxInspectorButtonRow, TdxInspectorSpinRow,
             TdxInspectorPickRow, TdxInspectorTimeRow, TdxInspectorCurrencyRow,
             TdxInspectorHyperLinkRow }
            with TdxReportCellString(ADataItem) do
            begin
              Text := TdxInspectorRowAccess(ARow).GetDisplayText;
              EndEllipsis := (ioDrawEndEllipsis in TCustomdxInspectorControlAccess(AInspector).Options);
              Multiline := False;
              TextAlignX := dxTextAlignX[ARow.Alignment];
              TextAlignY := taCenterY;
            end;
    end;
end;


{ TCustomdxInspectorReportLink }

constructor TCustomdxInspectorReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFixedFont := TFont.Create;
  FOddFont := TFont.Create;
  FGroupFont := TFont.Create;
  InternalRestoreDefaults;
  LinkModified(False);
  FFixedFont.OnChange := FontChanged;
  FOddFont.OnChange := FontChanged;
  FGroupFont.OnChange := FontChanged;
  FSaveFont := TFont.Create;
  FSaveFont.OnChange := CustomDrawFontChanged;
  FRows := TList.Create;
end;

destructor TCustomdxInspectorReportLink.Destroy;
begin
  FRows.Free;
  FSaveFont.Free;
  inherited Destroy;
end;

procedure TCustomdxInspectorReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TCustomdxInspectorReportLink) then
  begin
    AutoNodesExpand := TCustomdxInspectorReportLink(Source).AutoNodesExpand;
    AutoWidth := TCustomdxInspectorReportLink(Source).AutoWidth;
    FixedTransparent := TCustomdxInspectorReportLink(Source).FixedTransparent;
    FixedColor := TCustomdxInspectorReportLink(Source).FixedColor;
    FixedFont := TCustomdxInspectorReportLink(Source).FixedFont;
    GridLineColor := TCustomdxInspectorReportLink(Source).GridLineColor;
    GroupFont := TCustomdxInspectorReportLink(Source).GroupFont;
    GroupColor := TCustomdxInspectorReportLink(Source).GroupColor;
    OddFont := TCustomdxInspectorReportLink(Source).OddFont;
    Options := TCustomdxInspectorReportLink(Source).Options;
    SupportedCustomDraw := TCustomdxInspectorReportLink(Source).SupportedCustomDraw;
  end;
end;

procedure TCustomdxInspectorReportLink.ConstructReport(AReportCells: TdxReportCells);
var
  I, V: Integer;
  ADataClass: TdxReportCellDataClass;
  ADataItem: TAbstractdxReportCellData;
  ACell: TdxReportCell;
  APrevSibl: TdxReportItem;
  ACurrentRow: TdxInspectorRow;
begin
  if CustomInspector = nil then Exit;
  inherited ConstructReport(AReportCells);
  if CustomInspector.TotalRowCount = 0 then Exit;
  
  PrepareConstruct(AReportCells);
  try
    AReportCells.BorderColor := GridLineColor;
    AReportCells.Cells.FontIndex := FFontIndex;
    AReportCells.Cells.Color := Color;
    for I := 0 to FRows.Count - 1 do
    begin
      ACurrentRow := FRows.List[I];
      ACell := TdxReportCell.Create(AReportCells.Cells);
      if IsDrawBorder then 
      begin
        ACell.CellSides := [csLeft, csRight];
        if IsTopRow(ACurrentRow) then 
          ACell.CellSides := ACell.CellSides + [csTop];         
        if IsBottomRow(ACurrentRow) then 
          ACell.CellSides := ACell.CellSides + [csBottom];
      end    
      else  
        ACell.CellSides := [];
      ACell.Data := Integer(ACurrentRow);
      ACell.BoundsRect := Rect(0, 0, FFullWidth, GetRowHeight(ACurrentRow));
      APrevSibl := ACell.GetPrevSibling;
      if APrevSibl <> nil then
        ACell.Top := TdxReportVisualItem(APrevSibl).BoundsRect.Bottom;
        
      ADataItem := TdxReportCellString.Create(ACell);
      ADataItem.Data := Integer(ictCaption);
      APrevSibl := ADataItem.GetPrevSibling;
      if APrevSibl <> nil then
        V := TdxReportVisualItem(APrevSibl).BoundsRect.Right
      else
        V := 0;
      if ACurrentRow.IsCategory then
        ADataItem.BoundsRect := Rect(V, 0, ADataItem.Parent.Width, ADataItem.Parent.Height)
      else
        ADataItem.BoundsRect := Rect(V, 0, FCaptionWidth, ADataItem.Parent.Height);
       
      AssignValues(ADataItem, ACurrentRow);

      if not ACurrentRow.IsCategory then
      begin
        ADataClass := GetDataClass(ACurrentRow);
        if ADataClass <> nil then
        begin
          ADataItem := ADataClass.Create(ACell);
          ADataItem.Data := Integer(ictValue);
          APrevSibl := ADataItem.GetPrevSibling;
          if APrevSibl <> nil then
            V := TdxReportVisualItem(APrevSibl).BoundsRect.Right
          else
            V := 0;
          ADataItem.BoundsRect := Rect(V, 0, FFullWidth, ADataItem.Parent.Height);
          AssignValues(ADataItem, ACurrentRow);
        end;
      end;
      { TODO: Insert Cross cell}
      AReportCells.DoProgress(MulDiv(I, 100, FRows.Count));
    end;
    with AReportCells.Cells do
      BoundsRect := Rect(0, 0, LastCell.BoundsRect.Right, LastCell.BoundsRect.Bottom);
  finally
    UnPrepareConstruct(AReportCells);
  end;
end;

procedure TCustomdxInspectorReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  FAutoNodesExpand := False;
  FAutoWidth := False;
  FFixedTransparent := False;
  FFixedColor := dxDefaultFixedColor;
  FixedFont.Assign(Font);
  GridLineColor := dxDefaultGridLineColor;
  FGroupFont.Assign(FixedFont);
  FGroupColor := FixedColor;
  FOddFont.Assign(Font);
  FOptions := dxDefaultInspectorPaintOptions;
  SupportedCustomDraw := False;
end;

procedure TCustomdxInspectorReportLink.InternalRestoreFromOriginal;
begin
  inherited InternalRestoreFromOriginal;
  GroupFont.Style := GroupFont.Style + [fsBold];
  FixedTransparent := TCustomdxInspectorControlAccess(CustomInspector).PaintStyle = ipsSimple;
end;

procedure TCustomdxInspectorReportLink.MakeDelimiters(AReportCells: TdxReportCells;
  AHorzDelimiters, AVertDelimiters: TList);
var
  I: Integer;
begin
  inherited MakeDelimiters(AReportCells, AHorzDelimiters, AVertDelimiters);
  with AReportCells do
  begin
    { horz. }
    if UseHorzDelimiters then 
      if Cells.CellCount > 0 then
        for I := 0 to Cells[0].DataItemCount - 1 do
          AHorzDelimiters.Add(Pointer(Cells[0].DataItems[I].BoundsRect.Right));
    { vert. }
    if UseVertDelimiters then
      for I := 0 to Cells.CellCount - 1 do
        AVertDelimiters.Add(Pointer(Cells[I].BoundsRect.Bottom));
  end;
end;

procedure TCustomdxInspectorReportLink.PrepareConstruct(AReportCells: TdxReportCells);
begin
  AddRows;
  FIndent := 2 + TCustomdxInspectorControlAccess(CustomInspector).Indent;
  FCaptionWidth := TCustomdxInspectorControlAccess(CustomInspector).DividerPos;
  FFullWidth := CustomInspector.Width;  
  if AutoWidth then CalcAutoWidth;
  CalcRowHeights;
  FFixedFontIndex := AddFontToPool(FixedFont);    
  FGroupFontIndex := AddFontToPool(GroupFont);
end;

procedure TCustomdxInspectorReportLink.UnprepareConstruct(AReportCells: TdxReportCells);
begin
end;

procedure TCustomdxInspectorReportLink.AssignValues(ADataItem: TAbstractdxReportCellData;
  ARow: TdxInspectorRow);
begin
  if Assigned(FdxInspectorAssignDataProc) then
    FdxInspectorAssignDataProc(Self, ADataItem, CustomInspector, ARow);
end;

function TCustomdxInspectorReportLink.GetDataClass(ARow: TdxInspectorRow): TdxReportCellDataClass;
begin
  if Assigned(FdxInspectorColumnMapperProc) then
    Result := FdxInspectorColumnMapperProc(ARow, Self)
  else
    Result := nil;
end;

procedure TCustomdxInspectorReportLink.CustomDraw(AItem: TAbstractdxReportCellData;
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var ADone: Boolean);
var
  AColor: TColor;
  AText: string;
  ATextAlignX: TdxTextAlignX;
  ATextAlignY: TdxTextAlignY;
  ARow: TdxInspectorRow;
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
    ARow := TdxInspectorRow(AItem.Parent.Data);
    case TdxInspectorCellType(AItem.Data) of
      ictCaption:
        DoCustomDrawCaption(ARow, ACanvas, ABoundsRect, AClientRect, AText, AColor,
          FSaveFont, ATextAlignX, ATextAlignY, ADone);
      ictValue:
        DoCustomDrawValue(ARow, ACanvas, ABoundsRect, AClientRect, AText, AColor,
          FSaveFont, ATextAlignX, ATextAlignY, ADone);
    end;
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

procedure TCustomdxInspectorReportLink.DoCustomDrawCaption(ARow: TdxInspectorRow;
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var AText: string;
  var AColor: TColor; AFont: TFont; var ATextAlignX: TdxTextAlignX;
  var ATextAlignY: TdxTextAlignY; var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawCaption) then
    FOnCustomDrawCaption(Self, ARow,
      ACanvas, ABoundsRect, AClientRect, AText, AColor, AFont, ATextAlignX, ATextAlignY, ADone)
end;

procedure TCustomdxInspectorReportLink.DoCustomDrawValue(ARow: TdxInspectorRow;
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var AText: string;
  var AColor: TColor; AFont: TFont; var ATextAlignX: TdxTextAlignX;
  var ATextAlignY: TdxTextAlignY; var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawValue) then
    FOnCustomDrawValue(Self, ARow, ACanvas, ABoundsRect, AClientRect, AText, 
      AColor, AFont, ATextAlignX, ATextAlignY, ADone)
end;

function TCustomdxInspectorReportLink.IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean;
begin
  Result := SupportedCustomDraw and Assigned(Item) and
    (((TdxInspectorCellType(Item.Data) = ictCaption) and Assigned(FOnCustomDrawCaption)) or
    ((TdxInspectorCellType(Item.Data) = ictValue) and Assigned(FOnCustomDrawValue)));
end;

function TCustomdxInspectorReportLink.GetCustomInspector: TCustomdxInspectorControl;
begin
  Result := TCustomdxInspectorControl(Component);
end;

function TCustomdxInspectorReportLink.GetOddColor: TColor;
begin
  Result := inherited Color;
end;

function TCustomdxInspectorReportLink.GetOptions: TdxInspectorPaintOptions;
begin
  Result := FOptions;
end;

procedure TCustomdxInspectorReportLink.SetAutoNodesExpand(Value: Boolean);
begin
  if (FAutoNodesExpand <> Value) then
  begin
    FAutoNodesExpand := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxInspectorReportLink.SetAutoWidth(Value: Boolean);
begin
  if (FAutoWidth <> Value) then
  begin
    FAutoWidth := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxInspectorReportLink.SetFixedTransparent(Value: Boolean);
begin
  if (FFixedTransparent <> Value) then
  begin
    FFixedTransparent := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxInspectorReportLink.SetGridLineColor(Value: TColor);
begin
  if (FGridLineColor <> Value) then
  begin
    FGridLineColor := Value;
    if IsDrawAnyLines then LinkModified(True);
  end;
end;

procedure TCustomdxInspectorReportLink.SetGroupFont(Value: TFont);
begin
  FGroupFont.Assign(Value);
  LinkModified(True);
end;

procedure TCustomdxInspectorReportLink.SetGroupNodeColor(Value: TColor);
begin
  if (FGroupColor <> Value) then
  begin
    FGroupColor := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxInspectorReportLink.SetFixedColor(Value: TColor);
begin
  if (FFixedColor <> Value) then
  begin
    FFixedColor := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxInspectorReportLink.SetFixedFont(Value: TFont);
begin
  FFixedFont.Assign(Value);
  LinkModified(True);
end;

procedure TCustomdxInspectorReportLink.SetOddColor(Value: TColor);
begin
  inherited Color := Value;
end;

procedure TCustomdxInspectorReportLink.SetOddFont(Value: TFont);
begin
  FOddFont.Assign(Value);
  LinkModified(True);
end;

procedure TCustomdxInspectorReportLink.SetOnCustomDrawCaption(Value: TdxInspectorReportLinkCustomEvent);
begin
  if (@FOnCustomDrawCaption <> @Value) then
  begin
    FOnCustomDrawCaption := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxInspectorReportLink.SetOnCustomDrawValue(Value: TdxInspectorReportLinkCustomEvent);
begin
  if (@FOnCustomDrawValue <> @Value) then
  begin
    FOnCustomDrawValue := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxInspectorReportLink.SetOptions(Value: TdxInspectorPaintOptions);
begin
  if (FOptions <> Value) then
  begin
    FOptions := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxInspectorReportLink.SetSupportCustomDraw(Value: Boolean);
begin
  if (FSupportedCustomDraw <> Value) then
  begin
    FSupportedCustomDraw := Value;
    if Assigned(FOnCustomDrawCaption) or Assigned(FOnCustomDrawValue) then
      LinkModified(True);
  end;
end;

procedure TCustomdxInspectorReportLink.AddRows;

  procedure AddRow(ANode: TdxInspectorRowNode);
  var
    I: Integer;
  begin
    FRows.Add(ANode.Row);
    if ANode.Expanded or AutoNodesExpand then
      for I := 0 to ANode.Count - 1 do
        AddRow(TdxInspectorRowNode(ANode[I]));
  end;
  
var
  I: Integer;
begin
  FRows.Clear;
  if CustomInspector.TotalRowCount > 0 then
  begin
    if not AutoNodesExpand then
      FRows.Capacity := TCustomdxInspectorControlAccess(CustomInspector).GetAbsoluteCount;
    for I := 0 to CustomInspector.Count - 1 do
      AddRow(TdxInspectorRowNode(CustomInspector.Items[I]));
  end;
end;

procedure TCustomdxInspectorReportLink.CalcAutoWidth;
const
  CalcFormat: UINT = 
    DT_EDITCONTROL or DT_LEFT or DT_WORDBREAK or DT_CALCRECT or DT_EXPANDTABS or DT_NOPREFIX;
var
  DC: HDC;
  PrevFont: HFONT;
  I, TextWidth, V: Integer;
  Row: TdxInspectorRowAccess;
  S: string;
  TextSize: TSize;
begin
  TextWidth := 0;
  DC := GetDC(0);
  try
    PrevFont := GetCurrentObject(DC, OBJ_FONT);
    for I := 0 to FRows.Count - 1 do
    begin
      Row := FRows.List^[I];
      if Row.IsCategory then 
        SelectObject(DC, GroupFont.Handle)
      else 
        SelectObject(DC, FixedFont.Handle);
      S := Row.Caption;
      if S <> '' then
      begin
        GetTextExtentPoint32(DC, PChar(S), Length(S), TextSize);
        V := FIndent * (Row.Node.Level + 1) + TextSize.cX + 5;
        if V > FCaptionWidth then FCaptionWidth := V;
      end;
      if not Row.IsCategory then   
      begin
        SelectObject(DC, Font.Handle);
        S := Row.GetDisplayText;
        if S <> '' then
        begin
          GetTextExtentPoint32(DC, PChar(S), Length(S), TextSize);
          V := TextSize.cX + 5;
          if V > TextWidth then TextWidth := V;
        end
      end;  
    end;
    SelectObject(DC, PrevFont);
{!} //if FCaptionWidth + TextWidth > FFullWidth then 
    FFullWidth := FCaptionWidth + TextWidth;
  finally    
    ReleaseDC(0, DC)
  end;  
end;

procedure TCustomdxInspectorReportLink.CalcRowHeights;

  function CheckValue(AValue: Integer): Integer;
  begin
    if AValue < FRowHeight then
      Result := FRowHeight
    else
      Result := AValue;  
  end;

  function CalcHeight(DC: HDC; F: HFONT): Integer;
  var
    Size: TSize;
  begin
    SelectObject(DC, F);
    GetTextExtentPoint32(DC, 'Wg', Length('Wg'), Size);
    Result := CheckValue(Size.cY);
  end;
  
var
  DC: HDC;
  PrevFont: HFONT;
begin
  FRowHeight := TCustomdxInspectorControlAccess(CustomInspector).RowHeight;
  FCategoryRowHeight := 0;
  DC := GetDC(0);
  try
    PrevFont := GetCurrentObject(DC, OBJ_FONT);
    FRowHeight := CalcHeight(DC, FixedFont.Handle);
    FRowHeight := CalcHeight(DC, Font.Handle);
    FCategoryRowHeight := CalcHeight(DC, GroupFont.Handle);
    SelectObject(DC, PrevFont);
  finally  
    ReleaseDC(0, DC);
  end;  
end;

procedure TCustomdxInspectorReportLink.CustomDrawFontChanged(Sender: TObject);
begin
  FCustomDrawFontChanged := True;
end;

function TCustomdxInspectorReportLink.GetCellSides(ARow: TdxInspectorRow): TdxCellSides;
begin
  Result := csAll;
  if not IsDrawBorder then 
  begin
    Exclude(Result, csRight);
    if IsTopRow(ARow) then Exclude(Result, csTop);      
    if IsBottomRow(ARow) then Exclude(Result, csBottom);          
  end;  
  if not IsDrawHorzLines then 
  begin
    if not IsTopRow(ARow) then Exclude(Result, csTop);      
    if not IsBottomRow(ARow) then Exclude(Result, csBottom);          
  end;  
  if not IsDrawVertLines then 
  begin
    if not ARow.IsCategory then Exclude(Result, csLeft);
  end;  
end;

function TCustomdxInspectorReportLink.GetFixedCellSides(ARow: TdxInspectorRow): TdxCellSides;
begin
  Result := csAll;
  if not IsDrawBorder then 
  begin
    Exclude(Result, csLeft);
    if ARow.IsCategory then Exclude(Result, csRight);
    if IsTopRow(ARow) then Exclude(Result, csTop);      
    if IsBottomRow(ARow) then Exclude(Result, csBottom);          
  end;  
  if not IsDrawHorzLines then 
  begin
    if not IsTopRow(ARow) then Exclude(Result, csTop);      
    if not IsBottomRow(ARow) then Exclude(Result, csBottom);          
  end;  
  if not IsDrawVertLines then 
  begin
    if not ARow.IsCategory then Exclude(Result, csRight);
  end;  
end;

function TCustomdxInspectorReportLink.GetRowHeight(ARow: TdxInspectorRow): Integer;
begin
  if ARow.IsCategory then
    Result := FCategoryRowHeight
  else  
    Result := FRowHeight;
end;

function TCustomdxInspectorReportLink.IsDrawAnyLines: Boolean;
begin
  Result := Options * [ipoBorder..ipoVertLines] <> [];
end;

function TCustomdxInspectorReportLink.IsDrawBorder: Boolean;
begin
  Result := ipoBorder in Options;
end;

function TCustomdxInspectorReportLink.IsDrawVertLines: Boolean;
begin
  Result := ipoVertLines in Options;
end;

function TCustomdxInspectorReportLink.IsDrawHorzLines: Boolean;
begin
  Result := ipoHorzLines in Options;
end;

function TCustomdxInspectorReportLink.IsFlatCheckMarks: Boolean;
begin
  Result := ipoFlatCheckMarks in Options;
end;

function TCustomdxInspectorReportLink.IsBottomRow(ARow: TdxInspectorRow): Boolean;
begin
  Result := ARow = FRows.Last;
end;

function TCustomdxInspectorReportLink.IsTopRow(ARow: TdxInspectorRow): Boolean;
begin
  Result := ARow = FRows.First;
end;

{ TdxInspectorReportLink }

function TdxInspectorReportLink.GetInspector: TdxInspector;
begin
  Result := TdxInspector(Component)
end;

{ TdxInspectorDesignWindow }

constructor TdxInspectorDesignWindow.Create(AOwner: TComponent);
begin
  HelpContext := dxhcInspectorGridReportLinkDesigner;
  inherited Create(AOwner);
  CreateControls;
  PageControl1.ActivePage := PageControl1.Pages[0];
  FPreviewFont := TFont.Create;
  FLastIndex := -1;
end;

destructor TdxInspectorDesignWindow.Destroy;
begin
  FPreviewFont.Free;
  inherited Destroy;
end;

function TdxInspectorDesignWindow.GetInspectorReportLink: TCustomdxInspectorReportLink;
begin
  Result := TCustomdxInspectorReportLink(ReportLink);
end;

procedure TdxInspectorDesignWindow.CMDialogChar(var message: TCMDialogChar);
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

procedure TdxInspectorDesignWindow.CreateControls;
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
    OnChange := ccbxColorChange;
  end;
  lblColor.FocusControl := FccbxColor;

  FccbxFixedColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxFixedColor) do
  begin
    BoundsRect := bvlFixedColorHolder.BoundsRect;
    Tag := 1;
    Parent := gbxFixedTransparent;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultColor;
    OnChange := ccbxColorChange;
  end;
  lblFixedColor.FocusControl := FccbxFixedColor;

  FccbxGroupColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxGroupColor) do
  begin
    BoundsRect := bvlGroupColorHolder.BoundsRect;
    Tag := 2;
    Parent := gbxFixedTransparent;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultFixedColor;
    OnChange := ccbxColorChange;
  end;
  lblGroupColor.FocusControl := FccbxGroupColor;

  FccbxGridLineColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxGridLineColor) do
  begin
    BoundsRect := bvlGridLineColorHolder.BoundsRect;
    Tag := 3;
    TabOrder := 1;
    Parent := tshColors;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultGridLineColor;
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

procedure TdxInspectorDesignWindow.DoInitialize;
begin
  inherited DoInitialize;
  chbxShowBorders.Checked := InspectorReportLink.IsDrawBorder;
  chbxShowHorzLines.Checked := InspectorReportLink.IsDrawHorzLines;
  chbxShowVertLines.Checked := InspectorReportLink.IsDrawVertLines;
  chbxFlatCheckMarks.Checked := InspectorReportLink.IsFlatCheckMarks;
  chbxAutoWidth.Checked := InspectorReportLink.AutoWidth;

  chbxTransparent.Checked := InspectorReportLink.Transparent;
  TdxPSColorCombo(FccbxColor).ColorValue := ColorToRGB(InspectorReportLink.Color);
  chbxFixedTransparent.Checked := InspectorReportLink.FixedTransparent;
  TdxPSColorCombo(FccbxFixedColor).ColorValue := ColorToRGB(InspectorReportLink.FixedColor);
  TdxPSColorCombo(FccbxGroupColor).ColorValue := ColorToRGB(InspectorReportLink.GroupColor);  
  TdxPSColorCombo(FccbxGridLineColor).ColorValue := ColorToRGB(InspectorReportLink.GridLineColor);

  FontInfoToText(InspectorReportLink.Font, edFont);
  FontInfoToText(InspectorReportLink.FixedFont, edFixedFont);          
  FontInfoToText(InspectorReportLink.GroupFont, edGroupFont);                    
    
  chbxAutoNodesExpand.Checked := InspectorReportLink.AutoNodesExpand;
end;

procedure TdxInspectorDesignWindow.UpdateControlsState;
begin
  inherited UpdateControlsState;
  FccbxColor.Enabled := not chbxTransparent.Checked;
  lblColor.Enabled := FccbxColor.Enabled;
  FccbxFixedColor.Enabled := not chbxFixedTransparent.Checked;
  lblFixedColor.Enabled := FccbxFixedColor.Enabled;
  FccbxGroupColor.Enabled := not chbxFixedTransparent.Checked;
  lblGroupColor.Enabled := FccbxGroupColor.Enabled;
end;

procedure TdxInspectorDesignWindow.LoadStrings;
begin
  inherited LoadStrings;
  tshOptions.Caption := sdxOptions;
  tshFonts.Caption := sdxFonts;
  tshColors.Caption := sdxColors;
  lblPreview.Caption := DropAmpersand(sdxPreview);

  lblShow.Caption := sdxShow;
  chbxShowBorders.Caption := sdxBorderLines;
  chbxShowHorzLines.Caption := sdxHorzLines;
  chbxShowVertLines.Caption := sdxVertLines;
  chbxFlatCheckMarks.Caption := sdxFlatCheckMarks;

  lblMiscellaneous.Caption := sdxMiscellaneous;
  chbxAutoWidth.Caption := sdxAutoWidth;
  chbxAutoNodesExpand.Caption := sdxAutoNodesExpand;
      
  chbxTransparent.Caption := sdxTransparent;
  lblColor.Caption := sdxColor;
  chbxFixedTransparent.Caption := sdxFixedTransparent;
  lblFixedColor.Caption := sdxFixedColor;
  lblGroupColor.Caption := sdxGroupColor;
  lblGridLinesColor.Caption := sdxGridLinesColor;

  btnFont.Caption := sdxBtnFont;
  btnFixedFont.Caption := sdxBtnFixedFont;
  btnGroupFont.Caption := sdxBtnGroupFont;
end;

procedure TdxInspectorDesignWindow.ccbxColorChange(Sender: TObject);
var
  AColor: TColor;
begin
  if LockControlsUpdate then Exit;
  AColor := TdxPSColorCombo(Sender).ColorValue;
  case TdxPSColorCombo(Sender).Tag of
    0: InspectorReportLink.Color := AColor;
    1: InspectorReportLink.FixedColor := AColor;
    2: InspectorReportLink.GroupColor := AColor;
    3: InspectorReportLink.GridLineColor := AColor;
  end;
  Modified := True;
  UpdatePreview;
end;

procedure TdxInspectorDesignWindow.chbxAutoNodesExpandClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  InspectorReportLink.AutoNodesExpand := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview;
end;

procedure TdxInspectorDesignWindow.UpdatePreview;
begin
  FPreviewBox.Invalidate;
end;

procedure TdxInspectorDesignWindow.chbxTransparentClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  case TCheckBox(Sender).Tag of
    0: InspectorReportLink.Transparent := TCheckBox(Sender).Checked;
    1: InspectorReportLink.FixedTransparent := TCheckBox(Sender).Checked;
  end;
  Modified := True;
  UpdatePreview;
end;

procedure TdxInspectorDesignWindow.pbxPreviewPaint(Sender: TObject);
begin
  with TdxPSPaintPanel(Sender) do
    PaintPreview(Canvas, ClientRect);
end;

procedure TdxInspectorDesignWindow.PaintPreview(ACanvas: TCanvas; R: TRect);
const 
  yCount = 8;
  Opaque: array[Boolean] of UINT = (0, ETO_OPAQUE);
  
  function GetCellSides(I, J: Integer): TdxCellSides;
  begin
    Result := csAll;
    if not InspectorReportlink.IsDrawBorder then 
    begin
      if I = 0 then 
        Exclude(Result, csLeft)
      else
        Exclude(Result, csRight);
      if J = 0 then Exclude(Result, csTop);
      if J = yCount - 1 then Exclude(Result, csBottom);
    end;
    if not InspectorReportlink.IsDrawHorzLines then
    begin
      if J <> 0 then Exclude(Result, csTop);
      if J <> yCount - 1 then Exclude(Result, csBottom);
    end;
    if not InspectorReportlink.IsDrawVertLines then
      if I = 0 then
        Exclude(Result, csRight)
      else
        Exclude(Result, csLeft);
  end;     
  
var
  R2: TRect;
  DC: hDC;
  I, J, W, H, OffsetX, OffsetY: Integer;
  Sides: TdxCellSides;
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
  W := (R.Right - R.Left) div 2;
  H := (R.Bottom - R.Top) div yCount;
  OffsetX := R.Left + (R.Right - R.Left - 2 * W) div 2;
  OffsetY := R.Top + (R.Bottom - R.Top - yCount * H) div 2;
  APrevBkColor := GetBkColor(DC);
  APrevBkMode := GetBkMode(DC);
  APrevFont := GetCurrentObject(DC, OBJ_FONT);
  APrevFontColor := GetTextColor(DC);
  BorderBrush := CreateSolidBrush(ColorToRGB(InspectorReportLink.GridLineColor));
  for I := 0 to 1 do 
    for J := 0 to yCount - 1 do 
    begin
      IsTransparent := ((I = 0) and InspectorReportLink.FixedTransparent) or 
        ((I = 1) and InspectorReportLink.Transparent);
      R2 := Bounds(OffsetX + I * W, OffsetY + J * H, W + 1, H + 1);
      Sides := GetCellSides(I, J);
      if (csLeft in Sides) then 
        FrameRect(DC, Rect(R2.Left, R2.Top + Byte(not InspectorReportLink.IsDrawBorder), 
          R2.Left + 1, R2.Bottom), BorderBrush);
      if (csTop in Sides) then 
        FrameRect(DC, Rect(R2.Left + Byte(not InspectorReportLink.IsDrawBorder), 
          R2.Top, R2.Right, R2.Top + 1), BorderBrush);
      if (csRight in Sides) then 
        FrameRect(DC, Rect(R2.Right - 1, R2.Top + Byte(not InspectorReportLink.IsDrawBorder), 
          R2.Right, R2.Bottom), BorderBrush);
      if (csBottom in Sides) then 
        FrameRect(DC, Rect(R2.Left + Byte(not InspectorReportLink.IsDrawBorder), 
          R2.Bottom - 1, R2.Right, R2.Bottom), BorderBrush);
      InflateRect(R2, -1, -1);
      if not (csBottom in Sides) then Inc(R2.Bottom);
      if not (csRight in Sides) then Inc(R2.Right);      
      if not IsTransparent then 
        if I = 0 then 
          SetBkColor(DC, ColorToRGB(InspectorReportLink.FixedColor))
        else 
          SetBkColor(DC, ColorToRGB(InspectorReportLink.Color))
      else
        SetBkMode(DC, Windows.TRANSPARENT);
      if I = 0 then 
        FPreviewFont.Assign(InspectorReportLink.FixedFont)
      else
        FPreviewFont.Assign(InspectorReportLink.Font);
      FPreviewFont.Size := 8;
      SetTextColor(DC, ColorToRGB(FPreviewFont.Color));
      SelectObject(DC, FPreviewFont.Handle);
      S := sdxInspectorStrings[I, J];
      ExtTextOut(DC, R2.Left + 2 + 7 * Byte(I = 0), R2.Top + 2, 
        Opaque[not IsTransparent], @R2, PChar(S), Length(S), nil);
    end;
  DeleteObject(BorderBrush);
  SetTextColor(DC, APrevFontColor);
  SelectObject(DC, APrevFont);
  SetBkColor(DC, APrevBkColor);
  SetBkMode(DC, APrevBkMode);
end;

procedure TdxInspectorDesignWindow.chbxAutoWidthClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  InspectorReportLink.AutoWidth := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxInspectorDesignWindow.btnFontClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  case TButton(Sender).Tag of
    0: FD.Font := InspectorReportLink.Font;
    1: FD.Font := InspectorReportLink.FixedFont;
    2: FD.Font := InspectorReportLink.GroupFont;
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
          InspectorReportLink.Font := FD.Font;
          FontInfoToText(InspectorReportLink.Font, edFont);
        end;
      1:
        begin
          InspectorReportLink.FixedFont := FD.Font;
          FontInfoToText(InspectorReportLink.FixedFont, edFixedFont);          
        end;
      2:
        begin
          InspectorReportLink.GroupFont := FD.Font;
          FontInfoToText(InspectorReportLink.GroupFont, edGroupFont);                    
        end;
    end;
    Modified := True;
    UpdatePreview;
  end;
end;

procedure TdxInspectorDesignWindow.chbxShowHorzLinesClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  with TCheckBox(Sender) do 
    if Checked then
      InspectorReportLink.Options := InspectorReportLink.Options + [TdxInspectorPaintOption(Tag)]
    else  
      InspectorReportLink.Options := InspectorReportLink.Options - [TdxInspectorPaintOption(Tag)];
  FPreviewBox.Invalidate;
  Modified := True;
end;

initialization
  dxPSRegisterReportLink(TdxInspectorReportLink, TdxInspector, TdxInspectorDesignWindow);

finalization
  dxPSUnregisterReportLink(TdxInspectorReportLink, TdxInspector, TdxInspectorDesignWindow);

end.

