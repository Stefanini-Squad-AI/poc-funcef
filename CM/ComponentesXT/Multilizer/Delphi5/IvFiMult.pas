unit IvFiMult;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
  IvWParser,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils, Classes,
  IvCommon, IvParser, IvDictio, IvAMulti;

const
  LANGUAGE_RESOURCE_C = 'MlLanguage';
  TRANSLATION_RESOURCE_C = 'MlTranslation';
  LOCALE_RESOURCE_C = 'MlLocale';

type
  TIvTextFormat =
  (
    ivtfDetect, { Detects the file format }
    ivtfAnsi,   { Ansi file }
    ivtfUTF8,   { UTF-8 file }
    ivtfUTF16   { UTF-16 file }
  );

  TIvTextDictionary = class(TIvCustomFileDictionary)
  protected
{$IFDEF IVVB}
    { OCX must read the whole content of these properties,
      because the property stream is available only once.  }
    FAllLanguages: TList;
    FAllLocales: TList;
    FAllTranslations: TMemoryStream;
{$ENDIF}
    FLanguageFileName: String;
    FLocaleFileName: String;
    FLanguageCount: Integer;
    FLocaleCount: Integer;
    FConvert: Boolean;
{$IFDEF WIN32}
    FFormat: TIvTextFormat;
    FByteOrder: TIvByteOrder;
    FByteOrderMark: Boolean;
{$ENDIF}

    function GetLanguageFileName: String;
    function GetLocaleFileName: String;

    procedure ReadLanguages(reader: TReader); virtual;
    procedure WriteLanguages(writer: TWriter);

    procedure ReadTranslations(reader: TReader); virtual;
    procedure WriteTranslations(writer: TWriter);

    procedure ReadLocales(reader: TReader); virtual;
    procedure WriteLocales(writer: TWriter);

    procedure DefineProperties(filer: TFiler); override;

    function GetLanguageCount: Integer; override;
    procedure GetLanguageData(index: Integer; language: TIvLanguage); override;

    function GetLocaleCount: Integer; override;
    procedure GetLocaleData(index: Integer; locale: TIvLocale); override;

    procedure LoadTranslation; override;

    function GetFileFormat(const filename: String): TIvTextFormat;
{$IFDEF WIN32}
    function GetResourceFormat(const resourceName: String): TIvTextFormat;
{$ENDIF}

  public
    constructor Create(owner: TComponent); override;
{$IFDEF IVVB}
    destructor Destroy; override;
{$ENDIF}

    function CanBeOpened: Boolean; override;

    procedure GetLanguageDatas(list: TList); override;
    procedure GetLocaleDatas(list: TList); override;

    class function GetLanguage(parser: TIvAnsiParser; language: TIvLanguage): Boolean;
    class function GetLocale(parser: TIvAnsiParser; locale: TIvLocale): Boolean;

{$IFDEF WIN32}
    class function GetLanguageW(parser: TIvWideParser; language: TIvLanguage): Boolean;
    class function GetLocaleW(parser: TIvWideParser; locale: TIvLocale): Boolean;
{$ENDIF}

    class function GetContextType(
{$IFDEF WIN32}
      const line: String;
{$ELSE}
      line: PChar;
{$ENDIF}
      languageCount: Integer): TIvContextType;

{$IFDEF WIN32}
    class function GetContextTypeW(
  {$IFDEF IVWIDE}
      const line: WideString;
  {$ELSE}
      line: PWideChar;
  {$ENDIF}
      languageCount: Integer): TIvContextType;
{$ENDIF}

  published
    property LanguageFileName: String read GetLanguageFileName write FLanguageFileName;
    property LocaleFileName: String read GetLocaleFileName write FLocaleFileName;
    property Convert: Boolean read FConvert write FConvert default True;
{$IFDEF WIN32}
    property Format: TIvTextFormat read FFormat write FFormat default ivtfDetect;
    property ByteOrder: TIvByteOrder read FByteOrder write FByteOrder default ivboLittleEndian;
    property ByteOrderMark: Boolean read FByteOrderMark write FByteOrderMark default True;
{$ENDIF}
  end;

  TIvFileDictionary = class(TIvTextDictionary)
  end;

  function IsUTF16File(const filename: String): Boolean;
{$IFDEF WIN32}
  function IsUTF16Resource(const resourceName: String): Boolean;

  function DoesResourceExist(const resourceName: String): Boolean;
{$ENDIF}

implementation

uses
{$IFDEF IVVB}
  MultiOCX,
{$ENDIF}
{$IFDEF WIN32}
  IvWReader,
{$ENDIF}
  IvMlRead, IvReader;

{$IFNDEF WIN32}
const
  NO_UNICODE_SUPPORT_C = '16-bit Multilizer does not support Unicode files!';
{$ENDIF}

{$IFNDEF IVWIDE}
const
  NO_UTF8_SUPPORT_C = 'Delphi 1&2 and C++Builder 1 do not support UTF-8 files!';
{$ENDIF}

constructor TIvTextDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);
  FLanguageCount := 0;
  FLocaleCount := 0;
  FConvert := True;
{$IFDEF WIN32}
  FFormat := ivtfDetect;
  FByteOrder := ivboLittleEndian;
  FByteOrderMark := True;
{$ENDIF}

{$IFDEF IVVB}
  FAllLanguages := TList.Create;
  FAllLocales   := TList.Create;
  FAllTranslations := TMemoryStream.Create;
{$ENDIF}
end;

{$IFDEF IVVB}
destructor TIvTextDictionary.Destroy;
begin
  FreeList(FAllLanguages);
  FreeList(FAllLocales);
  FAllTranslations.Free;
  inherited Destroy;
end;
{$ENDIF}

function TIvTextDictionary.GetFileFormat(const filename: String): TIvTextFormat;
begin
{$IFDEF WIN32}
  if FFormat = ivtfDetect then
  begin
    if IsUTF16File(filename) then
      Result := ivtfUTF16
    else
      Result := ivtfAnsi;
  end
  else
    Result := FFormat;
{$ELSE}
  if IsUTF16File(filename) then
    Result := ivtfUTF16
  else
    Result := ivtfAnsi;
{$ENDIF}
end;

{$IFDEF WIN32}
function TIvTextDictionary.GetResourceFormat(const resourceName: String): TIvTextFormat;
begin
  if FFormat = ivtfDetect then
  begin
    if IsUTF16Resource(resourceName) then
      Result := ivtfUTF16
    else
      Result := ivtfAnsi;
  end
  else
    Result := FFormat;
end;
{$ENDIF}

function TIvTextDictionary.GetLanguageFileName: String;
begin
{$IFNDEF IVVB}
  if not IsDesignTime then
    FLanguageFilename := ExpandFileName(FLanguageFilename);
{$ENDIF}
  Result := FLanguageFilename;
end;

function TIvTextDictionary.GetLocaleFileName: String;
begin
{$IFNDEF IVVB}
  if not IsDesignTime then
    FLocaleFilename := ExpandFileName(FLocaleFilename);
{$ENDIF}
  Result := FLocaleFilename;
end;

function TIvTextDictionary.CanBeOpened: Boolean;
begin
  Result := inherited CanBeOpened and
    (FStorage <> ivsFile) or
    (
{$IFNDEF WIN32}
      (LocaleFileName <> '') and FileExists(LocaleFileName) and
{$ENDIF}
      (LanguageFileName <> '') and FileExists(LanguageFileName)
    );
end;

procedure TIvTextDictionary.ReadLanguages(reader: TReader);
begin
{$IFDEF IVVB}
  if Storage = ivsEmbedded then
    FLanguageCount := VBEmbeddedReadLanguages(reader, FAllLanguages)
  else
{$ENDIF}
    FLanguageCount := TIvReader.SkipLanguages(reader);
end;

procedure TIvTextDictionary.WriteLanguages(writer: TWriter);
var
  i: Integer;
begin
  writer.WriteListBegin;
  writer.WriteInteger(LANGUAGES_VERSION_C);
  writer.WriteInteger(LanguageCount);
  for i := 0 to LanguageCount - 1 do
    TIvReader.WriteLanguage(writer, Languages[i]);
  writer.WriteListEnd;
end;

procedure TIvTextDictionary.ReadTranslations(reader: TReader);
begin
{$IFDEF IVVB}
  if Storage = ivsEmbedded then
    VBEmbeddedReadTranslations(reader, FLanguageCount, FAllTranslations)
  else
{$ENDIF}
    TIvReader.SkipTranslations(reader, FLanguageCount);
end;

class function TIvTextDictionary.GetContextType(
{$IFDEF WIN32}
  const line: String;
{$ELSE}
  line: PChar;
{$ENDIF}
  languageCount: Integer): TIvContextType;
var
  i, tabCount: Integer;
begin
  tabCount := 0;
{$IFDEF WIN32}
  for i := 1 to Length(line) do
    if line[i] = #9 then
      Inc(tabCount);
{$ELSE}
  for i := 0 to StrLen(line) - 1 do
    if line[i] = #9 then
      Inc(tabCount);
{$ENDIF}

  if tabCount = languageCount then
    Result := [ivctComponent]
  else if tabCount > languageCount then
    Result := [ivctForm, ivctComponent]
  else
    Result := [];
end;

{$IFDEF WIN32}
class function TIvTextDictionary.GetContextTypeW(
{$IFDEF IVWIDE}
  const line: WideString;
{$ELSE}
  line: PWideChar;
{$ENDIF}
  languageCount: Integer): TIvContextType;
var
  i, tabCount: Integer;
begin
  tabCount := 0;
{$IFDEF IVWIDE}
  for i := 1 to Length(line) do
    if line[i] = #9 then
      Inc(tabCount);
{$ELSE}
  for i := 0 to SysStringLen(line) - 1 do
    if line[i] = #9 then
      Inc(tabCount);
{$ENDIF}

  if tabCount = languageCount then
    Result := [ivctComponent]
  else if tabCount > languageCount then
    Result := [ivctForm, ivctComponent]
  else
    Result := [];
end;
{$ENDIF}

procedure TIvTextDictionary.WriteTranslations(writer: TWriter);
var
  i, j, count: Integer;
  parser: TIvAnsiParser;
  reader: TIvAnsiReader;
  context: TIvContextType;
{$IFDEF WIN32}
  str: String;
{$ELSE}
  str: PChar;
{$ENDIF}
begin
  context := [];

  reader := TIvAnsiReader.Create;
  reader.StorageName := Filename;
  reader.Open;
  count := 0;
  while not reader.Eof do
  begin
    str := reader.ReadLine;
    if count = 0 then
      context := GetContextType(str, LanguageCount);
{$IFNDEF WIN32}
    StrDispose(str);
{$ENDIF}
    Inc(count);
  end;
  reader.Close;

  reader.Open;
  writer.WriteListBegin;
  writer.WriteInteger(TRANSLATIONS_VERSION_C);
  writer.WriteInteger(Integer(TIvContext.ContextTypeToCode(context)));
  writer.WriteInteger(count);
  for i := 0 to count - 1 do
  begin
    parser := TIvAnsiParser.CreateValue(reader.ReadLine, #9);
    try
      writer.WriteListBegin;
      for j := 0 to LanguageCount - 1 do
      begin
        writer.WriteString(parser.GetString);
        if j = 0 then
        begin
          if ivctForm in context then
            writer.WriteString(parser.GetString);
          if ivctComponent in context then
            writer.WriteString(parser.GetString);
        end;
      end;
      writer.WriteListEnd;
    finally
      parser.Free;
    end;
  end;
  writer.WriteListEnd;

  reader.Free;
end;

procedure TIvTextDictionary.ReadLocales(reader: TReader);
begin
{$IFDEF IVVB}
  if Storage = ivsEmbedded then
    FLocaleCount := VBEmbeddedReadLocales(reader, FAllLocales)
  else
{$ENDIF}
    FLocaleCount := TIvReader.SkipLocales(reader);
end;

procedure TIvTextDictionary.WriteLocales(writer: TWriter);
var
  i: Integer;
begin
  writer.WriteListBegin;
  writer.WriteInteger(LOCALES_VERSION_C);
  writer.WriteInteger(LocaleCount);
  for i := 0 to LocaleCount - 1 do
    TIvReader.WriteLocale(writer, Locales[i]);
  writer.WriteListEnd;
end;

procedure TIvTextDictionary.DefineProperties(filer: TFiler);

  function HasData(const fileName: String): Boolean;
{$IFNDEF WIN32}
  var
    buffer: array[0..255] of Char;
{$ENDIF}
  begin
    if filer is TReader then
      Result := True
    else
    begin
      Result := False;
      if fileName <> '' then
      begin
        if not FileExists(fileName) then
          MessageBox(
            0,
{$IFDEF WIN32}PChar({$ELSE}StrPCopy(buffer,{$ENDIF}
            'Can not find the file name ' + fileName + '. No table data was stored!'),
            'File not found',
            MB_OK)
        else if IsUTF16File(fileName) then
          MessageBox(
            0,
{$IFDEF WIN32}PChar({$ELSE}StrPCopy(buffer,{$ENDIF}
            'Can not use a UTF-16 file ' + fileName + '. No table data was stored!'),
            'UTF-16 not supported',
            MB_OK)
        else
          Result := True;
      end;
    end;
  end;

begin
  inherited DefineProperties(filer);

  if FStorage = ivsEmbedded then
  begin
    if (Filename <> '') and (LanguageFileName = '') then
      raise Exception.Create('No language file assigned');
    if (Filename = '') and (LanguageFileName <> '') then
      raise Exception.Create('No translation file assigned');

    HasData(LocaleFileName);

    if HasData(LanguageFileName) and HasData(Filename) and (filer is TWriter) then
      Open;

    try
      filer.DefineProperty(LANGUAGES_C, ReadLanguages, WriteLanguages, HasData(LanguageFileName));
      filer.DefineProperty(TRANSLATIONS_C, ReadTranslations, WriteTranslations, HasData(Filename));
      filer.DefineProperty(LOCALES_C, ReadLocales, WriteLocales, HasData(LocaleFileName));
    finally
      if (filer is TWriter) and IsOpen then
        Close;
    end;
  end;
end;

function TIvTextDictionary.GetLanguageCount: Integer;

  function GetAnsiCount(reader: TIvBaseAnsiReader; name: String): Integer;
  begin
    Result := 0;
    try
      reader.StorageName := name;
      reader.Open;
      while not reader.Eof do
      begin
        reader.ReadLine;
        Inc(Result);
      end;
    finally
      reader.Free;
    end;
  end;

{$IFDEF WIN32}
  function GetWideCount(reader: TIvBaseWideReader; name: String): Integer;
  begin
    Result := 0;
    try
      reader.StorageName := name;
      reader.Open;
      while not reader.Eof do
      begin
        reader.ReadLine;
        Inc(Result);
      end;
    finally
      reader.Free;
    end;
  end;
{$ENDIF}

begin
  if IsDesignTime or (FStorage = ivsFile) then
  begin
    case GetFileFormat(LanguageFileName) of
      ivtfUTF8:
{$IFDEF IVWIDE}
        Result := GetWideCount(TIvUTF8Reader.Create, LanguageFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UTF8_SUPPORT_C);
{$ENDIF}

      ivtfUTF16:
{$IFDEF WIN32}
        Result := GetWideCount(TIvUTF16Reader.Create(FByteOrder, FByteOrderMark), LanguageFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UNICODE_SUPPORT_C);
{$ENDIF}
    else
      Result := GetAnsiCount(TIvAnsiReader.Create, LanguageFileName);
    end;
  end
  else if FStorage = ivsEmbedded then
    Result := FLanguageCount
  else
  begin
{$IFDEF WIN32}
    case GetResourceFormat(LANGUAGE_RESOURCE_C) of
      ivtfUTF8:
        Result := GetWideCount(TIvResourceUTF8Reader.Create, LANGUAGE_RESOURCE_C);

      ivtfUTF16:
        Result := GetWideCount(TIvResourceUTF16Reader.Create, LANGUAGE_RESOURCE_C);
    else
      Result := GetAnsiCount(TIvResourceAnsiReader.Create, LANGUAGE_RESOURCE_C);
    end;
{$ENDIF}
  end;
end;

procedure TIvTextDictionary.GetLanguageData(index: Integer; language: TIvLanguage);

  procedure GetAnsiData(reader: TIvBaseAnsiReader; name: String);
  var
    i: Integer;
    parser: TIvAnsiParser;
  begin
    parser := TIvAnsiParser.Create;
    try
      reader.StorageName := name;
      reader.Open;

      for i := 0 to index do
        parser.Value := reader.ReadLine;

      GetLanguage(parser, language);
    finally
      reader.Free;
      parser.Free;
    end;
  end;

{$IFDEF WIN32}
  procedure GetWideData(reader: TIvBaseWideReader; name: String);
  var
    i: Integer;
    parser: TIvWideParser;
  begin
    parser := TIvWideParser.Create;
    try
      reader.StorageName := name;
      reader.Open;

      for i := 0 to index do
        parser.Value := reader.ReadLine;

      GetLanguageW(parser, language);
    finally
      reader.Free;
      parser.Free;
    end;
  end;
{$ENDIF}

begin
  if IsDesignTime or (FStorage = ivsFile) then
  begin
    case GetFileFormat(LanguageFileName) of
      ivtfUTF8:
{$IFDEF IVWIDE}
        GetWideData(TIvUTF8Reader.Create, LanguageFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UTF8_SUPPORT_C);
{$ENDIF}

      ivtfUTF16:
{$IFDEF WIN32}
        GetWideData(TIvUTF16Reader.Create(FByteOrder, FByteOrderMark), LanguageFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UNICODE_SUPPORT_C);
{$ENDIF}
    else
      GetAnsiData(TIvAnsiReader.Create, LanguageFileName);
    end;
  end
  else if FStorage = ivsEmbedded then
{$IFDEF IVVB}
    VBEmbeddedGetLanguageData(index, language, FAllLanguages)
{$ELSE}
    TIvReader.GetLanguageData(Owner.ClassName, ClassName, Name, index, language)
{$ENDIF}
  else
  begin
{$IFDEF WIN32}
    case GetResourceFormat(LANGUAGE_RESOURCE_C) of
      ivtfUTF8:
        GetWideData(TIvResourceUTF8Reader.Create, LANGUAGE_RESOURCE_C);

      ivtfUTF16:
        GetWideData(TIvResourceUTF16Reader.Create, LANGUAGE_RESOURCE_C);
    else
      GetAnsiData(TIvResourceAnsiReader.Create, LANGUAGE_RESOURCE_C);
    end;
{$ENDIF}
  end;
end;

procedure TIvTextDictionary.GetLanguageDatas(list: TList);

  procedure GetAnsiDatas(reader: TIvBaseAnsiReader; name: String);
  var
    parser: TIvAnsiParser;
    language: TIvLanguage;
  begin
    parser := TIvAnsiParser.Create;
    try
      reader.StorageName := name;
      reader.Open;
      while not reader.Eof do
      begin
        language := TIvLanguage.Create;
        parser.Value := reader.ReadLine;
        GetLanguage(parser, language);
        list.Add(language);
      end;
    finally
      reader.Free;
      parser.Free;
    end;
  end;

{$IFDEF WIN32}
  procedure GetWideDatas(reader: TIvBaseWideReader; name: String);
  var
    parser: TIvWideParser;
    language: TIvLanguage;
  begin
    parser := TIvWideParser.Create;
    try
      reader.StorageName := name;
      reader.Open;
      while not reader.Eof do
      begin
        language := TIvLanguage.Create;
        parser.Value := reader.ReadLine;
        GetLanguageW(parser, language);
        list.Add(language);
      end;
    finally
      reader.Free;
      parser.Free;
    end;
  end;
{$ENDIF}

begin
  if IsDesignTime or (FStorage = ivsFile) then
  begin
    if LanguageFileName = '' then
      raise EIvMulti.Create('No language file given');

    if not FileExists(LanguageFileName) then
      raise EIvMulti.Create('Language file "' + LanguageFileName + '" not found');

    case GetFileFormat(LanguageFileName) of
      ivtfUTF8:
{$IFDEF IVWIDE}
        GetWideDatas(TIvUTF8Reader.Create, LanguageFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UTF8_SUPPORT_C);
{$ENDIF}

      ivtfUTF16:
{$IFDEF WIN32}
        GetWideDatas(TIvUTF16Reader.Create(FByteOrder, FByteOrderMark), LanguageFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UNICODE_SUPPORT_C);
{$ENDIF}
    else
      GetAnsiDatas(TIvAnsiReader.Create, LanguageFileName);
    end;
  end
  else if FStorage = ivsEmbedded then
{$IFDEF IVVB}
    VBEmbeddedGetLanguageDatas(list, FAllLanguages)
{$ELSE}
    TIvReader.GetLanguageDatas(Owner.ClassName, ClassName, Name, list)
{$ENDIF}
  else
  begin
{$IFDEF WIN32}
    case GetResourceFormat(LANGUAGE_RESOURCE_C) of
      ivtfUTF8:
        GetWideDatas(TIvResourceUTF8Reader.Create, LANGUAGE_RESOURCE_C);

      ivtfUTF16:
        GetWideDatas(TIvResourceUTF16Reader.Create, LANGUAGE_RESOURCE_C);
    else
      GetAnsiDatas(TIvResourceAnsiReader.Create, LANGUAGE_RESOURCE_C);
    end;
{$ENDIF}
  end;
end;

function TIvTextDictionary.GetLocaleCount: Integer;

  function GetAnsiCount(reader: TIvBaseAnsiReader; name: String): Integer;
  begin
    Result := 0;
    if LocaleFileName = '' then
      Exit;

    try
      reader.StorageName := name;
      reader.Open;
      while not reader.Eof do
      begin
        reader.ReadLine;
        Inc(Result);
      end;
    finally
      reader.Free;
    end;
  end;

{$IFDEF WIN32}
  function GetWideCount(reader: TIvBaseWideReader; name: String): Integer;
  begin
    Result := 0;
    if LocaleFileName = '' then
      Exit;

    try
      reader.StorageName := name;
      reader.Open;
      while not reader.Eof do
      begin
        reader.ReadLine;
        Inc(Result);
      end;
    finally
      reader.Free;
    end;
  end;
{$ENDIF}

begin
  if IsDesignTime or (FStorage = ivsFile) then
  begin
    case GetFileFormat(LanguageFileName) of
      ivtfUTF8:
{$IFDEF IVWIDE}
        Result := GetWideCount(TIvUTF8Reader.Create, LocaleFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UTF8_SUPPORT_C);
{$ENDIF}

      ivtfUTF16:
{$IFDEF WIN32}
        Result := GetWideCount(TIvUTF16Reader.Create(FByteOrder, FByteOrderMark), LocaleFileName)
{$ELSE}
        raise EIvMulti.Create(NO_UNICODE_SUPPORT_C)
{$ENDIF}
    else
      Result := GetAnsiCount(TIvAnsiReader.Create, LocaleFileName);
    end;
  end
  else if FStorage = ivsEmbedded then
    Result := FLocaleCount
  else
  begin
{$IFDEF WIN32}
    case GetResourceFormat(LOCALE_RESOURCE_C) of
      ivtfUTF8:
        Result := GetWideCount(TIvResourceUTF8Reader.Create, LOCALE_RESOURCE_C);

      ivtfUTF16:
        Result := GetWideCount(TIvResourceUTF16Reader.Create, LOCALE_RESOURCE_C);
    else
      Result := GetAnsiCount(TIvResourceAnsiReader.Create, LOCALE_RESOURCE_C);
    end;
{$ENDIF}
  end;
end;

procedure TIvTextDictionary.GetLocaleData(index: Integer; locale: TIvLocale);

  procedure GetAnsiData(reader: TIvBaseAnsiReader; name: String);
  var
    i: Integer;
    parser: TIvAnsiParser;
  begin
    parser := TIvAnsiParser.Create;
    try
      reader.StorageName := name;
      reader.Open;

      for i := 0 to index do
        parser.Value := reader.ReadLine;

      GetLocale(parser, locale);
    finally
      reader.Free;
      parser.Free;
    end;
  end;

{$IFDEF WIN32}
  procedure GetWideData(reader: TIvBaseWideReader; name: String);
  var
    i: Integer;
    parser: TIvWideParser;
  begin
    parser := TIvWideParser.Create;
    try
      reader.StorageName := name;
      reader.Open;

      for i := 0 to index do
        parser.Value := reader.ReadLine;

      GetLocaleW(parser, locale);
    finally
      reader.Free;
      parser.Free;
    end;
  end;
{$ENDIF}

begin
  if IsDesignTime or (FStorage = ivsFile) then
  begin
{$IFNDEF WIN32}
    if LocaleFileName = '' then
      raise EIvMulti.Create('No locale file given');
{$ELSE}
    if LocaleFileName = '' then
      Exit;
{$ENDIF}

    if (LocaleFileName <> '') and not FileExists(LocaleFileName) then
      raise EIvMulti.Create('Locale file "' + LocaleFileName + '" not found');

    case GetFileFormat(LanguageFileName) of
      ivtfUTF8:
{$IFDEF IVWIDE}
        GetWideData(TIvUTF8Reader.Create, LocaleFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UTF8_SUPPORT_C);
{$ENDIF}

      ivtfUTF16:
{$IFDEF WIN32}
        GetWideData(TIvUTF16Reader.Create(FByteOrder, FByteOrderMark), LocaleFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UNICODE_SUPPORT_C);
{$ENDIF}
    else
      GetAnsiData(TIvAnsiReader.Create, LocaleFileName);
    end;
  end
  else if FStorage = ivsEmbedded then
{$IFDEF IVVB}
    VBEmbeddedGetLocaleData(index, locale, FAllLocales)
{$ELSE}
    TIvReader.GetLocaleData(Owner.ClassName, ClassName, Name, index, locale)
{$ENDIF}
  else
  begin
{$IFDEF WIN32}
    if not DoesResourceExist(LOCALE_RESOURCE_C) then
      Exit;

    case GetResourceFormat(LOCALE_RESOURCE_C) of
      ivtfUTF8:
        GetWideData(TIvResourceUTF8Reader.Create, LOCALE_RESOURCE_C);

      ivtfUTF16:
        GetWideData(TIvResourceUTF16Reader.Create, LOCALE_RESOURCE_C);
    else
      GetAnsiData(TIvResourceAnsiReader.Create, LOCALE_RESOURCE_C);
    end;
{$ENDIF}
  end;
end;

procedure TIvTextDictionary.GetLocaleDatas(list: TList);

  procedure GetAnsiDatas(reader: TIvBaseAnsiReader; name: String);
  var
    parser: TIvAnsiParser;
    locale: TIvLocale;
  begin
    parser := TIvAnsiParser.Create;
    try
      reader.StorageName := name;
      reader.Open;
      while not reader.Eof do
      begin
        locale := TIvLocale.Create;
        parser.Value := reader.ReadLine;
        GetLocale(parser, locale);
        list.Add(locale);
      end;
    finally
      reader.Free;
      parser.Free;
    end;
  end;

{$IFDEF WIN32}
  procedure GetWideDatas(reader: TIvBaseWideReader; name: String);
  var
    parser: TIvWideParser;
    locale: TIvLocale;
  begin
    parser := TIvWideParser.Create;
    try
      reader.StorageName := name;
      reader.Open;
      while not reader.Eof do
      begin
        locale := TIvLocale.Create;
        parser.Value := reader.ReadLine;
        GetLocaleW(parser, locale);
        list.Add(locale);
      end;
    finally
      reader.Free;
      parser.Free;
    end;
  end;
{$ENDIF}

begin
  if IsDesignTime or (FStorage = ivsFile) then
  begin
{$IFNDEF WIN32}
    if LocaleFileName = '' then
      raise EIvMulti.Create('No locale file given');
{$ELSE}
    if LocaleFileName = '' then
      Exit;
{$ENDIF}

    if (LocaleFileName <> '') and not FileExists(LocaleFileName) then
      raise EIvMulti.Create('Locale file "' + LocaleFileName + '" not found');

    case GetFileFormat(LanguageFileName) of
      ivtfUTF8:
{$IFDEF IVWIDE}
        GetWideDatas(TIvUTF8Reader.Create, LocaleFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UTF8_SUPPORT_C);
{$ENDIF}

      ivtfUTF16:
{$IFDEF WIN32}
        GetWideDatas(TIvUTF16Reader.Create(FByteOrder, FByteOrderMark), LocaleFileName);
{$ELSE}
        raise EIvMulti.Create(NO_UNICODE_SUPPORT_C);
{$ENDIF}
    else
      GetAnsiDatas(TIvAnsiReader.Create, LocaleFileName);
    end;
  end
  else if FStorage = ivsEmbedded then
  begin
    if FLocaleCount > 0 then
{$IFDEF IVVB}
      VBEmbeddedGetLocaleDatas(list, FAllLocales)
{$ELSE}
      TIvReader.GetLocaleDatas(Owner.ClassName, ClassName, Name, list)
{$ENDIF}
  end
  else
  begin
{$IFDEF WIN32}
    if not DoesResourceExist(LOCALE_RESOURCE_C) then
      Exit;

    case GetResourceFormat(LOCALE_RESOURCE_C) of
      ivtfUTF8:
        GetWideDatas(TIvResourceUTF8Reader.Create, LOCALE_RESOURCE_C);

      ivtfUTF16:
        GetWideDatas(TIvResourceUTF16Reader.Create, LOCALE_RESOURCE_C);
    else
      GetAnsiDatas(TIvResourceAnsiReader.Create, LOCALE_RESOURCE_C);
    end;
{$ENDIF}
  end;
end;

procedure TIvTextDictionary.LoadTranslation;

  procedure LoadAnsi(reader: TIvBaseAnsiReader; name: String);
  var
    i, j, count: Integer;
    str, current, superCurrent: String;
    parser: TIvAnsiParser;
    translation: TIvTranslation;
  begin
    parser := TIvAnsiParser.Create;
    try
      parser.Convert := Convert;
      i := 0;
      reader.StorageName := name;
      reader.Open;
      while not reader.Eof do
      begin
        parser.Value := reader.ReadLine;

        if i = 0 then
          FContextType := GetContextType(parser.Value, LanguageCount);
        Inc(i);

        translation := TIvTranslation.Create;
        translation.Str := parser.GetString;

        if ivctForm in FContextType then
          translation.Form := parser.GetString;

        if ivctComponent in FContextType then
          translation.Component := parser.GetString;

        if ActiveLanguage = 0 then
          translation.Current := translation.Str
        else
        begin
          current := '';
          superCurrent := '';
          count := MaxInteger(ActiveLanguage, SuperLanguage);
          for j := 1 to count do
          begin
            str := parser.GetString;
            if j = ActiveLanguage then
              current := str
            else if j = SuperLanguage then
              superCurrent := str;
          end;

          if current <> '' then
          begin
            translation.Current := current;
            translation.Match := ivtmNormal;
          end
          else if superCurrent <> '' then
          begin
            translation.Current := superCurrent;
            translation.Match := ivtmSuper;
          end
          else
            translation.Match := ivtmNone;
        end;

{$IFNDEF WIN32}
        parser.Value := nil;
{$ENDIF}

        FTranslations.Add(translation);
      end;
    finally
      reader.Free;
      parser.Free;
    end;
  end;

{$IFDEF WIN32}
  procedure LoadWide(reader: TIvBaseWideReader; name: String);
  var
    i, j, codePage, count: Integer;
    parser: TIvWideParser;
    current, superCurrent: String;
    translation: TIvTranslation;
  begin
    codePage := Languages[ActiveLanguage].CodePage;
    parser := TIvWideParser.Create;
    try
      parser.Convert := Convert;
      i := 0;
      reader.StorageName := name;
      reader.Open;
      while not reader.Eof do
      begin
        parser.Value := reader.ReadLine;

        if i = 0 then
          FContextType := GetContextTypeW(parser.Value, LanguageCount);
        Inc(i);

        translation := TIvTranslation.Create;
        translation.Str := parser.GetAnsiString;

        if ivctForm in FContextType then
          translation.Form := parser.GetAnsiString;

        if ivctComponent in FContextType then
          translation.Component := parser.GetAnsiString;

        if ActiveLanguage = 0 then
          translation.Current := translation.Str
        else
        begin
          current := '';
          superCurrent := '';
          count := MaxInteger(ActiveLanguage, SuperLanguage);
          for j := 1 to count do
          begin
            if j = ActiveLanguage then
              current := IvWStrToStr(parser.GetString, codePage)
            else if j = SuperLanguage then
              superCurrent := IvWStrToStr(parser.GetString, codePage)
            else
              parser.GetString;
          end;

          if current <> '' then
          begin
            translation.Current := current;
            translation.Match := ivtmNormal;
          end
          else if superCurrent <> '' then
          begin
            translation.Current := superCurrent;
            translation.Match := ivtmSuper;
          end
          else
            translation.Match := ivtmNone;
        end;

        if translation.Match = ivtmNone then
          translation.Free
        else
          FTranslations.Add(translation);
      end;
    finally
      reader.Free;
      parser.Free;
    end;
  end;
{$ENDIF}

begin
  ClearTranslations;

  if IsDesignTime or (FStorage = ivsFile) then
  begin
    if Filename = '' then
      raise EIvMulti.Create('No translation file given');

    if not FileExists(Filename) then
      raise EIvMulti.Create('Translation file "' + Filename + '" not found');

    case GetFileFormat(LanguageFileName) of
      ivtfUTF8:
{$IFDEF IVWIDE}
        LoadWide(TIvUTF8Reader.Create, Filename);
{$ELSE}
        raise EIvMulti.Create(NO_UTF8_SUPPORT_C);
{$ENDIF}

      ivtfUTF16:
{$IFDEF WIN32}
        LoadWide(TIvUTF16Reader.Create(FByteOrder, FByteOrderMark), Filename);
{$ELSE}
        raise EIvMulti.Create(NO_UNICODE_SUPPORT_C);
{$ENDIF}
    else
      LoadAnsi(TIvAnsiReader.Create, Filename);
    end;
  end
  else if FStorage = ivsEmbedded then
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
  end
  else
  begin
{$IFDEF WIN32}
    case GetResourceFormat(TRANSLATION_RESOURCE_C) of
      ivtfUTF8:
        LoadWide(TIvResourceUTF8Reader.Create, TRANSLATION_RESOURCE_C);

      ivtfUTF16:
        LoadWide(TIvResourceUTF16Reader.Create, TRANSLATION_RESOURCE_C);
    else
      LoadAnsi(TIvResourceAnsiReader.Create, TRANSLATION_RESOURCE_C);
    end;
{$ENDIF}
  end;

  Sort;
end;

class function TIvTextDictionary.GetLanguage(
  parser: TIvAnsiParser;
  language: TIvLanguage): Boolean;
var
  str: String;
begin
  Result := False;

  language.EnglishName := parser.GetString;
  language.NativeName := parser.GetString;
  language.Primary := parser.GetInteger;
  language.AllSubs := parser.GetString;
  language.DefaultSub := parser.GetInteger;
  language.FontName := parser.GetString;

  str := parser.GetString;
  if str <> '' then
    language.FontSize := StrToIntDef(str, 0)
  else
  begin
    language.FontSize := 0;
    Result := True;
  end;

  str := parser.GetString;
  if str <> '' then
    language.OptionsAsInt := StrToIntDef(str, 0)
  else
  begin
    language.OptionsAsInt := 0;
    Result := True;
  end;

  str := parser.GetString;
{$IFDEF WIN32}
  if str <> '' then
    language.Charset := StrToIntDef(str, 0)
  else
  begin
    language.Charset := 0;
    Result := True;
  end;
{$ENDIF}

  str := parser.GetString;
  if str <> '' then
    language.CodePage := StrToIntDef(str, 0)
  else
  begin
    language.CodePage := 0;
    Result := True;
  end;

  if not parser.Eol then
    language.ISOLanguage := parser.GetString
  else
    Result := True;

  if not parser.Eol then
    language.ISOAllCountries := parser.GetString
  else
    Result := True;

  if not parser.Eol then
    language.ISODefaultCountry := parser.GetString
  else
    Result := True;

  language.Init;
end;

class function TIvTextDictionary.GetLocale(
  parser: TIvAnsiParser;
  locale: TIvLocale): Boolean;
var
  j: Integer;
begin
  { The function returns True if the given data is in the old format }

  Result := False;

  locale.Primary := parser.GetInteger;
  locale.Sub := parser.GetInteger;
  parser.GetInteger; { Locale is not used }
  locale.EnglishLanguageName := parser.GetString;
  locale.NativeLanguageName := parser.GetString;
  locale.EnglishCountryName := parser.GetString;
  locale.NativeCountryName := parser.GetString;
  locale.CodePage := parser.GetInteger;

  locale.MeasurementSystem := TIvMeasurementSystem(parser.GetInteger);
  locale.CurrencyString := parser.GetString;
  locale.CurrencyFormat := TIvCurrencyFormat(parser.GetInteger);
  locale.NegCurrFormat := TIvNegativeCurrencyFormat(parser.GetInteger);
  locale.ThousandSeparator := parser.GetChar;
  locale.DecimalSeparator := parser.GetChar;
  locale.CurrencyDecimals := parser.GetInteger;

  locale.DateSeparator := parser.GetChar;
  locale.ShortDateFormat := parser.GetString;
  locale.LongDateFormat := parser.GetString;

  locale.TimeSeparator := parser.GetChar;
  locale.TimeAMString := parser.GetString;
  locale.TimePMString := parser.GetString;
  locale.TimeLeadingZeros := parser.GetBoolean;
  locale.TimeFormat := TIvTimeFormat(parser.GetInteger);

  locale.CalendarType := TIvCalendarType(parser.GetInteger);
  locale.OptionalCalendarType := TIvCalendarType(parser.GetInteger);
  locale.FirstDayOfWeek := TIvDayOfWeek(parser.GetInteger);
  locale.FirstWeekOfYear := TIvFirstWeekOfYear(parser.GetInteger);

  for j := 1 to 12 do
    locale.ShortMonthNames[j] := parser.GetString;

  for j := 1 to 12 do
    locale.LongMonthNames[j] := parser.GetString;

  for j := 1 to 7 do
    locale.ShortDayNames[j] := parser.GetString;

  for j := 1 to 7 do
    locale.LongDayNames[j] := parser.GetString;

  { The following items are new in ML 3.0 }

  if not parser.Eol then
    locale.Win16LanguageName := parser.GetString
  else
  begin
    locale.Win16LanguageName := '';
    Result := True;
  end;

  if not parser.Eol then
    locale.Win16CountryName := parser.GetString
  else
  begin
    locale.Win16CountryName := '';
    Result := True;
  end;

  if not parser.Eol then
    locale.TimeMarkPosition := TIvTimeMarkPosition(parser.GetInteger)
  else
  begin
    locale.TimeMarkPosition := ivtmSuffix;
    Result := True;
  end;

  if not parser.Eol then
    locale.ISOLanguage := parser.GetString
  else
  begin
    locale.ISOLanguage := '';
    Result := True;
  end;

  if not parser.Eol then
    locale.ISOCountry := parser.GetString
  else
  begin
    locale.ISOCountry := '';
    Result := True;
  end;

  if not parser.Eol then
    locale.IsCustom := parser.GetBoolean
  else
  begin
    locale.IsCustom := False;
    Result := True;
  end;

  { The following items are new in ML 4.0 }

{$IFDEF WIN32}
  if not parser.Eol then
    locale.Charset := parser.GetInteger
  else
  begin
    locale.Charset := 0;
    Result := True;
  end;
{$ENDIF}

  locale.Init;
end;

{$IFDEF WIN32}
class function TIvTextDictionary.GetLanguageW(
  parser: TIvWideParser;
  language: TIvLanguage): Boolean;
var
  str: String;
  nativeName: TIvWideString;
begin
  Result := False;

  language.EnglishName := parser.GetAnsiString;
  nativeName := parser.GetString;
  language.Primary := parser.GetInteger;
  language.AllSubs := parser.GetAnsiString;
  language.DefaultSub := parser.GetInteger;
  language.FontName := parser.GetAnsiString;

  str := parser.GetAnsiString;
  if str <> '' then
    language.FontSize := StrToIntDef(str, 0)
  else
  begin
    language.FontSize := 0;
    Result := True;
  end;

  str := parser.GetAnsiString;
  if str <> '' then
    language.OptionsAsInt := StrToIntDef(str, 0)
  else
  begin
    language.OptionsAsInt := 0;
    Result := True;
  end;

  str := parser.GetAnsiString;
  if str <> '' then
    language.Charset := StrToIntDef(str, 0)
  else
  begin
    language.Charset := 0;
    Result := True;
  end;

  str := parser.GetAnsiString;
  if str <> '' then
    language.CodePage := StrToIntDef(str, 0)
  else
  begin
    language.CodePage := 0;
    Result := True;
  end;

  language.NativeName := IvWStrToStr(nativeName, language.CodePage);

  if not parser.Eol then
    language.ISOLanguage := parser.GetAnsiString
  else
    Result := True;

  if not parser.Eol then
    language.ISOAllCountries := parser.GetAnsiString
  else
    Result := True;

  if not parser.Eol then
    language.ISODefaultCountry := parser.GetAnsiString
  else
    Result := True;

  language.Init;
end;

class function TIvTextDictionary.GetLocaleW(
  parser: TIvWideParser;
  locale: TIvLocale): Boolean;
var
  j: Integer;
  nativeLanguageNameW, nativeCountryNameW: TIvWideString;
begin
  { The function returns True if the given data is in the old format }

  Result := False;

  locale.Primary := parser.GetInteger;
  locale.Sub := parser.GetInteger;
  parser.GetInteger; { Locale is not used }
  locale.EnglishLanguageName := parser.GetAnsiString;
  nativeLanguageNameW := parser.GetString;
  locale.EnglishCountryName := parser.GetAnsiString;
  nativeCountryNameW := parser.GetString;
  locale.CodePage := parser.GetInteger;
  parser.CodePage := locale.CodePage;
  locale.NativeLanguageName := IvWStrToStr(nativeLanguageNameW, locale.CodePage);
  locale.NativeCountryName := IvWStrToStr(nativeCountryNameW, locale.CodePage);

  locale.MeasurementSystem := TIvMeasurementSystem(parser.GetInteger);
  locale.CurrencyString := parser.GetAnsiString;
  locale.CurrencyFormat := TIvCurrencyFormat(parser.GetInteger);
  locale.NegCurrFormat := TIvNegativeCurrencyFormat(parser.GetInteger);
  locale.ThousandSeparator := parser.GetAnsiChar;
  locale.DecimalSeparator := parser.GetAnsiChar;
  locale.CurrencyDecimals := parser.GetInteger;

  locale.DateSeparator := parser.GetAnsiChar;
  locale.ShortDateFormat := parser.GetAnsiString;
  locale.LongDateFormat := parser.GetAnsiString;

  locale.TimeSeparator := parser.GetAnsiChar;
  locale.TimeAMString := parser.GetAnsiString;
  locale.TimePMString := parser.GetAnsiString;
  locale.TimeLeadingZeros := parser.GetBoolean;
  locale.TimeFormat := TIvTimeFormat(parser.GetInteger);

  locale.CalendarType := TIvCalendarType(parser.GetInteger);
  locale.OptionalCalendarType := TIvCalendarType(parser.GetInteger);
  locale.FirstDayOfWeek := TIvDayOfWeek(parser.GetInteger);
  locale.FirstWeekOfYear := TIvFirstWeekOfYear(parser.GetInteger);

  for j := 1 to 12 do
    locale.ShortMonthNames[j] := parser.GetAnsiString;

  for j := 1 to 12 do
    locale.LongMonthNames[j] := parser.GetAnsiString;

  for j := 1 to 7 do
    locale.ShortDayNames[j] := parser.GetAnsiString;

  for j := 1 to 7 do
    locale.LongDayNames[j] := parser.GetAnsiString;

  { The following items are new in ML 3.0 }

  if not parser.Eol then
    locale.Win16LanguageName := parser.GetAnsiString
  else
  begin
    locale.Win16LanguageName := '';
    Result := True;
  end;

  if not parser.Eol then
    locale.Win16CountryName := parser.GetAnsiString
  else
  begin
    locale.Win16CountryName := '';
    Result := True;
  end;

  if not parser.Eol then
    locale.TimeMarkPosition := TIvTimeMarkPosition(parser.GetInteger)
  else
  begin
    locale.TimeMarkPosition := ivtmSuffix;
    Result := True;
  end;

  if not parser.Eol then
    locale.ISOLanguage := parser.GetAnsiString
  else
  begin
    locale.ISOLanguage := '';
    Result := True;
  end;

  if not parser.Eol then
    locale.ISOCountry := parser.GetAnsiString
  else
  begin
    locale.ISOCountry := '';
    Result := True;
  end;

  if not parser.Eol then
    locale.IsCustom := parser.GetBoolean
  else
  begin
    locale.IsCustom := False;
    Result := True;
  end;

  { The following items are new in ML 4.0 }

  if not parser.Eol then
    locale.Charset := parser.GetInteger
  else
  begin
    locale.Charset := 0;
    Result := True;
  end;

  locale.Init;
end;
{$ENDIF}

function IsUTF16File(const filename: String): Boolean;
var
  c: Char;
  f: TextFile;
begin
  Result := False;
  if not FileExists(filename) then
    Exit;

  AssignFile(f, filename);
  Reset(f);
  try
    if not Eof(f) then
    begin
      Read(f, c);
      if c = Chr($FF) then
      begin
        { Little endian }

        if not Eof(f) then
        begin
          Read(f, c);
          Result := c = Chr($FE);
        end;
      end
      else if c = Chr($FE) then
      begin
        { Big endian }

        if not Eof(f) then
        begin
          Read(f, c);
          Result := c = Chr($FF);
        end;
      end;
    end;
  finally
    Close(f);
  end;
end;

{$IFDEF WIN32}
function IsUTF16Resource(const resourceName: String): Boolean;
var
  resource: HRSRC;
  handle: HGLOBAL;
  buffer: PChar;
begin
  resource := FindResource(HInstance, PChar(resourceName), MULTILIZER_RES_TYPE_C);
  if resource = 0 then
    raise EInOutError.Create('Could not open the resource ' + resourceName);

  handle := LoadResource(HInstance, resource);
  if handle = 0 then
    raise EInOutError.Create('Could not open the resource ' + resourceName);

  Result := False;
  try
    buffer := LockResource(handle);
    Result :=
      ((buffer^ = Chr($FF)) and ((buffer + 1)^ = Chr($FE))) or
      ((buffer^ = Chr($FE)) and ((buffer + 1)^ = Chr($FF)));
  except
  end;
end;

function DoesResourceExist(const resourceName: String): Boolean;
begin
  Result := FindResource(HInstance, PChar(resourceName), MULTILIZER_RES_TYPE_C) <> 0;
end;
{$ENDIF}

end.

