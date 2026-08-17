unit IvDatDic;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Classes, SysUtils,
  IvDictio;

const
  { Language tables items }

  LANGUAGE_ENGLISH_NAME_C = 0;
  LANGUAGE_NATIVE_NAME_C = 1;
  LANGUAGE_PRIMARY_C = 2;
  LANGUAGE_SUBS_C = 3;
  LANGUAGE_DEFAULT_SUB_C = 4;
  LANGUAGE_FONT_NAME_C = 5;
  LANGUAGE_FONT_SIZE_C = 6;
  LANGUAGE_OPTIONS_C = 7;
  LANGUAGE_CHARSET_C = 8;
  LANGUAGE_CODE_PAGE_C = 9;
  LANGUAGE_ISO_LANGUAGE_C = 10;
  LANGUAGE_ISO_COUNTRIES_C = 11;
  LANGUAGE_ISO_DEFAULT_COUNTRY_C = 12;

  { Locale tables items }

  LOCALE_PRIMARY_C = 0;
  LOCALE_SUB_C = 1;
  LOCALE_LOCALE_C = 2;
  LOCALE_ENGLISH_LANGUAGE_NAME_C = 3;
  LOCALE_NATIVE_LANGUAGE_NAME_C = 4;
  LOCALE_ENGLISH_COUNTRY_NAME_C = 5;
  LOCALE_NATIVE_COUNTRY_NAME_C = 6;
  LOCALE_CODEPAGE_C = 7;
  LOCALE_MEASUREMENT_SYSTEM_C = 8;
  LOCALE_CURRENCY_STRING_C = 9;
  LOCALE_CURRENCY_FORMAT_C = 10;
  LOCALE_NEG_CURR_FORMAT_C = 11;
  LOCALE_THOUSAND_SEPARATOR_C = 12;
  LOCALE_DECIMAL_SEPARATOR_C = 13;
  LOCALE_CURRENCY_DECIMALS_C = 14;
  LOCALE_DATE_SEPARATOR_C = 15;
  LOCALE_SHORT_DATE_FORMAT_C = 16;
  LOCALE_LONG_DATE_FORMAT_C = 17;
  LOCALE_TIME_SEPARATOR_C = 18;
  LOCALE_TIME_AM_STRING_C = 19;
  LOCALE_TIME_PM_STRING_C = 20;
  LOCALE_TIME_LEADING_ZEROS_C = 21;
  LOCALE_TIME_FORMAT_C = 22;
  LOCALE_CALENDAR_TYPE_C = 23;
  LOCALE_OPTIONAL_CALENDAR_TYPE_C = 24;
  LOCALE_FIRST_DAY_OF_WEEK_C = 25;
  LOCALE_FIRST_WEEK_OF_YEAR_C = 26;
  LOCALE_SHORT_MONTH1_C = 27;
  LOCALE_LONG_MONTH1_C = 39;
  LOCALE_SHORT_DAY1_C = 51;
  LOCALE_LONG_DAY1_C = 58;
  LOCALE_WIN16_LANGUAGE_NAME_C = 65;
  LOCALE_WIN16_COUNTRY_NAME_C = 66;
  LOCALE_TIME_MARK_POSITION_C = 67;
  LOCALE_ISO_LANGUAGE_C = 68;
  LOCALE_ISO_COUNTRY_C = 69;
  LOCALE_IS_CUSTOM_C = 70;
  LOCALE_CHARSET_C = 71;

  LANGUAGE_ITEM_COUNT_C = 13;
  LOCALE_ITEM_COUNT_C = 72;

  INDEX_NAME_C = 'Native';

  TRANSLATION_TABLE_C = 'TranslationTable';
  LANGUAGE_TABLE_C = 'LanguageTable';
  LOCALE_TABLE_C = 'LocaleTable';

type
  EIvNoIndex = class(Exception);

  TIvCustomDatabaseDictionary = class(TIvDictionary)
  private
    FTableName: String;
    FLanguageTableName: String;
    FLocaleTableName: String;

  protected
    function GetFieldIndex(language: Integer): Integer;

  published
    property TableName: String read FTableName write FTableName;
    property LanguageTableName: String read FLanguageTableName write FLanguageTableName;
    property LocaleTableName: String read FLocaleTableName write FLocaleTableName;
  end;

implementation

function TIvCustomDatabaseDictionary.GetFieldIndex(language: Integer): Integer;
begin
  Result := language;
  if Result > 0 then
  begin
    if ivctForm in ContextType then
      Inc(Result);
    if ivctComponent in ContextType then
      Inc(Result);
  end;
end;

end.

