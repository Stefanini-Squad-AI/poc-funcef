unit IvBinDic;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils, Classes,
  IvCommon, IvDictio, IvAMulti, IvMLDFil;

const
  DICTIONARY_RESOURCE_C = 'MlDictionary';

type
  TIvBinaryDictionary = class(TIvCustomFileDictionary)
  protected
{$IFDEF IVVB}
    { OCX must read the whole content of these properties,
      because the property stream is available only once. }
    FAllLanguages: TList;
    FAllLocales: TList;
    FAllTranslations: TMemoryStream;
{$ENDIF}
    FLanguageCount: Integer;
    FTranslationCount: Integer;
    FLocaleCount: Integer;

    procedure ReadLanguages(reader: TReader); virtual;
    procedure WriteLanguages(writer: TWriter);

    procedure ReadTranslations(reader: TReader); virtual;
    procedure WriteTranslations(writer: TWriter);

    procedure ReadLocales(reader: TReader); virtual;
    procedure WriteLocales(writer: TWriter);

    procedure DefineProperties(filer: TFiler); override;

    function OpenFile: TIvMLDFile;

    function GetLanguageCount: Integer; override;
    function GetTranslationCount: Integer; override;
    procedure GetLanguageData(index: Integer; language: TIvLanguage); override;
    function GetLocaleCount: Integer; override;
    procedure GetLocaleData(index: Integer; locale: TIvLocale); override;
    procedure LoadTranslation; override;

  public
{$IFDEF IVVB}
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;
{$ENDIF}

    procedure GetLanguageDatas(list: TList); override;
    procedure GetLocaleDatas(list: TList); override;
  end;

implementation

uses
{$IFDEF IVVB}
  MultiOCX,   { VBEmbeddedXXX methods }
{$ENDIF}
  IvMlRead, IvReader;

{$IFDEF IVVB}
constructor TIvBinaryDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);

  FAllLanguages := TList.Create;
  FAllLocales   := TList.Create;
  FAllTranslations := TMemoryStream.Create;
end;

destructor TIvBinaryDictionary.Destroy;
begin
  FreeList(FAllLanguages);
  FreeList(FAllLocales);
  FAllTranslations.Free;
  inherited Destroy;
end;
{$ENDIF}

procedure TIvBinaryDictionary.ReadLanguages(reader: TReader);
begin
{$IFDEF IVVB}
  if Storage = ivsEmbedded then
    FLanguageCount := VBEmbeddedReadLanguages(reader, FAllLanguages)
  else
{$ENDIF}
    FLanguageCount := TIvReader.SkipLanguages(reader);
end;

procedure TIvBinaryDictionary.WriteLanguages(writer: TWriter);
var
  i: Integer;
  mldFile: TIvMLDFile;
begin
  mldFile := TIvMLDFile.Create;
  try
    mldFile.OpenFile(FileName);

    writer.WriteListBegin;
    writer.WriteInteger(LANGUAGES_VERSION_C);
    writer.WriteInteger(mldFile.LanguageCount);
    mldFile.GoLanguageSection;
    for i := 0 to mldFile.LanguageCount - 1 do
      TIvReader.WriteLanguage(writer, mldFile.GetCurrentLanguage);
    writer.WriteListEnd;
  finally
    mldFile.Free;
  end;
end;

procedure TIvBinaryDictionary.ReadTranslations(reader: TReader);
begin
{$IFDEF IVVB}
  if Storage = ivsEmbedded then
    VBEmbeddedReadTranslations(reader, FLanguageCount, FAllTranslations)
  else
{$ENDIF}
    FTranslationCount := TIvReader.SkipTranslations(reader, FLanguageCount);
end;

procedure TIvBinaryDictionary.WriteTranslations(writer: TWriter);
var
  i, j: Integer;
  row: TStringList;
  mldFile: TIvMLDFile;
  context: TIvContext;
begin
  mldFile := TIvMLDFile.Create;
  context := TIvContext.Create;
  try
    mldFile.OpenFile(FileName);

    writer.WriteListBegin;
    writer.WriteInteger(TRANSLATIONS_VERSION_C);
    writer.WriteInteger(Integer(mldFile.ContextCode));
    writer.WriteInteger(mldFile.TranslationCount);
    mldFile.GoTranslationSection;
    for i := 0 to mldFile.TranslationCount - 1 do
    begin
      row := TStringList.Create;
      mldFile.GetTranslations(context, row);

      writer.WriteListBegin;
      for j := 0 to row.Count - 1 do
      begin
        writer.WriteString(row[j]);
        if j = 0 then
        begin
          if ivctForm in mldFile.ContextType then
            writer.WriteString(context.Form);
          if ivctComponent in mldFile.ContextType then
            writer.WriteString(context.Component);
        end;
      end;
      writer.WriteListEnd;

      row.Free;
    end;
    writer.WriteListEnd;
  finally
    context.Free;
    mldFile.Free;
  end;
end;

procedure TIvBinaryDictionary.ReadLocales(reader: TReader);
begin
{$IFDEF IVVB}
  if Storage = ivsEmbedded then
    FLocaleCount := VBEmbeddedReadLocales(reader, FAllLocales)
  else
{$ENDIF}
    FLocaleCount := TIvReader.SkipLocales(reader);
end;

procedure TIvBinaryDictionary.WriteLocales(writer: TWriter);
var
  i: Integer;
  mldFile: TIvMLDFile;
begin
  mldFile := TIvMLDFile.Create;
  try
    mldFile.OpenFile(FileName);

    writer.WriteListBegin;
    writer.WriteInteger(LOCALES_VERSION_C);
    writer.WriteInteger(mldFile.LocaleCount);
    if mldFile.LocaleCount > 0 then
    begin
      mldFile.GoLocaleSection;
      for i := 0 to mldFile.LocaleCount - 1 do
        TIvReader.WriteLocale(writer, mldFile.GetCurrentLocale);
    end;
    writer.WriteListEnd;
  finally
    mldFile.Free;
  end;
end;

procedure TIvBinaryDictionary.DefineProperties(filer: TFiler);
var
  hasData: boolean;
  mldFile: TIvMLDFile;
{$IFNDEF WIN32}
  buffer: array[0..255] of Char;
{$ENDIF}
begin
  inherited DefineProperties(filer);

  if FStorage = ivsEmbedded then
  begin
    if filer is TReader then
      hasData := True
    else if FileName <> '' then
    begin
      hasData := False;
      if not FileExists(FileName) then
        MessageBox(
          0,
{$IFDEF WIN32}PChar({$ELSE}StrPCopy(buffer,{$ENDIF}
          'Can not find the file name ' + fileName + '. No dictionary data was stored!'),
          'File not found',
          MB_OK)
      else
      begin
        mldFile := TIvMLDFile.Create;
        try
          mldFile.OpenFile(fileName);
          if mldFile.CharacterSet = ivcsUnicode then
          begin
            MessageBox(
              0,
{$IFDEF WIN32}PChar({$ELSE}StrPCopy(buffer,{$ENDIF}
              'Can not use a Unicode MLD file ' + fileName + '. No dictionary data was stored!'),
              'Unicode not supported',
              MB_OK);
          end
          else
            hasData := True;
        finally
          mldFile.Free;
        end;
      end;
    end
    else
      hasData := False;

    filer.DefineProperty(LANGUAGES_C, ReadLanguages, WriteLanguages, hasData);
    filer.DefineProperty(TRANSLATIONS_C, ReadTranslations, WriteTranslations, hasData);
    filer.DefineProperty(LOCALES_C, ReadLocales, WriteLocales, hasData);
  end;
end;

function TIvBinaryDictionary.OpenFile: TIvMLDFile;
begin
  if FFileName = '' then
    raise Exception.Create('No FileName property set');

  Result := TIvMLDFile.Create;
  try
{$IFDEF WIN32}
    if (FStorage = ivsFile) or (IsDesignTime and FileExists(FileName)) then
{$ENDIF}
      Result.Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone)
{$IFDEF WIN32}
    else
      Result.Stream := TResourceStream.Create(HInstance, DICTIONARY_RESOURCE_C, MULTILIZER_RES_TYPE_C)
{$ENDIF}
      ;
    Result.Open;
    FContextType := Result.ContextType;
  except
    Result.Free;
    raise;
  end;
end;

function TIvBinaryDictionary.GetLanguageCount: Integer;
var
  mldFile: TIvMLDFile;
begin
  if (FStorage = ivsFile) or
{$IFDEF WIN32}
    (FStorage = ivsResource) or
{$ENDIF}
    (IsDesignTime and FileExists(FileName)) then
  begin
    mldFile := OpenFile;
    try
      Result := mldFile.LanguageCount;
    finally
      mldFile.Free;
    end;
  end
  else
    Result := FLanguageCount;
end;

function TIvBinaryDictionary.GetTranslationCount: Integer;
var
  mldFile: TIvMLDFile;
begin
  if (FStorage = ivsFile) or
{$IFDEF WIN32}
    (FStorage = ivsResource) or
{$ENDIF}
    (IsDesignTime and FileExists(FileName)) then
  begin
    mldFile := OpenFile;
    try
      Result := mldFile.TranslationCount;
    finally
      mldFile.Free;
    end;
  end
  else
    Result := FTranslationCount;
end;

procedure TIvBinaryDictionary.GetLanguageData(index: Integer; language: TIvLanguage);
var
  mldFile: TIvMLDFile;
begin
  if (FStorage = ivsFile) or
{$IFDEF WIN32}
    (FStorage = ivsResource) or
{$ENDIF}
    (IsDesignTime and FileExists(FileName)) then
  begin
    mldFile := OpenFile;
    try
      language.Assign(mldFile.Languages[index]);
    finally
      mldFile.Free;
    end;
  end
  else
{$IFDEF IVVB}
    VBEmbeddedGetLanguageData(index, language, FAllLanguages);
{$ELSE}
    TIvReader.GetLanguageData(Owner.ClassName, ClassName, Name, index, language);
{$ENDIF}
end;

procedure TIvBinaryDictionary.GetLanguageDatas(list: TList);
var
  i: Integer;
  mldFile: TIvMLDFile;
begin
  if (FStorage = ivsFile) or
{$IFDEF WIN32}
    (FStorage = ivsResource) or
{$ENDIF}
    (IsDesignTime and FileExists(FileName)) then
  begin
    mldFile := OpenFile;
    try
      mldFile.GoLanguageSection;
      for i := 0 to mldFile.LanguageCount - 1 do
        list.Add(mldFile.GetCurrentLanguage.Copy);
    finally
      mldFile.Free;
    end;
  end
  else
{$IFDEF IVVB}
    VBEmbeddedGetLanguageDatas(list, FAllLanguages);
{$ELSE}
    TIvReader.GetLanguageDatas(Owner.ClassName, ClassName, Name, list);
{$ENDIF}
end;

function TIvBinaryDictionary.GetLocaleCount: Integer;
var
  mldFile: TIvMLDFile;
begin
  if (FStorage = ivsFile) or
{$IFDEF WIN32}
    (FStorage = ivsResource) or
{$ENDIF}
    (IsDesignTime and FileExists(FileName)) then
  begin
    mldFile := OpenFile;
    try
      Result := mldFile.LocaleCount;
    finally
      mldFile.Free;
    end;
  end
  else
    Result := FLocaleCount;
end;

procedure TIvBinaryDictionary.GetLocaleData(index: Integer; locale: TIvLocale);
var
  mldFile: TIvMLDFile;
begin
  if (FStorage = ivsFile) or
{$IFDEF WIN32}
    (FStorage = ivsResource) or
{$ENDIF}
    (IsDesignTime and FileExists(FileName)) then
  begin
    mldFile := OpenFile;
    try
      locale.Assign(mldFile.Locales[index]);
    finally
      mldFile.Free;
    end;
  end
  else
    try
{$IFDEF IVVB}
      VBEmbeddedGetLocaleData(index, locale, FAllLocales);
{$ELSE}
      TIvReader.GetLocaleData(Owner.ClassName, ClassName, Name, index, locale);
{$ENDIF}
    except
      raise EIvMulti.Create('No dictionary data! Set the FileName property.');
    end;
end;

procedure TIvBinaryDictionary.GetLocaleDatas(list: TList);
var
  i: Integer;
  mldFile: TIvMLDFile;
begin
  if (FStorage = ivsFile) or
{$IFDEF WIN32}
    (FStorage = ivsResource) or
{$ENDIF}
    (IsDesignTime and FileExists(FileName)) then
  begin
    mldFile := OpenFile;
    try
      if mldFile.LocaleCount > 0 then
      begin
        mldFile.GoLocaleSection;
        for i := 0 to mldFile.LocaleCount - 1 do
          list.Add(mldFile.GetCurrentLocale.Copy);
      end;
    finally
      mldFile.Free;
    end;
  end
  else
  begin
    if FLocaleCount > 0 then
{$IFDEF IVVB}
      VBEmbeddedGetLocaleDatas(list, FAllLocales);
{$ELSE}
      TIvReader.GetLocaleDatas(Owner.ClassName, ClassName, Name, list);
{$ENDIF}
  end;
end;

procedure TIvBinaryDictionary.LoadTranslation;
var
  i, codePage: Integer;
  translation: TIvTranslation;
  mldFile: TIvMLDFile;
begin
  ClearTranslations;

  if (FStorage = ivsFile) or
{$IFDEF WIN32}
    (FStorage = ivsResource) or
{$ENDIF}
    (IsDesignTime and FileExists(FileName)) then
  begin
    mldFile := OpenFile;
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
  end
  else
  begin
{$IFDEF IVVB}
    FContextType := VBEmbeddedLoadTranslation(
      ActiveLanguage,
      SuperLanguage,
      LanguageCount,
      FTranslations,
      FAllTranslations);
{$ELSE}
    FContextType := TIvReader.LoadTranslation(
      Owner.ClassName,
      ClassName,
      Name,
      ActiveLanguage,
      SuperLanguage,
      LanguageCount,
      FTranslations);
{$ENDIF}
  end;

  Sort;
end;

end.

