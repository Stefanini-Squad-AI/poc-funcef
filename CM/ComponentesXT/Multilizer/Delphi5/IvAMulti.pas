unit IvAMulti;

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils, Classes, Dialogs,
  IvDictio;

type
  TIvStorage = (ivsFile, ivsEmbedded{$IFDEF WIN32}, ivsResource{$ENDIF});

  TIvCustomDictionary = class(TIvDictionary)
  protected
    FTranslations: TList;

    function GetTranslationCount: Integer; override;
    function GetTranslation(i: Integer): TIvTranslation;

    procedure ClearTranslations;

    procedure QuickSort(left, right: Integer);
    procedure ContextQuickSort(left, right: Integer);
    procedure Sort;

    procedure LanguageChanged(languageChanged, localeChanged: Boolean); override;

    { Implement these in the derived dictionary }

    procedure LoadTranslation; virtual; abstract;

  public
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;

    function Find(str: String): Integer;
    function FindContext(const str, form, component: String): Integer;

    function TranslateString(
      const str: String;
      var translation: String): Boolean; override;

    function TranslateContextString(
      const str, form, component: String;
      var translation: String): Boolean; override;

    property Translations[i: Integer]: TIvTranslation read GetTranslation;
  end;

  TIvCustomFileDictionary = class(TIvCustomDictionary)
  protected
    FFileName: String;
    FStorage: TIvStorage;

    function GetFileName: String;

    procedure SetStorage(value: TIvStorage);

    function ExpandFileName(const fileName: String): String;

  public
    constructor Create(owner: TComponent); override;

    function CanBeOpened: Boolean; override;

  published
    property FileName: String read GetFileName write FFileName;
    property Storage: TIvStorage read FStorage write SetStorage default ivsFile;
  end;

  { These are not used any more }

  EIvSorting = class(EIvMulti);
  EIvTranslationRowIncomplete = class(EIvMulti);
  EIvNullNativeString = class(EIvMulti);

implementation

uses
  Forms;

{ TIvCustomDictionary }

constructor TIvCustomDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);
  FTranslations := TList.Create;
end;

destructor TIvCustomDictionary.Destroy;
begin
  ClearTranslations;
  FTranslations.Free;
  inherited Destroy;
end;

procedure TIvCustomDictionary.ClearTranslations;
begin
  while FTranslations.Count > 0 do
  begin
    TIvTranslation(FTranslations[0]).Free;
    FTranslations.Delete(0);
  end;
end;

function TIvCustomDictionary.GetTranslationCount: Integer;
begin
  Result := FTranslations.Count;
end;

function TIvCustomDictionary.GetTranslation(i: Integer): TIvTranslation;
begin
  Result := FTranslations[i];
end;

function TIvCustomDictionary.Find(str: String): Integer;
var
  l, h, i, c, len: Integer;
  thisStr: String;
begin
  l := 0;
  h := FTranslations.Count - 1;

  if ContextType = [] then
  begin
    { Flat dictionary }

    while l <= h do
    begin
      i := (l + h) div 2;
      c := SysUtils.CompareStr(Translations[i].Str, str);
      if c = 0 then
      begin
        Result := i;
        Exit;
      end
      else if c < 0 then
        l := i + 1
      else
        h := i - 1;
    end;
  end
  else
  begin
    { Context sensitive dictionary.
      Search the first row having the same native part as the give string. }

    str := str + CONTEXT_SEPARATOR_C;
    len := Length(str);
    while l <= h do
    begin
      i := (l + h) div 2;
      thisStr := Translations[i].Str + CONTEXT_SEPARATOR_C;
      c := SysUtils.CompareStr(thisStr, str);
      if (c = 0) and (Length(thisStr) = len) then
      begin
        Result := i;
        Exit;
      end
      else if c < 0 then
        l := i + 1
      else
        h := i - 1;
    end;
  end;

  Result := -1;
end;

function TIvCustomDictionary.FindContext(const str, form, component: String): Integer;
var
  l, h, i, c: Integer;
  key: String;
begin
  if ContextType = [] then
  begin
    { Flat dictionary. Ignores the context. }

    Result := Find(str);
  end
  else
  begin
    { Context sensitive dictionary.
      Search the first row having the same key as the give string. }

    l := 0;
    h := FTranslations.Count - 1;
    key := TIvTranslation.ComposeKey(str, form, component);
    while l <= h do
    begin
      i := (l + h) div 2;
      c := SysUtils.CompareStr(Translations[i].Key, key);
      if c = 0 then
      begin
        Result := i;
        Exit;
      end
      else if c < 0 then
        l := i + 1
      else
        h := i - 1;
    end;

    Result := -1;
  end;
end;

function TIvCustomDictionary.TranslateString(
  const str: String;
  var translation: String): Boolean;
var
  index: Integer;
begin
  index := Find(str);
  Result := index >= 0;
  if Result then
    translation := Translations[index].Current;
end;

function TIvCustomDictionary.TranslateContextString(
  const str, form, component: String;
  var translation: String): Boolean;
var
  index: Integer;
begin
  index := FindContext(str, form, component);
  Result := index >= 0;
  if Result then
    translation := Translations[index].Current;
end;

procedure TIvCustomDictionary.QuickSort(left, right: Integer);
var
  i, j: Integer;
  p: String;
  translation: TIvTranslation;
begin
  try
  i := left;
  j := right;
  p := Translations[(left + right) shr 1].Str;

  repeat
    while SysUtils.CompareStr(Translations[i].Str, p) < 0 do
      Inc(i);
    while SysUtils.CompareStr(Translations[j].Str, p) > 0 do
      Dec(j);
    if i <= j then
    begin
      translation := FTranslations[i];
      FTranslations[i] := FTranslations[j];
      FTranslations[j] := translation;
      Inc(i);
      Dec(j);
    end;
  until i > j;

  if left < j then
    QuickSort(left, j);

  if i < right then
    QuickSort(i, right);
  except
    p := '';
  end;
end;

procedure TIvCustomDictionary.ContextQuickSort(left, right: Integer);
var
  i, j: Integer;
  p: String;
  translation: TIvTranslation;
begin
  i := left;
  j := right;
  p := Translations[(left + right) shr 1].Key;

  repeat
    while SysUtils.CompareStr(Translations[i].Key, p) < 0 do
      Inc(i);
    while SysUtils.CompareStr(Translations[j].Key, p) > 0 do
      Dec(j);
    if i <= j then
    begin
      translation := FTranslations[i];
      FTranslations[i] := FTranslations[j];
      FTranslations[j] := translation;
      Inc(i);
      Dec(j);
    end;
  until i > j;

  if left < j then
    ContextQuickSort(left, j);

  if i < right then
    ContextQuickSort(i, right);
end;

procedure TIvCustomDictionary.Sort;
begin
  if FTranslations.Count = 0 then
    Exit;

  if ContextType = [] then
    QuickSort(0, FTranslations.Count - 1)
  else
    ContextQuickSort(0, FTranslations.Count - 1);
end;

procedure TIvCustomDictionary.LanguageChanged(
  languageChanged, localeChanged: Boolean);
begin
  if languageChanged then
    LoadTranslation;
  inherited LanguageChanged(languageChanged, localeChanged);
end;


{ TIvCustomFileDictionary }

constructor TIvCustomFileDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);
  FStorage := ivsFile;
end;

procedure TIvCustomFileDictionary.SetStorage(value: TIvStorage);
begin
  if value <> FStorage then
  begin
    FStorage := value;
{$IFDEF WIN32}
  {$IFNDEF IVVB}
    if (csDesigning in ComponentState) and not (csLoading in ComponentState) then
    begin
      case FStorage of
        ivsEmbedded:
          MessageDlg(
            'Each time you edit the dictionary you have to save this form and'#13#10 +
              'rebuild the application in order to get the new translations in use.',
            mtInformation,
            [mbOK],
            0);

        ivsResource:
          MessageDlg(
            'Each time you edit the dictionary you have to compile the resource file containing the dictionary and'#13#10 +
              'add the resource to the application or rebuild the application in order to get the new translations in use.',
            mtInformation,
            [mbOK],
            0);
      end;
    end;
  {$ENDIF}
{$ENDIF}
  end;
end;

function TIvCustomFileDictionary.ExpandFileName(const fileName: String): String;
var
  str: String;
begin
  Result := fileName;
  if FStorage = ivsFile then
  begin
    str := SysUtils.ExpandFileName(Result);
    if FileExists(str) then
      Result := str
    else if ExtractFilePath(fileName) = '' then
    begin
      str := ExtractFilePath(Application.ExeName) + fileName;
      if FileExists(str) then
        Result := str;
    end;
  end;
end;

function TIvCustomFileDictionary.GetFileName: String;
begin
{$IFNDEF IVVB}
  if not IsDesignTime then
    FFilename := ExpandFileName(FFilename);
{$ENDIF}
  Result := FFilename;
end;

function TIvCustomFileDictionary.CanBeOpened: Boolean;
begin
  Result := (FStorage <> ivsFile) or ((FileName <> '') and FileExists(FileName));
end;

end.
