unit IvDsMult;

{$I IVMULTI.INC}

interface

uses
  Windows, SysUtils, Classes,
  IvSocket, IvDictio, IvMLTP, IvCacDic, IvStrLst, IvWParser;

type
  TIvServerDictionary = class(TIvCachedDictionary)
  protected
    FCodePage: Integer;
    FRemoteDictionaryName: String;
    FUserName: String;
    FPassword: String;
    FTimeout: Integer;
    FSocket: TIvWinSocket;
    FStream: TIvWinSocketStream;
    FUserType: TIvUserType;

    function GetAddress: String;
    procedure SetAddress(const value: String);

    function GetPort: Integer;
    procedure SetPort( value: Integer);

    procedure SetRemoteDictionaryName(const value: String);

    function ReadReply(
      timeout: Integer;
      raiseException: Boolean;
      var reply: WideString): Integer;

    function Transaction(const msg: WideString): WideString;
    function TransactionEx(const msg: WideString; raiseException: Boolean; var reply: WideString): Integer;

    procedure LanguageChanged(languageChanged, localeChanged: Boolean); override;
    function GetRemoteTranslationCount: Integer; override;
    function GetRemoteLanguageCount: Integer; override;
    procedure GetRemoteLanguageData(index: Integer; language: TIvLanguage); override;
    function GetRemoteLocaleCount: Integer; override;
    procedure GetRemoteLocaleData(index: Integer; locale: TIvLocale); override;
    procedure GetRemoteTranslations(
      i: Integer;
      row: TIvStringList;
      context: TIvContext;
      languageCount: Integer;
      codePages: TList); override;
    function GetRemoteDictionaryDate: TDateTime; override;

  public
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;

    procedure Open; override;
    procedure Close; override;

    function TranslateString(
      const str: String;
      var translation: String): Boolean; override;

    function TranslateContextString(
      const str, form, component: String;
      var translation: String): Boolean; override;

    procedure Login;
    procedure Logout;

    function IsConnected: Boolean;

    function GetDictionaries(names, owners, descriptions: TStrings): Integer;

    class function ReadMessage(
      stream: TIvWinSocketStream;
      timeout: Integer): WideString;

    class procedure StringToLanguage(const str: WideString; language: TIvLanguage);
    class procedure StringToLocale(const str: WideString; locale: TIvLocale);

    class function GetLoginMessage(
      const userName, password: WideString;
      clientType: TIvClientType;
      clientOS: TIvOperatingSystem;
      const clientVersion: WideString): WideString;

    class procedure ParserToTranslation(
      parser: TIvWideParser;
      count: Integer;
      translation: TIvWideStringList;
      context: TIvContext;
      contextType: TIvContextType);

    property UserType: TIvUserType read FUserType;

  published
    property CodePage: Integer read FCodePage write FCodePage default DEFAULT_CODE_PAGE_C;
    property UserName: String read FUserName write FUserName;
    property Password: String read FPassword write FPassword;
    property RemoteDictionaryName: String read FRemoteDictionaryName write SetRemoteDictionaryName;
    property Address: String read GetAddress write SetAddress;
    property Port: Integer read GetPort write SetPort default DEFAULT_PORT_C;
    property Timeout: Integer read FTimeout write FTimeout default DEFAULT_TIMEOUT_C;
  end;

implementation

uses
  IvCommon, IvUTF8, IvMLDFil;

constructor TIvServerDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);

  FTimeout := DEFAULT_TIMEOUT_C;
  FCodePage := DEFAULT_CODE_PAGE_C;

  FSocket := TIvWinSocket.Create;
  FSocket.Port := DEFAULT_PORT_C;
  SetAddress('127.0.0.1');
end;

destructor TIvServerDictionary.Destroy;
begin
  Close;
  FSocket.Free;
  inherited Destroy;
end;

function TIvServerDictionary.GetAddress: String;
begin
  if FSocket.Host <> '' then
    Result := FSocket.Host
  else
    Result := FSocket.Address;
end;

procedure TIvServerDictionary.SetAddress(const value: String);
begin
  if value <> Address then
  begin
    if IvIsDNSAddress(value) then
    begin
      FSocket.Host := value;
      FSocket.Address := '';
    end
    else
    begin
      FSocket.Address := value;
      FSocket.Host := '';
    end;
  end;
end;

function TIvServerDictionary.GetPort: Integer;
begin
  Result := FSocket.Port;
end;

procedure TIvServerDictionary.SetPort( value: Integer);
begin
  if value <> Port then
  begin
    FSocket.Port := value;
  end;
end;

procedure TIvServerDictionary.SetRemoteDictionaryName(const value: String);
begin
  if value <> RemoteDictionaryName then
  begin
    FRemoteDictionaryName := value;
    if IsOpen then
      Open;
  end;
end;

class function TIvServerDictionary.ReadMessage(
  stream: TIvWinSocketStream;
  timeout: Integer): WideString;
const
  SEGMENT_C = 256;
var
  str, utf8: String;
  len, bytesRead: Integer;
begin
  utf8 := '';
  bytesRead := 0;
  repeat
    if stream.WaitForData(500) then
    begin
      SetLength(str, SEGMENT_C);
      bytesRead := stream.Read(str[1], SEGMENT_C);
      if bytesRead > 0 then
      begin
        SetLength(str, bytesRead);
        utf8 := utf8 + str;
      end;
    end;
  until (bytesRead < SEGMENT_C) or (str[SEGMENT_C] = Chr(0));

  // All MLTP messages are ended by the Chr(0) character. Removes this.

  len := Length(utf8);
  if (len > 0) and (utf8[len] = Chr(0)) then
    SetLength(utf8, len - 1);

  // Converts UTF-8 to WideString

  Result := UTF8ToWideString(utf8);
end;

function TIvServerDictionary.ReadReply(
  timeout: Integer;
  raiseException: Boolean;
  var reply: WideString): Integer;
var
  index: Integer;
begin
  Result := MLTP_ERROR_C;
  if FStream.WaitForData(timeout) then
  begin
    reply := ReadMessage(FStream, timeout);
    index := Pos(SEPARATOR_C, reply);
    if index > 0 then
    begin
      Result := StrToInt(Copy(reply, 1, index - 1));
      reply := Copy(reply, index + 1, Length(reply));
    end
    else
    begin
      Result := StrToInt(reply);
      reply := '';
    end;
  end
  else if raiseException then
    raise EIvMLTPError.CreateMsg(MLTP_TIMEOUT_C, '');
end;

function TIvServerDictionary.Transaction(const msg: WideString): WideString;
begin
  TransactionEx(msg, True, Result);
end;

function TIvServerDictionary.TransactionEx(
  const msg: WideString;
  raiseException: Boolean;
  var reply: WideString): Integer;
var
  utf8: String;
begin
  // Writes the message

  utf8 := WideStringToUTF8(msg);
  FStream.Write(utf8[1], Length(utf8) + 1);

  // Reads the reply

  Result := ReadReply(FTimeout, IsOpen, reply);
  if raiseException and (Result <> MLTP_OK_C) then
    raise EIvMLTPError.CreateMsg(Result, '');
end;

function TIvServerDictionary.GetRemoteDictionaryDate: TDateTime;
var
  reply: WideString;
  parser: TIvWideParser;
begin
  reply := Transaction(MLTP_GET_C + SEPARATOR_C + MLTP_DICTIONARYDATE_C);
  parser := TIvWideParser.CreateValue(reply, SEPARATOR_C);
  try
    Result := MLTPStringToDateTime(parser.GetString);
  finally
    parser.Free;
  end;
end;

function TIvServerDictionary.GetRemoteTranslationCount: Integer;
begin
  Result := StrToInt(Transaction(MLTP_GET_C + SEPARATOR_C + MLTP_TRANSLATIONCOUNT_C));
end;

procedure TIvServerDictionary.GetRemoteTranslations(
  i: Integer;
  row: TIvStringList;
  context: TIvContext;
  languageCount: Integer;
  codePages: TList);
var
  reply: WideString;
  parser: TIvWideParser;
  wideRow: TIvWideStringList;
begin
  row.Clear;
  reply := Transaction(MLTP_GET_C + SEPARATOR_C + MLTP_TRANSLATIONBYINDEX_C + SEPARATOR_C + IntToStr(i));
  wideRow := TIvWideStringList.Create;
  parser := TIvWideParser.CreateValue(reply, SEPARATOR_C);
  try
    ParserToTranslation(
      parser,
      languageCount,
      wideRow,
      context,
      ContextType);
    for i := 0 to wideRow.Count - 1 do
      row.Add(IvWStrToStr(wideRow[i], Integer(codePages[i])));
  finally
    parser.Free;
    wideRow.Free;
  end;
end;

function TIvServerDictionary.GetRemoteLanguageCount: Integer;
begin
  Result := StrToInt(Transaction(MLTP_GET_C + SEPARATOR_C + MLTP_LANGUAGECOUNT_C));
end;

procedure TIvServerDictionary.GetRemoteLanguageData(index: Integer; language: TIvLanguage);
begin
  StringToLanguage(
    Transaction(MLTP_GET_C + SEPARATOR_C + MLTP_LANGUAGEDATA_C + SEPARATOR_C + IntToStr(index)),
    language);
end;

function TIvServerDictionary.GetRemoteLocaleCount: Integer;
begin
  Result := StrToInt(Transaction(MLTP_GET_C + SEPARATOR_C + MLTP_LOCALECOUNT_C));
end;

procedure TIvServerDictionary.GetRemoteLocaleData(index: Integer; locale: TIvLocale);
begin
  StringToLocale(
    Transaction(MLTP_GET_C + SEPARATOR_C + MLTP_LOCALEDATA_C + SEPARATOR_C + IntToStr(index)),
    locale);
end;

function TIvServerDictionary.TranslateString(
  const str: String;
  var translation: String): Boolean;
var
  resultCode: Integer;
  reply: WideString;
begin
  if IsCacheEnabled then
    Result := inherited TranslateString(str, translation)
  else
  begin
    resultCode := TransactionEx(
      MLTP_TRANSLATE_C + SEPARATOR_C + str,
      False,
      reply);

    if resultCode = MLTP_OK_C then
    begin
      Result := reply[1] = '1';
      Delete(reply, 1, 2);
      translation := IvWStrToStr(reply, FCodePage)
    end
    else
      raise EIvMLTPError.CreateMsg(resultCode, 'Could not translate the string');
  end;
end;

function TIvServerDictionary.TranslateContextString(
  const str, form, component: String;
  var translation: String): Boolean;
var
  resultCode: Integer;
  reply: WideString;
begin
  if IsCacheEnabled then
    Result := inherited TranslateContextString(str, form, component, translation)
  else
  begin
    resultCode := TransactionEx(
      MLTP_CONTEXT_C + SEPARATOR_C + str + SEPARATOR_C + form + SEPARATOR_C + component,
      False,
      reply);

    if resultCode = MLTP_OK_C then
    begin
      Result := reply[1] = '1';
      Delete(reply, 1, 2);
      translation := IvWStrToStr(reply, FCodePage)
    end
    else
      raise EIvMLTPError.CreateMsg(resultCode, 'Could not translate the string');
  end;
end;

procedure TIvServerDictionary.LanguageChanged(languageChanged, localeChanged: Boolean);
begin
  if not IsCacheEnabled then
  begin
    Transaction(MLTP_SET_C + SEPARATOR_C + MLTP_LANGUAGE_C + SEPARATOR_C +
      IntToStr(FActiveLanguage) + SEPARATOR_C +
      IntToStr(FLanguageLocale) + SEPARATOR_C +
      '');
  end;

  inherited LanguageChanged(languageChanged, localeChanged);
  FCodePage := LanguageData.CodePage;
end;

class procedure TIvServerDictionary.StringToLanguage(
  const str: WideString;
  language: TIvLanguage);
var
  parser: TIvWideParser;
begin
  parser := TIvWideParser.CreateValue(str, SEPARATOR_C);
  try
    language.Primary := parser.GetInteger;
    language.AllSubs := parser.GetString;
    language.DefaultSub := parser.GetInteger;

    language.ISOLanguage := parser.GetString;
    language.ISOAllCountries := parser.GetString;
    language.ISODefaultCountry := parser.GetString;

    language.CodePage := parser.GetInteger;
    language.EnglishName := parser.GetString;
    language.NativeName := parser.GetString;
    language.FontName := parser.GetString;
    language.FontSize := parser.GetInteger;
    language.OptionsAsInt := parser.GetInteger;
    language.Charset := parser.GetInteger;

    language.Init;
  finally
    parser.Free;
  end;
end;

class procedure TIvServerDictionary.StringToLocale(
  const str: WideString;
  locale: TIvLocale);
var
  i: Integer;
  parser: TIvWideParser;
begin
  parser := TIvWideParser.CreateValue(str, SEPARATOR_C);
  try
    locale.Primary := parser.GetInteger;
    locale.Sub := parser.GetInteger;
    locale.ISOLanguage := parser.GetString;
    locale.ISOCountry := parser.GetString;
    locale.CodePage := parser.GetInteger;
    locale.IsCustom := parser.GetBoolean;

    locale.EnglishLanguageName := parser.GetString;
    locale.EnglishCountryName := parser.GetString;
    locale.NativeLanguageName := parser.GetString;
    locale.NativeCountryName := parser.GetString;
    locale.Win16LanguageName := parser.GetString;
    locale.Win16CountryName := parser.GetString;

    locale.MeasurementSystem := TIvMeasurementSystem(parser.GetInteger);
    locale.CurrencyString := parser.GetString;
    locale.CurrencyFormat := TIvCurrencyFormat(parser.GetInteger);
    locale.NegCurrFormat := TIvNegativeCurrencyFormat(parser.GetInteger);
    locale.CurrencyDecimals := parser.GetInteger;
    locale.ThousandSeparator := Char(parser.GetChar);
    locale.DecimalSeparator := Char(parser.GetChar);

    locale.DateSeparator := Char(parser.GetChar);
    locale.ShortDateFormat := parser.GetString;
    locale.LongDateFormat := parser.GetString;

    locale.TimeSeparator := Char(parser.GetChar);
    locale.TimeAMString := parser.GetString;
    locale.TimePMString := parser.GetString;
    locale.TimeLeadingZeros := parser.GetBoolean;
    locale.TimeFormat := TIvTimeFormat(parser.GetInteger);
    locale.TimeMarkPosition := TIvTimeMarkPosition(parser.GetInteger);

    locale.CalendarType := TIvCalendarType(parser.GetInteger);
    locale.OptionalCalendarType := TIvCalendarType(parser.GetInteger);
    locale.FirstDayOfWeek := TIvDayOfWeek(parser.GetInteger);
    locale.FirstWeekOfYear := TIvFirstWeekOfYear(parser.GetInteger);

    for i := 1 to 12 do
      locale.ShortMonthNames[i] := parser.GetString;
    for i := 1 to 12 do
      locale.LongMonthNames[i] := parser.GetString;
    for i := 1 to 7 do
      locale.ShortDayNames[i] := parser.GetString;
    for i := 1 to 7 do
      locale.LongDayNames[i] := parser.GetString;

    // MLTP 1.0

    locale.Charset := parser.GetIntegerDef(0);

    locale.Init;
  finally
    parser.Free;
  end;
end;

class function TIvServerDictionary.GetLoginMessage(
  const userName, password: WideString;
  clientType: TIvClientType;
  clientOS: TIvOperatingSystem;
  const clientVersion: WideString): WideString;
begin
  Result := MLTP_LOGIN_C + SEPARATOR_C +
    IntToStr(CURRENT_MLTP_VERSION_C) + SEPARATOR_C +
    userName + SEPARATOR_C +
    password + SEPARATOR_C +
    IntToStr(Integer(clientType)) + SEPARATOR_C +
    IntToStr(Integer(clientOS)) + SEPARATOR_C +
    clientVersion;
end;

procedure TIvServerDictionary.Login;
var
  clientType: TIvClientType;
  clientOS: TIvOperatingSystem;
  clientVersion: String;
begin
  if FSocket.Connected then
    Exit;

  // Opens the connection the dictionary server

  try
    FSocket.Open;
    FStream := TIvWinSocketStream.Create(FSocket, FTimeout);
  except
    raise EIvSocketError.Create('Could not make a connection to Dictionary Server at "' + Address + '"');
  end;

  clientOS := ivosWindows;
  clientVersion := '';
{$IFDEF IVVB}
  clientType := ivctVB;
{$ELSE}
  {$IFDEF VER90}
  clientType := ivctDelphi;
  clientVersion := '2';
  {$ELSE}
    {$IFDEF VER93}
  clientType := ivctCBuilder;
  clientVersion := '1';
    {$ELSE}
      {$IFDEF VER100}
  clientType := ivctDelphi;
  clientVersion := '3';
      {$ELSE}
        {$IFDEF VER110}
  clientType := ivctCBuilder;
  clientVersion := '3';
        {$ELSE}
          {$IFDEF VER120}
  clientType := ivctDelphi;
  clientVersion := '4';
          {$ELSE}
            {$IFDEF VER125}
  clientType := ivctCBuilder;
  clientVersion := '4';
            {$ELSE}
              {$IFDEF VER130}
  clientType := ivctDelphi;
  clientVersion := '5';
              {$ELSE}
  clientType := ivctCBuilder;
              {$ENDIF}
            {$ENDIF}
          {$ENDIF}
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

  // Sends the login message

  FUserType := TIvUserType(StrToInt(Transaction(GetLoginMessage(
    FUserName,
    FPassword,
    clientType,
    clientOS,
    clientVersion))));
end;

procedure TIvServerDictionary.Logout;
begin
  if IsConnected then
  begin
    Transaction(MLTP_LOGOUT_C);
    FSocket.Close;
    FStream.Free;
    FStream := nil;
  end;
end;

function TIvServerDictionary.IsConnected: Boolean;
begin
  Result := FSocket.Connected;
end;

procedure TIvServerDictionary.Open;
var
  parser: TIvWideParser;
begin
  if IsOpen then
    Exit;

  // Opens the dictionary

  Login;
  parser := TIvWideParser.CreateValue(
    Transaction(MLTP_OPEN_C + SEPARATOR_C + FRemoteDictionaryName),
    SEPARATOR_C);
  try
    FContextType := TIvContext.ContextCodeToType(TIvContextCode(parser.GetInteger));
  finally
    parser.Free;
  end;

  // If the datetime of the cached file is equal or greater than the remote
  // there is not need to load the remote dictionary

  if UseCache and IsUpdateAvailable then
    UpdateCache;

  // Closes the connection to Dictionary Server if the cache was succefully
  // enabled.

  if IsCacheEnabled then
    Logout;

  inherited Open;
end;

procedure TIvServerDictionary.Close;
begin
  if IsConnected then
    Transaction(MLTP_CLOSE_C);
  Logout;
  inherited Close;
end;

function TIvServerDictionary.GetDictionaries(names, owners, descriptions: TStrings): Integer;
var
  name, owner, description: String;
  parser: TIvWideParser;
begin
  Result := 0;
  parser := TIvWideParser.CreateValue(
    Transaction(MLTP_GET_C + SEPARATOR_C + MLTP_DICTIONARIES_C),
    SEPARATOR_C);
  while not parser.Eol do
  begin
    name := parser.GetString;
    if names <> nil then
      names.Add(name);

    name := parser.GetString;
    if owners <> nil then
      owners.Add(owner);

    name := parser.GetString;
    if descriptions <> nil then
      descriptions.Add(description);

    Inc(Result);
  end;
  parser.Free;
end;

class procedure TIvServerDictionary.ParserToTranslation(
  parser: TIvWideParser;
  count: Integer;
  translation: TIvWideStringList;
  context: TIvContext;
  contextType: TIvContextType);
var
  i: Integer;
begin
  for i := 0 to count - 1 do
  begin
    translation.Add(parser.GetString);
    if i = 0 then
    begin
      if ivctForm in contextType then
        context.Form := parser.getString;
      if ivctComponent in contextType then
        context.Component := parser.getString;
    end;
  end;
end;

end.
