unit IvDBMult;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Classes, SysUtils, DB, DBTables,
  IvDictio, IvDatDic;

type
  EIvInvalidParameter = class(Exception);

  TIvDBDictionary = class(TIvCustomDatabaseDictionary)
  private
    FTable: TTable;

    function GetDatabaseName: String;
    procedure SetDatabaseName(value: String);

    function GetTableType: TTableType;
    procedure SetTableType(value: TTableType);

  protected
    function OpenTable(const tableName: String): TTable;

    function GetLanguageCount: Integer; override;
    procedure GetLanguageData(index: Integer; language: TIvLanguage); override;
    function GetLocaleCount: Integer; override;
    procedure GetLocaleData(index: Integer; locale: TIvLocale); override;

  public
    constructor Create(owner: TComponent); override;

    procedure Open; override;
    procedure Close; override;

    function TranslateString(
      const str: String;
      var translation: String): Boolean; override;
    function TranslateContextString(
      const str, form, component: String;
      var translation: String): Boolean; override;

    procedure GetLanguageDatas(list: TList); override;

    class function LanguageFromDataset(
      language: TIvLanguage;
      dataset: TDataset): Boolean;
    class function LocaleFromDataset(
      locale: TIvLocale;
      dataset: TDataset): Boolean;

    class function GetContextType(
      table: TTable;
      languageCount: Integer): TIvContextType;

  published
    property DatabaseName: String read GetDatabaseName write SetDatabaseName;
    property TableType: TTableType read GetTableType write SetTableType default ttDefault;
  end;

implementation

constructor TIvDBDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);
  FTable := TTable.Create(Self);
end;

class function TIvDBDictionary.GetContextType(
  table: TTable;
  languageCount: Integer): TIvContextType;
begin
  if table.FieldCount = languageCount + 1 then
    Result := [ivctForm]
  else if table.FieldCount > languageCount + 1 then
    Result := [ivctForm, ivctComponent]
  else
    Result := [];
end;

function TIvDBDictionary.GetDatabaseName: String;
begin
  Result := FTable.DatabaseName;
end;

procedure TIvDBDictionary.SetDatabaseName(value: String);
begin
  FTable.DatabaseName := value;
end;

function TIvDBDictionary.GetTableType: TTableType;
begin
  Result := FTable.TableType;
end;

procedure TIvDBDictionary.SetTableType(value: TTableType);
begin
  FTable.TableType := value;
end;

function TIvDBDictionary.OpenTable(const tableName: String): TTable;
begin
  Result := TTable.Create(nil);
  try
    Result.DatabaseName := DatabaseName;
    Result.TableName := tableName;
    Result.TableType := TableType;
    Result.Open;
  except
    Result.Free;
    raise;
  end;
end;

function TIvDBDictionary.GetLanguageCount: Integer;
var
  table: TTable;
begin
  table := OpenTable(LanguageTableName);
  try
    Result := table.RecordCount;
  finally
    table.Free;
  end;
end;

procedure TIvDBDictionary.GetLanguageData(index: Integer; language: TIvLanguage);
var
  i: Integer;
  table: TTable;
begin
  table := OpenTable(LanguageTableName);
  try
    for i := 0 to index - 1 do
      table.Next;
    LanguageFromDataset(language, table);
  finally
    table.Free;
  end;
end;

procedure TIvDBDictionary.GetLanguageDatas(list: TList);
var
  table: TTable;
  language: TIvLanguage;
begin
  table := OpenTable(LanguageTableName);
  try
    while not table.EOF do
    begin
      language := TIvLanguage.Create;
      LanguageFromDataset(language, table);
      list.Add(language);
      table.Next;
    end;
  finally
    table.Free;
  end;
end;

function TIvDBDictionary.GetLocaleCount: Integer;
var
  table: TTable;
begin
  if LocaleTableName = '' then
    Result := 0
  else
  begin
    table := OpenTable(LocaleTableName);
    try
      Result := table.RecordCount;
    finally
      table.Free;
    end;
  end;
end;

procedure TIvDBDictionary.GetLocaleData(index: Integer; locale: TIvLocale);
var
  table: TTable;
begin
  table := OpenTable(LocaleTableName);
  try
    table.MoveBy(index);
    LocaleFromDataset(locale, table);
  finally
    table.Free;
  end;
end;

function TIvDBDictionary.TranslateString(
  const str: String;
  var translation: String): Boolean;
begin
  Result := FTable.FindKey([str]);
  if Result then
  begin
    translation := FTable.Fields[GetFieldIndex(ActiveLanguage)].AsString;
    if (translation = '') and (SuperLanguage > 0) then
      translation := FTable.Fields[GetFieldIndex(SuperLanguage)].AsString;
  end;
end;

function TIvDBDictionary.TranslateContextString(
  const str, form, component: String;
  var translation: String): Boolean;
begin
  if ContextType = [] then
    Result := TranslateString(str, translation)
  else
  begin
    Result := FTable.FindKey([str, form, component]);
    if Result then
    begin
      translation := FTable.Fields[GetFieldIndex(ActiveLanguage)].AsString;
      if (translation = '') and (SuperLanguage > 0) then
        translation := FTable.Fields[GetFieldIndex(SuperLanguage)].AsString;
    end;
  end;
end;

procedure TIvDBDictionary.Open;
begin
  if IsOpen then
    Exit;

  { Open the translation table }

  FTable.TableName := TableName;
  if (TableType = ttParadox) or (CompareText(ExtractFileExt(FTable.TableName), '.DB') = 0) then
  begin
    { Paradox tables do not have the index name }

    FTable.IndexName := '';
  end
  else
  begin
    { All other names have the index name 'Native' }

    FTable.IndexName := INDEX_NAME_C;
  end;

  try
    FTable.Open;
  except
    { Might be a paradox table. Tries without the index name. }

    FTable.IndexName := '';
    FTable.Open;
  end;

  if FTable.IndexFieldCount = 0 then
  begin
    FTable.Close;
    raise EIvNoIndex.Create('No index on the translation table');
  end;

  FContextType := GetContextType(FTable, LanguageCount);

  inherited Open;
end;

procedure TIvDBDictionary.Close;
begin
  FTable.Close;
  inherited Close;
end;

class function TIvDBDictionary.LanguageFromDataset(
  language: TIvLanguage;
  dataset: TDataset): Boolean;
begin
  Result := False;

  language.Primary := dataset.Fields[LANGUAGE_PRIMARY_C].AsInteger;
  language.AllSubs := dataset.Fields[LANGUAGE_SUBS_C].AsString;
  language.DefaultSub := dataset.Fields[LANGUAGE_DEFAULT_SUB_C].AsInteger;

{$IFDEF WIN32}
  if dataset.FieldCount > LANGUAGE_CHARSET_C then
    language.Charset := dataset.Fields[LANGUAGE_CHARSET_C].AsInteger
  else
  begin
    language.Charset := 0;
    Result := True;
  end;
{$ENDIF}

  if dataset.FieldCount > LANGUAGE_CODE_PAGE_C then
    language.CodePage := dataset.Fields[LANGUAGE_CODE_PAGE_C].AsInteger
  else
  begin
    language.CodePage := 0;
    Result := True;
  end;

  language.EnglishName := dataset.Fields[LANGUAGE_ENGLISH_NAME_C].AsString;
  language.NativeName := dataset.Fields[LANGUAGE_NATIVE_NAME_C].AsString;

  if dataset.FieldCount > LANGUAGE_ISO_LANGUAGE_C then
    language.ISOLanguage := dataset.Fields[LANGUAGE_ISO_LANGUAGE_C].AsString
  else
  begin
    language.ISOLanguage := '';
    Result := True;
  end;

  if dataset.FieldCount > LANGUAGE_ISO_COUNTRIES_C then
    language.ISOAllCountries := dataset.Fields[LANGUAGE_ISO_COUNTRIES_C].AsString
  else
  begin
    language.ISOAllCountries := '';
    Result := True;
  end;

  if dataset.FieldCount > LANGUAGE_ISO_DEFAULT_COUNTRY_C then
    language.ISODefaultCountry := dataset.Fields[LANGUAGE_ISO_DEFAULT_COUNTRY_C].AsString
  else
  begin
    language.ISODefaultCountry := '';
    Result := True;
  end;

  if dataset.FieldCount > LANGUAGE_FONT_NAME_C then
    language.FontName := dataset.Fields[LANGUAGE_FONT_NAME_C].AsString
  else
  begin
    language.FontName := '';
    Result := True;
  end;

  if dataset.FieldCount > LANGUAGE_FONT_SIZE_C then
    language.FontSize := dataset.Fields[LANGUAGE_FONT_SIZE_C].AsInteger
  else
  begin
    language.FontSize := 0;
    Result := True;
  end;

  if dataset.FieldCount > LANGUAGE_OPTIONS_C then
    language.OptionsAsInt := dataset.Fields[LANGUAGE_OPTIONS_C].AsInteger;

  language.Init;
end;

class function TIvDBDictionary.LocaleFromDataset(
  locale: TIvLocale;
  dataset: TDataset): Boolean;
var
  i: Integer;

  function GetChar(index: Integer): Char;
  var
    str: String;
  begin
    str := dataset.Fields[index].AsString;
    if str = '' then
      Result := ' '
    else
      Result := str[1];
  end;

begin
  Result := False;

  locale.Primary := dataset.Fields[LOCALE_PRIMARY_C].AsInteger;
  locale.Sub := dataset.Fields[LOCALE_SUB_C].AsInteger;

{$IFDEF WIN32}
  if dataset.FieldCount > LOCALE_CHARSET_C then
    locale.Charset := dataset.Fields[LOCALE_CHARSET_C].AsInteger
  else
  begin
    locale.Charset := 0;
    Result := True;
  end;
{$ENDIF}

  locale.CodePage := dataset.Fields[LOCALE_CODEPAGE_C].AsInteger;

  if dataset.FieldCount > LOCALE_ISO_COUNTRY_C then
  begin
    locale.ISOLanguage := dataset.Fields[LOCALE_ISO_LANGUAGE_C].AsString;
    locale.ISOCountry := dataset.Fields[LOCALE_ISO_COUNTRY_C].AsString;
  end
  else
  begin
    locale.ISOLanguage := '';
    locale.ISOCountry := '';
    Result := True;
  end;

  if dataset.FieldCount > LOCALE_IS_CUSTOM_C then
    locale.IsCustom := dataset.Fields[LOCALE_IS_CUSTOM_C].AsInteger = 1
  else
  begin
    locale.IsCustom := False;
    Result := True;
  end;

  locale.EnglishLanguageName := dataset.Fields[LOCALE_ENGLISH_LANGUAGE_NAME_C].AsString;
  locale.EnglishCountryName := dataset.Fields[LOCALE_ENGLISH_COUNTRY_NAME_C].AsString;
  locale.NativeLanguageName := dataset.Fields[LOCALE_NATIVE_LANGUAGE_NAME_C].AsString;
  locale.NativeCountryName := dataset.Fields[LOCALE_NATIVE_COUNTRY_NAME_C].AsString;

  if dataset.FieldCount > LOCALE_WIN16_COUNTRY_NAME_C then
  begin
    locale.Win16LanguageName := dataset.Fields[LOCALE_WIN16_LANGUAGE_NAME_C].AsString;
    locale.Win16CountryName := dataset.Fields[LOCALE_WIN16_COUNTRY_NAME_C].AsString;
  end
  else
  begin
    locale.Win16LanguageName := '';
    locale.Win16CountryName := '';
    Result := True;
  end;

  locale.MeasurementSystem := TIvMeasurementSystem(dataset.Fields[LOCALE_MEASUREMENT_SYSTEM_C].AsInteger);
  locale.CurrencyString := dataset.Fields[LOCALE_CURRENCY_STRING_C].AsString;
  locale.CurrencyFormat := TIvCurrencyFormat(dataset.Fields[LOCALE_CURRENCY_FORMAT_C].AsInteger);
  locale.NegCurrFormat := TIvNegativeCurrencyFormat(dataset.Fields[LOCALE_NEG_CURR_FORMAT_C].AsInteger);
  locale.ThousandSeparator := GetChar(LOCALE_THOUSAND_SEPARATOR_C);
  locale.DecimalSeparator := GetChar(LOCALE_DECIMAL_SEPARATOR_C);
  locale.CurrencyDecimals := dataset.Fields[LOCALE_CURRENCY_DECIMALS_C].AsInteger;

  locale.DateSeparator := GetChar(LOCALE_DATE_SEPARATOR_C);
  locale.ShortDateFormat := dataset.Fields[LOCALE_SHORT_DATE_FORMAT_C].AsString;
  locale.LongDateFormat := dataset.Fields[LOCALE_LONG_DATE_FORMAT_C].AsString;

  locale.TimeSeparator := GetChar(LOCALE_TIME_SEPARATOR_C);
  locale.TimeAMString := dataset.Fields[LOCALE_TIME_AM_STRING_C].AsString;
  locale.TimePMString := dataset.Fields[LOCALE_TIME_PM_STRING_C].AsString;
  locale.TimeLeadingZeros := dataset.Fields[LOCALE_TIME_LEADING_ZEROS_C].AsInteger = 1;
  locale.TimeFormat := TIvTimeFormat(dataset.Fields[LOCALE_TIME_FORMAT_C].AsInteger);

  if dataset.FieldCount > LOCALE_TIME_MARK_POSITION_C then
    locale.TimeMarkPosition := TIvTimeMarkPosition(dataset.Fields[LOCALE_TIME_MARK_POSITION_C].AsInteger)
  else
  begin
    locale.TimeMarkPosition := ivtmSuffix;
    Result := True;
  end;

  locale.CalendarType := TIvCalendarType(dataset.Fields[LOCALE_CALENDAR_TYPE_C].AsInteger);
  locale.OptionalCalendarType := TIvCalendarType(dataset.Fields[LOCALE_OPTIONAL_CALENDAR_TYPE_C].AsInteger);
  locale.FirstDayOfWeek := TIvDayOfWeek(dataset.Fields[LOCALE_FIRST_DAY_OF_WEEK_C].AsInteger);
  locale.FirstWeekOfYear := TIvFirstWeekOfYear(dataset.Fields[LOCALE_FIRST_WEEK_OF_YEAR_C].AsInteger);

  for i := 1 to 12 do
  begin
    locale.ShortMonthNames[i] := dataset.Fields[LOCALE_SHORT_MONTH1_C + i - 1].AsString;
    locale.LongMonthNames[i] := dataset.Fields[LOCALE_LONG_MONTH1_C + i - 1].AsString;
  end;

  for i := 1 to 7 do
  begin
    locale.ShortDayNames[i] := dataset.Fields[LOCALE_SHORT_DAY1_C + i - 1].AsString;
    locale.LongDayNames[i] := dataset.Fields[LOCALE_LONG_DAY1_C + i - 1].AsString;
  end;

  locale.Init;
end;

end.

