unit IvCacDic;

interface

uses
  Classes,
  IvDictio, IvAMulti, IvStrLst, IvMLDFil;

type
  TIvCachedDictionary = class(TIvCustomDictionary)
  protected
    FUseCache: Boolean;
    FCacheFileName: String;

    function GetCacheFileName: String;

    function GetCacheDateTime: TDateTime;
    function OpenCache: TIvMLDFile;
    function IsCacheEnabled: Boolean;

    function GetTranslationCount: Integer; override;
    function GetLanguageCount: Integer; override;
    procedure GetLanguageData(index: Integer; language: TIvLanguage); override;
    function GetLocaleCount: Integer; override;
    procedure GetLocaleData(index: Integer; locale: TIvLocale); override;
    procedure LoadTranslation; override;

    { Implement these in the derived dictionary }

    function GetRemoteLanguageCount: Integer; virtual; abstract;
    procedure GetRemoteLanguageData(i: Integer; language: TIvLanguage); virtual; abstract;
    function GetRemoteLocaleCount: Integer; virtual; abstract;
    procedure GetRemoteLocaleData(i: Integer; locale: TIvLocale); virtual; abstract;
    function GetRemoteTranslationCount: Integer; virtual; abstract;
    procedure GetRemoteTranslations(
      i: Integer;
      row: TIvStringList;
      context: TIvContext;
      languageCount: Integer;
      codePages: TList); virtual; abstract;
    function GetRemoteDictionaryDate: TDateTime; virtual; abstract;

  public
    constructor Create(owner: TComponent); override;

    function DoesCacheExist: Boolean;
    function IsUpdateAvailable: Boolean;
    procedure UpdateCache;

    property CacheFileName: String read GetCacheFileName write FCacheFileName;

  published
    property UseCache: Boolean read FUseCache write FUseCache default True;
  end;

implementation

uses
  SysUtils,
  IvCommon, IvWMLDFi;

constructor TIvCachedDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);
  FCacheFileName := '';
  FUseCache := True;
end;

function TIvCachedDictionary.DoesCacheExist: Boolean;
begin
  Result := FileExists(CacheFileName);
end;

function TIvCachedDictionary.IsCacheEnabled: Boolean;
begin
  Result := UseCache and DoesCacheExist;
end;

function TIvCachedDictionary.IsUpdateAvailable: Boolean;
begin
  Result := GetCacheDateTime < GetRemoteDictionaryDate;
end;

function TIvCachedDictionary.GetCacheFileName: String;
begin
  if FCacheFileName = '' then
    FCacheFileName := DictionaryName + '.' + MLD_EXTENSION_C;
  Result := FCacheFilename;
end;

function TIvCachedDictionary.OpenCache: TIvMLDFile;
begin
  Result := TIvMLDFile.Create;
  try
    Result.Stream := TFileStream.Create(CacheFileName, fmOpenRead or fmShareDenyNone);
    Result.Open;
    FContextType := Result.ContextType;
  except
    Result.Free;
    raise;
  end;
end;

function TIvCachedDictionary.GetCacheDateTime: TDateTime;
begin
  if FileExists(CacheFileName) then
    Result := FileDateToDateTime(MlFileAge(CacheFileName, False))
  else
    Result := 0;
end;

function TIvCachedDictionary.GetTranslationCount: Integer;
begin
  if IsCacheEnabled then
    Result := inherited GetTranslationCount
  else
    Result := GetRemoteTranslationCount;
end;

function TIvCachedDictionary.GetLanguageCount: Integer;
var
  mldFile: TIvMLDFile;
begin
  if IsCacheEnabled then
  begin
    mldFile := OpenCache;
    try
      Result := mldFile.LanguageCount
    finally
      mldFile.Free;
    end;
  end
  else
    Result := GetRemoteLanguageCount;
end;

procedure TIvCachedDictionary.GetLanguageData(index: Integer; language: TIvLanguage);
var
  mldFile: TIvMLDFile;
begin
  if IsCacheEnabled then
  begin
    mldFile := OpenCache;
    try
      language.Assign(mldFile.Languages[index]);
    finally
      mldFile.Free;
    end;
  end
  else
    GetRemoteLanguageData(index, language);
end;

function TIvCachedDictionary.GetLocaleCount: Integer;
var
  mldFile: TIvMLDFile;
begin
  if IsCacheEnabled then
  begin
    mldFile := OpenCache;
    try
      Result := mldFile.LocaleCount
    finally
      mldFile.Free;
    end;
  end
  else
    Result := GetRemoteLocaleCount;
end;

procedure TIvCachedDictionary.GetLocaleData(index: Integer; locale: TIvLocale);
var
  mldFile: TIvMLDFile;
begin
  if IsCacheEnabled then
  begin
    mldFile := OpenCache;
    try
      locale.Assign(mldFile.Locales[index]);
    finally
      mldFile.Free;
    end;
  end
  else
    GetRemoteLocaleData(index, locale);
end;

procedure TIvCachedDictionary.LoadTranslation;
var
  i, codePage: Integer;
  translation: TIvTranslation;
  mldFile: TIvMLDFile;
begin
  if not IsCacheEnabled then
    Exit;

  { Loads the translations from the local file }

  ClearTranslations;
  mldFile := OpenCache;
  try
    codePage := FLanguageData.CodePage;
    mldFile.GoTranslationSection;
    for i := 0 to mldFile.TranslationCount - 1 do
    begin
      translation := TIvTranslation.Create;
      mldFile.GetTranslation(translation, ActiveLanguage, SuperLanguage, codePage);
      if translation.Match = ivtmNone then
        translation.Free
      else
        FTranslations.Add(translation);
    end;
  finally
    mldFile.Free;
  end;

  Sort;
end;

procedure TIvCachedDictionary.UpdateCache;
var
  i, languageCount: Integer;
  mldFile: TIvWriteableMLDFile;
  list: TIvStringList;
  context: TIvContext;
  language: TIvLanguage;
  locale: TIvLocale;
  codePages: TList;
begin
  { Gets the dictionary data from the remote dictionary and writes it to the
    local file. }

  codePages := TList.Create;
  mldFile := TIvWriteableMLDFile.Create;
  try
    mldFile.Edit(
      CacheFileName,
      ivboLittleEndian,
      ivcsCodePage,
      ContextType,
      MLD_VERSION_C);

    languageCount := GetRemoteLanguageCount;
    for i := 0 to languageCount - 1 do
    begin
      language := TIvLanguage.Create;
      try
        GetRemoteLanguageData(i, language);
        mldFile.WriteLanguage(language);
        codePages.Add(Pointer(language.CodePage));
      finally
        language.Free;
      end;
    end;

    for i := 0 to GetRemoteTranslationCount - 1 do
    begin
      list := TIvStringList.Create;
      context := TIvContext.Create;
      try
        GetRemoteTranslations(i, list, context, languageCount, codePages);
        mldFile.WriteAnsiTranslation(list, context);
      finally
        list.Free;
        context.Free;
      end;
    end;

    for i := 0 to GetRemoteLocaleCount - 1 do
    begin
      locale := TIvLocale.Create;
      try
        GetRemoteLocaleData(i, locale);
        mldFile.WriteLocale(locale);
      finally
        locale.Free;
      end;
    end;

    mldFile.Post;
    LoadTranslation;
  except
    mldFile.Cancel;
  end;
  mldFile.Free;
end;

end.
