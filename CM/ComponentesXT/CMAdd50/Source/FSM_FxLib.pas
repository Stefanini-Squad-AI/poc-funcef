unit FSM_FxLib;

{****************************************************************************}
{*                                                                          *}
{*                   ***  Biblioteca de Funções  ***                        *}
{*                     ---------------------------                          *}
{*                     Criada por Fábio S Monteiro                          *}
{*                          ©  Copyright  1999                              *}
{*                     Data de Criação:    19/fev/1999                      *}
{*                     Ultima modificação: 04/Jan/2001                      *}
{*                                                                          *}
{*                     ***  Functions Library  ***                          *}
{*                     ---------------------------                          *}
{*                     Created by Fábio S Monteiro                          *}
{*                          ©  Copyright  1999                              *}
{*                     Creation :     19/Feb/1999                           *}
{*                     Last Modified: 04/Jan/2001                           *}
{*                                                                          *}
{****************************************************************************}

interface

{$I FSM.inc}

uses
  Windows, Forms, SysUtils, Controls, Dialogs, stdctrls, classes;

Type
  TCryptogMode = (Encrypt, Decrypt);
  {$IFDEF FSM4}
  TArrayOfString = array of string;
  {$ENDIF}

{  *** Funções para Manipulação de Data/Hora ***
           *** (DateTime Functions) ***            }
function DaysPerMonth(AYear, AMonth: Integer): Integer;
function ExtractDay(ADate : TDateTime): Integer;
function ExtractMonth(ADate : TDateTime): Integer;
function ExtractYear(ADate : TDateTime): Integer;
function ExtractHour(ATime : TDateTime): Integer;
function ExtractMinute(ATime : TDateTime): Integer;
function ExtractSecond(ATime : TDateTime): Integer;
function ExtractLongMonthName(ADate : TDateTime): string;
function ExtractShortMonthName(ADate : TDateTime): string;
function GetDateWithFirstDay(ADate : TDateTime): TDateTime;
function GetDateWithLastDay(ADate : TDateTime): TDateTime;
function IncDate(ADate: TDateTime; Days, Months, Years: Integer): TDateTime;
function IncDay(ADate: TDateTime; Delta: Integer): TDateTime;
function IncMonth(ADate: TDateTime; Delta: Integer): TDateTime;
function IncYear(ADate: TDateTime; Delta: Integer): TDateTime;
function IncTime(ATime: TDateTime; Hours, Minutes, Seconds, MSecs: Integer): TDateTime;
function IncHour(ATime: TDateTime; Delta: Integer): TDateTime;
function IncMinute(ATime: TDateTime; Delta: Integer): TDateTime;
function IncSecond(ATime: TDateTime; Delta: Integer): TDateTime;
function IncMSec(ATime: TDateTime; Delta: Integer): TDateTime;
function BrazilianCarnivalDay(Year: Integer): TDateTime;

{  *** Funções para Manipulação de Strings ***
           *** (String Functions) ***            }
function FillString(AStr : string; AChar : Char; NewLen : Integer): string;
function FSM_Encrypt(AValue, AMask : string; AMode : TCryptogMode) : string;
function GetFirstNotEmpty(const ADefault : string; AValues : array of string) : string;
function RemoveAccent(AStr : string):string;
function RFillString(AStr : string; AChar : Char; NewLen : Integer): string;
function StrExchange(CompleteStr, OldSubStr, NewSubStr  : string): string;
{$IFDEF FSM4}
function TStringsToArray(const ATStrings : TStrings) : TArrayOfString;
{$ENDIF}
function UpperCaseFirst(AStr : string): string;
function StrToDateTimeS(const Str : string): TDateTime;
function StrToTimeS(const Str : string): TTime;


{  *** Funções para Manipulação de Números ***
          *** (Numeric Functions) ***            }
function GetFirstNotZero(const ADefault : Integer; AValues : array of Integer) : Integer;
function IncInRange(const ANum, StartRange, EndRange : Integer; AValue : Integer {$IFDEF FSM4} = 1 {$ENDIF}): Integer;
function RoundToFloat(const ANum : Double; DecimalPlaces : Byte {$IFDEF FSM4} = 2 {$ENDIF}) : Double;
function StrToFloatS(const Str : string): Extended;

{ *** Funções de Mensagem ***
  *** (Message Functions) ***  }
procedure MsgWarning(AStr : string);
procedure MsgInfo(AStr : string);
procedure MsgError(AStr : string);
function MsgConfirm(AStr : string):TModalResult;
function MsgConfirmCancel(AStr : string): TModalResult;

{ *** Funções de Genéricas ***
  *** (General Functions)  ***  }
procedure AddBackSlash(var DirName: string);
function IIF(const Test: Boolean; const TrueValue, FalseValue: string): string;
{$IFNDEF FSM5}
function IncludeTrailingBackslash(const S: string): string;
{$ENDIF}


var
  PlayMsgSound : boolean;

implementation

uses
  Math;

{  *** Funções para Manipulação de Data/Hora ***
           *** (DateTime Functions) ***            }
function DaysPerMonth(AYear, AMonth: Integer): Integer;
begin
  Result := MonthDays[IsLeapYear(AYear)][AMonth];
end;
function ExtractDay(ADate : TDateTime): Integer;
var
  Dd, Mm, Yy : Word;
begin
  DecodeDate(ADate, Yy, Mm, Dd);
  Result := Dd;
end;
function ExtractMonth(ADate : TDateTime): Integer;
var
  Dd, Mm, Yy : Word;
begin
  DecodeDate(ADate, Yy, Mm, Dd);
  Result := Mm;
end;
function ExtractYear(ADate : TDateTime): Integer;
var
  Dd, Mm, Yy : Word;
begin
  DecodeDate(ADate, Yy, Mm, Dd);
  Result := Yy;
end;
function ExtractHour(ATime : TDateTime): Integer;
var
  Hh, Mm, Ss, Ms : Word;
begin
  DecodeTime(ATime, Hh, Mm, Ss, Ms);
  Result := Hh;
end;
function ExtractMinute(ATime : TDateTime): Integer;
var
  Hh, Mm, Ss, Ms : Word;
begin
  DecodeTime(ATime, Hh, Mm, Ss, Ms);
  Result := Mm;
end;
function ExtractSecond(ATime : TDateTime): Integer;
var
  Hh, Mm, Ss, Ms : Word;
begin
  DecodeTime(ATime, Hh, Mm, Ss, Ms);
  Result := Ss;
end;
function ExtractLongMonthName(ADate : TDateTime): string;
begin
  try
    Result := LongMonthNames[ExtractMonth(ADate)];
  except
    Result := '';
  end;
end;
function ExtractShortMonthName(ADate : TDateTime): string;
begin
  try
    Result := ShortMonthNames[ExtractMonth(ADate)];
  except
    Result := '';
  end;
end;
function GetDateWithFirstDay(ADate : TDateTime): TDateTime;
begin
  Result := (ADate - ExtractDay(ADate)) + 1;
end;
function GetDateWithLastDay(ADate : TDateTime): TDateTime;
var
  Dd, Mm, Yy : Word;
begin
  DecodeDate(ADate, Yy, Mm, Dd);
  Result := EncodeDate(Yy, Mm, DaysPerMonth(Yy, Mm));
end;
function IncDate(ADate: TDateTime; Days, Months, Years: Integer): TDateTime;
var
  D, M, Y: Word;
  Day, Month, Year: Longint;
begin
  DecodeDate(ADate, Y, M, D);
  Year := Y; Month := M; Day := D;
  Inc(Year, Years);
  Inc(Year, Months div 12);
  Inc(Month, Months mod 12);
  if Month < 1 then begin
    Inc(Month, 12);
    Dec(Year);
  end
  else if Month > 12 then begin
    Dec(Month, 12);
    Inc(Year);
  end;
  if Day > DaysPerMonth(Year, Month) then Day := DaysPerMonth(Year, Month);
  Result := EncodeDate(Year, Month, Day) + Days + Frac(ADate);
end;
function IncDay(ADate : TDateTime; Delta : Integer):TDateTime;
begin
  Result := ADate + Delta;
end;
function IncMonth(ADate: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncDate(ADate, 0, Delta, 0);
end;
function IncYear(ADate: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncDate(ADate, 0, 0, Delta);
end;
function IncTime(ATime: TDateTime; Hours, Minutes, Seconds, MSecs: Integer): TDateTime;
begin
  Result := ATime + (Hours div 24) + (((Hours mod 24) * 3600000 +
    Minutes * 60000 + Seconds * 1000 + MSecs) / MSecsPerDay);
  if Result < 0 then
    Result := Result + 1;
end;
function IncHour(ATime: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncTime(ATime, Delta, 0, 0, 0);
end;
function IncMinute(ATime: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncTime(ATime, 0, Delta, 0, 0);
end;
function IncSecond(ATime: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncTime(ATime, 0, 0, Delta, 0);
end;
function IncMSec(ATime: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncTime(ATime, 0, 0, 0, Delta);
end;

//Baseada na função EasterSunday da JCL
{ Função EasterSunday Originally from Mark Lussier, AppVision <MLussier@best.com>.   }
function BrazilianCarnivalDay(Year: Integer): TDateTime;
var
  nMonth, nDay, nMoon, nEpact, nSunday,
  nGold, nCent, nCorx, nCorz: Integer;
begin
  { The Golden Number of the year in the 19 year Metonic Cycle: }
  nGold := (Year mod 19) + 1;
  { Calculate the Century: }
  nCent := (Year div 100) + 1;
  { Number of years in which leap year was dropped in order... }
  { to keep in step with the sun: }
  nCorx := (3 * nCent) div 4 - 12;
  { Special correction to syncronize Easter with moon's orbit: }
  nCorz := (8 * nCent + 5) div 25 - 5;
  { Find Sunday: }
  nSunday := (Longint(5) * Year) div 4 - nCorx - 10;
              { ^ To prevent overflow at year 6554}
  { Set Epact - specifies occurrence of full moon: }
  nEpact := (11 * nGold + 20 + nCorz - nCorx) mod 30;
  if nEpact < 0 then
   nEpact := nEpact + 30;
  if ((nEpact = 25) and (nGold > 11)) or (nEpact = 24) then
   nEpact := nEpact + 1;
  { Find Full Moon: }
  nMoon := 44 - nEpact;
  if nMoon < 21 then
   nMoon := nMoon + 30;
  { Advance to Sunday: }
  nMoon := nMoon + 7 - ((nSunday + nMoon) mod 7);
  if nMoon > 31 then
  begin
   nMonth := 4;
   nDay   := nMoon - 31;
  end else
  begin
   nMonth := 3;
   nDay   := nMoon;
  end;
  Result := EncodeDate(Year, nMonth, nDay) - 47;
end;

{  *** Funções para Manipulação de Strings ***
           *** (String Functions) ***            }
function FillString(AStr : string; AChar : Char; NewLen : Integer): string;
begin
  Result := AStr;
  if Length(Result) > NewLen then
    Result := Copy(Result, 1, NewLen)
  else
    Result := StringOfChar(AChar, NewLen - Length(Result)) + Result ;
end;

function FSM_Encrypt(AValue, AMask : string; AMode : TCryptogMode) : string;
var
  i , j, chkord, im: Longint;
  RTemp : string;
begin
  Result := '';
  if AMode = Encrypt then
  begin
    for i := 1 to Length(AValue) do
      if (i mod Length(AMask)) <> 0 then
        Result := Result + IntToHex(ord(AValue[i]) + ord(AMask[i mod Length(AMask)]),2)
      else
        Result := Result + IntToHex(ord(AValue[i]) + ord(AMask[Length(AMask)]),2);
  end else
  begin
    i := 1;
    j := 2;
    while i <= Length(AValue) do
    begin
      RTemp := '$' + Copy(AValue, i, j);
      if ((Length(Result)+1) mod Length(AMask)) <> 0 then
        im := ((Length(Result)+1) mod Length(AMask))
      else
        im := Length(AMask);
      chkord := StrToInt(RTemp) - (ord(AMask[im]));
      if (chkord - StrToInt(RTemp) + (ord(AMask[im]))) = 0 then
      begin
        Result := Result + chr(chkord);
        Inc(i, 2);
        j := 2;
      end else
        Inc(j);
    end;
  end;
end;

function GetFirstNotEmpty(const ADefault : string; AValues : array of string) : string;
var
  i : Integer;
begin
  for i := 0 to High(AValues) do
    if not(AValues[i] = '') then
    begin
      Result := AValues[i];
      Exit;
    end;
  Result := ADefault;
end;

function RemoveAccent(AStr : string):string;
var
  i : integer;
begin
  Result := AStr;
  for i := Length(AStr) downto 1 do
    case Ord(AStr[i]) of
      192..197 : Result [i] := 'A';
      199      : Result [i] := 'C';
      200..203 : Result [i] := 'E';
      204..207 : Result [i] := 'I';
      209      : Result [i] := 'N';
      210..214 : Result [i] := 'O';
      217..220 : Result [i] := 'U';
      224..229 : Result [i] := 'a';
      231      : Result [i] := 'c';
      232..235 : Result [i] := 'e';
      236..239 : Result [i] := 'i';
      241      : Result [i] := 'n';
      242..246 : Result [i] := 'o';
      249..252 : Result [i] := 'u';
    end;
end;

function RFillString(AStr : string; AChar : Char; NewLen : Integer): string;
begin
  Result := AStr;
  if Length(Result) > NewLen then
    Result := Copy(Result, 1, NewLen)
  else
    Result := Result + StringOfChar(AChar, NewLen - Length(Result));
end;

function StrExchange(CompleteStr, OldSubStr, NewSubStr  : string): string;
var
  PosOSS, LastPos : integer;
begin
  Result := '';
  LastPos := 1;
  PosOSS := Pos(OldSubStr, CompleteStr);
  if PosOSS = 0 then
    Result := CompleteStr
  else
  begin
    while (PosOSS > 0) do
    begin
      Result := Result + Copy(CompleteStr, LastPos, PosOSS -1) + NewSubStr;
      {$IFDEF FSM4}
      LastPos := Max(PosOSS + Length(OldSubStr), LastPos);
      {$ELSE}
      LastPos := MaxIntValue([PosOSS + Length(OldSubStr), LastPos]);
      {$ENDIF}
      PosOSS := Pos(OldSubStr, Copy(CompleteStr, LastPos, MaxInt));
    end;
    Result := Result + Copy(CompleteStr, LastPos, MaxInt);
  end;
end;
{$IFDEF FSM4}
function TStringsToArray(const ATStrings : TStrings) : TArrayOfString;
var
  I : Integer;
begin
  SetLength(Result, ATStrings.Count);
  for I := 0 to Pred(ATStrings.Count) do
    Result[I] := ATStrings[I];
end;
{$ENDIF}

function UpperCaseFirst(AStr : string): string;
var
  StrStart : PChar;
  StrLen : Integer;
begin
  Result := AStr;
  StrLen := Length(AStr);
  AStr := TrimLeft(AStr);
  StrStart := PChar(AStr);
  CharLower(StrStart);
  CharUpperBuff(StrStart,1);
  while (StrScan(StrStart,' ') <> nil) do
  begin
    StrStart := StrScan(StrStart,' ');
    StrStart := CharNext(StrStart);
    if StrStart[1] <> ' ' then
      CharUpperBuff(StrStart,1);
  end;
  while StrLen > Length(AStr) do
    AStr := ' ' + AStr;
  Result := AStr;
end;

function StrToDateTimeS(const Str : string): TDateTime;
var
  TempDateFmt : string;
begin
  TempDateFmt := ShortDateFormat;
  ShortDateFormat := 'dd/mm/yyyy';
  try
    Result := StrToDateTime(Str);
  except
    Result := 0.0;
  end;
  ShortDateFormat := TempDateFmt;
end;

function StrToTimeS(const Str : string): TTime;
var
  TempTimeSeparator : char;
begin
  TempTimeSeparator := TimeSeparator;
  TimeSeparator := ':';
  try
    Result := StrToTime(Str);
  except
    raise;
//    Result := 0.0;
  end;
  TimeSeparator := TempTimeSeparator;
end;

{  *** Funções para Manipulação de Números ***
          *** (Numeric Functions) ***            }
function GetFirstNotZero(const ADefault : Integer; AValues : array of Integer) : Integer;
var
  i : Integer;
begin
  for i := 0 to High(AValues) do
    if not(AValues[i] = 0) then
    begin
      Result := AValues[i];
      Exit;
    end;
  Result := ADefault;
end;

function IncInRange(const ANum, StartRange, EndRange : Integer; AValue : Integer {$IFDEF FSM4} = 1 {$ENDIF}): Integer;
var
  StRg, EndRg : Integer;
begin
  {$IFDEF FSM4}
  StRg := Min(StartRange, EndRange);
  EndRg := Max(StartRange, EndRange);
  {$ELSE}
  StRg := MinIntValue([StartRange, EndRange]);
  EndRg := MaxIntValue([StartRange, EndRange]);
  {$ENDIF}
  Result := ANum + AValue;
  if Result < StRg then
    Result := EndRg - (StRg - (Abs(ANum)))  // acho que aqui está errado. Talvez devesse ser: EndRg + (StRg - (Abs(ANum)))
  else
    if Result > EndRg then
      Result := StRg +(Result mod (EndRg + 1)) - 1;
end;

function RoundToFloat(const ANum : Double; DecimalPlaces : Byte {$IFDEF FSM4} = 2 {$ENDIF}) : Double;
var
  Mult : Integer;
begin
  Mult := StrToInt(RFillString('1', '0', DecimalPlaces + 1));
  Result := Trunc(ANum * Mult) / Mult;
end;

function StrToFloatS(const Str : string): Extended;
var
  TempDecSep : char;
begin
  TempDecSep := DecimalSeparator;
  DecimalSeparator := '.';
  try
    Result := StrToFloat(Str);
  except
    Result := 0.0;
  end;
  DecimalSeparator := TempDecSep;
end;

{ *** Funções de Mensagem ***
  *** (Message Functions) ***  }
procedure MsgWarning(AStr : string);
begin
  if PlayMsgSound then
    MessageBeep(MB_ICONEXCLAMATION);
  MessageDlg(AStr, mtWarning,[mbOK],0);
end;

procedure MsgInfo(AStr : string);
begin
  if PlayMsgSound then
    MessageBeep(MB_ICONASTERISK);
  MessageDlg(AStr, mtInformation,[mbOK],0);
end;

procedure MsgError(AStr : string);
begin
  if PlayMsgSound then
    MessageBeep(MB_ICONHAND);
  MessageDlg(AStr,mtError,[mbok],0);
end;

function MsgConfirm(AStr : string):TModalResult;
begin
  if PlayMsgSound then
    MessageBeep(MB_ICONQUESTION);
  Result := MessageDlg(AStr,mtConfirmation,[mbyes,mbno],0);
end;

function MsgConfirmCancel(AStr : string): TModalResult;
begin
  if PlayMsgSound then
    MessageBeep(MB_ICONQUESTION);
  Result := MessageDlg(AStr, mtConfirmation, mbYesNoCancel, 0);
end;

{ *** Funções de Genéricas ***
  *** (General Functions)  ***  }
procedure AddBackSlash(var DirName: string);
begin
  if (Trim(DirName) <> '') and (AnsiLastChar(DirName)^ <> '\') then
    DirName := DirName + '\';
end;

function IIF(const Test: Boolean; const TrueValue, FalseValue: string): string;
begin
  if Test then
    Result := TrueValue
  else
    Result := FalseValue;
end;

{$IFNDEF FSM5}
function IncludeTrailingBackslash(const S: string): string;
begin
  Result := S;
  if not IsPathDelimiter(Result, Length(Result)) then Result := Result + '\';
end;
{$ENDIF}

initialization
  PlayMsgSound := True;

end.


