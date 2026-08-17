unit IvTests;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  IvDictio;

const
  { Expansion Test defaults }

  FROM_1_TO_5_C = 200;
  FROM_6_TO_10_C = 100;
  FROM_11_TO_20_C = 70;
  FROM_21_TO_30_C = 50;
  FROM_31_TO_50_C = 30;
  OVER_50_C = 20;
  EXPAND_CHAR_C = '_';
  LAST_EXPAND_CHAR_C = 'X';
  REPLACE_CHAR_C = '.';

type
  TIvTestType = (ivttCover, ivttMinimum, ivttCodePage);

  TIvTestCode = (ivtcNone, ivtcCover, ivtcMinimum, ivtcSingleByte, ivtcMultibyte,
    ivtcBidirectional);

  { TIvTest }

  TIvTest = class(TObject)
  protected
    function GetPrimary: Integer; virtual;
    function GetSub: Integer; virtual;
    function GetTestCode: TIvTestCode; virtual;
    function GetName: String; virtual;
    function GetCodePage: Integer; virtual;
    procedure SetCodePage(value: Integer); virtual;
    function GetPureASCII: Boolean; virtual;

  public
    function Copy: TIvTest; virtual;
    function Translate(const value: String): String; virtual;

    procedure ToLanguage(language: TIvLanguage);

    class function TestToStr(test: TIvTest): String;

    property Name: String read GetName;
    property Primary: Integer read GetPrimary;
    property Sub: Integer read GetSub;
    property TestCode: TIvTestCode read GetTestCode;
    property PureASCII: Boolean read GetPureASCII;
    property CodePage: Integer read GetCodePage write SetCodePage;
  end;

  { TIvCoverTest }

  TIvCoverTest = class(TIvTest)
  protected
    FReplaceChar: Char;

    function GetTestCode: TIvTestCode; override;
    function GetName: String; override;

  public
    constructor CreateValue(replaceChar: Char);

    function Copy: TIvTest; override;
    function Translate(const value: String): String; override;

    property ReplaceChar: Char read FReplaceChar write FReplaceChar;
  end;

  { TIvMinimumTest }

  TIvMinimumTest = class(TIvTest)
  protected
    FReductionChar: String;

    function GetTestCode: TIvTestCode; override;
    function GetName: String; override;

  public
    constructor CreateValue(const reductionChar: String);

    function Copy: TIvTest; override;
    function Translate(const value: String): String; override;

    property ReductionChar: String read FReductionChar write FReductionChar;
  end;

  { TIvCodePageTest }

  TIvCodePageTest = class(TIvTest)
  protected
    FCodePage: Integer;

    function GetCodePage: Integer; override;
    procedure SetCodePage(value: Integer); override;

  public
    constructor CreateValue(codePage: Integer);
  end;

  { TIvSinglebyteTest }

  TIvSinglebyteTestOption = (ivstExpand, ivstEnclose, ivstAlternateCase, ivstUpperCase, ivstDiacritic);
  TIvSinglebyteTestOptions = set of TIvSinglebyteTestOption;

  TIvSinglebyteTest = class(TIvCodePageTest)
  protected
    FOptions: TIvSinglebyteTestOptions;
    FFrom1To5: Integer;
    FFrom6To10: Integer;
    FFrom11To20: Integer;
    FFrom21To30: Integer;
    FFrom31To50: Integer;
    FOver50: Integer;
    FExpandChar: Char;
    FLastChar: Char;

    function GetTestCode: TIvTestCode; override;
    function GetPrimary: Integer; override;
    function GetName: String; override;
    function GetPureASCII: Boolean; override;

  public
    constructor CreateValue(codePage: Integer; options: TIvSinglebyteTestOptions);
    constructor CreateValueEx(codePage: Integer; expand, enclose, alternateCase, upperCase, diacritic: Boolean);

    function Copy: TIvTest; override;
    function Translate(const value: String): String; override;

    property Options: TIvSinglebyteTestOptions read FOptions write FOptions;
    property From1To5: Integer read FFrom1To5 write FFrom1To5;
    property From6To10: Integer read FFrom6To10 write FFrom6To10;
    property From11To20: Integer read FFrom11To20 write FFrom11To20;
    property From21To30: Integer read FFrom21To30 write FFrom21To30;
    property From31To50: Integer read FFrom31To50 write FFrom31To50;
    property Over50: Integer read FOver50 write FOver50;
    property ExpandChar: Char read FExpandChar write FExpandChar;
    property LastChar: Char read FLastChar write FLastChar;
  end;

  { TIvMultibyteTest }

  TIvMultibyteTest = class(TIvCodePageTest)
  protected
    FUseDoubleByteChars: Boolean;

    function GetTestCode: TIvTestCode; override;
    function GetPrimary: Integer; override;
    function GetSub: Integer; override;
    function GetCodePage: Integer; override;
    function GetName: String; override;
    function GetPureASCII: Boolean; override;

  public
    constructor CreateValue(
      codePage: Integer;
      useDoubleByteChars: Boolean);

    function Copy: TIvTest; override;
    function Translate(const value: String): String; override;

    property UseDoubleByteChars: Boolean read FUseDoubleByteChars write FUseDoubleByteChars;
  end;

  { TIvBidirectionalTest }

  TIvBidirectionalTest = class(TIvCodePageTest)
  protected
    function GetTestCode: TIvTestCode; override;
    function GetName: String; override;
    function GetPureASCII: Boolean; override;

  public
    function Copy: TIvTest; override;
    function Translate(const value: String): String; override;
  end;

implementation

uses
  SysUtils,
  IvParser;

{ TIvTest }

function TIvTest.GetPrimary: Integer;
begin
  Result := LANG_ENGLISH;
end;

function TIvTest.GetSub: Integer;
begin
  Result := 0;
end;

function TIvTest.GetTestCode: TIvTestCode;
begin
  Result := ivtcNone;
end;

function TIvTest.GetName: String;
begin
  Result := '';
end;

function TIvTest.GetPureASCII: Boolean;
begin
  Result := True;
end;

function TIvTest.GetCodePage: Integer;
begin
  Result := 0;
end;

procedure TIvTest.SetCodePage(value: Integer);
begin
end;

function TIvTest.Copy: TIvTest;
begin
  Result := TIvTest.Create;
end;

function TIvTest.Translate(const value: String): String;
begin
  Result := value;
end;

procedure TIvTest.ToLanguage(language: TIvLanguage);
begin
  language.EnglishName := Name;
  language.NativeName := Name;
  language.Primary := Primary;
  language.DefaultSub := Sub;
  language.Options := [ivloTest];
  if PureASCII then
    language.Options := language.Options + [ivloPureASCII];
end;

class function TIvTest.TestToStr(test: TIvTest): String;
const
  SEPARATOR_C = ';';

  function SiglebyteTestToStr(test: TIvSinglebyteTest): String;
  begin
    Result := '';

    if ivstExpand in test.Options then
      Result := Result + '1'
    else
      Result := Result + '0';

    if ivstEnclose in test.Options then
      Result := Result + '1'
    else
      Result := Result + '0';

    if ivstAlternateCase in test.Options then
      Result := Result + '1'
    else
      Result := Result + '0';

    if ivstDiacritic in test.Options then
      Result := Result + '1'
    else
      Result := Result + '0';

    if ivstUpperCase in test.Options then
      Result := Result + '1'
    else
      Result := Result + '0';

    Result := Result + test.ExpandChar + test.LastChar;

    Result := Result + IntToStr(test.From1To5) + SEPARATOR_C;
    Result := Result + IntToStr(test.From6To10) + SEPARATOR_C;
    Result := Result + IntToStr(test.From11To20) + SEPARATOR_C;
    Result := Result + IntToStr(test.From21To30) + SEPARATOR_C;
    Result := Result + IntToStr(test.From31To50) + SEPARATOR_C;
    Result := Result + IntToStr(test.Over50) + SEPARATOR_C;

    Result := Result + IntToStr(test.CodePage);
  end;

  function MultibyteTestToStr(test: TIvMultibyteTest): String;
  begin
    Result := IntToStr(test.CodePage) + SEPARATOR_C + IntToStr(Integer(test.UseDoubleByteChars));
  end;

begin
  if test is TIvCoverTest then
    Result := TIvCoverTest(test).ReplaceChar
  else if test is TIvMinimumTest then
    Result := TIvMinimumTest(test).ReductionChar
  else if test is TIvSinglebyteTest then
    Result := SiglebyteTestToStr(TIvSinglebyteTest(test))
  else if test is TIvMultibyteTest then
    Result := MultibyteTestToStr(TIvMultibyteTest(test))
  else
    Result := '';
end;


{ TIvCoverTest }

constructor TIvCoverTest.CreateValue(replaceChar: Char);
begin
  inherited Create;
  FReplaceChar := replaceChar;
end;

function TIvCoverTest.Copy: TIvTest;
begin
  Result := TIvCoverTest.CreateValue(FReplaceChar);
end;

function TIvCoverTest.GetTestCode: TIvTestCode;
begin
  Result := ivtcCover;
end;

function TIvCoverTest.GetName: String;
begin
  Result := 'Test (Cover)';
end;

function TIvCoverTest.Translate(const value: String): String;
var
  i: Integer;
begin
  Result := value;
  for i := 1 to Length(value) do
    Result[i] := FReplaceChar;
end;


{ TIvMinimumTest }

constructor TIvMinimumTest.CreateValue(const reductionChar: String);
begin
  inherited Create;
  FReductionChar := reductionChar;
end;

function TIvMinimumTest.Copy: TIvTest;
begin
  Result := TIvMinimumTest.CreateValue(FReductionChar);
end;

function TIvMinimumTest.GetTestCode: TIvTestCode;
begin
  Result := ivtcMinimum;
end;

function TIvMinimumTest.GetName: String;
begin
  Result := 'Test (Minimum)';
end;

function TIvMinimumTest.Translate(const value: String): String;
begin
  if value = '' then
    Result := ''
  else if FReductionChar <> '' then
    Result := FReductionChar
  else if (value[1] = '&') and (Length(value) > 1) then
    Result := value[2]
  else
    Result := value[1];
end;


{ TIvCodePageTest }

constructor TIvCodePageTest.CreateValue(codePage: Integer);
begin
  inherited Create;
  FCodePage := codePage;
end;

function TIvCodePageTest.GetCodePage: Integer;
begin
  Result := FCodePage;
end;

procedure TIvCodePageTest.SetCodePage(value: Integer);
begin
  FCodePage := value;
end;


{ TIvSinglebyteTest }

constructor TIvSinglebyteTest.CreateValue(codePage: Integer; options: TIvSinglebyteTestOptions);
begin
  inherited CreateValue(codePage);
  FOptions := options;
  FFrom1To5 := FROM_1_TO_5_C;
  FFrom6To10 := FROM_6_TO_10_C;
  FFrom11To20 := FROM_11_TO_20_C;
  FFrom21To30 := FROM_21_TO_30_C;
  FFrom31To50 := FROM_31_TO_50_C;
  FOver50 := OVER_50_C;
  FExpandChar := EXPAND_CHAR_C;
  FLastChar := LAST_EXPAND_CHAR_C;
end;

constructor TIvSinglebyteTest.CreateValueEx(codePage: Integer; expand, enclose, alternateCase, upperCase, diacritic: Boolean);
var
  options: TIvSinglebyteTestOptions;
begin
  options := [];

  if expand then
    options := options + [ivstExpand];

  if enclose then
    options := options + [ivstEnclose];

  if alternateCase then
    options := options + [ivstAlternateCase];

  if upperCase then
    options := options + [ivstUpperCase];

  if diacritic then
    options := options + [ivstDiacritic];

  CreateValue(codePage, options);
end;

function TIvSinglebyteTest.GetPureASCII: Boolean;
begin
  Result := not (ivstDiacritic in FOptions);
end;

function TIvSinglebyteTest.Copy: TIvTest;
var
  test: TIvSinglebyteTest;
begin
  test := TIvSinglebyteTest.CreateValue(FCodePage, FOptions);
  test.FFrom1To5 := FFrom1To5;
  test.FFrom6To10 := FFrom6To10;
  test.FFrom11To20 := FFrom11To20;
  test.FFrom21To30 := FFrom21To30;
  test.FFrom31To50 := FFrom31To50;
  test.FOver50 := FOver50;
  test.FExpandChar := FExpandChar;
  test.FLastChar := FLastChar;
  Result := test;
end;

function TIvSinglebyteTest.GetPrimary: Integer;
begin
  if ivstDiacritic in FOptions then
    Result := LANG_FINNISH
  else
    Result := LANG_ENGLISH;
end;

function TIvSinglebyteTest.GetTestCode: TIvTestCode;
begin
  Result := ivtcSinglebyte;
end;

function TIvSinglebyteTest.GetName: String;
begin
  Result := 'Test (Singlebyte)';
end;

function TIvSinglebyteTest.Translate(const value: String): String;

  procedure AlternateCase(var str: String);
  var
    i: Integer;
  begin
    for i := 1 to Length(str) do
    begin
      if (i mod 2) = 0 then
        str[i] := AnsiLowerCase(str[i])[1]
      else
        str[i] := AnsiUpperCase(str[i])[1];
    end;
  end;

  procedure AddBalticDiacritics(var str: String);
  var
    i: Integer;
  begin
    for i := 1 to Length(str) do
    begin
    end;
  end;

  procedure AddEastEuropeDiacritics(var str: String);
  var
    i: Integer;
  begin
    for i := 1 to Length(str) do
    begin
      case str[i] of
        'a': str[i] := Chr(228);
        'A': str[i] := Chr(196);
        'e': str[i] := Chr(234);
        'E': str[i] := Chr(202);
        'i': str[i] := Chr(238);
        'I': str[i] := Chr(206);
        'o': str[i] := Chr(246);
        'O': str[i] := Chr(214);
        'u': str[i] := Chr(250);
        'U': str[i] := Chr(218);
        'y': str[i] := Chr(253);
        'Y': str[i] := Chr(221);
      end;
    end;
  end;

  procedure ConvertToCyrillic(var str: String);
  var
    i: Integer;
  begin
    for i := 1 to Length(str) do
    begin
      if (str[i] >= 'a') and (str[i] <= 'z') then
        str[i] := Chr(224 + Ord(str[i]) - Ord('a'))
      else if (str[i] >= 'A') and (str[i] <= 'Z') then
        str[i] := Chr(192 + Ord(str[i]) - Ord('A'));
    end;
  end;

  procedure ConvertToGreek(var str: String);
  var
    i: Integer;
  begin
    for i := 1 to Length(str) do
    begin
      if (str[i] >= 'a') and (str[i] <= 'z') then
        str[i] := Chr(225 + Ord(str[i]) - Ord('a'))
      else if (str[i] >= 'A') and (str[i] <= 'Z') then
        str[i] := Chr(193 + Ord(str[i]) - Ord('A'));
    end;
  end;

  procedure AddTurkishDiacritics(var str: String);
  var
    i: Integer;
  begin
    for i := 1 to Length(str) do
    begin
    end;
  end;

  procedure AddWesternDiacritics(var str: String);
  var
    i: Integer;
  begin
    for i := 1 to Length(str) do
      case str[i] of
        'a': str[i] := 'ä';
        'A': str[i] := 'Ä';
        'e': str[i] := 'ê';
        'E': str[i] := 'Ê';
        'i': str[i] := 'ï';
        'I': str[i] := 'Ï';
        'o': str[i] := 'ö';
        'O': str[i] := 'Ö';
        'u': str[i] := 'ü';
        'U': str[i] := 'Ü';
        'y': str[i] := 'ÿ';
        'Y': str[i] := 'Ÿ';
{
        'c': str[i] := 'ç';
        'C': str[i] := 'Ç';
        'd': str[i] := 'ð';
        'D': str[i] := 'Ð';
        'n': str[i] := 'ñ';
        'N': str[i] := 'Ñ';
        's': str[i] := 'š';
        'S': str[i] := 'Š';
}
      end;
  end;

  procedure Expand(var str: String);
  var
    i, len, newLen: Integer;
  begin
    len := Length(str);
    if len <= 5 then
      newLen := len + FFrom1To5*len div 100
    else if len <= 10 then
      newLen := len + FFrom6To10*len div 100
    else if len <= 20 then
      newLen := len + FFrom11To20*len div 100
    else if len <= 30 then
      newLen := len + FFrom21To30*len div 100
    else if len <= 50 then
      newLen := len + FFrom31To50*len div 100
    else
      newLen := len + FOver50*len div 100;

    if ivstEnclose in FOptions then
      Dec(newLen, 2);

    for i := len to newLen - 2 do
      str := str + FExpandChar;
    str := str + FLastChar;
  end;

  procedure Enclose(var str: String);
  begin
    str := '{' + str + '}';
  end;

begin
  Result := value;

  if ivstAlternateCase in FOptions then
    AlternateCase(Result);

  if ivstUpperCase in FOptions then
    Result := UpperCase(Result);

  if (ivstDiacritic in FOptions) or (CodePage = CYRILLIC_CP_C) or (CodePage = GREEK_CP_C) then
  begin
    case CodePage of
      BALTIC_CP_C: AddBalticDiacritics(Result);
      EAST_EUROPE_CP_C: AddEastEuropeDiacritics(Result);
      CYRILLIC_CP_C: ConvertToCyrillic(Result);
      GREEK_CP_C: ConvertToGreek(Result);
      TURKISH_CP_C: AddTurkishDiacritics(Result);
      WESTERN_CP_C: AddWesternDiacritics(Result);
    end;
  end;

  if ivstExpand in FOptions then
    Expand(Result);

  if ivstEnclose in FOptions then
    Enclose(Result);
end;


{ TIvMultibyteTest }

constructor TIvMultibyteTest.CreateValue(
  codePage: Integer;
  useDoubleByteChars: Boolean);
begin
  inherited CreateValue(codePage);
  FUseDoubleByteChars := useDoubleByteChars;
end;

function TIvMultibyteTest.Copy: TIvTest;
begin
  Result := TIvMultibyteTest.CreateValue(CodePage, FUseDoubleByteChars);
end;

function TIvMultibyteTest.GetPureASCII: Boolean;
begin
  Result := not FUseDoubleByteChars;
end;

function TIvMultibyteTest.GetPrimary: Integer;
begin
  Result := inherited GetPrimary;
  if FUseDoubleByteChars then
    case CodePage of
      SIMPLIFIED_CHINESE_CP_C: Result := LANG_CHINESE;
      TRADITIONAL_CHINESE_CP_C: Result := LANG_CHINESE;
      JAPANESE_CP_C: Result := LANG_JAPANESE;
      KOREAN_CP_C: Result := LANG_KOREAN;
    end
end;

function TIvMultibyteTest.GetSub: Integer;
begin
  Result := inherited GetSub;
  if FUseDoubleByteChars then
    case CodePage of
      SIMPLIFIED_CHINESE_CP_C: Result := SUBLANG_CHINESE_SIMPLIFIED or SUBLANG_CHINESE_SINGAPORE;
      TRADITIONAL_CHINESE_CP_C: Result := SUBLANG_CHINESE_TRADITIONAL or SUBLANG_CHINESE_HONGKONG;
    end
end;

function TIvMultibyteTest.GetCodePage: Integer;
begin
  if FUseDoubleByteChars then
    Result := FCodePage
  else
    Result := inherited GetCodePage;
end;

function TIvMultibyteTest.GetTestCode: TIvTestCode;
begin
  Result := ivtcMultibyte;
end;

function TIvMultibyteTest.GetName: String;
begin
  if FUseDoubleByteChars then
    case CodePage of
      SIMPLIFIED_CHINESE_CP_C: Result := 'Test (Simplified Chinese)';
      TRADITIONAL_CHINESE_CP_C: Result := 'Test (Traditional Chinese)';
      JAPANESE_CP_C: Result := 'Test (Japanese)';
      KOREAN_CP_C: Result := 'Test (Korean)';
    end
  else
    Result := 'Test (Multibyte)';
end;

function TIvMultibyteTest.Translate(const value: String): String;

  function ConvertToJapanese(const str: String): String;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to Length(str) do
    begin
      if (str[i] >= '0') and (str[i] <= '9') then
        Result := Result + Chr($82) + Chr($4F + Ord(str[i]) - Ord('0'))
      else if (str[i] >= 'a') and (str[i] <= 'z') then
        Result := Result + Chr($82) + Chr($81 + Ord(str[i]) - Ord('a'))
      else if (str[i] >= 'A') and (str[i] <= 'Z') then
        Result := Result + Chr($82) + Chr($60 + Ord(str[i]) - Ord('A'))
      else
        case str[i] of
          ' ': Result := Result + ' ';
          '!': Result := Result + Chr($81) + Chr($49);
          '"': Result := Result + Chr($81) + Chr($8D);
          '#': Result := Result + Chr($81) + Chr($94);
          '$': Result := Result + Chr($81) + Chr($90);
          '%': Result := Result + Chr($81) + Chr($93);
          '&': Result := Result + Chr($81) + Chr($95);
          '''': Result := Result + Chr($81) + Chr($8C);
          '(': Result := Result + Chr($81) + Chr($69);
          ')': Result := Result + Chr($81) + Chr($6A);
          '*': Result := Result + Chr($81) + Chr($96);
          '+': Result := Result + Chr($81) + Chr($7B);
          ',': Result := Result + Chr($81) + Chr($43);
          '-': Result := Result + Chr($81) + Chr($7C);
          '.': Result := Result + Chr($81) + Chr($44);
          '/': Result := Result + Chr($81) + Chr($5E);
          ':': Result := Result + Chr($81) + Chr($46);
          ';': Result := Result + Chr($81) + Chr($47);
          '<': Result := Result + Chr($81) + Chr($71);
          '=': Result := Result + Chr($81) + Chr($81);
          '>': Result := Result + Chr($81) + Chr($72);
          '?': Result := Result + Chr($81) + Chr($48);
          '@': Result := Result + Chr($81) + Chr($97);
          '[': Result := Result + Chr($81) + Chr($6D);
          '\': Result := Result + Chr($81) + Chr($5F);
          ']': Result := Result + Chr($81) + Chr($6E);
          '^': Result := Result + Chr($81) + Chr($4F);
          '_': Result := Result + Chr($81) + Chr($51);
          '`': Result := Result + Chr($81) + Chr($4D);
          '{': Result := Result + Chr($81) + Chr($6F);
          '|': Result := Result + Chr($81) + Chr($62);
          '}': Result := Result + Chr($81) + Chr($70);
          '~': Result := Result + Chr($81) + Chr($60);
        else
          Result := Result + str[i];
        end;
    end;
  end;

  function ConvertToKorean(const str: String): String;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to Length(str) do
    begin
      if (str[i] >= '0') and (str[i] <= '9') then
        Result := Result + Chr($A3) + Chr($B0 + Ord(str[i]) - Ord('0'))
      else if (str[i] >= 'a') and (str[i] <= 'z') then
        Result := Result + Chr($A3) + Chr($E1 + Ord(str[i]) - Ord('a'))
      else if (str[i] >= 'A') and (str[i] <= 'Z') then
        Result := Result + Chr($A3) + Chr($C1 + Ord(str[i]) - Ord('A'))
      else
        case str[i] of
          ' ': Result := Result + Chr($A1) + Chr($A1);
          '!': Result := Result + Chr($A3) + Chr($A1);
          '"': Result := Result + Chr($A3) + Chr($A2);
          '#': Result := Result + Chr($A3) + Chr($A3);
          '$': Result := Result + Chr($A3) + Chr($A4);
          '%': Result := Result + Chr($A3) + Chr($A5);
          '&': Result := Result + Chr($A3) + Chr($A6);
          '''': Result := Result + Chr($A3) + Chr($A7);
          '(': Result := Result + Chr($A3) + Chr($A8);
          ')': Result := Result + Chr($A3) + Chr($A9);
          '*': Result := Result + Chr($A3) + Chr($AA);
          '+': Result := Result + Chr($A3) + Chr($AB);
          ',': Result := Result + Chr($A3) + Chr($AC);
          '-': Result := Result + Chr($A3) + Chr($AD);
          '.': Result := Result + Chr($A3) + Chr($AE);
          '/': Result := Result + Chr($A3) + Chr($AF);

          ':': Result := Result + Chr($A3) + Chr($BA);
          ';': Result := Result + Chr($A3) + Chr($BB);
          '<': Result := Result + Chr($A3) + Chr($BC);
          '=': Result := Result + Chr($A3) + Chr($BD);
          '>': Result := Result + Chr($A3) + Chr($BE);
          '?': Result := Result + Chr($A3) + Chr($BF);

          '@': Result := Result + Chr($A3) + Chr($C0);

          '[': Result := Result + Chr($A3) + Chr($DB);
          '\': Result := Result + Chr($A3) + Chr($DC);
          ']': Result := Result + Chr($A3) + Chr($DD);
          '^': Result := Result + Chr($A3) + Chr($DE);
          '_': Result := Result + Chr($A3) + Chr($DF);

          '`': Result := Result + Chr($A3) + Chr($E0);

          '{': Result := Result + Chr($A3) + Chr($FB);
          '|': Result := Result + Chr($A3) + Chr($FC);
          '}': Result := Result + Chr($A3) + Chr($FD);
          '~': Result := Result + Chr($A3) + Chr($FE);
        else
          Result := Result + str[i];
        end;
    end;
  end;

  function ConvertToSimplifiedChinese(const str: String): String;
  begin
    { Simplified Chinese uses the same codes as Korean to code double byte ASCII }

    Result := ConvertToKorean(str);
  end;

  function ConvertToTraditionalChinese(const str: String): String;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to Length(str) do
    begin
      if (str[i] >= '0') and (str[i] <= '9') then
        Result := Result + Chr($A2) + Chr($AF + Ord(str[i]) - Ord('0'))
      else if (str[i] >= 'a') and (str[i] <= 'z') then
        Result := Result + Chr($A2) + Chr($E9 + Ord(str[i]) - Ord('a'))
      else if (str[i] >= 'A') and (str[i] <= 'Z') then
        Result := Result + Chr($A2) + Chr($CF + Ord(str[i]) - Ord('A'))
      else
        case str[i] of
          ' ': Result := Result + Chr($A1) + Chr($40);
          '!': Result := Result + Chr($A1) + Chr($54);
          '"': Result := Result + Chr($A1) + Chr($A7);
          '#': Result := Result + Chr($A1) + Chr($AD);
          '$': Result := Result + Chr($A2) + Chr($43);
          '%': Result := Result + Chr($A2) + Chr($48);
          '&': Result := Result + Chr($A1) + Chr($AE);
          '''': Result := Result + Chr($A1) + Chr($41);
          '(': Result := Result + Chr($A1) + Chr($5D);
          ')': Result := Result + Chr($A1) + Chr($5E);
          '*': Result := Result + Chr($A1) + Chr($AF);
          '+': Result := Result + Chr($A1) + Chr($CF);
          ',': Result := Result + Chr($A1) + Chr($4D);
          '-': Result := Result + Chr($A1) + Chr($DF);
          '.': Result := Result + Chr($A1) + Chr($4F);
          '/': Result := Result + Chr($A2) + Chr($41);
          ':': Result := Result + Chr($A1) + Chr($47);
          ';': Result := Result + Chr($A1) + Chr($46);
          '<': Result := Result + Chr($A1) + Chr($D5);
          '=': Result := Result + Chr($A1) + Chr($D7);
          '>': Result := Result + Chr($A1) + Chr($D6);
          '?': Result := Result + Chr($A1) + Chr($48);
          '@': Result := Result + Chr($A2) + Chr($4E);
          '[': Result := Result + Chr($A1) + Chr($A3);
          '\': Result := Result + Chr($A2) + Chr($42);
          ']': Result := Result + Chr($A1) + Chr($A4);
          '^': Result := Result + Chr($A1) + Chr($6F);
          '_': Result := Result + Chr($A1) + Chr($C5);
          '`': Result := Result + Chr($A1) + Chr($42);
          '{': Result := Result + Chr($A1) + Chr($A1);
          '|': Result := Result + Chr($A1) + Chr($55);
          '}': Result := Result + Chr($A1) + Chr($A2);
          '~': Result := Result + Chr($A1) + Chr($5C);
        else
          Result := Result + str[i];
        end;
    end;
  end;

begin
  if FUseDoubleByteChars then
    case CodePage of
      SIMPLIFIED_CHINESE_CP_C: Result := ConvertToSimplifiedChinese(value);
      TRADITIONAL_CHINESE_CP_C: Result := ConvertToTraditionalChinese(value);
      JAPANESE_CP_C: Result := ConvertToJapanese(value);
      KOREAN_CP_C: Result := ConvertToKorean(value);
    else
      Result := value;
    end
  else
    Result := value;
end;


{ TIvBidirectionalTest }

function TIvBidirectionalTest.Copy: TIvTest;
begin
  Result := TIvBidirectionalTest.Create;
end;

function TIvBidirectionalTest.GetTestCode: TIvTestCode;
begin
  Result := ivtcBidirectional;
end;

function TIvBidirectionalTest.GetName: String;
begin
  Result := 'Test (Bidirectional)';
end;

function TIvBidirectionalTest.GetPureASCII: Boolean;
begin
  Result := False;
end;

function TIvBidirectionalTest.Translate(const value: String): String;

  function ConvertToArabic(const str: String): String;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to Length(str) do
    begin
      if (str[i] >= 'a') and (str[i] <= 'z') then
        Result := Result + Chr($C1 + Ord(str[i]) - Ord('a'))
      else if (str[i] >= 'A') and (str[i] <= 'Z') then
        Result := Result + Chr($C1 + Ord(str[i]) - Ord('A'))
      else
        Result := Result + str[i];
    end;
  end;

  function ConvertToHebrew(const str: String): String;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to Length(str) do
    begin
      if (str[i] >= 'a') and (str[i] <= 'z') then
        Result := Result + Chr($E0 + Ord(str[i]) - Ord('a'))
      else if (str[i] >= 'A') and (str[i] <= 'Z') then
        Result := Result + Chr($E0 + Ord(str[i]) - Ord('A'))
      else
        Result := Result + str[i];
    end;
  end;

begin
  case CodePage of
    ARABIC_CP_C: Result := ConvertToArabic(value);
    HEBREW_CP_C: Result := ConvertToHebrew(value);
  else
    Result := value;
  end
end;

end.
