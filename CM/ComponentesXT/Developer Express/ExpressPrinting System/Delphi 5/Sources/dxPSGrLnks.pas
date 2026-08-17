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

unit dxPSGrLnks;

interface

{$I dxPSVer.inc}

uses
  Windows, Classes, Graphics, StdCtrls, Grids,
  dxPSCore, dxPSGlbl;

type
  TdxGridDrawMode = (gdmStrict, gdmOddEven, gdmChess, gdmBorrowSource);
  
  TAbstractdxGridReportLink = class(TBasedxReportLink)
  private
    FDrawMode: TdxGridDrawMode;
    FEffects3D: Boolean;
    FEndEllipsis: Boolean;
    FEvenColor: TColor;
    FEvenFont: TFont;
    FFixedColor: TColor;
    FFixedFont: TFont;
    FFixedTransparent: Boolean;
    FGridLineColor: TColor;
    FIncludeFixed: Boolean;
    FMultiline: Boolean;
    FOnlySelected: Boolean;
    FRowAutoHeight: Boolean;
    FSoft3D: Boolean;
    FSupportedCustomDraw: Boolean;

    function GetOddColor: TColor;
    function GetOddFont: TFont;
    procedure SetEffects3D(Value: Boolean);
    procedure SetEndEllipsis(Value: Boolean);
    procedure SetEvenColor(Value: TColor);
    procedure SetEvenFont(Value: TFont);
    procedure SetFixedColor(Value: TColor);
    procedure SetFixedFont(Value: TFont);
    procedure SetFixedTransparent(Value: Boolean);
    procedure SetGridLineColor(Value: TColor);
    procedure SetIncludeFixed(Value: Boolean);
    procedure SetMultiline(Value: Boolean);    
    procedure SetOddColor(Value: TColor);
    procedure SetOddFont(Value: TFont);
    procedure SetOnlySelected(Value: Boolean);
    procedure SetRowAutoHeight(Value: Boolean);
    procedure SetSoft3D(Value: Boolean);
    procedure SetSupportedCustomDraw(Value: Boolean);
  protected
    FCurrentCol: Integer;
    FCurrentRow: Integer;
    FEvenFontIndex: Integer;
    FFixedFontIndex: Integer;
    FRowHeights: TList;

    procedure ConstructReport(AReportCells: TdxReportCells); override;
    procedure InternalRestoreDefaults; override;
    function IsSupportedCustomDraw(AItem: TAbstractdxReportCellData): Boolean; override;
    procedure MakeDelimiters(AReportCells: TdxReportCells; 
       AHorzDelimiters, AVertDelimiters: TList); override;
    
    procedure AssignData(ACol, ARow: Integer; ADataItem: TAbstractdxReportCellData); virtual;
    procedure CalcRowHeights(AReportCells: TdxReportCells); virtual;
    function GetCellColor(ACol, ARow: Integer): TColor; virtual;
    procedure GetCellColRow(AItem: TAbstractdxReportCellData; var ACol, ARow: Integer);
    function GetCellEdgeMode(AItem: TAbstractdxReportCellData; 
      ACol, ARow: Integer): TdxCellEdgeMode; virtual;
    function GetCellFont(ACol, ARow: Integer): TFont; virtual;    
    function GetCellFontIndex(ACol, ARow: Integer): Integer; virtual;
    function GetCellSides(ACol, ARow: Integer): TdxCellSides; virtual;
    function GetCellText(ACol, ARow: Integer): string; virtual; abstract;
    function GetCellTransparent(ACol, ARow: Integer): Boolean; virtual;
    function GetColWidth(ACol: Integer): Integer; virtual;
    function GetColCount: Integer; virtual;
    function GetColumnColor(ACol: Integer): TColor; virtual;
    function GetColumnFont(ACol: Integer): TFont; virtual;
    function GetColumnFontIndex(ACol: Integer): Integer; virtual;
    function GetColumnMultiline(ACol: Integer): Boolean; virtual;
    function GetDataItemClass(ACol: Integer): TdxReportCellDataClass; virtual;
    function GetEndEllipsis: Boolean; virtual;
    function GetFixedColCount: Integer; virtual;
    function GetFixedRowCount: Integer; virtual;
    function GetGridColWidth(ACol: Integer): Integer; virtual;
    function GetGridRowHeight(ARow: Integer): Integer; virtual;
    function GetMultiline: Boolean; virtual;
    function GetProcessedColCount: Integer; virtual;
    function GetProcessedRowCount: Integer; virtual;
    function GetRowCount: Integer; virtual;
    function GetRowHeight(ARow: Integer): Integer; virtual;
    procedure GetSelectedRange(ABeginCol, AEndCol, ABeginRow, AEndRow: PInteger); virtual;
    function GetSelectedColCount: Integer; virtual;
    function GetSelectedRowCount: Integer; virtual;    
    function GetTextAlignX(ACol, ARow: Integer): TdxTextAlignX; virtual;
    function GetTextAlignY(ACol, ARow: Integer): TdxTextAlignY; virtual;
    function IsDrawBorder: Boolean; virtual;
    function IsDrawFixedHorzLines: Boolean; virtual;
    function IsDrawFixedVertLines: Boolean; virtual;
    function IsDrawHorzLines: Boolean; virtual;
    function IsDrawVertLines: Boolean; virtual;
    function IsFixedCell(ACol, ARow: Integer): Boolean; virtual;
    function IsFixedCol(ACol: Integer): Boolean; virtual;
    function IsFixedRow(ARow: Integer): Boolean; virtual;
    function IsFooterRow(ARow: Integer): Boolean; virtual;
    function IsHeaderRow(ARow: Integer): Boolean; virtual;
    function IsSelectedCell(ACol, ARow: Integer): Boolean; virtual;
    function IsSelectedExists: Boolean; virtual;
    function IsSelectedExistsInRow(ARow: Integer): Boolean; virtual;
    function IsSelectedRow(ARow: Integer): Boolean; virtual;
    procedure NextCol; virtual;
    procedure NextRow; virtual;
    procedure SetDrawMode(Value: TdxGridDrawMode); virtual;
    
    procedure PrepareConstruct(AReportCells: TdxReportCells); virtual;
    procedure UnprepareConstruct(AReportCells: TdxReportCells); virtual;

    property Effects3D: Boolean read FEffects3D write SetEffects3D
      default False;
    property EndEllipsis: Boolean read GetEndEllipsis write SetEndEllipsis
      default False;
    property EvenColor: TColor read FEvenColor write SetEvenColor
      default clWhite; {dxDefaultFixedColor}
    property EvenFont: TFont read FEvenFont write SetEvenFont;      
    property FixedColor: TColor read FFixedColor write SetFixedColor
      default clSilver; {dxDefaultFixedColor}
    property FixedFont: TFont read FFixedFont write SetFixedFont;
    property FixedTransparent: Boolean read FFixedTransparent write SetFixedTransparent
      default False;
    property GridLineColor: TColor read FGridLineColor write SetGridLineColor
      default clBlack {dxDefaultGridGridLineColor};
    property IncludeFixed: Boolean read FIncludeFixed write SetIncludeFixed
      default True;
    property Multiline: Boolean read FMultiline write SetMultiline
      default False;
    property OddColor: TColor read GetOddColor write SetOddColor
      default clWhite; {dxDefaultFixedColor}
    property OddFont: TFont read GetOddFont write SetOddFont;
    property OnlySelected: Boolean read FOnlySelected write SetOnlySelected
      default False;
    property RowAutoHeight: Boolean read FRowAutoHeight write SetRowAutoHeight
      default False;
    property Soft3D: Boolean read FSoft3D write SetSoft3D
      default True;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    property Color;
    property DrawMode: TdxGridDrawMode read FDrawMode write SetDrawMode
      default gdmStrict;
    property Font;
    property ScaleFonts;
    property SupportedCustomDraw: Boolean read FSupportedCustomDraw write SetSupportedCustomDraw
      default False;
    property Transparent;
  end;

  
  TdxGridPaintOption = (gpoBorder, gpoHorzLines, gpoVertLines, gpoFixedHorzLines, gpoFixedVertLines);
  TdxGridPaintOptions = set of TdxGridPaintOption;

  TCustomdxGridReportLink = class(TAbstractdxGridReportLink)
  private
    FOptions: TdxGridPaintOptions;
    function GetCustomGrid: TCustomGrid;
    function GetOptions: TdxGridPaintOptions;
    procedure SetOptions(Value: TdxGridPaintOptions);
  protected
    function GetCellSides(ACol, ARow: Integer): TdxCellSides; override;
    function GetColCount: Integer; override;
    function GetFixedColCount: Integer; override;
    function GetFixedRowCount: Integer; override;
    function GetGridColWidth(ACol: Integer): Integer; override;
    function GetGridRowHeight(ARow: Integer): Integer; override;
    function GetRowCount: Integer; override;
    procedure GetSelectedRange(ABeginCol, AEndCol, ABeginRow, AEndRow: PInteger); override;
    function GetSelectedColCount: Integer; override;    
    function GetSelectedRowCount: Integer; override;
    function IsDrawBorder: Boolean; override;
    function IsDrawFixedHorzLines: Boolean; override;
    function IsDrawFixedVertLines: Boolean; override;
    function IsDrawHorzLines: Boolean; override;
    function IsDrawVertLines: Boolean; override;
    procedure InternalRestoreDefaults; override;
    procedure InternalRestoreFromOriginal; override;
    function IsSelectedCell(ACol, ARow: Integer): Boolean; override;
    function IsSelectedExists: Boolean; override;
    function IsSelectedExistsInRow(ARow: Integer): Boolean; override;

    property CustomGrid: TCustomGrid read GetCustomGrid;
  public  
    procedure Assign(Source: TPersistent); override;
    
    property Effects3D;
    property EvenColor;
    property EvenFont;
    property FixedColor;
    property FixedFont;
    property FixedTransparent;
    property GridLineColor;
    property HeadersOnEveryPage;
    property IncludeFixed;
    property OddColor;
    property OddFont;
    property OnlySelected;
    property Options: TdxGridPaintOptions read GetOptions write SetOptions
      default [gpoBorder, gpoHorzLines, gpoVertLines, gpoFixedHorzLines, gpoFixedVertLines];
    property Soft3D;
    property Transparent;
  end;

  TdxCustomDrawItemEvent = procedure(Sender: TBasedxReportLink;
    Index: Integer; ACanvas: TCanvas; ABoundsRect, AClientRect: TRect;
    var AText: string; AFont: TFont; var AColor: TColor;
    var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
    var ADone: Boolean) of object;

  TdxCustomListBoxReportLink = class(TAbstractdxGridReportLink)
  private
    FAutoWidth: Boolean;
    FWidth: Integer;
    FTextAlignX: TdxTextAlignX;
    FTextAlignY: TdxTextAlignY;
    FOnCustomDrawItem: TdxCustomDrawItemEvent;

    FCustomDrawFontChanged: Boolean;
    FSaveFont: TFont;
    function GetCustomListBox: TCustomListBox;
    function IsWidthStored: Boolean;
    procedure SetAutoWidth(Value: Boolean);
    procedure SetTextAlignX(Value: TdxTextAlignX);
    procedure SetTextAlignY(Value: TdxTextAlignY);
    procedure SetWidth(Value: Integer);
    
    procedure CustomDrawFontChanged(Sender: TObject);
  protected
    procedure CustomDraw(AItem: TAbstractdxReportCellData; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var ADone: Boolean); override;
    procedure DoCustomDrawItem(Index: Integer; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var AText: string; AFont: TFont;
      var AColor: TColor; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
      var ADone: Boolean); virtual;
    function GetCellSides(ACol, ARow: Integer): TdxCellSides; override;
    function GetCellText(ACol, ARow: Integer): string; override;
    function GetColCount: Integer; override;
    function GetGridColWidth(ACol: Integer): Integer; override;
    function GetGridRowHeight(ARow: Integer): Integer; override;
    function GetRowCount: Integer; override;
    function GetSelectedColCount: Integer; override;
    function GetSelectedRowCount: Integer; override;
    function GetTextAlignX(ACol, ARow: Integer): TdxTextAlignX; override;
    function GetTextAlignY(ACol, ARow: Integer): TdxTextAlignY; override;
    function IsDrawBorder: Boolean; override;
    function IsDrawHorzLines: Boolean; override;
    function IsSelectedCell(ACol, ARow: Integer): Boolean; override;
    function IsSelectedExists: Boolean; override;
    function IsSelectedExistsInRow(ARow: Integer): Boolean; override;
    function IsSelectedRow(ARow: Integer): Boolean; override;
    procedure InternalRestoreDefaults; override;
    procedure InternalRestoreFromOriginal; override;    
    function IsSupportedCustomDraw(AItem: TAbstractdxReportCellData): Boolean; override;
    procedure UnprepareConstruct(AReportCells: TdxReportCells); override;
    
    property CustomListBox: TCustomListBox read GetCustomListBox;
    property OnCustomDrawItem: TdxCustomDrawItemEvent read FOnCustomDrawItem write FOnCustomDrawItem;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    property AutoWidth: Boolean read FAutoWidth write SetAutoWidth
      default True;
    property GridLineColor;
    property EndEllipsis;
    property OnlySelected;
    property TextAlignX: TdxTextAlignX read FTextAlignX write SetTextAlignX
      default taLeft;
    property TextAlignY: TdxTextAlignY read FTextAlignY write SetTextAlignY
      default taCenterY;
    property Width: Integer read FWidth write SetWidth
      stored IsWidthStored;
  end;

const  
  dxDefaultListBoxWidth = 400;
  dxDefaultGridPaintOptions: TdxGridPaintOptions = 
    [gpoBorder, gpoHorzLines, gpoVertLines, gpoFixedHorzLines, gpoFixedVertLines];  
    
implementation
uses
  dxPSUtl;

constructor TAbstractdxGridReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFixedFont := TFont.Create;
  FEvenFont := TFont.Create;
  InternalRestoreDefaults;  
  FFixedFont.OnChange := FontChanged;
  FEvenFont.OnChange := FontChanged;  
  LinkModified(False);
  FCurrentCol := -1;
  FCurrentRow := -1;
  FRowHeights := TList.Create;
end;

destructor TAbstractdxGridReportLink.Destroy;
begin
  FRowHeights.Free;
  FEvenFont.Free;
  FFixedFont.Free;
  inherited Destroy;
end;

procedure TAbstractdxGridReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TAbstractdxGridReportLink) then
  begin
    DrawMode := TAbstractdxGridReportLink(Source).DrawMode;
    Effects3D := TAbstractdxGridReportLink(Source).Effects3D;
    EndEllipsis := TAbstractdxGridReportLink(Source).EndEllipsis;
    EvenColor := TAbstractdxGridReportLink(Source).EvenColor;
    EvenFont := TAbstractdxGridReportLink(Source).EvenFont;
    FixedColor := TAbstractdxGridReportLink(Source).FixedColor;
    FixedFont := TAbstractdxGridReportLink(Source).FixedFont;
    FixedTransparent := TAbstractdxGridReportLink(Source).FixedTransparent;
    GridLineColor := TAbstractdxGridReportLink(Source).GridLineColor;
    IncludeFixed := TAbstractdxGridReportLink(Source).IncludeFixed;
    OnlySelected := TAbstractdxGridReportLink(Source).OnlySelected;
    Multiline := TAbstractdxGridReportLink(Source).Multiline;
    RowAutoHeight := TAbstractdxGridReportLink(Source).RowAutoHeight;
    Soft3D := TAbstractdxGridReportLink(Source).Soft3D;
    SupportedCustomDraw := TAbstractdxGridReportLink(Source).SupportedCustomDraw;
  end;
end;

procedure TAbstractdxGridReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  DrawMode := gdmStrict;
  Effects3D := False;
  EndEllipsis := False;
  FEvenColor := dxDefaultColor;
  FixedColor := dxDefaultFixedColor;
  EvenFont := Font;
  FixedFont := Font;
  FixedFont.Style := [fsBold];
  FixedTransparent := False;
  GridLineColor := dxDefaultGridLineColor;
  IncludeFixed := True;
  Multiline := False;
  OnlySelected := False;
  RowAutoHeight := False;
  Soft3D := True;
  SupportedCustomDraw := False;
end;

procedure TAbstractdxGridReportLink.SetDrawMode(Value: TdxGridDrawMode);
begin
  if (FDrawMode <> Value) then
  begin
    FDrawMode := Value;
    LinkModified(True);
  end;
end;

function TAbstractdxGridReportLink.GetOddFont: TFont;
begin
  Result := inherited Font;
end;

procedure TAbstractdxGridReportLink.SetEvenFont(Value: TFont);
begin
  FEvenFont.Assign(Value)
end;

procedure TAbstractdxGridReportLink.SetFixedFont(Value: TFont);
begin
  FFixedFont.Assign(Value)
end;

procedure TAbstractdxGridReportLink.SetOddFont(Value: TFont);
begin
  inherited Font := Value;
end;

procedure TAbstractdxGridReportLink.SetSupportedCustomDraw(Value: Boolean);
begin
  if (FSupportedCustomDraw <> Value) then
  begin
    FSupportedCustomDraw := Value;
    LinkModified(True);
  end;
end;

procedure TAbstractdxGridReportLink.SetOnlySelected(Value: Boolean);
begin
  if (FOnlySelected <> Value) then
  begin
    FOnlySelected := Value;
    LinkModified(True);
  end;
end;

procedure TAbstractdxGridReportLink.SetIncludeFixed(Value: Boolean);
begin
  if (FIncludeFixed <> Value) then
  begin
    FIncludeFixed := Value;
    LinkModified(True);
  end;
end;

procedure TAbstractdxGridReportLink.SetGridLineColor(Value: TColor);
begin
  if (FGridLineColor <> Value) then
  begin
    FGridLineColor := Value;
    LinkModified(True);
  end;
end;

function TAbstractdxGridReportLink.GetOddColor: TColor;
begin
  Result := Color;
end;

function TAbstractdxGridReportLink.GetMultiline: Boolean;
begin
  Result := FMultiline;
end;

procedure TAbstractdxGridReportLink.SetOddColor(Value: TColor);
begin
  inherited Color := Value;
end;

procedure TAbstractdxGridReportLink.SetEvenColor(Value: TColor);
begin
  if (FEvenColor <> Value) then 
  begin
    FEvenColor := Value;
    LinkModified(True);
  end;
end;

procedure TAbstractdxGridReportLink.SetFixedColor(Value: TColor);
begin
  if (FFixedColor <> Value) then
  begin
    FFixedColor := Value;
    LinkModified(True);
  end;
end;

procedure TAbstractdxGridReportLink.SetFixedTransparent(Value: Boolean);
begin
  if (FFixedTransparent <> Value) then
  begin
    FFixedTransparent := Value;
    LinkModified(True);
  end;
end;

procedure TAbstractdxGridReportLink.SetRowAutoHeight(Value: Boolean);
begin
  if (FRowAutoHeight <> Value) then
  begin
    FRowAutoHeight := Value;
    LinkModified(True);
  end;
end;

procedure TAbstractdxGridReportLink.SetEndEllipsis(Value: Boolean);
begin
  if (FEndEllipsis <> Value) then 
  begin
    FEndEllipsis := Value;
    LinkModified(True);    
  end;
end;

procedure TAbstractdxGridReportLink.SetMultiline(Value: Boolean);    
begin
  if (FMultiline <> Value) then 
  begin
    FMultiline := Value;
    LinkModified(True);    
  end;
end;

procedure TAbstractdxGridReportLink.SetEffects3D(Value: Boolean);
begin
  if (Effects3D <> Value) then
  begin
    FEffects3D := Value;
    LinkModified(True);
  end;
end;

procedure TAbstractdxGridReportLink.SetSoft3D(Value: Boolean);
begin
  if (Soft3D <> Value) then
  begin
    FSoft3D := Value;
    LinkModified(True);
  end;
end;

function TAbstractdxGridReportLink.GetColumnColor(ACol: Integer): TColor;
begin
  Result := Color;
end;

function TAbstractdxGridReportLink.GetColumnFontIndex(ACol: Integer): Integer;
begin
  Result := FFontIndex;
end;

function TAbstractdxGridReportLink.GetColumnFont(ACol: Integer): TFont;
begin
  Result := Font;
end;

function TAbstractdxGridReportLink.GetColumnMultiline(ACol: Integer): Boolean;
begin
  Result := Multiline or RowAutoHeight;
end;

procedure TAbstractdxGridReportLink.GetCellColRow(AItem: TAbstractdxReportCellData; 
  var ACol, ARow: Integer);
begin
  ARow := AItem.Data div GetColCount;
  ACol := AItem.Data - ARow * GetColCount;
end;

function TAbstractdxGridReportLink.GetCellColor(ACol, ARow: Integer): TColor;
begin
  if IsFixedCell(ACol, ARow) then 
    Result := FixedColor 
  else
    case DrawMode of
      gdmStrict: 
        Result := Color;
      gdmOddEven: 
        if Odd(ARow) then 
          Result := Color
        else 
          Result := EvenColor;
      gdmChess:   
        if not Odd((ACol - GetFixedColCount) + (ARow - GetFixedRowCount)) then 
          Result := Color
        else 
          Result := EvenColor;
      else {gdmBorrowSource}
        Result := GetColumnColor(ACol);
    end;
end;

function TAbstractdxGridReportLink.GetCellTransparent(ACol, ARow: Integer): Boolean;
begin
  if IsFixedCell(ACol, ARow) then
    Result := FixedTransparent
  else
    Result := Self.Transparent;
end;

function TAbstractdxGridReportLink.GetCellFont(ACol, ARow: Integer): TFont;
begin
  if IsFixedCell(ACol, ARow) then 
    Result := FixedFont
  else
    case DrawMode of
      gdmStrict: 
        Result := Font;
      gdmOddEven: 
        if Odd(ARow) then 
          Result := Font
        else 
          Result := EvenFont;
      gdmChess:   
        if not Odd((ACol - GetFixedColCount) + (ARow - GetFixedRowCount)) then 
          Result := Font
        else 
          Result := EvenFont;
      else {gdmBorrowSource}
        Result := GetColumnFont(ACol);
    end;
end;

function TAbstractdxGridReportLink.GetCellFontIndex(ACol, ARow: Integer): Integer;
begin
  if IsFixedCell(ACol, ARow) then 
    Result := FFixedFontIndex
  else
    case DrawMode of
      gdmStrict: 
        Result := FFontIndex;
      gdmOddEven: 
        if Odd(ARow) then 
          Result := FFontIndex
        else 
          Result := FEvenFontIndex;
      gdmChess:   
        if not Odd((ACol - GetFixedColCount) + (ARow - GetFixedRowCount)) then 
          Result := FFontIndex
        else 
          Result := FEvenFontIndex;
      else {gdmBorrowSource}
        Result := GetColumnFontIndex(ACol);
    end;
end;

procedure TAbstractdxGridReportLink.AssignData(ACol, ARow: Integer; ADataItem: TAbstractdxReportCellData);
begin
  with ADataItem do
  begin
    Data := ACol + ARow * GetColCount;
    Transparent := GetCellTransparent(ACol, ARow);
    if not Transparent then 
      Color := GetCellColor(ACol, ARow);
    FontIndex := GetCellFontIndex(ACol, ARow);
    CellSides := GetCellSides(ACol, ARow);
    EdgeMode := GetCellEdgeMode(ADataItem, ACol, ARow);
  end;

  if ADataItem is TdxReportCellString then
    with TdxReportCellString(ADataItem) do
    begin
      Text := GetCellText(ACol, ARow);
      EndEllipsis := GetEndEllipsis;
      Multiline := GetColumnMultiline(ACol);
      TextAlignX := GetTextAlignX(ACol, ARow);
      if Multiline then 
        TextAlignY := taTop
      else 
        TextAlignY := GetTextAlignY(ACol, ARow);
    end;
end;

const
  cCalcFormat: UINT = DT_NOPREFIX or DT_WORDBREAK or DT_CALCRECT;

procedure TAbstractdxGridReportLink.CalcRowHeights(AReportCells: TdxReportCells);
var
  DC: hDC;
  PrevFont: HFONT;
  Size: TSize;
  R: TRect;
  V, H, i, j, MinFixedRowHeight, MinRowHeight: Integer;
  S: string;
begin
  FRowHeights.Clear;
  DC := GetDC(0);
  try
    PrevFont := SelectObject(DC, Font.Handle);
    GetTextExtentPoint32(DC, 'Wg', Length('Wg'), Size);
    MinRowHeight := Size.cY + 6;
    SelectObject(DC, FixedFont.Handle);
    GetTextExtentPoint32(DC, 'Wg', Length('Wg'), Size);
    MinFixedRowHeight := Size.cY + 6;
    FRowHeights.Capacity := GetRowCount;
    for i := 0 to GetRowCount - 1 do
    begin
      V := GetGridRowHeight(i);
      if RowAutoHeight then
        for j := 0 to GetColCount - 1 do
        begin
          SelectObject(DC, GetCellFont(j, i).Handle);
          S := GetCellText(j, i);
          R := Rect(0, 0, GetColWidth(j), V);
          H := 2 + Windows.DrawText(DC, PChar(S), Length(S), R, 
            cCalcFormat or dxDrawTextTextAlignX[GetTextAlignX(j, i)] or 
                           dxDrawTextTextAlignY[GetTextAlignY(j, i)]);
          if (V < H) then V := H;
        end;

      if IsFixedRow(i) or (GetFixedColCount > 0) then
      begin
        if (V < MinFixedRowHeight) then V := MinFixedRowHeight
      end
      else 
        if (V < MinRowHeight) then V := MinRowHeight;

      FRowHeights.Add(Pointer(V));
    end;
    SelectObject(DC, PrevFont);
  finally
    ReleaseDC(0, DC);
  end;
end;

function TAbstractdxGridReportLink.IsSupportedCustomDraw(AItem: TAbstractdxReportCellData): Boolean;
begin
  Result := SupportedCustomDraw;
end;

function TAbstractdxGridReportLink.GetCellEdgeMode(AItem: TAbstractdxReportCellData;
  ACol, ARow: Integer): TdxCellEdgeMode; 
begin
  Result := cemSingle;
  if IsFixedCell(ACol, ARow) then
  begin
    Result := TdxCellEdgeMode(Effects3D);
    if Result = cem3DEffects then
    begin
      AItem.InnerEdge := cesRaised;
      if not Soft3D then 
        AItem.OuterEdge := cesRaised;
    end;
  end;
end;

function TAbstractdxGridReportLink.GetCellSides(ACol, ARow: Integer): TdxCellSides;
begin
  Result := csAll;
end;

function TAbstractdxGridReportLink.GetColWidth(ACol: Integer): Integer;
begin
  Result := GetGridColWidth(ACol);
end;

function TAbstractdxGridReportLink.GetColCount: Integer;
begin
  Result := 0;
end;

function TAbstractdxGridReportLink.GetDataItemClass(ACol: Integer): TdxReportCellDataClass;
begin
  Result := TdxReportCellString;
end;

function TAbstractdxGridReportLink.GetEndEllipsis: Boolean;
begin
  Result := FEndEllipsis;
end;

function TAbstractdxGridReportLink.GetFixedColCount: Integer;
begin
  Result := 0;
end;

function TAbstractdxGridReportLink.GetFixedRowCount: Integer;
begin
  Result := 0;
end;

function TAbstractdxGridReportLink.GetGridColWidth(ACol: Integer): Integer;
begin
  Result := 0;
end;

function TAbstractdxGridReportLink.GetGridRowHeight(ARow: Integer): Integer;
begin
  Result := 0;
end;

function TAbstractdxGridReportLink.GetRowCount: Integer;
begin
  Result := 0;
end;

procedure TAbstractdxGridReportLink.GetSelectedRange(ABeginCol, AEndCol,
  ABeginRow, AEndRow: PInteger);
begin
  if ABeginCol <> nil then ABeginCol^ := 0;
  if AEndCol <> nil then AEndCol^ := 0;
  if ABeginRow <> nil then ABeginRow^ := 0;
  if AEndRow <> nil then AEndRow^ := 0;
end;
  
function TAbstractdxGridReportLink.GetRowHeight(ARow: Integer): Integer;
begin
  Result := Integer(FRowHeights[ARow]);
end;

function TAbstractdxGridReportLink.GetTextAlignX(ACol, ARow: Integer): TdxTextAlignX;
begin
  Result := taLeft;
end;

function TAbstractdxGridReportLink.GetTextAlignY(ACol, ARow: Integer): TdxTextAlignY;
begin
  Result := taCenterY;
end;

function TAbstractdxGridReportLink.IsDrawBorder: Boolean;
begin
  Result := True;
end;

function TAbstractdxGridReportLink.IsDrawHorzLines: Boolean;
begin
  Result := True;
end;

function TAbstractdxGridReportLink.IsDrawVertLines: Boolean;
begin
  Result := True;
end;

function TAbstractdxGridReportLink.IsDrawFixedHorzLines: Boolean;
begin
  Result := True;
end;

function TAbstractdxGridReportLink.IsDrawFixedVertLines: Boolean;
begin
  Result := True;
end;

function TAbstractdxGridReportLink.IsFixedCell(ACol, ARow: Integer): Boolean;
begin
  Result := IsFixedCol(ACol) or IsFixedRow(ARow);
end;

function TAbstractdxGridReportLink.IsFixedCol(ACol: Integer): Boolean;
begin
  Result := ACol < GetFixedColCount;
end;

function TAbstractdxGridReportLink.IsFixedRow(ARow: Integer): Boolean;
begin
  Result := ARow < GetFixedRowCount;
end;

function TAbstractdxGridReportLink.IsFooterRow(ARow: Integer): Boolean;
begin
  Result := False;
end;

function TAbstractdxGridReportLink.IsHeaderRow(ARow: Integer): Boolean;
begin
  Result := IsFixedRow(ARow);
end;

function TAbstractdxGridReportLink.IsSelectedCell(ACol, ARow: Integer): Boolean;
begin
  Result := False;
end;

function TAbstractdxGridReportLink.IsSelectedExists: Boolean;
begin
  Result := OnlySelected;
end;

function TAbstractdxGridReportLink.IsSelectedExistsInRow(ARow: Integer): Boolean;
begin
  Result := False;
end;

function TAbstractdxGridReportLink.IsSelectedRow(ARow: Integer): Boolean;
begin
  Result := False;
end;

procedure TAbstractdxGridReportLink.NextCol;
begin
  Inc(FCurrentCol);
end;

procedure TAbstractdxGridReportLink.NextRow;
begin
  Inc(FCurrentRow);
end;

procedure TAbstractdxGridReportLink.PrepareConstruct(AReportCells: TdxReportCells);
begin
  CalcRowHeights(AReportCells);
  FFixedFontIndex := AddFontToPool(FixedFont);
  FEvenFontIndex := AddFontToPool(EvenFont);
end;

procedure TAbstractdxGridReportLink.UnprepareConstruct(AReportCells: TdxReportCells);
begin
end;

procedure TAbstractdxGridReportLink.MakeDelimiters(AReportCells: TdxReportCells;
  AHorzDelimiters, AVertDelimiters: TList);
var
  I: Integer;
begin
  inherited MakeDelimiters(AReportCells, AHorzDelimiters, AVertDelimiters);
  with AReportCells do
  begin
    if UseHorzDelimiters then 
      if Cells.CellCount > 0 then
        for I := 1 to Cells[0].DataItemCount - 1 do
          AHorzDelimiters.Add(Pointer(Cells[0].DataItems[I].AbsoluteOrigin.X));
    if UseVertDelimiters then 
      for I := 1 to Cells.CellCount - 1 do
        AVertDelimiters.Add(Pointer(Cells[I].AbsoluteOrigin.Y));
  end;    
end;

function TAbstractdxGridReportLink.GetProcessedColCount: Integer;
begin
  if IsSelectedExists then
    Result := GetSelectedColCount
  else
    Result := GetColCount;
end;

function TAbstractdxGridReportLink.GetProcessedRowCount: Integer;
begin
  if IsSelectedExists then
    Result := GetSelectedRowCount
  else
    Result := GetRowCount;
end;

function TAbstractdxGridReportLink.GetSelectedColCount: Integer;
begin
  Result := 0; 
end;

function TAbstractdxGridReportLink.GetSelectedRowCount: Integer;
begin
  Result := 0;
end;

procedure TAbstractdxGridReportLink.ConstructReport(AReportCells: TdxReportCells);
var
  Item: TdxReportItem;
  DataClass: TdxReportCellDataClass;
  DataItem: TAbstractdxReportCellData;
  Cell, Parent: TdxReportCell;
  Row, Col, FullCount: Integer;
  R, R2, R3: TRect;
begin
  if Component = nil then Exit;
  inherited ConstructReport(AReportCells);
  PrepareConstruct(AReportCells);
  try
    FullCount := GetProcessedRowCount;
    with AReportCells do
    begin
      BorderColor := GridLineColor;
      Cells.FontIndex := 0;
      Cells.Color := Self.Color;
      if FootersOnEveryPage then
      begin
        FooterCells.FontIndex := FFixedFontIndex;
        FooterCells.Color := FixedColor;
      end;
      if HeadersOnEveryPage then
      begin
        HeaderCells.FontIndex := FFixedFontIndex;
        HeaderCells.Color := FixedColor;
      end;
    end;
    R := Rect(0, 0, 0, 0);
    for Col := 0 to GetColCount - 1 do
      Inc(R.Right, GetColWidth(Col));
    FCurrentRow := 0;
    for Row := 0 to GetRowCount - 1 do
    begin
      if not IsSelectedExists or IsSelectedExistsInRow(Row) then
      begin
        R.Top := R.Bottom;
        R.Bottom := R.Top + GetRowHeight(Row);
        
        if HeadersOnEveryPage and IsHeaderRow(Row) then
          Parent := AReportCells.HeaderCells
        else 
          if FootersOnEveryPage and IsFooterRow(Row) then
            Parent := AReportCells.FooterCells
          else
            Parent := AReportCells.Cells;
            
        Cell := TdxReportCell.Create(Parent);
        Cell.BoundsRect := R;
        Item := Cell.GetPrevSibling;
        if Item <> nil then
          Cell.Top := TdxReportVisualItem(Item).BoundsRect.Bottom
        else
          Cell.Top := 0;
        Cell.Transparent := True;
        R2 := Rect(0, 0, 0, R.Bottom - R.Top);
        
        if IsDrawBorder then 
        begin
          Cell.CellSides := [csLeft, csRight];
          if Cell.Index = 0 then 
            Cell.CellSides := Cell.CellSides + [csTop];
        end
        else
          Cell.CellSides := [];
        if Effects3D and IsDrawBorder then 
        begin
          if IsFixedRow(Row) and (Row = GetFixedRowCount - 1) then 
            Cell.CellSides := [csTop];
          if GetFixedColCount > 0 then 
            Cell.CellSides := Cell.CellSides + [csLeft];
        end;
        FCurrentCol := 0;
        for Col := 0 to GetColCount - 1 do
        begin
          if not IsSelectedExists or IsSelectedCell(Col, Row) then
          begin
            R2.Left := R2.Right;
            R2.Right := R2.Left + GetColWidth(Col);
            DataClass := GetDataItemClass(Col);
            if DataClass <> nil then
            begin
              DataItem := DataClass.Create(Cell);
              R3 := R2;
              if Effects3D and IsFixedCell(Col, Row) then
              begin
                Inc(R3.Left);
                Inc(R3.Top);
              end;
              DataItem.BoundsRect := R3;
              AssignData(Col, Row, DataItem);
            end;
          end;
          NextCol;
        end;
        AReportCells.DoProgress(MulDiv(Row, 100, FullCount));
      end;
      NextRow;
    end;
  finally
    UnprepareConstruct(AReportCells);
  end;

  with AReportCells.Cells do
    if CellCount > 0 then
      BoundsRect := Rect(0, 0, LastCell.BoundsRect.Right, LastCell.BoundsRect.Bottom);
  if FootersOnEveryPage then
    with AReportCells.FooterCells do
      if CellCount > 0 then
        BoundsRect := Rect(0, 0, LastCell.BoundsRect.Right, LastCell.BoundsRect.Bottom);
  if HeadersOnEveryPage then
    with AReportCells.HeaderCells do
      if CellCount > 0 then
        BoundsRect := Rect(0, 0, LastCell.BoundsRect.Right, LastCell.BoundsRect.Bottom);
end;

type
  TCustomGridAccess = class(TCustomGrid);
  
function ExposeGrid(ACustomGrid: TCustomGrid): TCustomGridAccess;
begin
  Result := TCustomGridAccess(ACustomGrid);
end;


{ TCustomdxGridReportLink }

procedure TCustomdxGridReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TCustomdxGridReportLink) then
    Options := TCustomdxGridReportLink(Source).Options;  
end;

function TCustomdxGridReportLink.GetCustomGrid: TCustomGrid;
begin
  Result := TCustomGrid(Component);
end;

procedure TCustomdxGridReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  Options := dxDefaultGridPaintOptions; {[Low(TdxDrawGridPaintOption)..High(TdxDrawGridPaintOption)]}
end;

procedure TCustomdxGridReportLink.InternalRestoreFromOriginal;

  procedure XorOption(var AOptions: TdxGridPaintOptions; AElement: TdxGridPaintOption; 
     Value: Boolean);
  begin  
    if Value then
      AOptions := Options + [AElement]
    else
      AOptions := Options - [AElement];
  end;
  
var  
  Opt: TdxGridPaintOptions;
begin
  inherited InternalRestoreFromOriginal;
  FixedColor := ExposeGrid(CustomGrid).FixedColor;
  Opt := Options;
  XorOption(Opt, gpoFixedVertLines, goFixedVertLine in ExposeGrid(CustomGrid).Options);
  XorOption(Opt, gpoFixedHorzLines, goFixedHorzLine in ExposeGrid(CustomGrid).Options);
  XorOption(Opt, gpoVertLines, goVertLine in ExposeGrid(CustomGrid).Options);
  XorOption(Opt, gpoHorzLines, goHorzLine in ExposeGrid(CustomGrid).Options);                
  Options := Opt;
end;

function TCustomdxGridReportLink.IsDrawBorder: Boolean;
begin
  Result := gpoBorder in Options;
end;

function TCustomdxGridReportLink.IsDrawHorzLines: Boolean;
begin
  Result := gpoHorzLines in Options;
end;

function TCustomdxGridReportLink.IsDrawVertLines: Boolean;
begin
  Result := gpoVertLines in Options;
end;

function TCustomdxGridReportLink.IsDrawFixedHorzLines: Boolean;
begin
  Result := gpoFixedHorzLines in Options;
end;

function TCustomdxGridReportLink.IsDrawFixedVertLines: Boolean;
begin
  Result := gpoFixedVertLines in Options;
end;

function TCustomdxGridReportLink.GetOptions: TdxGridPaintOptions;
begin
  Result := FOptions;
end;

procedure TCustomdxGridReportLink.SetOptions(Value: TdxGridPaintOptions);
begin
  if (FOptions <> Value) then
  begin
    FOptions := Value;
    LinkModified(True);
  end;
end;

function TCustomdxGridReportLink.GetCellSides(ACol, ARow: Integer): TdxCellSides;

  function GetRealFirstCol: Integer;
  begin
    if not IsSelectedExists or IncludeFixed then
      Result := 0
    else
      GetSelectedRange(@Result, nil, nil, nil);
  end;

  function GetRealFirstRow: Integer;
  begin
    if not IsSelectedExists or IncludeFixed then
      Result := 0
    else
      GetSelectedRange(nil, nil, @Result, nil);
  end;

  function GetRealLastCol: Integer;
  begin
    if not IsSelectedExists then
      Result := GetColCount - 1
    else
      GetSelectedRange(nil, @Result, nil, nil);
  end;

  function GetRealLastRow: Integer;
  begin
    if not IsSelectedExists then
      Result := GetRowCount - 1
    else
      GetSelectedRange(nil, nil, nil, @Result);
  end;

var
  ABeginCol, AEndCol, ABeginRow, AEndRow: Integer;
begin
  Result := csAll;
  if not IsDrawBorder then
  begin
    if ACol = GetRealFirstCol then Exclude(Result, csLeft);
    if ACol = GetRealLastCol then Exclude(Result, csRight);
    if ARow = GetRealFirstRow then Exclude(Result, csTop);
    if ARow = GetRealLastRow then Exclude(Result, csBottom);
  end;
  if IsFixedCell(ACol, ARow) then
  begin
    if not IsDrawFixedHorzLines then
    begin
      if (ARow > 0) then Exclude(Result, csTop);
      if IsFixedCol(ACol) then 
      begin
        if (ARow < GetRealLastRow) then 
          Exclude(Result, csBottom)
      end
      else
        if (ARow < GetFixedRowCount - Byte(IsDrawHorzLines)) then 
          Exclude(Result, csBottom);  
    end;
    if not IsDrawFixedVertLines then 
    begin
      if (ACol > 0) then Exclude(Result, csLeft);
      if IsFixedRow(ARow) then 
      begin
        if (ACol < GetRealLastCol) then 
          Exclude(Result, csRight)
      end
      else
        if (ACol < GetFixedColCount - Byte(IsDrawVertLines)) then 
          Exclude(Result, csRight);  
    end;
  end
  else
  begin
    if not IsDrawHorzLines then 
    begin
      if IsSelectedExists then
        GetSelectedRange(nil, nil, @ABeginRow, @AEndRow)
      else
      begin
        ABeginRow := GetFixedRowCount - 1;
        AEndRow := GetRowCount - 1;
      end;  
      if (ARow < AEndRow) then
        if (ARow > ABeginRow) or (IsSelectedExists and IncludeFixed) then 
          Result := Result - [csTop, csBottom]          
        else
          Exclude(Result, csBottom)
      else 
        if (ARow > ABeginRow) or (IsSelectedExists and IncludeFixed) then 
          Exclude(Result, csTop);
    end;
    if not IsDrawVertLines then 
    begin 
      if IsSelectedExists then
        GetSelectedRange(@ABeginCol, @AEndCol, nil, nil)
      else
      begin
        ABeginCol := GetFixedColCount - 1;
        AEndCol := GetColCount - 1;
      end;  
      if (ACol < AEndCol) then
        if (ACol > ABeginCol) or (IsSelectedExists and IncludeFixed) then 
          Result := Result - [csLeft, csRight]          
        else
          Exclude(Result, csRight)
      else 
        if (ACol > ABeginCol) or (IsSelectedExists and IncludeFixed) then 
          Exclude(Result, csLeft)
    end;    
  end;
end;

function TCustomdxGridReportLink.GetColCount: Integer;
begin
  Result := ExposeGrid(CustomGrid).ColCount;
end;

function TCustomdxGridReportLink.GetGridColWidth(ACol: Integer): Integer;
begin
  Result := ExposeGrid(CustomGrid).ColWidths[ACol];
end;

function TCustomdxGridReportLink.GetGridRowHeight(ARow: Integer): Integer;
begin
  Result := ExposeGrid(CustomGrid).RowHeights[ARow];
end;

function TCustomdxGridReportLink.GetFixedColCount: Integer;
begin
  Result := ExposeGrid(CustomGrid).FixedCols;
end;

function TCustomdxGridReportLink.GetFixedRowCount: Integer;
begin
  Result := ExposeGrid(CustomGrid).FixedRows;
end;

function TCustomdxGridReportLink.GetRowCount: Integer;
begin
  Result := ExposeGrid(CustomGrid).RowCount;
end;

procedure TCustomdxGridReportLink.GetSelectedRange(ABeginCol, AEndCol, 
  ABeginRow, AEndRow: PInteger);
begin
  with ExposeGrid(CustomGrid) do
  begin
    if ABeginCol <> nil then ABeginCol^ := Selection.Left;
    if AEndCol <> nil then AEndCol^ := Selection.Right;
    if ABeginRow <> nil then ABeginRow^ := Selection.Top;
    if AEndRow <> nil then AEndRow^ := Selection.Bottom;
  end;  
end;  

function TCustomdxGridReportLink.GetSelectedColCount: Integer;
var
  BeginCol, EndCol: Integer;
begin
  GetSelectedRange(@BeginCol, @EndCol, nil, nil);
  Result := BeginCol - EndCol + 1;
  if IncludeFixed then Inc(Result, GetFixedColCount);
end;

function TCustomdxGridReportLink.GetSelectedRowCount: Integer;
var
  BeginRow, EndRow: Integer;
begin
  GetSelectedRange(nil, nil, @BeginRow, @EndRow);
  Result := BeginRow - EndRow + 1;
  if IncludeFixed then Inc(Result, GetFixedRowCount);
end;

function TCustomdxGridReportLink.IsSelectedCell(ACol, ARow: Integer): Boolean;
var
  BeginCol, EndCol, BeginRow, EndRow: Integer;
begin
  GetSelectedRange(@BeginCol, @EndCol, @BeginRow, @EndRow);
  Result := (ACol >= BeginCol) and (ACol <= EndCol) and
            (ARow >= BeginRow) and (ARow <= EndRow);
            
  if not Result and IncludeFixed and IsFixedCell(ACol, ARow) then
    Result := ((ACol >= BeginCol) and (ACol <= EndCol)) or
              ((ARow >= BeginRow) and (ARow <= EndRow)) or
               (ACol < ExposeGrid(CustomGrid).FixedCols) and 
               (ARow < ExposeGrid(CustomGrid).FixedRows);
end;

function TCustomdxGridReportLink.IsSelectedExists: Boolean;
var
  BeginCol, EndCol, BeginRow, EndRow: Integer;
begin
  GetSelectedRange(@BeginCol, @EndCol, @BeginRow, @EndRow);
  Result := inherited IsSelectedExists; 
  if Result then 
  begin 
    GetSelectedRange(@BeginCol, @EndCol, @BeginRow, @EndRow);  
    Result := (EndCol >= BeginCol) and (EndRow >= BeginRow);
  end;  
end;

function TCustomdxGridReportLink.IsSelectedExistsInRow(ARow: Integer): Boolean;
var
  BeginRow, EndRow: Integer;
begin
  GetSelectedRange(nil, nil, @BeginRow, @EndRow);
  Result := (ARow >= BeginRow) and (ARow <= EndRow);
  if not Result then
    Result := IncludeFixed and (ARow < ExposeGrid(CustomGrid).FixedRows);
end;


{ TdxCustomListBoxReportLink }

constructor TdxCustomListBoxReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTextAlignX := taLeft;
  FTextAlignY := taCenterY;
  FSaveFont := TFont.Create;
  FSaveFont.OnChange := CustomDrawFontChanged;
end;

destructor TdxCustomListBoxReportLink.Destroy;
begin
  FSaveFont.Free;
  inherited Destroy;
end;

procedure TdxCustomListBoxReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TdxCustomListBoxReportLink then
  begin
    AutoWidth := TdxCustomListBoxReportLink(Source).AutoWidth;
    TextAlignX := TdxCustomListBoxReportLink(Source).TextAlignX;
    TextAlignY := TdxCustomListBoxReportLink(Source).TextAlignY;
    Width := TdxCustomListBoxReportLink(Source).Width;
  end;
end;

type
  TListBoxAccess = class(TCustomListBox);

function ExposeList(AListBox: TCustomListBox): TListBoxAccess;
begin
  Result := TListBoxAccess(AListBox);
end;

procedure TdxCustomListBoxReportLink.UnprepareConstruct(AReportCells: TdxReportCells);
  {
var 
  i: Integer;
  W, CalcedAutoWidth: Integer;
  DC: hDC;
  S: string;
  R: TRect;
  PrevFont: HFONT;
  }
begin
  {
  if AutoWidth then 
  begin
    DC := GetDC(0);
    PrevFont :=  SelectObject(DC, Font.Handle);
    CalcedAutoWidth := 0;
    for i := 0 to AReportCells.Count - 1 do 
    begin
      S := TdxReportCellString(AReportCells.Cells[i].DataItems[0]).Text;
      R := Rect(0, 0, Width, 0);
      Windows.DrawText(DC, PChar(S), Length(S), R, 
        cCalcFormat or dxDrawTextTextAlignX[GetTextAlignX(0, i)] or 
                       dxDrawTextTextAlignY[GetTextAlignY(0, i)]);
      W := R.Right - R.Left;
      if (CalcedAutoWidth < W) then CalcedAutoWidth := W;
    end;
    SelectObject(DC, PrevFont);    
    ReleaseDC(0, DC);
    for i := 0 to AReportCells.Count - 1 do 
      AReportCells.Cells[i].Width := CalcedAutoWidth;
  end;
  }
  inherited UnprepareConstruct(AReportCells); 
end;

procedure TdxCustomListBoxReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  AutoWidth := True;
  TextAlignX := dxPSCore.dxDefaultTextAlignX; {taLeft}
  TextAlignY := dxPSCore.dxDefaultTextAlignY; {taCenterY}
  Width := dxDefaultListBoxWidth;
end;

procedure TdxCustomListBoxReportLink.InternalRestoreFromOriginal; 
begin
  inherited InternalRestoreFromOriginal;
  Width := CustomListBox.Width;
end;

function TdxCustomListBoxReportLink.GetCustomListBox: TCustomListBox;
begin
  Result := TCustomListBox(Component);
end;

procedure TdxCustomListBoxReportLink.CustomDrawFontChanged(Sender: TObject);
begin
  FCustomDrawFontChanged := True;
end;

function TdxCustomListBoxReportLink.IsSupportedCustomDraw(AItem: TAbstractdxReportCellData): Boolean;
begin
  Result := inherited IsSupportedCustomDraw(AItem) and Assigned(FOnCustomDrawItem);
end;

procedure TdxCustomListBoxReportLink.CustomDraw(AItem: TAbstractdxReportCellData;
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var ADone: Boolean);
var
  AColor: TColor;
  AText: string;
  ATextAlignX: TdxTextAlignX;
  ATextAlignY: TdxTextAlignY;
begin
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
    DoCustomDrawItem(AItem.Parent.Index, ACanvas, ABoundsRect, AClientRect, AText,
      FSaveFont, AColor, ATextAlignX, ATextAlignY, ADone);
    if not ADone then
    begin
      if FCustomDrawFontChanged then
      begin 
        SelectObject(ACanvas.Handle, FSaveFont.Handle);
        SetTextColor(ACanvas.Handle, ColorToRGB(FSaveFont.Color));
        FontIndex := -1;
      end;  
      if AColor <> clNone then
      begin
        Color := AColor;
        AItem.Transparent := False;
      end;
      Text := AText;
      TextAlignX := ATextAlignX;
      TextAlignY := ATextAlignY;
    end;
  end;
end;

procedure TdxCustomListBoxReportLink.DoCustomDrawItem(Index: Integer; 
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var AText: string; 
  AFont: TFont; var AColor: TColor; var ATextAlignX: TdxTextAlignX; 
  var ATextAlignY: TdxTextAlignY; var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawItem) then 
    FOnCustomDrawItem(Self, Index, ACanvas, ABoundsRect, AClientRect, AText, 
      AFont, AColor, ATextAlignX, ATextAlignY, ADone);
end;

function TdxCustomListBoxReportLink.GetCellText(ACol, ARow: Integer): string;
begin
  Result := ExposeList(CustomListBox).Items[ARow];
end;

function TdxCustomListBoxReportLink.GetCellSides(ACol, ARow: Integer): TdxCellSides;

  function IsFirstItem(AItemIndex: Integer): Boolean;
  var
    I: Integer;
  begin
    with ExposeList(CustomListBox) do
      if not OnlySelected or (SelCount = 0) then
        Result := AItemIndex = 0
      else
      begin
        for I := 0 to Items.Count - 1 do
          if Selected[I] then
          begin
            Result := AItemIndex = I;
            Exit;
          end;
        Result := False;
      end;
  end;

  function IsLastItem(AItemIndex: Integer): Boolean;
  var
    I: Integer;
  begin
    with ExposeList(CustomListBox) do
      if not OnlySelected or (SelCount = 0) then
        Result := AItemIndex = Items.Count - 1
      else
      begin
        for I := Items.Count - 1 downto 0 do
          if Selected[I] then
          begin
            Result := AItemIndex = I;
            Exit;
          end;
        Result := False;
      end;
  end;

begin
  Result := csAll;
  if not IsDrawBorder then
  begin
    Result := Result - [csLeft, csRight];
    if IsFirstItem(ARow) then Exclude(Result, csTop);
    if IsLastItem(ARow) then Exclude(Result, csBottom);
  end;
  if not IsDrawHorzLines then
  begin
    if not IsFirstItem(ARow) then Exclude(Result, csTop);
    if not IsLastItem(ARow) then Exclude(Result, csBottom);
  end;
end;

function TdxCustomListBoxReportLink.GetColCount: Integer;
begin
  Result := 1;
end;

function TdxCustomListBoxReportLink.GetGridColWidth(ACol: Integer): Integer;
begin
  Result := Width;
end;

function TdxCustomListBoxReportLink.GetGridRowHeight(ARow: Integer): Integer;
begin
  with ExposeList(CustomListBox) do
  begin
    Result := ItemHeight;
    if Style = lbOwnerDrawVariable then MeasureItem(ARow, Result);
    if Result < 2 then Result := 2;
  end;
end;

function TdxCustomListBoxReportLink.GetRowCount: Integer;
begin
  Result := CustomListBox.Items.Count
end;

function TdxCustomListBoxReportLink.GetSelectedColCount: Integer;
begin
  Result := 1;
end;

function TdxCustomListBoxReportLink.GetSelectedRowCount: Integer;
begin
  Result := CustomListBox.SelCount;
end;

function TdxCustomListBoxReportLink.IsSelectedCell(ACol, ARow: Integer): Boolean;
begin
  Result := IsSelectedRow(ARow);
end;

function TdxCustomListBoxReportLink.IsSelectedExists: Boolean;
begin
  Result := inherited IsSelectedExists and (CustomListBox.SelCount > 0);
end;

function TdxCustomListBoxReportLink.IsSelectedExistsInRow(ARow: Integer): Boolean;
begin
  Result := IsSelectedRow(ARow);
end;

function TdxCustomListBoxReportLink.IsSelectedRow(ARow: Integer): Boolean;
begin
  Result := IsSelectedExists and CustomListBox.Selected[ARow];
end;

function TdxCustomListBoxReportLink.GetTextAlignX(ACol, ARow: Integer): TdxTextAlignX;
begin
  Result := FTextAlignX;
end;

function TdxCustomListBoxReportLink.GetTextAlignY(ACol, ARow: Integer): TdxTextAlignY;
begin
  Result := FTextAlignY;
end;

function TdxCustomListBoxReportLink.IsWidthStored: Boolean;
begin
  Result := not AutoWidth;
end;

procedure TdxCustomListBoxReportLink.SetAutoWidth(Value: Boolean);
begin
  if FAutoWidth <> Value then 
  begin
    FAutoWidth := Value;
    LinkModified(True);
  end;
end;

procedure TdxCustomListBoxReportLink.SetWidth(Value: Integer);
begin
  if FWidth <> Value then 
  begin
    FWidth := Value;
    if not AutoWidth then LinkModified(True);
  end;
end;

function TdxCustomListBoxReportLink.IsDrawBorder: Boolean;
begin
  Result := True;
end;

function TdxCustomListBoxReportLink.IsDrawHorzLines: Boolean;
begin
  Result := True;
end;

procedure TdxCustomListBoxReportLink.SetTextAlignX(Value: TdxTextAlignX);
begin
  if FTextAlignX <> Value then
  begin
    FTextAlignX := Value;
    LinkModified(True);
  end;
end;

procedure TdxCustomListBoxReportLink.SetTextAlignY(Value: TdxTextAlignY);
begin
  if FTextAlignY <> Value then
  begin
    FTextAlignY := Value;
    LinkModified(True);
  end;
end;

end.
