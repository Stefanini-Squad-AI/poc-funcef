unit IvWParser;

{$I IVMULTI.INC}

interface

uses
  Windows, SysUtils,
  IvCommon;

type
  TIvWideParser = class(TObject)
  protected
    FPosition: Integer;
    FMaxPosition: Integer;
    FSeparator: WideChar;
    FValue: TIvWideString;
    FConvert: Boolean;
    FCodePage: Integer;

    procedure SetValue(const value: TIvWideString);

    function GetCurrentValue: TIvWideString;
    function GetRestValue: TIvWideString;

  public
    constructor Create;
    constructor CreateValue(const value: TIvWideString; separator: WideChar);

    function Eol: Boolean;

    procedure RemoveWhiteSpaces;

    function TakeChar: WideChar;
    function PeekChar: WideChar;

    function GetString: TIvWideString;
    function GetChar: WideChar;
    function GetInteger: Integer;
    function GetFloat: Double;
    function GetBoolean: Boolean;

    function GetAnsiString: String;
    function GetAnsiChar: Char;

    function GetCharDef(defaultValue: WideChar): WideChar;
    function GetIntegerDef(defaultValue: Longint): Longint;
    function GetFloatDef(defaultValue: Double): Double;
    function GetBooleanDef(defaultValue: Boolean): Boolean;

    class function CodeStr(const str: TIvWideString): TIvWideString;
    class function DecodeStr(const str: TIvWideString): TIvWideString;

    property Position: Integer read FPosition;
    property Separator: WideChar read FSeparator write FSeparator;
    property CurrentValue: TIvWideString read GetCurrentValue;
    property RestValue: TIvWideString read GetRestValue;
    property Value: TIvWideString read FValue write SetValue;
    property Convert: Boolean read FConvert write FConvert;
    property CodePage: Integer read FCodePage write FCodePage;
  end;

implementation

{$IFDEF IVANSI}
var
  commonString: PWideChar;
{$ENDIF}

constructor TIvWideParser.Create;
begin
  inherited Create;
  FConvert := False;
  FPosition := 0;
  FSeparator := #9;
  SetValue('');
end;

constructor TIvWideParser.CreateValue(
  const value: TIvWideString;
  separator: WideChar);
begin
  inherited Create;
  FConvert := False;
  FPosition := 0;
  FSeparator := separator;
  SetValue(value);
end;

procedure TIvWideParser.RemoveWhiteSpaces;
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

function TIvWideParser.TakeChar: WideChar;
begin
  if Eol then
    Result := WideChar(0)
  else
  begin
    Result := FValue[FPosition];
    Inc(FPosition);
  end;
end;

function TIvWideParser.PeekChar: WideChar;
begin
  if Eol then
    Result := WideChar(0)
  else
    Result := FValue[FPosition];
end;

procedure TIvWideParser.SetValue(const value: TIvWideString);
begin
  FValue := value;
{$IFDEF IVWIDE}
  FMaxPosition := Length(FValue) + 1;
  FPosition := 1;
{$ELSE}
  FMaxPosition := SysStringLen(FValue);
  FPosition := 0;
{$ENDIF}
end;

function TIvWideParser.Eol: Boolean;
begin
  Result := FPosition >= FMaxPosition;
end;

class function TIvWideParser.CodeStr(const str: TIvWideString): TIvWideString;
var
  c: WideChar;
  i: Integer;
{$IFDEF IVANSI}
  len, index: Integer;
{$ENDIF}
begin
{$IFDEF IVWIDE}
  Result := '';
  for i := 1 to Length(str) do
  begin
    c := str[i];
    case c of
      #9: Result := Result + '#T';
      #10: Result := Result + '#L';
      #13: Result := Result + '#C';
    else
      Result := Result + WideString(c);
    end;
  end;
{$ELSE}
  len := SysStringLen(str);
  Result := SysAllocStringLen(nil, 2*len + 1);
  for i := 0 to len do
  begin
    c := str[i];
    case c of
      WideChar(#9):
      begin
        Result[index] := '#';
        Inc(index);
        Result[index] := 'T';
      end;

      WideChar(#10):
      begin
        Result[index] := '#';
        Inc(index);
        Result[index] := 'L';
      end;

      WideChar(#13):
      begin
        Result[index] := '#';
        Inc(index);
        Result[index] := 'C';
      end;
    else
      Result[index] := c;
    end;
    Inc(index);
  end;

  SysFreeString(commonString);
  commonString := Result;
{$ENDIF}
end;

class function TIvWideParser.DecodeStr(const str: TIvWideString): TIvWideString;
var
  c: WideChar;
  len, src, dest: Integer;
begin
{$IFDEF IVWIDE}
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

  // Sets the string length to actual length

  SetLength(Result, dest - 1);
{$ELSE}
  // Delphi 2 and C++Builder 1 do not support coded Unicode text dictionaries!

  Result := str;
{$ENDIF}
end;

function TIvWideParser.GetRestValue: TIvWideString;
begin
{$IFDEF IVWIDE}
  if FValue = '' then
    Result := ''
  else
    Result := Copy(FValue, FPosition, FMaxPosition);
{$ELSE}
  if SysStringLen(FValue) = 0 then
    Result := ''
  else
    Result := SysAllocStringLen(Pointer(@FValue[FPosition]), FMaxPosition);

  SysFreeString(commonString);
  commonString := Result;
{$ENDIF}
end;

function TIvWideParser.GetCurrentValue: TIvWideString;
var
  start, pos: Integer;
begin
{$IFDEF IVWIDE}
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
{$ELSE}
  if SysStringLen(FValue) = 0 then
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
      Result := SysAllocStringLen(Pointer(@FValue[start]), pos - start);
  end;

  SysFreeString(commonString);
  commonString := Result;
{$ENDIF}
end;

function TIvWideParser.GetString: TIvWideString;
var
  start: Integer;
begin
{$IFDEF IVWIDE}
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
{$ELSE}
  if SysStringLen(FValue) = 0 then
    Result := ''
  else
  begin
    start := FPosition;
    while (FPosition < FMaxPosition) and (FValue[FPosition] <> FSeparator) do
      Inc(FPosition);

    if FPosition = start then
      Result := ''
    else
      Result := SysAllocStringLen(Pointer(@FValue[start]), FPosition - start);
    Inc(FPosition);
  end;

  SysFreeString(commonString);
  commonString := Result;
{$ENDIF}
end;

function TIvWideParser.GetAnsiString: String;
begin
  Result := IvWStrToStr(GetString, FCodePage);
end;

function TIvWideParser.GetChar: WideChar;
begin
  Result := GetString[1];
end;

function TIvWideParser.GetCharDef(defaultValue: WideChar): WideChar;
begin
  if Eol then
    Result := defaultValue
  else
    Result := GetChar;
end;

function TIvWideParser.GetAnsiChar: Char;
var
  str: String;
begin
  str := IvWStrToStr(GetString, FCodePage);
  Result := str[1];
end;

function TIvWideParser.GetInteger: Integer;
begin
  Result := StrToInt(GetAnsiString);
end;

function TIvWideParser.GetIntegerDef(defaultValue: Longint): Longint;
begin
  Result := StrToIntDef(GetAnsiString, defaultValue);
end;

function TIvWideParser.GetFloat: Double;
begin
  Result := StrToFloat(GetAnsiString);
end;

function TIvWideParser.GetFloatDef(defaultValue: Double): Double;
begin
  if Eol then
    Result := defaultValue
  else
    Result := GetFloat;
end;

function TIvWideParser.GetBoolean: Boolean;
var
  str: String;
begin
  str := GetAnsiString;
  if (str = '0') or (CompareText(str, 'false') = 0) or (CompareText(str, 'no') = 0) then
    Result := False
  else if (str = '1') or (CompareText(str, 'true') = 0) or (CompareText(str, 'yes') = 0) then
    Result := True
  else
    raise Exception.Create(str + ' is not a boolean value');
end;

function TIvWideParser.GetBooleanDef(defaultValue: Boolean): Boolean;
begin
  if Eol then
    Result := defaultValue
  else
    Result := GetBoolean;
end;

initialization
{$IFDEF IVANSI}
  commonString := nil;
finalization
  SysFreeString(commonString);
{$ENDIF}
end.
