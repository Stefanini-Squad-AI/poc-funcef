unit Main;

// This sample demonstrates how to use TIvUserDictionary

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IvMulti, IvUsrDic, IvDictio;

type
  TMainForm = class(TForm)
    LanguageButton: TButton;
    Label1: TLabel;
    IvDictionary1: TIvUserDictionary;
    IvTranslator1: TIvTranslator;
    SublanguageButton: TButton;
    DateLabel: TLabel;
    AmountLabel: TLabel;
    function IvDictionary1LanguageCount(
      sender: TIvUserDictionary): Integer;
    procedure IvDictionary1LanguageData(
      sender: TIvUserDictionary;
      index: Integer;
      language: TIvLanguage);
    function IvDictionary1LocaleCount(sender: TIvUserDictionary): Integer;
    procedure IvDictionary1LocaleData(
      sender: TIvUserDictionary;
      index: Integer;
      locale: TIvLocale);
    function IvDictionary1Translate(
      sender: TIvUserDictionary;
      const native: String;
      var current: String): Boolean;
    procedure IvDictionary1LocaleChange(Sender: TObject);
    procedure LanguageButtonClick(Sender: TObject);
    procedure SublanguageButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  IvLanguD;

function TMainForm.IvDictionary1LanguageCount(
  sender: TIvUserDictionary): Integer;
begin
  // This dictionary contains two languages

  Result := 2;
end;

procedure TMainForm.IvDictionary1LanguageData(
  sender: TIvUserDictionary;
  index: Integer;
  language: TIvLanguage);
begin
  // This dictionary supports English and Finnish

  case index of
    0:
    begin
      language.Primary := LANG_ENGLISH;
      language.EnglishName := 'English';
      language.Options := [ivloPureASCII];
    end;

    1:
    begin
      language.Primary := LANG_FINNISH;
      language.EnglishName := 'Finnish';
    end;
  end;

  language.Init;
end;

function TMainForm.IvDictionary1LocaleCount(
  sender: TIvUserDictionary): Integer;
begin
  // This dictionary contains one locale

  Result := 1;
end;

procedure TMainForm.IvDictionary1LocaleData(
  sender: TIvUserDictionary;
  index: Integer;
  locale: TIvLocale);
begin
  // This dictionary contains Finnish (Sweden) locale

  if index = 0 then
  begin
    locale.Primary := LANG_FINNISH;
    locale.ISOLanguage := 'fi';
    locale.Sub := 2;
    locale.ISOCountry := 'FI';
    locale.CodePage := 1252;
    locale.IsCustom := True;

    locale.EnglishLanguageName := 'Finnish';
    locale.EnglishCountryName := 'Sweden';
    locale.NativeLanguageName := 'suomi';
    locale.NativeCountryName := 'Ruotsi';
    locale.Win16LanguageName := 'fin';
    locale.Win16CountryName := 'Sweden';

    locale.MeasurementSystem := ivmsMetric;
    locale.CurrencyString := 'kr';
    locale.CurrencyFormat := ivcfS_1;
    locale.NegCurrFormat := ivncN1_S;
    locale.CurrencyDecimals := 2;
    locale.ThousandSeparator := ' ';
    locale.DecimalSeparator := ',';

    locale.DateSeparator := '.';
    locale.ShortDateFormat := 'd.M.yyyy';
    locale.LongDateFormat := 'd. MMMM''ta ''yyyy';

    locale.TimeSeparator := ':';
    locale.TimeAMString := '';
    locale.TimePMString := '';
    locale.TimeLeadingZeros := False;
    locale.TimeFormat := ivtf24;
    locale.TimeMarkPosition := ivtmSuffix;

    locale.CalendarType := ivctGregorian;
    locale.OptionalCalendarType := ivctNone;
    locale.FirstDayOfWeek := ivwdMonday;
    locale.FirstWeekOfYear := ivfwFirst4;

    locale.ShortMonthNames[1] := 'tammi';
    locale.ShortMonthNames[2] := 'helmi';
    locale.ShortMonthNames[3] := 'maalis';
    locale.ShortMonthNames[4] := 'huhti';
    locale.ShortMonthNames[5] := 'touko';
    locale.ShortMonthNames[6] := 'kesä';
    locale.ShortMonthNames[7] := 'heinä';
    locale.ShortMonthNames[8] := 'elo';
    locale.ShortMonthNames[9] := 'syys';
    locale.ShortMonthNames[10] := 'loka';
    locale.ShortMonthNames[11] := 'marras';
    locale.ShortMonthNames[12] := 'joulu';

    locale.LongMonthNames[1] := 'tammikuu';
    locale.LongMonthNames[2] := 'helmikuu';
    locale.LongMonthNames[3] := 'maaliskuu';
    locale.LongMonthNames[4] := 'huhtikuu';
    locale.LongMonthNames[5] := 'toukokuu';
    locale.LongMonthNames[6] := 'kesäkuu';
    locale.LongMonthNames[7] := 'heinäkuu';
    locale.LongMonthNames[8] := 'elokuu';
    locale.LongMonthNames[9] := 'syyskuu';
    locale.LongMonthNames[10] := 'lokakuu';
    locale.LongMonthNames[11] := 'marraskuu';
    locale.LongMonthNames[12] := 'joulukuu';

    locale.ShortDayNames[1] := 'ma';
    locale.ShortDayNames[2] := 'ti';
    locale.ShortDayNames[3] := 'ke';
    locale.ShortDayNames[4] := 'to';
    locale.ShortDayNames[5] := 'pe';
    locale.ShortDayNames[6] := 'la';
    locale.ShortDayNames[7] := 'su';

    locale.LongDayNames[1] := 'maanantai';
    locale.LongDayNames[2] := 'tiistai';
    locale.LongDayNames[3] := 'keskiviikko';
    locale.LongDayNames[4] := 'torstai';
    locale.LongDayNames[5] := 'perjantai';
    locale.LongDayNames[6] := 'lauantai';
    locale.LongDayNames[7] := 'sunnuntai';
  end;
end;

function TMainForm.IvDictionary1Translate(
  sender: TIvUserDictionary;
  const native: String;
  var current: String): Boolean;
begin
  // When English is active the translated string is the native one.
  // If Finnish is active the translated string is the native as upper case.

  case sender.ActiveLanguage of
    0: current := native;
    1: current := UpperCase(native);
  end;
  Result := True;
end;

procedure TMainForm.IvDictionary1LocaleChange(Sender: TObject);
begin
  // Updates the locale specific strings

  DateLabel.Caption := DateTimeToStr(Now);
  AmountLabel.Caption := Format('%m', [100.0]);
end;

procedure TMainForm.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  // Displays the select language dialog and sets the language to the selected value.

  if SelectLanguage(Self, IvDictionary1, '', [], 0, language) then
    IvDictionary1.Language := language;
end;

procedure TMainForm.SublanguageButtonClick(Sender: TObject);
var
  locale: Integer;
begin
  // Displays the select sublanguage dialog and sets the sublanguage to the selected value.

  if SelectSublanguage(Self, IvDictionary1, '', [], 0, locale) then
    IvDictionary1.Locale := locale;
end;

end.
