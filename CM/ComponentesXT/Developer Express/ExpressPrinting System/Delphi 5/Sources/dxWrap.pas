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

unit dxWrap;

interface

{$I dxPSVer.inc}

uses
  Windows, Classes, dxPSGlbl;

type

  TdxPointCoord = (pcX, pcY);
  TdxPointCoords = set of TdxPointCoord;

  TdxPointChangingEvent = procedure(Sender: TObject; Coords: TdxPointCoords;
    var Values: array of Integer) of object;

  TdxPointChangeEvent = procedure(Sender: TObject; Coords: TdxPointCoords) of object;

  TdxPointWrapper = class(TPersistent)
  private
    FPoint: TPoint;
    FOnChanged: TdxPointChangeEvent;
    FOnChanging: TdxPointChangingEvent;
    function GetPartPoint(index: Integer): Integer;
    procedure SetPartPoint(index: Integer; Value: Integer);
    procedure SetPoint(const Value: TPoint);
  protected
    procedure DoChanged(Coords: TdxPointCoords); dynamic;
    procedure DoChanging(Coords: TdxPointCoords; var Values: array of Integer); dynamic;
  public
    constructor Create(AX, AY: Integer);
    procedure Assign(Source: TPersistent); override;
    
    function Clone: TPersistent;
    procedure Empty;
    function IsEqual(const APoint: TPoint): Boolean;
    class function PointEqual(const P1, P2: TPoint): Boolean;

    property Point: TPoint read FPoint write SetPoint;
    property OnChanging: TdxPointChangingEvent read FOnChanging write FOnChanging;
    property OnChanged: TdxPointChangeEvent read FOnChanged write FOnChanged;
  published
    property X: Integer index 0 read GetPartPoint write SetPartPoint
      default 0;
    property Y: Integer index 1 read GetPartPoint write SetPartPoint
      default 0;    
  end;


  TdxRectSide = (rsLeft, rsTop, rsRight, rsBottom);
  TdxRectSides = set of TdxRectSide;

  TdxRectChangingEvent = procedure(Sender: TObject; Sides: TdxRectSides;
    var Values: array of Integer) of object;

  TdxRectChangeEvent = procedure(Sender: TObject; Sides: TdxRectSides) of object;

  TdxRectWrapper = class(TPersistent)
  private
    FRect: TRect;
    FOnChanged: TdxRectChangeEvent;
    FOnChanging: TdxRectChangingEvent;
    
    function GetHeight: Integer;
    function GetPartRect(index: Integer): Integer;
    function GetRectPoint(Index: Integer): TPoint;
    function GetSide(ASide: TdxRectSide): Integer;
    function GetWidth: Integer;
    procedure SetHeight(Value: Integer);
    procedure SetPartRect(index: Integer; Value: Integer);
    procedure SetRect(const Value: TRect);
    procedure SetRectPoint(index: Integer; const Value: TPoint);
    procedure SetSide(ASide: TdxRectSide; Value: Integer);
    procedure SetWidth(Value: Integer);
  protected
    procedure DoChanged(Sides: TdxRectSides); dynamic;
    procedure DoChanging(Sides: TdxRectSides; var Values: array of Integer); dynamic;
  public
    constructor Create(ALeft, ATop, ARight, ABottom: Integer);
    procedure Assign(Source: TPersistent); override;
    
    function Clone: TPersistent;
    procedure Empty;
    function IsEqual(const ARect: TRect): Boolean;

    property BottomRight: TPoint index 1 read GetRectPoint write SetRectPoint;
    property Height: Integer read GetHeight write SetHeight;
    property Rect: TRect read FRect write SetRect;
    property Side[ASide: TdxRectSide]: Integer read GetSide write SetSide; default;
    property TopLeft: TPoint index 0 read GetRectPoint write SetRectPoint;
    property Width: Integer read GetWidth write SetWidth;

    property OnChanging: TdxRectChangingEvent read FOnChanging write FOnChanging;
    property OnChanged: TdxRectChangeEvent read FOnChanged write FOnChanged;
  published
    property Bottom: Integer index 3 read GetPartRect write SetPartRect
      default 0;    
    property Left: Integer index 0 read GetPartRect write SetPartRect
      default 0;    
    property Right: Integer index 2 read GetPartRect write SetPartRect
      default 0;    
    property Top: Integer index 1 read GetPartRect write SetPartRect
      default 0;
  end;

implementation

uses
  dxPSUtl;

{ TdxPointWrapper }

constructor TdxPointWrapper.Create(AX, AY: Integer);
begin
  inherited Create;
  FPoint.X := AX;
  FPoint.Y := AY;
end;

procedure TdxPointWrapper.Assign(Source: TPersistent);
var
  Src: TdxPointWrapper absolute Source;
begin
  if Source = nil then
    Empty
  else 
    if Source is ClassType then
      Point := Src.Point
    else
      inherited Assign(Source)
end;

function TdxPointWrapper.Clone: TPersistent;
begin
  Result := TdxPointWrapper.Create(0, 0);
  try
    Result.Assign(Self);
  except
    Result.Free;
    raise;
  end;
end;

procedure TdxPointWrapper.DoChanged(Coords: TdxPointCoords);
begin
  if Assigned(FOnChanged) then FOnChanged(Self, Coords);
end;

procedure TdxPointWrapper.DoChanging(Coords: TdxPointCoords;
  var Values: array of Integer);
begin
  if Assigned(FOnChanging) then FOnChanging(Self, Coords, Values);
end;

type
  TPoints = array[0..1] of Integer;

procedure TdxPointWrapper.SetPoint(const Value: TPoint);
var
  AValue: TPoints;
begin
  if not IsEqual(Value) then
  begin
    AValue := TPoints(Value);
    DoChanging([pcX, pcY], AValue);
    FPoint := TPoint(AValue);
    DoChanged([pcX, pcY]);
  end;
end;

function TdxPointWrapper.GetPartPoint(index: Integer): Integer;
begin
  if (Index = 0) then
    Result := FPoint.X
  else
    Result := FPoint.Y;
end;

procedure TdxPointWrapper.SetPartPoint(index: Integer; Value: Integer);
var
  AValue: TPoints;
begin
  if Index = 0 then
    if FPoint.X <> Value then
    begin
      AValue := TPoints(Classes.Point(Value, 0));
      DoChanging([pcX], AValue);
      FPoint.X := TPoint(AValue).X;
      DoChanged([pcX]);
    end
    else
  else 
    if FPoint.Y <> Value then
    begin
      AValue := TPoints(Classes.Point(0, Value));
      DoChanging([pcY], AValue);
      FPoint.Y := TPoint(AValue).Y;
      DoChanged([pcY]);
    end;
end;

function TdxPointWrapper.IsEqual(const APoint: TPoint): Boolean;
begin
  Result := (FPoint.X = APoint.X) and (FPoint.Y = APoint.Y);
end;

class function TdxPointWrapper.PointEqual(const P1, P2: TPoint): Boolean;
begin
  Result := (P1.X = P2.X) and (P1.Y = P2.Y);
end;

procedure TdxPointWrapper.Empty;
const
  Zero: TPoint = (X: 0; Y: 0);
var
  AValue: TPoints;
begin
  if not IsEqual(Zero) then
  begin
    AValue := TPoints(Zero);
    DoChanging([pcX, pcY], AValue);
    FPoint := TPoint(AValue);
    DoChanged([pcX, pcY]);
  end;
end;


{ TdxRectWrapper }

constructor TdxRectWrapper.Create(ALeft, ATop, ARight, ABottom: Integer);
begin
  inherited Create;
  FRect.Left := ALeft;
  FRect.Top := ATop;
  FRect.Right := ARight;
  FRect.Bottom := ABottom;
end;

procedure TdxRectWrapper.Assign(Source: TPersistent);
var
  Src: TdxRectWrapper absolute Source;
begin
  if Source = Self then Exit;
  if Source = nil then
    Empty
  else 
   if Source is ClassType then
     Rect := Src.Rect
   else
     inherited Assign(Source)
end;

function TdxRectWrapper.Clone: TPersistent;
begin
  Result := TdxRectWrapper.Create(0, 0, 0, 0);
  try
    Result.Assign(Self);
  except
    Result.Free;
    raise;
  end;
end;


type
  TRects = array[0..3] of Integer;

procedure TdxRectWrapper.Empty;
const
  Zero: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);
var
  AValue: TRects;
begin
  if not IsEqual(Zero) then
  begin
    AValue := TRects(Zero);
    DoChanging([rsLeft, rsTop, rsRight, rsBottom], AValue);
    FRect := TRect(AValue);
    DoChanged([rsLeft, rsTop, rsRight, rsBottom]);
  end;
end;

function TdxRectWrapper.IsEqual(const ARect: TRect): Boolean;
begin
  Result := EqualRect(FRect, ARect);
end;

procedure TdxRectWrapper.DoChanging(Sides: TdxRectSides; var Values: array of Integer);
begin
  if Assigned(FOnChanging) then FOnChanging(Self, Sides, Values);
end;

procedure TdxRectWrapper.DoChanged(Sides: TdxRectSides);
begin
  if Assigned(FOnChanged) then FOnChanged(Self, Sides);
end;

procedure TdxRectWrapper.SetRect(const Value: TRect);
var
  AValue: TRects;
begin
  if not EqualRect(FRect, Value) then
  begin
    AValue := TRects(Value);
    DoChanging([rsLeft, rsTop, rsRight, rsBottom], AValue);
    FRect := TRect(AValue);
    DoChanged([rsLeft, rsTop, rsRight, rsBottom]);
  end;
end;

function TdxRectWrapper.GetWidth: Integer;
begin
  Result := FRect.Right - FRect.Left;
end;

procedure TdxRectWrapper.SetWidth(Value: Integer);
var
  AValue: TRects;
begin
  if (Width <> Value) then
  begin
    AValue := TRects(Classes.Rect(0, 0, Value, 0));
    DoChanging([rsRight], AValue);
    FRect.Right := TRect(AValue).Right;
    DoChanged([rsRight]);
  end;
end;

function TdxRectWrapper.GetHeight: Integer;
begin
  Result := FRect.Bottom - FRect.Top
end;

procedure TdxRectWrapper.SetHeight(Value: Integer);
var
  AValue: TRects;
begin
  if Height <> Value then
  begin
    AValue := TRects(Classes.Rect(0, 0, 0, Value));
    DoChanging([rsBottom], AValue);
    FRect.Bottom := TRect(AValue).Bottom;
    DoChanged([rsBottom]);
  end;
end;

function TdxRectWrapper.GetPartRect(index: Integer): Integer;
begin
  case Index of
    0: Result := FRect.Left;
    1: Result := FRect.Top;
    2: Result := FRect.Right;
  else
    Result := FRect.Bottom;
  end;
end;

procedure TdxRectWrapper.SetPartRect(index: Integer; Value: Integer);
var
  AValue: TRects;
begin
  case Index of
    0:
      if FRect.Left <> Value then
      begin
        AValue := TRects(Classes.Rect(Value, 0, 0, 0));
        DoChanging([rsLeft], AValue);
        FRect.Left := TRect(AValue).Left;
        DoChanged([rsLeft]);
      end;
    1:
      if FRect.Top <> Value then
      begin
        AValue := TRects(Classes.Rect(0, Value, 0, 0));
        DoChanging([rsTop], AValue);
        FRect.Top := TRect(AValue).Top;
        DoChanged([rsTop]);
      end;
    2:
      if FRect.Right <> Value then
      begin
        AValue := TRects(Classes.Rect(0, 0, Value, 0));
        DoChanging([rsRight], AValue);
        FRect.Right := TRect(AValue).Right;
        DoChanged([rsRight]);
      end;
    3:
      if FRect.Bottom <> Value then
      begin
        AValue := TRects(Classes.Rect(0, 0, 0, Value));
        DoChanging([rsBottom], AValue);
        FRect.Bottom := TRect(AValue).Bottom;
        DoChanged([rsBottom]);
      end;
  end;
end;

function TdxRectWrapper.GetRectPoint(Index: Integer): TPoint;
begin
  if Index = 0 then
    Result := FRect.TopLeft
  else
    Result := FRect.BottomRight;
end;

procedure TdxRectWrapper.SetRectPoint(index: Integer; const Value: TPoint);
var
  AValue: TRects;
begin
  if Index = 0 then
    if not TdxPointWrapper.PointEqual(FRect.TopLeft, Value) then
    begin
      AValue := TRects(Classes.Rect(Value.X, Value.Y, 0, 0));
      DoChanging([rsLeft, rsTop], AValue);
      FRect.TopLeft := TRect(AValue).TopLeft;
      DoChanged([rsLeft, rsTop]);
    end
    else
  else 
    if not TdxPointWrapper.PointEqual(FRect.BottomRight, Value) then
    begin
      AValue := TRects(Classes.Rect(0, 0, Value.X, Value.Y));
      DoChanging([rsRight, rsBottom], AValue);
      FRect.BottomRight := TRect(AValue).BottomRight;
      DoChanged([rsRight, rsBottom]);
    end;
end;

function TdxRectWrapper.GetSide(ASide: TdxRectSide): Integer;
begin
  case ASide of
    rsLeft: 
      Result := FRect.Left;
    rsTop: 
      Result := FRect.Top;
    rsRight: 
      Result := FRect.Right;
  else //rsBottom
    Result := FRect.Bottom;
  end;
end;

procedure TdxRectWrapper.SetSide(ASide: TdxRectSide; Value: Integer);
begin
  SetPartRect(Integer(ASide), Value);
end;

initialization
  RegisterClasses([TdxPointWrapper, TdxRectWrapper]);

finalization
  UnRegisterClasses([TdxPointWrapper, TdxRectWrapper]);

end.

