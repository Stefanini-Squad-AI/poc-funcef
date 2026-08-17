unit IvParser;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils;

type
  TIvStringParser = class(TObject)
  protected
    FPosition: Integer;
    FMaxPosition: Integer;
    FSeparator: Char;
    FValue: String;
    FConvert: Boolean;

    procedure SetValue(const value: String);

    function GetCurrentValue: String;

  public
    constructor Create;
    constructor CreateValue(const value: String; separator: Char);

    function Eol: Boolean;

    procedure RemoveWhiteSpaces;

    function TakeChar: Char;
    function PeekChar: Char;

    function GetString: String;
    function GetChar: Char;
    function GetInteger: Longint;
    function GetFloat: Double;
    function GetBoolean: Boolean;

    function GetCharDef(defaultValue: Char): Char;
    function GetIntegerDef(defaultValue: Longint): Longint;
    function GetFloatDef(defaultValue: Double): Double;
    function GetBooleanDef(defaultValue: Boolean): Boolean;

    class function CodeStr(const str: String): String;
    class function DecodeStr(const str: String): String;

    property Position: Integer read FPosition;
    property Separator: Char read FSeparator write FSeparator;
    property CurrentValue: String read GetCurrentValue;
    property Value: String read FValue write SetValue;
    property Convert: Boolean read FConvert write FConvert;
  end;

{$IFDEF WIN32}
  TIvAnsiParser = class(TIvStringParser)
  end;
{$ELSE}
  TIvAnsiParser = class(TObject)
  protected
    FPosition: Integer;
    FMaxPosition: Integer;
    FSeparator: Char;
    FValue: PChar;
    FConvert: Boolean;

    procedure SetValue(const value: PChar);

  public
    constructor Create;
    constructor CreateValue(const value: PChar; separator: Char);
    destructor Destroy; override;

    function Eol: Boolean;

    function TakeChar: Char;

    function GetString: String;
    function GetChar: Char;
    function GetInteger: Longint;
    function GetFloat: Double;
    function GetBoolean: Boolean;

    property Position: Integer read FPosition;
    property Separator: Char read FSeparator write FSeparator;
    property Value: PChar read FValue write SetValue;
    property Convert: Boolean read FConvert write FConvert;
  end;
{$ENDIF}

implementation

constructor TIvStringParser.Create;
begin
  inherited Create;
  FConvert := False;
  FPosition := 0;
  FSeparator := #9;
  SetValue('');
end;

constructor TIvStringParser.CreateValue(const value: String; separator: Char);
begin
  inherited Create;
  FConvert := False;
  FPosition := 0;
  FSeparator := separator;
  SetValue(value);
end;

procedure TIvStringParser.SetValue(const value: String);
begin
  FValue := value;
  FMaxPosition := Length(FValue) + 1;
  FPosition := 1;
end;

function TIvStringParser.Eol: Boolean;
begin
  Result := FPosition >= FMaxPosition;
end;

procedure TIvStringParser.RemoveWhiteSpaces;
begin
  while (not Eol) and
    ((FValue[FPosition] = ' ') or
     (FValue[FPosition] = #9) or
     (FValue[FPosition] = #10) or
     (FValue[FPosition] = #13)) do
  begin
    Inc(FPosition);
  end;
end;

function TIvStringParser.TakeChar: Char;
begin
  if Eol then
    Result := Chr(0)
  else
  begin
    Result := FValue[FPosition];
    Inc(FPosition);
  end;
end;

function TIvStringParser.PeekChar: Char;
begin
  if Eol then
    Result := Chr(0)
  else
    Result := FValue[FPosition];
end;

class function TIvStringParser.CodeStr(const str: String): String;
var
  c: Char;
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(str) do
  begin
    c := str[i];
    case c of
      #9: Result := Result + '#T';
      #10: Result := Result + '#L';
      #13: Result := Result + '#C';
    else
      Result := Result + c;
    end;
  end;
end;

class function TIvStringParser.DecodeStr(const str: String): String;
var
  c: Char;
  len, src, dest: Integer;
begin
{$IFDEF WIN32}
  len := Length(str);
  SetLength(Result, len);
  dest := 1;
  src := 1;
  while src <= len do
  begin
    c := str[src];
    if c = '#' then
    begin
      Inc(src);
      if src <= len then
      begin
        c := str[src];
        case c of
          '#': c := '#';
          'T': c := #9;
          'C': c := #13;
          'L': c := #10;
        else
          Result[dest] := '#';
          Inc(dest);
        end;
      end;
    end;

    Result[dest] := c;
    Inc(src);
    Inc(dest);
  end;

  { Sets the string length to actual length }

  SetLength(Result, dest - 1);
{$ELSE}
  Result := '';
  len := Length(str);
  src := 1;
  while src <= len do
  begin
    c := str[src];
    if c = '#' then
    begin
      Inc(src);
      if src <= len then
      begin
        c := str[src];
        case c of
          '#': c := '#';
          'T': c := #9;
          'C': c := #13;
          'L': c := #10;
        else
          Result := Result + '#';
        end;
      end;
    end;

    Result := Result + c;
    Inc(src);
  end;
{$ENDIF}
end;

function TIvStringParser.GetCurrentValue: String;
var
  start, pos: Integer;
begin
  if FValue = '' then
    Result := ''
  else
  begin
    pos := FPosition;
    start := FPosition;
    while (pos < FMaxPosition) and (FValue[pos] <> FSeparator) do
      Inc(pos);

    if pos = start then
      Result := ''
    else
      Result := Copy(FValue, start, pos - start);
  end;
end;

function TIvStringParser.GetString: String;
var
  start: Integer;
begin
  if FValue = '' then
    Result := ''
  else
  begin
    start := FPosition;
    while (FPosition < FMaxPosition) and (FValue[FPosition] <> FSeparator) do
      Inc(FPosition);

    if FPosition = start then
      Result := ''
    else
      Result := Copy(FValue, start, FPosition - start);
    Inc(FPosition);

    if FConvert and (Pos('#', Result) > 0) then
      Result := DecodeStr(Result);
  end;
end;

function TIvStringParser.GetChar: Char;
begin
  Result := GetString[1];
end;

function TIvStringParser.GetCharDef(defaultValue: Char): Char;
begin
  if Eol then
    Result := defaultValue
  else
    Result := GetChar;
end;

function TIvStringParser.GetInteger: Longint;
begin
  Result := StrToInt(GetString);
end;

function TIvStringParser.GetIntegerDef(defaultValue: Longint): Longint;
begin
  Result := StrToIntDef(GetString, defaultValue);
end;

function TIvStringParser.GetFloat: Double;
var
  oldDecimalSeparator: Char;
begin
  oldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
    Result := StrToFloat(GetString);
  finally
    DecimalSeparator := oldDecimalSeparator;
  end;
end;

function TIvStringParser.GetFloatDef(defaultValue: Double): Double;
begin
  if Eol then
    Result := defaultValue
  else
    Result := GetFloat;
end;

function TIvStringParser.GetBoolean: Boolean;
var
  str: String;
begin
  str := GetString;
  if (str = '0') or (CompareText(str, 'false') = 0) or (CompareText(str, 'no') = 0) then
    Result := False
  else if (str = '1') or (CompareText(str, 'true') = 0) or (CompareText(str, 'yes') = 0) then
    Result := True
  else
    raise Exception.Create(str + ' is not a boolean value');
end;

function TIvStringParser.GetBooleanDef(defaultValue: Boolean): Boolean;
begin
  if Eol then
    Result := defaultValue
  else
    Result := GetBoolean;
end;


{ TIvAnsiParser }

{$IFNDEF WIN32}
constructor TIvAnsiParser.Create;
begin
  inherited Create;
  FConvert := False;
  FPosition := 0;
  FSeparator := #9;
  SetValue(nil);
end;

constructor TIvAnsiParser.CreateValue(const value: PChar; separator: Char);
begin
  inherited Create;
  FConvert := False;
  FPosition := 0;
  FSeparator := separator;
  SetValue(value);
end;

destructor TIvAnsiParser.Destroy;
begin
  if FValue <> nil then
    StrDispose(FValue);
  inherited Destroy;
end;

procedure TIvAnsiParser.SetValue(const value: PChar);
begin
  { Frees the previous value }

  if FValue <> nil then
    StrDispose(FValue);

  { Sets the new value }

  FValue := value;
  if FValue = nil then
    FMaxPosition := -1
  else
    FMaxPosition := StrLen(FValue);
  FPosition := 0;
end;

function TIvAnsiParser.Eol: Boolean;
begin
  Result := FPosition >= FMaxPosition;
end;

function TIvAnsiParser.GetString: String;
var
  start: Integer;
  i: Integer;
begin
  if StrLen(FValue) = 0 then
    Result := ''
  else
  begin
    start := FPosition;
    while (FPosition < FMaxPosition) and (FValue[FPosition] <> FSeparator) do
      Inc(FPosition);

    if FPosition = start then
      Result := ''
    else
    begin
      Result := '';
      for i := start to FPosition - 1 do
        Result := Result + FValue[i];
    end;
    Inc(FPosition);
  end;
end;

function TIvAnsiParser.TakeChar: Char;
begin
  Result := FValue[FPosition];
  Inc(FPosition);
end;

function TIvAnsiParser.GetChar: Char;
begin
  Result := GetString[1];
end;

function TIvAnsiParser.GetInteger: Longint;
begin
  Result := StrToInt(GetString);
end;

function TIvAnsiParser.GetFloat: Double;
begin
  Result := StrToFloat(GetString);
end;

function TIvAnsiParser.GetBoolean: Boolean;
var
  str: String;
begin
  str := GetString;
  if (str = '0') or (CompareText(str, 'false') = 0) or (CompareText(str, 'no') = 0) then
    Result := False
  else if (str = '1') or (CompareText(str, 'true') = 0) or (CompareText(str, 'yes') = 0) then
    Result := True
  else
    raise Exception.Create(str + ' is not a boolean value');
end;
{$ENDIF}

end.
