{ Copyrights 1995-1998 Innoview Data Technologies Ltd. }

unit IvMLDDic;

{$I IVMULTI.INC}

interface

uses
  Classes, IvDictio, IvMLDFil;

type
  TIvIndexItem = class(TObject)
  public
    Position: Integer;
    ContextCode: TIvContextCode;
  end;

  TIvAnsiIndexItem = class(TIvIndexItem)
  protected
    function GetKey: String;

  public
    Str: String;
    Form: String;
    Component: String;

    property Key: String read GetKey;
  end;

  TIvWideIndexItem = class(TIvIndexItem)
  protected
    function GetKey: WideString;

  public
    Str: WideString;
    Form: WideString;
    Component: WideString;

    property Key: WideString read GetKey;
  end;

  TIvMLDDictionary = class(TIvDictionary)
  protected
    FWideIndex: Boolean;
    FLanguageCodePage: Integer;
    FFileName: String;
    FIndex: TList;
    FFile: TIvMLDFile;

    function GetAnsiItem(i: Integer): TIvAnsiIndexItem;
    function GetWideItem(i: Integer): TIvWideIndexItem;

    function GetLanguageCount: Integer; override;
    procedure GetLanguageData(index: Integer; language: TIvLanguage); override;
    function GetLocaleCount: Integer; override;
    procedure GetLocaleData(index: Integer; locale: TIvLocale); override;
    procedure LanguageChanged(languageChanged, localeChanged: Boolean); override;

    procedure BuildIndex;
    procedure ClearIndex;

    function FindFromAnsiIndex(const str: String): Integer;
    function FindContextFromAnsiIndex(const str, form, component: String): Integer;

    function FindFromWideIndex(const str: WideString): Integer;
    function FindContextFromWideIndex(const str, form, component: WideString): Integer;

    function FindAnsiString(const str: String): Integer;
    function FindContextAnsiString(const str, form, component: String): Integer;

    function FindWideString(const str: WideString): Integer;
    function FindContextWideString(const str, form, component: WideString): Integer;

    procedure AnsiQuickSort(left, right: Integer);
    procedure WideQuickSort(left, right: Integer);

  public
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;

    procedure Open; override;

    function TranslateString(
      const str: String;
      var translation: String): Boolean; override;
    function TranslateContextString(
      const str, form, component: String;
      var translation: String): Boolean; override;

    function TranslateAnsiString(
      const str: String;
      var translated: String;
      language, superLanguage: Integer): Boolean;

    function TranslateContextAnsiString(
      const str, form, component: String;
      var translated: String;
      language, superLanguage: Integer): Boolean;

    function TranslateWideString(
      const str: WideString;
      var translated: WideString;
      language, superLanguage: Integer): Boolean;

    function TranslateContextWideString(
      const str, form, component: WideString;
      var translated: WideString;
      language, superLanguage: Integer): Boolean;

    procedure GetLanguageDatas(list: TList); override;
    procedure GetLocaleDatas(list: TList); override;

    property AnsiItems[i: Integer]: TIvAnsiIndexItem read GetAnsiItem;
    property WideItems[i: Integer]: TIvWideIndexItem read GetWideItem;

  published
    property FileName: String read FFileName write FFileName;
    property WideIndex: Boolean read FWideIndex write FWideIndex default False;
  end;

implementation

uses
  SysUtils,
  IvCommon;


// TIvAnsiIndexItem

function TIvAnsiIndexItem.GetKey: String;
begin
  case ContextCode of
    ivccFlat: Result := Str;
    ivccFull: Result := Str + CONTEXT_SEPARATOR_C + Form + Component;
    ivccComponent: Result := Str + CONTEXT_SEPARATOR_C + Component;
    ivccForm: Result := Str + CONTEXT_SEPARATOR_C + Form;
  end;
end;


// TIvWideIndexItem

function TIvWideIndexItem.GetKey: WideString;
begin
  case ContextCode of
    ivccFlat: Result := Str;
    ivccFull: Result := Str + CONTEXT_SEPARATOR_C + Form + Component;
    ivccComponent: Result := Str + CONTEXT_SEPARATOR_C + Component;
    ivccForm: Result := Str + CONTEXT_SEPARATOR_C + Form;
  end;
end;


// TIvMLDDictionary

constructor TIvMLDDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);
  FWideIndex := False;
  FFile := TIvMLDFile.Create;
  FIndex := TList.Create;
end;

destructor TIvMLDDictionary.Destroy;
begin
  ClearIndex;
  FIndex.Free;
  FFile.Free;
  inherited Destroy;
end;

function TIvMLDDictionary.GetAnsiItem(i: Integer): TIvAnsiIndexItem;
begin
  if FFile.CharacterSet <> ivcsCodePage then
    raise Exception.Create('Not an ansi index');
  Result := FIndex[i];
end;

function TIvMLDDictionary.GetWideItem(i: Integer): TIvWideIndexItem;
begin
  if FFile.CharacterSet <> ivcsUnicode then
    raise Exception.Create('Not a wide index');
  Result := FIndex[i];
end;

procedure TIvMLDDictionary.BuildIndex;
var
  i: Integer;
  ansi: TIvAnsiIndexItem;
  wide: TIvWideIndexItem;
  ansiStr, ansiForm, ansiComponent: String;
begin
  ClearIndex;

  FContextType := FFile.ContextType;
  FFile.GoTranslationSection;
  for i := 0 to FFile.TranslationCount - 1 do
  begin
    if FWideIndex or (FFile.CharacterSet = ivcsUnicode) then
    begin
      // Unicode item

      wide := TIvWideIndexItem.Create;
      wide.Position := FFile.Stream.Position;
      if FFile.CharacterSet = ivcsUnicode then
        FFile.GetWideKey(wide.Str, wide.Form, wide.Component)
      else
      begin
        FFile.GetAnsiKey(ansiStr, ansiForm, ansiComponent);
        wide.Str := ansiStr;
        wide.Form := ansiForm;
        wide.Component := ansiComponent;
      end;
      FIndex.Add(wide);
    end
    else
    begin
      // Ansi item

      ansi := TIvAnsiIndexItem.Create;
      ansi.Position := FFile.Stream.Position;
      FFile.GetAnsiKey(ansi.Str, ansi.Form, ansi.Component);
      FIndex.Add(ansi);
    end;
  end;

  if FFile.CharacterSet = ivcsUnicode then
    WideQuickSort(0, FIndex.Count - 1)
  else
    AnsiQuickSort(0, FIndex.Count - 1);
end;

procedure TIvMLDDictionary.ClearIndex;
begin
  while FIndex.Count > 0 do
  begin
    TIvIndexItem(FIndex[0]).Free;
    FIndex.Delete(0);
  end;
end;

procedure TIvMLDDictionary.Open;
begin
  FFile.Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  FFile.Open;
  BuildIndex;
  inherited Open;
end;

function TIvMLDDictionary.FindFromAnsiIndex(const str: String): Integer;
var
  l, h, i, c: Integer;
begin
  l := 0;
  h := FIndex.Count - 1;
  while l <= h do
  begin
    i := (l + h) div 2;
    c := IvCompareStr(AnsiItems[i].Str, str, FNativeLocale, False);
    if c = 0 then
    begin
      Result := Integer(AnsiItems[i].Position);
      Exit;
    end
    else if c < 0 then
      l := i + 1
    else
      h := i - 1;
  end;

  Result := -1;
end;

function TIvMLDDictionary.FindContextFromAnsiIndex(const str, form, component: String): Integer;
var
  l, h, i, c: Integer;
  key: String;
begin
  if ContextType = [] then
    Result := FindFromAnsiIndex(str)
  else
  begin
    l := 0;
    h := FIndex.Count - 1;
    key := str + form + component;
    while l <= h do
    begin
      i := (l + h) div 2;
      c := IvCompareStr(AnsiItems[i].Key, key, FNativeLocale, False);
      if c = 0 then
      begin
        Result := Integer(AnsiItems[i].Position);
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

function TIvMLDDictionary.FindFromWideIndex(const str: WideString): Integer;
var
  l, h, i, c: Integer;
begin
  l := 0;
  h := FIndex.Count - 1;
  while l <= h do
  begin
    i := (l + h) div 2;
    c := IvWideCompareStr(WideItems[i].Str, str, FNativeLocale, False);
    if C = 0 then
    begin
      Result := Integer(WideItems[i].Position);
      Exit;
    end
    else if C < 0 then
      L := I + 1
    else
      H := I - 1;
  end;

  Result := -1;
end;

function TIvMLDDictionary.FindContextFromWideIndex(const str, form, component: WideString): Integer;
var
  l, h, i, c: Integer;
  key: WideString;
begin
  if ContextType = [] then
    Result := FindFromWideIndex(str)
  else
  begin
    l := 0;
    h := FIndex.Count - 1;
    key := str + form + component;
    while l <= h do
    begin
      i := (l + h) div 2;
      c := IvWideCompareStr(WideItems[i].Key, key, FNativeLocale, False);
      if C = 0 then
      begin
        Result := Integer(WideItems[i].Position);
        Exit;
      end
      else if C < 0 then
        L := I + 1
      else
        H := I - 1;
    end;

    Result := -1;
  end;
end;

function TIvMLDDictionary.FindAnsiString(const str: String): Integer;
begin
  if FFile.CharacterSet = ivcsCodePage then
    Result := FindFromAnsiIndex(str)
  else
    Result := FindFromWideIndex(IvStrToWStr(str, FFile.NativeCodePage));
end;

function TIvMLDDictionary.FindContextAnsiString(const str, form, component: String): Integer;
begin
  if FFile.CharacterSet = ivcsCodePage then
    Result := FindContextFromAnsiIndex(str, form, component)
  else
    Result := FindContextFromWideIndex(
      IvStrToWStr(str, FFile.NativeCodePage),
      IvStrToWStr(form, FFile.NativeCodePage),
      IvStrToWStr(component, FFile.NativeCodePage));
end;

function TIvMLDDictionary.FindWideString(const str: WideString): Integer;
begin
  if FFile.CharacterSet = ivcsUnicode then
    Result := FindFromWideIndex(str)
  else
    Result := FindFromAnsiIndex(IvWStrToStr(str, FFile.NativeCodePage));
end;

function TIvMLDDictionary.FindContextWideString(const str, form, component: WideString): Integer;
begin
  if FFile.CharacterSet = ivcsUnicode then
    Result := FindContextFromWideIndex(str, form, component)
  else
    Result := FindContextFromAnsiIndex(
      IvWStrToStr(str, FFile.NativeCodePage),
      IvWStrToStr(form, FFile.NativeCodePage),
      IvWStrToStr(component, FFile.NativeCodePage));
end;

function TIvMLDDictionary.TranslateAnsiString(
  const str: String;
  var translated: String;
  language, superLanguage: Integer): Boolean;
var
  pos: Integer;
begin
  pos := FindAnsiString(str);
  if pos < 0 then
    Result := False
  else
  begin
    FFile.Stream.Seek(pos, soFromBeginning);
    translated := FFile.GetAnsiString(language, superLanguage, FLanguageCodePage);
    Result := True;
  end;
end;

function TIvMLDDictionary.TranslateContextAnsiString(
  const str, form, component: String;
  var translated: String;
  language, superLanguage: Integer): Boolean;
var
  pos: Integer;
begin
  pos := FindContextAnsiString(str, form, component);
  if pos < 0 then
    Result := False
  else
  begin
    FFile.Stream.Seek(pos, soFromBeginning);
    translated := FFile.GetAnsiString(language, superLanguage, FLanguageCodePage);
    Result := True;
  end;
end;

function TIvMLDDictionary.TranslateWideString(
  const str: WideString;
  var translated: WideString;
  language, superLanguage: Integer): Boolean;
var
  pos: Integer;
begin
  pos := FindWideString(str);
  if pos < 0 then
    Result := False
  else
  begin
    FFile.Stream.Seek(pos, soFromBeginning);
    translated := FFile.GetWideString(language, superLanguage, FLanguageCodePage);
    Result := True;
  end;
end;

function TIvMLDDictionary.TranslateContextWideString(
  const str, form, component: WideString;
  var translated: WideString;
  language, superLanguage: Integer): Boolean;
var
  pos: Integer;
begin
  pos := FindContextWideString(str, form, component);
  if pos < 0 then
    Result := False
  else
  begin
    FFile.Stream.Seek(pos, soFromBeginning);
    translated := FFile.GetWideString(language, superLanguage, FLanguageCodePage);
    Result := True;
  end;
end;

function TIvMLDDictionary.GetLanguageCount: Integer;
begin
  Result := FFile.LanguageCount;
end;

procedure TIvMLDDictionary.GetLanguageData(index: Integer; language: TIvLanguage);
begin
  language.Assign(FFile.Languages[index]);
end;

procedure TIvMLDDictionary.GetLanguageDatas(list: TList);
var
  i: Integer;
begin
  FFile.GoLanguageSection;
  for i := 0 to FFile.LanguageCount - 1 do
    list.Add(FFile.GetCurrentLanguage.Copy);
end;

function TIvMLDDictionary.GetLocaleCount: Integer;
begin
  Result := FFile.LocaleCount;
end;

procedure TIvMLDDictionary.GetLocaleData(index: Integer; locale: TIvLocale);
begin
  locale.Assign(FFile.Locales[index]);
end;

procedure TIvMLDDictionary.GetLocaleDatas(list: TList);
var
  i: Integer;
begin
  FFile.GoLocaleSection;
  for i := 0 to FFile.LocaleCount - 1 do
    list.Add(FFile.GetCurrentLocale.Copy);
end;

function TIvMLDDictionary.TranslateString(
  const str: String;
  var translation: String): Boolean;
begin
  Result := TranslateAnsiString(str, translation, FActiveLanguage, FSuperLanguage);
end;

function TIvMLDDictionary.TranslateContextString(
  const str, form, component: String;
  var translation: String): Boolean;
begin
  Result := TranslateContextAnsiString(str, form, component, translation, FActiveLanguage, FSuperLanguage);
end;

procedure TIvMLDDictionary.LanguageChanged(languageChanged, localeChanged: Boolean);
begin
  if languageChanged then
    FLanguageCodePage := Languages[FActiveLanguage].CodePage;
  inherited LanguageChanged(languageChanged, localeChanged);
end;

procedure TIvMLDDictionary.AnsiQuickSort(left, right: Integer);
var
  i, j: Integer;
  p: String;
  item: TIvAnsiIndexItem;
begin
  i := left;
  j := right;
  if FFile.ContextType = [] then
    p := AnsiItems[(left + right) shr 1].Str
  else
    p := AnsiItems[(left + right) shr 1].Key;

  repeat
    if FFile.ContextType = [] then
    begin
      while IvCompareStr(AnsiItems[i].Str, p, FNativeLocale, False) < 0 do
        Inc(i);
      while IvCompareStr(AnsiItems[j].Str, p, FNativeLocale, False) > 0 do
        Dec(j);
    end
    else
    begin
      while IvCompareStr(AnsiItems[i].Key, p, FNativeLocale, False) < 0 do
        Inc(i);
      while IvCompareStr(AnsiItems[j].Key, p, FNativeLocale, False) > 0 do
        Dec(j);
    end;

    if i <= j then
    begin
      item := FIndex[i];
      FIndex[i] := FIndex[j];
      FIndex[j] := item;
      Inc(i);
      Dec(j);
    end;
  until i > j;

  if left < j then
    AnsiQuickSort(left, j);

  if i < right then
    AnsiQuickSort(i, right);
end;

procedure TIvMLDDictionary.WideQuickSort(left, right: Integer);
var
  i, j: Integer;
  p: WideString;
  item: TIvWideIndexItem;
begin
  i := left;
  j := right;
  if FFile.ContextType = [] then
    p := WideItems[(left + right) shr 1].Str
  else
    p := WideItems[(left + right) shr 1].Key;

  repeat
    if FFile.ContextType = [] then
    begin
      while IvWideCompareStr(WideItems[i].Str, p, FNativeLocale, False) < 0 do
        Inc(i);
      while IvWideCompareStr(WideItems[j].Str, p, FNativeLocale, False) > 0 do
        Dec(j);
    end
    else
    begin
      while IvWideCompareStr(WideItems[i].Key, p, FNativeLocale, False) < 0 do
        Inc(i);
      while IvWideCompareStr(WideItems[j].Key, p, FNativeLocale, False) > 0 do
        Dec(j);
    end;

    if i <= j then
    begin
      item := FIndex[i];
      FIndex[i] := FIndex[j];
      FIndex[j] := item;
      Inc(i);
      Dec(j);
    end;
  until i > j;

  if left < j then
    WideQuickSort(left, j);

  if i < right then
    WideQuickSort(i, right);
end;

end.
