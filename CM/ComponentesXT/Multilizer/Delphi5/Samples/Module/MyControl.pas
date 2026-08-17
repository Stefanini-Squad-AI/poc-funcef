// This a sample control
//
// This control has a bad desing because there is not published property to
// access the items. Writing code is to only way to init or change the item
// values.
//
// Because of lacking published properties the TIvTranslator can not translate
// the Items property.

unit MyControl;

interface

uses
  Classes, Controls;

type
  TMyControl = class(TGraphicControl)
  protected
    FItems: TStringList;

    function GetCount: Integer;

    function GetItem(i: Integer): String;
    procedure SetItem(i: Integer; value: String);

  public
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;

    procedure Add(value: String);

    procedure Paint; override;

    property Count: Integer read GetCount;
    property Items[i: Integer]: String read GetItem write SetItem;
  end;

implementation

uses
  Graphics;

constructor TMyControl.Create(owner: TComponent);
begin
  inherited Create(owner);
  FItems := TStringList.Create;
end;

destructor TMyControl.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

function TMyControl.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TMyControl.GetItem(i: Integer): String;
begin
  Result := FItems[i];
end;

procedure TMyControl.SetItem(i: Integer; value: String);
begin
  FItems[i] := value;
end;

procedure TMyControl.Paint;
var
  i, h: Integer;
begin
  Canvas.Brush.Color := clWhite;
  Canvas.Rectangle(0, 0, ClientWidth, ClientHeight);
  if Count = 0 then
    Exit;

  h := ClientHeight div Count;
  for i := 0 to Count - 1 do
    Canvas.TextOut(2, 2 + i*h, Items[i]);
end;

procedure TMyControl.Add(value: String);
begin
  FItems.Add(value);
  Invalidate;
end;

end.
