unit TXParse;

// Font Table
// Color Table
// Tab Positions

interface

uses
  Classes, SysUtils, Graphics, Windows, Dialogs;

type
  TCharSet = set of Char;

  { RTF Tokens }
  TRTFTokens = (rtEOF, rtControl, rtUnknown, rtText);

  { TRTFParser }
  TRTFParser = class(TObject)
  private
    FStream: TStream;
    FGroup: Integer;
    FCurChar: Char;
    FToken: TRTFTokens;
    FTokenString: String;
    FTokenValue: Integer;
    FHasTokenValue: Boolean;
    FFonts: TStringList;
    FColors: TStringList;
    procedure NextChar;
    function PeekChar: Char;
    procedure SkipBlanks;
    function ExtractTo(cSet: TCharSet): String;
    function GetColor(I: Integer): TColor;
    function GetFont(I: Integer): String;
    procedure ReadColorTbl;
    procedure ReadFontTbl;
    function ReadControl: String;
    function ReadValue: Integer;
    function ReadText: String;
    procedure SkipGroup;
  public
    constructor Create(Stream: TStream);
    destructor Destroy; override;
    procedure CheckToken(rtToken: TRTFTokens);
    function NextToken: TRTFTokens;
    property Token: TRTFTokens read FToken;
    property TokenString: String read FTokenString;
    property TokenValue: Integer read FTokenValue;
    property HasTokenValue: Boolean read FHasTokenValue;
    property Font[I: Integer]: String read GetFont;
    property Color[I: Integer]: TColor read GetColor;
  end;

implementation

const
  cEOF = #0;   { Null character }
  cLF  = #10;  { Line feed }
  cCR  = #13;  { Carriage return }
//  cBlanks = [#1..#32];  { Non-printable characters }
  cBlanks = [#32];  { Non-printable characters }

constructor TRTFParser.Create(Stream: TStream);
begin
  FStream := Stream;
  FFonts  := TStringList.Create;
  FColors := TStringList.Create;
  FGroup  := 0;
  NextToken;
end;

destructor TRTFParser.Destroy;
begin
  FFonts.Free;
  FColors.Free;
  inherited;
end;

function TRTFParser.GetColor(I: Integer): TColor;
begin
  Result := RGB(StrToInt(Copy(FColors[I], 1, 3)), StrToInt(Copy(FColors[I], 4, 3)), StrToInt(Copy(FColors[I], 7, 3)));
end;

function TRTFParser.GetFont(I: Integer): String;
begin
  Result := FFonts[I];
end;

procedure TRTFParser.CheckToken(rtToken: TRTFTokens);
begin
  if FToken <> rtToken then begin
//     Error(sInvalidToken);
  end;
end;

function TRTFParser.ExtractTo(cSet: TCharSet): String;
begin
  Result := '';
  while not (PeekChar in cSet) do begin
    NextChar;
    if not (FCurChar in [cCR, cLF]) then begin
       Result := Result + FCurChar;
    end;
  end;
end;

function TRTFParser.NextToken: TRTFTokens;
var
  SkipGrp: Boolean;
begin

  FToken := rtUnknown;
  FTokenString := '';
  FTokenValue  := 0;
  NextChar;

  while FToken = rtUnknown do begin
    case FCurChar of
     cEOF: FToken := rtEOF;
      cCR: NextChar;
      cLF: NextChar;
      '{': begin
             Inc(FGroup);
             NextChar;
           end;
      '}': begin
             Dec(FGroup);
             NextChar;
           end;
      '\': begin
             if PeekChar = '\' then begin
                FToken := rtText;
                FTokenString := '\';
                NextChar;
                FTokenString := FTokenString + ReadText();
             end else if PeekChar = '''' then begin
                FToken := rtText;
                NextChar;
                NextChar;
                FTokenString := FCurChar;
                NextChar;
                FTokenString := FTokenString + FCurChar;
                FTokenString := CHR(StrToInt('$' + FTokenString));
             end else begin
                FToken := rtControl;
                FTokenString := ReadControl();
                SkipGrp := (PeekChar = '{');
                FTokenValue  := ReadValue();
                if PeekChar in cBlanks then begin
                   NextChar;
                end;
                if FTokenString = 'fonttbl' then begin
                   ReadFontTbl;
                end else if FTokenString = 'colortbl' then begin
                   ReadColorTbl;
                end else if FTokenString = 'bin' then begin
                   FStream.Seek(FTokenValue, soFromCurrent);
                end else if FTokenString = '*' then begin
                   SkipGroup;
                   FToken := rtUnknown;
                end else if SkipGrp then begin
                   SkipGroup;
                end;
             end;
           end;
      else begin
             FToken := rtText;
             FTokenString := FCurChar;
             FTokenString := FTokenString + ReadText();
           end;
    end;
  end;

  Result := FToken;

end;

procedure TRTFParser.ReadFontTbl;
var
  FontGrp: Integer;
  FontName: String;
begin
  FontGrp  := FGroup;
  FontName := '';

  NextChar;

  while (FGroup >= FontGrp) and (FToken <> rtEOF) do begin
    case FCurChar of
     cEOF: FToken := rtEOF;
      cCR: NextChar;
      cLF: NextChar;
      ';': NextChar;
      '{': begin
             Inc(FGroup);
             NextChar;
           end;
      '}': begin
             Dec(FGroup);
             NextChar;
           end;
      '\': begin
             FTokenString := ReadControl();
             FTokenValue  := ReadValue();
             SkipBlanks;
             NextChar;
             if FTokenString = '*' then begin
                SkipGroup;
             end;
           end;
      else begin
             FontName := FCurChar;
             FontName := FontName + ExtractTo([cEOF, '\', ';', '}', '{']);
             FFonts.Add(FontName);
             NextChar;
           end;
    end;
  end;
  FTokenString := 'fonttbl';
end;

procedure TRTFParser.ReadColorTbl;
var
  R, G, B, Grp: Integer;
begin
  Grp := FGroup;

  R := 0;
  G := 0;
  B := 0;

  SkipBlanks;
  NextChar;

  while (FGroup >= Grp) and (FToken <> rtEOF) do begin
    case FCurChar of
     cEOF: FToken := rtEOF;
      cCR: NextChar;
      cLF: NextChar;
      ';': begin
             FColors.Add(FormatFloat('000', R) + FormatFloat('000', G) + FormatFloat('000', B));
             NextChar;
             R := 0;
             G := 0;
             B := 0;
           end;
      '{': begin
             Inc(FGroup);
             NextChar;
           end;
      '}': begin
             Dec(FGroup);
             NextChar;
           end;
      '\': begin
             FTokenString := ReadControl();
             FTokenValue  := ReadValue();
             SkipBlanks;
             NextChar;
             if FTokenString = 'red' then begin
                R := FTokenValue;
             end;
             if FTokenString = 'green' then begin
                G := FTokenValue;
             end;
             if FTokenString = 'blue' then begin
                B := FTokenValue;
             end;
           end;
    end;
  end;
  FTokenString := 'colortbl';
end;

function TRTFParser.ReadControl: String;
begin
  Result := ExtractTo([cEOF, '\', ' ', ';', '{', '}', cCR, cLF, '-', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']);
end;

function TRTFParser.ReadValue: Integer;
var
  S: String;
begin
  S := ExtractTo([cEOF, '\', ' ', ';', '{', '}', cCR, cLF]);
  FHasTokenValue := (Length(S) > 0);
  Result := StrToIntDef(S, 0);
end;

function TRTFParser.ReadText: String;
begin
  Result := ExtractTo([cEOF, '\']);
end;

procedure TRTFParser.NextChar;
begin
  if FStream.Read(FCurChar, 1) < 1 then begin
     FCurChar := cEOF;
  end;
end;

function TRTFParser.PeekChar: Char;
begin
  if FStream.Read(Result, 1) < 1 then begin
     Result := cEOF;
  end else begin
     FStream.Seek(-1, soFromCurrent);
  end;
end;

procedure TRTFParser.SkipBlanks;
begin
  while (PeekChar in cBlanks) do begin
    NextChar;
  end;
end;

procedure TRTFParser.SkipGroup;
var
  Grp: Integer;
begin
  Grp := FGroup;
  while FGroup >= Grp do begin
    case FCurChar of
      '{': Inc(FGroup);
      '}': Dec(FGroup);
    end;
    NextChar;
  end;
end;

end.
