unit IvStrLst;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils, Classes, Dialogs, Forms, Controls, Graphics,
  IvCommon, IvDictio, IvWParser;

type
{$IFDEF WIN32}
  { Ansi string list }

  PIvStringItem = ^TIvStringItem;
  TIvStringItem = record
    FString: String;
    FObject: TObject;
  end;

  PIvStringItemList = ^TIvStringItemList;
  TIvStringItemList = array[0..MaxListSize] of TIvStringItem;

  TIvStringList = class(TPersistent)
  protected
    FSorted: Boolean;
    FCount: Integer;
    FCapacity: Integer;
    FList: PIvStringItemList;

    procedure SetSorted(value: Boolean);

    function GetItem(i: Integer): String;
    procedure SetItem(i: Integer; const value: String);

    function GetObject(i: Integer): TObject;
    procedure SetObject(i: Integer; value: TObject);

    procedure Grow;
    procedure SetCapacity(value: Integer);
    procedure QuickSort(L, R: Integer);
    procedure ExchangeItems(Index1, Index2: Integer);

  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(value: TPersistent); override;
    procedure Clear; virtual;
    procedure Sort; virtual;

    function Add(const str: String): Integer;
    function AddL(const str: String; maxLen: Integer): Integer;
    function AddObject(const str: String; obj: TObject): Integer;
    function Find(const str: String; matchCase: Boolean): Integer;
    procedure Remove(const str: String);
    procedure RemoveAt(index: Integer);

    property Count: Integer read FCount;
    property Sorted: Boolean read FSorted write SetSorted;
    property Objects[i: Integer]: TObject read GetObject write SetObject;
    property Items[i: Integer]: String read GetItem write SetItem; default;
  end;

  { Wide string list }

  PIvWideStringItem = ^TIvWideStringItem;
  TIvWideStringItem = record
    FString: TIvWideString;
    FObject: TObject;
  end;

  PIvWideStringItemList = ^TIvWideStringItemList;
  TIvWideStringItemList = array[0..MaxListSize] of TIvWideStringItem;

  TIvWideStringList = class(TPersistent)
  protected
    FCount: Integer;
    FCapacity: Integer;
    FList: PIvWideStringItemList;

    function GetString(i: Integer): String;
    procedure SetString(i: Integer; const value: String);

    function GetItem(i: Integer): TIvWideString;
    procedure SetItem(i: Integer; const value: TIvWideString);

    function GetObject(i: Integer): TObject;
    procedure SetObject(i: Integer; value: TObject);

    procedure Grow;
    procedure SetCapacity(value: Integer);

  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(value: TPersistent); override;
    procedure Clear; virtual;

    function Add(const str: TIvWideString): Integer;
    function AddObject(const str: WideString; obj: TObject): Integer;

    property Count: Integer read FCount;
    property Objects[i: Integer]: TObject read GetObject write SetObject;
    property Strings[i: Integer]: String read GetString write SetString;
    property Items[i: Integer]: TIvWideString read GetItem write SetItem; default;
  end;
{$ELSE}
  TIvStringList = class(TStringList);
{$ENDIF}

implementation

{ TIvStringList }

{$IFDEF WIN32}
constructor TIvStringList.Create;
begin
  inherited Create;
  FCapacity := 0;
  FCount := 0;
  FSorted := False;
end;

destructor TIvStringList.Destroy;
begin
  Clear;
  inherited Destroy;
end;

procedure TIvStringList.Assign(value: TPersistent);
var
  i: Integer;
begin
  Clear;
  SetCapacity((value as TIvStringList).Count);
  for i := 0 to (value as TIvStringList).Count - 1 do
  begin
    FList^[i].FString := (value as TIvStringList).Items[i];
    FList^[i].FObject := (value as TIvStringList).Objects[i];
  end;
  FCount := (value as TIvStringList).Count;
end;

procedure TIvStringList.Clear;
begin
  if FList <> nil then
  begin
    Finalize(FList^[0], FCount);
    SetCapacity(0);
    FCount := 0;
  end;
end;

function TIvStringList.GetItem(i: Integer): String;
begin
  if (i < 0) or (i >= FCount) then
    raise ERangeError.Create('Out of string list range');
  Result := FList[i].FString;
end;

procedure TIvStringList.SetItem(i: Integer; const value: String);
begin
  if (i < 0) or (i >= FCount) then
    raise ERangeError.Create('Out of string list range');
  FList^[i].FString := value;
end;

function TIvStringList.GetObject(i: Integer): TObject;
begin
  if (i < 0) or (i >= FCount) then
    raise ERangeError.Create('Out of string list range');
  Result := FList^[i].FObject;
end;

procedure TIvStringList.SetObject(i: Integer; value: TObject);
begin
  if (i < 0) or (i >= FCount) then
    raise ERangeError.Create('Out of string list range');
  FList^[i].FObject := value;
end;

procedure TIvStringList.SetSorted(value: Boolean);
begin
  if FSorted <> value then
  begin
    FSorted := value;
    if value then
      Sort;
  end;
end;

procedure TIvStringList.Sort;
begin
  if FCount > 1 then
    QuickSort(0, FCount - 1);
end;

function TIvStringList.Find(const str: String; matchCase: Boolean): Integer;
var
  l, h, i, c: Integer;
begin
  l := 0;
  h := FCount - 1;
  while L <= H do
  begin
    i := (l + h) div 2;
    if matchCase then
      c := AnsiCompareStr(FList^[I].FString, str)
    else
      c := AnsiCompareText(FList^[I].FString, str);
    if c = 0 then
    begin
      Result := i;
      Exit;
    end
    else if c < 0 then
      l := i + 1
    else
      h := i - 1;
  end;
  Result := -1;
end;

procedure TIvStringList.Grow;
var
  delta: Integer;
begin
  if FCapacity > 8 then
    delta := 16
  else if FCapacity > 4 then
    delta := 8
  else
    delta := 4;
  SetCapacity(FCapacity + delta);
end;

procedure TIvStringList.SetCapacity(value: Integer);
begin
  ReallocMem(FList, value*SizeOf(TIvStringItem));
  FCapacity := value;
end;

procedure TIvStringList.ExchangeItems(Index1, Index2: Integer);
var
  temp: Longint;
  Item1, Item2: PIvStringItem;
begin
  Item1 := @FList^[Index1];
  Item2 := @FList^[Index2];

  temp := Longint(Item1^.FString);
  Longint(Item1^.FString) := Longint(Item2^.FString);
  Longint(Item2^.FString) := temp;

  temp := Longint(Item1^.FObject);
  Longint(Item1^.FObject) := Longint(Item2^.FObject);
  Longint(Item2^.FObject) := temp;
end;

procedure TIvStringList.QuickSort(L, R: Integer);
var
  I, J: Integer;
  P: String;
begin
  repeat
    I := L;
    J := R;
    P := FList^[(L + R) shr 1].FString;
    repeat
      while AnsiCompareText(FList^[I].FString, P) < 0 do
        Inc(I);
      while AnsiCompareText(FList^[J].FString, P) > 0 do
        Dec(J);
      if I <= J then
      begin
        ExchangeItems(I, J);
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then
      QuickSort(L, J);
    L := I;
  until I >= R;
end;

function TIvStringList.AddObject(const str: String; obj: TObject): Integer;
begin
  if FCount = FCapacity then
    Grow;
  with FList^[FCount] do
  begin
    Pointer(FString) := nil;
    FObject := obj;
    FString := str;
  end;
  Result := FCount;
  Inc(FCount);
  if FSorted then
    Sort;
end;

function TIvStringList.Add(const str: String): Integer;
begin
  Result := AddObject(str, nil);
end;

function TIvStringList.AddL(const str: String; maxLen: Integer): Integer;
begin
  Result := Add(Copy(str, 1, maxLen));
end;

procedure TIvStringList.Remove(const str: String);
var
  index: Integer;
begin
  index := Find(str, True);
  if index >= 0 then
    RemoveAt(index);
end;

procedure TIvStringList.RemoveAt(index: Integer);
var
  i: Integer;
begin
  if (index < 0) or (index >= FCount) then
    raise ERangeError.CreateFmt(
      '%d is not within the valid range of %d..%d',
      [index, 0, FCount - 1]);

  for i := index + 1 to FCount - 1 do
    FList^[i - 1] := FList^[i];
  Dec(FCount);
end;


{ TIvWideStringList }

constructor TIvWideStringList.Create;
begin
  inherited Create;
  FCapacity := 0;
  FCount := 0;
end;

destructor TIvWideStringList.Destroy;
begin
  Clear;
  inherited Destroy;
end;

procedure TIvWideStringList.Assign(value: TPersistent);
var
  i: Integer;
begin
  Clear;
  SetCapacity((value as TIvWideStringList).Count);
  for i := 0 to (value as TIvWideStringList).Count - 1 do
    FList^[i].FString := (value as TIvWideStringList).Items[i];
  FCount := (value as TIvWideStringList).Count;
end;

procedure TIvWideStringList.Clear;
begin
  if FList <> nil then
  begin
    Finalize(FList^[0], FCount);
    SetCapacity(0);
    FCount := 0;
  end;
end;

function TIvWideStringList.GetString(i: Integer): String;
begin
  if (i < 0) or (i >= FCount) then
    raise ERangeError.Create('Out of string list range');
{$IFDEF IVWIDE}
  Result := FList[i].FString;
{$ELSE}
  Result := IvWStrToStr(FList[i].FString, 0);
{$ENDIF}
end;

procedure TIvWideStringList.SetString(i: Integer; const value: String);
{$IFDEF IVANSI}
var
  len: Integer;
{$ENDIF}
begin
  if (i < 0) or (i >= FCount) then
    raise ERangeError.Create('Out of string list range');
{$IFDEF IVWIDE}
  FList[i].FString := value;
{$ELSE}
  len := Length(value) + 1;
  SysFreeString(FList[i].FString);
  FList^[i].FString := SysAllocStringLen(nil, len);
  IvStringToWideChar(value, 0, FList[i].FString, len);
{$ENDIF}
end;

function TIvWideStringList.GetItem(i: Integer): TIvWideString;
begin
  if (i < 0) or (i >= FCount) then
    raise ERangeError.Create('Out of string list range');
  Result := FList[i].FString;
end;

procedure TIvWideStringList.SetItem(i: Integer; const value: TIvWideString);
begin
  if (i < 0) or (i >= FCount) then
    raise ERangeError.Create('Out of string list range');
{$IFDEF IVWIDE}
  FList^[i].FString := value;
{$ELSE}
  SysFreeString(FList^[i].FString);
  FList^[i].FString := SysAllocString(value);
{$ENDIF}
end;

function TIvWideStringList.GetObject(i: Integer): TObject;
begin
  if (i < 0) or (i >= FCount) then
    raise ERangeError.Create('Out of string list range');
  Result := FList^[i].FObject;
end;

procedure TIvWideStringList.SetObject(i: Integer; value: TObject);
begin
  if (i < 0) or (i >= FCount) then
    raise ERangeError.Create('Out of string list range');
  FList^[i].FObject := value;
end;

procedure TIvWideStringList.Grow;
var
  delta: Integer;
begin
  if FCapacity > 8 then
    delta := 16
  else if FCapacity > 4 then
    delta := 8
  else
    delta := 4;
  SetCapacity(FCapacity + delta);
end;

procedure TIvWideStringList.SetCapacity(value: Integer);
begin
  ReallocMem(FList, value*SizeOf(TIvWideStringItem));
  FCapacity := value;
end;

function TIvWideStringList.Add(const str: TIvWideString): Integer;
begin
  Result := AddObject(str, nil);
end;

function TIvWideStringList.AddObject(const str: WideString; obj: TObject): Integer;
begin
  if FCount = FCapacity then
    Grow;
  with FList^[FCount] do
  begin
{$IFDEF IVWIDE}
    Pointer(FString) := nil;
    FString := str;
{$ELSE}
    FString := SysAllocString(str);
{$ENDIF}
    FObject := obj;
  end;
  Result := FCount;
  Inc(FCount);
end;
{$ENDIF}

end.
