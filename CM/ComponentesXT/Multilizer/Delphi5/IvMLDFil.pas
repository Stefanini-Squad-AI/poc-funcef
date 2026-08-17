unit IvMLDFil;

{$I IVMULTI.INC}

{$A-} { Byte align }

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils, Classes,
  IvCommon, IvDictio, IvAMulti;

const
  MLD_EXTENSION_C = 'mld';
  MLD_TAG_C = 'MLD';
  MLD_VERSION_C = 3;
  CONTEXT_MLD_VERSION_C = 3;

type
{$IFNDEF WIN32}
  DWord = Longint;
{$ENDIF}

  EIvNotMLDFile = Exception;

  TIvMLDHeader = record
    tag: array[0..2] of Char;        { "MLD" }
    version: Byte;                   { version that this MLD uses }
    byteOrder: TIvByteOrder;         { 0 (big endian) or 1 (little endian) }
    characterSet: TIvCharacterSet;   { 0 (Unicode), 1 (Windows code page) or 2 (ISO code page) }
    context: TIvContextCode;         { 0 [], 1 [form+component], 2 [component], or 3 [form]) }
    reserved1: array[0..4] of Byte;  { must be zeros }
    languageCount: Word;
    languageOffset: DWord;
    translationCount: Word;
    translationOffset: DWord;
    localeCount: Word;
    localeOffset: DWord;
    infoSize: Word;
    infoOffset: DWord;
    reserved2: array[0..5] of Byte;  { must be zeros }
  end;

  TIvMLDFile = class(TObject)
  protected
    FNativeCodePage: Integer;
    FFreeStream: Boolean;
    FLanguage: TIvLanguage;
    FLocale: TIvLocale;
    FHeader: TIvMLDHeader;
    FStream: TStream;
    FBlockSize: Integer;

    function GetLanguageCount: Integer;
    function GetLanguage(index: Integer): TIvLanguage;

    function GetLocaleCount: Integer;
    function GetLocale(index: Integer): TIvLocale;

    function GetTranslationCount: Integer;

    function GetVersion: Integer;
    function GetByteOrder: TIvByteOrder;
    function GetCharacterSet: TIvCharacterSet;
    function GetContextCode: TIvContextCode;
    function GetContextType: TIvContextType;

    function ReadByte: Integer;
    function ReadBoolean: Boolean;
    function ReadDWord: Longint;
    function ReadChar(codePage: Integer): Char;

    function ReadChars(len, codePage: Integer): String;
    function ReadAnsiChars(len: Integer): String;
{$IFDEF WIN32}
    function ReadWideChars(len: Integer): TIvWideString;
{$ENDIF}

    function ReadString(codePage: Integer): String;

    procedure SkipBytes(size: Integer);

    procedure SetBlockSize;
    procedure MoveToBlockEnd;

    procedure ReadHeader;

  public
    constructor Create;
    destructor Destroy; override;

    procedure GoLanguageSection;
    procedure GoTranslationSection;
    procedure GoLocaleSection;
    procedure GoInfoSection;

    function IsOpen: Boolean;
    procedure Open;
    procedure OpenFile(const fileName: String);
    procedure Close;

    function GetCurrentLanguage: TIvLanguage;
    function GetCurrentLocale: TIvLocale;

    function GetAnsiNative: String;
{$IFDEF IVWIDE}
    function GetWideNative: String;
{$ENDIF}

    procedure GetAnsiKey(var str, form, component: String);
{$IFDEF IVWIDE}
    procedure GetWideKey(var str, form, component: WideString);
{$ENDIF}

    function GetAnsiString(language, superLanguage, codePage: Integer): String;
{$IFDEF IVWIDE}
    function GetWideString(language, superLanguage, codePage: Integer): WideString;
{$ENDIF}

    function GetTranslation(
      translation: TIvTranslation;
      language, superLanguage, codePage: Integer): TIvTranslationMatch;
    procedure GetTranslations(context: TIvContext; list: TStringList);

    procedure GetInfo(
      var description, owner: String;
      users: TStrings;
      var time: TDateTime);
    function GetDescription: String;
    function GetOwner: String;
    function GetUsers(users: TStrings): Integer;

    function ReadWord: Integer;
    function ReadAnsiString: String;
{$IFDEF WIN32}
    function ReadWideString: TIvWideString;
{$ENDIF}

    function UseFormContext: Boolean;
    function UseComponentContext: Boolean;

    property NativeCodePage: Integer read FNativeCodePage;
    property Stream: TStream read FStream write FStream;
    property ByteOrder: TIvByteOrder read GetByteOrder;
    property CharacterSet: TIvCharacterSet read GetCharacterSet;
    property ContextCode: TIvContextCode read GetContextCode;
    property ContextType: TIvContextType read GetContextType;
    property Version: Integer read GetVersion;
    property TranslationCount: Integer read GetTranslationCount;
    property LanguageCount: Integer read GetLanguageCount;
    property Languages[i: Integer]: TIvLanguage read GetLanguage;
    property LocaleCount: Integer read GetLocaleCount;
    property Locales[i: Integer]: TIvLocale read GetLocale;
  end;

  procedure IvChangeWordByteOrder(var value: Word);
  procedure IvChangeDWordByteOrder(var value: DWord);
{$IFDEF WIN32}
  procedure IvChangeStringByteOrder(var value: TIvWideString);
{$ENDIF}

implementation

{$IFNDEF WIN32}
const
  CP_ACP = 0;
{$ENDIF}

procedure IvChangeWordByteOrder(var value: Word);
begin
  value :=
    ((value and $00FF) shl 8) or
    ((value and $FF00) shr 8);
end;

procedure IvChangeDWordByteOrder(var value: DWord);
begin
  value :=
    ((value and $000000FF) shl 24) or
    ((value and $0000FF00) shl 8) or
    ((value and $00FF0000) shr 8) or
    ((value and $FF000000) shr 24);
end;

{$IFDEF WIN32}
procedure IvChangeStringByteOrder(var value: TIvWideString);
var
  i: Integer;
begin
{$IFDEF IVWIDE}
  for i := 1 to Length(value) do
{$ELSE}
  for i := 0 to SysStringLen(value) - 1 do
{$ENDIF}
    value[i] := WideChar(((Word(value[i]) and $00FF) shl 8) or ((Word(value[i]) and $FF00) shr 8));
end;
{$ENDIF}


{ TIvMLDFile }

constructor TIvMLDFile.Create;
begin
  inherited Create;
  FNativeCodePage := 0;
  FLanguage := TIvLanguage.Create;
  FLocale := TIvLocale.Create;
end;

destructor TIvMLDFile.Destroy;
begin
  FLanguage.Free;
  FLocale.Free;
  FStream.Free;
  inherited Destroy;
end;

function TIvMLDFile.GetVersion: Integer;
begin
  Result := FHeader.version;
end;

function TIvMLDFile.GetByteOrder: TIvByteOrder;
begin
  Result := FHeader.byteOrder;
end;

function TIvMLDFile.GetCharacterSet: TIvCharacterSet;
begin
  Result := FHeader.characterSet;
end;

function TIvMLDFile.UseFormContext: Boolean;
begin
  Result := (FHeader.context = ivccFull) or (FHeader.context = ivccForm);
end;

function TIvMLDFile.UseComponentContext: Boolean;
begin
  Result := (FHeader.context = ivccFull) or (FHeader.context = ivccComponent);
end;

function TIvMLDFile.GetContextCode: TIvContextCode;
begin
  Result := FHeader.context;
end;

function TIvMLDFile.GetContextType: TIvContextType;
begin
  Result := TIvContext.ContextCodeToType(FHeader.context);
end;

function TIvMLDFile.IsOpen: Boolean;
begin
  Result := FStream <> nil;
end;

procedure TIvMLDFile.Open;
begin
  ReadHeader;
end;

procedure TIvMLDFile.OpenFile(const fileName: String);
begin
  FStream := TFileStream.Create(fileName, fmOpenRead or fmShareDenyNone);
  FFreeStream := True;
  ReadHeader;
  FNativeCodePage := Languages[0].CodePage;
  GoLanguageSection;
end;

procedure TIvMLDFile.Close;
begin
  if FFreeStream then
    FStream.Free;
  FStream := nil;
end;

procedure TIvMLDFile.SetBlockSize;
begin
  if Version >= 3 then
    FBlockSize := ReadWord - Sizeof(Word);
end;

procedure TIvMLDFile.MoveToBlockEnd;
begin
  if (Version >= 3) and (FBlockSize > 0) then
    SkipBytes(FBlockSize);
end;

procedure TIvMLDFile.SkipBytes(size: Integer);
begin
  FStream.Seek(size, soFromCurrent);
end;

function TIvMLDFile.ReadByte: Integer;
var
  b: Byte;
begin
  FStream.ReadBuffer(b, Sizeof(b));
  Dec(FBlockSize, Sizeof(b));
  Result := b;
end;

function TIvMLDFile.ReadBoolean: Boolean;
begin
  Result := Boolean(ReadByte);
end;

function TIvMLDFile.ReadWord: Integer;
var
  w: Word;
begin
  FStream.ReadBuffer(w, Sizeof(w));
  Dec(FBlockSize, Sizeof(w));
  if ByteOrder = ivboBigEndian then
    IvChangeWordByteOrder(w);
  Result := w;
end;

function TIvMLDFile.ReadDWord: Longint;
var
  dw: DWord;
begin
  FStream.ReadBuffer(dw, Sizeof(dw));
  Dec(FBlockSize, Sizeof(dw));
  if ByteOrder = ivboBigEndian then
    IvChangeDWordByteOrder(dw);
  Result := dw;
end;

function TIvMLDFile.ReadChar(codePage: Integer): Char;
begin
  Result := ReadChars(1, codePage)[1];
end;

{ ReadXXXChars }

function TIvMLDFile.ReadChars(len, codePage: Integer): String;
begin
{$IFDEF WIN32}
  SetLength(Result, len);
{$ELSE}
  Result[0] := Chr(len);
{$ENDIF}

{$IFDEF WIN32}
  if CharacterSet = ivcsUnicode then
    Result := IvWStrToStr(ReadWideChars(len), codePage)
  else
{$ENDIF}
    Result := ReadAnsiChars(len);
end;

function TIvMLDFile.ReadAnsiChars(len: Integer): String;
begin
{$IFDEF WIN32}
  SetLength(Result, len);
{$ELSE}
  Result[0] := Chr(len);
{$ENDIF}

  if len > 0 then
  begin
    FStream.ReadBuffer(Result[1], len);
    Dec(FBlockSize, len);
  end;
end;

{$IFDEF WIN32}
function TIvMLDFile.ReadWideChars(len: Integer): TIvWideString;
begin
{$IFDEF IVWIDE}
  SetLength(Result, len);
{$ELSE}
  Result := SysAllocStringLen(nil, len + 1);
{$ENDIF}

  if len > 0 then
  begin
    FStream.ReadBuffer(Result[1], 2*len);
    Dec(FBlockSize, 2*len);
    if ByteOrder = ivboBigEndian then
      IvChangeStringByteOrder(Result);
  end;

{$IFNDEF IVWIDE}
  Result[len] := Chr(0);
{$ENDIF}
end;
{$ENDIF}

{ ReadXXXString }

function TIvMLDFile.ReadString(codePage: Integer): String;
begin
{$IFDEF WIN32}
  if CharacterSet = ivcsUnicode then
    Result := IvWStrToStr(ReadWideString, codePage)
  else
{$ENDIF}
    Result := ReadAnsiString;
end;

function TIvMLDFile.ReadAnsiString: String;
{$IFNDEF WIN32}
const
  MAX_LEN = 255;
var
  len, thisLen: Word;
  str: String;
{$ENDIF}
begin
{$IFDEF WIN32}
  Result := ReadAnsiChars(ReadWord);
{$ELSE}
  { The maximum string length in Delphi 1 is 255. If the string in the
    dictionary is greater than 255, only the first 255 strings are used. }

  len := ReadWord;
  if len <= MAX_LEN then
    Result := ReadAnsiChars(len)
  else
  begin
    Result := '';
    while len > 0 do
    begin
      if len > MAX_LEN then
        thisLen := MAX_LEN
      else
        thisLen := len;
      Dec(len, thisLen);
      str := ReadAnsiChars(thisLen);
      if Result = '' then
        Result := str;
    end;
  end;
{$ENDIF}
end;

{$IFDEF WIN32}
function TIvMLDFile.ReadWideString: TIvWideString;
begin
  Result := ReadWideChars(ReadWord);
end;
{$ENDIF}

procedure TIvMLDFile.GoLanguageSection;
begin
  if FHeader.languageOffset = 0 then
    raise Exception.Create('Invalid language offset');

  FStream.Seek(FHeader.languageOffset, soFromBeginning);
end;

procedure TIvMLDFile.GoTranslationSection;
begin
  if FHeader.translationOffset = 0 then
    raise Exception.Create('Invalid translation offset');

  FStream.Seek(FHeader.translationOffset, soFromBeginning);
end;

procedure TIvMLDFile.GoLocaleSection;
begin
  if FHeader.localeCount = 0 then
    raise Exception.Create('No custom locales');
  if FHeader.localeOffset = 0 then
    raise Exception.Create('Invalid locale offset');

  FStream.Seek(FHeader.localeOffset, soFromBeginning);
end;

procedure TIvMLDFile.GoInfoSection;
begin
  if FHeader.infoOffset = 0 then
  begin
    FStream.Seek(0, soFromEnd);
    FHeader.infoOffset := FStream.Position;
  end
  else
    FStream.Seek(FHeader.infoOffset, soFromBeginning);
end;

function TIvMLDFile.GetLanguageCount: Integer;
begin
  Result := FHeader.languageCount;
end;

function TIvMLDFile.GetLanguage(index: Integer): TIvLanguage;
var
  i: Integer;
begin
  Result := nil;
  GoLanguageSection;
  for i := 0 to index do
    Result := GetCurrentLanguage;
end;

function TIvMLDFile.GetLocaleCount: Integer;
begin
  Result := FHeader.localeCount;
end;

function TIvMLDFile.GetLocale(index: Integer): TIvLocale;
var
  i: Integer;
begin
  Result := nil;
  GoLocaleSection;
  for i := 0 to index do
    Result := GetCurrentLocale;
end;

function TIvMLDFile.GetTranslationCount: Integer;
begin
  Result := FHeader.translationCount;
end;

function TIvMLDFile.GetCurrentLanguage: TIvLanguage;
begin
  SetBlockSize;

  FLanguage.Primary := ReadWord;
  if Version >= 2 then
    FLanguage.ISOLanguage := ReadChars(2, CP_ACP)
  else
    FLanguage.ISOLanguage := '';

  FLanguage.DefaultSub := ReadWord;
  if Version >= 2 then
    FLanguage.ISODefaultCountry := ReadChars(2, CP_ACP)
  else
    FLanguage.ISODefaultCountry := '';

  FLanguage.AllSubs := ReadString(CP_ACP);
  if Version >= 2 then
    FLanguage.ISOAllCountries := ReadString(CP_ACP)
  else
    FLanguage.ISOAllCountries := '';

  if Version >= 3 then
{$IFDEF WIN32}
    FLanguage.Charset := ReadWord
  else
    FLanguage.Charset := 0;
{$ELSE}
    ReadWord;
{$ENDIF}

  FLanguage.CodePage := ReadWord;
  FLanguage.OptionsAsInt := ReadByte;

  FLanguage.EnglishName := ReadString(CP_ACP);
  FLanguage.NativeName := ReadString(FLanguage.CodePage);
  FLanguage.FontName := ReadString(CP_ACP);
  FLanguage.FontSize := ReadByte;

  MoveToBlockEnd;

  FLanguage.Init;
  Result := FLanguage;
end;

function TIvMLDFile.GetCurrentLocale: TIvLocale;
var
  i: Integer;
begin
  SetBlockSize;

  FLocale.Primary := ReadWord;
  if Version >= 2 then
    FLocale.ISOLanguage := ReadChars(2, CP_ACP)
  else
    FLocale.ISOLanguage := '';

  FLocale.Sub := ReadWord;
  if Version >= 2 then
    FLocale.ISOCountry := ReadChars(2, CP_ACP)
  else
    FLocale.ISOCountry := '';

  if Version >= 3 then
{$IFDEF WIN32}
    FLocale.Charset := ReadWord
  else
    FLocale.Charset := 0;
{$ELSE}
    ReadWord;
{$ENDIF}

  FLocale.CodePage := ReadWord;
  FLocale.IsCustom := ReadBoolean;

  FLocale.EnglishLanguageName := ReadString(CP_ACP);
  FLocale.EnglishCountryName := ReadString(CP_ACP);
  FLocale.NativeLanguageName := ReadString(FLocale.CodePage);
  FLocale.NativeCountryName := ReadString(FLocale.CodePage);
  FLocale.Win16LanguageName := ReadString(CP_ACP);
  FLocale.Win16CountryName := ReadString(CP_ACP);

  FLocale.MeasurementSystem := TIvMeasurementSystem(ReadByte);
  FLocale.CurrencyString := ReadString(FLocale.CodePage);
  FLocale.CurrencyFormat := TIvCurrencyFormat(ReadByte);
  FLocale.NegCurrFormat := TIvNegativeCurrencyFormat(ReadByte);
  FLocale.CurrencyDecimals := ReadByte;
  FLocale.ThousandSeparator := ReadChar(FLocale.CodePage);
  FLocale.DecimalSeparator := ReadChar(FLocale.CodePage);

  FLocale.DateSeparator := ReadChar(FLocale.CodePage);
  FLocale.ShortDateFormat := ReadString(FLocale.CodePage);
  FLocale.LongDateFormat := ReadString(FLocale.CodePage);

  FLocale.TimeSeparator := ReadChar(FLocale.CodePage);
  FLocale.TimeAMString := ReadString(FLocale.CodePage);
  FLocale.TimePMString := ReadString(FLocale.CodePage);
  FLocale.TimeLeadingZeros := ReadBoolean;
  FLocale.TimeFormat := TIvTimeFormat(ReadByte);
  FLocale.TimeMarkPosition := TIvTimeMarkPosition(ReadByte);

  FLocale.CalendarType := TIvCalendarType(ReadByte);
  FLocale.OptionalCalendarType := TIvCalendarType(ReadByte);
  FLocale.FirstDayOfWeek := TIvDayOfWeek(ReadByte);
  FLocale.FirstWeekOfYear := TIvFirstWeekOfYear(ReadByte);

  for i := 1 to 12 do
    FLocale.ShortMonthNames[i] := ReadString(FLocale.CodePage);
  for i := 1 to 12 do
    FLocale.LongMonthNames[i] := ReadString(FLocale.CodePage);
  for i := 1 to 7 do
    FLocale.ShortDayNames[i] := ReadString(FLocale.CodePage);
  for i := 1 to 7 do
    FLocale.LongDayNames[i] := ReadString(FLocale.CodePage);

  MoveToBlockEnd;

  Result := FLocale;
end;

function TIvMLDFile.GetAnsiNative: String;
var
  form, component: String;
begin
  GetAnsiKey(Result, form, component);
end;

{$IFDEF IVWIDE}
function TIvMLDFile.GetWideNative: String;
begin
end;
{$ENDIF}

procedure TIvMLDFile.GetAnsiKey(var str, form, component: String);
var
  i: Integer;
{$IFDEF IVWIDE}
  wideStr, wideForm, wideComponent: WideString;
{$ENDIF}
begin
{$IFDEF IVWIDE}
  if CharacterSet = ivcsUnicode then
  begin
    GetWideKey(wideStr, wideForm, wideComponent);
    str := IvWStrToStr(wideStr, FNativeCodePage);
    form := IvWStrToStr(wideForm, FNativeCodePage);
    component := IvWStrToStr(wideComponent, FNativeCodePage);
  end
  else
{$ENDIF}
  begin
    str := ReadString(FNativeCodePage);

    if UseFormContext then
      form := ReadString(FNativeCodePage)
    else
      form := '';

    if UseComponentContext then
      component := ReadString(FNativeCodePage)
    else
      component := '';

    for i := 1 to LanguageCount - 1 do
      ReadString(CP_ACP);
  end;
end;

{$IFDEF IVWIDE}
procedure TIvMLDFile.GetWideKey(var str, form, component: WideString);
var
  i: Integer;
  ansiStr, ansiForm, ansiComponent: String;
begin
  if CharacterSet = ivcsUnicode then
  begin
    str := ReadWideString;

    if UseFormContext then
      form := ReadWideString
    else
      form := '';

    if UseComponentContext then
      component := ReadWideString
    else
      component := '';

    for i := 1 to LanguageCount - 1 do
      ReadWideString;
  end
  else
  begin
    GetAnsiKey(ansiStr, ansiForm, ansiComponent);
    str := IvStrToWStr(ansiStr, FNativeCodePage);
    form := IvStrToWStr(ansiForm, FNativeCodePage);
    component := IvStrToWStr(ansiComponent, FNativeCodePage);
  end;
end;
{$ENDIF}

function TIvMLDFile.GetAnsiString(language, superLanguage, codePage: Integer): String;
var
  i, count: Integer;
  str, superStr: String;
{$IFDEF IVWIDE}
  wide: WideString;
{$ENDIF}
begin
{$IFDEF IVWIDE}
  if CharacterSet = ivcsUnicode then
  begin
    wide := GetWideString(language, superLanguage, codePage);
    Result := IvWStrToStr(wide, codePage);
  end
  else
{$ENDIF}
  begin
    count := MaxInteger(language, superLanguage);
    for i := 0 to count do
    begin
      str := ReadAnsiString;
      if i = language then
        Result := str
      else if i = superLanguage then
        superStr := str;

      if i = 0 then
      begin
        if UseFormContext then
          ReadAnsiString;

        if UseComponentContext then
          ReadAnsiString;
      end;
    end;

    if (Result = '') and (superStr <> '') then
      Result := superStr;
  end;
end;

{$IFDEF IVWIDE}
function TIvMLDFile.GetWideString(language, superLanguage, codePage: Integer): WideString;
var
  i, count: Integer;
  ansi: String;
  str, superStr: WideString;
begin
  if CharacterSet = ivcsUnicode then
  begin
    count := MaxInteger(language, superLanguage);
    for i := 0 to count do
    begin
      str := ReadWideString;
      if i = language then
        Result := str
      else if i = superLanguage then
        superStr := str;

      if i = 0 then
      begin
        if UseFormContext then
          ReadWideString;

        if UseComponentContext then
          ReadWideString;
      end;
    end;

    if (Result = '') and (superStr <> '') then
      Result := superStr;
  end
  else
  begin
    ansi := GetAnsiString(language, superLanguage, codePage);
    Result := IvStrToWStr(ansi, codePage);
  end;
end;
{$ENDIF}

function TIvMLDFile.GetTranslation(
  translation: TIvTranslation;
  language, superLanguage, codePage: Integer): TIvTranslationMatch;
var
  i: Integer;
  current, superCurrent: String;
begin
  { Reads the native string and the optional context }

  translation.Str := ReadString(CP_ACP);

  if UseFormContext then
    translation.Form := ReadString(CP_ACP)
  else
    translation.Form := '';

  if UseComponentContext then
    translation.Component := ReadString(CP_ACP)
  else
    translation.Component := '';

  { Reads the current string and/or the super current string }

  current := '';
  superCurrent := '';
  for i := 1 to LanguageCount - 1 do
  begin
    if i = language then
      current := ReadString(codePage)
    else if i = superLanguage then
      superCurrent := ReadString(codePage)
    else
      ReadString(CP_ACP);
  end;

  { Assigns the translation }

  if current <> '' then
  begin
    translation.Current := current;
    translation.Match := ivtmNormal;
  end
  else if superCurrent <> '' then
  begin
    translation.Current := superCurrent;
    translation.Match := ivtmSuper;
  end
  else
    translation.Match := ivtmNone;

  Result := translation.Match;
end;

procedure TIvMLDFile.GetTranslations(context: TIvContext; list: TStringList);
var
  i: Integer;
begin
  context.Clear;
  for i := 0 to FHeader.languageCount - 1 do
  begin
    list.Add(ReadAnsiString);
    if i = 0 then
    begin
      if UseFormContext then
        context.Form := ReadAnsiString;

      if UseComponentContext then
        context.Component := ReadAnsiString;
    end;
  end;
end;

procedure TIvMLDFile.GetInfo(
  var description, owner: String;
  users: TStrings;
  var time: TDateTime);
var
  i, count: Integer;
  year, month, day, hour, min, sec: Word;
  str: String;
begin
  if Version = 1 then
  begin
    description := '';
    owner := '';
  end
  else if FHeader.infoOffset > 0 then
  begin
    GoInfoSection;
    description := ReadString(CP_ACP);
    owner := ReadString(CP_ACP);
    count := ReadWord;
    for i := 0 to count - 1 do
    begin
      str := ReadString(CP_ACP);
      if users <> nil then
        users.Add(str);
    end;

    if Version >= 3 then
    begin
      day := ReadByte;
      month := ReadByte;
      year := ReadWord;

      hour := ReadByte;
      min := ReadByte;
      sec := ReadByte;

      time := EncodeDate(year, month, day) + EncodeTime(hour, min, sec, 0);
    end;
  end;
end;

function TIvMLDFile.GetDescription: String;
begin
  if FHeader.infoOffset > 0 then
  begin
    GoInfoSection;
    Result := ReadString(CP_ACP);
  end
  else
    Result := '';
end;

function TIvMLDFile.GetOwner: String;
begin
  if FHeader.infoOffset > 0 then
  begin
    GoInfoSection;
    ReadString(CP_ACP);
    Result := ReadString(CP_ACP);
  end
  else
    Result := '';
end;

function TIvMLDFile.GetUsers(users: TStrings): Integer;
var
  i: Integer;
begin
  if FHeader.infoOffset > 0 then
  begin
    GoInfoSection;
    ReadString(CP_ACP);
    ReadString(CP_ACP);
    Result := ReadWord;
    for i := 0 to Result - 1 do
      users.Add(ReadString(CP_ACP));
  end
  else
    Result := 0;    
end;

procedure TIvMLDFile.ReadHeader;
begin
  FStream.Seek(0, soFromBeginning);
  FStream.ReadBuffer(FHeader, Sizeof(FHeader));
  if FHeader.tag <> MLD_TAG_C then
    raise EIvNotMLDFile.Create('The stream is not a valid MLD stream');

  if FHeader.version = 1 then
  begin
    FHeader.characterSet := TIvCharacterSet(FHeader.reserved1[0]);
    FHeader.reserved1[0] := 0;
    FHeader.infoSize := 0;
    FHeader.infoOffset := 0;
  end;

  if FHeader.ByteOrder = ivboBigEndian then
  begin
    IvChangeWordByteOrder(FHeader.languageCount);
    IvChangeDWordByteOrder(FHeader.languageOffset);
    IvChangeWordByteOrder(FHeader.translationCount);
    IvChangeDWordByteOrder(FHeader.translationOffset);
    IvChangeWordByteOrder(FHeader.localeCount);
    IvChangeDWordByteOrder(FHeader.localeOffset);
    IvChangeWordByteOrder(FHeader.infoSize);
    IvChangeDWordByteOrder(FHeader.infoOffset);
  end;
end;

end.
