unit IvReader;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils;

const
  LF_C: Char = Char($0A);
  CR_C: Char = Char($0D);

  MULTILIZER_RES_TYPE_C = 'MULTILIZER';

type
  TIvBaseReader = class(TObject)
  protected
    FStorageName: String;

  public
    procedure Open; virtual; abstract;
    procedure Close; virtual;
    function Eof: Boolean; virtual; abstract;

    property StorageName: String read FStorageName write FStorageName;
  end;

  TIvBaseAnsiReader = class(TIvBaseReader)
  public
{$IFDEF WIN32}
    function ReadLine: String; virtual; abstract;
{$ELSE}
    function ReadLine: PChar; virtual; abstract;
{$ENDIF}
  end;

  TIvAnsiReader = class(TIvBaseAnsiReader)
  protected
    FHandle: Integer;
    FBufferSize: Integer;
    FBufferIndex: Integer;
    FBuffer: array[0..255] of Char;

    function ReadIntoBuffer: Integer;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Open; override;
    procedure Close; override;

    function Eof: Boolean; override;
{$IFDEF WIN32}
    function ReadLine: String; override;
{$ELSE}
    function ReadLine: PChar; override;
{$ENDIF}
  end;

{$IFDEF WIN32}
  TIvResourceAnsiReader = class(TIvBaseAnsiReader)
  protected
    FBuffer: PChar;
    FBufferIndex: Integer;
    FBufferSize: Integer;

  public
    constructor Create;

    procedure Open; override;
    function Eof: Boolean; override;
    function ReadLine: String; override;
  end;
{$ENDIF}

implementation

{ TIvBaseReader }

procedure TIvBaseReader.Close;
begin
end;


{ TIvAnsiReader }

constructor TIvAnsiReader.Create;
begin
  inherited Create;
  FHandle := 0;
end;

destructor TIvAnsiReader.Destroy;
begin
  Close;
  inherited Destroy;
end;

function TIvAnsiReader.ReadIntoBuffer: Integer;
begin
  FBufferIndex := 0;
  FBufferSize := FileRead(FHandle, FBuffer, SizeOf(FBuffer)) div SizeOf(Char);
  Result := FBufferSize;
end;

procedure TIvAnsiReader.Open;
begin
  FHandle := FileOpen(FStorageName, fmOpenRead or fmShareDenyNone);
  if FHandle <= 0 then
    raise EInOutError.Create('Could not open the file ' + FStorageName);

  FBufferIndex := 0;
  FBufferSize := 0;
end;

procedure TIvAnsiReader.Close;
begin
  if FHandle > 0 then
  begin
    FileClose(FHandle);
    FHandle := 0;
    FBufferIndex := 0;
    FBufferSize := 0;
  end;
end;

function TIvAnsiReader.Eof: Boolean;
begin
  if (FBufferSize = 0) or (FBufferIndex = FBufferSize) then
    ReadIntoBuffer;
  Result := FBufferSize = 0;
end;

{$IFDEF WIN32}
function TIvAnsiReader.ReadLine: String;
var
  c: Char;
begin
  Result := '';
  while True do
  begin
    if (FBufferIndex = FBufferSize) and (ReadIntoBuffer = 0) then
      Break;

    c := FBuffer[FBufferIndex];
    Inc(FBufferIndex);

    if (c = CR_C) or (c = LF_C) then
    begin
      while True do
      begin
        if (FBufferIndex = FBufferSize) and (ReadIntoBuffer = 0) then
          Exit;

        c := FBuffer[FBufferIndex];
        if (c <> CR_C) and (c <> LF_C) then
          Break;
        Inc(FBufferIndex);
      end;
      Break;
    end
    else
      Result := Result + c;
  end;
end;
{$ELSE}
function TIvAnsiReader.ReadLine: PChar;
var
  c: Char;
  newStr: PChar;
  len, size, newSize: Integer;
begin
  len := 0;
  size := 256;
  Result := StrAlloc(size);
  while True do
  begin
    if (FBufferIndex = FBufferSize) and (ReadIntoBuffer = 0) then
      Break;

    c := FBuffer[FBufferIndex];
    Inc(FBufferIndex);

    if c = CR_C then
    begin
      if (FBufferIndex = FBufferSize) and (ReadIntoBuffer = 0) then
        Break;

      Inc(FBufferIndex);
      Break;
    end
    else
    begin
      if len >= size then
      begin
        newSize := 3*size div 2;
        newStr := StrAlloc(newSize);
        StrLCopy(newStr, Result, size);
        StrDispose(Result);
        Result := newStr;
        size := newSize;
      end;
      Result[len] := c;
      Inc(len);
    end;
  end;
  Result[len] := Char(0);
end;
{$ENDIF}

{$IFDEF WIN32}
constructor TIvResourceAnsiReader.Create;
begin
  inherited Create;
  FBuffer := nil;
  FBufferIndex := 0;
  FBufferSize := 0;
end;

procedure TIvResourceAnsiReader.Open;
var
  resource: HRSRC;
  handle: HGLOBAL;
begin
  resource := FindResource(HInstance, PChar(FStorageName), MULTILIZER_RES_TYPE_C);
  if resource = 0 then
    raise EInOutError.Create('Could not open the resource ' + FStorageName);

  handle := LoadResource(HInstance, resource);
  if handle = 0 then
    raise EInOutError.Create('Could not open the resource ' + FStorageName);

  FBuffer := LockResource(handle);
  FBufferIndex := 0;
  FBufferSize := SizeofResource(HInstance, resource);
end;

function TIvResourceAnsiReader.Eof: Boolean;
begin
  Result := FBufferIndex = FBufferSize;
end;

function TIvResourceAnsiReader.ReadLine: String;
var
  c: Char;
begin
  Result := '';
  while True do
  begin
    c := FBuffer[FBufferIndex];
    Inc(FBufferIndex);

    if (c = CR_C) or (c = LF_C) then
    begin
      while True do
      begin
        c := FBuffer[FBufferIndex];
        if (c <> CR_C) and (c <> LF_C) then
          Break;
        Inc(FBufferIndex);
      end;
      Break;
    end
    else
      Result := Result + c;
  end;
end;
{$ENDIF}

end.
