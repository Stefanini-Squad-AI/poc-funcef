{ Copyrights 1995-2000 Multilizer Inc. }

unit IvDictio;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils, Classes, Dialogs, Forms, Controls, Graphics, TypInfo, Menus,
  IvCommon;

const
  IV_SUB_SEPARATOR_C  = ',';

  TEST_MASK_C = $01;
  PURE_ASCII_MASK_C = $02;

  { Code pages }

  THAI_CP_C = 874;
  JAPANESE_CP_C = 932;
  SIMPLIFIED_CHINESE_CP_C = 936;
  KOREAN_CP_C = 949;
  KOREAN_JOHAB_CP_C = 1361;
  TRADITIONAL_CHINESE_CP_C = 950;
  EAST_EUROPE_CP_C = 1250;
  CYRILLIC_CP_C = 1251;
  WESTERN_CP_C = 1252;
  GREEK_CP_C = 1253;
  TURKISH_CP_C = 1254;
  HEBREW_CP_C = 1255;
  ARABIC_CP_C = 1256;
  BALTIC_CP_C = 1257;
  VIETNAMESE_CP_C = 1258;

  LOCALE_ILCID = 0;

  LOCALE_IPRIMARYLANGUAGE = 1024;
  LOCALE_ISUBLANGUAGE = 1025;
  LOCALE_SWIN16LANGUAGENAME = 1026;
  LOCALE_SWIN16COUNTRYNAME = 1027;
  LOCALE_SISOLANGUAGE = 1028;
  LOCALE_SISOCOUNTRY = 1029;

  LANG_USER   = -1;
  LANG_SYSTEM = -2;

  LANG_AZERI = 44;
  SUBLANG_AZERI_LATIN    = $01;    { Azeri (Latin) }
  SUBLANG_AZERI_CYRILLIC = $02;    { Azeri (Cyrillic) }

  LANG_UZBEK = 67;
  SUBLANG_UZBEK_LATIN    = $01;    { Uzbek (Latin) }
  SUBLANG_UZBEK_CYRILLIC = $02;    { Uzbek (Cyrillic) }

  SUBLANG_FINNISH        = $01;    { Finnish }
  SUBLANG_FINNISH_SWEDEN = $02;    { Finnish (Sweden) }

  SUBLANG_CHINESE_MACAU  = $05;

{$IFDEF IVANSI}
  { These were missing in Delphi 2.0's and C++Builder 1.0's Windows unit }

  LANG_ARABIC      = $01;
  LANG_FARSI       = $29;
  LANG_HEBREW      = $0d;
  LANG_INDONESIAN  = $21;
  LANG_SERBIAN     = $1a;
  LANG_THAI        = $1e;
  LANG_VIETNAMESE  = $2a;

  LANG_ALBANIAN    = $1c;
  LANG_BELARUSIAN  = $23;
  LANG_UKRAINIAN   = $22;
  LANG_ESTONIAN    = $25;
  LANG_LATVIAN     = $26;
  LANG_LITHUANIAN  = $27;

  SUBLANG_ENGLISH_SOUTH_AFRICA         = $07;    { English (South Africa) }
  SUBLANG_ENGLISH_JAMAICA              = $08;    { English (Jamaica) }
  SUBLANG_ENGLISH_CARIBBEAN            = $09;    { English (Caribbean) }
  SUBLANG_ENGLISH_BELIZE               = $0a;    { English (Belize) }
  SUBLANG_ENGLISH_TRINIDAD             = $0b;    { English (Trinidad) }
  SUBLANG_FRENCH_LUXEMBOURG            = $05;    { French (Luxembourg) }
  SUBLANG_GERMAN_LUXEMBOURG            = $04;    { German (Luxembourg) }
  SUBLANG_GERMAN_LIECHTENSTEIN         = $05;    { German (Liechtenstein) }
  SUBLANG_KOREAN                       = $01;    { Korean (Extended Wansung) }
  SUBLANG_KOREAN_JOHAB                 = $02;    { Korean (Johab) }
  SUBLANG_SERBIAN_LATIN                = $02;
  SUBLANG_SERBIAN_CYRILLIC             = $03;
  SUBLANG_SPANISH_GUATEMALA            = $04;    { Spanish (Guatemala) }
  SUBLANG_SPANISH_COSTA_RICA           = $05;    { Spanish (Costa Rica) }
  SUBLANG_SPANISH_PANAMA               = $06;    { Spanish (Panama) }
  SUBLANG_SPANISH_DOMINICAN_REPUBLIC   = $07;    { Spanish (Dominican Republic) }
  SUBLANG_SPANISH_VENEZUELA            = $08;    { Spanish (Venezuela) }
  SUBLANG_SPANISH_COLOMBIA             = $09;    { Spanish (Colombia) }
  SUBLANG_SPANISH_PERU                 = $0a;    { Spanish (Peru) }
  SUBLANG_SPANISH_ARGENTINA            = $0b;    { Spanish (Argentina) }
  SUBLANG_SPANISH_ECUADOR              = $0c;    { Spanish (Ecuador) }
  SUBLANG_SPANISH_CHILE                = $0d;    { Spanish (Chile) }
  SUBLANG_SPANISH_URUGUAY              = $0e;    { Spanish (Uruguay) }
  SUBLANG_SPANISH_PARAGUAY             = $0f;    { Spanish (Paraguay) }
  SUBLANG_SPANISH_BOLIVIA              = $10;    { Spanish (Bolivia) }
  SUBLANG_SPANISH_EL_SALVADOR          = $11;    { Spanish (El Salvador) }
  SUBLANG_SPANISH_HONDURAS             = $12;    { Spanish (Honduras) }
  SUBLANG_SPANISH_NICARAGUA            = $13;    { Spanish (Nicaragua) }
  SUBLANG_SPANISH_PUERTO_RICO          = $14;    { Spanish (Puerto Rico) }
  SUBLANG_SWEDISH                      = $01;    { Swedish }
  SUBLANG_SWEDISH_FINLAND              = $02;    { Swedish (Finland) }

  VIETNAMESE_CHARSET = 163;

  LOCALE_ITIMEMARKPOSN        = $00001005; { time marker position }
  LOCALE_IDEFAULTANSICODEPAGE = $00001004; { default ansi code page }
  LOCALE_ICALENDARTYPE        = $00001009; { type of calendar specifier }
  LOCALE_IOPTIONALCALENDAR    = $0000100B; { additional calendar types specifier }
  LOCALE_IFIRSTDAYOFWEEK      = $0000100C; { first day of week specifier }
  LOCALE_IFIRSTWEEKOFYEAR     = $0000100D; { first week of year specifier }
  LOCALE_FONTSIGNATURE        = $00000058; { font signature }
  LOCALE_SISO639LANGNAME      = $00000059;
  LOCALE_SISO3166CTRYNAME     = $0000005A;
{$ENDIF}

{$IFNDEF WIN32}
  { Win16 doesn't have NLSAPI. Multilizer emulates it. }

  LANG_NEUTRAL     = $00;

  LANG_AFRIKAANS   = $36;
  LANG_ARABIC      = $01;
  LANG_ALBANIAN    = $1c;
  LANG_BASQUE      = $2d;
  LANG_BELARUSIAN  = $23;
  LANG_BULGARIAN   = $02;
  LANG_CATALAN     = $03;
  LANG_CHINESE     = $04;
  LANG_CROATIAN    = $1a;
  LANG_CZECH       = $05;
  LANG_DANISH      = $06;
  LANG_DUTCH       = $13;
  LANG_ENGLISH     = $09;
  LANG_ESTONIAN    = $25;
  LANG_FAEROESE    = $38;
  LANG_FARSI       = $29;
  LANG_FINNISH     = $0b;
  LANG_FRENCH      = $0c;
  LANG_GERMAN      = $07;
  LANG_GREEK       = $08;
  LANG_HEBREW      = $0d;
  LANG_HUNGARIAN   = $0e;
  LANG_ICELANDIC   = $0f;
  LANG_INDONESIAN  = $21;
  LANG_ITALIAN     = $10;
  LANG_JAPANESE    = $11;
  LANG_KOREAN      = $12;
  LANG_LATVIAN     = $26;
  LANG_LITHUANIAN  = $27;
  LANG_NORWEGIAN   = $14;
  LANG_POLISH      = $15;
  LANG_PORTUGUESE  = $16;
  LANG_ROMANIAN    = $18;
  LANG_RUSSIAN     = $19;
  LANG_SERBIAN     = $1a;
  LANG_SLOVAK      = $1b;
  LANG_SLOVENIAN   = $24;
  LANG_SPANISH     = $0a;
  LANG_SWEDISH     = $1d;
  LANG_THAI        = $1e;
  LANG_TURKISH     = $1f;
  LANG_UKRAINIAN   = $22;
  LANG_VIETNAMESE  = $2a;

  SUBLANG_NEUTRAL              = $00;    { language neutral }
  SUBLANG_DEFAULT              = $01;    { user default }
  SUBLANG_SYS_DEFAULT          = $02;    { system default }

  SUBLANG_CHINESE_TRADITIONAL          = $01;    { Chinese (Taiwan) }
  SUBLANG_CHINESE_SIMPLIFIED           = $02;    { Chinese (PR China) }
  SUBLANG_CHINESE_HONGKONG             = $03;    { Chinese (Hong Kong) }
  SUBLANG_CHINESE_SINGAPORE            = $04;    { Chinese (Singapore) }
  SUBLANG_DUTCH                        = $01;    { Dutch }
  SUBLANG_DUTCH_BELGIAN                = $02;    { Dutch (Belgian) }
  SUBLANG_ENGLISH_US                   = $01;    { English (USA) }
  SUBLANG_ENGLISH_UK                   = $02;    { English (UK) }
  SUBLANG_ENGLISH_AUS                  = $03;    { English (Australian) }
  SUBLANG_ENGLISH_CAN                  = $04;    { English (Canadian) }
  SUBLANG_ENGLISH_NZ                   = $05;    { English (New Zealand) }
  SUBLANG_ENGLISH_EIRE                 = $06;    { English (Irish) }
  SUBLANG_ENGLISH_SOUTH_AFRICA         = $07;    { English (South Africa) }
  SUBLANG_ENGLISH_JAMAICA              = $08;    { English (Jamaica) }
  SUBLANG_ENGLISH_CARIBBEAN            = $09;    { English (Caribbean) }
  SUBLANG_ENGLISH_BELIZE               = $0a;    { English (Belize) }
  SUBLANG_ENGLISH_TRINIDAD             = $0b;    { English (Trinidad) }
  SUBLANG_FRENCH                       = $01;    { French }
  SUBLANG_FRENCH_BELGIAN               = $02;    { French (Belgian) }
  SUBLANG_FRENCH_CANADIAN              = $03;    { French (Canadian) }
  SUBLANG_FRENCH_SWISS                 = $04;    { French (Swiss) }
  SUBLANG_FRENCH_LUXEMBOURG            = $05;    { French (Luxembourg) }
  SUBLANG_GERMAN                       = $01;    { German }
  SUBLANG_GERMAN_SWISS                 = $02;    { German (Swiss) }
  SUBLANG_GERMAN_AUSTRIAN              = $03;    { German (Austrian) }
  SUBLANG_GERMAN_LUXEMBOURG            = $04;    { German (Luxembourg) }
  SUBLANG_GERMAN_LIECHTENSTEIN         = $05;    { German (Liechtenstein) }
  SUBLANG_ITALIAN                      = $01;    { Italian }
  SUBLANG_ITALIAN_SWISS                = $02;    { Italian (Swiss) }
  SUBLANG_KOREAN                       = $01;    { Korean (Extended Wansung) }
  SUBLANG_KOREAN_JOHAB                 = $02;    { Korean (Johab) }
  SUBLANG_NORWEGIAN_BOKMAL             = $01;    { Norwegian (Bokmal) }
  SUBLANG_NORWEGIAN_NYNORSK            = $02;    { Norwegian (Nynorsk) }
  SUBLANG_PORTUGUESE                   = $02;    { Portuguese }
  SUBLANG_PORTUGUESE_BRAZILIAN         = $01;    { Portuguese (Brazilian) }
  SUBLANG_SERBIAN_LATIN                = $02;    { Serbian (Latin) }
  SUBLANG_SERBIAN_CYRILLIC             = $03;    { Serbian (Cyrillic) }
  SUBLANG_SPANISH                      = $01;    { Spanish (Castilian) }
  SUBLANG_SPANISH_MEXICAN              = $02;    { Spanish (Mexican) }
  SUBLANG_SPANISH_MODERN               = $03;    { Spanish (Modern) }
  SUBLANG_SPANISH_GUATEMALA            = $04;    { Spanish (Guatemala) }
  SUBLANG_SPANISH_COSTA_RICA           = $05;    { Spanish (Costa Rica) }
  SUBLANG_SPANISH_PANAMA               = $06;    { Spanish (Panama) }
  SUBLANG_SPANISH_DOMINICAN_REPUBLIC   = $07;    { Spanish (Dominican Republic) }
  SUBLANG_SPANISH_VENEZUELA            = $08;    { Spanish (Venezuela) }
  SUBLANG_SPANISH_COLOMBIA             = $09;    { Spanish (Colombia) }
  SUBLANG_SPANISH_PERU                 = $0a;    { Spanish (Peru) }
  SUBLANG_SPANISH_ARGENTINA            = $0b;    { Spanish (Argentina) }
  SUBLANG_SPANISH_ECUADOR              = $0c;    { Spanish (Ecuador) }
  SUBLANG_SPANISH_CHILE                = $0d;    { Spanish (Chile) }
  SUBLANG_SPANISH_URUGUAY              = $0e;    { Spanish (Uruguay) }
  SUBLANG_SPANISH_PARAGUAY             = $0f;    { Spanish (Paraguay) }
  SUBLANG_SPANISH_BOLIVIA              = $10;    { Spanish (Bolivia) }
  SUBLANG_SPANISH_EL_SALVADOR          = $11;    { Spanish (El Salvador) }
  SUBLANG_SPANISH_HONDURAS             = $12;    { Spanish (Honduras) }
  SUBLANG_SPANISH_NICARAGUA            = $13;    { Spanish (Nicaragua) }
  SUBLANG_SPANISH_PUERTO_RICO          = $14;    { Spanish (Puerto Rico) }
  SUBLANG_SWEDISH                      = $01;    { Swedish }
  SUBLANG_SWEDISH_FINLAND              = $02;    { Swedish (Finland) }

  SORT_DEFAULT = $0 ; { sorting default }
  LOCALE_SENGLANGUAGE = 4097; { English name of language }
  LOCALE_SNATIVELANGNAME = 4; { native name of language }
  LOCALE_SENGCOUNTRY = 4098; { English name of country }
  LOCALE_SNATIVECTRYNAME = 8; { native name of country }
  LOCALE_IDEFAULTANSICODEPAGE = $00001004; { default ansi code page }
  LOCALE_IMEASURE = 13; { 0 = metric, 1 = US }
  LOCALE_SDECIMAL = 14; { decimal separator }
  LOCALE_STHOUSAND = 15; { thousand separator }
  LOCALE_SCURRENCY = 20; { local monetary symbol }
  LOCALE_ICURRDIGITS = 25; { # local monetary digits }
  LOCALE_ICURRENCY = 27; { positive currency mode }
  LOCALE_INEGCURR = 28; { negative currency mode }
  LOCALE_SDATE = 29; { date separator }
  LOCALE_STIME = 30; { time separator }
  LOCALE_SSHORTDATE = 31; { short date format string }
  LOCALE_SLONGDATE = $20; { long date format string }
  LOCALE_ITIME = 35; { time format specifier }
  LOCALE_ITIMEMARKPOSN = $00001005; { time marker position }
  LOCALE_ITLZERO = 37; { leading zeros in time field }
  LOCALE_S1159 = 40; { AM designator }
  LOCALE_S2359 = 41; { PM designator }
  LOCALE_SDAYNAME1 = 42; { long name for Monday }
  LOCALE_SDAYNAME7 = 48; { long name for Sunday }
  LOCALE_SABBREVDAYNAME1 = 49; { abbreviated name for Monday }
  LOCALE_SABBREVDAYNAME7 = 55; { abbreviated name for Sunday }
  LOCALE_SMONTHNAME1 = 56; { long name for January }
  LOCALE_SMONTHNAME12 = 67; { long name for December }
  LOCALE_SABBREVMONTHNAME1 = 68; { abbreviated name for January }
  LOCALE_SABBREVMONTHNAME12 = 79; { abbreviated name for December }
  LOCALE_STIMEFORMAT = 4099; { time format string }
  LOCALE_ICALENDARTYPE        = $00001009; { type of calendar specifier }
  LOCALE_IOPTIONALCALENDAR    = $0000100B; { additional calendar types specifier }
  LOCALE_IFIRSTDAYOFWEEK      = $0000100C; { first day of week specifier }
  LOCALE_IFIRSTWEEKOFYEAR     = $0000100D; { first week of year specifier }
  LOCALE_SISO639LANGNAME = $00000059;
  LOCALE_SISO3166CTRYNAME = $0000005A;

  CAL_GREGORIAN = 1;     { Gregorian (localized) calendar }
  CAL_GREGORIAN_US = 2;  { Gregorian (U.S.) calendar }
{$ENDIF}

{$IFDEF WIN32}
  {$IFDEF IVVB}
  KEY_C = VB_KEY_C;
  {$ELSE}
    {$IFDEF VER90}
  KEY_C = DELPHI2_KEY_C;
    {$ELSE}
      {$IFDEF VER100}
  KEY_C = DELPHI3_KEY_C;
      {$ELSE}
        {$IFDEF VER93}
  KEY_C = CBUILDER1_KEY_C;
        {$ELSE}
          {$IFDEF VER110}
  KEY_C = CBUILDER3_KEY_C;
          {$ELSE}
            {$IFDEF VER120}
  KEY_C = DELPHI4_KEY_C;
            {$ELSE}
              {$IFDEF VER125}
  KEY_C = CBUILDER4_KEY_C;
              {$ELSE}
  KEY_C = DELPHI5_KEY_C;
              {$ENDIF}
            {$ENDIF}
          {$ENDIF}
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ELSE}
  KEY_C = '';
{$ENDIF}

{$IFDEF IVVB}
  SECTION_C = VB16_SECTION_C;
{$ELSE}
  SECTION_C = DELPHI1_SECTION_C;
{$ENDIF}

  CONTEXT_SEPARATOR_C = #127;
  EURO_CHAR_C = #128;

type
  TIvDialogPosition = (ivdpParent, ivdpCenter);
  TIvDialogPositions = set of TIvDialogPosition;

{$IFDEF IVANSI}
  { This was missing in Delphi 2.0's windows unit }

  TFontCharset = 0..255;
{$ENDIF}

{$IFDEF WIN32}
  PHLK = ^HKL;

  TIvCharsetInfo = record
    charSet: TFontCharset;
    codePage: Integer;
  end;

  PLocaleFontSignature = ^TLocaleFontSignature;
  TLocaleFontSignature = packed record
    fsUsb: array[0..3] of DWORD;
    fsCsbDefault: array[0..1] of DWORD;
    fsCsbSupported: array[0..1] of DWORD;
  end;

  TIvFontCharset = (ivcsDefault, ivcsOEM, ivcsSymbol, ivcsMac, ivcsAnsi,
    ivcsEastEurope, ivcsBaltic, ivcsRussian, ivcsGreek, ivcsTurkish,
    ivcsArabic, ivcsHebrew, ivcsShiftJIS, ivcsHangeul, ivcsJohab,
    ivcsChineseBig5, ivcsGB2312, ivcsThai, ivcsVietnamese);
  TIvFontCharsets = set of TIvFontCharset;
{$ENDIF}

  { TIvPropInfoList }

  TIvPropInfoList = class
  private
{$IFDEF VER125}
    FList: Pointer;
{$ELSE}
    FList: PPropList;
{$ENDIF}
    FCount: Integer;
    FSize: Integer;

    function Get(Index: Integer): PPropInfo;

  public
    constructor Create(obj: TObject; Filter: TTypeKinds);
    destructor Destroy; override;

    property Count: Integer read FCount;
    property Items[Index: Integer]: PPropInfo read Get; default;
  end;

  { TIvLanguage }

  TIvLanguageOption = (ivloTest, ivloPureASCII);
  TIvLanguageOptions = set of TIvLanguageOption;
  TIvCharacterSetType = (ivcsSingleByte, ivcsMultiByte, ivcsBiDirectional);

  TIvDisplayName = (ivdnEnglish, ivdnNative, ivdnTranslated);

  TIvDictionary = class;

  TIvLanguage = class(TObject)
  protected
    FCodePage: Integer;
    FPrimary: Integer;
    FVariant: String;
    FActiveSub: Integer;
    FDefaultSub: Integer;
    FSubs: TStringList;
    FISOLanguage: String;
    FISODefaultCountry: String;
    FISOCountries: TStringList;
    FEnglishName: String;
    FNativeName: String;
    FFontName: String;
    FFontSize: Integer;
    FOptions: TIvLanguageOptions;
{$IFDEF WIN32}
    FCharset: TFontCharset;
{$ENDIF}

    function GetSub: Integer;
    procedure SetSub(value: Integer); virtual;

    function GetSubCount: Integer;
    function GetSubs(i: Integer): Integer;

    function GetAllSubs: String;
    procedure SetAllSubs(const value: String);

    function GetISOCountry: String;
    function GetISOCountryCount: Integer;
    function GetISOCountries(i: Integer): String;

    function GetISOAllCountries: String;
    procedure SetISOAllCountries(const value: String);

    function GetLocale: Integer;
    function GetLangId: Integer;
    function GetDefaultLocale: Integer;
    function GetActiveLocale: Integer;
    function GetCharsetType: TIvCharacterSetType;

    procedure SetActiveSub(value: Integer);

    procedure SetCodePage(value: Integer);

    function GetOptionsAsInt: Integer;
    procedure SetOptionsAsInt(value: Integer);

  public
    constructor Create;
    constructor CreateValue(
      primary, defaultSub, codePage: Integer;
      const subs, englishName, nativeName, fontName: String;
      fontSize: Integer;
      options: TIvLanguageOptions);
    destructor Destroy; override;

    procedure Assign(source: TIvLanguage); virtual;
    function Copy: TIvLanguage; virtual;
    procedure Init; virtual;

    function PrimaryEquals(language: TIvLanguage): Boolean; virtual;

    function GetBundleExtension: String;

    procedure ClearSubs;
    procedure AddSub(sub: Integer);

    procedure ClearISOCountries;
    procedure AddISOCountry(country: String);

    function GetDisplayName(
      displayName: TIvDisplayName;
      dictionary: TIvDictionary): String; virtual;

    class function SubStrToSubId(const str: String): Integer;

    property SubCount: Integer read GetSubCount;
    property Subs[i: Integer]: Integer read GetSubs;
    property ISOCountry: String read GetISOCountry;
    property ISOCountryCount: Integer read GetISOCountryCount;
    property ISOCountries[i: Integer]: String read GetISOCountries;
{$IFDEF IVVB}
    property VBSubs: TStringList read FSubs;
    property VBISOCountries: TStringList read FISOCountries;
{$ENDIF}
    property LangId: Integer read GetLangId;
    property Locale: Integer read GetLocale;
    property DefaultLocale: Integer read GetDefaultLocale;
    property ActiveLocale: Integer read GetActiveLocale;
    property CharsetType: TIvCharacterSetType read GetCharsetType;
    property EnglishName: String read FEnglishName write FEnglishName;
    property NativeName: String read FNativeName write FNativeName;
{$IFDEF WIN32}
    property Charset: TFontCharset read FCharset write FCharset;
{$ENDIF}
    property CodePage: Integer read FCodePage write SetCodePage;
    property Primary: Integer read FPrimary write FPrimary;
    property Sub: Integer read GetSub write SetSub;
    property Variant: String read FVariant write FVariant;
    property AllSubs: String read GetAllSubs write SetAllSubs;
    property DefaultSub: Integer read FDefaultSub write FDefaultSub;
    property ActiveSub: Integer read FActiveSub write SetActiveSub;
    property ISOLanguage: String read FISOLanguage write FISOLanguage;
    property ISOAllCountries: String read GetISOAllCountries write SetISOAllCountries;
    property ISODefaultCountry: String read FISODefaultCountry write FISODefaultCountry;
    property FontName: String read FFontName write FFontName;
    property FontSize: Integer read FFontSize write FFontSize;
    property Options: TIvLanguageOptions read FOptions write FOptions;
    property OptionsAsInt: Integer read GetOptionsAsInt write SetOptionsAsInt;
  end;

  { TIvLocale }

  TIvMeasurementSystem = (ivmsMetric, ivmsUS);

  TIvCurrencyFormat = (ivcfS1, ivcf1S, ivcfS_1, ivcf1_S);

  TIvNegativeCurrencyFormat = (ivncS1, ivncNS1, ivncSN1, ivncS1N, ivnc1S,
    ivncN1S, ivnc1NS, ivnc1SN, ivncN1_S, ivncNS_1, ivnc1_SN, ivncS_1N,
    ivncS_N1, ivnc1N_S, ivncS_1, ivnc1_S);

  TIvTimeFormat = (ivtf12, ivtf24);
  TIvTimeMarkPosition = (ivtmSuffix, ivtmPrefix);

  TIvDayOfWeek = (ivwdMonday, ivwdTuesday, ivwdWednesday, ivwdThursday, ivwdFriday, ivwdSaturday, ivwdSunday);
  TIvFirstWeekOfYear = (ivfwFirstPart, ivfwFirstFull, ivfwFirst4);

  TIvCalendarType = (ivctNone, ivctGregorian, ivctGregorianUS, ivctJapan,
    ivctTaiwan, ivctKorea, ivctHijri, ivctThai, ivctHebrew);

  TIvEuro = (iveNormal, iveBusiness, iveIgnore);
  TIvEMU = (iveNone, iveLocal, iveLocalAndEuro, iveEuroAndLocal, iveEuro);

  TIvLocale = class(TObject)
  private
    function GetLangId: Integer;
    procedure SetLangId(value: Integer);

    function GetLocale: Integer;
    procedure SetLocale(value: Integer);
    function GetCharsetType: TIvCharacterSetType;
    function GetEMU: TIvEMU;
    function GetEMUCurrencyString: String;

  public
    Primary: Integer;
    Sub: Integer;
    SortId: Integer;
    ISOLanguage: String;
    ISOCountry: String;
    CodePage: Integer;
    IsCustom: Boolean;
{$IFDEF WIN32}
    Charset: TFontCharset;
{$ENDIF}

    EnglishLanguageName: String;
    EnglishCountryName: String;
    NativeLanguageName: String;
    NativeCountryName: String;
    Win16LanguageName: String;
    Win16CountryName: String;

    CurrencyString: String;
    CurrencyFormat: TIvCurrencyFormat;
    NegCurrFormat: TIvNegativeCurrencyFormat;
    CurrencyDecimals: Byte;

    ThousandSeparator: Char;
    DecimalSeparator: Char;

    DateSeparator: Char;
    ShortDateFormat: String;
    LongDateFormat: String;

    TimeSeparator: Char;
    TimeAMString: String;
    TimePMString: String;
    TimeLeadingZeros: Boolean;
    TimeFormat: TIvTimeFormat;
    TimeMarkPosition: TIvTimeMarkPosition;

    MeasurementSystem: TIvMeasurementSystem;
    CalendarType: TIvCalendarType;
    OptionalCalendarType: TIvCalendarType;
    FirstDayOfWeek: TIvDayOfWeek;
    FirstWeekOfYear: TIvFirstWeekOfYear;

    ShortMonthNames: array[1..12] of String;
    LongMonthNames: array[1..12] of String;
    ShortDayNames: array[1..7] of String;
    LongDayNames: array[1..7] of String;

    procedure Assign(source: TIvLocale); virtual;
    function Copy: TIvLocale; virtual;
    procedure Init; virtual;

    function GetDisplayName(
      displayName: TIvDisplayName;
      dictionary: TIvDictionary): String; virtual;

    property LangId: Integer read GetLangId write SetLangId;
    property Locale: Integer read GetLocale write SetLocale;
    property CharsetType: TIvCharacterSetType read GetCharsetType;
    property EMU: TIvEMU read GetEMU;
    property EMUCurrencyString: String read GetEMUCurrencyString;
  end;

  { TIvContext }

  TIvContextTypeItem = (ivctForm, ivctComponent, ivctKind);
  TIvContextType = set of TIvContextTypeItem;

  TIvContextCode = (ivccFlat, ivccFull, ivccComponent, ivccForm);

  TIvContext = class(TObject)
  private
    FForm: String;
    FComponent: String;
    FKind: String;

  public
    constructor CreateValue(const form, component: String);

    procedure Clear;
    procedure Assign(context: TIvContext);
    function Equals(context: TIvContext): Boolean;

    class function ContextCodeToType(value: TIvContextCode): TIvContextType;
    class function ContextTypeToCode(value: TIvContextType): TIvContextCode;

    property Form: String read FForm write FForm;
    property Component: String read FComponent write FComponent;
    property Kind: String read FKind write FKind;
  end;

  { TIvTranslation }

  TIvTranslationMatch = (ivtmNormal, ivtmSuper, ivtmNone);

  TIvTranslation = class(TObject)
  protected
    FExists: Boolean;
    FMatch: TIvTranslationMatch;
{$IFDEF WIN32}
    FStr: String;
    FForm: String;
    FComponent: String;
    FCurrent: String;
{$ELSE}
    FStr: PChar;
    FForm: PChar;
    FComponent: PChar;
    FCurrent: PChar;

    procedure FreeStr(var value: PChar);

    function GetStr: String;
    procedure SetStr(value: String);

    function GetForm: String;
    procedure SetForm(value: String);

    function GetComponent: String;
    procedure SetComponent(value: String);

    function GetCurrent: String;
    procedure SetCurrent(value: String);
{$ENDIF}

    function GetKey: String;

  public
    constructor CreateValue(const str, form, component: String);
{$IFNDEF WIN32}
    constructor Create;
    destructor Destroy; override;
{$ENDIF}

    class function ComposeKey(const str, form, component: String): String;

    property Key: String read GetKey;
    property Exists: Boolean read FExists write FExists;
    property Match: TIvTranslationMatch read FMatch write FMatch;
{$IFDEF WIN32}
    property Str: String read FStr write FStr;
    property Form: String read FForm write FForm;
    property Component: String read FComponent write FComponent;
    property Current: String read FCurrent write FCurrent;
{$ELSE}
    property Str: String read GetStr write SetStr;
    property Form: String read GetForm write SetForm;
    property Component: String read GetComponent write SetComponent;
    property Current: String read GetCurrent write SetCurrent;
{$ENDIF}
  end;

  { TIvDictionary }

  TIvCustomTranslator = class;

  EIvMulti = class(Exception);

  TIvLanguageDialogOption = (ivloShowAllLanguages, ivloUseNativeLanguage, ivloNoCenter);
  TIvLanguageDialogOptions = set of TIvLanguageDialogOption;

  TIvDictionaryOption =
  (
    ivdoUpdateLocaleVariables,
    ivdoAutoTranslate,
    ivdoYear2000,
    ivdoTranslateResourceStrings,
    ivdoRecreateMDIChild
  );
  TIvDictionaryOptions = set of TIvDictionaryOption;

  TIvMissingTranslation = (ivmtUseNative, ivmtUseNull, ivmtTagNative, ivmtRaiseException);

  TIvBinding = (ivbiNone, ivbiLocaleToLanguage, ivbiLanguageToLocale);

{$IFDEF WIN32}
  TIvCheckLevel = (ivclNone, ivclSystem, ivclCodePage);
{$ENDIF}

  TIvDictionaryFormat = (ivdfFlat, ivdfContext);

{$IFDEF IVVB}
  TIvTranslationMode = (ivtmSingle, ivtmMultiple);
{$ENDIF}

  TIvDictionary = class(TComponent)
  private
    FDictionaryCode: Integer;
    FOnLocaleChange: TNotifyEvent;
    FOnLanguageChange: TNotifyEvent;

  protected
    FEuro: TIvEuro;
    FContextType: TIvContextType;
    FDictionaryName: String;
    FOpen: Boolean;
    FLanguage: Integer;
    FActiveLanguage: Integer;
    FSuperLanguage: Integer;
    FOriginalLanguage: Integer;
    FLocale: Integer;
    FActiveLocale: Integer;
    FLanguageLocale: Integer;
    FNativeLocale: Integer;
    FOptions: TIvDictionaryOptions;
    FMissingTranslation: TIvMissingTranslation;
    FBinding: TIvBinding;
    FTempLanguageData: TIvLanguage;
    FLanguageData: TIvLanguage;
    FTempLocaleData: TIvLocale;
    FLocaleData: TIvLocale;
    FTranslators: TList;
{$IFDEF WIN32}
    FCheckLevel: TIvCheckLevel;
{$ENDIF}

    function GetContextCode: TIvContextCode;

    procedure SetDictionaryName(const value: String);

    function GetPrimaryLanguage: Integer;
    procedure SetPrimaryLanguage(value: Integer);

    function GetSubLanguage: Integer;
    procedure SetSubLanguage(value: Integer);

    procedure SetLocale(value: Integer);
    procedure SetLanguage(value: Integer);

    function GetTranslatorCount: Integer;
    function GetTranslator(i: Integer): TIvCustomTranslator;

    function GetLanguage(i: Integer): TIvLanguage;
    function GetLocale(i: Integer): TIvLocale;

    procedure SetEuro(value: TIvEuro);

    procedure InitLanguage(language: Integer);
    procedure InitLocale(locale: Integer);
    function DecodeLocale(value: Integer): Integer;

    function GetDefaultLanguage: Integer;

    procedure UnbindTranslators;

    procedure ReadDictionaryCode(reader: TReader);
    procedure WriteDictionaryCode(writer: TWriter);
    procedure DefineProperties(filer: TFiler); override;

    { Implement these in your derived dictionaries }

    function GetLanguageCount: Integer; virtual; abstract;
    procedure GetLanguageData(index: Integer; language: TIvLanguage); virtual; abstract;
    function GetLocaleCount: Integer; virtual; abstract;
    procedure GetLocaleData(index: Integer; locale: TIvLocale); virtual; abstract;

    { You might need to override this in your derived dictionaries }

    function GetTranslationCount: Integer; virtual;
    procedure LanguageChanged(languageChanged, localeChanged: Boolean); virtual;

  public
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;

    { Implement these in your derived dictionaries }

    function TranslateContextString(
      const str, form, component: String;
      var translation: String): Boolean; virtual; abstract;

    { You might need to override these in your derived dictionaries }

    procedure Open; virtual;
    procedure Close; virtual;
    function CanBeOpened: Boolean; virtual;
    procedure GetLanguageDatas(list: TList); virtual;
    procedure GetLocaleDatas(list: TList); virtual;
    function TranslateString(
      const str: String;
      var translation: String): Boolean; virtual;

    function CheckTranslation(
      const native, translation: String;
      ok: Boolean): String;

    procedure AddTranslator(translator: TIvCustomTranslator);
    procedure RemoveTranslator(translator: TIvCustomTranslator);

    procedure GetLocales(locales: TList);
    procedure GetLocaleIds(locales: TList);
{$IFDEF WIN32}
    class procedure GetSystemLocales(locales: TList);
    class procedure GetSystemLocaleIds(locales: TList);
    class function GetSystemLocaleData(id: Integer; locale: TIvLocale): Boolean;
{$ENDIF}
    class procedure FreeList(list: TList);

    function GetLocaleDataById(id: Integer; locale: TIvLocale): Boolean;
    function LocaleToLanguage(locale: Integer): Integer;

    function DoesTranslationExist(const str: String): Boolean;
    function DoesContextTranslationExist(const str, form, component: String): Boolean;

    function Translate(const str: String): String;
    function TranslateContext(const str, form, component: String): String;

    procedure TranslateWindow(wnd: THandle; str: String; resize: Boolean);

    function IsOpen: Boolean;

    procedure SynchronizeLocale; virtual;
    procedure SynchronizeLanguage; virtual;

    procedure GetPrimaryLanguages(primaries: TStrings; native: Boolean); virtual;
    procedure GetSubLanguages(language: TIvLanguage; subs: TStrings; native: Boolean);

    function IsLocaleSupported(locale: Integer): Boolean; virtual;

{$IFDEF IVWIDE}
    class procedure HandleException(sender: TObject; e: Exception);
{$ENDIF}

    class function IvCompareText(
      const s1, s2: String;
      locale: Integer;
      ignoreSymbols: Boolean): Integer;
    class function IvCompareStr(
      const s1, s2: String;
      locale: Integer;
      ignoreSymbols: Boolean): Integer;
    class function IvCompareBinary(const s1, s2: String): Integer;

{$IFDEF WIN32}
    class function GetCompareOptions(ignoreCase, ignoreSymbols: Boolean): Integer;
{$ENDIF}

{$IFDEF IVWIDE}
    class function IvWideCompareText(
      const s1, s2: WideString;
      locale: Integer;
      ignoreSymbols: Boolean): Integer;
    class function IvWideCompareStr(
      const s1, s2: WideString;
      locale: Integer;
      ignoreSymbols: Boolean): Integer;
    class function IvWideCompareBinary(const s1, s2: WideString): Integer;
{$ENDIF}

{$IFDEF WIN32}
    class function IsLanguageSupportedBySystem(language: TIvLanguage): Boolean;
    class function IsLanguageSupportedByCodePage(language: TIvLanguage): Boolean;

    class function IsLocaleSupportedBySystem(locale: TIvLocale): Boolean;
    class function IsLocaleSupportedByCodePage(locale: TIvLocale): Boolean;

    function CompareText(const s1, s2: String): Integer;
    function CompareStr(const s1, s2: String): Integer;
{$ELSE}
    function GetSystemDefaultLCID: Integer;
    function GetUserDefaultLCID: Integer;
{$ENDIF}

    class function ComposeLanguageName(
      language: String;
      primary, codePage: Integer;
      translate: Boolean;
      dictionary: TIvDictionary): String;

    class function ComposeCountryName(
      country: String;
      primary, sub, codePage: Integer;
      translate: Boolean;
      dictionary: TIvDictionary): String;

    class function ComposeLocaleName(
      language, country: String;
      primary, sub, codePage: Integer;
      translate: Boolean;
      dictionary: TIvDictionary): String;

    class procedure SetTimeFormats(
      format: TIvTimeFormat;
      markPosition: TIvTimeMarkPosition;
      leadingZeros: Boolean;
      var shortTimeFormat, longTimeFormat: String);

    class function TranslateDateFormat(const formatStr: String): String;

    function IsDesignTime: Boolean;

{$IFDEF IVVB}
    function GetTranslationMode: TIvTranslationMode;
{$ENDIF}

    property NativeLocale: Integer read FNativeLocale;
    property ContextType: TIvContextType read FContextType;
    property ContextCode: TIvContextCode read GetContextCode;
    property ActiveLanguage: Integer read FActiveLanguage;
    property SuperLanguage: Integer read FSuperLanguage;
    property LanguageLocale: Integer read FLanguageLocale;
    property DefaultLanguage: Integer read GetDefaultLanguage;
    property TranslationCount: Integer read GetTranslationCount;
    property LanguageCount: Integer read GetLanguageCount;
    property Languages[i: Integer]: TIvLanguage read GetLanguage;
    property LanguageData: TIvLanguage read FLanguageData;
    property LocaleCount: Integer read GetLocaleCount;
    property Locales[i: Integer]: TIvLocale read GetLocale;
    property LocaleData: TIvLocale read FLocaleData;
    property TranslatorCount: Integer read GetTranslatorCount;
    property Translators[i: Integer]: TIvCustomTranslator read GetTranslator;
    property Locale: Integer read FActiveLocale write SetLocale;

  published
    property DictionaryName: String read FDictionaryName write SetDictionaryName;
    property PrimaryLanguage: Integer read GetPrimaryLanguage write SetPrimaryLanguage default LANG_NEUTRAL;
    property SubLanguage: Integer read GetSubLanguage write SetSubLanguage default SUBLANG_DEFAULT;
    property Language: Integer read FLanguage write SetLanguage default LANG_USER;
    property Binding: TIvBinding read FBinding write FBinding default ivbiLocaleToLanguage;
    property Options: TIvDictionaryOptions read FOptions write FOptions
      default [ivdoUpdateLocaleVariables, ivdoAutoTranslate, ivdoYear2000,
        ivdoTranslateResourceStrings, ivdoRecreateMDIChild];
    property MissingTranslation: TIvMissingTranslation read FMissingTranslation write FMissingTranslation
      default ivmtUseNative;
    property Euro: TIvEuro read FEuro write SetEuro default iveNormal;
{$IFDEF WIN32}
    property CheckLevel: TIvCheckLevel read FCheckLevel write FCheckLevel default ivclCodePage;
{$ENDIF}
    property OnLanguageChange: TNotifyEvent read FOnLanguageChange write FOnLanguageChange;
    property OnLocaleChange: TNotifyEvent read FOnLocaleChange write FOnLocaleChange;
  end;

  TIvDictionaries = class(TObject)
  private
    FItems: TList;

    function GetCount: Integer;
    function GetItems(index: Integer): TIvDictionary;

    procedure Add(item: TIvDictionary);
    procedure Remove(item: TIvDictionary);

  public
    constructor Create;
    destructor Destroy; override;

    function FindDictionary(const name: String): TIvDictionary;

    property Count: Integer read GetCount;
    property Items[index: Integer]: TIvDictionary read GetItems; default;
  end;

  { TIvTranslator }

  TIvTranslateEvent = procedure(translator: TIvCustomTranslator) of object;

  TIvTranslatorStateValue = (ivtsBound, ivtsScaled, ivtsMirrored);
  TIvTranslatorState = set of TIvTranslatorStateValue;

  TIvCustomTranslator = class(TComponent)
  protected
    FState: TIvTranslatorState;
    FDictionary: TIvDictionary;
    FDictionaryName: String;
    FOnBeforeTranslate: TIvTranslateEvent;
    FOnAfterTranslate: TIvTranslateEvent;
    FOnLocaleChange: TNotifyEvent;
    FOnLanguageChange: TNotifyEvent;

    procedure SetDictionary(value: TIvDictionary);
    procedure SetDictionaryName(const value: String);

{$IFDEF WIN32}
    procedure TranslateSystemMenu(handle: THandle; mdi: Boolean);
    function GetSystemMenuWinHandle: THandle; virtual;
{$ENDIF}

    procedure TranslateHost; virtual;

    function IsDesignTime: Boolean;

    procedure LanguageChanged(languageChanged, localeChanged: Boolean); virtual;

  public
    constructor Create(owner: TComponent); override;

    procedure Translate; virtual;
    procedure Unbind; virtual;
    procedure UnbindAndSetNative; virtual;

    property State: TIvTranslatorState read FState;
    property Dictionary: TIvDictionary read FDictionary write SetDictionary;

  published
    property DictionaryName: String read FDictionaryName write SetDictionaryName;
    property OnBeforeTranslate: TIvTranslateEvent read FOnBeforeTranslate write FOnBeforeTranslate;
    property OnAfterTranslate: TIvTranslateEvent read FOnAfterTranslate write FOnAfterTranslate;
    property OnLocaleChange: TNotifyEvent read FOnLocaleChange write FOnLocaleChange;
    property OnLanguageChange: TNotifyEvent read FOnLanguageChange write FOnLanguageChange;
  end;

function GetMLRegistryValue(const valueName, defaultValue: String): String;

{ Translation functions}

function Translate(const str: String): String;
function TranslateContext(const str, form, component: String): String;
function GetDefaultDictionary: TIvDictionary;

{ Multilingual functions }

{$IFDEF IVWIDE}
function MlFormat(const format: String; const args: array of const): String;
procedure MlShowMessage(const msg: string);
function MlMessageDlg(const msg: string; aType: TMsgDlgType; aButtons: TMsgDlgButtons; helpCtx: Longint): Word;
{$ENDIF}

{ Locale functions }

function IvDoesLanguageRequirePro(primary: Integer): Boolean;
function IvDoesLanguageRequirePro32(primary: Integer): Boolean;
function IvMakeLangId(primaryLanguage, subLanguage: Integer): Integer;
function IvMakeLcId(langId, sortId: Integer): Integer;
function IvGetPrimaryFromLocale(locale: Integer): Integer;
function IvGetSubFromLocale(locale: Integer): Integer;

function IvLangIdToCodePage(langId: Integer): Integer;

{ EMU functions }

function IsEMUMember(locale: Integer): Boolean;
function GetEMUPhase: TIvEMU;

{$IFDEF WIN32}
function IvWStrPCopy(dest: PWideChar; const source: TIvWideString): PWideChar;

function IvStrToWStr(const source: String; codePage: Integer): TIvWideString;
function IvStrLen(const str: String; codePage: Integer): Integer;

function IvIsCodePageSupportedBySystem(codePage: Integer): Boolean;
function IvIsLocaleSupportedByCodePage(locale: Integer): Boolean;
function IvSetKeyboardLayout(langId: Integer): HKL;
function IvResetKeyboardLayout: HKL;
function IvGetCharsetInfo(langId: Integer): TIvCharsetInfo;
function IvCodePageToCharset(codePage: Integer): TFontCharset;
function IvLangIdToCharset(langId: Integer): TFontCharset;
function IvCharsetToCode(value: TIvFontCharset): Byte;
function IvCodeToCharset(value: Byte): TIvFontCharset;
function IvGetSupportedCharsets: TIvFontCharsets;
procedure IvGetFontNames(charsets: TIvFontCharsets; names: TStrings);
procedure IvGetFontNamesOfCharset(charset: Integer; names: TStrings);
{$ENDIF}

function IvGetCharacterSetType(locale: Integer): TIvCharacterSetType;
function IvIsLocaleSingleByte(locale: Integer): Boolean;
function IvIsLocaleMultiByte(locale: Integer): Boolean;
function IvIsLocaleBidirectional(locale: Integer): Boolean;

{$IFDEF IVWIDE}
function TranslateLoadResString(resStringRec: PResStringRec): String;
function IvLoadResString(resStringRec: PResStringRec): String;

function TranslateLoadStr(ident: Integer): String;
function IvLoadStr(ident: Integer): String;

function TranslateShortCutToText(shortCut: TShortCut): String;
function IvShortCutToText(shortCut: TShortCut): String;
{$ENDIF}

function MaxInteger(a, b: Integer): Integer;
function MinInteger(a, b: Integer): Integer;

var
  Dictionaries: TIvDictionaries;

{$IFDEF WIN32}
  KeyboardLayout: HKL;
  {$IFDEF IVANSI}
  commonWideString: PWideChar;
  {$ENDIF}
  {$IFDEF IVWIDE}
  resStrTranslationEnabled: Boolean;
  vclFunctionsChanged: Boolean;
  loadResStringBuffer: array[0..34] of Byte;
  loadStrBuffer: array[0..34] of Byte;
  shortCutBuffer: array[0..34] of Byte;
  {$ENDIF}
{$ENDIF}

implementation

uses
{$IFDEF WIN32}
  Registry,
{$ELSE}
  IniFiles,
{$ENDIF}
{$IFDEF IVVB}
  InnoOCX,
{$ENDIF}
{$IFDEF IVBINARY}
  IvStamp, IvDemoD,
{$ENDIF}
  Consts, Messages, IvParser;

const
  LANG_ASSAMESE = 77;
  LANG_MACEDONIAN = 47;
  LANG_SWAHILI = 65;
  LANG_TATAR = 68;
  LANG_URDU = 32;

{$IFDEF WIN32}
  CHARSET_COUNT_C = 32;
  CHARSETSET_TO_ID_C: array[0..CHARSET_COUNT_C - 1] of TIvCharsetInfo =
  (
    (charSet: ANSI_CHARSET; codePage: 1252),        { 0, Western Europe }
    (charSet: EASTEUROPE_CHARSET; codePage: 1250),  { 1, Eastern Europe }
    (charSet: RUSSIAN_CHARSET; codePage: 1251),     { 2, Cyrillic }
    (charSet: GREEK_CHARSET; codePage: 1253),       { 3, Greek }
    (charSet: TURKISH_CHARSET; codePage: 1254),     { 4, Turkish }
  {$IFDEF IVPRO}
    (charSet: HEBREW_CHARSET; codePage: 1255),      { 5, Hebrew }
    (charSet: ARABIC_CHARSET; codePage: 1256),      { 6, Arabic }
  {$ELSE}
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
  {$ENDIF}
    (charSet: BALTIC_CHARSET; codePage: 1257),      { 7, Baltic }
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
  {$IFDEF IVPRO}
    (charSet: THAI_CHARSET; codePage: 874),         { 16, Thai }
    (charSet: SHIFTJIS_CHARSET; codePage: 932),     { 17, Japanese }
    (charSet: GB2312_CHARSET; codePage: 936),       { 18, Chinese (Simplified) }
    (charSet: HANGEUL_CHARSET; codePage: 949),      { 19, Korean (Hangul) }
    (charSet: CHINESEBIG5_CHARSET; codePage: 950),  { 20, Chinese (Traditionel) }
    (charSet: JOHAB_CHARSET; codePage: 1361),       { 21, Korean (Johab) }
    (charSet: VIETNAMESE_CHARSET; codePage: 1258),  { 22, Vietnamese }
  {$ELSE}
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
  {$ENDIF}
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0),
    (charSet: 0; codePage: 0)
  );
{$ENDIF}

var
  euroUsage: TIvEuro;
{$IFDEF WIN32}
  enumInteger: Integer;
  enumList: TList;
  supported: Boolean;
{$ELSE}
  userDefaultLCID: Integer;
{$ENDIF}

function MaxInteger(a, b: Integer): Integer;
begin
  if a >= b then
    Result := a
  else
    Result := b;
end;

function MinInteger(a, b: Integer): Integer;
begin
  if a <= b then
    Result := a
  else
    Result := b;
end;

function GetMLRegistryValue(const valueName, defaultValue: String): String;
var
{$IFDEF WIN32}
  registry: TRegistry;
{$ELSE}
  iniFile: TIniFile;
{$ENDIF}
begin
{$IFDEF WIN32}
  registry := TRegistry.Create;
  try
    registry.RootKey := HKEY_LOCAL_MACHINE;
    if registry.OpenKey(KEY_C, False) and registry.ValueExists(valueName) then
      Result := registry.ReadString(valueName)
    else
      Result := defaultValue;
  finally
    registry.Free;
  end;
{$ELSE}
  iniFile := TIniFile.Create(INI_FILE_C);
  try
    Result := iniFile.ReadString(SECTION_C, valueName, defaultValue);
  finally
    iniFile.Free;
  end;
{$ENDIF}
end;


{ TIvPropInfoList }

function GetPropList(typeInfo: PTypeInfo; typeKinds: TTypeKinds; propList: PPropList): Integer;
var
  i, count: Integer;
  propInfo: PPropInfo;
  tempList: PPropList;
begin
  Result := 0;
  count := GetTypeData(TypeInfo)^.PropCount;
  if count > 0 then
  begin
    GetMem(tempList, count * SizeOf(Pointer));
    try
      GetPropInfos(typeInfo, tempList);
      for i := 0 to Count - 1 do
      begin
        propInfo := tempList^[i];
        if (propInfo <> nil) and (propInfo^.PropType^.Kind in typeKinds) then
        begin
          if propList <> nil then
            propList^[Result] := propInfo;
          Inc(Result);
        end;
      end;
    finally
      FreeMem(TempList, count*SizeOf(Pointer));
    end;
  end;
end;

constructor TIvPropInfoList.Create(obj: TObject; Filter: TTypeKinds);
begin
  if obj.ClassInfo = nil then
  begin
    FCount:=0;
    FSize:=0;
  end
  else
  begin
    FCount := GetPropList(obj.ClassInfo, Filter, nil);
    FSize := FCount*SizeOf(Pointer);
    GetMem(FList, FSize);
    GetPropList(obj.ClassInfo, Filter, FList);
  end;
end;

destructor TIvPropInfoList.Destroy;
begin
  if FList <> nil then
    FreeMem(FList, FSize);
end;

function TIvPropInfoList.Get(Index: Integer): PPropInfo;
begin
{$IFDEF VER125}
  Result := PPropList(FList)^[Index];
{$ELSE}
  Result := FList^[Index];
{$ENDIF}
end;

{$IFDEF IVWIDE}
function MlFormat(const format: String; const args: array of const): String;
begin
  Result := SysUtils.Format(Translate(format), args);
end;

procedure MlShowMessage(const msg: string);
begin
  Dialogs.ShowMessage(Translate(msg));
end;

function MlMessageDlg(const msg: string; aType: TMsgDlgType; aButtons: TMsgDlgButtons; helpCtx: Longint): Word;
begin
  Result := Dialogs.MessageDlg(Translate(msg), aType, aButtons, helpCtx);
end;
{$ENDIF}


{ TIvLanguage }

constructor TIvLanguage.Create;
begin
  CreateValue(0, 0, 0, '', '', '', '', 0, []);
end;

constructor TIvLanguage.CreateValue(
  primary, defaultSub, codePage: Integer;
  const subs, englishName, nativeName: String;
  const fontName: String;
  fontSize: Integer;
  options: TIvLanguageOptions);
begin
  inherited Create;

  FSubs := TStringList.Create;
  FISOCountries := TStringList.Create;

  FPrimary := primary;
  FDefaultSub := defaultSub;
  Self.CodePage := codePage;
  AllSubs := subs;
  FEnglishName := englishName;
  FNativeName := nativeName;
  FFontName := fontName;
  FFontSize := fontSize;
  FOptions := options;
end;

destructor TIvLanguage.Destroy;
begin
  FSubs.Free;
  FISOCountries.Free;
  inherited Destroy;
end;

procedure TIvLanguage.SetCodePage(value: Integer);
begin
  FCodePage := value;
{$IFDEF WIN32}
  FCharset := IvCodePageToCharset(FCodePage);
{$ENDIF}
end;

function TIvLanguage.PrimaryEquals(language: TIvLanguage): Boolean;
begin
  Result := (Primary = language.Primary) and ((Primary = 0) or (CodePage = language.CodePage));
end;

procedure TIvLanguage.Init;
begin
  { Old format used -1 as the fake. Now it is 0 }

  if FPrimary < 0 then
    FPrimary := LANG_NEUTRAL;

  if FPrimary = LANG_NEUTRAL then
  begin
    FDefaultSub := 0;
    FSubs.Clear;
    FOptions := [ivloPureASCII];
  end
  else
  begin
    { If the default sub of the language is negative or SUBLANG_NEUTRAL,
      SUBLANG_DEFAULT is used. If the language contains subs the first sub
      is used. }

    if FDefaultSub < SUBLANG_DEFAULT then
    begin
      FDefaultSub := SUBLANG_DEFAULT;
      if FSubs.Count > 0 then
        FDefaultSub := StrToInt(FSubs[0]);
    end;
  end;

  if FPrimary = LANG_NEUTRAL then
  begin
    EnglishName := 'Native';
    NativeName := 'Native';
  end
  else
  begin
{$IFDEF WIN32}
    if ISOLanguage = '' then
      ISOLanguage := GetLocaleStr(Locale, LOCALE_SISO639LANGNAME, '');

    if ISODefaultCountry = '' then
      ISODefaultCountry := GetLocaleStr(Locale, LOCALE_SISO3166CTRYNAME, '');

    if EnglishName = '' then
      EnglishName := TIvDictionary.ComposeLanguageName(
        GetLocaleStr(Locale, LOCALE_SENGLANGUAGE, ''),
        primary,
        codePage,
        False,
        nil);

    if NativeName = '' then
      NativeName := GetLocaleStr(Locale, LOCALE_SNATIVELANGNAME, '');

    if FCodePage = 0 then
      FCodePage := IvLangIdToCodePage(Locale);
{$ENDIF}
    if FCodePage = 0 then
      FCodePage := WESTERN_CP_C;
  end;

  if FActiveSub = 0 then
    FActiveSub := FDefaultSub;
    
{$IFDEF WIN32}
  if FCharset = 0 then
    FCharset := IvCodePageToCharset(FCodePage);
{$ENDIF}
end;

procedure TIvLanguage.Assign(source: TIvLanguage);
begin
  FCodePage := source.FCodePage;
{$IFDEF WIN32}
  FCharset := source.FCharset;
{$ENDIF}
  FPrimary := source.FPrimary;
  FVariant := source.FVariant;
  FDefaultSub := source.FDefaultSub;
  FActiveSub := source.FActiveSub;
  FSubs.Assign(source.FSubs);
  FISOLanguage := source.FISOLanguage;
  FISODefaultCountry := source.FISODefaultCountry;
  FISOCountries.Assign(source.FISOCountries);
  FEnglishName := source.FEnglishName;
  FNativeName := source.FNativeName;
  FFontName := source.FFontName;
  FFontSize := source.FFontSize;
  FOptions := source.FOptions;
end;

function TIvLanguage.Copy: TIvLanguage;
begin
  Result := TIvLanguage.Create;
  Result.Assign(Self);
end;

function TIvLanguage.GetOptionsAsInt: Integer;
begin
  Result := 0;

  if ivloTest in FOptions then
    Result := Result or TEST_MASK_C;

  if ivloPureASCII in FOptions then
    Result := Result or PURE_ASCII_MASK_C;
end;

procedure TIvLanguage.SetOptionsAsInt(value: Integer);
begin
  FOptions := [];

  if (TEST_MASK_C and value) <> 0 then
    FOptions := FOptions + [ivloTest];

  if (PURE_ASCII_MASK_C and value) <> 0 then
    FOptions := FOptions + [ivloPureASCII];
end;

function TIvLanguage.GetCharsetType: TIvCharacterSetType;
begin
  Result := IvGetCharacterSetType(Locale);
end;

function TIvLanguage.GetAllSubs: String;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to FSubs.Count - 1 do
  begin
    if i = 0 then
      Result := FSubs[i]
    else
      Result := Result + IV_SUB_SEPARATOR_C + FSubs[i];
  end;
end;

procedure TIvLanguage.SetAllSubs(const value: String);
var
  sub: Integer;
  parser: TIvStringParser;
begin
  FSubs.Clear;
  parser := TIvStringParser.CreateValue(value, IV_SUB_SEPARATOR_C);
  try
    while not parser.Eol do
    begin
      sub := parser.GetInteger;
      if sub > 0 then
        FSubs.Add(IntToStr(sub));
    end;
  finally
    parser.Free;
  end;
end;

function TIvLanguage.GetBundleExtension: String;
begin
  Result := '_' + ISOLanguage;
  if FISOCountries.Count > 0 then
    Result := Result + '_' + FISOCountries[0];
end;

function TIvLanguage.GetISOAllCountries: String;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to FISOCountries.Count - 1 do
  begin
    if Result <> '' then
      Result := Result + IV_SUB_SEPARATOR_C;
    Result := Result + FISOCountries[i];
  end;
end;

procedure TIvLanguage.SetISOAllCountries(const value: String);
var
  parser: TIvStringParser;
begin
  FISOCountries.Clear;
  parser := TIvStringParser.CreateValue(value, IV_SUB_SEPARATOR_C);
  try
    while not parser.Eol do
      FISOCountries.Add(parser.GetString);
  finally
    parser.Free;
  end;
end;

class function TIvLanguage.SubStrToSubId(const str: String): Integer;
var
  parser: TIvAnsiParser;
{$IFNDEF WIN32}
  buffer: array[0..255] of Char;
{$ENDIF}
begin
  if str = '' then
    Result := 0
  else
  begin
    parser := TIvAnsiParser.CreateValue(
{$IFDEF WIN32}
      str,
{$ELSE}
      StrPCopy(buffer, str),
{$ENDIF}
      ',');
    try
      Result := parser.GetInteger;
    finally
      parser.Free;
    end;
  end;
end;

function TIvLanguage.GetSub: Integer;
var
  i: Integer;
begin
  if SubCount = 0 then
    Result := SUBLANG_NEUTRAL
  else
  begin
    for i := 0 to SubCount - 1 do
      if Subs[i] = DefaultSub then
      begin
        Result := DefaultSub;
        Exit;
      end;

    Result := Subs[0];
  end;
end;

procedure TIvLanguage.SetSub(value: Integer);
var
  i: Integer;
begin
  if (Primary <> LANG_NEUTRAL) and (value <> Sub) then
  begin
    if value = SUBLANG_NEUTRAL then
    begin
      ClearSubs;
      ClearISOCountries;
    end
    else
    begin
      FDefaultSub := value;

      for i := 0 to SubCount - 1 do
        if value = Subs[i] then
          Exit;

      AddSub(value);
    end;
  end;
end;

function TIvLanguage.GetSubCount: Integer;
begin
  Result := FSubs.Count;
end;

procedure TIvLanguage.ClearSubs;
begin
  FSubs.Clear;
end;

procedure TIvLanguage.AddSub(sub: Integer);
var
  i: Integer;
  found: Boolean;
begin
  found := False;
  for i := 0 to SubCount - 1 do
    if Subs[i] = sub then
    begin
      found := True;
      Break;
    end;

  if not found then
    FSubs.Add(IntToStr(sub));
end;

function TIvLanguage.GetSubs(i: Integer): Integer;
begin
  Result := StrToInt(FSubs[i]);
end;

procedure TIvLanguage.SetActiveSub(value: Integer);
var
  i: Integer;
  found: Boolean;
begin
  if value <> FActiveSub then
  begin
    found := False;
    for i := 0 to SubCount - 1 do
      if value = Subs[i] then
      begin
        found := True;
        Break;
      end;
      
    if (not found and (SubCount > 0)) or (value < 0) then
      FActiveSub := FDefaultSub
    else
      FActiveSub := value
  end;
end;

function TIvLanguage.GetISOCountry: String;
begin
  if ISOCountryCount = 0 then
    Result := ''
  else
    Result := ISOCountries[0];
end;

function TIvLanguage.GetISOCountryCount: Integer;
begin
  Result := FISOCOuntries.Count;
end;

function TIvLanguage.GetISOCountries(i: Integer): String;
begin
  Result := FISOCOuntries[i];
end;

procedure TIvLanguage.ClearISOCountries;
begin
  FISOCOuntries.Clear;
end;

procedure TIvLanguage.AddISOCountry(country: String);
var
  i: Integer;
  found: Boolean;
begin
  found := False;
  for i := 0 to ISOCountryCount - 1 do
    if ISOCountries[i] = country then
    begin
      found := True;
      Break;
    end;

  if not found then
    FISOCOuntries.Add(country);
end;

function TIvLanguage.GetDefaultLocale: Integer;
begin
  { The fake language contains the primary id in the default sub id }

  if FPrimary = LANG_NEUTRAL then
    Result := IvMakeLcId(IvMakeLangId(FDefaultSub, SUBLANG_NEUTRAL), SORT_DEFAULT)
  else
    Result := IvMakeLcId(IvMakeLangId(FPrimary, FDefaultSub), SORT_DEFAULT);
end;

function TIvLanguage.GetActiveLocale: Integer;
begin
  Result := IvMakeLcId(IvMakeLangId(FPrimary, FActiveSub), SORT_DEFAULT);
end;

function TIvLanguage.GetLangId: Integer;
begin
  if FPrimary = LANG_NEUTRAL then
    Result := IvMakeLangId(LANG_NEUTRAL, SUBLANG_NEUTRAL)
  else
    Result := IvMakeLangId(FPrimary, Sub);
end;

function TIvLanguage.GetLocale: Integer;
var
  sub: Integer;
begin
  if FPrimary = LANG_NEUTRAL then
    Result := IvMakeLcId(IvMakeLangId(LANG_NEUTRAL, SUBLANG_NEUTRAL), SORT_DEFAULT)
  else
  begin
    if FSubs.Count > 0 then
      sub := Subs[0]
    else
      sub := FDefaultSub;

    { If sub is not specified, determines the sub from the code page }

    if sub = 0 then
    begin
{$IFDEF IVPRO}
      if FPrimary = LANG_CHINESE then
        case FCodePage of
          SIMPLIFIED_CHINESE_CP_C: sub := SUBLANG_CHINESE_SIMPLIFIED;
          TRADITIONAL_CHINESE_CP_C: sub := SUBLANG_CHINESE_TRADITIONAL;
        end;
{$ENDIF}
      if FPrimary = LANG_CROATIAN then
        case FCodePage of
          EAST_EUROPE_CP_C: sub := SUBLANG_DEFAULT;
          CYRILLIC_CP_C: sub := SUBLANG_SERBIAN_CYRILLIC;
        end;
    end;

    Result := IvMakeLcId(IvMakeLangId(FPrimary, sub), SORT_DEFAULT);
  end;
end;

function TIvLanguage.GetDisplayName(
  displayName: TIvDisplayName;
  dictionary: TIvDictionary): String;
begin
  case displayName of
    ivdnEnglish:
      Result := TIvDictionary.ComposeLanguageName(
        EnglishName,
        Primary,
        CodePage,
        False,
        nil);

    ivdnNative:
      Result := TIvDictionary.ComposeLanguageName(
        NativeName,
        Primary,
        CodePage,
        False,
        nil);

    ivdnTranslated:
      Result := TIvDictionary.ComposeLanguageName(
        EnglishName,
        Primary,
        CodePage,
        True,
        dictionary);
  end;
end;


{ TIvLocale }

function TIvLocale.GetLangId: Integer;
begin
  Result := IvMakeLangId(Primary, Sub);
end;

procedure TIvLocale.SetLangId(value: Integer);
begin
  Primary := IvGetPrimaryFromLocale(value);
  Sub := IvGetPrimaryFromLocale(value);
end;

function TIvLocale.GetLocale: Integer;
begin
  Result := IvMakeLcId(IvMakeLangId(Primary, Sub), SortId);
end;

procedure TIvLocale.SetLocale(value: Integer);
begin
  Primary := IvGetPrimaryFromLocale(value);
  Sub := IvGetPrimaryFromLocale(value);
end;

function TIvLocale.GetCharsetType: TIvCharacterSetType;
begin
  Result := IvGetCharacterSetType(Locale);
end;

function TIvLocale.GetEMU: TIvEMU;
begin
  if IsEMUMember(Locale) then
    Result := GetEMUPhase
  else
    Result := iveNone;
end;

function TIvLocale.GetEMUCurrencyString: String;
begin
  if euroUsage = iveIgnore then
    Result := CurrencyString
  else
    case EMU of
      iveLocalAndEuro:
        if euroUsage = iveNormal then
          Result := CurrencyString
        else
          Result := EURO_CHAR_C;

      iveEuroAndLocal,
      iveEuro:
        Result := EURO_CHAR_C;
    else
      Result := CurrencyString;
    end;
end;

function TIvLocale.Copy: TIvLocale;
begin
  Result := TIvLocale.Create;
  Result.Assign(Self);
end;

procedure TIvLocale.Assign(source: TIvLocale);
var
  i: Integer;
begin
  Primary := source.Primary;
  Sub := source.Sub;
  CodePage := source.CodePage;
  ISOLanguage := source.ISOLanguage;
  ISOCountry := source.ISOCountry;
  IsCustom := source.IsCustom;

  EnglishLanguageName := source.EnglishLanguageName;
  EnglishCountryName := source.EnglishCountryName;
  NativeLanguageName := source.NativeLanguageName;
  NativeCountryName := source.NativeCountryName;
  Win16LanguageName := source.Win16LanguageName;
  Win16CountryName := source.Win16CountryName;

  CurrencyString := source.CurrencyString;
  CurrencyFormat := source.CurrencyFormat;
  NegCurrFormat := source.NegCurrFormat;
  CurrencyDecimals := source.CurrencyDecimals;
  ThousandSeparator := source.ThousandSeparator;
  DecimalSeparator := source.DecimalSeparator;

  DateSeparator := source.DateSeparator;
  ShortDateFormat := source.ShortDateFormat;
  LongDateFormat := source.LongDateFormat;

  TimeSeparator := source.TimeSeparator;
  TimeAMString := source.TimeAMString;
  TimePMString := source.TimePMString;
  TimeLeadingZeros := source.TimeLeadingZeros;
  TimeFormat := source.TimeFormat;
  TimeMarkPosition := source.TimeMarkPosition;

  MeasurementSystem := source.MeasurementSystem;
  CalendarType := source.CalendarType;
  OptionalCalendarType := source.OptionalCalendarType;
  FirstDayOfWeek := source.FirstDayOfWeek;
  FirstWeekOfYear := source.FirstWeekOfYear;

  for i := 1 to 12 do
  begin
    ShortMonthNames[i] := source.ShortMonthNames[i];
    LongMonthNames[i] := source.LongMonthNames[i];
  end;
  for i := 1 to 7 do
  begin
    ShortDayNames[i] := source.ShortDayNames[i];
    LongDayNames[i] := source.LongDayNames[i];
  end;
end;

function TIvLocale.GetDisplayName(
  displayName: TIvDisplayName;
  dictionary: TIvDictionary): String;
begin
  case displayName of
    ivdnEnglish:
      Result := TIvDictionary.ComposeLocaleName(
        EnglishLanguageName,
        EnglishCountryName,
        Primary,
        Sub,
        CodePage,
        False,
        nil);

    ivdnNative:
      Result := TIvDictionary.ComposeLocaleName(
        NativeLanguageName,
        NativeCountryName,
        Primary,
        Sub,
        CodePage,
        False,
        nil);

    ivdnTranslated:
      Result := TIvDictionary.ComposeLocaleName(
        EnglishLanguageName,
        EnglishCountryName,
        Primary,
        Sub,
        CodePage,
        True,
        dictionary);
  end;
end;

procedure TIvLocale.Init;
begin
  if Primary <> LANG_NEUTRAL then
  begin
{$IFDEF WIN32}
    if EnglishLanguageName = '' then
      EnglishLanguageName := GetLocaleStr(Locale, LOCALE_SENGLANGUAGE, '');

    if NativeLanguageName = '' then
      NativeLanguageName := GetLocaleStr(Locale, LOCALE_SNATIVELANGNAME, '');

    if EnglishCountryName = '' then
      EnglishCountryName := GetLocaleStr(Locale, LOCALE_SENGCOUNTRY, '');

    if NativeCountryName = '' then
      NativeCountryName := GetLocaleStr(Locale, LOCALE_SNATIVECTRYNAME, '');

    if CodePage = 0 then
      CodePage := IvLangIdToCodePage(Locale);
{$ENDIF}
    if CodePage = 0 then
      CodePage := 1252;
  end;

{$IFDEF WIN32}
  if Charset = 0 then
    Charset := IvLangIdToCharset(Locale);
{$ENDIF}
end;


{ TIvContext }

constructor TIvContext.CreateValue(const form, component: String);
begin
  inherited Create;
  FForm := form;
  FComponent := component;
  FKind := '';
end;

procedure TIvContext.Clear;
begin
  FForm := '';
  FComponent := '';
  FKind := '';
end;

procedure TIvContext.Assign(context: TIvContext);
begin
  FForm := context.Form;
  FComponent := context.Component;
  FKind := context.Kind;
end;

function TIvContext.Equals(context: TIvContext): Boolean;
begin
  Result := (FForm = context.Form) and (FComponent = context.Component) and (FKind = context.Kind);
end;

class function TIvContext.ContextCodeToType(value: TIvContextCode): TIvContextType;
begin
  case value of
    ivccFlat: Result := [];
    ivccFull: Result := [ivctForm, ivctComponent];
    ivccComponent: Result := [ivctComponent];
    ivccForm: Result := [ivctForm];
  end;
end;

class function TIvContext.ContextTypeToCode(value: TIvContextType): TIvContextCode;
begin
  if value = [] then
    Result := ivccFlat
  else if value = [ivctForm, ivctComponent] then
    Result := ivccFull
  else if value = [ivctComponent] then
    Result := ivccComponent
  else
    Result := ivccForm;
end;


{ TIvTranslation }

constructor TIvTranslation.CreateValue(const str, form, component: String);
begin
  inherited Create;
{$IFNDEF WIN32}
  FStr := nil;
  FForm := nil;
  FComponent := nil;
  FCurrent := nil;
{$ENDIF}
  Self.Str := str;
  Self.Form := form;
  Self.Component := component;
end;

{$IFNDEF WIN32}
constructor TIvTranslation.Create;
begin
  inherited Create;
  FStr := nil;
  FForm := nil;
  FComponent := nil;
  FCurrent := nil;
end;

destructor TIvTranslation.Destroy;
begin
  FreeStr(FStr);
  FreeStr(FForm);
  FreeStr(FComponent);
  FreeStr(FCurrent);
  inherited Destroy;
end;

procedure TIvTranslation.FreeStr(var value: PChar);
begin
  if value <> nil then
  begin
    FreeMem(value, StrLen(value) + 1);
    value := nil;
  end;
end;

function TIvTranslation.GetStr: String;
begin
  Result := StrPas(FStr);
end;

procedure TIvTranslation.SetStr(value: String);
begin
  FreeStr(FStr);
  GetMem(FStr, Length(value) + 1);
  StrPCopy(FStr, value);
end;

function TIvTranslation.GetForm: String;
begin
  Result := StrPas(FForm);
end;

procedure TIvTranslation.SetForm(value: String);
begin
  FreeStr(FForm);
  GetMem(FForm, Length(value) + 1);
  StrPCopy(FForm, value);
end;

function TIvTranslation.GetComponent: String;
begin
  Result := StrPas(FComponent);
end;

procedure TIvTranslation.SetComponent(value: String);
begin
  FreeStr(FComponent);
  GetMem(FComponent, Length(value) + 1);
  StrPCopy(FComponent, value);
end;

function TIvTranslation.GetCurrent: String;
begin
  Result := StrPas(FCurrent);
end;

procedure TIvTranslation.SetCurrent(value: String);
begin
  FreeStr(FCurrent);
  GetMem(FCurrent, Length(value) + 1);
  StrPCopy(FCurrent, value);
end;
{$ENDIF}

function TIvTranslation.GetKey: String;
begin
  Result := ComposeKey(Str, Form, Component);
end;

class function TIvTranslation.ComposeKey(const str, form, component: String): String;
begin
  Result := Str + CONTEXT_SEPARATOR_C + Form + Component;
end;


{ TIvDictionary }

constructor TIvDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);

  Dictionaries.Add(Self);
{$IFDEF IVWIDE}
  if not Assigned(Application.OnException) then
    Application.OnException := HandleException;
{$ENDIF}

  FOpen := False;
  FContextType := [];
  FActiveLocale := 0;
  FNativeLocale := 0;
  FLocale := IvMakeLcId(IvMakeLangId(LANG_NEUTRAL, SUBLANG_DEFAULT), SORT_DEFAULT);
  FLanguage := LANG_USER;
  FBinding := ivbiLocaleToLanguage;
  FEuro := iveNormal;
  FDictionaryCode := Integer(liProfessional);

  FOptions := [ivdoUpdateLocaleVariables, ivdoAutoTranslate, ivdoYear2000,
    ivdoTranslateResourceStrings, ivdoRecreateMDIChild];
  FMissingTranslation := ivmtUseNative;
{$IFDEF WIN32}
  FCheckLevel := ivclCodePage;
{$ENDIF}

  FTranslators := TList.Create;
  FLanguageData := TIvLanguage.Create;
  FTempLanguageData := nil;
  FLocaleData := TIvLocale.Create;
  FTempLocaleData := nil;
end;

destructor TIvDictionary.Destroy;
begin
  UnbindTranslators;
  if Dictionaries <> nil then
    Dictionaries.Remove(Self);
  FLocaleData.Free;
  FTempLocaleData.Free;
  FLanguageData.Free;
  FTempLanguageData.Free;
  FTranslators.Free;
  inherited Destroy;
end;

{$IFDEF IVVB}
function TIvDictionary.GetTranslationMode: TIvTranslationMode;
begin
  Result := ivtmSingle;
end;
{$ENDIF}

function TIvDictionary.GetContextCode: TIvContextCode;
begin
  Result := TIvContext.ContextTypeToCode(FContextType);
end;

procedure TIvDictionary.SetDictionaryName(const value: String);
begin
  FDictionaryName := value;
end;

function TIvDictionary.GetPrimaryLanguage: Integer;
begin
  Result := IvGetPrimaryFromLocale(FLocale);
end;

procedure TIvDictionary.SetPrimaryLanguage(value: Integer);
begin
  SetLocale(IvMakeLcId(IvMakeLangId(value, SubLanguage), SORT_DEFAULT));
end;

function TIvDictionary.GetSubLanguage: Integer;
begin
  Result := IvGetSubFromLocale(FLocale);
end;

procedure TIvDictionary.SetSubLanguage(value: Integer);
begin
  SetLocale(IvMakeLcId(IvMakeLangId(PrimaryLanguage, value), SORT_DEFAULT));
end;

procedure TIvDictionary.ReadDictionaryCode(reader: TReader);
{$IFDEF IVBINARY}
var
  valid: Boolean;
  dialog: TIvDemoDialog;
{$ENDIF}
begin
  FDictionaryCode := reader.ReadInteger;
{$IFDEF IVBINARY}
  if ((FDictionaryCode = Integer(liNone)) or
    (FDictionaryCode = Integer(liEvaluation))) and
    not IsDesignTime then
  begin
  {$IFDEF WIN32}
    valid := GetTimeStampDaysLeft(
      KEY_C,
      STAMP_C,
    {$IFDEF IVVB}
      VB_CRYPTO_KEY_C
    {$ELSE}
      VCL_CRYPTO_KEY_C
    {$ENDIF}
      ) > 0;
  {$ELSE}
    valid := GetTimeStampDaysLeft(
      INI_FILE_C,
      SECTION_C,
      STAMP_C,
    {$IFDEF IVVB}
      VB_CRYPTO_KEY_C
    {$ELSE}
      VCL_CRYPTO_KEY_C
    {$ENDIF}
      ) > 0;
  {$ENDIF}

    if not valid then
    begin
      dialog := TIvDemoDialog.CreateValue(nil, KEY_C);
      try
        dialog.ShowModal;
      finally
        dialog.Free;
      end;
    end;
  end;
{$ENDIF}
end;

procedure TIvDictionary.WriteDictionaryCode(writer: TWriter);
{$IFDEF IVBINARY}
var
  str: String;
  code: Integer;
{$ENDIF}
begin
{$IFDEF IVBINARY}
  if IsDesignTime then
  begin
    try
      str := GetMLRegistryValue(DICTIONARY_CODE_C, '');
      code := StrToInt(str);
      if (code < Integer(Low(TIvLicense))) or (code > Integer(High(TIvLicense))) then
        raise Exception.Create('');
    except
      MessageDlg(
        'The Multilizer configuration is corrupted.'#13#10 +
        'Install Multilizer again!',
        mtInformation,
        [mbOK],
        0);
      code := Integer(liEvaluation);
    end;
    writer.WriteInteger(code);
  end;
{$ENDIF}
end;

procedure TIvDictionary.DefineProperties(filer: TFiler);
begin
  inherited DefineProperties(filer);
  filer.DefineProperty(
    'DictionaryCode',
    ReadDictionaryCode,
    WriteDictionaryCode,
{$IFDEF IVBINARY}
    True
{$ELSE}
    False
{$ENDIF}
    );
end;

class procedure TIvDictionary.SetTimeFormats(
  format: TIvTimeFormat;
  markPosition: TIvTimeMarkPosition;
  leadingZeros: Boolean;
  var shortTimeFormat, longTimeFormat: String);
var
  hourFormat, timePrefix, timePostfix: String;
begin
  if leadingZeros then
    hourFormat := 'hh'
  else
    hourFormat := 'h';

  timePostfix := '';
  timePrefix := '';
  if format = ivtf12 then
  begin
    case markPosition of
      ivtmSuffix: timePostfix := ' AMPM';
      ivtmPrefix: timePrefix := 'AMPM ';
    end;
  end;

  shortTimeFormat := timePrefix + hourFormat + ':mm' + timePostfix;
  longTimeFormat := timePrefix + hourFormat + ':mm:ss' + timePostfix;
end;

class function TIvDictionary.TranslateDateFormat(const formatStr: String): String;
var
  i: Integer;
{$IFDEF IVIME}
  CalType: Integer;
  Era, RemoveEra: Boolean;
{$ENDIF}
begin
{$IFDEF IVIME}
  I := 1;
  Result := '';
  CalType := StrToIntDef(GetLocaleStr(GetThreadLocale, LOCALE_ICALENDARTYPE, '1'), 1);
  Era := CalType in [CAL_JAPAN, CAL_TAIWAN, CAL_KOREA];
  if not Era then
  begin
    RemoveEra := SysLocale.PriLangID in [LANG_JAPANESE, LANG_CHINESE, LANG_KOREAN];
    if RemoveEra then
    begin
      While I <= Length(FormatStr) do
      begin
        if not (FormatStr[I] in ['g', 'G']) then
          Result := Result + FormatStr[I];
        Inc(I);
      end;
    end
    else
      Result := FormatStr;
    Exit;
  end;

  while I <= Length(FormatStr) do
  begin
    if FormatStr[I] in LeadBytes then
    begin
      Result := Result + Copy(FormatStr, I, 2);
      Inc(I, 2);
    end else
    begin
      if StrLIComp(@FormatStr[I], 'gg', 2) = 0 then
      begin
        Result := Result + 'ggg';
        Inc(I, 1);
      end
      else if StrLIComp(@FormatStr[I], 'yyyy', 4) = 0 then
      begin
        Result := Result + 'ee';
        Inc(I, 4-1);
      end
      else if StrLIComp(@FormatStr[I], 'yy', 2) = 0 then
      begin
        Result := Result + 'ee';
        Inc(I, 2-1);
      end
      else if FormatStr[I] in ['y', 'Y'] then
        Result := Result + 'e'
      else
        Result := Result + FormatStr[I];
      Inc(I);
    end;
  end;
{$ELSE}
  Result := formatStr;
  for i := 1 to Length(Result) do
    if Result[i] = '''' then
      Result[i] := '"';
{$ENDIF}
end;

procedure TIvDictionary.SynchronizeLocale;
var
  oldLocale: Integer;
begin
  { Sets the locale match the active language }

  if IsOpen then
  begin
    oldLocale := FActiveLocale;
    InitLocale(FLanguageData.DefaultLocale);
    if FActiveLocale <> oldLocale then
      LanguageChanged(False, True);
  end;
end;

procedure TIvDictionary.SynchronizeLanguage;
var
  oldLanguage: Integer;
begin
  { Sets the language match the active locale }

  if IsOpen then
  begin
    oldLanguage := FActiveLanguage;
    InitLanguage(LocaleToLanguage(FActiveLocale));
    if FActiveLanguage <> oldLanguage then
      LanguageChanged(True, False);
  end;
end;

procedure TIvDictionary.SetLanguage(value: Integer);
var
  oldLocale: Integer;
begin
  if not IsOpen then
    FLanguage := value
  else if (value < LANG_SYSTEM) or (value >= LanguageCount) then
    raise ERangeError.Create('Language index ' + IntToStr(value) + ' is out of range')
  else if value <> FLanguage then
  begin
    FLanguage := value;

    { Checks the language and accepts it }

    InitLanguage(FLanguage);

    { Updates the locale if the language and locale has been bound together }

    oldLocale := FActiveLocale;

    if FBinding = ivbiLocaleToLanguage then
      InitLocale(FLanguageData.ActiveLocale);

    { Updates the language }

    LanguageChanged(True, oldLocale <> FActiveLocale);
  end;
end;

procedure TIvDictionary.SetLocale(value: Integer);
var
  oldLanguage, newLanguage: Integer;
begin
  if not IsOpen then
    FLocale := value
  else if value <> FLocale then
  begin
    FLocale := value;

    { Checks the locale and accepts it }

    InitLocale(FLocale);

    { Updates the language if the language and locale has been bound together }

    oldLanguage := FActiveLanguage;

    if FBinding = ivbiLanguageToLocale then
    begin
      newLanguage := LocaleToLanguage(FActiveLocale);
      if newLanguage < 0 then
        InitLanguage(DefaultLanguage)
      else
      begin
        { Inits the language. However the default initialization sets the language
          locale to the default locale of the language. However, in this case
          the active locale is used. }

        InitLanguage(newLanguage);
        FLanguageLocale := FActiveLocale;
      end;
    end;

    LanguageChanged(oldLanguage <> FActiveLanguage, True);
  end;
end;

{
procedure TIvDictionary.InitLocale(locale: Integer);


begin
  if FBinding = ivbiLocaleToLanguage then
  begin
    if FOriginalLanguage = LANG_SYSTEM then
      locale := CheckLocale(GetSystemDefaultLCID, locale)
    else
      locale := CheckLocale(GetUserDefaultLCID, locale);
  end;
end;
}

procedure TIvDictionary.InitLanguage(language: Integer);
var
  primary, sub: Integer;

  function CheckLocale(systemLocale, defaultLocale: Integer): Integer;
  begin
    if IvGetPrimaryFromLocale(systemLocale) = IvGetPrimaryFromLocale(defaultLocale) then
      Result := systemLocale
    else
      Result := defaultLocale;
  end;

begin
  { Inits the language, the language data and the language locale }

  FSuperLanguage := 0;
  case language of
    LANG_SYSTEM: FActiveLanguage := LocaleToLanguage(GetSystemDefaultLCID);
    LANG_USER: FActiveLanguage := LocaleToLanguage(GetUserDefaultLCID);
  else
    FActiveLanguage := language;
  end;

  if FActiveLanguage < 0 then
    FActiveLanguage := DefaultLanguage;
  if FActiveLanguage = -1 then
    raise EIvMulti.Create('System does not support any language of the dicitonary!');

  FLanguageData.Free;
  FLanguageData := TIvLanguage.Create;
  if LanguageCount > 0 then
  begin
    { Gets first the language data of the native language }

    GetLanguageData(0, FLanguageData);
    sub := SUBLANG_NEUTRAL;
    case FLanguageData.CodePage of
      JAPANESE_CP_C: primary := LANG_JAPANESE;

      KOREAN_CP_C:
      begin
        primary := LANG_KOREAN;
        sub := SUBLANG_KOREAN;
      end;

      KOREAN_JOHAB_CP_C:
      begin
        primary := LANG_KOREAN;
        sub := SUBLANG_KOREAN_JOHAB;
      end;

      SIMPLIFIED_CHINESE_CP_C:
      begin
        primary := LANG_CHINESE;
        sub := SUBLANG_CHINESE_SIMPLIFIED;
      end;

      TRADITIONAL_CHINESE_CP_C:
      begin
        primary := LANG_CHINESE;
        sub := SUBLANG_CHINESE_TRADITIONAL;
      end;
    else
      primary := LANG_ENGLISH;
    end;
    FNativeLocale := IvMakeLangId(primary, sub);

    { Gets the language data }

    GetLanguageData(FActiveLanguage, FLanguageData);
    if FBinding = ivbiLocaleToLanguage then
    begin
      if FOriginalLanguage = LANG_SYSTEM then
        FLanguageData.ActiveSub := IvGetSubFromLocale(CheckLocale(
          GetSystemDefaultLCID,
          FLanguageData.DefaultLocale))
      else
        FLanguageData.ActiveSub := IvGetSubFromLocale(CheckLocale(
          GetUserDefaultLCID,
          FLanguageData.DefaultLocale));
    end;

    { Gets the super language }

    if FLanguageData.SubCount > 0 then
      FSuperLanguage := LocaleToLanguage(IvMakeLangId(FLanguageData.Primary, 0));
  end;

  FLanguageLocale := FLanguageData.ActiveLocale;

{$IFNDEF IVPRO}
  { Checks if Multilizer pro is required }

  if {(FEdition = edStandard) and }IvDoesLanguageRequirePro(FLanguageData.Primary) then
    raise EIvMulti.Create(
      'Professional edition of Multilizer is required for ' + FLanguageData.EnglishName);
{$ENDIF}

{$IFDEF WIN32}
  { In the desing state the system support for the language is not checked }

  if not IsDesignTime then
  begin
    case FCheckLevel of
      ivclSystem:
        if not IsLanguageSupportedBySystem(FLanguageData) then
          raise EIvMulti.Create(
            FLanguageData.EnglishName + ' is not supported by the system');

      ivclCodePage:
        if not IsLanguageSupportedByCodePage(FLanguageData) then
          raise EIvMulti.Create(
            FLanguageData.EnglishName + ' is not supported by the code page');
    end;
  end;
{$ENDIF}
end;

procedure TIvDictionary.InitLocale(locale: Integer);
begin
  { Inits the active locale and the locale data }

  FActiveLocale := DecodeLocale(locale);
  FLocaleData.Free;
  FLocaleData := TIvLocale.Create;
  GetLocaleDataById(FActiveLocale, FLocaleData);

{$IFNDEF IVPRO}
  { Checks if Multilizer pro is required }

  if {(FEdition = edStandard) and }IvDoesLanguageRequirePro(IvGetPrimaryFromLocale(locale)) then
    raise EIvMulti.Create(
      'Professional edition of Multilizer is required for this locale (' +
        IntToStr(IvGetPrimaryFromLocale(FActiveLocale)) + ')');
{$ENDIF}

{$IFDEF WIN32}
  { In the desing state the system support for the locale is not checked }

  if not IsDesignTime then
  begin
    case FCheckLevel of
      ivclSystem:
        if not IvIsCodePageSupportedBySystem(FLocaleData.CodePage) then
          raise EIvMulti.Create(
            SysUtils.Format('The locale (%d, %d) is not supported by the system',
            [IvGetPrimaryFromLocale(locale), IvGetSubFromLocale(locale)]));

      ivclCodePage:
        if not IsLocaleSupportedByCodePage(FLocaleData) then
          raise EIvMulti.Create(
            SysUtils.Format('The locale (%d, %d) is not supported by the current code page',
            [IvGetPrimaryFromLocale(locale), IvGetSubFromLocale(locale)]));
    end;
  end;
{$ENDIF}
end;

function TIvDictionary.GetTranslationCount: Integer;
begin
  Result := 0;
end;

function TIvDictionary.TranslateString(
  const str: String;
  var translation: String): Boolean;
begin
  Result := TranslateContextString(str, '', '', translation);
end;

procedure TIvDictionary.SetEuro(value: TIvEuro);
begin
  FEuro := value;
  euroUsage := value;
  CurrencyString := LocaleData.EMUCurrencyString;
end;

procedure TIvDictionary.LanguageChanged(languageChanged, localeChanged: Boolean);
var
  i, day: Integer;
  str: String;
  rect: TRect;
  winPlacement: TWindowPlacement;
{$IFNDEF IVIME}
  size: Integer;
{$ENDIF}

  procedure Year2000(var str: String);
  begin
    if Pos('yyyy', str) = 0 then
      Insert('yy', str, Pos('yy', str));
  end;

begin
{$IFDEF IVPRO32}
  {$IFDEF IVBIDI}
  { In VCL 4 or later it is enough to set the BidiMode of the application
    component to match the current reading order. }

  if LanguageData.CharsetType = ivcsBiDirectional then
    Application.BidiMode := bdRightToLeft
  else
    Application.BidiMode := bdLeftToRight;
  {$ENDIF}
{$ENDIF}

  if localeChanged then
  begin
{$IFDEF WIN32}
    SetThreadLocale(FActiveLocale);
{$ENDIF}

    if ivdoUpdateLocaleVariables in FOptions then
    begin
      { Updates standard VCL locale variables }

{$IFDEF IVWIDE}
      SysLocale.DefaultLCID := FLocaleData.Locale;
      SysLocale.PriLangID := FLocaleData.Primary;
      SysLocale.SubLangID := FLocaleData.Sub;
      SysLocale.FarEast := GetSystemMetrics(SM_DBCSENABLED) <> 0;
{$ENDIF}

      CurrencyString := FLocaleData.EMUCurrencyString;
      CurrencyFormat := Byte(FLocaleData.CurrencyFormat);
      NegCurrFormat := Byte(FLocaleData.NegCurrFormat);
      ThousandSeparator := FLocaleData.ThousandSeparator;
      DecimalSeparator := FLocaleData.DecimalSeparator;
      CurrencyDecimals := FLocaleData.CurrencyDecimals;

      DateSeparator := FLocaleData.DateSeparator;
      ShortDateFormat := FLocaleData.ShortDateFormat;
      LongDateFormat := FLocaleData.LongDateFormat;

      { ML can correct the year format short date using a four digits instead
        of two digits }

      if ivdoYear2000 in FOptions then
      begin
        Year2000(ShortDateFormat);
        Year2000(LongDateFormat);
      end;

      str := FLocaleData.TimeSeparator;
      if str <> '' then
        TimeSeparator := str[1]
      else
        TimeSeparator := ':';
      TimeAMString := FLocaleData.TimeAMString;
      TimePMString := FLocaleData.TimePMString;

      SetTimeFormats(
        FLocaleData.TimeFormat,
        FLocaleData.TimeMarkPosition,
        FLocaleData.TimeLeadingZeros,
        ShortTimeFormat,
        LongTimeFormat);

      for i := 1 to 12 do
      begin
        ShortMonthNames[i] := FLocaleData.ShortMonthNames[i];
        LongMonthNames[i] := FLocaleData.LongMonthNames[i];
      end;

      for i := 1 to 7 do
      begin
        { In VCL XxxxDayNames[1] is not Monday but Sunday }

        if i = 7 then
          day := 1
        else
          day := i + 1;
        ShortDayNames[day] := FLocaleData.ShortDayNames[i];
        LongDayNames[day] := FLocaleData.LongDayNames[i];
      end;
    end;
  end;

  { Makes all translators to translate themselves }

  if ivdoAutoTranslate in FOptions then
    for i := 0 to FTranslators.Count - 1 do
      TIvCustomTranslator(FTranslators.Items[i]).LanguageChanged(languageChanged, localeChanged);

  { Calls the events }

  if languageChanged and Assigned(FOnLanguageChange) then
    FOnLanguageChange(Self);
  if localeChanged and Assigned(FOnLocaleChange) then
    FOnLocaleChange(Self);

  { Force MDI to put back the system menu of a maximized child }

  if languageChanged and
    (ivdoRecreateMDIChild in FOptions) and
    (Application.MainForm <> nil) and
    (Application.MainForm is TForm) then
  begin
    with TForm(Application.MainForm) do
    begin
      if (FormStyle = fsMDIForm) and (ActiveMDIChild <> nil) and (ActiveMDIChild.WindowState = wsMaximized) then
      begin
        { Save window dimension in normal state }

        if MDIChildCount = 1 then
        begin
          GetWindowPlacement(ActiveMDIChild.Handle, @winPlacement);
          rect := winPlacement.rcNormalPosition;
        end;

{$IFDEF IVIME}
        SendMessage(ActiveMDIChild.Handle, CM_RECREATEWND, 0, 0);
{$ELSE}
        size := ActiveMDIChild.ClientWidth + (Longint(ActiveMDIChild.ClientHeight) shl 16);
        SendMessage(ActiveMDIChild.Handle, WM_SIZE, SIZE_RESTORED, size);
        SendMessage(ActiveMDIChild.Handle, WM_SIZE, SIZE_MAXIMIZED, size);
{$ENDIF}

        { Set saved dimension after recreating window }

        if MDIChildCount = 1 then
        begin
          GetWindowPlacement(ActiveMDIChild.Handle, @winPlacement);
          winPlacement.rcNormalPosition := rect;
          SetWindowPlacement(ActiveMDIChild.Handle, @winPlacement);
        end;
      end;
    end;
  end;
end;

function TIvDictionary.GetDefaultLanguage: Integer;
var
  i, start: Integer;
begin
  { Gets the first language of the dictionary }

  if (LanguageCount = 0) or (Languages[0].Primary <> LANG_NEUTRAL) then
    start := 0
  else
    start := 1;

  { Gets the first language of the dictionary that is compatible with the
    current check level. }

{$IFDEF WIN32}
  Result := -1;
  for i := start to LanguageCount - 1 do
  begin
    case FCheckLevel of
      ivclNone:
        Result := i;

      ivclSystem:
        if IsLanguageSupportedBySystem(Languages[i]) then
          Result := i;

      ivclCodePage:
        if IsLanguageSupportedByCodePage(Languages[i]) then
          Result := i;
    end;

    if Result >= 0 then
      Break;
  end;
{$ELSE}
  Result := start;
{$ENDIF}
end;

function TIvDictionary.DecodeLocale(value: Integer): Integer;
begin
  if value = IvMakeLcId(IvMakeLangId(LANG_NEUTRAL, SUBLANG_DEFAULT), SORT_DEFAULT) then
    Result := GetUserDefaultLCID
  else if value = IvMakeLcId(IvMakeLangId(LANG_NEUTRAL, SUBLANG_SYS_DEFAULT), SORT_DEFAULT) then
    Result := GetSystemDefaultLCID
  else
    Result := value;
end;

function TIvDictionary.GetTranslatorCount: Integer;
begin
  Result := FTranslators.Count;
end;

function TIvDictionary.GetTranslator(i: Integer): TIvCustomTranslator;
begin
  Result := FTranslators.Items[i];
end;

function TIvDictionary.GetLanguage(i: Integer): TIvLanguage;
begin
  if i >= LanguageCount then
    raise ERangeError.Create('Out of language range');

  if i = FActiveLanguage then
    Result := FLanguageData
  else
  begin
    FTempLanguageData.Free;
    FTempLanguageData := TIvLanguage.Create;
    GetLanguageData(i, FTempLanguageData);
    Result := FTempLanguageData;
  end;
end;

function TIvDictionary.GetLocale(i: Integer): TIvLocale;
begin
  if i >= LocaleCount then
    raise ERangeError.Create('Out of locale range');

  FTempLocaleData.Free;
  FTempLocaleData := TIvLocale.Create;
  GetLocaleData(i, FTempLocaleData);
  Result := FTempLocaleData;
end;

function TIvDictionary.LocaleToLanguage(locale: Integer): Integer;
var
  i, j, primary, sub: Integer;
  list: TList;
  language: TIvLanguage;
begin
  if locale = IvMakeLcId(IvMakeLangId(LANG_NEUTRAL, SUBLANG_NEUTRAL), SORT_DEFAULT) then
  begin
    Result := 0;
    Exit;
  end;

  locale := DecodeLocale(locale);
  primary := IvGetPrimaryFromLocale(locale);
  sub := IvGetSubFromLocale(locale);

  { Gets all languages }

  list := TList.Create;
  GetLanguageDatas(list);
  try
    { Tries exact match }

    for i := 0 to list.Count - 1 do
    begin
      language := TIvLanguage(list[i]);

      if language.Primary = primary then
      begin
        { If either the default sub or one of the subs contains the
          given sub this language is used. }

        if language.DefaultSub = sub then
        begin
          Result := i;
          Exit;
        end;

        for j := 0 to language.SubCount - 1 do
          if sub = language.Subs[j] then
          begin
            Result := i;
            Exit;
          end;
      end;
    end;

    { Tries neutral match }

    for i := 0 to list.Count - 1 do
    begin
      language := TIvLanguage(list[i]);

      if (language.Primary = primary) and
        ((language.SubCount = 0) or (language.Subs[0] = SUBLANG_NEUTRAL)) then
      begin
        Result := i;
        Exit;
      end;
    end;

    { Tries primary only match }

    for i := 0 to list.Count - 1 do
    begin
      language := TIvLanguage(list[i]);

      if language.Primary = primary then
      begin
        Result := i;
        Exit;
      end;
    end;

    { No language matches the locale }

    Result := -1;
  finally
    FreeList(list);
  end;
end;

function TIvDictionary.IsLocaleSupported(locale: Integer): Boolean;
var
  i: Integer;
  list: TList;
begin
  Result := False;

  list := TList.Create;
  try
    GetLocaleIds(list);

    for i := 0 to list.Count - 1 do
      if Integer(list[i]) = locale then
      begin
        Result := True;
        Break;
      end;
  finally
    list.Free;
  end;  
end;

{$IFDEF WIN32}
class function TIvDictionary.GetCompareOptions(ignoreCase, ignoreSymbols: Boolean): Integer;
begin
  Result := 0;
  if ignoreCase then
    Result := NORM_IGNORECASE;
  //if ignoreSymbols then
  //  Result := NORM_IGNORESYMBOLS;
end;
{$ENDIF}

class function TIvDictionary.IvCompareText(
  const s1, s2: String;
  locale: Integer;
  ignoreSymbols: Boolean): Integer;
begin
{$IFDEF WIN32}
  Result := CompareString(
    locale,
    GetCompareOptions(True, ignoreSymbols),
    PChar(s1),
    Length(s1),
    PChar(s2),
    Length(s2)) - 2;
{$ELSE}
  Result := AnsiCompareText(s1, s2);
{$ENDIF}
end;

class function TIvDictionary.IvCompareStr(
  const s1, s2: String;
  locale: Integer;
  ignoreSymbols: Boolean): Integer;
begin
{$IFDEF WIN32}
  Result := CompareString(
    locale,
    GetCompareOptions(False, ignoreSymbols),
    PChar(s1),
    Length(s1),
    PChar(s2),
    Length(s2)) - 2;
{$ELSE}
  Result := AnsiCompareStr(s1, s2);
{$ENDIF}
end;

class function TIvDictionary.IvCompareBinary(const s1, s2: String): Integer;
var
  i, len, len1, len2: Integer;
begin
  len1 := Length(s1);
  len2 := Length(s2);
  if len1 < len2 then
    len := len1
  else
    len := len2;

  for i := 1 to len do
  begin
    if s1[i] < s2[i] then
    begin
      Result := -1;
      Exit;
    end
    else if s1[i] > s2[i] then
    begin
      Result := 1;
      Exit;
    end;
  end;

  if len1 = len2 then
    Result := 0
  else if len1 < len2 then
    Result := -1
  else
    Result := 1;
end;

{$IFDEF IVWIDE}
function IsNT: Boolean;
var
  versionInfo: TOSVersionInfo;
begin
  versionInfo.dwOSVersionInfoSize := Sizeof(versionInfo);
  GetVersionEx(versionInfo);
  Result := versionInfo.dwPlatformId = VER_PLATFORM_WIN32_NT;
end;

class function TIvDictionary.IvWideCompareText(
  const s1, s2: WideString;
  locale: Integer;
  ignoreSymbols: Boolean): Integer;
var
  codePage: Integer;
begin
  if IsNT then
  begin
    Result := CompareStringW(
      locale,
      GetCompareOptions(True, ignoreSymbols),
      PWideChar(s1),
      Length(s1),
      PWideChar(s2),
      Length(s2));
    if Result = 0 then
      raise Exception.Create(Format('Locale (%0:d) based sorting of "%1:s" and "%2:s" failed', [locale, s1, s2]));
    Result := Result - 2;
  end
  else
  begin
    codePage := IvLangIdToCodePage(locale);
    Result := IvCompareText(
      IvWStrToStr(s1, codePage),
      IvWStrToStr(s2, codePage),
      locale,
      ignoreSymbols);
  end;
end;

class function TIvDictionary.IvWideCompareStr(
  const s1, s2: WideString;
  locale: Integer;
  ignoreSymbols: Boolean): Integer;
var
  codePage: Integer;
begin
  if IsNT then
  begin
    Result := CompareStringW(
      locale,
      GetCompareOptions(False, ignoreSymbols),
      PWideChar(s1),
      Length(s1),
      PWideChar(s2),
      Length(s2));
    if Result = 0 then
      raise Exception.Create(Format('Locale (%0:d) based sorting of "%1:s" and "%2:s" failed', [locale, s1, s2]));
    Result := Result - 2;
  end
  else
  begin
    codePage := IvLangIdToCodePage(locale);
    Result := IvCompareStr(
      IvWStrToStr(s1, codePage),
      IvWStrToStr(s2, codePage),
      locale,
      ignoreSymbols);
  end;
end;

class function TIvDictionary.IvWideCompareBinary(const s1, s2: WideString): Integer;
var
  i, len, len1, len2: Integer;
begin
  len1 := Length(s1);
  len2 := Length(s2);
  if len1 < len2 then
    len := len1
  else
    len := len2;

  for i := 1 to len do
  begin
    if s1[i] < s2[i] then
    begin
      Result := -1;
      Exit;
    end
    else if s1[i] > s2[i] then
    begin
      Result := 1;
      Exit;
    end;
  end;

  if len1 = len2 then
    Result := 0
  else if len1 < len2 then
    Result := -1
  else
    Result := 1;
end;
{$ENDIF}

function IvLangIdToCodePage(langId: Integer): Integer;

  function Chinese: Integer;
  begin
    case IvGetSubFromLocale(langId) of
      SUBLANG_CHINESE_TRADITIONAL,
      SUBLANG_CHINESE_HONGKONG,
      SUBLANG_CHINESE_MACAU:
        Result := TRADITIONAL_CHINESE_CP_C
    else
      Result := SIMPLIFIED_CHINESE_CP_C;
    end;
  end;

begin
{$IFDEF WIN32}
  if IvGetPrimaryFromLocale(langId) = LANG_CHINESE then
    Result := Chinese
  else
    Result := StrToInt(GetLocaleStr(IvMakeLcId(langId, 0), LOCALE_IDEFAULTANSICODEPAGE, '0'));

  if Result > 0 then
    Exit;
{$ENDIF}

  case IvGetPrimaryFromLocale(langId) of
    LANG_THAI:
      Result := THAI_CP_C;

    LANG_JAPANESE:
      Result := JAPANESE_CP_C;

    LANG_KOREAN:
      Result := KOREAN_CP_C;

    LANG_CHINESE:
      Result := Chinese;

    LANG_ALBANIAN,
    LANG_CZECH,
    LANG_HUNGARIAN,
    LANG_POLISH,
    LANG_ROMANIAN,
    LANG_SLOVAK,
    LANG_SLOVENIAN:
      Result := EAST_EUROPE_CP_C;

    LANG_BELARUSIAN,
    LANG_BULGARIAN,
    LANG_RUSSIAN,
    LANG_UKRAINIAN:
      Result := CYRILLIC_CP_C;

    {LANG_SERBIAN,}
    LANG_CROATIAN:
      case IvGetSubFromLocale(langId) of
        SUBLANG_DEFAULT,
        SUBLANG_SERBIAN_LATIN:
          Result := EAST_EUROPE_CP_C;
      else
        Result := CYRILLIC_CP_C;
      end;

    LANG_GREEK:
      Result := GREEK_CP_C;

    LANG_TURKISH:
      Result := TURKISH_CP_C;

    LANG_HEBREW:
      Result := HEBREW_CP_C;

    LANG_FARSI,
    LANG_ARABIC:
      Result := ARABIC_CP_C;

    LANG_ESTONIAN,
    LANG_LATVIAN,
    LANG_LITHUANIAN:
      Result := BALTIC_CP_C;

    LANG_VIETNAMESE:
      Result := VIETNAMESE_CP_C;

    LANG_AZERI:
      if IvGetSubFromLocale(langId) = SUBLANG_AZERI_CYRILLIC then
        Result := CYRILLIC_CP_C
      else
        Result := TURKISH_CP_C;

    LANG_UZBEK:
      if IvGetSubFromLocale(langId) = SUBLANG_UZBEK_CYRILLIC then
        Result := CYRILLIC_CP_C
      else
        Result := TURKISH_CP_C;
  else
    Result := WESTERN_CP_C;
  end;
end;

{$IFDEF WIN32}
class function TIvDictionary.IsLanguageSupportedBySystem(language: TIvLanguage): Boolean;
begin
  { Language is supported by system if it uses only standard ASCII or it uses
    the same code page as the system. }

  Result :=
    (language.Primary = LANG_NEUTRAL) or
    (language.Primary = LANG_ENGLISH) or
    (language.Primary = LANG_INDONESIAN) or
    (ivloPureASCII in language.Options) or
    IvIsCodePageSupportedBySystem(language.CodePage);
end;

class function TIvDictionary.IsLanguageSupportedByCodePage(language: TIvLanguage): Boolean;
begin
  { Language is supported by the code page if it uses only standard ASCII or
    it is compatible with the current code page. }

  Result :=
    (language.Primary = LANG_NEUTRAL) or
    (language.Primary = LANG_ENGLISH) or
    (language.Primary = LANG_INDONESIAN) or
    (ivloPureASCII in language.Options) or
    (language.CodePage = 0) or
    (language.CodePage = Integer(GetACP));
end;

class function TIvDictionary.IsLocaleSupportedBySystem(locale: TIvLocale): Boolean;
begin
  { Locale is supported by system if it uses only standard ASCII or it uses
    the same code page as the system. }

  Result :=
    (locale.Primary = LANG_NEUTRAL) or
    (locale.Primary = LANG_ENGLISH) or
    (locale.Primary = LANG_INDONESIAN) or
    IvIsCodePageSupportedBySystem(locale.CodePage);
end;

class function TIvDictionary.IsLocaleSupportedByCodePage(locale: TIvLocale): Boolean;
begin
  { Locale is supported by the code page if it uses only standard ASCII or
    it is compatible with the current code page. }

  Result :=
    (locale.Primary = LANG_NEUTRAL) or
    (locale.Primary = LANG_ENGLISH) or
    (locale.Primary = LANG_INDONESIAN) or
    (locale.CodePage = Integer(GetACP));
end;

function IvIsCodePageSupportedBySystem(codePage: Integer): Boolean;

  function EnumCodePages(locale: PChar): Integer; stdcall;
  begin
    if StrToInt(locale) = enumInteger then
      supported := True;
    Result := 1;
  end;

begin
  if codePage = 0 then
    Result := True
  else
  begin
    enumInteger := codePage;
    supported := False;
    EnumSystemCodePages(@EnumCodePages, CP_SUPPORTED);
    Result := supported;
  end;
end;

function IvIsLocaleSupportedByCodePage(locale: Integer): Boolean;
var
  primary, codePage: Integer;
begin
  primary := IvGetPrimaryFromLocale(locale);
  if primary = LANG_NEUTRAL then
    Result := True
  else
  begin
    codePage := StrToInt(GetLocaleStr(locale, LOCALE_IDEFAULTANSICODEPAGE, '0'));
    Result :=
      (primary = LANG_ENGLISH) or
      (primary = LANG_INDONESIAN) or
      (Integer(GetACP) = codePage);
  end;
end;

function TIvDictionary.CompareText(const s1, s2: String): Integer;
begin
  Result := IvCompareText(s1, s2, LanguageLocale, False);
end;

function TIvDictionary.CompareStr(const s1, s2: String): Integer;
begin
  Result := IvCompareStr(s1, s2, LanguageLocale, False);
end;
{$ENDIF}

function TIvDictionary.IsOpen: Boolean;
begin
  Result := FOpen;
end;

function TIvDictionary.CanBeOpened: Boolean;
begin
  Result := True;
end;

procedure TIvDictionary.Open;
var
  language: Integer;
{$IFDEF IVWIDE}
  {$IFNDEF IVVB}
  protect: Integer;
  {$ENDIF}
{$ENDIF}
begin
  if IsOpen or not CanBeOpened then
    Exit;

  FOriginalLanguage := FLanguage;
  try
    { Sets the initial language and locale }

    case FBinding of
      ivbiNone:
      begin
        { Language and locale are not connected. Sets both separately.}

        InitLanguage(FLanguage);
        InitLocale(FLocale);
      end;

      ivbiLocaleToLanguage:
      begin
        { Locale is connected to the language. Sets the language first and
          sets then the locale to the default locale of the language. }

        InitLanguage(FLanguage);
        InitLocale(FLanguageData.ActiveLocale);
      end;

      ivbiLanguageToLocale:
      begin
        { Language is connected to the locale. Sets the locale first. Then
          check if the dictionary contains the language of the locale. If does
          sets that language on. Otherwise sets the default language. }

        InitLocale(FLocale);

        language := LocaleToLanguage(FActiveLocale);
        if language < 0 then
          InitLanguage(DefaultLanguage)
        else
        begin
          { The InitLanguage sets the language locale to the default locale of
            the language.
            However, in this case the active locale is used. }

          InitLanguage(language);
          FLanguageLocale := FActiveLocale;
        end;
      end;
    end;

{$IFDEF IVWIDE}
  {$IFNDEF IVVB}
    { Automatic resource string translation is turned on only when the
      application is statically linked (e.g. does not use packages) }

    if not IsDesignTime and
      not vclFunctionsChanged and
      (ivdoTranslateResourceStrings in FOptions) and
      (LibModuleList.Next = nil) then
    begin
      VirtualProtect(@LoadResString, 34, PAGE_READWRITE, @protect);
      Move((@LoadResString)^, loadResStringBuffer, 34);
      Move((@IvLoadResString)^, (@LoadResString)^, 34);
      VirtualProtect(@LoadResString, 34, protect, @protect);

      VirtualProtect(@LoadStr, 34, PAGE_READWRITE, @protect);
      Move((@LoadStr)^, loadStrBuffer, 34);
      Move((@IvLoadStr)^, (@LoadStr)^, 34);
      VirtualProtect(@LoadStr, 34, protect, @protect);

      VirtualProtect(@ShortCutToText, 34, PAGE_READWRITE, @protect);
      Move((@ShortCutToText)^, shortCutBuffer, 34);
      Move((@IvShortCutToText)^, (@ShortCutToText)^, 34);
      VirtualProtect(@ShortCutToText, 34, protect, @protect);

      vclFunctionsChanged := True;
    end;
  {$ENDIF}
{$ENDIF}

{$IFDEF IVBINARY}
    if FDictionaryCode = Integer(liLimited) then
    begin
      if LanguageCount > LIMITED_VERSION_LANGAUGE_COUNT_C then
      begin
        Close;
        raise EIvMulti.Create(Format(
          'The maximum language count of the limited version is %d.',
          [LIMITED_VERSION_LANGAUGE_COUNT_C]));
      end;

      if TranslationCount > LIMITED_VERSION_TRANSLATION_COUNT_C then
      begin
        Close;
        raise EIvMulti.Create(Format(
          'The maximum translation count of the limited version is %d.',
          [LIMITED_VERSION_TRANSLATION_COUNT_C]));
      end;
    end;
{$ENDIF}

    { Updates the language }

    FOpen := True; { This must be called before LanguageChanged }
    LanguageChanged(True, True);
  except
    Close;
    raise;
  end;
end;

procedure TIvDictionary.Close;
{$IFDEF IVWIDE}
  {$IFNDEF IVVB}
var
  protect: Integer;
  {$ENDIF}
{$ENDIF}
begin
{$IFDEF IVWIDE}
  {$IFNDEF IVVB}
  if not IsDesignTime and vclFunctionsChanged then
  begin
    VirtualProtect(@LoadResString, 34, PAGE_READWRITE, @protect);
    Move(loadResStringBuffer, (@LoadResString)^, 34);
    VirtualProtect(@LoadResString, 34, protect, @protect);

    VirtualProtect(@LoadStr, 34, PAGE_READWRITE, @protect);
    Move(loadStrBuffer, (@LoadStr)^, 34);
    VirtualProtect(@LoadStr, 34, protect, @protect);

    VirtualProtect(@ShortCutToText, 34, PAGE_READWRITE, @protect);
    Move(shortCutBuffer, (@ShortCutToText)^, 34);
    VirtualProtect(@ShortCutToText, 34, protect, @protect);

    vclFunctionsChanged := False;
  end;
  {$ENDIF}
{$ENDIF}

  UnbindTranslators;
  FOpen := False;
end;

procedure TIvDictionary.UnbindTranslators;
begin
  { Unbinds all transaltors from the dictionary }

  while FTranslators.Count > 0 do
    TIvCustomTranslator(FTranslators[0]).Unbind;
end;

procedure TIvDictionary.AddTranslator(translator: TIvCustomTranslator);
var
  i: Integer;
begin
  { Adds the given translator to the translator list if it does not
    already exist there. }

  for i := 0 to FTranslators.Count - 1 do
    if FTranslators.Items[i] = translator then
      Exit;
  FTranslators.Add(translator);
end;

procedure TIvDictionary.RemoveTranslator(translator: TIvCustomTranslator);
begin
  { Removes the given translator from the translator list. }

  FTranslators.Remove(translator);
end;

function TIvDictionary.DoesTranslationExist(const str: String): Boolean;
var
  translation: String;
begin
  Result := TranslateString(str, translation);
end;

function TIvDictionary.DoesContextTranslationExist(const str, form, component: String): Boolean;
var
  translation: String;
begin
  Result := TranslateContextString(str, form, component, translation);
end;

function Translate(const str: String): String;
begin
  if Dictionaries.Count = 0 then
    Result := str
  else
    Result := Dictionaries[0].Translate(str);
end;

function TranslateContext(const str, form, component: String): String;
begin
  if Dictionaries.Count = 0 then
    Result := str
  else
    Result := Dictionaries[0].TranslateContext(str, form, component);
end;

function GetDefaultDictionary: TIvDictionary;
begin
  if Dictionaries.Count = 0 then
    Result := nil
  else
    Result := Dictionaries[0];
end;

function TIvDictionary.Translate(const str: String): String;
var
  ok: Boolean;
  translation: String;
begin
  Result := str;
  if Self = nil then
    Exit;

  if str <> '' then
  begin
    ok := TranslateString(str, translation);
    Result := CheckTranslation(str, translation, ok);
  end;
end;

function TIvDictionary.TranslateContext(const str, form, component: String): String;
var
  ok: Boolean;
  translation: String;
begin
  Result := str;
  if Self = nil then
    Exit;

  { Translates the string }

  if str = '' then
  begin
    ok := True;
    translation := '';
  end
  else if ContextType = [] then
    ok := TranslateString(str, translation)
  else
  begin
    { Tries first to translate with the context information.
      If not found translates without the context information. }

    ok := TranslateContextString(str, form, component, translation);
    if not ok then
      ok := TranslateString(str, translation);
  end;

  Result := CheckTranslation(str, translation, ok);
end;

function TIvDictionary.CheckTranslation(
  const native, translation: String;
  ok: Boolean): String;
const
  TAG_C = '@';
begin
  if ok then
  begin
    { The translation was found from the dictionary. }

    if translation <> '' then
      Result := translation
    else
      case FMissingTranslation of
        ivmtUseNative:
          Result := native;

        ivmtUseNull:
          Result := '';

        ivmtTagNative:
          Result := TAG_C + native + TAG_C;

        ivmtRaiseException:
          raise EIvMulti.Create('Translation for the word "' + native + '" is missing')
      end;
  end
  else
  begin
    { The translation was not found from the dictionary. }

    case FMissingTranslation of
      ivmtUseNative:
        Result := native;

      ivmtUseNull:
        Result := '';

      ivmtTagNative:
        Result := TAG_C + native + TAG_C;

      ivmtRaiseException:
        raise EIvMulti.Create('Dictionary does not contain a translation for the word "' + native + '"')
    end;
  end;
end;

class function TIvDictionary.ComposeLanguageName(
  language: String;
  primary, codePage: Integer;
  translate: Boolean;
  dictionary: TIvDictionary): String;
var
  ext: String;
  parser: TIvStringParser;
begin
  { name[, extension] }

  if translate and (dictionary = nil) then
    dictionary := GetDefaultDictionary;

  ext := '';

  parser := TIvStringParser.CreateValue(language, ' ');
  try
    if (primary = LANG_NORWEGIAN) or (primary = LANG_SPANISH) then
    begin
      parser.Separator := ' ';
      Result := parser.GetString;
    end
    else if primary = LANG_CHINESE then
    begin
      parser.Separator := '(';
      Result := parser.GetString;

      if primary = LANG_CHINESE then
      begin
        if codePage = TRADITIONAL_CHINESE_CP_C then
          ext := 'Traditional'
        else if codePage = SIMPLIFIED_CHINESE_CP_C then
          ext := 'Simplified';
      end;
    end
    else if primary = LANG_KOREAN then
    begin
      parser.Separator := '(';
      Result := parser.GetString;

      if primary = LANG_KOREAN then
      begin
        if codePage = KOREAN_JOHAB_CP_C then
          ext := 'Johab'
        else if codePage = KOREAN_CP_C then
          ext := 'Wansung'
      end;
    end
    else if primary = LANG_SERBIAN then
    begin
      parser.Separator := ' ';
      Result := parser.GetString;

      if codePage = EAST_EUROPE_CP_C then
        ext := 'Latin'
      else if codePage = CYRILLIC_CP_C then
        ext := 'Cyrillic';
    end
    else if (primary = LANG_AZERI) or (primary = LANG_UZBEK) then
    begin
      parser.Separator := ' ';
      Result := parser.GetString;

      if codePage = TURKISH_CP_C then
        ext := 'Latin'
      else if codePage = CYRILLIC_CP_C then
        ext := 'Cyrillic';
    end
    else
      Result := language;

    if translate then
    begin
      Result := dictionary.Translate(Result);
      ext := dictionary.Translate(ext);
    end;

    if ext <> '' then
      Result := Result + ', ' + ext;
  finally
    parser.Free;
  end;
end;

class function TIvDictionary.ComposeCountryName(
  country: String;
  primary, sub, codePage: Integer;
  translate: Boolean;
  dictionary: TIvDictionary): String;
var
  ext: String;
begin
  if translate and (dictionary = nil) then
    dictionary := GetDefaultDictionary;

  Result := country;
  ext := '';

  if primary = LANG_NORWEGIAN then
  begin
    if sub = SUBLANG_NORWEGIAN_BOKMAL then
      ext := 'Bokmal'
    else if sub = SUBLANG_NORWEGIAN_NYNORSK then
      ext := 'Nynorsk';
  end
  else if primary = LANG_KOREAN then
  begin
    if codePage = KOREAN_CP_C then
      ext := 'Wansung'
    else if codePage = KOREAN_JOHAB_CP_C then
      ext := 'Johab';
  end
  else if (primary = LANG_AZERI) or (primary = LANG_UZBEK) then
  begin
    if codePage = CYRILLIC_CP_C then
      ext := 'Cyrillic'
    else if codePage = TURKISH_CP_C then
      ext := 'Latin';
  end
  else if (primary = LANG_SERBIAN) and (sub <> SUBLANG_DEFAULT) then
  begin
    if codePage = CYRILLIC_CP_C then
      ext := 'Cyrillic'
    else if codePage = EAST_EUROPE_CP_C then
      ext := 'Latin';
  end;

  if translate then
  begin
    Result := dictionary.Translate(Result);
    ext := dictionary.Translate(ext);
  end;

  if ext <> '' then
    Result := Result + ', ' + ext;
end;

class function TIvDictionary.ComposeLocaleName(
  language, country: String;
  primary, sub, codePage: Integer;
  translate: Boolean;
  dictionary: TIvDictionary): String;
var
  str: String;
  parser: TIvStringParser;
begin
  if translate and (dictionary = nil) then
    dictionary := GetDefaultDictionary;

  parser := TIvStringParser.CreateValue(language, ' ');
  try
    if primary = LANG_NORWEGIAN then
    begin
      parser.Separator := ' ';
      Result := parser.GetString;
      if sub = SUBLANG_NORWEGIAN_BOKMAL then
        country := 'Bokmal'
      else if sub = SUBLANG_NORWEGIAN_NYNORSK then
        country := 'Nynorsk';

      if translate then
        Result := dictionary.Translate(Result);
    end
    else if primary = LANG_SPANISH then
    begin
      parser.Separator := ' ';
      Result := parser.GetString;

      if translate then
        Result := dictionary.Translate(Result);
    end
    else if primary = LANG_SERBIAN then
    begin
      parser.Separator := ' ';
      Result := parser.GetString;
      if translate then
        Result := dictionary.Translate(Result);

      if (sub <> SUBLANG_DEFAULT) and (codePage <> 0) then
      begin
        if codePage = CYRILLIC_CP_C then
          str := 'Cyrillic'
        else
          str := 'Latin';

        if translate then
          str := dictionary.Translate(str);
        Result := Result + ', ' + str;
      end;
    end
    else if primary = LANG_CHINESE then
    begin
      parser.Separator := '(';
      Result := parser.GetString;
      if translate then
        Result := dictionary.Translate(Result);

      if codePage <> 0 then
      begin
        if codePage = TRADITIONAL_CHINESE_CP_C then
          str := 'Traditional'
        else
          str := 'Simplified';

        if translate then
          str := dictionary.Translate(str);
        Result := Result + ', ' + str;
      end;
    end
    else if primary = LANG_KOREAN then
    begin
      parser.Separator := '(';
      Result := parser.GetString;
      if translate then
        Result := dictionary.Translate(Result);

      if codePage <> 0 then
      begin
        if codePage = KOREAN_JOHAB_CP_C then
        begin
          str := 'Johab';
          if translate then
            str := dictionary.Translate(str);
          Result := Result + ', ' + str;
        end;
      end;

      if sub = SUBLANG_KOREAN_JOHAB then
        country := 'Johab';
    end
    else if (primary = LANG_UZBEK) or (primary = LANG_AZERI) then
    begin
      parser.Separator := ' ';
      Result := parser.GetString;
      if translate then
        Result := dictionary.Translate(Result);

      if codePage <> 0 then
      begin
        if codePage = CYRILLIC_CP_C then
          str := 'Cyrillic'
        else
          str := 'Latin';

        if translate then
          str := dictionary.Translate(str);
        Result := Result + ', ' + str;
      end;
    end
    else
    begin
      Result := language;
      if translate then
        Result := dictionary.Translate(Result);
    end;

    if sub <> SUBLANG_NEUTRAL then
    begin
      if translate then
        country := dictionary.Translate(country);
      Result := Result + ' (' +  country + ')';
    end;
  finally
    parser.Free;
  end;
end;

procedure TIvDictionary.GetLanguageDatas(list: TList);
var
  i, count: Integer;
  language: TIvLanguage;
begin
  count := GetLanguageCount;
  for i := 0 to count - 1 do
  begin
    language := TIvLanguage.Create;
    GetLanguageData(i, language);
    list.Add(language);
  end;
end;

procedure TIvDictionary.GetLocaleDatas(list: TList);
var
  i, count: Integer;
  locale: TIvLocale;
begin
  count := GetLocaleCount;
  for i := 0 to count - 1 do
  begin
    locale := TIvLocale.Create;
    GetLocaleData(i, locale);
    list.Add(locale);
  end;
end;

{$IFDEF WIN32}
class function TIvDictionary.GetSystemLocaleData(id: Integer; locale: TIvLocale): Boolean;
const
  TAG_C = '@*';
var
  i: Integer;
begin
  Result := False;
  if GetLocaleStr(id, LOCALE_SENGLANGUAGE, TAG_C) = TAG_C then
    Exit;

  { If there is no code page support for the locale returns false }

  locale.CodePage := StrToInt(GetLocaleStr(id, LOCALE_IDEFAULTANSICODEPAGE, '0'));
  if locale.CodePage = 0 then
    Exit;

  { Finds from the NLS database }

  locale.Primary := IvGetPrimaryFromLocale(id);
  locale.Sub := IvGetSubFromLocale(id);
{$IFDEF WIN32}
  locale.Charset := IvCodePageToCharset(locale.CodePage);
{$ENDIF}
  locale.IsCustom := False;

  locale.EnglishLanguageName := GetLocaleStr(id, LOCALE_SENGLANGUAGE, '');
  locale.EnglishCountryName := GetLocaleStr(id, LOCALE_SENGCOUNTRY, '');
  locale.NativeLanguageName := GetLocaleStr(id, LOCALE_SNATIVELANGNAME, '');
  locale.NativeCountryName := GetLocaleStr(id, LOCALE_SNATIVECTRYNAME, '');
  locale.Win16LanguageName := GetLocaleStr(id, LOCALE_SABBREVLANGNAME, '');
  locale.Win16CountryName := GetLocaleStr(id, LOCALE_SCOUNTRY, '');

  locale.MeasurementSystem := TIvMeasurementSystem(StrToInt(GetLocaleStr(id, LOCALE_IMEASURE, '0')));
  locale.CurrencyString := GetLocaleStr(id, LOCALE_SCURRENCY, '');
  locale.CurrencyFormat := TIvCurrencyFormat(StrToInt(GetLocaleStr(id, LOCALE_ICURRENCY, '0')));
  locale.NegCurrFormat := TIvNegativeCurrencyFormat(StrToInt(GetLocaleStr(id, LOCALE_INEGCURR, '0')));
  locale.CurrencyDecimals := StrToInt(GetLocaleStr(id, LOCALE_ICURRDIGITS, '0'));
  locale.ThousandSeparator := GetLocaleStr(id, LOCALE_STHOUSAND, ' ')[1];
  locale.DecimalSeparator := GetLocaleStr(id, LOCALE_SDECIMAL, ' ')[1];

  locale.DateSeparator := GetLocaleStr(id, LOCALE_SDATE, ' ')[1];
  locale.ShortDateFormat := GetLocaleStr(id, LOCALE_SSHORTDATE, '');
  locale.LongDateFormat := GetLocaleStr(id, LOCALE_SLONGDATE, '');

  locale.TimeSeparator := GetLocaleStr(id, LOCALE_STIME, ' ')[1];
  locale.TimeAMString := GetLocaleStr(id, LOCALE_S1159, '');
  locale.TimePMString := GetLocaleStr(id, LOCALE_S2359, '');
  locale.TimeLeadingZeros := GetLocaleStr(id, LOCALE_ITLZERO, '0') <> '0';
  locale.TimeFormat := TIvTimeFormat(StrToInt(GetLocaleStr(id, LOCALE_ITIME, '0')));
  locale.TimeMarkPosition := TIvTimeMarkPosition(StrToInt(GetLocaleStr(id, LOCALE_ITIMEMARKPOSN, '0')));

  locale.CalendarType := TIvCalendarType(StrToInt(GetLocaleStr(id, LOCALE_ICALENDARTYPE, '0')));
  locale.OptionalCalendarType := TIvCalendarType(StrToInt(GetLocaleStr(id, LOCALE_IOPTIONALCALENDAR, '0')));
  locale.FirstDayOfWeek := TIvDayOfWeek(StrToInt(GetLocaleStr(id, LOCALE_IFIRSTDAYOFWEEK, '0')));
  locale.FirstWeekOfYear := TIvFirstWeekOfYear(StrToInt(GetLocaleStr(id, LOCALE_IFIRSTWEEKOFYEAR, '0')));

  for i := 1 to 7 do
  begin
    locale.ShortDayNames[i] := GetLocaleStr(id, LOCALE_SABBREVDAYNAME1 + i - 1, '');
    locale.LongDayNames[i] := GetLocaleStr(id, LOCALE_SDAYNAME1 + i - 1, '');
  end;

  for i := 1 to 12 do
  begin
    locale.ShortMonthNames[i] := GetLocaleStr(id, LOCALE_SABBREVMONTHNAME1 + i - 1, '');
    locale.LongMonthNames[i] := GetLocaleStr(id, LOCALE_SMONTHNAME1 + i - 1, '');
  end;

  locale.Init;
  
  Result := True;
end;
{$ENDIF}

function TIvDictionary.GetLocaleDataById(id: Integer; locale: TIvLocale): Boolean;
var
  i: Integer;
  locales: TList;
begin
  { Finds first from the locale table }

  locales := TList.Create;
  try
    GetLocaleDatas(locales);
    for i := 0 to locales.Count - 1 do
    begin
      if TIvLocale(locales[i]).Locale = id then
      begin
        locale.Assign(locales[i]);
        Result := True;
        Exit;
      end;
    end;
  finally
    FreeList(locales);
  end;

  { Not found from the dictionary. Finds from the system locale table }

{$IFDEF WIN32}
  Result := GetSystemLocaleData(id, locale);
{$ELSE}
  Result := False;
{$ENDIF}
end;

procedure TIvDictionary.GetPrimaryLanguages(primaries: TStrings; native: Boolean);
var
  found: Boolean;
  i, j: Integer;
  languages: TList;
  language: TIvLanguage;
begin
  languages := TList.Create;
  GetLanguageDatas(languages);

  for i := 0 to LanguageCount - 1 do
  begin
    language := TIvLanguage(languages[i]);

    found := False;
    for j := 0 to i - 1 do
    begin
      if language.Primary = TIvLanguage(languages[j]).Primary then
      begin
        found := True;
        Break;
      end;
    end;

    if not found then
    begin
      if native then
        primaries.AddObject(language.NativeName, TObject(language.Primary))
      else
        primaries.AddObject(language.EnglishName, TObject(language.Primary));
    end;
  end;

  FreeList(languages);
end;

{$IFDEF WIN32}
class procedure TIvDictionary.GetSystemLocales(locales: TList);

  function EnumLocales(localeStr: PChar): Integer; stdcall;
  var
    id: Integer;
    locale: TIvLocale;
  begin
    id := StrToInt('$' + localeStr);
    locale := TIvLocale.Create;
    TIvDictionary.GetSystemLocaleData(id, locale);
    enumList.Add(locale);
    Result := 1;
  end;

begin
  { Gets the system locales }

  enumList := locales;
  EnumSystemLocales(@EnumLocales, LCID_SUPPORTED);
end;

class procedure TIvDictionary.GetSystemLocaleIds(locales: TList);

  function EnumLocales(localeStr: PChar): Integer; stdcall;
  var
    id: Integer;
  begin
    id := StrToInt('$' + localeStr);
    enumList.Add(Pointer(id));
    Result := 1;
  end;

begin
  { Gets the system locales }

  enumList := locales;
  EnumSystemLocales(@EnumLocales, LCID_SUPPORTED);
end;
{$ENDIF}

procedure TIvDictionary.GetLocales(locales: TList);
var
  i, j: Integer;
  found: Boolean;
  locale: TIvLocale;
begin
{$IFDEF WIN32}
  GetSystemLocales(locales);
{$ENDIF}

  { Gets the custom locales }

  for i := 0 to LocaleCount - 1 do
  begin
    locale := TIvLocale.Create;
    GetLocaleData(i, locale);

    { Checks if the locale already exists in the list }

    found := False;
    for j := 0 to locales.Count - 1 do
    begin
      if TIvLocale(locales[j]).Locale = locale.Locale then
      begin
        found := True;
        TIvLocale(locales[j]).Assign(locale);
        Break;
      end;
    end;

    { If not found, adds the locale to the list }

    if found then
      locale.Free
    else
      locales.Add(locale);
  end;
end;

procedure TIvDictionary.GetLocaleIds(locales: TList);
var
  i, j: Integer;
  found: Boolean;
  locale: TIvLocale;
begin
{$IFDEF WIN32}
  GetSystemLocaleIds(locales);
{$ENDIF}

  { Gets the custom locales }

  for i := 0 to LocaleCount - 1 do
  begin
    locale := TIvLocale.Create;
    try
      GetLocaleData(i, locale);

      { Checks if the locale already exists in the list }

      found := False;
      for j := 0 to locales.Count - 1 do
      begin
        if Integer(locales[j]) = locale.Locale then
        begin
          found := True;
          Break;
        end;
      end;

      { If not found, adds the locale to the list }

      if not found then
        locales.Add(Pointer(locale.Locale));
    finally
      locale.Free;
    end;  
  end;
end;

class procedure TIvDictionary.FreeList(list: TList);
var
  i: Integer;
begin
  for i := 0 to list.Count - 1 do
    TObject(list[i]).Free;
  list.Free;
end;


{$IFNDEF WIN32}
function TIvDictionary.GetSystemDefaultLCID: Integer;
begin
  Result := GetUserDefaultLCID;
end;

function TIvDictionary.GetUserDefaultLCID: Integer;
const
  INTL_C = 'intl';
var
  i: Integer;
  language, country: String;
  locales: TList;
  locale: TIvLocale;
begin
  { If the user's default locale has already been determined, returns it }

  if userDefaultLCID <> 0 then
  begin
    Result := userDefaultLCID;
    Exit;
  end;

  { Win16 specifies the locale using the language code and country string.
    They are stored in WIN.INI }

  country := GetProfileStr(INTL_C, 'sCountry', '');
  language := GetProfileStr(INTL_C, 'sLanguage', '');

  locales := TList.Create;
  try
    GetLocaleDatas(locales);

    { Scans the locales to find the matching language code. }

    for i := 0 to locales.Count - 1 do
    begin
      locale := TIvLocale(locales[i]);

      if CompareText(language, locale.Win16LanguageName) = 0 then
      begin
        userDefaultLCID := locale.Locale;
        Result := userDefaultLCID;
        Exit;
      end;
    end;

    { No match found. Gets the first code where the first two characters and
      country match. }

    language := Copy(language, 1, 2);
    for i := 0 to locales.Count - 1 do
    begin
      locale := TIvLocale(locales[i]);

      if (CompareText(language, Copy(locale.Win16LanguageName, 1, 2)) = 0) and
        (CompareText(country, locale.Win16CountryName) = 0) then
      begin
        userDefaultLCID := locale.Locale;
        Result := userDefaultLCID;
        Exit;
      end;
    end;

    { No match found. Gets the first code where the first two characters match. }

    language := Copy(language, 1, 2);
    for i := 0 to locales.Count - 1 do
    begin
      locale := TIvLocale(locales[i]);

      if CompareText(language, Copy(locale.Win16LanguageName, 1, 2)) = 0 then
      begin
        userDefaultLCID := locale.Locale;
        Result := userDefaultLCID;
        Exit;
      end;
    end;

    { No match found. The default language of the dictionary is used. }

    userDefaultLCID := IvMakeLcId(
      IvMakeLangid(Languages[DefaultLanguage].Primary, SUBLANG_DEFAULT),
      SORT_DEFAULT);
    Result := userDefaultLCID;
  finally
    FreeList(locales);
  end;
end;
{$ENDIF}

procedure TIvDictionary.GetSubLanguages(
  language: TIvLanguage;
  subs: TStrings;
  native: Boolean);
var
  i, j, sub: Integer;
  locales: TList;
  locale: TIvLocale;

  procedure Add(locale: TIvLocale);
  var
    i: Integer;
  begin
    for i := 0 to subs.Count - 1 do
    begin
      if Integer(subs.Objects[i]) = locale.Locale then
        Exit;
    end;

    if native then
      subs.AddObject(locale.NativeCountryName, TObject(locale.Locale))
    else
      subs.AddObject(locale.EnglishCountryName, TObject(locale.Locale));
  end;

begin
  locales := TList.Create;
  GetLocales(locales);

  if language.SubCount = 0 then
  begin
    for i := 0 to locales.Count - 1 do
    begin
      locale := TIvLocale(locales[i]);
      if language.Primary = locale.Primary then
        Add(locale);
    end;
  end
  else
  begin
    for i := 0 to language.SubCount - 1 do
    begin
      sub := language.Subs[i];
      for j := 0 to locales.Count - 1 do
      begin
        locale := TIvLocale(locales[j]);
        if (locale.Primary = language.Primary) and (locale.Sub = sub) then
          Add(locale);
      end;
    end;
  end;

  FreeList(locales);
end;

procedure TIvDictionary.TranslateWindow(wnd: THandle; str: String; resize: Boolean);
var
  dc: HDC;
  width, style: Integer;
  rect, calcRect: TRect;
  buffer: array[0..255] of Char;
begin
  { Changes the text of the window. If resizing was allowed resized the window. }

  if str = '' then
  begin
    GetWindowText(wnd, buffer, Sizeof(buffer));
{$IFDEF WIN32}
    str := buffer;
{$ELSE}
    str := StrPas(buffer);
{$ENDIF}
  end;
  str := Translate(str);
{$IFDEF WIN32}
  SetWindowText(wnd, PChar(str));
{$ELSE}
  SetWindowText(wnd, StrPCopy(buffer, str));
{$ENDIF}

  { Resized the window }

  if resize then
  begin
    { Calculates the width of the text. If the current width of the windows is
      less then resizez the window. }

    dc := GetWindowDC(wnd);
    try
{$IFDEF WIN32}
      SelectObject(dc, GetStockObject(DEFAULT_GUI_FONT));
      width := DrawText(dc, PChar(str), -1, calcRect, DT_LEFT or DT_CALCRECT or DT_SINGLELINE);
{$ELSE}
      SelectObject(dc, GetStockObject(SYSTEM_FONT));
      width := DrawText(dc, StrPCopy(buffer, str), -1, calcRect, DT_LEFT or DT_CALCRECT or DT_SINGLELINE);
{$ENDIF}
    finally
      ReleaseDC(wnd, dc);
    end;  
    if width <= 0 then
      Exit;

    width := calcRect.right - calcRect.left;
    GetClassName(wnd, buffer, SizeOf(buffer));
    StrLower(buffer);
{$IFDEF WIN32}
    if buffer = 'button' then
{$ELSE}
    if StrComp(buffer, 'button') = 0 then
{$ENDIF}
    begin
      { Check box and radion buttons need some space for the input area. }

      style := GetWindowLong(wnd, GWL_STYLE);
      if ((style and BS_CHECKBOX) <> 0) or ((style and BS_RADIOBUTTON) <> 0) then
        width := width + 20;
    end;

    { If the current width is less the the needed width resizes the windows }

    GetWindowRect(wnd, rect);
    if (rect.right - rect.left) < width then
      SetWindowPos(wnd, 0, 0, 0, width, rect.bottom - rect.top, SWP_NOMOVE or SWP_NOZORDER);
  end;
end;

function TIvDictionary.IsDesignTime: Boolean;
begin
{$IFDEF IVVB}
  Result := GenericIsDesignTime(Self);
{$ELSE}
  Result := csDesigning in ComponentState;
{$ENDIF}
end;

{ TIvDictionaries }

constructor TIvDictionaries.Create;
begin
  inherited Create;
  FItems := TList.Create;
end;

destructor TIvDictionaries.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

function TIvDictionaries.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TIvDictionaries.GetItems(index: Integer): TIvDictionary;
begin
  Result := FItems[index];
end;

function TIvDictionaries.FindDictionary(const name: String): TIvDictionary;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Result := Items[i];

    if Result.DictionaryName = name then
      Exit;
  end;

  Result := nil;
end;

procedure TIvDictionaries.Add(item: TIvDictionary);
var
  i: Integer;
  name: String;
begin
  if item.DictionaryName = '' then
  begin
    i := Dictionaries.Count;
    repeat
      Inc(i);
      name := 'Dictionary' + IntToStr(i);
      item.DictionaryName := name;
    until FindDictionary(name) = nil;
  end;  

  FItems.Add(item);
end;

procedure TIvDictionaries.Remove(item: TIvDictionary);
begin
  FItems.Remove(item);
end;


{ TIvCustomTranslator }

constructor TIvCustomTranslator.Create(owner: TComponent);
begin
  inherited Create(owner);
  FState := [];
  if IsDesignTime and (Dictionaries.Count > 0) then
    Dictionary := Dictionaries[0];
end;

procedure TIvCustomTranslator.SetDictionary(value: TIvDictionary);
begin
  if value <> FDictionary then
  begin
    if not IsDesignTime and (ivtsBound in FState) then
      UnbindAndSetNative;
    FDictionary := value;
    if FDictionary <> nil then
      FDictionaryName := FDictionary.DictionaryName;
  end;

{$IFDEF WIN32}
  if value <> nil then
    value.FreeNotification(Self);
{$ENDIF}
end;

procedure TIvCustomTranslator.SetDictionaryName(const value: String);
begin
  if FDictionaryName <> value then
  begin
    Dictionary := Dictionaries.FindDictionary(value);
    FDictionaryName := value;
  end;
end;

procedure TIvCustomTranslator.LanguageChanged(languageChanged, localeChanged: Boolean);
begin
end;

{$IFDEF WIN32}
procedure TIvCustomTranslator.TranslateSystemMenu(handle: THandle; mdi: Boolean);
var
  i, j, count: Integer;
  str, current: String;
  menu: THandle;
  info: TMenuItemInfo;
  buffer: array[0..255] of Char;
begin
  if (FDictionary = nil) or (handle = 0) then
    Exit;

{$IFDEF IVBIDI}
  info.cbSize := 44;
{$ELSE}
  info.cbSize := Sizeof(info);
{$ENDIF}
  info.fMask := MIIM_TYPE or MIIM_ID;

  menu := GetSystemMenu(handle, False);
  count := GetMenuItemCount(menu);
  for i := 0 to count - 1 do
  begin
    { Get the menu type }

    info.dwTypeData := buffer;
    info.cch := Sizeof(buffer);
    if not GetMenuItemInfo(menu, i, True, info) then
      Continue;

    if (info.fType and MFT_SEPARATOR) = 0 then
    begin
      case info.wID of
        SC_CLOSE: str := '&Close';
        SC_RESTORE: str := '&Restore';
        SC_MOVE: str := '&Move';
        SC_SIZE: str := '&Size';
        SC_MINIMIZE: str := 'Mi&nimize';
        SC_MAXIMIZE: str := 'Ma&ximize';
        SC_NEXTWINDOW: str := '&Next';

        { To do! Check the following strings }

        SC_PREVWINDOW: str := '&Previous';
        SC_VSCROLL: str := '&Vertical Scroll';
        SC_HSCROLL: str := '&Horizontal Scroll';
        SC_MOUSEMENU: str := '&Mouse';
        SC_KEYMENU: str := '&Key';
        SC_ARRANGE: str := '&Arrange';
        SC_TASKLIST: str := '&Task List';
        SC_SCREENSAVE: str := '&Screen Saver';
        SC_HOTKEY: str := '&Hot Key';
        SC_DEFAULT: str := '&Default';
        SC_MONITORPOWER: str := '&Monitor Power';
      end;

      str := FDictionary.Translate(str);

      { Get the current menu text }

      if GetMenuString(menu, i, buffer, Sizeof(buffer), MF_BYPOSITION) <> 0 then
      begin
        current := buffer;
        j := Pos(#9, current);
        if j > 0 then
        begin
          Delete(current, 1, j);
          str := str + #9 + current;
        end;
      end;

      { Sets the new text value to the menu }

      StrPCopy(buffer, str);
      info.fType := MFT_STRING;
      info.dwTypeData := buffer;
      SetMenuItemInfo(menu, i, True, info);
    end;
  end;
end;

{ Return Window handle to a window containing the system menu.
  By default there are no window with a system menu. However,
  TIvTranslator overrides this to return a window handle to the
  Host-component and TIvTranslatorEx to the VB-form. }

function TIvCustomTranslator.GetSystemMenuWinHandle: THandle;
begin
  Result := 0;
end;
{$ENDIF}

procedure TIvCustomTranslator.TranslateHost;
begin
end;

procedure TIvCustomTranslator.Translate;
begin
  FState := FState + [ivtsBound];
end;

procedure TIvCustomTranslator.Unbind;
begin
  if (ivtsBound in FState) and (FDictionary <> nil) then
    FDictionary.RemoveTranslator(Self);
  FDictionary := nil;
  FState := [];
end;

procedure TIvCustomTranslator.UnbindAndSetNative;
begin
  Unbind;
end;

function TIvCustomTranslator.IsDesignTime: boolean;
begin
{$IFDEF IVVB}
  Result := GenericIsDesignTime(Self);
{$ELSE}
  Result := csDesigning in ComponentState;
{$ENDIF}
end;

{ Locale functions }

function IvDoesLanguageRequirePro(primary: Integer): Boolean;
begin
  case primary of
    LANG_ARABIC,
    LANG_HEBREW,
    LANG_FARSI,

    LANG_CHINESE,
    LANG_JAPANESE,
    LANG_KOREAN,

    LANG_THAI,
    LANG_VIETNAMESE:
      Result := True
  else
    Result := False;
  end;
end;

function IvDoesLanguageRequirePro32(primary: Integer): Boolean;
begin
  case primary of
    LANG_ARABIC,
    LANG_HEBREW,
    LANG_FARSI:
      Result := True
  else
    Result := False;
  end;
end;

function IvMakeLangId(primaryLanguage, subLanguage: Integer): Integer;
begin
  Result := (subLanguage shl 10) or primaryLanguage;
end;

function IvMakeLcId(langId, sortId: Integer): Integer;
begin
  Result := (sortId shl 16) or langId;
end;

function IvGetPrimaryFromLocale(locale: Integer): Integer;
begin
  Result := locale and $3FF;
end;

function IvGetSubFromLocale(locale: Integer): Integer;
begin
  Result := (locale shr 10) and $3F;
end;

function IsEMUMember(locale: Integer): Boolean;
var
  sub: Integer;
begin
  { Emu countries:
    Austria (German)
    Belgium (Dutch, French)
    Finland (Finnish, Swedish)
    France (French)
    Germany (German)
    Irland (English)
    Italy (Italian)
    Luxembourg (German, French)
    Netherlands (Dutch)
    Portugal (Portuguese)
    Spain (Spanish) }

  sub := IvGetSubFromLocale(locale);
  Result := False;
  case IvGetPrimaryFromLocale(locale) of
    LANG_DUTCH:
      Result := (sub = SUBLANG_DUTCH) or (sub = SUBLANG_DUTCH_BELGIAN);

    LANG_ENGLISH:
      Result := sub = SUBLANG_ENGLISH_EIRE;

    LANG_FINNISH:
      Result := sub = SUBLANG_DEFAULT;

    LANG_FRENCH:
      Result := (sub = SUBLANG_FRENCH) or (sub = SUBLANG_FRENCH_BELGIAN) or (sub = SUBLANG_FRENCH_LUXEMBOURG);

    LANG_GERMAN:
      Result := (sub = SUBLANG_GERMAN) or (sub = SUBLANG_GERMAN_AUSTRIAN) or (sub = SUBLANG_GERMAN_LUXEMBOURG);

    LANG_ITALIAN:
      Result := sub = SUBLANG_ITALIAN;

    LANG_PORTUGUESE:
      Result := sub = SUBLANG_PORTUGUESE;

    LANG_SWEDISH:
      Result := sub = SUBLANG_SWEDISH_FINLAND;

    LANG_SPANISH:
      Result := sub = SUBLANG_SPANISH;
  end;
end;

function GetEMUPhase: TIvEMU;
var
  d: TDateTime;
begin
  { Before January 1 1999 only the local currency is used
    From January 1 1999 to January 1 2002 Euro is also used as a account currency
    From January 1 2002 to July 1 2002 both Euro and locale currencies are used
    From July 1 2002 only Euro is used

    Note! July 1 might be moved to an earlied date. }

  d := Date;
  if d < EncodeDate(1999, 1, 1) then
    Result := iveLocal
  else if d < EncodeDate(2002, 1, 1) then
    Result := iveLocalAndEuro
  else if d < EncodeDate(2002, 7, 1) then
    Result := iveEuroAndLocal
  else
    Result := iveEuro;
end;

{$IFDEF WIN32}
function IvGetCharSetInfo(langId: Integer): TIvCharsetInfo;
var
  i: Integer;
  flag: DWORD;
  lfs: TLocaleFontSignature;
begin
  if GetLocaleInfo(IvMakeLcId(langId, 0), LOCALE_FONTSIGNATURE, PChar(@lfs), Sizeof(lfs)) <> 0 then
  begin
    flag := 1;
    for i := 0 to CHARSET_COUNT_C - 1 do
    begin
      if (flag and lfs.fsCsbDefault[0]) <> 0 then
      begin
        Result := CHARSETSET_TO_ID_C[i];
        Exit;
      end;
      flag := flag shl 1;
    end;
  end;
  Result := CHARSETSET_TO_ID_C[0];
end;

function IvLangIdToCharSet(langId: Integer): TFontCharset;
begin
  Result := IvGetCharSetInfo(langId).charSet;
end;

function IvCodePageToCharSet(codePage: Integer): TFontCharset;
var
  i: Integer;
begin
  Result := DEFAULT_CHARSET;
  for i := 0 to CHARSET_COUNT_C - 1 do
  begin
    if CHARSETSET_TO_ID_C[i].codePage = codePage then
    begin
      Result := CHARSETSET_TO_ID_C[i].charSet;
      Exit;
    end;
  end;
end;


const
  CHARSET_CODES_C: array[TIvFontCharset] of TFontCharset =
  (
    DEFAULT_CHARSET,
    OEM_CHARSET,
    SYMBOL_CHARSET,
    MAC_CHARSET,
    ANSI_CHARSET,
    EASTEUROPE_CHARSET,
    BALTIC_CHARSET,
    RUSSIAN_CHARSET,
    GREEK_CHARSET,
    TURKISH_CHARSET,
    ARABIC_CHARSET,
    HEBREW_CHARSET,
    SHIFTJIS_CHARSET,
    HANGEUL_CHARSET,
    JOHAB_CHARSET,
    CHINESEBIG5_CHARSET,
    GB2312_CHARSET,
    THAI_CHARSET,
    VIETNAMESE_CHARSET
  );

function IvCharsetToCode(value: TIvFontCharset): Byte;
begin
  Result := CHARSET_CODES_C[value];
end;

function IvCodeToCharset(value: Byte): TIvFontCharset;
begin
  for Result := Low(TIvFontCharSet) to High(TIvFontCharSet) do
    if CHARSET_CODES_C[Result] = value then
      Exit;
  raise Exception.Create('Invalid charset code');
end;

procedure InitLogFont(var logFont: TLogFont; const name: String; cs: TFontCharset);
begin
  StrPCopy(logFont.lfFaceName, name);
  logFont.lfCharSet := cs;
  case logFont.lfCharSet of
    HEBREW_CHARSET, ARABIC_CHARSET: logFont.lfPitchAndFamily := 0;
  else
    logFont.lfPitchAndFamily := MONO_FONT;
  end;
end;

function IvGetSupportedCharsets: TIvFontCharsets;
var
  cs: TIvFontCharSet;
  supported: Boolean;
  logFont: TLogFont;
  dc: HDC;

  function EnumFontFamilies(
    logFont: PEnumLogFontEx;
    textMetrics: PNewTextMetricEx;
    fontType: Integer;
    var supported: Boolean): Integer; stdcall;
  begin
    supported := True;
    Result := 0;
  end;

begin
  Result := [];
  dc := GetDC(0);
  try
    for cs := Low(TIvFontCharSet) to High(TIvFontCharSet) do
    begin
      InitLogFont(logFont, '', IvCharsetToCode(cs));
      supported := False;
      EnumFontFamiliesEx(dc, logFont, @EnumFontFamilies, Integer(@supported), 0);
      if supported then
        Result := Result + [cs];
    end;
  finally
    ReleaseDC(0, dc);
  end;
end;

function EnumFontNames(
  logFont: PEnumLogFontEx;
  textMetrics: PNewTextMetricEx;
  fontType: Integer;
  names: TStrings): Integer; stdcall;
var
  count: Integer;
  name: String;
begin
  Result := 1;
  count := names.Count;
  name := logFont.elfLogFont.lfFaceName;
  if (count = 0) or (names[count - 1] <> name) and (name[1] <> '@') then
    names.Add(name);
end;

procedure IvGetFontNames(charsets: TIvFontCharsets; names: TStrings);
var
  i, j: Integer;
  cs: TIvFontCharSet;
  logFont: TLogFont;
  newNames, tempNames: TStringList;
  dc: HDC;
begin
  dc := GetDC(0);
  try
    { Gets all the font names }

    InitLogFont(logFont, '', DEFAULT_CHARSET);
    names.Clear;
    EnumFontFamiliesEx(dc, logFont, @EnumFontNames, Integer(names), 0);

    for cs := Low(TIvFontCharSet) to High(TIvFontCharSet) do
    begin
      if not (cs in charsets) then
        Continue;

      { Gets support for each charsets }

      tempNames := TStringList.Create;
      try
        InitLogFont(logFont, '', IvCharsetToCode(cs));
        EnumFontFamiliesEx(dc, logFont, @EnumFontNames, Integer(tempNames), 0);

        { Names and logical AND of names and tempNames }

        newNames := TStringList.Create;
        try
          for i := 0 to names.Count - 1 do
          begin
            for j := 0 to tempNames.Count - 1 do
            begin
              if names[i] = tempNames[j] then
              begin
                newNames.Add(names[i]);
                Break;
              end;
            end;
          end;

          { Updates the font name list }

          names.Assign(newNames);
        finally
          newNames.Free;
        end;
      finally
        tempNames.Free;
      end;
    end;
  finally
    ReleaseDC(0, dc);
  end;  
end;

procedure IvGetFontNamesOfCharset(charset: Integer; names: TStrings);
var
  dc: HDC;
  logFont: TLogFont;
begin
  dc := GetDC(0);
  try
    InitLogFont(logFont, '', charset);
    EnumFontFamiliesEx(dc, logFont, @EnumFontNames, Integer(names), 0);
  finally
    ReleaseDC(0, dc);
  end;
end;
{$ENDIF}

function IvGetCharacterSetType(locale: Integer): TIvCharacterSetType;
begin
  case IvGetPrimaryFromLocale(locale) of
    LANG_CHINESE, LANG_JAPANESE, LANG_KOREAN: Result := ivcsMultiByte;
    LANG_ARABIC, LANG_HEBREW, LANG_FARSI: Result := ivcsBiDirectional;
  else
    Result := ivcsSingleByte;
  end;
end;

function IvIsLocaleSingleByte(locale: Integer): Boolean;
begin
  Result := IvGetCharacterSetType(locale) = ivcsSingleByte;
end;

function IvIsLocaleMultiByte(locale: Integer): Boolean;
begin
  Result := IvGetCharacterSetType(locale) = ivcsMultiByte;
end;

function IvIsLocaleBidirectional(locale: Integer): Boolean;
begin
  Result := IvGetCharacterSetType(locale) = ivcsBiDirectional;
end;

{$IFDEF WIN32}
function IvStrToWStr(const source: String; codePage: Integer): TIvWideString;
var
  len: Integer;
begin
  if source = '' then
    Result := ''
  else
  begin
    // Calculates the size of the string

    len := MultiByteToWideChar(codePage, 0, PChar(source), -1, nil, 0);

{$IFDEF IVWIDE}
    // Sets the string length and converts the string

    SetLength(Result, len - 1);
    MultiByteToWideChar(codePage, 0, PChar(source), -1, PWideChar(Result), len);
{$ELSE}
    // Frees the current commaon string, allocates the new one and
    // converts the string

    SysFreeString(commonWideString);
    commonWideString := SysAllocStringLen(nil, len);
    commonWideString[MultiByteToWideChar(codePage, 0, PChar(source), -1, commonWideString, len)] := #0;
    Result := commonWideString;
{$ENDIF}
  end;
end;

function IvStrLen(const str: String; codePage: Integer): Integer;
begin
  Result := MultiByteToWideChar(codePage, 0, PChar(str), -1, nil, 0) - 1;
end;

function IvWStrPCopy(dest: PWideChar; const source: TIvWideString): PWideChar;
var
  i, len: Integer;
begin
  Result := dest;
{$IFDEF IVWIDE}
  len := Length(source);
  for i := 1 to len do
{$ELSE}
  len := SysStringLen(source);
  for i := 0 to len - 1 do
{$ENDIF}
  begin
    dest^ := source[i];
    Inc(dest);
  end;
  dest^ := Chr(0);
end;

function IvSetKeyboardLayout(langId: Integer): HKL;
var
  i, count, tempLangId: Integer;
  kls: PHLK;
  kl: HKL;
begin
  kls := nil;
  count := GetKeyboardLayoutList(0, kls^);
  kls := AllocMem(count*Sizeof(HKL));
  count := GetKeyboardLayoutList(count, kls^);

  { Tries exact match }

  for i := 0 to count - 1 do
  begin
    kl := PHLK(PChar(kls) + i*Sizeof(HKL))^;
    tempLangId := kl and $FF;
    if tempLangId = langId then
    begin
      Result := ActivateKeyboardLayout(kl, 0);
      Exit;
    end;
  end;

  { Tries neutral match }

  langId := IvMakeLangId(IvGetPrimaryFromLocale(langId), SUBLANG_NEUTRAL);
  for i := 0 to count - 1 do
  begin
    kl := PHLK(PChar(kls) + i*Sizeof(HKL))^;
    tempLangId := kl and $FF;
    if tempLangId = langId then
    begin
      Result := ActivateKeyboardLayout(kl, 0);
      Exit;
    end;
  end;

  Result := IvResetKeyboardLayout;
end;

function IvResetKeyboardLayout: HKL;
begin
  Result := ActivateKeyboardLayout(KeyboardLayout, 0);
end;
{$ENDIF}

function IsDefaultDictionaryOpen: Boolean;
begin
  Result := (Dictionaries.Count >= 1) and (Dictionaries[0].IsOpen);
end;

{$IFDEF IVWIDE}
class procedure TIvDictionary.HandleException(sender: TObject; e: Exception);
var
  msg: String;
begin
  // Translates the exception

  msg := e.Message;
  if IsDefaultDictionaryOpen then
    msg := GetDefaultDictionary.Translate(msg);

  if (msg <> '') and (AnsiLastChar(msg) > '.') then
    msg := msg + '.';

  // Shows it

  MessageDlg(msg, mtError, [mbOK], 0);
end;

// LoadResString

function TranslateLoadResString(resStringRec: PResStringRec): String;
var
  buffer: array[0..1023] of Char;
begin
  // Loads the resource string

  if resStringRec <> nil then
  begin
  {$IFDEF IVBIDI}
    if resStringRec.Identifier < 64*1024 then
  {$ENDIF}
    begin
      SetString(
        Result,
        buffer,
        LoadString(
          FindResourceHInstance(resStringRec.Module^),
          resStringRec.Identifier,
          buffer,
          SizeOf(buffer)));
    end
  {$IFDEF IVBIDI}
    else
      Result := PChar(resStringRec.Identifier);
  {$ENDIF}
  end;

  // Translates the string

  if (Result <> '') and resStrTranslationEnabled and IsDefaultDictionaryOpen then
  begin
    resStrTranslationEnabled := False;
    try
      Result := GetDefaultDictionary.TranslateContext(
        Result,
        '',
        IntToStr(resStringRec.Identifier));
    finally
      resStrTranslationEnabled := True;
    end;
  end;
end;

function IvLoadResString(resStringRec: PResStringRec): String;
asm
  PUSH  EBP
  MOV   EBP, ESP
  ADD   ESP, $-8
  MOV   [EBP-$8], EDX
  MOV   [EBP-$4], EAX
  MOV   EDX, [EBP-$8]
  MOV   EAX, [EBP-$4]
  MOV   ECX, OFFSET Addr(TranslateLoadResString)-$1
  CALL  ECX
  MOV   ESP,EBP
  POP   EBP
end;

// LoadStr

type
  PStrData = ^TStrData;
  TStrData = record
    Ident: Integer;
    Buffer: PChar;
    BufSize: Integer;
    nChars: Integer;
  end;

function EnumStringModules(instance: Longint; data: Pointer): Boolean;
begin
  with PStrData(data)^ do
  begin
    nChars := LoadString(instance, ident, buffer, bufSize);
    Result := nChars = 0;
  end;
end;

function FindStringResource(ident: Integer; buffer: PChar; bufSize: Integer): Integer;
var
  strData: TStrData;
begin
  strData.Ident := ident;
  strData.Buffer := buffer;
  strData.BufSize := bufSize;
  strData.nChars := 0;
  EnumResourceModules(EnumStringModules, @strData);
  Result := strData.nChars;
end;

function TranslateLoadStr(ident: Integer): String;
var
  buffer: array[0..1023] of Char;
begin
  SetString(Result, buffer, FindStringResource(ident, buffer, SizeOf(buffer)));

  // Translates the string

  if (Result <> '') and resStrTranslationEnabled and IsDefaultDictionaryOpen then
  begin
    resStrTranslationEnabled := False;
    try
      Result := GetDefaultDictionary.TranslateContext(
        Result,
        '',
        IntToStr(ident));
    finally
      resStrTranslationEnabled := True;
    end;
  end;
end;

function IvLoadStr(ident: Integer): String;
asm
  PUSH  EBP
  MOV   EBP, ESP
  ADD   ESP, $-8
  MOV   [EBP-$8], EDX
  MOV   [EBP-$4], EAX
  MOV   EDX, [EBP-$8]
  MOV   EAX, [EBP-$4]
  MOV   ECX, OFFSET Addr(TranslateLoadStr)-$1
  CALL  ECX
  MOV   ESP,EBP
  POP   EBP
end;

// ShortCutToText

type
  TMenuKeyCap = (mkcBkSp, mkcTab, mkcEsc, mkcEnter, mkcSpace, mkcPgUp,
    mkcPgDn, mkcEnd, mkcHome, mkcLeft, mkcUp, mkcRight, mkcDown, mkcIns,
    mkcDel, mkcShift, mkcCtrl, mkcAlt);

function GetTranslatedMenuKeyCaps(value: TMenuKeyCap): String;
begin
  case value of
    mkcBkSp: Result := SmkcBkSp;
    mkcTab: Result := SmkcTab;
    mkcEsc: Result := SmkcEsc;
    mkcEnter: Result := SmkcEnter;
    mkcSpace: Result := SmkcSpace;
    mkcPgUp: Result := SmkcPgUp;
    mkcPgDn: Result := SmkcPgDn;
    mkcEnd: Result := SmkcEnd;
    mkcHome: Result := SmkcHome;
    mkcLeft: Result := SmkcLeft;
    mkcUp: Result := SmkcUp;
    mkcRight: Result := SmkcRight;
    mkcDown: Result := SmkcDown;
    mkcIns: Result := SmkcIns;
    mkcDel: Result := SmkcDel;
    mkcShift: Result := SmkcShift;
    mkcCtrl: Result := SmkcCtrl;
    mkcAlt: Result := SmkcAlt;
  end;

  if (Result <> '') and IsDefaultDictionaryOpen then
    Result := GetDefaultDictionary.Translate(Result);
end;

function GetSpecialName(shortCut: TShortCut): String;
var
  ScanCode: Integer;
  KeyName: array[0..255] of Char;
begin
  Result := '';
  ScanCode := MapVirtualKey(WordRec(ShortCut).Lo, 0) shl 16;
  if ScanCode <> 0 then
  begin
    GetKeyNameText(ScanCode, KeyName, SizeOf(KeyName));
    if (KeyName[1] = #0) and (KeyName[0] <> #0) then
      GetSpecialName := KeyName;
  end;
end;

function TranslateShortCutToText(ShortCut: TShortCut): String;
var
  Name: string;
begin
  case WordRec(ShortCut).Lo of
    $08, $09:
      Name := GetTranslatedMenuKeyCaps(TMenuKeyCap(Ord(mkcBkSp) + WordRec(ShortCut).Lo - $08));

    $0D:
      Name := GetTranslatedMenuKeyCaps(mkcEnter);

    $1B:
      Name := GetTranslatedMenuKeyCaps(mkcEsc);

    $20..$28:
      Name := GetTranslatedMenuKeyCaps(TMenuKeyCap(Ord(mkcSpace) + WordRec(ShortCut).Lo - $20));

    $2D..$2E:
      Name := GetTranslatedMenuKeyCaps(TMenuKeyCap(Ord(mkcIns) + WordRec(ShortCut).Lo - $2D));

    $30..$39:
      Name := Chr(WordRec(ShortCut).Lo - $30 + Ord('0'));

    $41..$5A:
      Name := Chr(WordRec(ShortCut).Lo - $41 + Ord('A'));

    $60..$69:
      Name := Chr(WordRec(ShortCut).Lo - $60 + Ord('0'));

    $70..$87:
      Name := 'F' + IntToStr(WordRec(ShortCut).Lo - $6F);
  else
    Name := GetSpecialName(ShortCut);
  end;

  if Name <> '' then
  begin
    Result := '';
    if ShortCut and scShift <> 0 then
      Result := Result + GetTranslatedMenuKeyCaps(mkcShift);

    if ShortCut and scCtrl <> 0 then
      Result := Result + GetTranslatedMenuKeyCaps(mkcCtrl);

    if ShortCut and scAlt <> 0 then
      Result := Result + GetTranslatedMenuKeyCaps(mkcAlt);

    Result := Result + Name;
  end
  else
    Result := '';
end;

function IvShortCutToText(ShortCut: TShortCut): String;
asm
  PUSH  EBP
  MOV   EBP, ESP
  ADD   ESP, $-8
  MOV   [EBP-$8], EDX
  MOV   [EBP-$4], EAX
  MOV   EDX, [EBP-$8]
  MOV   EAX, [EBP-$4]
  MOV   ECX, OFFSET Addr(TranslateShortCutToText)-$1
  CALL  ECX
  MOV   ESP,EBP
  POP   EBP
end;
{$ENDIF}

{$IFDEF WIN32}
initialization
  euroUsage := iveNormal;
  KeyboardLayout := GetKeyboardLayout(0);
  Dictionaries := TIvDictionaries.Create;
  {$IFDEF IVWIDE}
  resStrTranslationEnabled := True;
  vclFunctionsChanged := False;
  {$ENDIF}
finalization
  Dictionaries.Free;
  Dictionaries := nil;
{$ELSE}
begin
  euroUsage := iveNormal;
  Dictionaries := TIvDictionaries.Create;
  userDefaultLCID := 0;
{$ENDIF}
end.

