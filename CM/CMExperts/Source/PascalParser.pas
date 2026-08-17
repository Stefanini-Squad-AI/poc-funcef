unit PascalParser;

interface

uses SysUtils, Classes;

const
  ieBadRemark = 1;
  StIdSymbols      = ['_', '0'..'9', 'A'..'Z', 'a'..'z'];
  StIdFirstSymbols = ['_', 'A'..'Z', 'a'..'z'];
  StConstSymbols   = ['0'..'9', 'A'..'F', 'a'..'f'];
  StConstSymbols10 = ['0'..'9'];
  StSeparators     = ['(', ')', ',', '.', ';'];

type
  TUnitSection = (usUnit, usInterface, usImplementation, usInitialization, usFinalization, usUnknown);
  TUnitSubSection = (ssUses, {ssConst, ssVar,} ssType, ssUnknown);

  TPascalParser = class
  private
    FSection: TUnitSection;
    FSubSection: TUnitSubSection;
    procedure SetSection(const Value: TUnitSection);
    procedure SetSubSection(const Value: TUnitSubSection);
  protected
    FpcProgram: PChar;
    FpcPos: PChar;
    FHistory: TStringList;
    FHistorySize: Integer;
    FHistoryPtr: Integer;
    FReturnComments: Boolean;

    function HistoryInd(index: Integer): Integer;
    function GetHistory(index: Integer): string;
    function GetPosBeg(index: Integer): Integer;
    function GetPosEnd(index: Integer): Integer;
    procedure SetHistorySize(Size: Integer);
    function GetPos: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function Token: string;
    // function TokenL : string;
    procedure RollBack(index: Integer);
    property History[index: Integer]: string read GetHistory;
    property PosBeg[index: Integer]: Integer read GetPosBeg;
    property PosEnd[index: Integer]: Integer read GetPosEnd;
    property HistorySize: Integer read FHistorySize write SetHistorySize;
    property Pos: Integer read GetPos;
    property pcPos: PChar read FpcPos write FpcPos;
    property pcProgram: PChar read FpcProgram write FpcProgram;
    property ReturnComments: Boolean read FReturnComments write FReturnComments;
    property Section: TUnitSection read FSection write SetSection stored false;
    property SubSection: TUnitSubSection read FSubSection write SetSubSection stored false;
  end;

  EIParserError = class(Exception)
  public
    ErrCode: Integer;
    Pos: Integer;
    constructor Create(AErrCode: Integer; APos: Integer);
  end;

  function IsStringConstant(const ST: string): Boolean;
  function IsIntConstant(const ST: string): Boolean;
  function IsRealConstant(const ST: string): Boolean;
  function IsIdentifer(const ID: string): Boolean;
  function GetStringValue(const ST: string): string;
  procedure ParseString(const S: string; SS: TStrings);

implementation

//uses RACnst, RAUtils;

constructor EIParserError.Create(AErrCode: Integer; APos: Integer);
begin
  ErrCode := AErrCode;
  Pos := APos;
end;

procedure IParserError(AErrCode: Integer; APos: Integer);
begin
  raise EIParserError.Create(AErrCode, APos);
end;

{*************************** TPascalParser ****************************}

constructor TPascalParser.Create;
begin
  inherited Create;
  FHistory := TStringList.Create;
  HistorySize := 10;
  FSection := usUnknown;
  FSubSection := ssUnknown;
end;

destructor TPascalParser.Destroy;
begin
  FHistory.Free;
  inherited Destroy;
end;

function TPascalParser.Token: string;
var
  P, F: PChar;
const
  StSkip = [' ', #10, #13];
  
  procedure SkipComments;
  begin
    case P[0] of
      '{':
      begin
        F := StrScan(P + 1, '}');
        if F = nil then IParserError(ieBadRemark, P - FpcProgram);
        P := F + 1;
      end;
      '}': IParserError(ieBadRemark, P - FpcProgram);
      '(':
        if (P[1] = '*') then
        begin
          F := P + 2;
          while True do
          begin
            F := StrScan(F, '*');
            if F = nil then IParserError(ieBadRemark, P - FpcProgram);
            if F[1] = ')' then
            begin
              inc(F);
              break;
            end;
            inc(F);
          end;
          P := F + 1;
        end;
      '*':
      begin
        if (P[1] = ')') then
          IParserError(ieBadRemark, P - FpcProgram)
      end;
      '/':
        if (P[1] = '/') then
        begin
          F := StrScan(P + 1, #13);
          if F = nil then F := StrEnd(P + 1);
          P := F;
        end;
    end;
  end;
  
  procedure Return;
  begin
    FpcPos := P;
    FHistory[FHistoryPtr] := Result;
    FHistory.Objects[FHistoryPtr] := TObject(Pos - 1);
    inc(FHistoryPtr);
    if FHistoryPtr > FHistorySize - 1 then FHistoryPtr := 0;
  end; { Return }

var
  F1: PChar;  
  I : Integer;
begin
  F := FpcPos;
  P := FpcPos;
  { Firstly skip spaces and remarks }
  repeat
    while (P[0] in StSkip) do
      inc(P);
    F1 := P;
    try
      SkipComments;
    except
      on E: EIParserError do
          if (E.ErrCode = ieBadRemark) and ReturnComments then
            P := StrEnd(F1)
          else
            raise;
    end;
    if ReturnComments and (P > F1) then
    begin
      SetString(Result, F1, P - F1);
      Return;
      Exit;
    end;
    while (P[0] in StSkip) do
      inc(P);
  until F1 = P;

  F := P;
  if (P[0] in StIdFirstSymbols) then
    { token }
  begin
    while (P[0] in StIdSymbols) do
      inc(P);
    SetString(Result, F, P - F);
  end
  else if (P[0] in StConstSymbols10) then
    { number }
  begin
    while (P[0] in StConstSymbols10) or (P[0] = '.') do
      inc(P);
    SetString(Result, F, P - F);
  end
  else
    if (P[0] = '$') and
      (P[1] in StConstSymbols) then
      { pascal hex number }
    begin
      inc(P);
      while (P[0] in StConstSymbols) do
        inc(P);
      SetString(Result, F, P - F);
    end
    else
      if P[0] = '''' then
      { pascal string constant }
    begin
      inc(P);
      while P[0] <> #0 do
      begin
        if P[0] = '''' then
          if P[1] = '''' then
            inc(P)
          else
            break;
        inc(P);
      end;
      if P[0] <> #0 then inc(P);
      SetString(Result, F, P - F);
      I := 2;
      while I < Length(Result) - 1 do
      begin
        if Result[I] = '''' then
          Delete(Result, I, 1);
        inc(I);
      end;
    end
    else if P[0] = #0 then
      Result := ''
    else
    begin
      Result := P[0];
      inc(P);
    end;
  Return;
  if AnsiCompareText(Result, 'uses') = 0 then
    FSubSection := ssUses
  else
    if AnsiCompareText(Result, 'type') = 0 then
      FSubSection := ssType
    else
      if ((Result = ';') and (FSubSection = ssUses)) or (AnsiCompareText(Result, 'end') = 0) then
        FSubSection := ssUnknown;
  if AnsiCompareText(Result, 'unit') = 0 then
    FSection := usUnit
  else
    if AnsiCompareText(Result, 'interface') = 0 then
      FSection := usInterface
    else
      if AnsiCompareText(Result, 'implementation') = 0 then
        FSection := usImplementation
      else
        if AnsiCompareText(Result, 'initialization') = 0 then
          FSection := usInitialization
        else
          if AnsiCompareText(Result, 'finalization') = 0 then
            FSection := usFinalization;
end;

function TPascalParser.HistoryInd(index: Integer): Integer;
begin
  Result := FHistoryPtr - 1 - index;
  if Result < 0 then Result := Result + FHistorySize;
end;

function TPascalParser.GetHistory(index: Integer): string;
begin
  Result := FHistory[HistoryInd(index)];
end;

function TPascalParser.GetPosEnd(index: Integer): Integer;
begin
  Result := Integer(FHistory.Objects[HistoryInd(index)]) + 1;
end;

function TPascalParser.GetPosBeg(index: Integer): Integer;
var
  I: Integer;
  S: string;
begin
  I := HistoryInd(index);
  S := FHistory[I];
  Result := Integer(FHistory.Objects[I]) - Length(S) + 1;
  if S[1] = '''' then
    for I := 2 to Length(S) - 1 do
      if S[I] = '''' then
        dec(Result);
end;

procedure TPascalParser.SetHistorySize(Size: Integer);
  {$IFDEF DEBUG}
var
  I: Integer;
  {$ENDIF}
begin
  while Size > FHistorySize do
  begin
    FHistory.Add('');
    inc(FHistorySize);
  end;
  while Size < FHistorySize do
  begin
    FHistory.Delete(0);
    dec(FHistorySize);
  end;
  {$IFDEF DEBUG}
  for I := 0 to FHistorySize - 1 do
    FHistory[I] := '';
  {$ENDIF}
  FHistoryPtr := 0;
end;

function TPascalParser.GetPos: Integer;
begin
  Result := pcPos - FpcProgram;
end;

procedure TPascalParser.RollBack(index: Integer);
begin
  FpcPos := PosEnd[index] + FpcProgram;
  dec(FHistoryPtr, index);
  if FHistoryPtr < 0 then
    FHistoryPtr := FHistorySize + FHistoryPtr;
end;

{########################### TPascalParser ###########################}

procedure ParseString(const S: string; SS: TStrings);
var
  Parser: TPascalParser;
  Token : string;
begin
  SS.Clear;
  Parser := TPascalParser.Create;
  try
    Parser.pcProgram := PChar(S);
    Parser.pcPos := Parser.pcProgram;
    Token := Parser.Token;
    while Token <> '' do
    begin
      SS.Add(Token);
      Token := Parser.Token;
    end;
  finally
    Parser.Free;
  end;
end;


function IsStringConstant(const ST: string): Boolean;
var
  LS: Integer;
begin
  LS := Length(ST);
  if (LS >= 2) and (((ST[1] = '''') and (ST[LS] = '''')) or
    ((ST[1] = '"') and (ST[LS] = '"'))) then
    Result := True
  else
    Result := False
end;

function IsRealConstant(const ST: string): Boolean;
var
  I, J : Integer;
  Point: Boolean;
begin
  Result := False;
  if (ST = '.') or (ST = '') then Exit;
  if ST[1] = '-' then
    if Length(ST) = 1 then
      Exit
    else
      J := 2
  else
    J := 1;
  Point := False;
  for I := J to Length(ST) do
    if ST[I] = '.' then
      if Point then
        Exit
      else
        Point := True
    else if (ST[I] < '0') or (ST[I] > '9') then
      Exit;
  Result := True;
end;

function IsIntConstant(const ST: string): Boolean;
var
  I, J: Integer;
  Sym : set of char;
begin
  Result := False;
  if (Length(ST) = 0) or ((Length(ST) = 1) and (ST[1] = '$')) then Exit;
  Sym := StConstSymbols10;
  if (ST[1] = '-') or (ST[1] = '$') then
  begin
    if Length(ST) = 1 then
      Exit
    else
      J := 2;
    if ST[1] = '$' then Sym := StConstSymbols;
  end
  else
    J := 1;
  for I := J to Length(ST) do
    if not (ST[I] in Sym) then Exit;
  Result := True;
end;

function IsIdentifer(const ID: string): Boolean;
var
  I, L: Integer;
begin
  Result := False;
  L := Length(ID);
  if L = 0 then Exit;
  if not (ID[1] in StIdFirstSymbols) then Exit;
  for I := 1 to L do
  begin
    if not (ID[1] in StIdSymbols) then Exit;
  end;
  Result := True;
end;

function GetStringValue(const ST: string): string;
begin
  if IsStringConstant(ST) then
    Result := Copy(ST, 2, Length(ST) - 2)
  else
    Result := ST;
end;

procedure TPascalParser.SetSection(const Value: TUnitSection);
begin
  FSection := Value;
end;

procedure TPascalParser.SetSubSection(const Value: TUnitSubSection);
begin
  FSubSection := Value;
end;

end.

