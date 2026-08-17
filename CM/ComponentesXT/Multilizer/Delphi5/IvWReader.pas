unit IvWReader;

{$I IVMULTI.INC}

interface

uses
  Windows, SysUtils,
  IvCommon, IvDictio, IvReader;

const
  WIDE_TAB_C: WideChar = WideChar($0009);
  WIDE_LF_C: WideChar = WideChar($000A);
  WIDE_CR_C: WideChar = WideChar($000D);
  UTF16LE_TAG_C: WideChar = WideChar($FEFF);
  UTF16BE_TAG_C: WideChar = WideChar($FFFE);

type
  EIvNotUnicodeFile = class(Exception);

  TIvBaseWideReader = class(TIvBaseReader)
  public
    function ReadLine: TIvWideString; virtual; abstract;
  end;

  // Files readers

  TIvWideReader = class(TIvBaseWideReader)
  protected
    FHandle: Integer;
    FBufferSize: Integer;
    FBufferIndex: Integer;

    function ReadIntoBuffer: Integer; virtual; abstract;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Open; override;
    procedure Close; override;
    function Eof: Boolean; override;
  end;

{$IFDEF IVWIDE}
  TIvUTF8Reader = class(TIvWideReader)
  protected
    FBuffer: array[0..255] of Char;

    function ReadIntoBuffer: Integer; override;

  public
    function ReadLine: TIvWideString; override;
  end;
{$ENDIF}

  TIvUTF16Reader = class(TIvWideReader)
  protected
    FBuffer: array[0..255] of WideChar;
    FByteOrder: TIvByteOrder;
    FByteOrderMark: Boolean;

    procedure ChangeWordByteOrder(var value: WideChar);

    function ReadIntoBuffer: Integer; override;

  public
    constructor Create(byteOrder: TIvByteOrder; byteOrderMark: Boolean);

    procedure Open; override;

    function ReadLine: TIvWideString; override;

    property ByteOrder: TIvByteOrder read FByteOrder;
    property ByteOrderMark: Boolean read FByteOrderMark write FByteOrderMark;
  end;

  // Resource readers

  TIvResourceWideReader = class(TIvBaseWideReader)
  protected
    FBufferIndex: Integer;
    FBufferSize: Integer;

  public
    constructor Create;

    function Eof: Boolean; override;
  end;

  TIvResourceUTF8Reader = class(TIvResourceWideReader)
  protected
    FBuffer: PChar;

  public
    constructor Create;

    procedure Open; override;
    function ReadLine: TIvWideString; override;
  end;

  TIvResourceUTF16Reader = class(TIvResourceWideReader)
  protected
    FBuffer: PWideChar;

  public
    constructor Create;

    procedure Open; override;
    function ReadLine: TIvWideString; override;
  end;

implementation

uses
  IvUTF8;


// TIvWideReader

constructor TIvWideReader.Create;
begin
  inherited Create;
  FHandle := 0;
end;

destructor TIvWideReader.Destroy;
begin
  Close;
  inherited Destroy;
end;

procedure TIvWideReader.Open;
begin
  FHandle := FileOpen(FStorageName, fmOpenRead);
  if FHandle <= 0 then
    raise EInOutError.Create('Could not open the file ' + FStorageName);
  FBufferIndex := 0;
  FBufferSize := 0;
end;

procedure TIvWideReader.Close;
begin
  if FHandle > 0 then
  begin
    FileClose(FHandle);
    FHandle := 0;
    FBufferIndex := 0;
    FBufferSize := 0;
  end;
end;

function TIvWideReader.Eof: Boolean;
begin
  if (FBufferSize = 0) or (FBufferIndex = FBufferSize) then
    ReadIntoBuffer;
  Result := FBufferSize = 0;
end;


{$IFDEF IVWIDE}
// TIvUTF8Reader

function TIvUTF8Reader.ReadIntoBuffer: Integer;
begin
  FBufferIndex := 0;
  FBufferSize := FileRead(FHandle, FBuffer, SizeOf(FBuffer));
  Result := FBufferSize;
end;

function TIvUTF8Reader.ReadLine: WideString;
var
  c: Char;
  str: String;
begin
  str := '';
  try
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
        str := str + String(c);
    end;
  finally
    Result := UTF8ToWideString(str);
  end;
end;
{$ENDIF}


// TIvUTF16Reader

constructor TIvUTF16Reader.Create(byteOrder: TIvByteOrder; byteOrderMark: Boolean);
begin
  inherited Create;
  FByteOrder := byteOrder;
  FByteOrderMark := byteOrderMark;
end;

procedure TIvUTF16Reader.ChangeWordByteOrder(var value: WideChar);
begin
  value :=
    WideChar(((Word(value) and $00FF) shl 8) or
    ((Word(value) and $FF00) shr 8));
end;

function TIvUTF16Reader.ReadIntoBuffer: Integer;
begin
  FBufferIndex := 0;
  FBufferSize := FileRead(FHandle, FBuffer, SizeOf(FBuffer)) div SizeOf(WideChar);
  Result := FBufferSize;
end;

procedure TIvUTF16Reader.Open;
var
  c: WideChar;
begin
  inherited Open;
  if FByteOrderMark then
  begin
    if (FileRead(FHandle, c, SizeOf(c)) < SizeOf(c)) or ((c <> UTF16LE_TAG_C) and ((c <> UTF16BE_TAG_C))) then
    begin
      FileClose(FHandle);
      raise EIvNotUnicodeFile.Create('Not a Unicode file');
    end
    else if c = UTF16LE_TAG_C then
      FByteOrder := ivboLittleEndian
    else
      FByteOrder := ivboBigEndian;
  end;
end;

{$IFDEF IVWIDE}
function TIvUTF16Reader.ReadLine: WideString;
var
  c: WideChar;
begin
  Result := '';
  while True do
  begin
    if (FBufferIndex = FBufferSize) and (ReadIntoBuffer = 0) then
      Break;

    c := FBuffer[FBufferIndex];
    Inc(FBufferIndex);
    if ByteOrder = ivboBigEndian then
      ChangeWordByteOrder(c);

    if (c = WIDE_CR_C) or (c = WIDE_LF_C) then
    begin
      while True do
      begin
        if (FBufferIndex = FBufferSize) and (ReadIntoBuffer = 0) then
          Exit;

        c := FBuffer[FBufferIndex];
        if ByteOrder = ivboBigEndian then
          ChangeWordByteOrder(c);
        if (c <> WIDE_CR_C) and (c <> WIDE_LF_C) then
          Break;
        Inc(FBufferIndex);
      end;
      Break;
    end
    else
      Result := Result + WideString(c);
  end;
end;
{$ELSE}
function TIvUTF16Reader.ReadLine: TIvWideString;
var
  c: WideChar;
  len, size: Integer;
begin
  len := 0;
  size := 256;
  Result := SysAllocStringLen(nil, size);
  while True do
  begin
    if (FBufferIndex = FBufferSize) and (ReadIntoBuffer = 0) then
      Break;

    c := FBuffer[FBufferIndex];
    if ByteOrder = ivboBigEndian then
      ChangeWordByteOrder(c);
    Inc(FBufferIndex);

    if c = WIDE_LF_C then
      // Unix style text file (only LF at the end of line)

      Break
    else if c = WIDE_CR_C then
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
        size := 3*size div 2;
        SysReAllocStringLen(Result, Result, size);
      end;
      Result[len] := c;
      Inc(len);
    end;
  end;
  Result[len] := WideChar(0);
end;
{$ENDIF}


// TIvResourceWideReader

constructor TIvResourceWideReader.Create;
begin
  inherited Create;
  FBufferIndex := 0;
  FBufferSize := 0;
end;

function TIvResourceWideReader.Eof: Boolean;
begin
  Result := FBufferIndex = FBufferSize;
end;

{$IFDEF IVWIDE}
function TIvResourceUTF8Reader.ReadLine: WideString;
var
  c: Char;
  str: String;
begin
  str := '';
  try
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
        Result := Result + WideString(c);
    end;
  finally
    Result := UTF8ToWideString(str);
  end;
end;
{$ELSE}
function TIvResourceUTF8Reader.ReadLine: TIvWideString;
begin
  raise Exception.Create('TIvResourceUTF8Reader.ReadLine not implemented in Delphi 2 and C++Builder 1');
end;
{$ENDIF}


// TIvResourceUTF8Reader

constructor TIvResourceUTF8Reader.Create;
begin
  inherited Create;
  FBuffer := nil;
end;

procedure TIvResourceUTF8Reader.Open;
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


// TIvResourceUTF16Reader

constructor TIvResourceUTF16Reader.Create;
begin
  inherited Create;
  FBuffer := nil;
end;

procedure TIvResourceUTF16Reader.Open;
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

{$IFDEF IVWIDE}
function TIvResourceUTF16Reader.ReadLine: WideString;
var
  c: WideChar;
begin
  Result := '';
  while True do
  begin
    c := FBuffer[FBufferIndex];
    Inc(FBufferIndex);

    if c = WIDE_LF_C then
      // Unix style text file (only LF at the end of line)

      Break
    else if c = WIDE_CR_C then
    begin
      Inc(FBufferIndex);
      Break;
    end
    else
      Result := Result + WideString(c);
  end;
end;
{$ELSE}
function TIvResourceUTF16Reader.ReadLine: TIvWideString;
var
  c: WideChar;
  len, size: Integer;
begin
  len := 0;
  size := 256;
  Result := SysAllocStringLen(nil, size);
  while True do
  begin
    c := FBuffer[FBufferIndex];
    Inc(FBufferIndex);

    if c = WIDE_LF_C then
      // Unix style text file (only LF at the end of line)

      Break
    else if c = WIDE_CR_C then
    begin
      Inc(FBufferIndex);
      Break;
    end
    else
    begin
      if len >= size then
      begin
        size := 3*size div 2;
        SysReAllocStringLen(Result, Result, size);
      end;
      Result[len] := c;
      Inc(len);
    end;
  end;
end;
{$ENDIF}

end.
