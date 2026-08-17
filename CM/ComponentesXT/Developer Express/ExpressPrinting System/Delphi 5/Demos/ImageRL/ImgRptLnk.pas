unit ImgrptLnk;
interface

uses
  Classes, Graphics, ExtCtrls, dxPSCore;

type

  { TdxImageReportLink }
  TdxImageReportLink = class(TBasedxReportLink)
  private
    FBorderColor : TColor;
    FCenter : Boolean;
    FImgTransparent : Boolean;
    FPaintBorder : Boolean;
    FStretch : Boolean;
    function GetImage : TImage;
    procedure SetBorderColor(Value : TColor);
    procedure SetCenter(Value : Boolean);
    procedure SetImgTransparent(Value : Boolean);
    procedure SetStretch(Value : Boolean);
    procedure SetPaintBorder(Value : Boolean);
  protected
    procedure ConstructReport(AReportCells: TDXReportCells); override;
    procedure InternalRestoreDefaults; override;
    procedure InternalRestoreFromOriginal; override;
    procedure MakeDelimiters(AReportCells : TdxReportCells;
      AHorzDelimiters, AVertDelimiters : TList); override;
  public
    constructor Create(AOwner : TComponent); override;
    procedure Assign(Source : TPersistent); override;
    property Image: TImage read GetImage;
  published
    property BorderColor : TColor read FBorderColor write SetBorderColor
       default clBtnShadow;
    property Center : Boolean read FCenter write SetCenter
       default False;
    property Color;
    property ImgTransparent : Boolean read FImgTransparent write SetImgTransparent
       default False;
    property PaintBorder : Boolean read FPaintBorder write SetPaintBorder
       default False;
    property Stretch : Boolean read FStretch write SetStretch
       default False;
    property Transparent;
  end;

implementation

procedure TdxImageReportLink.Assign(Source : TPersistent);
begin
  inherited;
  BorderColor := TdxImageReportLink(Source).BorderColor;
  Center := TdxImageReportLink(Source).Center;
  ImgTransparent := TdxImageReportLink(Source).ImgTransparent;
  PaintBorder := TdxImageReportLink(Source).PaintBorder;
  Stretch := TdxImageReportLink(Source).Stretch;
end;

function TdxImageReportLink.GetImage : TImage;
begin
  Result := TImage(Component);
end;

procedure TdxImageReportLink.SetBorderColor(Value : TColor);
begin
  if ( FBorderColor <> Value ) then
  begin
    FBorderColor := Value;
    LinkModified(True);
  end;
end;

procedure TdxImageReportLink.SetCenter(Value : Boolean);
begin
  if ( FCenter <> Value ) then
  begin
    FCenter := Value;
    LinkModified(True);
  end;
end;

procedure TdxImageReportLink.SetImgTransparent(Value : Boolean);
begin
  if ( FImgTransparent <> Value ) then
  begin
    FImgTransparent := Value;
    LinkModified(True);
  end;
end;

procedure TdxImageReportLink.SetPaintBorder(Value : Boolean);
begin
  if ( FPaintBorder <> Value ) then
  begin
    FPaintBorder := Value;
    LinkModified(True);
  end;
end;

procedure TdxImageReportLink.SetStretch(Value : Boolean);
begin
  if ( FStretch <> Value ) then
  begin
    FStretch := Value;
    LinkModified(True);
  end;
end;

procedure TdxImageReportLink.ConstructReport(AReportCells: TDXReportCells);
var
  DataCell: TdxReportCellGraphic;
  Bmp: TBitmap;
  SaveProp: Boolean;
  RootCell: TdxReportCell;
begin
  if Assigned(Image) then
  begin
    inherited;
    if PaintBorder then
      AReportCells.BorderColor := BorderColor
    else
      AReportCells.Cells.CellSides := [];
    AReportCells.Cells.BoundsRect := Rect(0, 0, Image.Width, Image.Height);

    RootCell := TdxReportCell.Create(AReportCells.Cells);
    RootCell.Transparent := True;
    if not PaintBorder then
      RootCell.CellSides := [];
    RootCell.BoundsRect := AReportCells.Cells.BoundsRect;

    DataCell := TdxReportCellGraphic.Create(RootCell);
    Bmp := TBitmap.Create;
    try
      Bmp.Width := Image.Picture.Width;
      Bmp.Height := Image.Picture.Height;
      SaveProp := Image.Transparent;
      Image.Transparent := False;
      Bmp.Canvas.Draw(0, 0, Image.Picture.Graphic);
      Image.Transparent := SaveProp;
      DataCell.Image := Bmp;
    finally
      Bmp.Free;
    end;

    if FStretch then
      DataCell.DrawMode := gdmStretch
    else
      if FCenter then
        DataCell.DrawMode := gdmCenter
      else
        DataCell.DrawMode := gdmNone;
    DataCell.ImageTransparent := ImgTransparent;
    if not PaintBorder then
      DataCell.CellSides := [];
    DataCell.BoundsRect := RootCell.BoundsRect;
  end;
end;

procedure TdxImageReportLink.InternalRestoreDefaults;
begin
 inherited;
  FPaintBorder := False;
  FBorderColor := dxDefaultGridLineColor; {clBtnShadow }
  FImgTransparent := False;
  FStretch := False;
  FCenter := False;
end;

procedure TdxImageReportLink.InternalRestoreFromOriginal;
begin
  inherited;
  if Assigned(Image) then
  begin
    Center := Image.Center;
    Stretch := Image.Stretch;
    ImgTransparent := Image.Transparent;
  end;
end;

constructor TdxImageReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCenter := False;
  FBorderColor := dxDefaultGridLineColor; {clBtnShadow }
  FImgTransparent := False;
  FPaintBorder := False;
  FStretch := False;
end;

procedure TdxImageReportLink.MakeDelimiters(AReportCells: TdxReportCells;
  AHorzDelimiters, AVertDelimiters: TList);
begin
  AHorzDelimiters.Add(nil);
  AHorzDelimiters.Add(Pointer(ReportWidth));
  AVertDelimiters.Add(nil);
  AVertDelimiters.Add(Pointer(ReportHeight));
end;

initialization
  RegisterClass(TdxImageReportLink);
  dxPSRegisterReportLink(TdxImageReportLink, TImage, nil);

finalization
  dxPSUnRegisterReportLink(TdxImageReportLink, TImage, nil);

end.

