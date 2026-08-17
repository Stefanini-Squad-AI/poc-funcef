unit main;

// This is DCALC, a tutorial application for Multilizer.
// It calcutes the average driving time for the given distance.
// The average speed of 100 km/h is used.
//
// Copyrights 1998-1999 Innoview Data Technologies Oy

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ComCtrls, IvMulti, IvAMulti, IvDictio, IvBinDic;

type
  TMainForm = class(TForm)
    IvGroupBox1: TGroupBox;
    DistanceEdit: TEdit;
    UnitLabel: TLabel;
    CalculateButton: TButton;
    Label2: TLabel;
    CurrentTime: TLabel;
    Label3: TLabel;
    SpeedingFine: TLabel;
    StatusBar1: TStatusBar;
    CurrentLocale: TLabel;
    Label4: TLabel;
    CurrentLanguage: TLabel;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Language1: TMenuItem;
    LanguageMenu: TMenuItem;
    SublanguageMenu: TMenuItem;
    LocaleMenu: TMenuItem;
    N1: TMenuItem;
    ExitMenu: TMenuItem;
    Options1: TMenuItem;
    ShowNativeMenu: TMenuItem;
    ShowAllMenu: TMenuItem;
    EnabledLanguagesMenu: TMenuItem;
    AllMenu: TMenuItem;
    SystemMenu: TMenuItem;
    CodePageMenu: TMenuItem;
    Help1: TMenuItem;
    AboutMenu: TMenuItem;
    IvTranslator1: TIvTranslator;
    BindMenu: TMenuItem;
    N2: TMenuItem;
    NoneMenu: TMenuItem;
    LanguageToLocaleMenu: TMenuItem;
    LocaleToLanguageMenu: TMenuItem;
    IvDictionary1: TIvBinaryDictionary;
    UseEuroMenu: TMenuItem;
    procedure CalculateButtonClick(Sender: TObject);
    procedure LanguageMenuClick(Sender: TObject);
    procedure LocaleMenuClick(Sender: TObject);
    procedure AboutMenuClick(Sender: TObject);
    procedure ExitMenuClick(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure SublanguageMenuClick(Sender: TObject);
    procedure ShowNativeMenuClick(Sender: TObject);
    procedure ShowAllMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AllMenuClick(Sender: TObject);
    procedure CodePageMenuClick(Sender: TObject);
    procedure SystemMenuClick(Sender: TObject);
    procedure NoneMenuClick(Sender: TObject);
    procedure LanguageToLocaleMenuClick(Sender: TObject);
    procedure LocaleToLanguageMenuClick(Sender: TObject);
    procedure IvTranslator1LanguageChange(Sender: TObject);
    procedure UseEuroMenuClick(Sender: TObject);

  private
    options: TIvLanguageDialogOptions;

    procedure DisplayHint(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

// If you have IvDictionary1.ivsResource in the Storage property:
// 1) Create DICTIO.RC file containing the next line
//    MlDictionary MULTILIZER "dcalc.mld"
// 2) Compile the resource (rc -r dictio.rc)
// 3) Uncomment the next line
//{$R DICTIO.RES}

uses
  IvMlUtil, IvLanguD;

procedure TMainForm.DisplayHint(Sender: TObject);
begin
  // Shows the hint on the status bar

  StatusBar1.SimpleText := GetLongHint(Application.Hint);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // Redirects hints to the status bar

  Application.OnHint := DisplayHint;
end;

procedure TMainForm.CalculateButtonClick(Sender: TObject);
var
  distance, hours, minutes: Integer;
begin
  // Calculates the average driving time

  try
    distance := StrToInt(DistanceEdit.Text);
    if distance < 0 then
      raise Exception.Create('Negative');

    // If the current locale uses US measurement system instead of metric
    // converts the give distance (in miles) to kilometers

    if IvDictionary1.LocaleData.MeasurementSystem = ivmsUS then
      distance := Trunc(MILE_IN_METERS*distance/1000);

    hours := distance div 100;
    minutes := Round(0.6*(distance mod 100));

    // Multilizer translates message dialog automatically. However you have to
    // translate the message manually using the Translate method.

    MessageDlg(
      Format(
        Translate('The average driving time is %0:d hours and %1:d minutes.'),
        [hours, minutes]),
      mtInformation,
      [mbOK],
      0);
  except
    MessageDlg(
      Format(
        Translate('"%s" is not a valid distance!'),
        [DistanceEdit.Text]),
      mtError,
      [mbOK],
      0);
    DistanceEdit.SetFocus;
  end;
end;

procedure TMainForm.LanguageMenuClick(Sender: TObject);
var
  language: Integer;
begin
  // Lets the user select the language

  if SelectLanguage(Self, IvDictionary1, '', options, 0, language) then
    IvDictionary1.Language := language;
end;

procedure TMainForm.SublanguageMenuClick(Sender: TObject);
var
  langId: Integer;
begin
  // Lets the user select the sublanguage

  if SelectSublanguage(Self, IvDictionary1, '', options, 0, langId) then
    IvDictionary1.Locale := langId;
end;

procedure TMainForm.LocaleMenuClick(Sender: TObject);
var
  locale: Integer;
begin
  // Lets the user select the sublanguage

  if SelectLocale(Self, IvDictionary1, '', options, 0, locale) then
    IvDictionary1.Locale := locale;
end;

procedure TMainForm.AboutMenuClick(Sender: TObject);
begin
  // Shows an about dialog box

  MessageDlg(
    Translate('Dcalc is a multilingual application that calculates the average driving time'),
    mtCustom,
    [mbOK],
    0);
end;

procedure TMainForm.ExitMenuClick(Sender: TObject);
begin
  // Exits program

  Close;
end;

procedure TMainForm.Options1Click(Sender: TObject);
begin
  // Updates the option menu items

  ShowNativeMenu.Checked := ivloUseNativeLanguage in options;
  ShowAllMenu.Checked := ivloShowAllLanguages in options;
  UseEuroMenu.Checked := IvDictionary1.Euro = iveBusiness;

  NoneMenu.Checked := IvDictionary1.Binding = ivbiNone;
  LanguageToLocaleMenu.Checked := IvDictionary1.Binding = ivbiLanguageToLocale;
  LocaleToLanguageMenu.Checked := IvDictionary1.Binding = ivbiLocaleToLanguage;

  AllMenu.Checked := IvDictionary1.CheckLevel = ivclNone;
  CodePageMenu.Checked := IvDictionary1.CheckLevel = ivclCodePage;
  SystemMenu.Checked := IvDictionary1.CheckLevel = ivclSystem;
end;

procedure TMainForm.ShowNativeMenuClick(Sender: TObject);
begin
  // Toggles the native language usage

  if ivloUseNativeLanguage in options then
    options := options - [ivloUseNativeLanguage]
  else
    options := options + [ivloUseNativeLanguage];
end;

procedure TMainForm.ShowAllMenuClick(Sender: TObject);
begin
  // Toggles the show all languages flag

  if ivloShowAllLanguages in options then
    options := options - [ivloShowAllLanguages]
  else
    options := options + [ivloShowAllLanguages];
end;

procedure TMainForm.UseEuroMenuClick(Sender: TObject);
begin
  // Toggles the Euro usage

  if IvDictionary1.Euro = iveNormal then
    IvDictionary1.Euro := iveBusiness
  else
    IvDictionary1.Euro := iveNormal;
  IvTranslator1LanguageChange(Self);  
end;

procedure TMainForm.NoneMenuClick(Sender: TObject);
begin
  // Unbinds the language and locale.

  IvDictionary1.Binding := ivbiNone;
end;

procedure TMainForm.LanguageToLocaleMenuClick(Sender: TObject);
begin
  // Binds language to the locale.
  // Sets the language match to the current locale.

  IvDictionary1.Binding := ivbiLanguageToLocale;
  IvDictionary1.SynchronizeLanguage;
end;

procedure TMainForm.LocaleToLanguageMenuClick(Sender: TObject);
begin
  // Binds locale to the language.
  // Sets the locale match to the current language.

  IvDictionary1.Binding := ivbiLocaleToLanguage;
  IvDictionary1.SynchronizeLocale;
end;

procedure TMainForm.AllMenuClick(Sender: TObject);
begin
  IvDictionary1.CheckLevel := ivclNone;
end;

procedure TMainForm.SystemMenuClick(Sender: TObject);
begin
  IvDictionary1.CheckLevel := ivclSystem;
end;

procedure TMainForm.CodePageMenuClick(Sender: TObject);
begin
  IvDictionary1.CheckLevel := ivclCodePage;
end;

procedure TMainForm.IvTranslator1LanguageChange(Sender: TObject);
begin
  // Updates the info fields to match the local format.

  if IvDictionary1.LocaleData.MeasurementSystem = ivmsMetric then
  begin
    UnitLabel.Caption := Translate('in kilometres');
    DistanceEdit.Hint := Translate('Give the driving distance in kilometres');
  end
  else
  begin
    UnitLabel.Caption := Translate('in miles');
    DistanceEdit.Hint := Translate('Give the driving distance in miles');
  end;

  // Updates the locale depent labels.
  // If the locale is Germany (German) the speeding ticket is not used.
  // In every other locale the fine of 500 local currency is used.

  if IvDictionary1.Locale = IvMakeLangId(LANG_GERMAN, SUBLANG_GERMAN) then
    SpeedingFine.Caption := Translate('N/A')
  else
    SpeedingFine.Caption := Format('%m', [500.0]);
  CurrentTime.Caption := DateTimeToStr(Now);
  CurrentLocale.Caption := IvDictionary1.LocaleData.GetDisplayName(ivdnTranslated, IvDictionary1);
  CurrentLanguage.Caption := Translate(IvDictionary1.LanguageData.EnglishName);

  // Updates the character set of the following labels to match the active locale.
  // This is because the locale depend items may contain characters that are not
  // supported by the active language.

  SpeedingFine.Font.Charset := IvLangIdToCharset(IvDictionary1.Locale);
  CurrentTime.Font.Charset := IvLangIdToCharset(IvDictionary1.Locale);

  // After updating the labels the event calls the UpdateControls method.
  // This functions has effect only if the form has been mirrored. It positions
  // the flipped controls to the right position after their length has been
  // changed (by changing the Caption property).
  // You have to call this function only if you change a component on an event
  // and you have a bidirectional language on the dictionary.

  IvTranslator1.UpdateControls;
end;

end.
 