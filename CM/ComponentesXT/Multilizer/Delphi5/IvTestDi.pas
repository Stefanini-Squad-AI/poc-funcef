unit IvTestDi;

{$I IVMULTI.INC}

{ This is a sample dictionary component that contains three languages:
  1) Native
  2) Translated test
  3) Native test

  Use this dictionary to test your application. You do not have any kind of
  dictionary data but the test dictionary gererates the translation on
  run time by uppercasing the native string. }

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Classes,
  IvDictio, IvTests;

type
  TIvTestDictionary = class(TIvDictionary)
  protected
    FTest: TIvTest;
    FTestType: TIvTestType;
    FReplaceChar: Char;
    FReductionChar: String;
    FSingleByteOptions: TIvSinglebyteTestOptions;
    FUseDoubleByteChars: Boolean;
    FFrom1To5: Integer;
    FFrom6To10: Integer;
    FFrom11To20: Integer;
    FFrom21To30: Integer;
    FFrom31To50: Integer;
    FOver50: Integer;
    FExpandChar: Char;
    FLastChar: Char;
    FTestPrimary: Integer;

    function GetLanguageCount: Integer; override;
    procedure GetLanguageData(index: Integer; language: TIvLanguage); override;
    function GetLocaleCount: Integer; override;
    procedure GetLocaleData(index: Integer; locale: TIvLocale); override;

    procedure Loaded; override;
    procedure Init;

    function GetTestPrimary: Integer;
    function GetTestLangId: Integer;
    function GetTestCodePage: Integer;

  public
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;

    function TranslateString(
      const str: String;
      var translation: String): Boolean; override;
    function TranslateContextString(
      const str, form, component: String;
      var translation: String): Boolean; override;

  published
    property TestType: TIvTestType read FTestType write FTestType default ivttCodePage;
    property TestPrimary: Integer read FTestPrimary write FTestPrimary default 0;
    property ReplaceChar: Char read FReplaceChar write FReplaceChar default REPLACE_CHAR_C;
    property ReductionChar: String read FReductionChar write FReductionChar;
    property SingleByteOptions: TIvSinglebyteTestOptions read FSingleByteOptions write FSingleByteOptions
      default [ivstUpperCase];
    property From1To5: Integer read FFrom1To5 write FFrom1To5 default FROM_1_TO_5_C;
    property From6To10: Integer read FFrom6To10 write FFrom6To10 default FROM_6_TO_10_C;
    property From11To20: Integer read FFrom11To20 write FFrom11To20 default FROM_11_TO_20_C;
    property From21To30: Integer read FFrom21To30 write FFrom21To30 default FROM_21_TO_30_C;
    property From31To50: Integer read FFrom31To50 write FFrom31To50 default FROM_31_TO_50_C;
    property Over50: Integer read FOver50 write FOver50 default OVER_50_C;
    property ExpandChar: Char read FExpandChar write FExpandChar default EXPAND_CHAR_C;
    property LastChar: Char read FLastChar write FLastChar default LAST_EXPAND_CHAR_C;
    property UseDoubleByteChars: Boolean read FUseDoubleByteChars write FUseDoubleByteChars default True;
  end;

implementation

uses
  SysUtils;

constructor TIvTestDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);
  FTestType := ivttCodePage;
  FTestPrimary := 0;
  FSingleByteOptions := [ivstUpperCase];
  FUseDoubleByteChars := True;
  FFrom1To5 := FROM_1_TO_5_C;
  FFrom6To10 := FROM_6_TO_10_C;
  FFrom11To20 := FROM_11_TO_20_C;
  FFrom21To30 := FROM_21_TO_30_C;
  FFrom31To50 := FROM_31_TO_50_C;
  FOver50 := OVER_50_C;
  FExpandChar := EXPAND_CHAR_C;
  FLastChar := LAST_EXPAND_CHAR_C;
  FReplaceChar := REPLACE_CHAR_C;
  FReductionChar := '';
end;

destructor TIvTestDictionary.Destroy;
begin
  FTest.Free;
  inherited Destroy;
end;

procedure TIvTestDictionary.Loaded;
begin
  if not (csDesigning in ComponentState) then
    Init;
end;

procedure TIvTestDictionary.Init;
begin
  if FTest <> nil then
    Exit;

  case FTestType of
    ivttCover:
      FTest := TIvCoverTest.CreateValue(ReplaceChar);

    ivttMinimum:
      FTest := TIvMinimumTest.CreateValue(ReductionChar);

    ivttCodePage:
      case IvGetCharacterSetType(IvMakeLangId(GetTestPrimary, SUBLANG_NEUTRAL)) of
        ivcsSingleByte:
          FTest := TIvSingleByteTest.CreateValue(GetTestCodePage, FSingleByteOptions);

        ivcsMultiByte:
          FTest := TIvMultibyteTest.CreateValue(GetTestCodePage, FUseDoubleByteChars);

        ivcsBiDirectional:
          FTest := TIvBidirectionalTest.CreateValue(GetTestCodePage);
      end;
  end;
end;

function TIvTestDictionary.GetTestPrimary: Integer;
begin
  if FTestPrimary <> 0 then
    Result := FTestPrimary
  else
  begin
{$IFDEF WIN32}
    Result := IvGetPrimaryFromLocale(GetUserDefaultLCID);
    if Result = LANG_ENGLISH then
      Result := LANG_FINNISH;
{$ELSE}
    Result := LANG_FINNISH;
{$ENDIF}
  end;
end;

function TIvTestDictionary.GetTestLangId: Integer;
begin
  Result := IvMakeLangId(GetTestPrimary, SUBLANG_NEUTRAL);
end;

function TIvTestDictionary.GetTestCodePage: Integer;
begin
  Result := IvLangIdToCodePage(GetTestLangId);
end;

function TIvTestDictionary.GetLanguageCount: Integer;
begin
  Result := 3;
end;

procedure TIvTestDictionary.GetLanguageData(index: Integer; language: TIvLanguage);
begin
  { This dictionary supports English and Finnish }

  language.EnglishName := '';
  language.NativeName := '';

  case index of
    0:
    begin
      language.Primary := LANG_NEUTRAL;
      language.Options := [ivloPureASCII];
      language.Init;
{$IFNDEF WIN32}
      language.EnglishName := 'Native';
      language.NativeName := 'Native';
{$ENDIF}
    end;

    1:
    begin
      language.Primary := GetTestPrimary;
      language.Init;
      language.EnglishName := language.EnglishName + ' (Translated)';
{$IFNDEF WIN32}
      language.NativeName := 'Translated test';
{$ENDIF}
    end;

    2:
    begin
      language.Primary := GetTestPrimary;
      language.Init;
      language.EnglishName := language.EnglishName + ' (Native)';
{$IFNDEF WIN32}
      language.NativeName := 'Native test';
{$ENDIF}
    end;
  end;
end;

function TIvTestDictionary.GetLocaleCount: Integer;
begin
  Result := 0;
end;

procedure TIvTestDictionary.GetLocaleData(index: Integer; locale: TIvLocale);
begin
end;

function TIvTestDictionary.TranslateString(
  const str: String;
  var translation: String): Boolean;
begin
  if (ActiveLanguage = 1) and (str <> '-') then
  begin
    Init;
    translation := FTest.Translate(str);
  end
  else
    translation := str;
  Result := True;
end;

function TIvTestDictionary.TranslateContextString(
  const str, form, component: String;
  var translation: String): Boolean;
begin
  Result := TranslateString(str, translation);
end;

end.
