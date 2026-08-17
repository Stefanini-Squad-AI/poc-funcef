unit IvUTF8;

{$I IVMULTI.INC}

interface

uses
  SysUtils, IvCommon;

type
  EIvUTF8 = class(Exception)
  protected
    FStr: String;

  public
    constructor Create(const msg, str: String);

    property Str: String read FStr write FStr;
  end;

{$IFDEF IVWIDE}
function UTF8ToWideString(const str: String): WideString;
function WideStringToUTF8(str: WideString): String;
{$ENDIF}

implementation

constructor EIvUTF8.Create(const msg, str: String);
begin
  inherited Create(msg);
  FStr := str;
end;

{$IFDEF IVWIDE}
function UTF8ToWideString(const str: String): WideString;
const
  INVALID_UTF_C = 'Invalid UTF-8 string';
var
  b1, b2, b3: Byte;
  len: Word;
  i: Integer;
  s: WideString;
begin
  // Reads a UTF-8 coded string

  Result := '';
  len := Length(str);
  i := 1;
  while i <= len do
  begin
    b1 := Byte(str[i]);

    case b1 shr 4 of
      0, 1, 2, 3, 4, 5, 6, 7:
      begin
        // 0xxxxxxx

        s := WideChar(b1);
        Result := Result + s;
      end;

      12, 13:
      begin
        // 110x xxxx, 10xx xxxx

        b2 := Byte(str[i + 1]);
        if (b2 and $C0) <> $80 then
          raise EIvUTF8.Create(INVALID_UTF_C, str);
        s := WideChar(((b1 and $1F) shl 6) or (b2 and $3F));
        Result := Result + s;
        Inc(i);
      end;

      14:
      begin
        // 1110 xxxx, 10xx xxxx, 10xx xxxx

        b2 := Byte(str[i + 1]);
        b3 := Byte(str[i + 2]);
        if ((b2 and $C0) <> $80) or ((b3 and $C0) <> $80) then
          raise EIvUTF8.Create(INVALID_UTF_C, str);
        s := WideChar(((b1 and $0F) shl 12) or ((b2 and $3F) shl 6) or (b3 and $3F));
        Result := Result + s;
        Inc(i, 2);
      end;
    else
      // 1111 xxxx ins invalid

      raise EIvUTF8.Create(INVALID_UTF_C, str);
    end;

    Inc(i);
  end;
end;

function WideStringToUTF8(str: WideString): String;
const
  HEADER_C = $80;
  DATA_MASK_C = $003F;
var
  i, c: Integer;
begin
  Result := '';
  for i := 1 to Length(str) do
  begin
    c := Ord(str[i]);
    if c < $80 then
      // 0xxxxxxx

      Result := Result + Chr(c)
    else if (c >= $80) and (c < $400) then
      // 110x xxxx, 10xx xxxx

      Result := Result +
        Chr($C0 or (c shr 6)) +
        Chr(HEADER_C or (DATA_MASK_C and c))
    else
      // 1110 xxxx, 10xx xxxx, 10xx xxxx

      Result := Result +
        Chr($E0 or (c shr 12)) +
        Chr(HEADER_C or (DATA_MASK_C and (c shr 6))) +
        Chr(HEADER_C or (DATA_MASK_C and c));
  end;
end;
{$ENDIF}

end.
