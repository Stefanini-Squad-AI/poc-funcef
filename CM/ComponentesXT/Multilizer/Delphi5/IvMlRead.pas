unit IvMlRead;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils, Classes,
  IvParser, IvDictio, IvAMulti;

const
  LANGUAGES_VERSION_C = 2;
  TRANSLATIONS_VERSION_C = 2;
  LOCALES_VERSION_C = 2;

  LANGUAGES_C = 'Languages';
  LOCALES_C = 'Locales';
  TRANSLATIONS_C = 'Translations';

type
  TIvReader = class(TReader)
  protected
    procedure SkipSetBody;
    procedure SkipValue;
    procedure SkipProperty;
    procedure SkipComponentHeader;
    procedure SkipComponentBody;
    procedure SkipComponent;
{$IFNDEF WIN32}
    function ReadValue: TValueType;
{$ENDIF}
{$IFDEF WIN32}
    function ReadLongString: String;
{$ENDIF}

  public
    procedure FindPropertyData(const componentClass, componentName, propertyName: String);

    class procedure ReadLanguage(reader: TReader; language: TIvLanguage; version: Integer);
    class procedure WriteLanguage(writer: TWriter; language: TIvLanguage);

    class procedure ReadLocale(reader: TReader; locale: TIvLocale; version: Integer);
    class procedure WriteLocale(writer: TWriter; locale: TIvLocale);

    class function SkipLanguages(reader: TReader): Integer;
    class function SkipTranslations(reader: TReader; languageCount: Integer): Integer;
    class function SkipLocales(reader: TReader): Integer;

    class procedure GetLanguageData(
      const resName, className, name: String;
      index: Integer;
      language: TIvLanguage);

    class procedure GetLanguageDatas(
      const resName, className, name: String;
      languages: TList);

    class procedure DoGetLanguageDatas(reader: TReader; languages: TList);

    class procedure GetLocaleData(
      const resName, className, name: String;
      index: Integer;
      locale: TIvLocale);

    class procedure GetLocaleDatas(
      const resName, className, name: String;
      locales: TList);

    class procedure DoGetLocaleDatas(reader: TReader; locales: TList);

    class function LoadTranslation(
      const resName, className, name: String;
      language, superLanguage, languageCount: Integer;
      translations: TList): TIvContextType;

    class function DoLoadTranslation(
      reader: TReader;
      language, superLanguage, languageCount: Integer;
      translations: TList): TIvContextType;
  end;

implementation

var
  stream: TStream;
  reader: TIvReader;
{$IFNDEF WIN32}
  resInfo: THandle;
  handle: Integer;
{$ENDIF}

procedure OpenReader(const resName, className, name, dataName: String);
{$IFNDEF WIN32}
var
  buffer: array[0..255] of Char;
{$ENDIF}
begin
{$IFDEF WIN32}
  stream := TResourceStream.Create(HInstance, resName, RT_RCDATA);
{$ELSE}
  resInfo := FindResource(HInstance, StrPCopy(buffer, resName), RT_RCDATA);
  handle := AccessResource(HInstance, resInfo);
  stream := THandleStream.Create(handle);
{$ENDIF}
  try
    reader := TIvReader.Create(stream, 4096);
    try
      reader.FindPropertyData(className, name, dataName);
    except
      reader.Free;
      raise;
    end;
  except
    stream.Free;
{$IFNDEF WIN32}
    FileClose(handle);
{$ENDIF}
    raise;
  end;
end;

procedure CloseReader;
begin
  reader.Free;
  stream.Free;
{$IFNDEF WIN32}
  FileClose(handle);
{$ENDIF}
end;

procedure TIvReader.SkipSetBody;
begin
  while ReadStr <> '' do
  begin
  end;
end;

procedure TIvReader.SkipValue;

  procedure SkipList;
  begin
    while not EndOfList do
      SkipValue;
    ReadListEnd;
  end;

  procedure SkipBytes(Count: Longint);
  var
    Bytes: array[0..255] of Char;
  begin
    while Count > 0 do
      if Count > SizeOf(Bytes) then
      begin
        Read(Bytes, SizeOf(Bytes));
        Dec(Count, SizeOf(Bytes));
      end
      else
      begin
        Read(Bytes, Count);
        Count := 0;
      end;
  end;

  procedure SkipBinary;
  var
    Count: Longint;
  begin
    Read(Count, SizeOf(Count));
    SkipBytes(Count);
  end;

{$IFDEF WIN32}
  procedure SkipCollection;
  begin
    while not EndOfList do
    begin
      if NextValue in [vaInt8, vaInt16, vaInt32] then
        SkipValue;
      SkipBytes(1);
      while not EndOfList do
        SkipProperty;
      ReadListEnd;
    end;
    ReadListEnd;
  end;
{$ENDIF}

begin
  case ReadValue of
    vaNull: ;
    vaList: SkipList;
    vaInt8: SkipBytes(1);
    vaInt16: SkipBytes(2);
    vaInt32: SkipBytes(4);
    vaExtended: SkipBytes(SizeOf(Extended));
    vaString, vaIdent: ReadStr;
    vaFalse, vaTrue: ;
    vaBinary: SkipBinary;
    vaSet: SkipSetBody;
{$IFDEF WIN32}
    vaLString: ReadLongString;
    vaNil: ;
    vaCollection: SkipCollection;
{$ENDIF}
  end;
end;

{$IFDEF WIN32}
function TIvReader.ReadLongString: String;
var
  L: Integer;
begin
  Read(L, SizeOf(Integer));
  SetString(Result, PChar(nil), L);
  Read(Pointer(Result)^, L);
end;
{$ENDIF}

procedure TIvReader.SkipProperty;
var
  str: String;
begin
  str := ReadStr; { Skips property name }
  SkipValue;
end;

procedure TIvReader.SkipComponentHeader;
{$IFDEF WIN32}
var
  flags: TFilerFlags;
  position: Integer;
{$ENDIF}
begin
{$IFDEF WIN32}
  ReadPrefix(flags, position);
{$ENDIF}
  ReadStr;
  ReadStr;
end;

procedure TIvReader.SkipComponentBody;
begin
  while not EndOfList do
    SkipProperty;
  ReadListEnd;
  while not EndOfList do
    SkipComponent;
  ReadListEnd;
end;

procedure TIvReader.SkipComponent;
begin
  SkipComponentHeader;
  SkipComponentBody;
end;

{$IFNDEF WIN32}
function TIvReader.ReadValue: TValueType;
begin
  Read(Result, SizeOf(Result));
end;
{$ENDIF}

procedure TIvReader.FindPropertyData(const componentClass, componentName, propertyName: String);
var
{$IFDEF WIN32}
  flags: TFilerFlags;
  position: Integer;
{$ENDIF}
  compClass, compName, propName: String;
begin
  ReadSignature;
{$IFDEF WIN32}
  ReadPrefix(flags, position);
{$ENDIF}
  ReadStr;
  ReadStr;

  { Reads the properties }

  while not EndOfList do
    SkipProperty;
  ReadListEnd;

  { Reads the sub components }

  while not EndOfList do
  begin
{$IFDEF WIN32}
    ReadPrefix(flags, position);
{$ENDIF}
    compClass := ReadStr;
    compName := ReadStr;
    if (compClass <> componentClass) or (compName <> componentName) then
      SkipComponentBody
    else
    begin
      while not EndOfList do
      begin
        propName := ReadStr;
        if propName <> propertyName then
          SkipValue
        else
          Exit;
      end;
      raise EResNotFound.Create('Could not find the property');
    end;
  end;

  raise EResNotFound.Create('Could not find the property');
end;

class procedure TIvReader.ReadLanguage(reader: TReader; language: TIvLanguage; version: Integer);
begin
  reader.ReadListBegin;

  language.Primary := reader.ReadInteger;
  language.AllSubs := reader.ReadString;
  language.DefaultSub := reader.ReadInteger;
  if version >= 2 then
    {$IFDEF WIN32}language.Charset := {$ENDIF}reader.ReadInteger;
  language.CodePage := reader.ReadInteger;

  language.EnglishName := reader.ReadString;
  language.NativeName := reader.ReadString;
  language.FontName := reader.ReadString;
  language.FontSize := reader.ReadInteger;

  language.Options := [];
  if reader.ReadBoolean then
    language.Options := language.Options + [ivloTest];
  if reader.ReadBoolean then
    language.Options := language.Options + [ivloPureASCII];

  language.Init;

  reader.ReadListEnd;
end;

class procedure TIvReader.WriteLanguage(writer: TWriter; language: TIvLanguage);
begin
  writer.WriteListBegin;

  writer.WriteInteger(language.Primary);
  writer.WriteString(language.AllSubs);
  writer.WriteInteger(language.DefaultSub);
{$IFDEF WIN32}
  writer.WriteInteger(language.Charset);
{$ELSE}
  writer.WriteInteger(0);
{$ENDIF}
  writer.WriteInteger(language.CodePage);

  writer.WriteString(language.EnglishName);
  writer.WriteString(language.NativeName);
  writer.WriteString(language.FontName);
  writer.WriteInteger(language.FontSize);

  writer.WriteBoolean(ivloTest in language.Options);
  writer.WriteBoolean(ivloPureASCII in language.Options);

  writer.WriteListEnd;
end;

class procedure TIvReader.ReadLocale(reader: TReader; locale: TIvLocale; version: Integer);
var
  i: Integer;
begin
  reader.ReadListBegin;

  locale.Primary := reader.ReadInteger;
  locale.Sub := reader.ReadInteger;
  if version >= 2 then
    {$IFDEF WIN32}locale.Charset := {$ENDIF}reader.ReadInteger;
  locale.CodePage := reader.ReadInteger;
  locale.IsCustom := reader.ReadBoolean;

  locale.EnglishLanguageName := reader.ReadString;
  locale.EnglishCountryName := reader.ReadString;
  locale.NativeLanguageName := reader.ReadString;
  locale.NativeCountryName := reader.ReadString;
  locale.Win16LanguageName := reader.ReadString;
  locale.Win16CountryName := reader.ReadString;

  locale.MeasurementSystem := TIvMeasurementSystem(reader.ReadInteger);
  locale.CurrencyString := reader.ReadString;
  locale.CurrencyFormat := TIvCurrencyFormat(reader.ReadInteger);
  locale.NegCurrFormat := TIvNegativeCurrencyFormat(reader.ReadInteger);
  locale.CurrencyDecimals := reader.ReadInteger;
  locale.ThousandSeparator := reader.ReadChar;
  locale.DecimalSeparator := reader.ReadChar;

  locale.DateSeparator := reader.ReadChar;
  locale.ShortDateFormat := reader.ReadString;
  locale.LongDateFormat := reader.ReadString;

  locale.TimeSeparator := reader.ReadChar;
  locale.TimeAMString := reader.ReadString;
  locale.TimePMString := reader.ReadString;
  locale.TimeLeadingZeros := reader.ReadBoolean;
  locale.TimeFormat := TIvTimeFormat(reader.ReadInteger);
  locale.TimeMarkPosition := TIvTimeMarkPosition(reader.ReadInteger);

  locale.CalendarType := TIvCalendarType(reader.ReadInteger);
  locale.OptionalCalendarType := TIvCalendarType(reader.ReadInteger);
  locale.FirstDayOfWeek := TIvDayOfWeek(reader.ReadInteger);
  locale.FirstWeekOfYear := TIvFirstWeekOfYear(reader.ReadInteger);

  for i := 1 to 12 do
    locale.ShortMonthNames[i] := reader.ReadString;
  for i := 1 to 12 do
    locale.LongMonthNames[i] := reader.ReadString;
  for i := 1 to 7 do
    locale.ShortDayNames[i] := reader.ReadString;
  for i := 1 to 7 do
    locale.LongDayNames[i] := reader.ReadString;

  locale.Init;

  reader.ReadListEnd;
end;

class procedure TIvReader.WriteLocale(writer: TWriter; locale: TIvLocale);
var
  i: Integer;
begin
  writer.WriteListBegin;

  writer.WriteInteger(locale.Primary);
  writer.WriteInteger(locale.Sub);
{$IFDEF WIN32}
  writer.WriteInteger(locale.Charset);
{$ELSE}
  writer.WriteInteger(0);
{$ENDIF}
  writer.WriteInteger(locale.CodePage);
  writer.WriteBoolean(locale.IsCustom);

  writer.WriteString(locale.EnglishLanguageName);
  writer.WriteString(locale.EnglishCountryName);
  writer.WriteString(locale.NativeLanguageName);
  writer.WriteString(locale.NativeCountryName);
  writer.WriteString(locale.Win16LanguageName);
  writer.WriteString(locale.Win16CountryName);

  writer.WriteInteger(Integer(locale.MeasurementSystem));
  writer.WriteString(locale.CurrencyString);
  writer.WriteInteger(Integer(locale.CurrencyFormat));
  writer.WriteInteger(Integer(locale.NegCurrFormat));
  writer.WriteInteger(locale.CurrencyDecimals);
  writer.WriteChar(locale.ThousandSeparator);
  writer.WriteChar(locale.DecimalSeparator);

  writer.WriteChar(locale.DateSeparator);
  writer.WriteString(locale.ShortDateFormat);
  writer.WriteString(locale.LongDateFormat);

  writer.WriteChar(locale.TimeSeparator);
  writer.WriteString(locale.TimeAMString);
  writer.WriteString(locale.TimePMString);
  writer.WriteBoolean(locale.TimeLeadingZeros);
  writer.WriteInteger(Integer(locale.TimeFormat));
  writer.WriteInteger(Integer(locale.TimeMarkPosition));

  writer.WriteInteger(Integer(locale.CalendarType));
  writer.WriteInteger(Integer(locale.OptionalCalendarType));
  writer.WriteInteger(Integer(locale.FirstDayOfWeek));
  writer.WriteInteger(Integer(locale.FirstWeekOfYear));

  for i := 1 to 12 do
    writer.WriteString(locale.ShortMonthNames[i]);
  for i := 1 to 12 do
    writer.WriteString(locale.LongMonthNames[i]);
  for i := 1 to 7 do
    writer.WriteString(locale.ShortDayNames[i]);
  for i := 1 to 7 do
    writer.WriteString(locale.LongDayNames[i]);

  writer.WriteListEnd;
end;

class function TIvReader.SkipLanguages(reader: TReader): Integer;
var
  i, version: Integer;
  language: TIvLanguage;
begin
  reader.ReadListBegin;
  version := reader.ReadInteger;
  if version > LANGUAGES_VERSION_C then
    raise Exception.Create('Unknown language data version: ' + IntToStr(version));
  Result := reader.ReadInteger;
  for i := 0 to Result - 1 do
  begin
    language := TIvLanguage.Create;
    TIvReader.ReadLanguage(reader, language, version);
    language.Free;
  end;
  reader.ReadListEnd;
end;

class function TIvReader.SkipTranslations(reader: TReader; languageCount: Integer): Integer;
var
  i, j, version: Integer;
  format: TIvDictionaryFormat;
begin
  reader.ReadListBegin;
  version := reader.ReadInteger;
  if version > TRANSLATIONS_VERSION_C then
    raise Exception.Create('Unknown translation data version: ' + IntToStr(version));
  if version >= 2 then
    format := TIvDictionaryFormat(reader.ReadInteger)
  else
    format := ivdfFlat;
  Result := reader.ReadInteger;
  for i := 0 to Result - 1 do
  begin
    reader.ReadListBegin;
    for j := 0 to languageCount - 1 do
    begin
      reader.ReadString;
      if (j = 0) and (format = ivdfContext) then
      begin
        reader.ReadString;
        reader.ReadString;
      end;
    end;
    reader.ReadListEnd;
  end;
  reader.ReadListEnd;
end;

class function TIvReader.SkipLocales(reader: TReader): Integer;
var
  i, version: Integer;
  locale: TIvLocale;
begin
  reader.ReadListBegin;
  version := reader.ReadInteger;
  if version > LOCALES_VERSION_C then
    raise Exception.Create('Unknown locale data version: ' + IntToStr(version));
  Result := reader.ReadInteger;
  for i := 0 to Result - 1 do
  begin
    locale := TIvLocale.Create;
    TIvReader.ReadLocale(reader, locale, version);
    locale.Free;
  end;
  reader.ReadListEnd;
end;

class procedure TIvReader.GetLanguageData(
  const resName, className, name: String;
  index: Integer;
  language: TIvLanguage);
var
  i, version: Longint;
begin
  OpenReader(resName, className, name, LANGUAGES_C);
  try
    reader.ReadListBegin;
    version := reader.ReadInteger;
    if version > LANGUAGES_VERSION_C then
      raise Exception.Create('Unknown language data version: ' + IntToStr(version));
    reader.ReadInteger;
    for i := 0 to index do
      TIvReader.ReadLanguage(reader, language, version);
  finally
    CloseReader;
  end;
end;

class procedure TIvReader.GetLanguageDatas(
  const resName, className, name: String;
  languages: TList);
begin
  OpenReader(resName, className, name, LANGUAGES_C);
  try
    DoGetLanguageDatas(reader, languages);
  finally
    CloseReader;
  end;
end;

class procedure TIvReader.DoGetLanguageDatas(reader: TReader; languages: TList);
var
  i, version: Longint;
  language: TIvLanguage;
begin
  reader.ReadListBegin;
  version := reader.ReadInteger;
  if version > LANGUAGES_VERSION_C then
     raise Exception.Create('Unknown language data version: ' + IntToStr(version));
  for i := 0 to reader.ReadInteger - 1 do
  begin
     language := TIvLanguage.Create;
     TIvReader.ReadLanguage(reader, language, version);
     languages.Add(language)
  end;
  reader.ReadListEnd;
end;

class procedure TIvReader.GetLocaleData(
  const resName, className, name: String;
  index: Integer;
  locale: TIvLocale);
var
  i, version: Longint;
begin
  OpenReader(resName, className, name, LOCALES_C);
  try
    reader.ReadListBegin;
    version := reader.ReadInteger;
    if version > LOCALES_VERSION_C then
      raise Exception.Create('Unknown locale data version: ' + IntToStr(version));
    reader.ReadInteger;
    for i := 0 to index do
      TIvReader.ReadLocale(reader, locale, version);
  finally
    CloseReader;
  end;
end;

class procedure TIvReader.GetLocaleDatas(
  const resName, className, name: String;
  locales: TList);
begin
  OpenReader(resName, className, name, LOCALES_C);
  try
    DoGetLocaleDatas(reader, locales);
  finally
    CloseReader;
  end;
end;

class procedure TIvReader.DoGetLocaleDatas(reader: TReader; locales: TList);
var
  i, version: Longint;
  locale: TIvLocale;
begin
  reader.ReadListBegin;
  version := reader.ReadInteger;
  if version > LOCALES_VERSION_C then
     raise Exception.Create('Unknown locale data version: ' + IntToStr(version));
  for i := 0 to reader.ReadInteger - 1 do
  begin
     locale := TIvLocale.Create;
     TIvReader.ReadLocale(reader, locale, version);
     locales.Add(locale)
  end;
  reader.ReadListEnd;
end;

class function TIvReader.LoadTranslation(
  const resName, className, name: String;
  language, superLanguage, languageCount: Integer;
  translations: TList): TIvContextType;
begin
  OpenReader(resName, className, name, TRANSLATIONS_C);
  try
    Result := DoLoadTranslation(reader, language, superLanguage, languageCount, translations);
  finally
    CloseReader;
  end;
end;

class function TIvReader.DoLoadTranslation(
  reader: TReader;
  language, superLanguage, languageCount: Integer;
  translations: TList): TIvContextType;
var
  str, current, superCurrent: String;
  i, j, version: Longint;
  translation: TIvTranslation;
begin
  reader.ReadListBegin;
  version := reader.ReadInteger;
  if version > TRANSLATIONS_VERSION_C then
    raise Exception.Create('Unknown translation data version: ' + IntToStr(version));

  if version >= 2 then
    Result := TIvContext.ContextCodeToType(TIvContextCode(reader.ReadInteger))
  else
    Result := [];

  for i := 0 to reader.ReadInteger - 1 do
  begin
    reader.ReadListBegin;
    translation := TIvTranslation.Create;

    { Reads the native string and the optional context }

    translation.Str := reader.ReadString;
    if ivctForm in Result then
      translation.Form := reader.ReadString;
    if ivctComponent in Result then
      translation.Component := reader.ReadString;

    { Reads the current string and/or the super current string }

    current := '';
    superCurrent := '';
    for j := 1 to languageCount - 1 do
    begin
      str := reader.ReadString;
      if j = language then
        current := str
      else if j = superlanguage then
        superCurrent := str;
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

    if translation.Match = ivtmNone then
      translation.Free
    else
      translations.Add(translation);
      
    reader.ReadListEnd;
  end;
  reader.ReadListEnd;
end;

end.

