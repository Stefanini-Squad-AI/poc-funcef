unit IdCoder3To4;

{
2000-Jul-25 Hadi Hariri
 - Removed BinHex code temporarily.

ToDo : Add IncByteCount to BinHex 40
       Complete BinHex 40!
       Remove direct use of TIdCodeCompression - should be called through
         IdCoder.
       Remove TIdASCIICoder - merge into TIdCoder3To4
       Remove XX Coders - merge into UU Coders with dynamic table discovery
         for decode.
       Add automatic Reset after END for UUDecoder.
       Add notifications to UUDecoder.
}

{
2000-Jun-29 Pete Mee
 - Fixed bug in B64 Completion to be correct & cope with garbage data.
2000-Jun-26 Pete Mee
 - Alter Base 64 default Encode buffer size to 48 (= 64 byte output per line).
2000-Apr-17 Pete Mee
 - Made Base 64 Decoder resilient to garbage data.
2000-Mar-3 Pete Mee
 - Modified all current coders to be Coder Collection self-registering
2000-Jan-30 Peter Mee
 - Began BinHex support - non-RLE compressed supported.
2000-Jan-27 Peter Mee
 - Prevented stack overflow in UUDecoder when no uuencoded data found.
 - Rename MIME coders to Base64.
 - Reworked UU & Base64 decoders to use inherited 4to3 procedures.
2000-Jan-15 Peter Mee
 - Altered coders to use the OutputString procedure for all output.
2000-Jan-09 Peter Mee
 - Merged 3-to-4 coders for easy maintenance & readability... cuts down on
   code as well. ;-)
 - Created Pointer versions of the coders for pluggability as well as default
   set up routines.
2000-Jan-06 Peter Mee
 - Fixed UUEncoding bug (again). ;-)
1999-Dec-10 Peter Mee
 - UUEncode and UUDecode will complete correctly depending on data size.
   UUEncode output has been correctly decoded by alternative software.
1999-Dec-07 Peter MEe
 - TWinshoeUUDecode nearing completion.  Decoding occurs correctly.
1999-Dec-05 Peter Mee
 - Fixed bug in CompleteCoding for TWinshoeUUEncoder.  Was not checking
   assignment of OnWrite event before using it.
 - Still getting spurious errors in TWinshoeUUEncoder every now and then, though
   less than before.  Typically manifest themselves as EAccess Violations
   somewhere in CompleteCoding.
1999-Dec-04 Peter Mee
 - Fixed bug in TWinshoeUUEncoder that occasionally produced spurious output
   (even when the same input is given multiple times!).
 - Implemented TWinshoeUUDecoder.
1999-Nov-27 Peter Mee
 - Fixed number of bugs in TWinshoeUUEncoder
 - Added TWinshoeXXEncoder
1999-Nov-25 Peter Mee
 - Fixed bug in TWinshoeMIMEDecoder that produced a spurious additional char.
 - Added TWinshoeUUEncoder.
1999-Nov-24 Peter Mee
 - Fixed bug in TWinshoeMIMEEncoder that produced a lack of coding at the end
   of the coded output.
1999-Nov-23 Peter Mee
 - Removed abstract base class to a unit of it's own to hide it (and to use it
   for other Coder units).  All previous notes are from the EncodeWinshoe.pas
   (Chad Hower's).
1999-Jun-20:
  -Added full decoding support to this and WinshoeMessage
1999-Jun-17:
  -Only supports MIME. UUE and XXE are outdated, and rarely used.
   (UUE is occasionally, but pretty rare)
1999-Apr-04
  -Fixed Base64 Encoding Problem
1998-Aug-16
  -Removed QQE support - was incomplete, cannot find documentation
   , and it is rarely if at all used by anyone anymore
}

interface

Uses
  Classes,
  IdCoder,
  IdException;

const
  // Coding Table Length (CTL) values
  CTL3To4 = 64;
  HalfCodeTable = CTL3To4 div 2;
  Base64CodeTable: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  UUCodeTable: string = '`!"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_';
  XXCodeTable: string = '+-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  UUTable = 'TABLE'; {do not localize}
  UUBegin = 'BEGIN '; {do not localize}
  UUEnd = 'END'; {do not localize}
  // Don't actually know what the Privilege is for - something to do with
  // UNIX Privileges...
  minPriv = 600;
  maxPriv = 799;

  // fState values for TIdUUDecoder
  UUStarted = 0;
  UUTableBegun = 1;
  UUTableOneLine = 2;
  UUTableBeenRead = 3;
  UUDataStarted = 4;
  UUBEGINFound = 5;
  UUPrivilegeFound = 6;
  UUInitialLength = 8;
  UULastCharFound = 9;
  UUENDFound = 10;

  // These are to be removed once debugging is done...
  UUErrTableNotAtEnd = UUTable = ' not at end of line'; {do not localize}
  UUErrIncompletePrivilege = 'Not enough chars for three-digit Privilege'; {do not localize}
  UUErrIncompletePrivilege2 = 'Too many chars for three-digit Privilege'; {do not localize}
  UUErrorPivilageNotNumeric = 'Privilege chars not numeric'; {do not localize}
  UUErrorNoBEGINAfterTABLE = 'No BEGIN statement followed a TABLE'; {do not localize}
  UUErrorDataEndWithoutEND = ' Data ended without an END statment'; {do not localize}

Type
  TIdCardinalBytes = record
    case integer of
    0: (
      Byte1: Byte;
      Byte2: Byte;
      Byte3: Byte;
      Byte4: Byte; );
    1: ( Whole: Cardinal );
  end;

  // Abstract ASCII base Coder
  TIdASCIICoder = class(TIdCoder)
  protected
    FCodingTable: String;
    FCodeTableLength : Integer;
    //
    function GetTableIndex(const AChar: Char): Integer;
    procedure SetCodingTable(NewTable : String); virtual;
  public
    property CodingTable: string read FCodingTable write SetCodingTable;
    constructor Create(AOwner : TComponent); override;
  end;

  TId3To4Coder = class(TIdASCIICoder)
  protected
    // Mechanisms for MIME, UU and XX codings
    procedure Code3To4(In1, In2, In3 : Byte; var Out1, Out2, Out3, Out4 : Byte);
    procedure Code4To3(const AIn1, AIn2, AIn3, AIn4: Byte; var AOut1, AOut2, AOut3: Byte);

    function CodeLine3To4 : String;
    function CompleteLine3To4 : String;

    function CodeLine4To3 : String;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

  { Base 64.
    Typically used in E-mail Internet Message Format (IMF).
    Denoted typically by blank line before and after data.
    Basic 3-4 encoder and 4-3 decoder with no fills.  Coding Table designed
      so that the characters have the same byte value in ASCII, EBCDIC and some
      ISO charsets.
    MIME Headers:
      Content-Type: application/octet-stream; name="filename.ext"
      Content-Transfer-Encoding: base64
    Filename contained in Content-Type header.
    Typical file extensions: B64, MIM, MIME
  }
  PIdBase64Encoder = ^TIdBase64Encoder;
  TIdBase64Encoder = class(TId3To4Coder)
  protected
    procedure Coder; override;
    procedure CompleteCoding; override;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

  PIdBase64Decoder = ^TIdBase64Decoder;
  TIdBase64Decoder = class(TId3To4Coder)
  protected
    procedure Coder; override;
    procedure CompleteCoding; override;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

  { UU Code.
    Typically used in USENET IMF.
    Denoted by BEGIN and END pairings with first char of coding table being
      used on the line prior to END line.
    Basic 3-4 encoder and 4-3 decoder with additional char per line denoting
      number of coded characters in the line.
    Frills known:
      Optional TABLE before encoded data (implemented).
      Checksums.
      Problem with spaces at end of line of coded data.  Some MTAs munge the
        data (effectively perform a TrimRight).
      Sometimes lines are appended with a non-coding table character to
        combat the munging of some MTAs.
      Large files are typically sent over several messages.  Comments and / or
        subjects are sometimes used to note which (normally decimal) "part"
        the message holds.
    Filename contained within coded data header.
    Typical file extensions: UU, UUE
  }
  PIdUUEncoder = ^TIdUUEncoder;
  TIdUUEncoder = class(TId3To4Coder)
  protected
    FTableNeeded : Boolean;
    FIsFirstRound : Boolean;

    FPrivilege : Integer;

    procedure Coder; override;
    procedure CompleteCoding; override;

    procedure OutputHeader; virtual;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure SetCodingTable(NewTable : String); override;
    procedure SetPrivilege(Priv : Integer);

    property Privilege : Integer read FPrivilege write SetPrivilege;
    property TableNeeded : Boolean read FTableNeeded write FTableNeeded;
  end;

  PIdUUDecoder = ^TIdUUDecoder;
  TIdUUDecoder = class(TId3To4Coder)
  protected
    FError, FCompleted : Boolean;
    FErrList : TStringList;
    FState : Integer;
    FRealBufferSize : Integer;
    FIsFirstRound : Boolean;

    FPrivilege : Integer;

    procedure Coder; override;
    procedure CompleteCoding; override;
    procedure CheckForHeader(DataSize : Integer); virtual;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure SetCodingTable(NewTable : String); override;
    procedure SetPrivilege(Priv : Integer);

    property Privilege : Integer read FPrivilege write SetPrivilege;
  end;

  { XX Code.
    Rarely used.  Normally found in USENET IMF.
    Different table from UU Code.  The table was designed to be less munged
      by some MTAs because of the lack of space character.
    Typical file extensions: XX, XXE
  }
  PIdXXEncoder = ^TIdXXEncoder;
  TIdXXEncoder = class(TIdUUEncoder)
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

  PIdXXDecoder = ^TIdXXDecoder;
  TIdXXDecoder = class(TIdUUDecoder)
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;
  EIdTableNotFound = class(EIdException);

Function Base64Encode ( const s : String ) : String;

implementation

Uses
  IdGlobal, IdMIMETypes, IdResourceStrings,
  SysUtils;

function FetchEOL(var s : String) : String;
var
   iCR, iLF : Integer;
begin
     iCR := IndyPos(CR, s);
     iLF := IndyPos(LF, s);
     if (iCR = 0) then begin
        if iLF = 0 then begin
           result := s;
           s := '';
        end else begin
            result := Fetch(s, LF);
        end;
     end else if (iCR = iLF - 1) then begin
         result := Fetch(s, CR + LF);
     end else if (iCR < iLF) or (iLF = 0) then begin
         // CR on it's own
         result := Fetch(s, CR);
     end else begin
         // iLF < iCR
         result := Fetch(s, LF);
     end;
end;

////////////////
// TIdASCIICoder
////////////////

constructor TIdASCIICoder.Create;
begin
     inherited Create(AOwner);
     if FCodeTableLength > 0 then begin
        SetLength(FCodingTable, FCodeTableLength);
        UniqueString(FCodingTable);
     end;
     fTakesFileName := True;
end;

function TIdASCIICoder.GetTableIndex(const AChar: Char): Integer;
begin
  Result := IndyPos(AChar, FCodingTable) - 1;
  if Result = -1 then begin
    raise EIdTableNotFound.Create(RSCoderNoTableEntryNotFound);
  end;
end;

procedure TIdASCIICoder.SetCodingTable;
begin
  // Coding table has no relevant size in this base class
  FCodingTable := NewTable;
end;

//////////////////////
// Define TId3To4Coder
//////////////////////

constructor TId3To4Coder.Create;
begin
     FCodeTableLength := CTL3To4;
     inherited Create(AOwner);
end;

destructor TId3To4Coder.Destroy;
begin
     inherited;
end;

procedure TId3To4Coder.Code3To4;
begin
     Out1 := Ord(FCodingTable[((In1 SHR 2) and 63) + 1]);
     Out2 := Ord(FCodingTable[(((In1 SHL 4) or
         (In2 SHR 4)) and 63) + 1]);
     Out3 := Ord(FCodingTable[(((In2 SHL 2) or
         (In3 SHR 6)) and 63) + 1]);
     Out4 := Ord(FCodingTable[(Ord(In3) and 63) + 1]);
end;

procedure TId3To4Coder.Code4To3(const AIn1, AIn2, AIn3, AIn4: Byte; var AOut1, AOut2, AOut3: Byte);
var
  LCardinal: TIdCardinalBytes;
begin
//TODO: Make a efficient class just for 3/4 4/3 conversion. No need for stack allocations on calls,
// etc.
//TODO: Make in inverse look up table. I changed it to use POS instead of a for loop, but its still
// inefficient but much better than before.
//TODO: Pass in a cardinal at a time tino TIdCardinalBytes from a stream to make it faster
//TODO: Change 3 to 4 to work more efficiently like this
  LCardinal.Whole := (GetTableIndex(Chr(AIn1)) shl 18) or (GetTableIndex(Chr(AIn2)) shl 12)
   or (GetTableIndex(Chr(AIn3)) shl 6) or GetTableIndex(Chr(AIn4));
  AOut1 := LCardinal.Byte3;
  AOut2 := LCardinal.Byte2;
  AOut3 := LCardinal.Byte1;
end;

function TId3To4Coder.CodeLine3To4;
var
   i, j : LongWord;
begin
     // Code one line of FCBufferSize input to relevant output line.
     i := FCBufferSize * 4;
     j := i div 3 * 3;
     if i <> j then begin
        Inc(j, 4);
     end;
     j := j div 3;
     SetLength(result, j);
     UniqueString(result);

     i := 1; // Index into FCBuffer
     j := 1; // Index into s
     while i <= FCBufferedData do begin
       Code3To4(Ord(FCBuffer[i]), Ord(FCBuffer[i + 1]), Ord(FCBuffer[i + 2]),
         Byte(result[j]), Byte(result[j + 1]), Byte(result[j + 2]),
         Byte(result[j + 3]));
       Inc(i, 3);
       Inc(j, 4);
     end;

     FCBufferedData := 0;
end;

function TId3To4Coder.CompleteLine3To4;
var
   i, j, k : LongWord;
begin
     // Code FCBufferedData size of input to relevant output

     // i bytes input produce (i * 4 / 3) bytes output
     k := FCBufferedData div 3; // number of bytes to output
     j := k * 4; // round off into j
     k := k * 3;

     // Is the rounded value the same as the necessary?
     if FCBufferedData <> k then begin
        // No, so increase it to a multiple of 4
        Inc(j, 4);
     end;
     SetLength(result, j);
     UniqueString(result);

     i := 1; // Index into FCBuffer
     j := 1; // Index into s
     while i <= k do begin
       Code3To4(Ord(FCBuffer[i]), Ord(FCBuffer[i + 1]), Ord(FCBuffer[i + 2]),
         Byte(result[j]), Byte(result[j + 1]), Byte(result[j + 2]),
         Byte(result[j + 3]));
       Inc(i, 3);
       Inc(j, 4);
     end;

     // need to process last (FCBufferedData - k) bytes
     k := FCBufferedData - k;
     if k > 0 then begin
        case k of
         1: begin
            Code3To4(Ord(FCBuffer[i]), 0, 0,
              Byte(result[j]), Byte(result[j + 1]), Byte(result[j + 2]),
              Byte(result[j + 3]));
         end;
         2 : begin
            Code3To4(Ord(FCBuffer[i]), Ord(FCBuffer[i + 1]), 0,
              Byte(result[j]), Byte(result[j + 1]), Byte(result[j + 2]),
              Byte(result[j + 3]));
         end;
         3 : begin
            Code3To4(Ord(FCBuffer[i]), Ord(FCBuffer[i + 1]), Ord(FCBuffer[i + 2]),
              Byte(result[j]), Byte(result[j + 1]), Byte(result[j + 2]),
              Byte(result[j + 3]));
         end;
        end;
     end;
     FCBufferedData := 0;
end;

function TId3To4Coder.CodeLine4To3;
var
  i : LongWord;
  s : String;
  y1, y2, y3 : Byte;
begin
  i := 1;
  s := '';
  while i < FCBufferedData do begin
    Code4To3(Ord(FCBuffer[i]), Ord(FCBuffer[i + 1]), Ord(FCBuffer[i + 2]), Ord(FCBuffer[i + 3]), y1
     , y2, y3);
    s := s + Chr(y1) + Chr(y2) + Chr(y3);
    Inc(i, 4);
  end;
  result := s;
end;

/////////////////
// TIdMIMEEncoder
/////////////////

constructor TIdBase64Encoder.Create;
begin
  // Need data in 4-byte sizes + allowance for CR LF.
  inherited Create(AOwner);
  //InternSetBufferSize(48);
  FCodingTable := Base64CodeTable;
end;

destructor TIdBase64Encoder.Destroy;
begin
     inherited;
end;

procedure TIdBase64Encoder.Coder;
var
   s : String;
begin
     IncByteCount(FCBufferedData);
     s := CodeLine3To4;
     OutputString(s);
end;

procedure TIdBase64Encoder.CompleteCoding;
var
   s : String;
   i : LongWord;
begin
     // Not using inherited so set fInCompletion in case this is abstracted
     // later
     fInCompletion := True;

     if FCBufferedData = 0 then Exit; // Nothing to do
     IncByteCount(FCBufferedData);

     // preserve extra characters of the 3To4
     i := FCBufferedData div 3 * 3;
     i := FCBufferedData - i;

     s := CompleteLine3To4;

     // 'empty' encoded bytes are dictated as '='
     case i of
       1 : begin
         s[Length(s) - 1] := '=';
         s[Length(s)] := '=';
       end;
       2 : begin
         s[Length(s)] := '=';
       end;

     end;

     OutputString(s);
end;

Function Base64Encode ( const s : String ) : String;
var Coder : TIdBase64Encoder;
    {I do this as a workaround for a bug}
    Res : String;
begin
  Result := '';
  Coder := TIdBase64Encoder.Create ( nil );
  try
    Coder.AddCRLF := False;
    Coder.UseEvent := False;
    Coder.Reset;
    Coder.CodeString ( s );
    Res := Coder.CompletedInput;
    Result := Copy ( Res, 3, Length ( Res ) );
  finally
    FreeAndNil ( Coder );
  end;
end;

/////////////////
// TIdMIMEDecoder
/////////////////

constructor TIdBase64Decoder.Create;
begin
{  if BufferSize < 0 then begin
    // 76 is the default line length as per RFC 1421 (78 with mandatory CRLF).
    inherited Create(AOwner, 78);
  end else begin
      // Need data in 4-byte sizes + allowance for CR LF.
}
       inherited Create(AOwner);
      //, (BufferSize div 4) * 4 + 4);
//  end;

  FCodingTable := Base64CodeTable;
end;

destructor TIdBase64Decoder.Destroy;
begin
     inherited;
end;

procedure TIdBase64Decoder.Coder;
var
   s, s1, sOut : String;
   bCount : LongWord;
   exWhile : Boolean;
begin
    if FCBufferedData = 0 then Exit; // Nothing to do

    exWhile := False;

    bCount := FCBufferedData;
    s1 := Copy(FCBuffer, 1, FCBufferedData);
    sOut := '';
    while not exWhile do begin
      s := FetchEOL(s1);
      if Length(s) = 0 then begin
        s := FetchEOL(s1);
      end;
      FCBufferedData := length(s);
      System.Move(s[1], FCBuffer[1], FCBufferedData);
      sOut := sOut + CodeLine4To3;
      if IndyPos(CR, s1) = 0 then begin
        exWhile := True;
      end;
    end;
    FCBufferedData := length(s1);
    IncByteCount(bCount - FCBufferedData);
    if FCBufferedData > 0 then begin
        System.Move(s1[1], FCBuffer[1], FCBufferedData);
    end;
    OutputString(sOut);
end;

procedure TIdBase64Decoder.CompleteCoding;
var
  s, s1, sOut : String;
  k : Integer;
  in1, in2, in3, in4 : Byte;
  y1, y2, y3 : Byte;
begin
  // Not using inherited so set fInCompletion in case this is abstracted
  // later
  fInCompletion := True;

  if FCBufferedData = 0 then Exit; // Nothing to do

  IncByteCount(FCBufferedData);

  s1 := Copy(FCBuffer, 1, FCBufferedData);
  while IndyPos(CR, s1) > 0 do begin
    sOut := FetchEOL(s1);
    s1 := sOut + s1;
  end;
  while IndyPos(LF, s1) > 0 do begin
    sOut := FetchEOL(s1);
    s1 := sOut + s1;
  end;
  FCBufferedData := Length(s1);

  sOut := '';
  while length(s1) > 4 do begin
    s := Copy(s1, 1, 4);
    s1 := Copy(s1, 5, length(s1));

    Code4To3(Byte(s[1]), Byte(s[2]), Byte(s[3]), Byte(s[4]), y1, y2, y3);
    sOut := sOut + Chr(y1) + Chr(y2) + Chr(y3);
  end;

  while (Length(s1)> 0) and (s1[length(s1)] = '=') do begin
    s1 := Copy(s1, 1, length(s1) - 1);
  end;

  k := Length(s1);

  if k > 0 then begin
    in3 := Byte(FCodingTable[1]);
    in4 := Byte(FCodingTable[1]);
    in1 := Byte(s1[1]);
    in2 := Byte(s1[2]);


    case k of
      1 : begin
        Code4To3(in1, in2, in3, in4, y1, y2, y3);
        sOut := sOut + Chr(y1);
      end;
      2 : begin
        in2 := Byte(s1[2]);
        Code4To3(in1, in2, in3, in4, y1, y2, y3);

        In2 := GetTableIndex(Chr(In2));
        if In2 and 15 = 0 then begin
          sOut := sOut + Chr(y1);
        end else begin
          sOut := sOut + Chr(y1) + Chr(y2);
        end;
      end;
      3 : begin
        in2 := Byte(s1[2]);
        In3 := Byte(s1[3]);
        Code4To3(in1, in2, in3, in4, y1, y2, y3);

        In3 := GetTableIndex(Chr(In3));

        if In3 <= FCodeTableLength shr 2 then begin
          sOut := sOut + Chr(y1) + Chr(y2);
        end else begin
          sOut := sOut + Chr(y1) + Chr(y2) + Chr(In3 shl 6);
        end;
      end;
      4 : begin
        in2 := Byte(s1[2]);
        In3 := Byte(s1[3]);
        In4 := Byte(s1[4]);
        Code4To3(In1, In2, In3, In4, y1, y2, y3);
        sOut := sOut + Chr(y1) + Chr(y2) + Chr(y3);
      end;
    end;
  end;

  OutputString(sOut);
  FCBufferedData := 0;
end;

///////////////
// TIdUUEncoder
///////////////

constructor TIdUUEncoder.Create;
begin
  inherited Create(AOwner);
  FCodingTable := UUCodeTable;
  FPrivilege := 644;
  FIsFirstRound := True;
  FTableNeeded := False;
  FAddCRLF := True;
  InternSetBufferSize(61);
end;

destructor TIdUUEncoder.Destroy;
begin
     inherited;
end;

procedure TIdUUEncoder.OutputHeader;
var
   s : String;
begin
     // If the Table is required to be output do that here
     If TableNeeded then begin
        // Output the word TABLE
        OutputString(UUTable);
        // Output first half of table
        s := Copy(FCodingTable, 1, FCodeTableLength div 2);
        OutputString(s);
        // Output second half of table
        s := Copy(FCodingTable, FCodeTableLength div 2 + 1,
          FCodeTableLength shl 2);
        OutputString(s);
     end;

     // Output the Begin priv fName:
     s := UUBegin + IntToStr(FPrivilege) + ' ' + FFileName;
     OutputString(s);

     FIsFirstRound := False;
end;

procedure TIdUUEncoder.SetCodingTable;
begin
     if Length(NewTable) >= FCodeTableLength then begin
        FCodingTable := Copy(NewTable, 1, FCodeTableLength);
     end else begin
         FCodingTable := NewTable + Copy(FCodingTable,
           FCodeTableLength + 1, FCodeTableLength - Length(NewTable));
     end;
end;

procedure TIdUUEncoder.SetPrivilege(Priv : Integer);
begin
     If (Priv >= minPriv) and (Priv <= maxPriv) then begin
        FPrivilege := Priv;
     end;
end;

procedure TIdUUEncoder.Coder;
var
   s : String;
begin
     // Check if header information is needed
     If FIsFirstRound then begin
        OutputHeader;
     end;
     IncByteCount(FCBufferedData);
     s := FCodingTable[FCBufferSize + 1] + CodeLine3To4;
     OutputString(s);
end;

procedure TIdUUEncoder.CompleteCoding;
var
   s, s1 : String;
begin
     // Not using inherited so set fInCompletion in case this is abstracted
     // later
     fInCompletion := True;

     // Check if header information is needed
     If FIsFirstRound then begin
        OutputHeader;
     end;

     if FCBufferedData = 0 then begin
        // Output the first character of the coding table
        OutputString(FCodingTable[1]);
        // Output END
        OutputString(UUEnd);
        Exit; // Nothing else to do
     end;

     IncByteCount(FCBufferedData);

     // The length byte + the encoded data
     s := FCodingTable[FCBufferedData+1] + CompleteLine3To4;

     // Output the coded line
     s1 := String(s + CR + LF);
     OutputString(s1);
     // Output the first character of the coding table
     s1 := String(FCodingTable[1] + CR + LF);
     OutputString(s1);
     // Output END
     s1 := String(UUEnd + CR + LF);
     OutputString(s1);
end;

///////////////
// TIdUUDecoder
///////////////

constructor TIdUUDecoder.Create;
begin
{     if BufferSize < 0 then begin
        // To create a typical 45-byte line output (61 bytes in + CR + LF = 63)
        inherited Create(AOwner, 63);
     end else begin
         // Need data in 4-byte sizes + allowance for CR LF.
}
         inherited Create(AOwner);
         {, (BufferSize div 4) * 4 + 4);
     end; }
     FCodingTable := UUCodeTable;
     FPrivilege := 644;
     FIsFirstRound := True;
     FErrList := TStringList.Create;
     FError := False;
     fInCompletion := False;
     FCompleted := false;
     FState := UUStarted;
     // Keep duplicate of original BufferSize
     FRealBufferSize := FCBufferSize;
     // Change the buffer size so that large amounts of data are available
     // to hunt for a 'TABLE' or 'BEGIN'.
     InternSetBufferSize(UUInitialLength);
end;

destructor TIdUUDecoder.Destroy;
begin
     inherited;
end;

procedure TIdUUDecoder.SetCodingTable;
begin
     if Length(NewTable) >= FCodeTableLength then begin
        FCodingTable := Copy(NewTable, 1, FCodeTableLength);
     end else begin
         FCodingTable := NewTable + Copy(FCodingTable,
           FCodeTableLength + 1, FCodeTableLength - Length(NewTable));
     end;
end;

procedure TIdUUDecoder.SetPrivilege(Priv : Integer);
begin
     If (Priv >= minPriv) and (Priv <= maxPriv) then begin
        FPrivilege := Priv;
     end;
end;

procedure TIdUUDecoder.CheckForHeader;
var
   i : LongWord;
   t, b : Integer;
   s, s1 : String;
   err : Boolean;
begin
     // Nothing to do with nothing...
     if DataSize = 0 then Exit;

     // Assume data is at the start of FCBuffer - take a copy of it
     s := Copy(FCBuffer, 1, DataSize);

     case FState of
       UUStarted : begin

         // not found anything so far... so check for 'TABLE'
         i := IndyPos(UUTable, UpperCase(s));
         if i > 0 then begin

            s := Copy(s, i + SizeOf(UUTable), length(s));
            // Hunt out the EOL
            s1 := FetchEOL(s);

            IncByteCount(i + SizeOf(UUTable) + LongWord(Length(s1)));

            // Set up for next round
            FState := UUTableBegun;
            OutputNotification(CN_UU_TABLE_FOUND, '');
            InternSetBufferSize((FCodeTableLength div 2 + 2));

            if Length(s) > 0 then begin
               // The left overs may be larger than required so re-enter them
               CodeString(s);
            end;
         end else begin
             // No 'TABLE' so check for 'BEGIN'
             i := IndyPos(UUBegin, UpperCase(s));
             if i > 0 then begin
                // Strip the BEGIN out & then any white space after it...
                s := Copy(s, i + SizeOf(UUBegin) + 1, Length(s));

                IncByteCount(i + SizeOf(UUTable) + 1);
                i := Length(s);

                s := TrimLeft(s);

                IncByteCount(i - LongWord(length(s)));

                FState := UUBEGINFound;
                OutputNotification(CN_UU_BEGIN_FOUND, '');
                
                // Input s back in as fresh data.
                InternSetBufferSize(3);  // Only want the size of the Privilege

                FCBufferedData := Length(s);
                if FCBufferedData > 0 then begin
                   System.Move(s[1], FCBuffer[1], FCBufferedData);
                end;
             end else begin
                 If fInCompletion then begin
                    // Reached the end of the data, and it ain't there.
                    IncByteCount(FCBufferedData);
                    FCBufferedData := 0;
                 end else begin
                     // Check for a T or a B (table or begin could be chopped)
                     i := Length(s);
                     s := Copy(s, 3, length(s));
                     t := IndyPos('T', UpperCase(s));
                     b := IndyPos('B', UpperCase(s));
                     if t < b then begin
                        if t = 0 then begin
                           // Check b
                           if b = 0 then begin
                              s := '';
                           end else begin
                               s := Copy(s, b, length(s));
                           end;
                        end else begin
                            s := Copy(s, t, length(s));
                        end;
                     end else begin
                         if b = 0 then begin
                            // Check t
                            if t = 0 then begin
                               FCBufferedData := 0;
                            end else begin
                               s := Copy(s, t, length(s));
                            end;
                         end else begin
                             s := Copy(s, b, length(s));
                         end;
                     end;
                     if s <> '' then begin
                        FCBufferedData := Length(s);
                        IncByteCount(i - FCBufferedData);
                        System.Move(s[1], FCBuffer[1], FCBufferedData);
                     end else begin
                         // No T or B found
                         IncByteCount(FCBufferedData);
                         FCBufferedData := 0;
                     end;
                 end;
             end;
         end;
       end;

       UUTableBegun : begin
         // Expecting first FCodeTableLength div 2 chars plus possible EOL
         SetCodingTable(Copy(s, 1, FCodeTableLength div 2));
         s := Copy(s, FCodeTableLength div 2 + 1, length(s));
         s1 := FetchEOL(s);
         IncByteCount(length(s1));
         FState := UUTableOneLine;
         FCBufferedData := 0;
         if Length(s) > 0 then begin
            CodeString(s);
         end;
       end;

       UUTableOneLine : begin
         // 'TABLE' and first line of table has been read.  Assume this line
         // contains second line of table
         SetCodingTable(Copy(FCodingTable, 1, FCodeTableLength div 2) +
           Copy(s, 1, FCodeTableLength div 2));
         FState := UUTableBeenRead;
         s := Copy(s, FCodeTableLength div 2 + 1, Length(s));
         s1 := FetchEOL(s);
         IncByteCount(length(s1));
         InternSetBufferSize(UUInitialLength);
         if Length(s) > 0 then begin
            CodeString(s);
         end;
       end;

       UUTableBeenRead : begin
         // BEGIN must follow, otherwise have read the wrong TABLE...
         // (data may begin with CR, LF or CR + LF)
         i := IndyPos(UUBEGIN, UpperCase(s));
         if i > 0 then begin
            i := i + 1 + SizeOf(UUBEGIN);
            s := Copy(s, i, length(s));
            IncByteCount(i);

            FState := UUBEGINFound;
            OutputNotification(CN_UU_BEGIN_FOUND, '');
            
            InternSetBufferSize(3);
            i := Length(s);
            s := TrimLeft(s);
            IncByteCount(i - LongWord(Length(s)));
            if Length(s) > 0 then begin
               CodeString(s);
            end;
         end else begin
             // BEGIN didn't follow TABLE - start over.  Unfortunately this
             // does not cope with the possibility that the TABLE was bogus and
             // that the BEGIN was contained in the bogus table-data.
             FState := UUStarted;
             OutputNotification(CN_UU_TABLE_BEGIN_ABORT, '');
             FError := True;
             FErrList.Add(UUErrorNoBEGINAfterTable);
         end;
       end;

       UUBEGINFound : begin
         // Expect three bytes of Privilege
         if length(s) = 3 then begin
            err := False;
            for i := 1 to 3 do begin
                If not IsNumeric(s[1]) then begin
                   err := True;
                end;
            end;

            if err then begin
               FError := True;
               FErrList.Add(UUErrorPivilageNotNumeric);
                OutputNotification(CN_UU_PRIVILEGE_ERROR, '');
            end else begin
                FPrivilege := StrToInt(s);
                OutputNotification(CN_UU_PRIVILEGE_FOUND, IntToStr(FPrivilege));
            end;

         end else if length(s) < 3 then begin
             // Can only assume that this has been called from CompleteCoding
             // and that the data is incomplete.
             FError := True;
             FErrList.Add(UUErrIncompletePrivilege);
             OutputNotification(CN_UU_PRIVILEGE_ERROR, '');

         end else begin
             // Something must have gone wrong
             FError := True;
             FErrList.Add(UUErrIncompletePrivilege2);
             OutputNotification(CN_UU_PRIVILEGE_ERROR, '');
         end;
         // Can only assume the next part will be a file name (+ possible path)
         FState := UUPrivilegeFound;
         IncByteCount(3);
         InternSetBufferSize($FF);
       end;

       UUPrivilegeFound : begin
         // Remove leading spaces & control chars... should have a file name
         i := Length(s);
         s := TrimLeft(s);
         IncByteCount(i - LongWord(length(s)));

         // Locate the EOL
         s1 := FetchEOL(s);
         FFileName := s1;
         OutputNotification(CN_UU_NEW_FILENAME, FFileName);

         // Data has started... reset to normal.
         FIsFirstRound := False;
         InternSetBufferSize(FRealBufferSize);

         FCBufferedData := 0;
         If Length(s) > 0 then begin
            CodeString(s);
         end;
       end;
     end;
end;

procedure TIdUUDecoder.Coder;
var
  s, s1 : String;
  outlen, inlen : Integer;
begin
  if FCompleted then Exit;

  If FIsFirstRound then begin
    // Looking for line beginning with TABLE or BEGIN
    CheckForHeader(FCBufferSize);
  end else begin
    s1 := Copy(FCBuffer, 1, FCBufferSize);

    // Ensure beginning of line
    s := FetchEOL(s1);
    if Length(s) = 0 then begin
      s := FetchEOL(s1);
    end;
    IncByteCount(length(s));

    if FState = UULastCharFound then begin

      // Just to check:
      If Copy(s, 1, Length(UUEnd)) = UUEnd then begin
        OutputNotification(CN_UU_END_FOUND, '');
      end else begin
        // No END found...
        { TODO: Do what?}
      end;

      // End of data for this UU file.
      Reset;

    end else if s[1] = FCodingTable[1] then begin
      FState := UULastCharFound;
      OutputNotification(CN_UU_LAST_CHAR_FOUND, '');

    end else begin
      // Get the length of output data and expected input length
      outlen := GetTableIndex(s[1]);
      if Outlen = 0 then begin
        FCompleted := True;
      end;
      inLen := outLen div 3 * 4;

      System.Move(s[2], FCBuffer[1], inLen);
      IncByteCount(FCBufferedData - LongWord(inLen));
      FCBufferedData := inLen;
      s := CodeLine4To3;

      OutputString(Copy(s, 1, outLen));

      FCBufferedData := Length(s1);
      if FCBufferedData > 0 then begin
        System.Move(s1[1], FCBuffer[1], FCBufferedData);
      end;
    end;
  end;
end;

procedure TIdUUDecoder.CompleteCoding;
var
   s, s1, s2 : String;
   i, j, step, outlen : Integer;
begin
     if FCompleted then Exit;
     IncByteCount(FCBufferedData);

     fInCompletion := True;
     If FIsFirstRound then begin
        // Looking to line beginning with TABLE or BEGIN
        CheckForHeader(FCBufferedData);
        If (FCBufferedData > 0) and FIsFirstRound then begin
           CompleteCoding;
        end;
     end;

     if not FIsFirstRound then begin
        if FCBufferedData = 0 then Exit; // Nothing to do

        s1 := Copy(FCBuffer, 1, FCBufferedData);
        while s1[1] <> FCodingTable[1] do begin
              // need a better way of determining this
              OutLen := GetTableIndex(s1[1]);
              SetLength(s2, OutLen + 4);

              // Length of s is set
              s := FetchEOL(s1);
              s := Copy(s, 2, length(s));
              j := 1;
              i := 1;
              while i <= length(s) do begin
                  Code4To3(Ord(s[i]), Ord(s[i + 1]), Ord(s[i + 2]),
                      Ord(s[i + 3]), Byte(s2[j]), Byte(s2[j + 1]),
                      Byte(s2[j + 2]));
                  Inc(j, 3);
                  Inc(i, 4);
              end;

              step := Length(s) - i;

              if step >= 1 then begin
                 case step of
                   1 : begin
                     Code4To3(Ord(s[i]), 0, 0, 0,
                        Byte(s2[j]), Byte(s2[j + 1]), Byte(s2[j + 2]));
                   end;
                   2 : begin
                     Code4To3(Ord(s[i]), Ord(s[i + 1]), 0, 0,
                        Byte(s2[j]), Byte(s2[j + 1]), Byte(s2[j + 2]));
                   end;
                   3 : begin
                     Code4To3(Ord(s[i]), Ord(s[i + 1]), Ord(s[i + 2]), 0,
                        Byte(s2[j]), Byte(s2[j + 1]), Byte(s2[j + 2]));
                   end;
                   4 : begin
                     Code4To3(Ord(s[i]), Ord(s[i + 1]), Ord(s[i + 2]),Ord(s[i + 3]),
                        Byte(s2[j]), Byte(s2[j + 1]), Byte(s2[j + 2]));
                   end;
                 end;

              end;
              if length(s1) = 0 then begin
                 FErrList.Add(UUErrorDataEndWithoutEND);
                 break;
              end;
              OutputString(Copy(s2, 1, outLen));
        end;
        FCBufferedData := 0;
     end;
end;

///////////////
// TIdXXEncoder
///////////////

// Just modify the constructor of TIdUUEncoder
constructor TIdXXEncoder.Create;
begin
     inherited Create(AOwner);
     FCodingTable := XXCodeTable;
end;

destructor TIdXXEncoder.Destroy;
begin
     inherited;
end;

///////////////
// TIdXXDecoder
///////////////

// Just modify the constructor of TIdUUDecoder
constructor TIdXXDecoder.Create;
begin
     inherited Create(AOwner);
     FCodingTable := XXCodeTable;
end;

destructor TIdXXDecoder.Destroy;
begin
     inherited;
end;

initialization
  RegisterCoderClass(TIdBase64Encoder, CT_CREATION, CP_STANDARD,
    '', MIMEEncBase64);
  RegisterCoderClass(TIdBase64Decoder, CT_REALISATION, CP_STANDARD,
    '', MIMEEncBase64);
  RegisterCoderClass(TIdUUEncoder, CT_CREATION, CP_STANDARD,
    '', MIMEEncUUEncode);
  RegisterCoderClass(TIdUUDecoder, CT_REALISATION, CP_STANDARD,
    '', MIMEEncUUEncode);
  RegisterCoderClass(TIdXXEncoder, CT_CREATION, CP_STANDARD,
    '', MIMEEncXXEncode);
  RegisterCoderClass(TIdXXDecoder, CT_REALISATION, CP_STANDARD,
    '', MIMEEncXXEncode);
end.
