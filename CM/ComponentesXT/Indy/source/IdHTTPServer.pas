unit IdHTTPServer;

interface

// RFC 2616 -

uses
  Classes,
  IdException,
  IdGlobal,
  SyncObjs,
  SysUtils,
  IdHeaderList,
  IdTCPServer,
  IdThread;

const
  Id_TId_HTTPServer_ParseParams = True;
  Id_TId_HTTPServer_SessionState = False;
  {This probably should be something else but I don't know what
  I have fixed a problem which was caused by a timeout of 0 so I am extremely
  suspecious of this}
  Id_TId_HTTPSessionTimeOut = 0;
  Id_TId_HTTPAutoStartSession = False;
  GFMaxAge = -1;
  GResponseNo = 200;
  GFContentLength = -1;
  GServerSoftware = gsIdProductName + '/' + gsIdVersion;
  GContentType = 'text/html';

type
  // Forwards
  TIdHTTPSession = Class;
  TIdHTTPSessionList = Class;
  // Events
  TOnSessionEndEvent = procedure(Sender: TIdHTTPSession) of object;
  TOnSessionStartEvent = procedure(Sender: TIdHTTPSession) of object;

  TIdHTTPSession = Class(TObject)
  protected
    FOwner: TIdHTTPSessionList;
    FSessionID: string;
    FLastTimeStamp: TDateTime;
    FRemoteHost: string;
    FContent: TStrings;
    FLock: TCriticalSection;
    procedure SetContent(const Value: TStrings);
    function GetContent: TStrings;
    function IsSessionStale: boolean; virtual;
    procedure DoSessionEnd; virtual;
  public
    procedure Lock;
    procedure Unlock;
    Constructor Create(AOwner: TIdHTTPSessionList); Virtual;
    Constructor CreateInitialized(AOwner: TIdHTTPSessionList; const SessionID, RemoteIP: string); Virtual;
    destructor Destroy; override;
    property SessionID: String read FSessionID;
    property LastTimeStamp: TDateTime read FLastTimeStamp;
    property RemoteHost: string read FRemoteHost;
    property Content: TStrings read GetContent write SetContent;
  end;

  TIdHTTPSessionList = Class(TObject)
  protected
    SessionList: TThreadList;
    FSessionTimeout: cardinal;
    FOnSessionEnd: TOnSessionEndEvent;
    FOnSessionStart: TOnSessionStartEvent;
    // remove a session from the session list. Called by the session on "Free"
    procedure RemoveSession(Session: TIdHTTPSession);
    // remove a session surgically when list already locked down (prevent deadlock)
    procedure RemoveSessionFromLockedList(index: Integer; lockedsessionlist: TList);
  public
    Constructor Create; Virtual;
    destructor destroy; override;
    procedure Clear; virtual;
    procedure PurgeStaleSessions(PurgeAll: Boolean = false);
    function CreateSession(const RemoteIP, SessionID: String): TIdHTTPSession;
    function GetSession(const SessionID, RemoteIP: string): TIdHTTPSession;
    property SessionTimeout: cardinal read FSessionTimeout write FSessionTimeout;
    property OnSessionEnd: TOnSessionEndEvent read FOnSessionEnd write FOnSessionEnd;
    property OnSessionStart: TOnSessionStartEvent read FOnSessionStart write FOnSessionStart;
  end;

  TIdCookie = Class(TCollectionItem)
  protected
    FSecure: Boolean;
    FComment: String;
    FDomain: string;
    FName: String;
    FPath: String;
    FValue: string;
    FMaxAge: Integer;
    function GetCookieText: String;
  public
    procedure AddAttribute(const Attribute, Value: String);
    procedure Assign(Source: TPersistent); override;
    constructor Create(Collection: TCollection); override;
  published
    property Name: String read FName write FName;
    property Value: string read FValue write FValue;
    property Domain: string read FDomain write FDomain;
    property Path: String read FPath write FPath;
    property Comment: String read FComment write FComment;
    property Secure: Boolean read FSecure write FSecure;
    property MaxAge: Integer read FMaxAge write FMaxAge default -1;
    property CookieText: String read GetCookieText;
  end;

  TIdCookieCollection = Class(TCollection)
  protected
    function GetCookie(const name: string): TIdCookie;
    function GetItem(Index: Integer): TIdCookie;
    procedure SetItem(Index: Integer; const Value: TIdCookie);
  public
    function Add: TIdCookie;
    constructor Create;
    procedure AddSrcCookie(const sCookie: string);
    function GetCookieIndex(FirstIndex: integer; const Name: string): Integer; virtual;
    property Cookie[const name: string]: TIdCookie read GetCookie;
    property Items[Index: Integer]: TIdCookie read GetItem write SetItem; Default;
  end;

  TIdHTTPRequestInfo = class(TObject)
  protected
    FSession: TIdHTTPSession;
    FRemoteIP: String;
    FHost: string;
    FDocument, FCommand, FVersion, FAuthUsername, FAuthPassword, FUnparsedParams: string;
    FAuthExists: Boolean;
    FHeaders : TIdHeaderList;
    FParams: TStrings;
    FCookies: TIdCookieCollection;
    procedure SetCookies(const Value: TIdCookieCollection);
    procedure SetHeaders(const AValue: TIdHeaderList);
    procedure SetParams(const AValue: TStrings);
    procedure DecodeAndSetParams(const AValue: String);
  public
    constructor Create;
    destructor Destroy; override;
    property Session: TIdHTTPSession read FSession;
    //
    property AuthExists: Boolean read FAuthExists write FAuthExists;
    property AuthPassword: string read FAuthPassword write FAuthPassword;
    property AuthUsername: string read FAuthUsername write FAuthUsername;
    property Command: string read FCommand;
    property Cookies: TIdCookieCollection read FCookies write SetCookies;
    property Document: string read FDocument;
    property Headers: TIdHeaderList read FHeaders write SetHeaders;
    property Params: TStrings read FParams write SetParams;
    property UnparsedParams: string read FUnparsedParams;
    property Version: string read FVersion;
    property Host: string read FHost;
    property RemoteIP: String read FRemoteIP;
  end;

  TIdHTTPResponseInfo = class(TObject)
  protected
    FSession: TIdHTTPSession;
    FServerSoftware, FAuthRealm, FResponseText, FContentType: string;
    FConnection: TIdTCPServerConnection;
    FHeaderHasBeenWritten: boolean;
    FResponseNo, FContentLength: integer;
    FCookies: TIdCookieCollection;
    FHeaders: TIdHeaderList;
    FContentStream: TStream;
    FContentText: string;
    //
    procedure SetCookies(const AValue: TIdCookieCollection);
    procedure SetHeaders(const AValue: TIdHeaderList);
    procedure SetResponseNo(const AValue: Integer);
  public
    constructor Create(AConnection: TIdTCPServerConnection);
    destructor Destroy; override;
    procedure Redirect(const AURL: string);
    procedure WriteHeader;
    procedure WriteContent;
    //
    property Session: TIdHTTPSession read FSession;
    property AuthRealm: string read FAuthRealm write FAuthRealm;
    property ContentStream: TStream read FContentStream write FContentStream;
    property ContentText: string read FContentText write FContentText;
    property Cookies: TIdCookieCollection read FCookies write SetCookies;
    property Headers: TIdHeaderList read FHeaders write SetHeaders;
    property HeaderHasBeenWritten: boolean read FHeaderHasBeenWritten;
    property ResponseNo: Integer read FResponseNo write SetResponseNo;
    property ResponseText: String read FResponseText write FResponseText;
    //
    property ContentLength: integer read FContentLength write FContentLength;
    property ContentType: string read FContentType write FContentType;
    property ServerSoftware: string read FServerSoftware write FServerSoftware;
  end;

  TIdHTTPGetEvent = procedure(AThread: TIdPeerThread;
   RequestInfo: TIdHTTPRequestInfo; ResponseInfo: TIdHTTPResponseInfo) of object;
  TIdHTTPOtherEvent = procedure(Thread: TIdPeerThread;
   const asCommand, asData, asVersion: string) of object;

  TIdHTTPServer = class(TIdTCPServer)
  protected
    FServerSoftware: String;
    FParseParams: boolean;
    FOnCommandGet: TIdHTTPGetEvent;
    FOnCommandOther: TIdHTTPOtherEvent;
    FSessionList: TIdHTTPSessionList;
    FSessionState: Boolean;
    FSessionTimeOut: Integer;
    FOnSessionEnd: TOnSessionEndEvent;
    FOnSessionStart: TOnSessionStartEvent;
    FAutoStartSession: boolean;
    FMIMETable: TIdMimeTable;
    FSessionCleanupThread: TIdThread;
    procedure SetActive(AValue: Boolean); override;
    procedure SetSessionState(const Value: Boolean);
    procedure CaptureHeader(AThread: TIdPeerThread; rsiDest: TIdHTTPRequestInfo); virtual;
    function GetSessionFromCookie(HTTPrequest: TIdHTTPRequestInfo; HTTPResponse: TIdHTTPResponseInfo): TIdHTTPSession;
  public
    function EndSession(const SessionName: string): boolean;
    property SessionList: TIdHTTPSessionList read FSessionList;
    property MIMETable: TIdMimeTable read FMIMETable;
    function CreateSession(HTTPResponse: TIdHTTPResponseInfo; HTTPRequest: TIdHTTPRequestInfo): TIdHTTPSession;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function DoExecute(AThread: TIdPeerThread): boolean; override;
    function ServeFile(AThread: TIdPeerThread; ResponseInfo: TIdHTTPResponseInfo; aFile: TFileName): cardinal; virtual;
  published
    property OnCommandGet: TIdHTTPGetEvent read FOnCommandGet write FOnCommandGet;
    property OnCommandOther: TIdHTTPOtherEvent read FOnCommandOther write FOnCommandOther;
    property ParseParams: boolean read FParseParams write FParseParams default Id_TId_HTTPServer_ParseParams;
    property ServerSoftware: string read FServerSoftware write FServerSoftware;
    property SessionState: Boolean read FSessionState write SetSessionState default Id_TId_HTTPServer_SessionState;
    property AutoStartSession: boolean read FAutoStartSession write FAutoStartSession default Id_TId_HTTPAutoStartSession;
    property SessionTimeOut: Integer read FSessionTimeOut write FSessionTimeOut default Id_TId_HTTPSessionTimeOut;
    property OnSessionStart: TOnSessionStartEvent read FOnSessionStart write FOnSessionStart;
    property OnSessionEnd: TOnSessionEndEvent read FOnSessionEnd write FOnSessionEnd;
    property DefaultPort default IdPORT_HTTP;
  end;
  EIdHTTPServerError = class(EIdException);
  EIdHTTPHeaderAlreadyWritten = class(EIdHTTPServerError);
  EIdHTTPErrorParsingCommand = class(EIdHTTPServerError);
  EIdHTTPUnsupportedAuthorisationScheme = class(EIdHTTPServerError);
  EIdHTTPCannotSwitchSessionStateWhenActive = class(EIdHTTPServerError);

implementation

uses
  IdCoder3To4, IdResourceStrings;

const
  SessionCapacity = 128;

type
  TIdHTTPSessionCleanerThread = Class(TIdThread)
  protected
    FSessionList: TIdHTTPSessionList;
  public
    constructor Create(SessionList: TIdHTTPSessionList); reintroduce;
    procedure AfterRun; override;
    procedure Run; override;
  end; // class

// Calculate the number of MS between two TimeStamps
function TimeStampInterval(StartStamp, EndStamp: TDateTime): integer;
var
  days: Integer;
  hour, min, s, ms: Word;
begin
  days := Trunc(EndStamp - StartStamp); // whole days
  DecodeTime(EndStamp - StartStamp, hour, min, s, ms);
  result := (((days * 24 + hour) * 60 + min) * 60 + s) * 1000 + ms;
end;

function GetRandomString(NumChar: cardinal): string;
const
  CharMap='qwertzuiopasdfghjklyxcvbnmQWERTZUIOPASDFGHJKLYXCVBNM1234567890';
var
  i: integer;
  MaxChar: cardinal;
begin
  randomize;
  MaxChar := length(CharMap) - 1;
  for i := 1 to NumChar do
  begin
    // Add one because CharMap is 1-based
    Result := result + CharMap[Random(maxChar) + 1];
  end;
end;


Function Base64Decode(const s: String): String;
var Coder: TIdBase64Decoder;
begin
  Coder := TIdBase64Decoder.Create(nil);
  try
    Coder.AddCRLF := False;
    Coder.UseEvent := False;
    Coder.Reset;
    Coder.CodeString(s);
    Result := Copy(Coder.CompletedInput, 3, MaxInt);
  finally
    FreeAndNil(Coder);
  end;
end;


{ TIdHTTPRequestInfo }

constructor TIdHTTPRequestInfo.Create;
begin
  inherited;
  FHeaders := TIdHeaderList.Create;
  FParams  := TStringList.Create;
  FCookies := TIdCookieCollection.Create;
end;

procedure TIdHTTPRequestInfo.DecodeAndSetParams(const AValue: String);
var
  p, p2: PChar;
  s: string;
begin
  // Convert special characters
  // ampersand '&' separates values
  Params.BeginUpdate; try
    Params.Clear;
    p := PChar(AValue);
    p2 := p;
    while (p2 <> nil) and (p2[0] <> #0) do begin
      p2 := StrScan(p, '&');
      if p2 = nil then begin
        p2 := StrEnd(p);
      end;
      SetString(s, p, p2 - p);
      Params.Add(URLDecode(s));
      p := p2 + 1;
    end;
  finally Params.EndUpdate; end;
end;

destructor TIdHTTPRequestInfo.Destroy;
begin
  FHeaders.Free;
  FParams.Free;
  FCookies.Free;
  inherited;
end;

procedure TIdHTTPRequestInfo.SetCookies(const Value: TIdCookieCollection);
begin
  FCookies.Assign(Value);
end;

procedure TIdHTTPRequestInfo.SetHeaders(const AValue: TIdHeaderList);
begin
  FHeaders.Assign(AValue);
end;

procedure TIdHTTPRequestInfo.SetParams(const AValue: TStrings);
begin
  FParams.Assign(AValue);
end;

{ TIdHTTPResponseInfo }

constructor TIdHTTPResponseInfo.Create(AConnection: TIdTCPServerConnection);
begin
  inherited Create;

  FContentLength := GFContentLength;
  FHeaders := TIdHeaderList.Create;
  {Some clients may not support folded lines}
  FHeaders.FoldLines := False;
  FCookies := TIdCookieCollection.Create;
  {TODO Specify version - add a class method dummy that calls version}
  ServerSoftware := GServerSoftware;
  ContentType := GContentType;

  FConnection := AConnection;
  ResponseNo := GResponseNo;
end;

destructor TIdHTTPResponseInfo.Destroy;
begin
  FHeaders.Free;
  FCookies.Free;
  if Assigned(ContentStream) then
    ContentStream.Free;
  inherited;
end;

procedure TIdHTTPResponseInfo.Redirect(const AURL: string);
begin
  ResponseNo := 302;
  Headers.Values['Location'] := AURL;
end;

procedure TIdHTTPResponseInfo.SetCookies(const AValue: TIdCookieCollection);
begin
  FCookies.Assign(AValue);
end;

procedure TIdHTTPResponseInfo.SetHeaders(const AValue: TIdHeaderList);
begin
  FHeaders.Assign(AValue);
end;

procedure TIdHTTPResponseInfo.SetResponseNo(const AValue: Integer);
begin
  FResponseNo := AValue;
  case FResponseNo of
    // 2XX: Success
    200: ResponseText := RSHTTPOK;
    201: ResponseText := RSHTTPCreated;
    202: ResponseText := RSHTTPAccepted;
    203: ResponseText := RSHTTPNonAuthoritativeInformation;
    204: ResponseText := RSHTTPNoContent;
    205: ResponseText := RSHTTPResetContent;
    206: ResponseText := RSHTTPPartialContent;
    // 3XX: Redirections
    301: ResponseText := RSHTTPMovedPermanently;
    302: ResponseText := RSHTTPMovedTemporarily;
    303: ResponseText := RSHTTPSeeOther;
    304: ResponseText := RSHTTPNotModified;
    305: ResponseText := RSHTTPUseProxy;
    // 4XX Client Errors
    400: ResponseText := RSHTTPBadRequest;
    401: ResponseText := RSHTTPUnauthorized;
    403: ResponseText := RSHTTPForbidden;
    404: ResponseText := RSHTTPNotFound;
    405: ResponseText := RSHTTPMethodeNotAllowed;
    406: ResponseText := RSHTTPNotAcceptable;
    407: ResponseText := RSHTTPProxyAuthenticationRequired;
    408: ResponseText := RSHTTPRequestTimeout;
    409: ResponseText := RSHTTPConflict;
    410: ResponseText := RSHTTPGone;
    411: ResponseText := RSHTTPLengthRequired;
    412: ResponseText := RSHTTPPreconditionFailed;
    413: ResponseText := RSHTTPRequestEntityToLong;
    414: ResponseText := RSHTTPRequestURITooLong;
    415: ResponseText := RSHTTPUnsupportedMediaType;
    // 5XX Server errors
    500: ResponseText := RSHTTPInternalServerError;
    501: ResponseText := RSHTTPNotImplemented;
    502: ResponseText := RSHTTPBadGateway;
    503: ResponseText := RSHTTPServiceUnavailable;
    504: ResponseText := RSHTTPGatewayTimeout;
    505: ResponseText := RSHTTPHTTPVersionNotSupported;
    else
      ResponseText := RSHTTPUnknownResponseCode;
  end;
end;

procedure TIdHTTPResponseInfo.WriteContent;
begin
  with FConnection do begin
    if Length(ContentText) > 0 then begin
      Write(ContentText);
      ContentText := '';
    end
    else if Assigned(ContentStream) then begin
      WriteStream(ContentStream, True);
    end else begin
      FConnection.WriteLn('<HTML><BODY><B>' + IntToStr(ResponseNo) + ' ' + ResponseText +
                          '</B></BODY></HTML>');
    end;
  end;
end;

procedure TIdHTTPResponseInfo.WriteHeader;
var
  i: Integer;
begin
  if HeaderHasBeenWritten then begin
    raise EIdHTTPHeaderAlreadyWritten.Create(RSHTTPHeaderAlreadyWritten);
  end;
  FHeaderHasBeenWritten := True;

  Headers.Values['Server'] := ServerSoftware;
  Headers.Values['Content-Type'] := ContentType;

  if ContentLength = -1 then begin
    if Length(ContentText) > 0 then begin
      ContentLength := Length(ContentText)
    end else if Assigned(ContentStream) then begin
      ContentLength := ContentStream.Size;
    end;
  end;
  if ContentLength > -1 then begin
    Headers.Values['Content-Length'] := IntToStr(ContentLength);
  end;

  if Length(AuthRealm) > 0 then begin
    ResponseNo := 401;
    Headers.Values['WWW-Authenticate'] := 'Basic realm="' + AuthRealm + '"';
  end;
  with FConnection do begin
    OpenWriteBuffer; try
      // Write HTTP status response
      WriteLn('HTTP/1.1 ' + IntToStr(ResponseNo) + ' ' + ResponseText);
      // Write cookies
      for i := 0 to Cookies.Count - 1 do begin
        WriteLn('Set-Cookie: ' + Cookies[i].CookieText);
      end;
      // Write headers
      for i := 0 to Headers.Count -1 do begin
        WriteLn(Headers[i]);
      end;
      // HTTP headers ends with a double CR+LF
      WriteLn;
    finally CloseWriteBuffer; end;
  end;
end;

{ TIdHTTPServer }

procedure TIdHTTPServer.CaptureHeader(AThread: TIdPeerThread; rsiDest: TIdHTTPRequestInfo);
var
  sDataLine: String;
begin
  rsiDest.FUnparsedParams := '';
  rsiDest.FHeaders.Clear;
  // While we are not receiving a double CR+LF sequence, read the headers
  repeat
    sDataLine := AThread.Connection.ReadLn;
    // Add line to the headers list.  Parsing is done by that object
    rsiDest.FHeaders.Add(sDataLine);
  until Length(Trim(sDataLine)) = 0;
end;

constructor TIdHTTPServer.Create(AOwner: TComponent);
begin
  inherited;
  FSessionState := Id_TId_HTTPServer_SessionState;
  DefaultPort := IdPORT_HTTP;
  ParseParams := Id_TId_HTTPServer_ParseParams;
  FSessionList := TIdHTTPSessionList.Create;
  FMIMETable := TIdMimeTable.Create(True);
  FSessionTimeOut := Id_TId_HTTPSessionTimeOut;
  FAutoStartSession := Id_TId_HTTPAutoStartSession;
end;

function TIdHTTPServer.CreateSession(HTTPResponse: TIdHTTPResponseInfo; HTTPRequest: TIdHTTPRequestInfo): TIdHTTPSession;
var
  SessionID: string;
begin
  if SessionState then begin
    SessionID := getRandomString(15);
    result := FSessionList.CreateSession(HTTPrequest.RemoteIP, SessionID);
    with HTTPResponse.Cookies.Add do
    begin
      Name := 'IDHTTPSESSIONID';
      Value := SessionID;
      Path := '/';
      MaxAge := SessionTimeOut div 1000;
    end;
    HTTPResponse.FSession := result;
    HTTPRequest.FSession := result;
  end else begin
    result := nil;
  end;
end;

destructor TIdHTTPServer.Destroy;
begin
  FreeAndNil(FMIMETable);
  FreeAndNil(FSessionList);
  inherited;
end;

function TIdHTTPServer.DoExecute(AThread: TIdPeerThread): boolean;
var
  i: integer;
  s, sInputLine, sCmd, sVersion,
  sProtocol, sHost, sPort, sPath, sDocument, sBookmark: String;
  LPostStream: TStringStream;
  RequestInfo: TIdHTTPRequestInfo;
  ResponseInfo: TIdHTTPResponseInfo;

  procedure ReadCookiesFromRequestHeader;
  var
    RawCookies: TStringList;
    i: Integer;
  begin
    RawCookies := TStringList.Create;
    try
      RequestInfo.Headers.Extract('cookie', RawCookies);
      for i := 0 to RawCookies.Count -1 do
      begin
        RequestInfo.Cookies.AddSrcCookie(RawCookies[i]);
      end;
    finally
      RawCookies.Free;
    end;
  end;

begin
  Result := True; try
    with AThread.Connection do begin
      sInputLine := ReadLn;
      i := idGlobal.RPos(' ', sInputLine, -1);
      if i = 0 then begin
        raise EIdHTTPErrorParsingCommand.Create(RSHTTPErrorParsingCommand);
      end;
      sVersion := Copy(sInputLine, i + 1, MaxInt);
      SetLength(sInputLine, i - 1);
      {TODO Check for 1.0 only at this point}
      sCmd := UpperCase(Fetch(sInputLine, ' '));

      // These essentially all "retrieve" so they are all "Get"s
      if ((sCmd = 'GET') or (sCmd = 'POST') or (sCmd = 'HEAD')) and Assigned(OnCommandGet)
       then begin
        RequestInfo := TIdHTTPRequestInfo.Create; try
          RequestInfo.FRemoteIP := AThread.Connection.Binding.PeerIP;
          RequestInfo.FCommand := sCmd;
          CaptureHeader(AThread, RequestInfo);

          // Grab Params so we can parse them
          // POSTed data - may exist with GETs also. With GETs, the action params from the
          // form element will be posted
          // TODO: Rune this is the area that needs fixed. I've hacked it for now.
          // Get data can exists with POSTs, but can POST data exist with GETs? If only the first,
          // the solution is easy. If both - need more investigation.
          i := StrToIntDef(RequestInfo.Headers.Values['Content-Length'], -1);
          LPostStream := TStringStream.Create(''); try
            if i > -1 then begin
              AThread.Connection.ReadStream(LPostStream, i);
            end else begin
              if sCmd = 'POST' then begin
                AThread.Connection.ReadStream(LPostStream, -1, True);
              end;
            end;
            RequestInfo.FUnparsedParams := LPostStream.DataString;
          finally LPostStream.Free; end;
          // GET data - may exist with POSTs also
          s := sInputLine;
          sInputLine := Fetch(s, '?');
          // glue together parameters passed in the URL and those
          //
          if Length(s) > 0 then begin
            if Length(RequestInfo.UnparsedParams) = 0 then begin
              RequestInfo.FUnparsedParams := s;
            end else begin
              RequestInfo.FUnparsedParams := RequestInfo.UnparsedParams + EOL + s;
            end;
          end;
          // Parse Params
          if ParseParams then begin
            RequestInfo.DecodeAndSetParams(RequestInfo.UnparsedParams);
          end;
          // Cookies
          ReadCookiesFromRequestHeader;
          // Host
          RequestInfo.FHost := RequestInfo.Headers.Values['host'];
          RequestInfo.FVersion := sVersion;
          // Parse the document input line
          if sInputLine = '*' then begin
            RequestInfo.FDocument := '*';
          end else begin
            ParseURI(sInputLine, sProtocol, sHost, sPath, sDocument, sPort, sBookmark);
            RequestInfo.FDocument := sPath + sDocument;
          end;
          // Try to fill the "host" parameter
          if (Length(sHost) > 0) and (Length(RequestInfo.FHost) = 0) then begin
            RequestInfo.FHost := sHost;
          end;

          s := RequestInfo.Headers.Values['Authorization'];
          RequestInfo.AuthExists := Length(s) > 0;
          if RequestInfo.AuthExists then begin
            if AnsiCompareText(Fetch(s, ' '), 'Basic') = 0 then begin
              s := Base64Decode(s);
              RequestInfo.AuthUsername := Fetch(s, ':');
              RequestInfo.AuthPassword := s;
            end else begin
              raise EIdHTTPUnsupportedAuthorisationScheme.Create(RSHTTPUnsupportedAuthorisationScheme);
            end;
          end;
          //
          ResponseInfo := TIdHTTPResponseInfo.Create(AThread.Connection); try
            // Session management
            GetSessionFromCookie(RequestInfo, ResponseInfo);
            // SG 05.07.99
            // Set the ServerSoftware string to what it's supposed to be.
            if Length(Trim(ServerSoftware)) > 0  then begin
              ResponseInfo.FServerSoftware := ServerSoftware;
            end;
            try
              OnCommandGet(AThread, RequestInfo, ResponseInfo);
            except
              on E: Exception do begin
                ResponseInfo.ResponseNo := 500;
                ResponseInfo.ContentText := E.Message;
              end;
            end;
            if not ResponseInfo.HeaderHasBeenWritten then begin
              ResponseInfo.WriteHeader;
            end;
            // Always check ContentText first
            if (Length(ResponseInfo.ContentText) > 0) or Assigned(ResponseInfo.ContentStream)
             then begin
              ResponseInfo.WriteContent;
            end;
          finally ResponseInfo.Free; end;
        finally RequestInfo.Free; end;
      end else begin
        if Assigned(OnCommandOther) then begin
          OnCommandOther(AThread, sCmd, sInputLine, sVersion);
        end;
      end;
    end;
  finally AThread.Connection.Disconnect; end;
end;

function TIdHTTPServer.EndSession(const SessionName: string): boolean;
var
  ASession: TIdHTTPSession;
begin
  ASession := SessionList.GetSession(SessionName, '');
  result := Assigned(ASession);
  if result then
  begin
    ASession.free;
  end;
end;

function TIdHTTPServer.GetSessionFromCookie(HTTPRequest: TIdHTTPRequestInfo; HTTPResponse: TIdHTTPResponseInfo): TIdHTTPSession;
var
  CurrentCookieIndex: Integer;
begin
  Result := nil;
  if SessionState then
  begin
    CurrentCookieIndex := HTTPRequest.Cookies.GetCookieIndex(0, 'IDHTTPSESSIONID');
    while (result = nil) and (CurrentCookieIndex >= 0) do
    begin
      Result := FSessionList.GetSession(HTTPRequest.Cookies.Items[CurrentCookieIndex].Value, HTTPrequest.RemoteIP);
      Inc(CurrentCookieIndex);
      CurrentCookieIndex := HTTPRequest.Cookies.GetCookieIndex(CurrentCookieIndex, 'IDHTTPSESSIONID');
    end;    { while }
    // check if a session was returned. If not and if AutoStartSession is set to
    // true, Create a new session
    if FAutoStartSession and (result = nil) then
    begin
      Result := CreateSession(HTTPResponse, HTTPrequest);
    end;
  end;
  HTTPRequest.FSession := result;
  HTTPResponse.FSession := result;
end;

function TIdHTTPServer.ServeFile(AThread: TIdPeerThread; ResponseInfo: TIdHTTPResponseInfo;
 AFile: TFileName): Cardinal;
begin
  if Length(ResponseInfo.ContentType) = 0 then begin
    ResponseInfo.ContentType := MIMETable.GetFileMIMEType(aFile);
  end;
  ResponseInfo.ContentLength := FileSizeByName(aFile);
  ResponseInfo.WriteHeader;
  //TODO: allow TransferFileEnabled function
  result := aThread.Connection.WriteFile(aFile);
end;

procedure TIdHTTPServer.SetActive(AValue: Boolean);
begin
  if (not (csdestroying in ComponentState)) then
  begin
    if AValue then
    begin
      // starting server
      // set the session timeout and options
      if FSessionTimeOut > 0 then
        FSessionList.FSessionTimeout := FSessionTimeOut
      else
        FSessionState := false;
      // Session events
      FSessionList.OnSessionStart := FOnSessionStart;
      FSessionList.OnSessionEnd := FOnSessionEnd;
      // If session handeling is enabled, create the housekeeper thread
      if SessionState then
        FSessionCleanupThread := TIdHTTPSessionCleanerThread.Create(FSessionList);
    end
    else
    begin
      // Stopping server
      // Boost the clear thread priority to give it a good chance to terminate
      if assigned(FSessionCleanupThread) then begin
        SetThreadPriority(FSessionCleanupThread, tpNormal);
        FSessionCleanupThread.TerminateAndWaitFor;
      end;
      FSessionCleanupThread := nil;
      FSessionList.Clear;
    end;
  end;
  inherited;
end;

procedure TIdHTTPServer.SetSessionState(const Value: Boolean);
begin
  // ToDo: Add thread multiwrite protection here
  if (not ((csDesigning in ComponentState) or (csLoading in ComponentState))) and Active then
    raise EIdHTTPCannotSwitchSessionStateWhenActive.create(RSHTTPCannotSwitchSessionStateWhenActive);
  FSessionState := Value;
end;

{ TIdCookie }

procedure TIdCookie.AddAttribute(const Attribute, Value: String);
begin
  if UpperCase(Attribute) = '$PATH' then
    Path := Value;
  if UpperCase(Attribute) = '$DOMAIN' then
    Domain := Value;
end;

procedure TIdCookie.Assign(Source: TPersistent);
begin
  if Source is TIdCookie then begin
    with TIdCookie(Source) do
    begin
      Self.FName := Name;
      Self.FValue := Value;
      Self.FDomain := Domain;
      Self.FComment := Comment;
      Self.FPath := Path;
      Self.FMaxAge := MaxAge;
      Self.FSecure := Secure;
    end;
  end
  else begin
    inherited;
  end;
end;

constructor TIdCookie.Create(Collection: TCollection);
begin
  inherited;
  FMaxAge := GFMaxAge;
end;

function TIdCookie.GetCookieText: String;
  Procedure AddToken(const aToken, aValue: string);
  begin
    if result <> '' then
      result := result + '; ';
    result := result + aToken + '=' + aValue; //AnsiQuotedStr(aValue, '"');
  end;
begin
  result := '';
  AddToken(Name, Value);
  if Domain <> '' then
    AddToken('Domain', Domain);
  AddToken('Version', '"1"');
  if Path <> '' then
    AddToken('Path', Path);
  if MaxAge > -1 then
    AddToken('Max-Age', IntToStr(MaxAge));
  if Comment <> '' then
    AddToken('Comment', Comment);
  if Secure then Result := Result + '; Secure';
end;

{ TIdCookieCollection }

function TIdCookieCollection.Add: TIdCookie;
begin
  Result := TIdCookie(inherited Add);
end;

procedure TIdCookieCollection.AddSrcCookie(const sCookie: string);
var
  NewCookie: TIdCookie;
  TokenPos: Integer;
  P, P2: PChar;
  sName, sValue: String;
begin
  NewCookie := nil;
  P := PChar(sCookie);
  while (P <> nil) and (P[0] <> #0) do
  begin
    TokenPos := IndyPos('=', P);
    if TokenPos = 0 then
      Break;
    sName := Trim(Copy(P, 1, TokenPos - 1));
    P := PChar(P) + TokenPos;
    if P[0] = '"' then
      sValue := AnsiExtractQuotedStr(P, '"')
    else
    begin
      P2 := StrScan(P, ';');
      if Assigned(P2) then begin
        SetLength(sValue, P2-P);
        StrLCopy(PChar(sValue), P, P2-P);
        P := P2;
      end
      else
        sValue := P;
    end;
    if (sName[1] = '$') and Assigned(NewCookie) then
      NewCookie.AddAttribute(sName, sValue)
    else
    begin
      NewCookie := (Self.Add as TIdCookie);
      NewCookie.Name := sName;
      NewCookie.Value := sValue;
    end;
    P := StrScan(P, ';');
    if Assigned(P) then
      inc(P);
  end;
end;

constructor TIdCookieCollection.Create;
begin
  inherited Create(TIdCookie);
end;

function TIdCookieCollection.GetCookie(const name: string): TIdCookie;
var
  i: Integer;
begin
  i := GetCookieIndex(0, name);
  if i = -1 then
    result := nil
  else
    result := Items[i];
end;

function TIdCookieCollection.GetCookieIndex(FirstIndex: integer; const Name: string): Integer;
var
  i: Integer;
  CurrentCookie: TIdCookie;
begin
  result := -1;
  for i := FirstIndex to Count - 1 do
  begin
    CurrentCookie := Items[i];
    if AnsiSameText(CurrentCookie.Name, name) then
    begin
      result := i;
      break;
    end;
  end;
end;

function TIdCookieCollection.GetItem(Index: Integer): TIdCookie;
begin
  result := (inherited Items[Index]) as TIdCookie;
end;

procedure TIdCookieCollection.SetItem(Index: Integer; const Value: TIdCookie);
begin
  inherited Items[Index] := Value;
end;

{ TIdHTTPSessionList }

procedure TIdHTTPSessionList.Clear;
var
  ASessionList: TList;
  i: Integer;
begin
  ASessionList := SessionList.LockList;
  try
    for i := ASessionList.Count - 1 DownTo 0 do
      if ASessionList[i] <> nil then
      begin
        TIdHTTPSession(ASessionList[i]).DoSessionEnd;
        TIdHTTPSession(ASessionList[i]).FOwner := nil;
        TIdHTTPSession(ASessionList[i]).Free;
      end;
    ASessionList.Clear;
    ASessionList.Capacity := SessionCapacity;
  finally
    SessionList.UnlockList;
  end;
end;

constructor TIdHTTPSessionList.Create;
begin
  SessionList := TThreadList.Create;
  SessionList.LockList.Capacity := SessionCapacity;
  SessionList.UnlockList;
end;

function TIdHTTPSessionList.CreateSession(const RemoteIP, SessionID: String): TIdHTTPSession;
begin
  result := TIdHTTPSession.CreateInitialized(Self, SessionID, RemoteIP);
  SessionList.Add(result);
end;

destructor TIdHTTPSessionList.destroy;
begin
  Clear;
  SessionList.free;
  inherited;
end;

function TIdHTTPSessionList.GetSession(const SessionID, RemoteIP: string): TIdHTTPSession;
var
  ASessionList: TList;
  i: Integer;
begin
  Result := nil;
  ASessionList := SessionList.LockList;
  try
    // get current time stamp
    for i := 0 to ASessionList.Count - 1 do
    begin
      Result := TIdHTTPSession(ASessionList[i]);
      Assert(Result <> nil);
      if not Result.IsSessionStale then
      begin
        if AnsiSameText(Result.FSessionID, SessionID) and ((length(RemoteIP) = 0) or AnsiSameText(Result.RemoteHost, RemoteIP)) then
        begin
          // Session found
          Result.FLastTimeStamp := Now;
          break;
        end;
      end
      else
      begin
        RemoveSessionFromLockedList(i, ASessionList)
      end;
      Result := nil;
    end;
  finally
    SessionList.UnlockList;
  end;
end;

procedure TIdHTTPSessionList.PurgeStaleSessions(PurgeAll: Boolean = false);
var
  i: Integer;
  aSessionList: TList;
begin
  // S.G. 24/11/00: Added a way to force a session purge (Used when thread is terminated)
  // Get necessary data
  aSessionList := SessionList.LockList;
  try
    // Loop though the sessions.
    for i := aSessionList.Count-1 downto 0 do
    begin
      // Identify the stale sessions
      if Assigned(ASessionList[i]) and
         (PurgeAll or TIdHTTPSession(aSessionList[i]).IsSessionStale) then
      begin
        RemoveSessionFromLockedList(i, aSessionList);
      end;
    end;
  finally
    SessionList.UnlockList;
  end;
end;

procedure TIdHTTPSessionList.RemoveSession(Session: TIdHTTPSession);
var
  ASessionList: TList;
  Index: integer;
begin
  ASessionList := SessionList.LockList;
  try
    Index := ASessionList.IndexOf(TObject(Session));
    if index > -1 then
    begin
      ASessionList.Delete(index);
    end;
  finally
    SessionList.UnlockList;
  end;
end;

procedure TIdHTTPSessionList.RemoveSessionFromLockedList(index: Integer;
  lockedsessionlist: TList);
begin
  TIdHTTPSession(lockedsessionlist[index]).DoSessionEnd;
  // must set the owner to nil or the session will try to remove itself from the
  // session list and deadlock
  TIdHTTPSession(lockedsessionlist[index]).FOwner := nil;
  TIdHTTPSession(lockedsessionlist[index]).Free;
  lockedsessionlist.Delete(index);
end;

{ TIdHTTPSession }

constructor TIdHTTPSession.Create(AOwner: TIdHTTPSessionList);
begin
  FLock := TCriticalSection.Create;
  FContent := TStringList.Create;
  FOwner := AOwner;
  if assigned( AOwner ) then
  begin
    if assigned(AOwner.OnSessionStart) then
    begin
      AOwner.OnSessionStart(self);
    end;
  end;
end;

constructor TIdHTTPSession.CreateInitialized(AOwner: TIdHTTPSessionList; const SessionID, RemoteIP: string);
begin
  FSessionID := SessionID;
  FRemoteHost := RemoteIP;
  FLastTimeStamp := Now;
  FLock := TCriticalSection.Create;
  FContent := TStringList.Create;
  FOwner := AOwner;
  if assigned( AOwner ) then
  begin
    if assigned(AOwner.OnSessionStart) then
    begin
      AOwner.OnSessionStart(self);
    end;
  end;
end;

destructor TIdHTTPSession.Destroy;
begin
// code added here should also be reflected in
// the TIdHTTPSessionList.RemoveSessionFromLockedList method
  DoSessionEnd;
  FContent.Free;
  FLock.Free;
  if assigned(FOwner) then
    FOwner.RemoveSession(self);
  inherited;
end;

procedure TIdHTTPSession.DoSessionEnd;
begin
  if assigned(FOwner) and assigned(FOwner.FOnSessionEnd) then
    FOwner.FOnSessionEnd(self);
end;

function TIdHTTPSession.GetContent: TStrings;
begin
  result := FContent;
end;

function TIdHTTPSession.IsSessionStale: boolean;
begin
  result := TimeStampInterval(FLastTimeStamp, Now) > Integer(FOwner.SessionTimeout);
end;

procedure TIdHTTPSession.Lock;
begin
  // ToDo: Add session locking code here
  FLock.Enter;
end;

procedure TIdHTTPSession.SetContent(const Value: TStrings);
begin
  FContent.Assign(Value);
end;

procedure TIdHTTPSession.Unlock;
begin
  // ToDo: Add session unlocking code here
  FLock.Leave;
end;

{ TIdHTTPSessionClearThread }

procedure TIdHTTPSessionCleanerThread.AfterRun;
begin
  FSessionList.PurgeStaleSessions(true);
  inherited;
end;

constructor TIdHTTPSessionCleanerThread.Create(SessionList: TIdHTTPSessionList);
begin
  SetThreadPriority(Self, tpIdle); // Set priority to the lowest possible
  FSessionList := SessionList;
  FreeOnTerminate := True;
  inherited create(false);
end;

procedure TIdHTTPSessionCleanerThread.Run;
begin
  Sleep(1000);
  FSessionList.PurgeStaleSessions(Terminated);
end;

end.
