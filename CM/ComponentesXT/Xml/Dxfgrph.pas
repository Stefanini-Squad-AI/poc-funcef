{:
PURPOSE AND IMPLEMENTATION:
  This unit defines a descendant of TGraphic, TDxf for loading and
  viewing .DXF files exported from AutoCAD.  This unit has limited support for
  .DXF files.  At this time it supports these entities:  lines, circles, arcs,
  polylines, layers, and linetypes.  Support for linetypes could be more robust.
  Support for 3D is non-existent.  It also supports saving the DXF to a stream
  in a more compact/non-portable format useful for saving disk space.  Not only
  is this format more compact than a .DXF file but in loads in a fraction of the
  time.  This code is fairly well optimized for speed.

USAGE NOTES:
  This class supports printing via Nevrona's ReportPrinter Pro.  If you
  do not have this package installed you will want to disable printing
  support.  To do this comment out "RPDefine" and "RPBase" in the interface
  uses clause.  Also comment out TDxf.Print (both in the class definition
  and the implementation portion of this unit).

HISTORY:
  05/??/96 - Created by Colin Patrick Sarsfield (colin.sarsfield@usa.net)
  10/17/96 - Print routine added by CPS
  10/23/96 - FillStrings routine added by CPS
  12/09/96 - LoadFromStreamCompact & SaveToStreamCompact added by CPS
  01/17/97 - Assign method added by CPS
  05/16/00 - Updated comments to new standard by CPS

COPYRIGHT:
  Released into the public domain.
}
unit Dxfgrph;

interface

uses
  Windows, Graphics, Classes, RPDefine, RPBase;

type
  { this record is used to share stream data between functions }
  TIntDxfFile = packed record
    Stream: TStream;
    Buffer: PChar;
    BufferLen: Word;
    Position: Longint;
    LineNo: Longint;
    Size: Longint;
    Offset: Word;
    Eof: Boolean;
    Group: Integer;
    IVal: Integer;
    FVal: Single;
    SVal: string;
  end;
	{ TPoint didn't have a z }
  TXYZPoint = packed record
    x, y, z: Single;
  end;
	{ A drawing palette for the Dxf
  Actually, dxf's can have pens with colors from 0..255 so I guess this should
  probably be expanded.
  }
  TColorArray = packed array[0..15] of TColor;

  { Here it is! }
  TDxf = class(TGraphic)
  private
    procedure GetGroup(var AFile: TIntDxfFile);
    function ReadLine(var AFile: TIntDxfFile): string;
  protected
    FAngleBase: Single;
    FAngleDirection: Smallint;
    FDrawList: TList;
    FDrawingColors: TColorArray;
    FEmpty: Boolean;
    FHeight: Integer;
    FLineTypeList: TList;
		FLayerList: TList;
    FMaxDrawingExtent: TXYZPoint;
    FMaxMappingExtent: TXYZPoint;
    FMinDrawingExtent: TXYZPoint;
		FMinMappingExtent: TXYZPoint;
    FScaleFactor: Single;
    FWidth: Integer;
    procedure ClearLists;
    procedure Draw(ACanvas: TCanvas; const ARect: TRect); override;
    function GetEmpty: Boolean; override;
    function GetHeight: Integer; override;
    function GetLayer(Name: string): Integer;
    function GetLineType(Name: string): Integer;
    function GetWidth: Integer; override;
    procedure Scale;
    procedure SetHeight(Value: Integer); override;
    procedure SetScaleFactor(Value: Single);
    procedure SetMaxMappingExtent(Value: TXYZPoint);
    procedure SetMinMappingExtent(Value: TXYZPoint);
    procedure SetWidth(Value: Integer); override;
	public
    constructor Create; override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
		procedure DecEntitiesX(MaxX, XDec: Single);
    procedure FillStrings(Strings: TStrings);
    procedure IncEntitiesX(MinX, XInc: Single);
    procedure LoadFromClipboardFormat(AFormat: Word; AData: THandle;
      APalette: HPALETTE); override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure LoadFromStreamCompact(Stream: TStream);
    procedure Print(Report: TBaseReport; Sideways: Boolean; X, Y, Scale: Single);
    procedure SaveToClipboardFormat(var AFormat: Word; var AData: THandle;
      var APalette: HPALETTE); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure SaveToStreamCompact(Stream: TStream);
    property DrawingColors: TColorArray read FDrawingColors write FDrawingColors;
    property MaxDrawingExtent: TXYZPoint read FMaxDrawingExtent write FMaxDrawingExtent;
    property MaxMappingExtent: TXYZPoint read FMaxMappingExtent write FMaxMappingExtent;
    property MinDrawingExtent: TXYZPoint read FMinDrawingExtent write FMinDrawingExtent;
		property MinMappingExtent: TXYZPoint read FMinMappingExtent write FMinMappingExtent;
    property ScaleFactor: Single read FScaleFactor write SetScaleFactor;
  end;

function XYZPoint(x, y, z: Single): TXYZPoint;

implementation

uses
  SysUtils, PrintFun, StrLib;

const
  DXFFileID = 293984383;
  DXFFileVer = 1;
  DashLength: Double = 0.03;

type
  TDxfEntityKind = (dxfLine, dxfCircle, dxfArc);
  { TDxf Entity storage to internal use }
  TIntDxfEntity = packed record
    Layer: Smallint;
		case Kind: TDxfEntityKind of
      dxfCircle: (cCenter: TXYZPoint; cRadius: Single);
      dxfArc: (aCenter: TXYZPoint; aRadius: Single; BegAngle, EndAngle: Single);
      dxfLine: (Point1, Point2: TXYZPoint);
	end;
  { TDxf line type storage to internal use }
  TIntDxfLineType = packed record
    Name: ShortString;
    Style: TPenStyle;
  end;
  { TDxf layer storage to internal use }
  TIntDxfLayer = packed record
    Name: ShortString;
    Color: Smallint;
    LineType: Smallint;
  end;
  { pointer types for the above }
  PIntDxfEntity = ^TIntDxfEntity;
  PIntDxfLineType = ^TIntDxfLineType;
  PIntDxfLayer = ^TIntDxfLayer;

const
  { buffer size used by TDxf.LoadFromStream }
  BufferSize = 16 * 1024;

{ misc. functions }

{ just an easy way to fill a TXYZPoint structure }

function XYZPoint(x, y, z: Single): TXYZPoint;
begin
  Result.x := x;
  Result.y := y;
	Result.z := z;
end;

{ TDxf }

constructor TDxf.Create;
const
	DefaultColors: TColorArray = (
		clWindowText, clWindowText, clWindowText, clHighlight, clHighlight, clWindowText, clWindowText, clWindowText,
		clWindowText, clWindowText, clWindowText, clWindowText, clWindowText, clWindowText, clWindowText, clWindowText);
begin
  inherited Create;
  FDrawList := TList.Create;
  FLineTypeList := TList.Create;
  FLayerList := TList.Create;
  FDrawingColors := DefaultColors;
  FEmpty := True;
  FScaleFactor := 1;
end;

destructor TDxf.Destroy;
begin
  ClearLists;
  FDrawList.Free;
  FLineTypeList.Free;
  FLayerList.Free;
  inherited Destroy;
end;

procedure TDxf.Assign(Source: TPersistent);
var
	Dxf: TDxf;
  NewEntity: PIntDxfEntity;
  NewLineType: PIntDxfLineType;
  NewLayer: PIntDxfLayer;
  i: Integer;
begin
	if Source is TDxf then
  	Dxf := TDxf(Source)
  else
  	raise Exception.Create('TDxf.Assign can only assign from other TDxf''s');
  ClearLists;
  if Dxf.Empty then Exit;
  FAngleBase := Dxf.FAngleBase;
  FAngleDirection := Dxf.FAngleDirection;
  for i := 0 to Dxf.FDrawList.Count - 1 do begin
    New(NewEntity);
    NewEntity^ := PIntDxfEntity(Dxf.FDrawList[i])^;
    FDrawList.Add(NewEntity);
  end;
  for i := 0 to Dxf.FLineTypeList.Count - 1 do begin
    New(NewLineType);
    NewLineType^ := PIntDxfLineType(Dxf.FLineTypeList[i])^;
    FLineTypeList.Add(NewLineType);
  end;
  for i := 0 to Dxf.FLayerList.Count - 1 do begin
    New(NewLayer);
    NewLayer^ := PIntDxfLayer(Dxf.FLayerList[i])^;
    FLayerList.Add(NewLayer);
  end;
  FMaxDrawingExtent := Dxf.FMaxDrawingExtent;
  FMinDrawingExtent := Dxf.FMinDrawingExtent;
  FMaxMappingExtent := Dxf.FMaxMappingExtent;
  FMinMappingExtent := Dxf.FMinMappingExtent;
  FScaleFactor := Dxf.FScaleFactor;

  FEmpty := False;
  Scale; { calculate height and width, kept for compatibility with TGraphic }
  Changed(Self);
end;

{ the method used to clear/empty a drawing }
procedure TDxf.ClearLists;
var
  i: Integer;
begin
  for i := 0 to FDrawList.Count - 1 do
    Dispose(PIntDxfEntity(FDrawList[i]));
  FDrawList.Clear;
  for i := 0 to FLineTypeList.Count - 1 do
    Dispose(PIntDxfLineType(FLineTypeList[i]));
  FLineTypeList.Clear;
  for i := 0 to FLayerList.Count - 1 do
    Dispose(PIntDxfLayer(FLayerList[i]));
  FLayerList.Clear;
  FEmpty := True;
end;

{used to "move" entities x coords below "MaxX" by "XDec"}
procedure TDxf.DecEntitiesX(MaxX, XDec: Single);
var
  i: Integer;
begin
  FMinMappingExtent.x := FMaxMappingExtent.x;
  for i := 0 to FDrawList.Count - 1 do begin
    with TIntDxfEntity(FDrawList[i]^) do begin
      if Kind = dxfCircle then begin
        if cCenter.x < MaxX then
          cCenter.x := cCenter.x - XDec;
      end
      else if Kind = dxfArc then begin
        if aCenter.x < MaxX then
          aCenter.x := aCenter.x - XDec;
      end
      else if Kind = dxfLine then begin
        if Point1.x < MaxX then begin
          Point1.x := Point1.x - XDec;
          if Point1.x < FMinMappingExtent.x then
            FMinMappingExtent.x := Point1.x;
        end;
        if Point2.x < MaxX then begin
          Point2.x := Point2.x - XDec;
          if Point2.x < FMinMappingExtent.x then
            FMinMappingExtent.x := Point2.x;
        end;
      end;
    end;
  end;
  FMinDrawingExtent.x := FMinMappingExtent.x;
end;

{ used by TCanvas.Draw for drawing }
procedure TDxf.Draw(ACanvas: TCanvas; const ARect: TRect);
var
	mx, bx, my, by: Single;
	BAngle, EAngle: Single;
	ix, iy: Integer;
	Layer, i: Integer;
begin
	if Empty then Exit;
	mx := (ARect.Right - ARect.Left - 1) / (FMaxMappingExtent.x - FMinMappingExtent.x);
	my := (ARect.Top - ARect.Bottom + 1) / (FMaxMappingExtent.y - FMinMappingExtent.y);
	bx := ARect.Left - FMinMappingExtent.x * mx;
	by := ARect.Bottom - FMinMappingExtent.y * my - 1;
	ACanvas.Brush.Style := bsClear;
	Layer := -1;
	for i := 0 to FDrawList.Count - 1 do begin
		if Layer <> TIntDxfEntity(FDrawList[i]^).Layer then begin
			Layer := TIntDxfEntity(FDrawList[i]^).Layer;
			ACanvas.Pen.Style :=
				TIntDxfLineType(FLineTypeList[TIntDxfLayer(FLayerList[Layer]^).LineType]^).Style;
			ACanvas.Pen.Color := FDrawingColors[TIntDxfLayer(FLayerList[Layer]^).Color mod 16];
		end;
		with TIntDxfEntity(FDrawList[i]^) do begin
			if Kind = dxfCircle then begin
				ACanvas.Ellipse(
					Round((cCenter.x - cRadius) * mx + bx),
					Round((cCenter.y - cRadius) * my + by),
					Round((cCenter.x + cRadius) * mx + bx),
					Round((cCenter.y + cRadius) * my + by));
			end
			else if Kind = dxfArc then begin
				if FAngleDirection = 1 then begin
					BAngle := -BegAngle;
					EAngle := -EndAngle;
				end
				else begin
					BAngle := BegAngle;
					EAngle := EndAngle;
				end;
				BAngle := (BAngle + FAngleBase) / 180 * Pi;
				EAngle := (EAngle + FAngleBase) / 180 * Pi;
				ACanvas.Arc(
					Round((aCenter.x - aRadius) * mx + bx),
					Round((aCenter.y - aRadius) * my + by),
					Round((aCenter.x + aRadius) * mx + bx),
					Round((aCenter.y + aRadius) * my + by),
					Round((aCenter.x + aRadius * cos(BAngle)) * mx + bx),
					Round((aCenter.y + aRadius * sin(BAngle)) * my + by),
					Round((aCenter.x + aRadius * cos(EAngle)) * mx + bx),
					Round((aCenter.y + aRadius * sin(EAngle)) * my + by)
					);
			end
			else if Kind = dxfLine then begin
				ACanvas.MoveTo(
					Round(Point1.x * mx + bx),
					Round(Point1.y * my + by));
				ix := Round(Point2.x * mx + bx);
				iy := Round(Point2.y * my + by);
				ACanvas.LineTo(ix, iy);
				ACanvas.Pixels[ix, iy] := ACanvas.Pen.Color;
			end;
		end;
	end;
end;

{ for debugging/research uses (to see what TDxf has read in) }
procedure TDxf.FillStrings(Strings: TStrings);
var
  Layer, i: Integer;
begin
  if Empty then Exit;
  Layer := -1;
  Strings.Clear;
  for i := 0 to FDrawList.Count - 1 do begin
		if Layer <> TIntDxfEntity(FDrawList[i]^).Layer then begin
      Layer := TIntDxfEntity(FDrawList[i]^).Layer;
      Strings.Add('Layer: ' + TIntDxfLayer(FLayerList[Layer]^).Name);
    end;
    with TIntDxfEntity(FDrawList[i]^) do begin
			if Kind = dxfCircle then
				Strings.Add(Format('Circle: (%g, %g) - %g', [cCenter.x, cCenter.y, cRadius]))
			else if Kind = dxfArc then
				Strings.Add(Format('Arc: (%g, %g) - %g : %g - %g', [aCenter.x, aCenter.y, aRadius, BegAngle, EndAngle]))
			else if Kind = dxfLine then
				Strings.Add(Format('Line: (%g, %g) - (%g, %g)', [Point1.x, Point1.y, Point2.x, Point2.y]));
		end;
	end;
end;

function TDxf.GetEmpty: Boolean;
begin
	Result := FEmpty;
end;

function TDxf.GetHeight: Integer;
begin
  Result := FHeight;
end;

{ Input procedure used by LoadFromStream - see AutoCAD's dxf file format
documentation for a description of groups }

procedure TDxf.GetGroup(var AFile: TIntDxfFile);
var
  TStr: string;
  TryCount, XCode: Integer;
begin
  TryCount := 0;
  repeat
    TStr := ReadLine(AFile);
    Val(TStr, AFile.Group, XCode);
		Inc(TryCount);
    if TryCount > 3 then
      raise Exception.Create('Invalid DXF file');
  until XCode = 0;
  if ((AFile.Group >= 0) and (AFile.Group <= 9))
    or ((AFile.Group >= 999) and (AFile.Group <= 1009)) then begin
    try
      AFile.SVal := ReadLine(AFile);
    except
      AFile.SVal := '';
    end;
  end
  else if ((AFile.Group >= 10) and (AFile.Group <= 59))
    or ((AFile.Group >= 140) and (AFile.Group <= 147))
    or ((AFile.Group >= 210) and (AFile.Group <= 239))
    or ((AFile.Group >= 1010) and (AFile.Group <= 1059)) then begin
    try
      AFile.FVal := IntlStrToFloat(ReadLine(AFile));
    except
      AFile.FVal := 0;
    end;
  end
  else if ((AFile.Group >= 60) and (AFile.Group <= 79))
    or ((AFile.Group >= 170) and (AFile.Group <= 175))
    or ((AFile.Group >= 1060) and (AFile.Group <= 1075)) then begin
    try
      AFile.IVal := StrToInt(ReadLine(AFile));
    except
      AFile.IVal := 0;
    end;
  end
  else
    ReadLine(AFile);
end;

{ Layer lookup by name }

function TDxf.GetLayer(Name: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to FLayerList.Count - 1 do
    if TIntDxfLayer(FLayerList[i]^).Name = Name then begin
      Result := i;
      Break;
    end;
end;

{ Line type lookup by name }

function TDxf.GetLineType(Name: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to FLineTypeList.Count - 1 do
    if TIntDxfLineType(FLineTypeList[i]^).Name = Name then begin
      Result := i;
      Break;
    end;
end;

function TDxf.GetWidth: Integer;
begin
  Result := FWidth;
end;

{used to "move" entities x coords above "MinX" by "XInc"}
procedure TDxf.IncEntitiesX(MinX, XInc: Single);
var
  i: Integer;
begin
  for i := 0 to FDrawList.Count - 1 do begin
    with TIntDxfEntity(FDrawList[i]^) do begin
      if Kind = dxfCircle then begin
        if cCenter.x > MinX then
          cCenter.x := cCenter.x + XInc;
      end
      else if Kind = dxfArc then begin
        if aCenter.x > MinX then
          aCenter.x := aCenter.x + XInc;
      end
      else if Kind = dxfLine then begin
        if Point1.x > MinX then
          Point1.x := Point1.x + XInc;
        if Point2.x > MinX then
          Point2.x := Point2.x + XInc;
      end;
    end;
  end;
end;

procedure TDxf.LoadFromClipboardFormat(AFormat: Word; AData: THandle;
      APalette: HPALETTE);
begin
	raise Exception.Create('TDxf does not support loading from clipboard format');
end;

{ This is where the DXF is loaded }

procedure TDxf.LoadFromStream(Stream: TStream);
var
  AFile: TIntDxfFile;
  Section, Entity, TableType: string;
  CurEntity: PIntDxfEntity;
  CurLineType: PIntDxfLineType;
  CurLayer: PIntDxfLayer;
  IsDXF: Boolean;
  UCSOrg: TXYZPoint;
begin
  { set stream }
  AFile.Stream := Stream;
  { move to beginning of stream }
  Stream.Seek(0, 0);
  AFile.LineNo := 1;
  AFile.Eof := False;
  AFile.Offset := 64000;
  AFile.BufferLen := BufferSize;
  AFile.Size := Stream.Size;
  AFile.Position := 0;
  GetMem(AFile.Buffer, BufferSize);
  try
    { initialize variables to default values }
    CurEntity := nil;
    CurLineType := nil;
    CurLayer := nil;
    Section := '';
    Entity := '';
    TableType := '';
    FAngleBase := 0;
    FAngleDirection := 0;
    UCSOrg := XYZPoint(0, 0, 0);
    FMinDrawingExtent := XYZPoint(0, 0, 0);
    FMaxDrawingExtent := XYZPoint(1, 1, 1);
    { clear lists of drawing objects }
    ClearLists;
    IsDxf := False;
    { parse Dxf file until end of file }
    while not AFile.Eof do begin
      { get "group" consisting of two lines of data:
       group #
       group data (string, integer, or floating-point based on group #)
       }
      GetGroup(AFile);
      if not IsDxf then begin
        if (AFile.Group = 0) and (AFile.SVal = 'SECTION') then
          IsDxf := True
        else
          raise Exception.Create('Invalid DXF file');
      end;
      with AFile do
        case Group of
          0, 9:
            { group 0 indicates the current part of the file }
            { group 9 indicates a variable in the header section }
            { they are handled similarly here to save on stack hungry string variables } begin
              { process last part }
              { the else if structure is used because the below can't occur
               concurrently }
              if CurEntity <> nil then begin
                FDrawList.Add(CurEntity);
                CurEntity := nil;
              end
              else if CurLineType <> nil then begin
                FLineTypeList.Add(CurLineType);
                CurLineType := nil;
              end
              else if CurLayer <> nil then begin
                FLayerList.Add(CurLayer);
                CurLayer := nil;
              end;
              {get new entity}
              Entity := SVal;
              {special group 0 processing}
              if Group = 0 then begin
                { process end of file }
                if Entity = 'EOF' then
                  { set eof flag }
                  AFile.Eof := True
                    { process end of section }
                else if Entity = 'ENDSEC' then
                  { clear section }
                  Section := ''
                    { process end of table type }
                else if Entity = 'ENDTAB' then
                  { clear table type }
                  TableType := '';
              end;
              { process new part }
              if Section = 'ENTITIES' then begin
                if Entity = 'CIRCLE' then begin
                  {create new structure to store data in and
                  set defaults, just in case dxf provides incomplete data}
                  New(CurEntity);
                  CurEntity^.Kind := dxfCircle;
                  CurEntity^.cCenter := XYZPoint(0, 0, 0);
                  CurEntity^.cRadius := 0;
                  CurEntity^.Layer := 0;
                end
                else if Entity = 'ARC' then begin
                  {create new structure to store data in and
                  set defaults, just in case dxf provides incomplete data}
                  New(CurEntity);
                  CurEntity^.Kind := dxfArc;
                  CurEntity^.aCenter := XYZPoint(0, 0, 0);
                  CurEntity^.aRadius := 0;
                  CurEntity^.Layer := 0;
                end
                else if Entity = 'LINE' then begin
                  {create new structure to store data in and
                  set defaults, just in case dxf provides incomplete data}
                  New(CurEntity);
                  CurEntity^.Kind := dxfLine;
                  CurEntity^.Point1 := XYZPoint(0, 0, 0);
                  CurEntity^.Point2 := XYZPoint(0, 0, 0);
                  CurEntity^.Layer := 0;
                end;
              end
              else if Section = 'TABLES' then begin
                if Entity = 'LTYPE' then begin
                  {create new structure to store data in and
                  set defaults, just in case dxf provides incomplete data}
                  New(CurLineType);
                  CurLineType^.Name := '';
                  CurLineType^.Style := psSolid;
                end
                else if Entity = 'LAYER' then begin
                  {create new structure to store data in and
                  set defaults, just in case dxf provides incomplete data}
                  New(CurLayer);
                  CurLayer^.Name := '';
                  CurLayer^.Color := clBlack;
                  CurLayer^.LineType := 0;
                end;
              end;
            end; {groups 0 and 9}
          2: begin
              if Entity = 'SECTION' then
                Section := SVal
              else if Entity = 'TABLE' then
                TableType := SVal
              else if (TableType = 'LTYPE') and (Entity = 'LTYPE') then
                CurLineType^.Name := SVal
              else if (TableType = 'LAYER') and (Entity = 'LAYER') then
                CurLayer^.Name := SVal;
            end; {group 2}
          6: begin
              if (TableType = 'LAYER') and (Entity = 'LAYER') then
                CurLayer^.LineType := GetLineType(SVal);
            end; {group 6}
          8: begin
              if (Section = 'ENTITIES') and ((Entity = 'LINE') or
                (Entity = 'ARC') or (Entity = 'CIRCLE')) then
                CurEntity^.Layer := GetLayer(SVal);
            end; {group 8}
          10: begin
              if Section = 'ENTITIES' then begin
                if Entity = 'LINE' then
                  CurEntity^.Point1.x := FVal - UCSOrg.x
                else if Entity = 'ARC' then
                  CurEntity^.aCenter.x := FVal - UCSOrg.x
                else if Entity = 'CIRCLE' then
                  CurEntity^.cCenter.x := FVal - UCSOrg.x
              end
              else if (Section = 'HEADER') and (Entity = '$EXTMAX') then
                FMaxDrawingExtent.x := FVal
              else if (Section = 'HEADER') and (Entity = '$EXTMIN') then
                FMinDrawingExtent.x := FVal
              else if (Section = 'HEADER') and (Entity = '$UCSORG') then
                UCSOrg.x := FVal;
            end; {group 10}
          11: begin
              if (Section = 'ENTITIES') and (Entity = 'LINE') then
                CurEntity^.Point2.x := FVal - UCSOrg.x;
            end; {group 11}
          20: begin
              if Section = 'ENTITIES' then begin
                if Entity = 'LINE' then
                  CurEntity^.Point1.y := FVal - UCSOrg.y
                else if Entity = 'ARC' then
                  CurEntity^.aCenter.y := FVal - UCSOrg.y
                else if Entity = 'CIRCLE' then
                  CurEntity^.cCenter.y := FVal - UCSOrg.y
              end
              else if (Section = 'HEADER') and (Entity = '$EXTMAX') then
                FMaxDrawingExtent.y := FVal
              else if (Section = 'HEADER') and (Entity = '$EXTMIN') then
                FMinDrawingExtent.y := FVal
              else if (Section = 'HEADER') and (Entity = '$UCSORG') then
                UCSOrg.y := FVal;
            end; {group 20}
          21: begin
              if (Section = 'ENTITIES') and (Entity = 'LINE') then
                CurEntity^.Point2.y := FVal - UCSOrg.y;
            end; {group 21}
          30: begin
              if Section = 'ENTITIES' then begin
                if Entity = 'LINE' then
                  CurEntity^.Point1.z := FVal - UCSOrg.z
                else if Entity = 'ARC' then
                  CurEntity^.aCenter.z := FVal - UCSOrg.z
                else if Entity = 'CIRCLE' then
                  CurEntity^.cCenter.z := FVal - UCSOrg.z
              end
              else if (Section = 'HEADER') and (Entity = '$EXTMAX') then
                FMaxDrawingExtent.z := FVal
              else if (Section = 'HEADER') and (Entity = '$EXTMIN') then
                FMinDrawingExtent.z := FVal
              else if (Section = 'HEADER') and (Entity = '$UCSORG') then
                UCSOrg.z := FVal;
            end; {group 30}
          31: begin
              if (Section = 'ENTITIES') and (Entity = 'LINE') then
                CurEntity^.Point2.z := FVal - UCSOrg.z;
            end; {group 31}
          40: begin
              if Section = 'ENTITIES' then begin
                if Entity = 'ARC' then
                  CurEntity^.aRadius := FVal
                else if Entity = 'CIRCLE' then
                  CurEntity^.cRadius := FVal;
              end;
            end; {group 40}
          50: begin
              if (Section = 'ENTITIES') and (Entity = 'ARC') then
                CurEntity^.BegAngle := FVal
              else if (Section = 'HEADER') and (Entity = '$ANGBASE') then
                FAngleBase := FVal;
            end; {group 50}
          51: begin
              if (Section = 'ENTITIES') and (Entity = 'ARC') then
                CurEntity^.EndAngle := FVal;
            end; {group 51}
          62: begin
              if (TableType = 'LAYER') and (Entity = 'LAYER') then
                CurLayer^.Color := IVal;
            end; {group 62}
          70: begin
              if (Section = 'HEADER') and (Entity = '$ANGBASE') then
                FAngleDirection := IVal;
            end; {group 70}
          73: begin
              if (TableType = 'LTYPE') and (Entity = 'LTYPE') then begin
                if IVal = 0 then
                  CurLineType^.Style := psSolid
                else
                  CurLineType^.Style := psDot;
              end;
            end; {group 73}
        end; {case}
    end;
    FMinDrawingExtent.x := FMinDrawingExtent.x - UCSOrg.x;
    FMinDrawingExtent.y := FMinDrawingExtent.y - UCSOrg.y;
    FMinDrawingExtent.z := FMinDrawingExtent.z - UCSOrg.z;
    FMaxDrawingExtent.x := FMaxDrawingExtent.x - UCSOrg.x;
    FMaxDrawingExtent.y := FMaxDrawingExtent.y - UCSOrg.y;
    FMaxDrawingExtent.z := FMaxDrawingExtent.z - UCSOrg.z;
    { set mapping extent to drawing extent for default }
    FMinMappingExtent := FMinDrawingExtent;
    FMaxMappingExtent := FMaxDrawingExtent;
    FEmpty := False;
    Scale; { calculate height and width, kept for compatibility with TGraphic }
    Changed(Self);
  finally
    FreeMem(AFile.Buffer, BufferSize);
  end;
end;

procedure TDxf.LoadFromStreamCompact(Stream: TStream);
var
  Count, i, Version: Smallint;
  ID: Longint;
  NewEntity: PIntDxfEntity;
  NewLineType: PIntDxfLineType;
  NewLayer: PIntDxfLayer;

  // older versions used Extended which was completely unneccessary
  procedure ReadSingle(var Sng: Single);
  var
    Ext: Extended;
  begin
    if Version < 1 then begin
      Stream.Read(Ext, SizeOf(Extended));
      Sng := Ext
    end
    else
      Stream.Read(Sng, SizeOf(Sng))
  end;

  procedure ReadTXYZPoint(var xyz: TXYZPoint);
  begin
    ReadSingle(xyz.x);
    ReadSingle(xyz.y);
    ReadSingle(xyz.z);
  end;

  procedure ReadEntity(var ent: TIntDxfEntity);
  var
    PosInc: Integer;
  begin
    Stream.Read(ent.Layer, SizeOf(SmallInt));
    Stream.Read(ent.Kind, SizeOf(TDxfEntityKind));
		case ent.Kind of
      dxfCircle: begin
        ReadTXYZPoint(ent.cCenter);
        ReadSingle(ent.cRadius);
        // used to advance stream pointer to end of structure
        if Version < 1 then
          PosInc := SizeOf(Extended) * 2
        else
          PosInc := SizeOf(Single) * 2;
        Stream.Position := Stream.Position + PosInc;
      end;
      dxfArc: begin
        ReadTXYZPoint(ent.aCenter);
        ReadSingle(ent.aRadius);
        ReadSingle(ent.BegAngle);
        ReadSingle(ent.EndAngle);
      end;
      dxfLine: begin
        ReadTXYZPoint(ent.Point1);
        ReadTXYZPoint(ent.Point2);
      end;
  	end;
  end;
begin
  ClearLists;
  Stream.Seek(0, 0);
  Stream.Read(ID, SizeOf(Longint));
  if ID <> DXFFileID then
    raise Exception.Create('This is not a compact DXF');
	Stream.Read(Version, SizeOf(Smallint));
	if Version > DXFFileVer then
		raise Exception.Create('Invalid DXF version');

	{ begin reading data }
	ReadSingle(FAngleBase);
	Stream.Read(FAngleDirection, SizeOf(FAngleDirection));
	Stream.Read(Count, SizeOf(Smallint));
	for i := 1 to Count do begin
		New(NewEntity);
		ReadEntity(NewEntity^);
		FDrawList.Add(NewEntity);
	end;
	Stream.Read(Count, SizeOf(Smallint));
	for i := 1 to Count do begin
		New(NewLineType);
		Stream.Read(NewLineType^, SizeOf(TIntDxfLineType));
		FLineTypeList.Add(NewLineType);
	end;
	Stream.Read(Count, SizeOf(Smallint));
	for i := 1 to Count do begin
		New(NewLayer);
		Stream.Read(NewLayer^, SizeOf(TIntDxfLayer));
		FLayerList.Add(NewLayer);
	end;
	ReadTXYZPoint(FMaxDrawingExtent);
	ReadTXYZPoint(FMaxMappingExtent);
	ReadTXYZPoint(FMinDrawingExtent);
	ReadTXYZPoint(FMinMappingExtent);
	ReadSingle(FScaleFactor);

	FEmpty := False;
	Scale; { calculate height and width, kept for compatibility with TGraphic }
	Changed(Self);
end;

{ print it out }

procedure TDxf.Print(Report: TBaseReport; Sideways: Boolean; X, Y, Scale: Single);
var
	bx, by: Single;
	BAngle, EAngle: Single;
	Layer, i, PenWidth: Integer;
  PenStyle: TPenStyle;
begin
	if Empty then Exit;
  PenStyle := psSolid; // to remove compiler warning

	with Report do begin
		{ Set all lines at 3/4 pt thickness }
		PenWidth := GetPenWidth(Report, 0.75);

		if Sideways then begin
			bx := Y - FMinMappingExtent.x * Scale;
			by := X - FMinMappingExtent.y * Scale;
		end
		else begin
			bx := X - FMinMappingExtent.x * Scale;
			by := Y + (FMaxMappingExtent.y - FMinMappingExtent.y) * Scale; { reverse Y axis }
		end;
		Layer := -1;

		SetBrush(clWhite, bsClear, nil);
		SetPen(clBlack, psSolid, PenWidth, pmCopy);

		for i := 0 to FDrawList.Count - 1 do begin

			if Layer <> TIntDxfEntity(FDrawList[i]^).Layer then begin
				Layer := TIntDxfEntity(FDrawList[i]^).Layer;
				PenStyle := TIntDxfLineType(FLineTypeList[TIntDxfLayer(FLayerList[Layer]^).LineType]^).Style;
			end;

			with TIntDxfEntity(FDrawList[i]^) do begin
				if Kind = dxfCircle then begin
					if Sideways then begin
            if PenStyle <> psSolid then
              PrintDottedCircle(Report,
	  						cCenter.y * Scale + by,
		  					cCenter.x * Scale + bx,
			  				cRadius * Scale,
				  			DashLength)
            else
  						Ellipse(
	  						(cCenter.y - cRadius) * Scale + by,
		  					(cCenter.x - cRadius) * Scale + bx,
			  				(cCenter.y + cRadius) * Scale + by,
				  			(cCenter.x + cRadius) * Scale + bx)
          end
					else begin
            if PenStyle <> psSolid then
              PrintDottedCircle(Report,
	  						cCenter.x * Scale + bx,
		  					-cCenter.y * Scale + by,
			  				cRadius * Scale,
				  			DashLength)
            else
  						Ellipse(
	  						(cCenter.x - cRadius) * Scale + bx,
		  					-(cCenter.y - cRadius) * Scale + by,
			  				(cCenter.x + cRadius) * Scale + bx,
				  			-(cCenter.y + cRadius) * Scale + by);
          end;
				end
				else if Kind = dxfArc then begin
          if FAngleDirection = 1 then begin
            BAngle := -BegAngle;
            EAngle := -EndAngle;
          end
          else begin
            BAngle := BegAngle;
            EAngle := EndAngle;
          end;
          BAngle := (BAngle + FAngleBase) / 180 * Pi;
          EAngle := (EAngle + FAngleBase) / 180 * Pi;
          if PenStyle <> psSolid then begin
            if Sideways then begin
              PrintDottedCirclularArc(Report,
	  						cCenter.y * Scale + by,
		  					cCenter.x * Scale + bx,
			  				cRadius * Scale,
                BAngle + Pi / 2, EAngle + Pi / 2,
				  			DashLength)
            end
            else begin
              PrintDottedCirclularArc(Report,
     		  				cCenter.x * Scale + bx,
		    					-cCenter.y * Scale + by,
		  	  				cRadius * Scale,
                  BAngle, EAngle,
  				  			DashLength)
            end;
          end
          else begin
            if Sideways then
              Arc(
                (aCenter.y - aRadius) * Scale + by,
                (aCenter.x - aRadius) * Scale + bx,
                (aCenter.y + aRadius) * Scale + by,
                (aCenter.x + aRadius) * Scale + bx,
                (aCenter.y + aRadius * sin(BAngle)) * Scale + by,
                (aCenter.x + aRadius * cos(BAngle)) * Scale + bx,
                (aCenter.y + aRadius * sin(EAngle)) * Scale + by,
                (aCenter.x + aRadius * cos(EAngle)) * Scale + bx
                )
            else
              Arc(
                (aCenter.x - aRadius) * Scale + bx,
                -(aCenter.y - aRadius) * Scale + by,
                (aCenter.x + aRadius) * Scale + bx,
                -(aCenter.y + aRadius) * Scale + by,
                (aCenter.x + aRadius * cos(BAngle)) * Scale + bx,
                -(aCenter.y + aRadius * sin(BAngle)) * Scale + by,
                (aCenter.x + aRadius * cos(EAngle)) * Scale + bx,
                -(aCenter.y + aRadius * sin(EAngle)) * Scale + by
                );
          end;
				end
				else if Kind = dxfLine then begin
					if Sideways then begin
            if PenStyle <> psSolid then
              PrintDottedLine(Report, Point1.y * Scale + by, Point1.x * Scale + bx,
                  Point2.y * Scale + by, Point2.x * Scale + bx, DashLength)
            else begin
  						MoveTo(Point1.y * Scale + by, Point1.x * Scale + bx);
	  					LineTo(Point2.y * Scale + by, Point2.x * Scale + bx);
            end;
					end
					else begin
            if PenStyle <> psSolid then
              PrintDottedLine(Report, Point1.x * Scale + bx, -Point1.y * Scale + by,
                Point2.x * Scale + bx, -Point2.y * Scale + by, DashLength)
            else begin
  						MoveTo(Point1.x * Scale + bx, -Point1.y * Scale + by);
  						LineTo(Point2.x * Scale + bx, -Point2.y * Scale + by);
            end;
					end;
				end;
			end;
		end;
	end; {with}
end;

{ all this to read in a line of text? probably could be cleaned up some }

function TDxf.ReadLine(var AFile: TIntDxfFile): string;
const
  CRLF = [#13, #10];
var
  c: Char;
begin
  with AFile do begin
    Result := '';
    if Offset >= BufferSize then begin
      if (Size - Position) < BufferSize then
        BufferLen := Size - Position
      else
        BufferLen := BufferSize;
			Stream.Read(Buffer^, BufferLen);
      Position := Position + BufferLen;
      Offset := 0;
    end;
    while (Position + Offset - BufferLen) < Size do begin
      c := Buffer[Offset];
      Inc(Offset);
      if Offset >= BufferSize then begin
        if (Size - Position) < BufferSize then
          BufferLen := Size - Position
        else
          BufferLen := BufferSize;
        Stream.Read(Buffer^, BufferLen);
        Position := Position + BufferLen;
        Offset := 0;
      end;
      if c = #13 then begin
        Inc(LineNo);
        Exit;
			end;
      if c = #10 then Continue;
      Result := Result + c;
    end;
    Eof := True;
  end;
end;

procedure TDxf.SaveToClipboardFormat(var AFormat: Word; var AData: THandle;
		var APalette: HPALETTE);
begin
	raise Exception.Create('TDxf does not yet support saving to clipboard format');
end;

procedure TDxf.SaveToStream(Stream: TStream);
begin
	raise Exception.Create('TDxf does not yet support saving to a stream');
end;

procedure TDxf.SaveToStreamCompact(Stream: TStream);
var
  i: Integer;
  ID: Longint;
begin
  Stream.Seek(0, 0);
  ID := DXFFileID;
  Stream.Write(ID, SizeOf(Longint));
  i := DXFFileVer;
	Stream.Write(i, SizeOf(Smallint));

	{ begin writing data }
	Stream.Write(FAngleBase, SizeOf(FAngleBase));
	Stream.Write(FAngleDirection, SizeOf(FAngleDirection));
	i := FDrawList.Count;
	Stream.Write(i, SizeOf(Smallint));
	for i := 0 to FDrawList.Count - 1 do
		Stream.Write(PIntDxfEntity(FDrawList[i])^, SizeOf(TIntDxfEntity));
	i := FLineTypeList.Count;
	Stream.Write(i, SizeOf(Smallint));
	for i := 0 to FLineTypeList.Count - 1 do
		Stream.Write(PIntDxfLineType(FLineTypeList[i])^, SizeOf(TIntDxfLineType));
	i := FLayerList.Count;
	Stream.Write(i, SizeOf(Smallint));
	for i := 0 to FLayerList.Count - 1 do
		Stream.Write(PIntDxfLayer(FLayerList[i])^, SizeOf(TIntDxfLayer));
	Stream.Write(FMaxDrawingExtent, SizeOf(TXYZPoint));
	Stream.Write(FMaxMappingExtent, SizeOf(TXYZPoint));
	Stream.Write(FMinDrawingExtent, SizeOf(TXYZPoint));
	Stream.Write(FMinMappingExtent, SizeOf(TXYZPoint));
	Stream.Write(FScaleFactor, SizeOf(FScaleFactor));
	Stream.Size := Stream.Position;
end;

{ calculate height & width based on ScaleFactor }

procedure TDxf.Scale;
var
  w, h: Longint;
begin
  h := Round(Abs(FScaleFactor * (FMaxMappingExtent.y - FMinMappingExtent.y)));
  w := Round(Abs(FScaleFactor * (FMaxMappingExtent.x - FMinMappingExtent.x)));
  if h > 32767 then
    FHeight := 32767
  else
    FHeight := h;
  if w > 32767 then
    FWidth := 32767
  else
    FWidth := w;
end;

{ Set the height = set the ScaleFactor }

procedure TDxf.SetHeight(Value: Integer);
begin
  FScaleFactor := Value / Abs(FMaxMappingExtent.y - FMinMappingExtent.y);
  Scale;
  Changed(Self);
end;

{ set the mapping extent and recalc height & width }

procedure TDxf.SetMaxMappingExtent(Value: TXYZPoint);
begin
  FMaxMappingExtent := Value;
  Scale;
  Changed(Self);
end;

{ set the mapping extent and recalc height & width }

procedure TDxf.SetMinMappingExtent(Value: TXYZPoint);
begin
  FMinMappingExtent := Value;
  Scale;
  Changed(Self);
end;

{ Set the ScaleFactor and recalc. the height & width }

procedure TDxf.SetScaleFactor(Value: Single);
begin
  FScaleFactor := Value;
  Scale;
  Changed(Self);
end;

{ Set the width = set the ScaleFactor }

procedure TDxf.SetWidth(Value: Integer);
begin
  FScaleFactor := Value / Abs(FMaxMappingExtent.x - FMinMappingExtent.x);
  Scale;
  Changed(Self);
end;

// WARNING THIS CODE CAUSES CRASH ON DELPHI IDE EXIT
// (ALSO I DON'T THINK IT WORKS ANYWAY)
//initialization
//	TPicture.RegisterFileFormat('dxf', 'Dxf files', TDxf);

end.

