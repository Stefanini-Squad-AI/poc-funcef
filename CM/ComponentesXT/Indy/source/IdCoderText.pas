unit IdCoderText;

interface

{ ToDo : Add InByteCount to Quoted-printable }

{
2000-Apr-12 Pete Mee
 - Finished Quoted Printable.
2000-Apr-11 Pete Mee
 - Start Quoted Printable
}

uses
  Classes,
  IdCoder;

type
  TIdQuotedPrintableEncoder = class(TIdCoder)
  protected
    FQPOutputString : String;
    procedure QPOutput(const sOut : String); virtual;
    function ToQuotedPrintable(const b : Byte) : String;
    procedure Coder; override;
    procedure CompleteCoding; override;

  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure Reset; override;
  end;

  TIdQuotedPrintableDecoder = class(TIdCoder)
  protected
    fQPTriple : String;
    fInTriple : Byte;
    procedure Coder; override;
    procedure CompleteCoding; override;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure Reset; override;
  end;

implementation


uses
  IdGlobal,
  SysUtils;

const
  QPLowBound = 32;
  QPMidBound = 61;
  QPHighBound = 126;
  QPEDBDIC = '!"#$@[\]^`{|}~';

////////////////////////////
// TIdQuotedPrintableEncoder
////////////////////////////

constructor TIdQuotedPrintableEncoder.Create;
begin
  inherited Create(AOwner);
  fAddCRLF := False;
  FQPOutputString := '';
end;

destructor TIdQuotedPrintableEncoder.Destroy;
begin
  inherited;
end;

procedure TIdQuotedPrintableEncoder.Reset;
begin
  FQPOutputString := '';
end;

procedure TIdQuotedPrintableEncoder.Coder;
var
  i : LongWord;
  b : Byte;
  s : String;
begin
  s := '';
  i := 1;
  while i <= FCBufferSize do begin
    b := Byte(FCBuffer[i]);
    if (b >= QPLowBound) and (b <= QPHighBound) then begin
      if b = QPMidBound then begin
        // Output quoted-printable value of 60
        s := s + ToQuotedPrintable(QPMidBound);
      end else if IndyPos(Char(b), QPEDBDIC) > 0 then begin
        // This ensure correct coding through an EDBDIC gateway
        s := s + ToQuotedPrintable(b);
      end else begin
        // Ouput string as-is
        s := s + Char(b);
      end;
    end else begin
      if b = Byte(CR) then begin
        if i < FCBufferSize then begin
          if FCBuffer[i + 1] = LF then begin
            s := s + EOL;
            Inc(i);
          end else begin
            s := s + ToQuotedPrintable(b);
          end;
        end else begin
          // Ignore this one - could be a #11 at the start of next block
          FCBufferedData := 1;
          FCBuffer[1] := Char(b);
          QPOutput(s);
          Exit;
        end;
      end else begin
        s := s + ToQuotedPrintable(b);
      end;
    end;
    Inc(i);
  end;
  QPOutput(s);
  FCBufferedData := 0;
end;

procedure TIdQuotedPrintableEncoder.QPOutput;
var
  s : String;
  i : LongWord;
begin
  // Must only output whole lines of 76 chars or less.  White space at the end
  // of a line is to be given the equals sign at the end
  FQPOutputString := FQPOutputString + sOut;
  i := IndyPos(EOL, FQPOutputString);
  while i > 0 do begin
    s := Copy(FQPOutputString, 1, i - 1);
    FQPOutputString := Copy(FQPOutputString, i + 2, length(FQPOutputString));
    i := length(s);
    if i > 0 then begin
      case s[i] of
        ' ' , TAB : begin
          s := s + Copy(ToQuotedPrintable(Byte(s[i])), 2, 2);
          s[i] := '=';
        end;
      else
        s := s + CR + LF;
      end;
    end else begin
      s := CR + LF;
    end;
    OutputString(s);
    i := IndyPos(EOL, FQPOutputString);
  end;
  while length(FQPOutputString) > 75 do begin
    if FQPOutputString[73] = '=' then begin
      i := 72;
    end else if FQPOutputString[74] = '=' then begin
      i := 73;
    end else if FQPOutputString[75] = '=' then begin
      i := 74;
    end else begin
      i := 75;
    end;
    OutputString(Copy(FQPOutputString, 1, i) + '='); // 'soft' line break
    FQPOutputString := Copy(FQPOutputString, i + 1, length(FQPOutputString));
  end;
end;

procedure TIdQuotedPrintableEncoder.CompleteCoding;
var
  i, j : LongWord;
begin
  fInCompletion := True;
  i := FCBufferSize;
  InternSetBufferSize(FCBufferedData);
  FCBufferedData := FCBufferSize;
  if FCBufferedData > 0 then begin
    Coder;
  end;
  // Possible to have a single #13 character left in buffer
  if FCBufferedData > 0 then begin
    QPOutput(ToQuotedPrintable(13));
  end;
  // Output the remaining buffered output.
  j := Length(FQPOutputString);
  if j > 0 then begin
    // Check for a space of tab at the end.
    case FQPOutputString[j] of
      ' ', TAB : begin
        FQPOutputString := FQPOutputString + Copy(ToQuotedPrintable(
          Byte(FQPOutputString[j])), 2, 2);
        FQPOutputString[j] := '=';
      end;
    end;
    // Check that the length fits in 75...
    while length(FQPOutputString) > 75 do begin
      if FQPOutputString[73] = '=' then begin
        i := 72;
      end else if FQPOutputString[74] = '=' then begin
        i := 73;
      end else if FQPOutputString[75] = '=' then begin
        i := 74;
      end else begin
        i := 75;
      end;
      OutputString(Copy(FQPOutputString, 1, i) + '='); // 'soft' line break
      FQPOutputString := Copy(FQPOutputString, i + 1, length(FQPOutputString));
    end;
    OutputString(FQPOutputString);
  end;
  InternSetBufferSize(i);
  FCBufferedData := 0;
end;

function TIdQuotedPrintableEncoder.ToQuotedPrintable;
begin
  result := '=' + UpperCase(IntToHex(b, 2));
end;

////////////////////////////
// TIdQuotedPrintableDecoder
////////////////////////////

constructor TIdQuotedPrintableDecoder.Create;
begin
  inherited Create(AOwner);
  fQPTriple := '';
  SetLength(fQPTriple, 2);
  UniqueString(fQPTriple);
  fAddCRLF := False;
  fInTriple := 0;
end;

destructor TIdQuotedPrintableDecoder.Destroy;
begin
  inherited;
end;

procedure TIdQuotedPrintableDecoder.Reset;
begin
  fAddCRLF := False;
  fInTriple := 0;
end;

procedure TIdQuotedPrintableDecoder.Coder;
var
  i : LongWord;
  s : String;
  c : Char;

  function IsHex(c : Char) : Boolean;
  begin
    case c of
      '0'..'9', 'a'..'f', 'A'..'F' : begin
        result := true;
      end;
    else result := False;
    end;
  end;

begin
  i := 1;
  s := '';
  while i <= FCBufferedData do begin
    c := FCBuffer[i];
    if fInTriple > 0 then begin
      fQPTriple[fInTriple] := c;
      Inc(fInTriple);
      if fInTriple >= 3 then begin // Shouldn't get above 3...
        // Test for numerics
        if IsHex(fQPTriple[1]) and IsHex(fQPTriple[2]) then begin
          s := s + Chr(StrToInt('$' + fQPTriple));
        end else if (fQPTriple[1] = CR) and (fQPTriple[2] = LF) then begin
          // Ignore
        end else begin
          // Something's up... possibly
          s := s + '=' + fQPTriple;
        end;
        fInTriple := 0;
      end;
    end else if c = '=' then begin
      Inc(fInTriple);
    end else begin
      s := s + c;
    end;
    Inc(i);
  end;
  OutputString(s);
  FCBufferedData := 0;
end;

procedure TIdQuotedPrintableDecoder.CompleteCoding;
begin
  fInCompletion := True;
  Coder;
  if fInTriple > 0 then begin
    OutputString(Copy(fQPTriple, 1, fInTriple - 1));
    FCBufferedData := 0;
  end;
end;

initialization
  RegisterCoderClass(TIdQuotedPrintableEncoder, CT_CREATION, CP_STANDARD,
    '', 'quoted-printable');
  RegisterCoderClass(TIdQuotedPrintableDecoder, CT_REALISATION, CP_STANDARD,
    '', 'quoted-printable');
end.