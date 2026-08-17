unit IvODBCDic;

interface

uses
  Classes,
  IvDictio, IvDatDic, IvConnection;

type
  TIvODBCDictionary = class(TIvCustomDatabaseDictionary)
  private
    FConnection: TIvConnection;

    function GetDataSource: String;
    procedure SetDataSource(const value: String);

    function GetUserName: String;
    procedure SetUserName(const value: String);

    function GetPassword: String;
    procedure SetPassword(const value: String);

  protected
    function GetLanguageCount: Integer; override;
    procedure GetLanguageData(i: Integer; language: TIvLanguage); override;
    function GetLocaleCount: Integer; override;
    procedure GetLocaleData(index: Integer; locale: TIvLocale); override;

  public
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;

    procedure Open; override;
    procedure Close; override;

    function TranslateString(
      const str: String;
      var translation: String): Boolean; override;
    function TranslateContextString(
      const str, form, component: String;
      var translation: String): Boolean; override;

    procedure GetLanguageDatas(list: TList); override;

    class function SQLStr(const value: String): String;
    class function GetResultsetCount(resultset: TIvResultset): Integer;

    class function LanguageFromResultSet(language: TIvLanguage; resultSet: TIvResultSet): Boolean;
    class function LocaleFromResultSet(locale: TIvLocale; resultSet: TIvResultSet): Boolean;

    class function GetContextType(
      resultSet: TIvResultSet;
      languageCount: Integer): TIvContextType;

    property Connection: TIvConnection read FConnection;

  published
    property DataSource: String read GetDataSource write SetDataSource;
    property UserName: String read GetUserName write SetUserName;
    property Password: String read GetPassword write SetPassword;
  end;

implementation

uses
  SysUtils;

constructor TIvODBCDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);
  FConnection := TIvConnection.Create;
end;

destructor TIvODBCDictionary.Destroy;
begin
  FConnection.Free;
  inherited Destroy;
end;

class function TIvODBCDictionary.GetContextType(
  resultSet: TIvResultSet;
  languageCount: Integer): TIvContextType;
begin
  if resultSet.ColumnCount = languageCount + 1 then
    Result := [ivctForm]
  else if resultSet.ColumnCount > languageCount + 1 then
    Result := [ivctForm, ivctComponent]
  else
    Result := [];
end;

function TIvODBCDictionary.GetDataSource: String;
begin
  Result := FConnection.DataSource;
end;

procedure TIvODBCDictionary.SetDataSource(const value: String);
begin
  FConnection.DataSource := value;
end;

function TIvODBCDictionary.GetUserName: String;
begin
  Result := FConnection.UserName;
end;

procedure TIvODBCDictionary.SetUserName(const value: String);
begin
  FConnection.UserName := value;
end;

function TIvODBCDictionary.GetPassword: String;
begin
  Result := FConnection.Password;
end;

procedure TIvODBCDictionary.SetPassword(const value: String);
begin
  FConnection.Password := value;
end;

procedure TIvODBCDictionary.Open;
var
  resultSet: TIvResultset;
begin
  if IsOpen then
    Exit;

  FConnection.Open;

  resultSet := FConnection.CreateResultSet;
  try
    resultSet.ExecuteDirect('SELECT * FROM ' + TableName);
    resultSet.Next;
    FContextType := GetContextType(resultSet, LanguageCount);
  finally
    resultSet.Free;
  end;

  inherited Open;
end;

procedure TIvODBCDictionary.Close;
begin
  if FConnection <> nil then
    FConnection.Close;
  inherited Close;
end;

function TIvODBCDictionary.GetLanguageCount: Integer;
var
  resultSet: TIvResultset;
begin
  Result := 0;
  resultSet := FConnection.CreateResultSet;
  try
    resultSet.ExecuteDirect('SELECT * FROM ' + LanguageTableName);
    while resultSet.Next do
      Inc(Result);
  finally
    resultSet.Free;
  end;
end;

procedure TIvODBCDictionary.GetLanguageData(i: Integer; language: TIvLanguage);
var
  j: Integer;
  resultSet: TIvResultset;
begin
  resultSet := FConnection.CreateResultSet;
  try
    resultSet.ExecuteDirect('SELECT * FROM ' + LanguageTableName);
    for j := 0 to i do
      resultSet.Next;
    LanguageFromResultset(language, resultSet);
  finally
    resultSet.Free;
  end;
end;

procedure TIvODBCDictionary.GetLanguageDatas(list: TList);
var
  resultSet: TIvResultset;
  language: TIvLanguage;
begin
  resultSet := FConnection.CreateResultSet;
  try
    resultSet.ExecuteDirect('SELECT * FROM ' + LanguageTableName);
    while resultSet.Next do
    begin
      language := TIvLanguage.Create;
      LanguageFromResultset(language, resultSet);
      list.Add(language);
    end;
  finally
    resultSet.Free;
  end;
end;

function TIvODBCDictionary.GetLocaleCount: Integer;
var
  resultSet: TIvResultset;
begin
  Result := 0;
  if LocaleTableName = '' then
    Exit;

  resultSet := FConnection.CreateResultSet;
  try
    resultSet.ExecuteDirect('SELECT * FROM ' + LocaleTableName);
    while resultSet.Next do
      Inc(Result);
  finally
    resultSet.Free;
  end;
end;

procedure TIvODBCDictionary.GetLocaleData(index: Integer; locale: TIvLocale);
var
  i: Integer;
  resultSet: TIvResultset;
begin
  resultSet := FConnection.CreateResultSet;
  try
    resultSet.ExecuteDirect('SELECT * FROM ' + LocaleTableName);
    for i := 0 to index do
      resultSet.Next;
    LocaleFromResultset(locale, resultSet);
  finally
    resultSet.Free;
  end;
end;

function TIvODBCDictionary.TranslateString(
  const str: String;
  var translation: String): Boolean;
var
  statement: String;
  resultset: TIvResultset;
begin
  resultset := FConnection.CreateResultSet;
  try
    statement := 'SELECT * FROM ' + TableName + ' WHERE Native = ''' + SQLStr(str) + '''';
    resultset.ExecuteDirect(statement);
    Result := resultset.Next;
    if Result then
    begin
      translation := resultSet.Columns[GetFieldIndex(ActiveLanguage)].AsString;
      if (translation = '') and (SuperLanguage > 0) then
        translation := resultSet.Columns[GetFieldIndex(SuperLanguage)].AsString;
    end;
  finally
    resultset.Free;
  end;
end;

function TIvODBCDictionary.TranslateContextString(
  const str, form, component: String;
  var translation: String): Boolean;
var
  statement: String;
  resultset: TIvResultset;
begin
  if ContextType = [] then
    Result := TranslateString(str, translation)
  else
  begin
    resultset := FConnection.CreateResultSet;
    try
      statement := 'SELECT * FROM ' + TableName +
        ' WHERE Native = ''' + SQLStr(str) + '''' +
        ' AND Form = ''' + form + ''' AND Component = ''' + component + '''';
      resultset.ExecuteDirect(statement);
      Result := resultset.Next;
      if Result then
      begin
        translation := resultSet.Columns[GetFieldIndex(ActiveLanguage)].AsString;
        if (translation = '') and (SuperLanguage > 0) then
          translation := resultSet.Columns[GetFieldIndex(SuperLanguage)].AsString;
      end;
    finally
      resultset.Free;
    end;
  end;
end;

class function TIvODBCDictionary.SQLStr(const value: String): String;
var
  i: Integer;
begin
  if Pos('''', value) = 0 then
    Result := value
  else
  begin
    Result := '';
    for i := 1 to Length(value) do
    begin
      Result := Result + value[i];
      if value[i] = '''' then
        Result := Result + '''';
    end;    
  end;
end;

class function TIvODBCDictionary.GetResultsetCount(resultset: TIvResultset): Integer;
begin
  Result := 0;
  while resultset.Next do
    Inc(Result);
end;

class function TIvODBCDictionary.LanguageFromResultSet(
  language: TIvLanguage;
  resultSet: TIvResultSet): Boolean;
begin
  Result := False;

  language.EnglishName := resultSet.Columns[LANGUAGE_ENGLISH_NAME_C].AsString;
  language.NativeName := resultSet.Columns[LANGUAGE_NATIVE_NAME_C].AsString;

  language.Primary := resultSet.Columns[LANGUAGE_PRIMARY_C].AsInteger;
  language.AllSubs := resultSet.Columns[LANGUAGE_SUBS_C].AsString;
  language.DefaultSub := resultSet.Columns[LANGUAGE_DEFAULT_SUB_C].AsInteger;

  if resultSet.ColumnCount > LANGUAGE_CHARSET_C then
    language.Charset := resultSet.Columns[LANGUAGE_CHARSET_C].AsInteger
  else
  begin
    language.Charset := 0;
    Result := True;
  end;
  language.CodePage := resultSet.Columns[LANGUAGE_CODE_PAGE_C].AsInteger;

  language.ISOLanguage := resultSet.Columns[LANGUAGE_ISO_LANGUAGE_C].AsString;
  language.ISOAllCountries := resultSet.Columns[LANGUAGE_ISO_COUNTRIES_C].AsString;
  language.ISODefaultCountry := resultSet.Columns[LANGUAGE_ISO_DEFAULT_COUNTRY_C].AsString;

  language.FontName := resultSet.Columns[LANGUAGE_FONT_NAME_C].AsString;
  language.FontSize := resultSet.Columns[LANGUAGE_FONT_SIZE_C].AsInteger;

  language.OptionsAsInt := resultSet.Columns[LANGUAGE_OPTIONS_C].AsInteger;

  language.Init;
end;

class function TIvODBCDictionary.LocaleFromResultSet(
  locale: TIvLocale;
  resultSet: TIvResultSet): Boolean;
var
  i: Integer;

  function GetChar(index: Integer): Char;
  var
    str: String;
  begin
    str := resultSet.Columns[index].AsString;
    if str = '' then
      Result := ' '
    else
      Result := str[1];
  end;

begin
  Result := False;

  locale.Primary := resultSet.Columns[LOCALE_PRIMARY_C].AsInteger;
  locale.Sub := resultSet.Columns[LOCALE_SUB_C].AsInteger;
  if resultSet.ColumnCount > LOCALE_CHARSET_C then
    locale.Charset := resultSet.Columns[LOCALE_CHARSET_C].AsInteger
  else
  begin
    locale.Charset := 0;
    Result := True;
  end;
  locale.CodePage := resultSet.Columns[LOCALE_CODEPAGE_C].AsInteger;
  locale.ISOLanguage := resultSet.Columns[LOCALE_ISO_LANGUAGE_C].AsString;
  locale.ISOCountry := resultSet.Columns[LOCALE_ISO_COUNTRY_C].AsString;
  locale.IsCustom := resultSet.Columns[LOCALE_IS_CUSTOM_C].AsInteger = 1;

  locale.EnglishLanguageName := resultSet.Columns[LOCALE_ENGLISH_LANGUAGE_NAME_C].AsString;
  locale.EnglishCountryName := resultSet.Columns[LOCALE_ENGLISH_COUNTRY_NAME_C].AsString;
  locale.NativeLanguageName := resultSet.Columns[LOCALE_NATIVE_LANGUAGE_NAME_C].AsString;
  locale.NativeCountryName := resultSet.Columns[LOCALE_NATIVE_COUNTRY_NAME_C].AsString;
  locale.Win16LanguageName := resultSet.Columns[LOCALE_WIN16_LANGUAGE_NAME_C].AsString;
  locale.Win16CountryName := resultSet.Columns[LOCALE_WIN16_COUNTRY_NAME_C].AsString;

  locale.MeasurementSystem := TIvMeasurementSystem(resultSet.Columns[LOCALE_MEASUREMENT_SYSTEM_C].AsInteger);
  locale.CurrencyString := resultSet.Columns[LOCALE_CURRENCY_STRING_C].AsString;
  locale.CurrencyFormat := TIvCurrencyFormat(resultSet.Columns[LOCALE_CURRENCY_FORMAT_C].AsInteger);
  locale.NegCurrFormat := TIvNegativeCurrencyFormat(resultSet.Columns[LOCALE_NEG_CURR_FORMAT_C].AsInteger);
  locale.ThousandSeparator := GetChar(LOCALE_THOUSAND_SEPARATOR_C);
  locale.DecimalSeparator := GetChar(LOCALE_DECIMAL_SEPARATOR_C);
  locale.CurrencyDecimals := resultSet.Columns[LOCALE_CURRENCY_DECIMALS_C].AsInteger;

  locale.DateSeparator := GetChar(LOCALE_DATE_SEPARATOR_C);
  locale.ShortDateFormat := resultSet.Columns[LOCALE_SHORT_DATE_FORMAT_C].AsString;
  locale.LongDateFormat := resultSet.Columns[LOCALE_LONG_DATE_FORMAT_C].AsString;

  locale.TimeSeparator := GetChar(LOCALE_TIME_SEPARATOR_C);
  locale.TimeAMString := resultSet.Columns[LOCALE_TIME_AM_STRING_C].AsString;
  locale.TimePMString := resultSet.Columns[LOCALE_TIME_PM_STRING_C].AsString;
  locale.TimeLeadingZeros := resultSet.Columns[LOCALE_TIME_LEADING_ZEROS_C].AsInteger = 1;
  locale.TimeFormat := TIvTimeFormat(resultSet.Columns[LOCALE_TIME_FORMAT_C].AsInteger);
  locale.TimeMarkPosition := TIvTimeMarkPosition(resultSet.Columns[LOCALE_TIME_MARK_POSITION_C].AsInteger);

  locale.CalendarType := TIvCalendarType(resultSet.Columns[LOCALE_CALENDAR_TYPE_C].AsInteger);
  locale.OptionalCalendarType := TIvCalendarType(resultSet.Columns[LOCALE_OPTIONAL_CALENDAR_TYPE_C].AsInteger);
  locale.FirstDayOfWeek := TIvDayOfWeek(resultSet.Columns[LOCALE_FIRST_DAY_OF_WEEK_C].AsInteger);
  locale.FirstWeekOfYear := TIvFirstWeekOfYear(resultSet.Columns[LOCALE_FIRST_WEEK_OF_YEAR_C].AsInteger);

  for i := 1 to 12 do
  begin
    locale.ShortMonthNames[i] := resultSet.Columns[LOCALE_SHORT_MONTH1_C + i - 1].AsString;
    locale.LongMonthNames[i] := resultSet.Columns[LOCALE_LONG_MONTH1_C + i - 1].AsString;
  end;                

  for i := 1 to 7 do
  begin
    locale.ShortDayNames[i] := resultSet.Columns[LOCALE_SHORT_DAY1_C + i - 1].AsString;
    locale.LongDayNames[i] := resultSet.Columns[LOCALE_LONG_DAY1_C + i - 1].AsString;
  end;

  locale.Init;
end;

end.

