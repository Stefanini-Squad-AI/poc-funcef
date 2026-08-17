unit IvUsrDic;

interface

uses
  Classes,
  IvDictio;

type
  TIvUserDictionary = class;

  TIvCountEvent = function(sender: TIvUserDictionary): Integer of object;

  TIvLanguageEvent = procedure(
    sender: TIvUserDictionary;
    index: Integer;
    language: TIvLanguage) of object;

  TIvLocaleEvent = procedure(
    sender: TIvUserDictionary;
    index: Integer;
    locale: TIvLocale) of object;

  TIvTranslateEvent = function(
    sender: TIvUserDictionary;
    const str: String;
    var translation: String): Boolean of object;

  TIvTranslateContextEvent = function(
    sender: TIvUserDictionary;
    const str, form, component: String;
    var translation: String): Boolean of object;

  TIvUserDictionary = class(TIvDictionary)
  private
    FOnLanguageCount: TIvCountEvent;
    FOnLanguageData: TIvLanguageEvent;
    FOnLocaleCount: TIvCountEvent;
    FOnLocaleData: TIvLocaleEvent;
    FOnTranslate: TIvTranslateEvent;
    FOnTranslateContext: TIvTranslateContextEvent;

  protected
    function GetLanguageCount: Integer; override;
    procedure GetLanguageData(index: Integer; language: TIvLanguage); override;
    function GetLocaleCount: Integer; override;
    procedure GetLocaleData(index: Integer; locale: TIvLocale); override;

  public
    function TranslateString(
      const str: String;
      var translation: String): Boolean; override;
    function TranslateContextString(
      const str, form, component: String;
      var translation: String): Boolean; override;

  published
     property OnLanguageCount: TIvCountEvent read FOnLanguageCount write FOnLanguageCount;
     property OnLanguageData: TIvLanguageEvent read FOnLanguageData write FOnLanguageData;
     property OnLocaleCount: TIvCountEvent read FOnLocaleCount write FOnLocaleCount;
     property OnLocaleData: TIvLocaleEvent read FOnLocaleData write FOnLocaleData;
     property OnTranslate: TIvTranslateEvent read FOnTranslate write FOnTranslate;
     property OnTranslateContext: TIvTranslateContextEvent read FOnTranslateContext write FOnTranslateContext;
  end;

implementation

uses
  SysUtils;

function TIvUserDictionary.GetLanguageCount: Integer;
begin
  { Call OnLanguageCount event and let the event handler to return the language count }

  if Assigned(FOnLanguageCount) then
    Result := FOnLanguageCount(Self)
  else if IsDesignTime then
    Result := 0
  else
    raise Exception.Create('Undefined OnLanguageCount event');
end;

procedure TIvUserDictionary.GetLanguageData(index: Integer; language: TIvLanguage);
begin
  { Call OnLanguageData event and let the event handler to return the language data }

  if Assigned(FOnLanguageData) then
  begin
    { Creates the language object, calls the event handler to fill it up and
      finally checks that all the required properties were set. }

    FOnLanguageData(Self, index, language);
    language.Init;
    if (language.Primary = 0) or
      (language.EnglishName = '') or (language.NativeName = '')
    then
      raise Exception.Create('Incomplete language data (' + IntToStr(index) + ')');
  end
  else
    raise Exception.Create('Undefined OnLanguageData event');
end;

function TIvUserDictionary.GetLocaleCount: Integer;
begin
  { Call OnLocaleCount event and let the event handler to return the language count }

  if Assigned(FOnLocaleCount) then
    Result := FOnLocaleCount(Self)
  else if IsDesignTime then
    Result := 0
  else
    raise Exception.Create('Undefined OnLocaleCount event');
end;

procedure TIvUserDictionary.GetLocaleData(index: Integer; locale: TIvLocale);
begin
  { Call OnLocaleData event and let the event handler to return the locale data }

  if Assigned(FOnLocaleData) then
  begin
    FOnLocaleData(Self, index, locale);
    locale.Init;
    if (locale.Primary = 0) or (locale.Sub = 0) or
      (locale.EnglishLanguageName = '') or (locale.NativeLanguageName = '') or
      (locale.EnglishCountryName = '') or (locale.NativeCountryName = '')
    then
      raise Exception.Create('Incomplete locale data (' + IntToStr(index) + ')');
  end
  else
    raise Exception.Create('Undefined OnLocaleData event');
end;

function TIvUserDictionary.TranslateString(
  const str: String;
  var translation: String): Boolean;
begin
  { Call OnTranslate event and let the event handler to translate the text }

  if Assigned(FOnTranslate) then
    Result := FOnTranslate(Self, str, translation)
  else
    raise Exception.Create('Undefined OnTranslate event');
end;

function TIvUserDictionary.TranslateContextString(
  const str, form, component: String;
  var translation: String): Boolean;
begin
  { Call OnTranslate event and let the event handler to translate the text }

  if Assigned(FOnTranslateContext) then
    Result := FOnTranslateContext(Self, str, form, component, translation)
  else
    raise Exception.Create('Undefined OnTranslate event');
end;

end.
