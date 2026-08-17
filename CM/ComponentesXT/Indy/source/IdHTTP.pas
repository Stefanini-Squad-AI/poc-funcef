unit IdHTTP;

{

  Implementation of the HTTP protcol as specified in RFC 2616.
  (See NOTE below for details of what is exactly implemented)

  Author: Hadi Hariri (hadi@urusoft.com)
  Copyright: (c) Chad Z. Hower and The Winshoes Working Group.

NOTE:
  Initially only GET and POST will be supported. As time goes on more will
  be added. For other developers, please add the date and what you have done
  below.

Initials: Hadi Hariri - HH

Details of implementation
-------------------------

2000-Jul-25 Hadi Hariri
 - Overloaded POst and moved clearing to disconect.
2000-June-22 Hadi Hariri
  - Added Proxy support.
2000-June-10 Hadi Hariri
  - Added Chunk-Encoding support and HTTP version number. Some additional
    improvements.
2000-May-23 J. Peter Mugaas
  -added redirect capability and supporting properties.  Redirect is optional
   and is set with HandleRedirects.  Redirection is limited to RedirectMaximum
   to prevent stack overflow due to recursion and to prevent redirects between
   two places which would cause this to go on to infinity.
2000-May-22 J. Peter Mugaas
  -adjusted code for servers which returned LF instead of EOL
  -Headers are now retreived before an exception is raised.  This
   also facilitates server redirection where the server tells the client to
   get a document from another location.
2000-May-01 Hadi Hariri
  -Converted to Mercury
2000-May-01 Hadi Hariri
  -Added PostFromStream and some clean up
2000-Apr-10 Hadi Hariri
  -Re-done quite a few things and fixed GET bugs and finished POST method.
2000-Jan-13 MTL
  -Moved to the New Palette Scheme
2000-Jan-08 MTL
  -Cleaned up a few compiler hints during 7.038 build
1999-Dec-10 Hadi Hariri
  -Started.
}

interface

uses
  Classes,
  IdGlobal,
  IdHeaderList,
  IdSSLIntercept,
  IdTCPClient;

type
  TIdHTTPMethod = (hmHead, hmGet, hmPost);
  TIdHTTPProtocolVersion = (pv1_0, pv1_1);

  TIdHTTPOnRedirectEvent = procedure(Sender: TObject; var dest: String; var NumRedirect: Integer; var Handled: boolean) of object;
const
  Id_TIdHTTP_ProtocolVersion = pv1_1;
  Id_TIdHTTP_RedirectMax = 15;
  Id_TIdHTTP_HandleRedirects = False;
type
  TIdHeaderInfo = class(TPersistent)
  protected
    FAccept: string;
    FAcceptCharSet: string;
    FAcceptEncoding: string;
    FAcceptLanguage: string;
    FComponent: TComponent;
    FConnection: string;
    FContentEncoding: string;
    FContentLanguage: string;
    FContentLength: Integer;
    FContentRangeEnd: Cardinal;
    FContentRangeStart: Cardinal;
    FContentType: string;
    FContentVersion: string;
    FDate: TDateTime;
    FExpires: TDateTime;
    FExtraHeaders: TIdHeaderList;
    FFrom: string;
    FLastModified: TDateTime;
    FLocation: string;
    FPassword: string;
    FProxyAuthenticate: string;
    FProxyPassword: string;
    FProxyPort: Integer;
    FProxyServer: string;
    FProxyUsername: string;
    FReferer: string;
    FServer: string;
    FUserAgent: string;
    FUserName: string;
    FWWWAuthenticate: string;
    //
    procedure AssignTo(Destination: TPersistent); override;
    procedure GetHeaders(Headers: TIdHeaderList);
    procedure SetHeaders(var Headers: TIdHeaderList);
    procedure SetExtraHeaders(const Value: TIdHeaderList);
  public
    procedure Clear;
    constructor Create(Component: TComponent); virtual;
    destructor Destroy;override;
  published
    property Accept: string read FAccept write FAccept;
    property AcceptCharSet: string read FAcceptCharSet write FAcceptCharSet;
    property AcceptEncoding: string read FAcceptEncoding write FAcceptEncoding;
    property AcceptLanguage: string read FAcceptLanguage write FAcceptLanguage;
    property Connection: string read FConnection write FConnection;
    property ContentEncoding: string read FContentEncoding write FContentEncoding;
    property ContentLanguage: string read FContentLanguage write FContentLanguage;
    property ContentLength: Integer read FContentLength write FContentLength;
    property ContentRangeEnd: Cardinal read FContentRangeEnd write FContentRangeEnd;
    property ContentRangeStart: Cardinal read FContentRangeStart write FContentRangeStart;
    property ContentType: string read FContentType write FContentType;
    property ContentVersion: string read FContentVersion write FContentVersion;
    property Date: TDateTime read FDate write FDate;
    property Expires: TDateTime read FExpires write FExpires;
    property ExtraHeaders: TIdHeaderList read FExtraHeaders write SetExtraHeaders;
    property From: string read FFrom write FFrom ;
    property LastModified: TDateTime read FLastModified write FLastModified;
    property Location: string read FLocation write FLocation;
    property Password:string read FPassword write FPassword;
    property ProxyAuthenticate: string read FProxyAuthenticate write FProxyAuthenticate;
    property ProxyPassword: string read FProxyPassword write FProxyPassword;
    property ProxyPort: Integer read FProxyPort write FProxyPort;
    property ProxyServer: string read FProxyServer write FProxyServer;
    property ProxyUsername: string read FProxyUsername write FProxyUsername;
    property Referer: string read FReferer write FReferer;
    property Server: string read FServer write FServer;
    property UserAgent: string read FUserAgent write FUserAgent;
    property Username:string read FUsername write FUsername;
    property WWWAuthenticate: string read FWWWAuthenticate write FWWWAuthenticate;
  end;

  TIdHTTP = class(TIdTCPClient)
  protected
    FInternalHeaders: TIdHeaderList;
    FProtocolVersion: TIdHTTPProtocolVersion;
    FRedirectCount: Integer;
    FRedirectMax: Integer;
    FRequest: TIdHeaderInfo;
    FResponse: TIdHeaderInfo;
    FResponseCode: Integer;
    FResponseText: string;
    FHandleRedirects : Boolean;
    FTunnelProxyHost: string;
    FTunnelProxyPort: Integer;
    FTunnelProxyProtocol: string;


    {this is an internal counter for redirercts}
    //
    FOnRedirect: TIdHTTPOnRedirectEvent;
    //
    function DoOnRedirect(var Location: String; RedirectCount: integer): boolean; virtual;
    procedure RetrieveHeaders;
    procedure DoProxyConnectMethod(ASender: TObject);
  public
    HostHeader: string;
    ProtoHeader: string;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoRequest(const AMethod: TIdHTTPMethod; AURL: string;
      const ASource: TObject; const AResponseContent: TStream); virtual;
    procedure Get(AURL: string; const AResponseContent: TStream); overload;
    function Get(AURL: string): string; overload;
    procedure Head(URL: string);
    procedure Post(URL:string; const Source: TStrings; const AResponseContent:TStream);
      overload;
    {Post data provided by a stream, this is for submitting data to a server}
    procedure Post(URL: string; const Source, AResponseContent: TStream);
      overload;
    //
    {This is the response code number such as 404 for File not Found}
    property ResponseCode: Integer read FResponseCode;
    {This is the text of the message such as "404 File Not Found here Sorry"}
    property ResponseText: string read FResponseText;
    property Response: TIdHeaderInfo read FResponse;
  published
    {Do we handle redirect requests or simply raise an exception and let the
     developer deal with it}
    property HandleRedirects : Boolean read FHandleRedirects
      write FHandleRedirects default Id_TIdHTTP_HandleRedirects;
    {This is the maximum number of redirects we wish to handle, we limit this
     to prevent stack overflow due to recursion.  Recursion is safe ONLY if
     prevented for continuing to infinity}
    property ProtocolVersion: TIdHTTPProtocolVersion read FProtocolVersion write FProtocolVersion Default Id_TIdHTTP_ProtocolVersion;
    property RedirectMaximum: Integer read FRedirectMax write FRedirectMax default Id_TIdHTTP_RedirectMax;
    property Request: TIdHeaderInfo read FRequest write FRequest;
    // Fired when a rediretion is requested.
    property OnRedirect: TIdHTTPOnRedirectEvent read FOnRedirect write FOnRedirect;
    property Port default IdPORT_HTTP;
  end;

implementation

uses
  IdCoder3To4,
  IdComponent,
  IdTCPConnection,
  IdException,
  IdResourceStrings,
  SysUtils;

const
  DefaultUserAgent = 'Mozilla/3.0 (compatible; Indy Library)'; {do not localize}
  ProtocolVersionString: array[TIdHTTPProtocolVersion] of string = ('1.0', '1.1');

{ TIdHeaderInfo }

procedure TIdHeaderInfo.AssignTo(Destination: TPersistent);
begin
  if Destination is TIdHeaderInfo then
  begin
    with Destination as TIdHeaderInfo do
    begin
      FAccept := Self.FAccept;
      FAcceptCharSet := Self.FAcceptCharset;
      FAcceptEncoding := Self.FAcceptEncoding;
      FAcceptLanguage := Self.FAcceptLanguage;
      FContentEncoding := Self.FContentEncoding;
      FContentLanguage := Self.FContentLanguage;
      FContentLength := Self.FContentLength;
      FContentRangeEnd:= Self.FContentRangeEnd;
      FContentRangeStart:= Self.FContentRangeStart;
      FContentType := Self.FContentType;
      FContentVersion := Self.FContentVersion;
      FDate := Self.FDate;
      FExpires := Self.FExpires;
      FExtraHeaders.Assign(Self.FExtraHeaders);
      FFrom := Self.FFrom;
      FLastModified := Self.FLastModified;
      FLocation := Self.FLocation;
      FPassword := Self.FPassword;
      FProxyPassword := Self.FProxyPassword;
      FProxyPort := Self.FProxyPort;
      FProxyServer := Self.FProxyServer;
      FProxyUsername := Self.FProxyUsername;
      FReferer := Self.FReferer;
      FServer := Self.FServer;
      FUserAgent := Self.FUserAgent;
      FUsername := Self.FUsername;
      FWWWAuthenticate := Self.FWWWAuthenticate;
      FProxyAuthenticate := Self.FProxyAuthenticate;
    end;
  end
  else
  inherited AssignTo(Destination);
end;

procedure TIdHeaderInfo.Clear;
begin
  FAccept := 'text/html, */*'; {do not localize}
  FAcceptCharSet := '';
  FLocation := '';
  FServer := '';
  FConnection := '';
  FContentVersion := '';
  FWWWAuthenticate := '';
  FContentEncoding := '';
  FContentLanguage := '';
  FContentType := '';
  FContentLength := 0;
  FContentRangeStart := 0;
  FContentRangeEnd := 0;
  FDate := 0;
  FLastModified := 0;
  FUserAgent := DefaultUserAgent;
  FExpires := 0;
  FProxyServer := '';
  FProxyUsername := '';
  FProxyPassword := '';
  FProxyPort := 0;
  FProxyAuthenticate := '';
  FExtraHeaders.Clear;
end;

constructor TIdHeaderInfo.Create(Component: TComponent);
begin
  inherited Create;
  FComponent := Component;
  FExtraHeaders := TIdHeaderList.Create;
  Clear;
end;

procedure TIdHeaderInfo.GetHeaders(Headers: TIdHeaderList);
var
  i: Integer;
  RangeDecode: string;
begin
  // Set and Delete so that later we copy remaining to optional headers
  ExtraHeaders.Clear;
  with Headers do
  begin
    FLocation := Values['Location']; {do not localize}
    Values['Location'] := ''; {do not localize}
    FServer := Values['Server']; {do not localize}
    Values['Server'] := ''; {do not localize}
    FConnection := Values['Connection']; {do not localize}
    Values['Connection'] := ''; {do not localize}
    FContentVersion := Values['Content-Version']; {do not localize}
    Values['Content-Version'] := ''; {do not localize}
    FWWWAuthenticate := Values['WWWAuthenticate']; {do not localize}
    Values['WWWAuthenticate'] := ''; {do not localize}
    FContentEncoding := Values['Content-Encoding']; {do not localize}
    Values['Content-Encoding'] := ''; {do not localize}
    FContentLanguage := Values['Content-Language']; {do not localize}
    Values['Content-Language'] := ''; {do not localize}
    FContentType := Values['Content-Type']; {do not localize}
    Values['Content-Type'] := ''; {do not localize}
    FContentLength := StrToIntDef(Values['Content-Length'],0); {do not localize}
    Values['Content-Length'] := ''; {do not localize}
    RangeDecode := Values['Content-Range']; {do not localize}
    Values['Content-Range'] := ''; {do not localize}
    if RangeDecode <> '' then
    begin
      Fetch(RangeDecode);
      FContentRangeStart := StrToInt(Fetch(RangeDecode,'-'));
      FContentRangeEnd := StrToInt(Fetch(RangeDecode,'/'));
    end;
    FDate := idGlobal.GMTToLocalDateTime(Values['Date']); {do not localize}
    Values['Date'] := ''; {do not localize}
    FLastModified := GMTToLocalDateTime(Values['Last-Modified']); {do not localize}
    Values['Last-Modified'] := ''; {do not localize}
    FExpires := GMTToLocalDateTime(Values['Expires']); {do not localize}
    Values['Expires'] := ''; {do not localize}
    FProxyAuthenticate := Values['Proxy-Authenticate']; {do not localize}
    Values['Proxy-Authenticate'] := ''; {do not localize}
    for i := 0 to Headers.Count - 1 do
      FExtraHeaders.Add(Headers.Strings[i]);
  end ;
end;

procedure TIdHeaderInfo.SetHeaders(var Headers: TIdHeaderList);
begin
  Headers.Clear;
  with Headers do
  begin
    if FAccept <> '' then
      Add('Accept: '+FAccept); {do not localize}
    if FAcceptCharset <> '' then
      Add('Accept-Charset: ' + FAcceptCharSet); {do not localize}
    if FAcceptEncoding <> '' then
      Add('Accept-Encoding: ' + FAcceptEncoding); {do not localize}
    if FAcceptLanguage <> '' then
      Add('Accept-Language: ' + FAcceptLanguage); {do not localize}
    if FFrom <> '' then
      Add('From: ' + FFrom); {do not localize}
    if FReferer <> '' then
      Add('Referer: ' + FReferer); {do not localize}
    if FUserAgent <> '' then
      Add('User-Agent: ' + FUserAgent); {do not localize}
    if FConnection <> '' then
      Add('Connection: ' + FConnection); {do not localize}
    if FContentVersion <> '' then
      Add('Content-Version: ' + FContentVersion); {do not localize}
    if FContentEncoding <> '' then
      Add('Content-Encoding: ' + FContentEncoding); {do not localize}
    if FContentLanguage <> '' then
      Add('Content-Language: ' + FContentLanguage); {do not localize}
    if FContentType <> '' then
      Add('Content-Type: ' + FContentType); {do not localize}
    if FContentLength <> 0 then
      Add('Content-Length: ' + IntToStr(FContentLength)); {do not localize}
    if (FContentRangeStart <> 0) or (FContentRangeEnd <> 0) then
    begin
      if FContentRangeEnd <> 0 then
        Add('Range: bytes=' + IntToStr(FContentRangeStart)+'-'+IntToStr(FContentRangeEnd))
      else
        Add('Range: bytes=' + IntToStr(FContentRangeStart)+'-');
    end;
    if FUsername <> '' then
    begin
      Add('Authorization: Basic ' + Base64Encode(FUsername + ':' + FPassword)); {do not localize}
    end;
    if (Length(FProxyServer) > 0) and (Length(FProxyUsername) > 0) then
    begin
      Add('Proxy-Authorization: Basic ' + Base64Encode(FProxyUsername + ':' + {do not localize}
        FProxyPassword));
    end;
    // Add the extra-headers
    AddStrings(FExtraHeaders);
  end;
end;

procedure TIdHeaderInfo.SetExtraHeaders(const Value: TIdHeaderList);
begin
  FExtraHeaders.Assign(Value);
end;

destructor TIdHeaderInfo.Destroy;
begin
  FExtraHeaders.Free;
  inherited Destroy;
end;

{ TIdHTTP }

constructor TIdHTTP.Create;
begin
  inherited;
  Port := IdPORT_HTTP;
  FRedirectMax := Id_TIdHTTP_RedirectMax;
  FHandleRedirects := Id_TIdHTTP_HandleRedirects;

  // Create the headers
  FRequest := TIdHeaderInfo.Create(self);
  FResponse := TIdHeaderInfo.Create(Self);
  // Create stringlist to hold internal headers
  FInternalHeaders := TIdHeaderList.Create;
  //
  FProtocolVersion := Id_TIdHTTP_ProtocolVersion;
end;

destructor TIdHTTP.Destroy;
begin
  FRequest.Free;
  FResponse.Free;
  FInternalHeaders.Free;
  inherited Destroy;
end;

procedure TIdHTTP.Get(AURL: string; const AResponseContent: TStream);
begin
  DoRequest(hmGet, AURL, nil, AResponseContent);
end;

procedure TIdHTTP.Head(URL: string);
begin
  DoRequest(hmHead, URL, nil, nil);
end;

procedure TIdHTTP.Post(URL: string; const Source: TStrings; const AResponseContent: TStream);
var
  OldProtocol: TIdHTTPProtocolVersion;
begin
  // PLEASE READ CAREFULLY

  // Currently when issuing a POST, IdHTTP will automatically set the protocol
  // to version 1.0 independently of the value it had initially. This is because
  // there are some servers that don't respect the RFC to the full extent. In
  // particular, they don't respect sending/not sending the Expect: 100-Continue
  // header. Until we find an optimum solution that does NOT break the RFC, we
  // will restrict POSTS to version 1.0.
  if Connected then
    Disconnect;
  OldProtocol := FProtocolVersion;
  FProtocolVersion := pv1_0;
  DoRequest(hmPost, URL, Source, AResponseContent);
  FProtocolVersion := OldProtocol;
end;

procedure TIdHTTP.RetrieveHeaders;
var
  s:string;
begin
  // Set the response headers
  // Clear headers
  FInternalHeaders.Clear;
  s := ReadLn;
  while Length(s) > 0 do begin
    FInternalHeaders.Add(s);
    s := ReadLn;
  end;
  FResponse.GetHeaders(FInternalHeaders);
end;

function TIdHTTP.DoOnRedirect(var Location: String; RedirectCount: integer): boolean;
begin
  result := HandleRedirects;
  if assigned( FOnRedirect ) then
  begin
    FOnRedirect(self, Location, RedirectCount, result);
  end;
end;

procedure TIdHTTP.DoRequest(const AMethod: TIdHTTPMethod; AURL: string;
 const ASource: TObject; const AResponseContent: TStream);
var
  LLocation,
  LDoc,
  LHost,
  LPath,
  LProto,
  LPort,
  LBookmark : string;
  ResponseDigit: Integer;
  i: Integer;
  CloseConnection: boolean;


  // This function sets the Host and Port and returns a boolean depending on
  // whether a PROXY is being used or not.
  function SetHostAndPort(AProto, AHost: string; APort: Integer): Boolean;
  begin
    // First check to see if a Proxy has been specified.
    if Length(Request.ProxyServer) > 0 then
    begin
      Host := Request.ProxyServer;
      Port := Request.ProxyPort;
      if Length(AHost) > 0 then HostHeader := AHost;
      if Length(AProto) > 0 then ProtoHeader := AProto;

      FTunnelProxyHost := AHost;
      if APort = -1 then begin
        FTunnelProxyPort := 443
      end else begin
        FTunnelProxyPort := APort;
      end;

      FTunnelProxyProtocol := ProtocolVersionString[ProtocolVersion];
      if assigned(Intercept) then
      begin
        if (Intercept is TIdSSLConnectionIntercept) then begin
          // Send the CONNECT command to proxy server, to pass-through the communication
          Intercept.OnConnect := DoProxyConnectMethod;
        end else begin
          Intercept.OnConnect := nil;
        end;
      end;
      Result := True;
    end else begin
      Result := False;
      if AnsiSameText(AProto, 'HTTPS') then
      begin
        if not (Intercept is TIdSSLConnectionIntercept) then
        begin
          raise EIdInterceptPropInvalid.Create(RSInterceptPropInvalid);
        end;
        if (Length(AHost) > 0) then
        begin
          if ((not AnsiSameText(Host, AHost)) or (Port<>APort)) and (Connected) then
            Disconnect;
          Host := AHost;
          HostHeader := AHost;
          if Length(AProto) > 0 then ProtoHeader := AProto;
        end
        else
          HostHeader := Host;
        // Check to see if a PORT has been specified
        if APort = -1 then
          Port := 443
        else
          Port := APort;
        InterceptEnabled := True;
      end
      else
      begin
        if (Length(AHost) > 0) then
        begin
          if ((not AnsiSameText(Host, AHost)) or (Port<>APort)) and (Connected) then
            Disconnect;
          Host := AHost;
          HostHeader := AHost;
          if Length(AProto) > 0 then ProtoHeader := AProto;
        end
        else
          HostHeader := Host;
        if APort = -1 then
          Port := 80
        else
          Port := APort;
      end;
    end;
  end;

  procedure ReadResult;
  var
    Size: Integer;

    function ChunkSize: integer;
    var
      j: Integer;
      s: string;
    begin
      s := ReadLn;
      j := AnsiPos(' ', s);
      if j > 0 then
      begin
        s := Copy(s, 1, j - 1);
      end;
      Result := StrToIntDef('$'+s, 0);
    end;

  begin
    if AResponseContent <> nil then begin             // Only for Get and Post
      if Response.ContentLength <> 0 then begin // If chunked then this is also 0
        ReadStream(AResponseContent, Response.ContentLength);
      end
      else
      begin
        if AnsiPos('chunked', Response.ExtraHeaders.Values['Transfer-Encoding']) > 0 then {do not localize}
        begin // Chunked
          DoStatus(hsText,  [RSHTTPChunkStarted]);
          Size := ChunkSize;
          while Size > 0 do
          begin
            ReadStream(AResponseContent, Size);
            ReadLn; // blank line
            Size := ChunkSize;
          end;
          ReadLn; // blank line
        end else begin
          ReadStream(AResponseContent, -1, True);
        end;
      end;
    end;
  end;


begin
  inc(FRedirectCount);

  ParseURI(AURL, LProto, LHost, LPath, LDoc, LPort,LBookmark);
  AURL := LPath + LDoc;

  if SetHostAndPort(LProto, LHost, StrToIntDef(LPort,-1)) then begin
    if Length(LHost) > 0 then AURL := LHost + AURL
    else AURL := HostHeader + AURL;

    if Length(LProto) > 0 then AURL := LProto + '://' + AURL
    else AURL := ProtoHeader + '://' +  AURL;
  end;

  CheckForDisconnect(False);
  if not Connected then begin
    Connect;
  end;

  FInternalHeaders.Clear;
  if AMethod = hmPost then begin
    if ASource is TStrings then begin
      Request.ContentLength := Length(TStrings(ASource).Text);
    end else if ASource is TStream then begin
      Request.ContentLength := TStream(ASource).Size;
    end else begin
      raise EIdObjectTypeNotSupported.Create(RSObjectTypeNotSupported);
    end;
  end
  else Request.ContentLength := 0;

  Request.SetHeaders(FInternalHeaders);
  case AMethod of
    hmHead: WriteLn('HEAD ' + AURL + ' HTTP/' + ProtocolVersionString[ProtocolVersion]); {do not localize}
    hmGet: WriteLn('GET ' + AURL  + ' HTTP/' + ProtocolVersionString[ProtocolVersion]); {do not localize}
    hmPost: WriteLn('POST ' + AURL + ' HTTP/'+ ProtocolVersionString[ProtocolVersion]); {do not localize}
  end;
  WriteLn('Host: ' + HostHeader); {do not localize}
  // write the headers
  for i := 0 to FInternalHeaders.Count - 1 do
    WriteLn(FInternalHeaders.Strings[i]);
  WriteLn('');

  if (AMethod = hmPost) then
  begin
    if ASource is TStrings then begin
      WriteStrings(TStrings(ASource));
    end else if ASource is TStream then begin
      WriteStream(TStream(ASource), True, false);
    end else begin
      raise EIdObjectTypeNotSupported.Create(RSObjectTypeNotSupported);
    end
  end;
  FResponseText := ReadLn;
  CloseConnection := AnsiSameText(Copy(FResponseText, 6, 3), '1.0');
  Fetch(FResponseText);
  FResponseCode := StrToInt(Fetch(FResponseText,' ', False));
  ResponseDigit := ResponseCode div 100;
  RetrieveHeaders;
  // Handle Redirects
  if ((ResponseDigit = 3) and (ResponseCode <> 304)) or (Length(Response.Location) > 0) then
  begin
    // First read the result
    ReadResult;

    LLocation := Response.Location;

    if (FHandleRedirects) and (FRedirectCount < FRedirectMax) then
    begin
      if assigned( AResponseContent ) then
      begin
        AResponseContent.Position := 0;
      end;

      if DoOnRedirect(LLocation, FRedirectCount) then begin
        if (FProtocolVersion = pv1_0) or (CloseConnection) then
      begin
          Disconnect;
        end;

        DoRequest(AMethod, LLocation, ASource, AResponseContent);
      end;
    end
    else // Just fire the event
    begin
      if not DoOnRedirect(LLocation, FRedirectCount) then // If not Handled
        raise EIdProtocolReplyError.CreateError(ResponseCode, ResponseText)
      else Response.Location := LLocation;
    end;
  end
  else
  begin
    ReadResult;
    if ResponseDigit <> 2 then
    begin
      // GREGOR Workaround
      // if we get an error we disconnect if we use SSL / Intercept
      if InterceptEnabled then begin
        Disconnect;
      end;

      raise EIdProtocolReplyError.CreateError(ResponseCode, ResponseText);
    end;
  end;
  if (FProtocolVersion = pv1_0) or (CloseConnection) then
  begin
    Disconnect;
  end
  else
  begin
    if AnsiSameText(Trim(Response.Connection), 'CLOSE') and (Connected) then begin // Not peristent {do not localize}
      Disconnect;
    end else begin
      CheckForGracefulDisconnect(False);
    end;
  end;
  FRedirectCount := 0;
end;

procedure TIdHTTP.Post(URL: string; const Source, AResponseContent: TStream);
var
  OldProtocol: TIdHTTPProtocolVersion;
begin
  // PLEASE READ CAREFULLY

  // Currently when issuing a POST, IdHTTP will automatically set the protocol
  // to version 1.0 independently of the value it had initially. This is because
  // there are some servers that don't respect the RFC to the full extent. In
  // particular, they don't respect sending/not sending the Expect: 100-Continue
  // header. Until we find an optimum solution that does NOT break the RFC, we
  // will restrict POSTS to version 1.0.
  if Connected then
    Disconnect;
  OldProtocol := FProtocolVersion;
  FProtocolVersion := pv1_0;
  DoRequest(hmPost, URL, Source, AResponseContent);
  FProtocolVersion := OldProtocol;
end;

function TIdHTTP.Get(AURL: string): string;
var
  Stream: TStringStream;
begin
  Stream := TStringStream.Create(''); try
    Get(AURL, Stream);
    result := Stream.DataString;
  finally Stream.Free; end;
end;

procedure TIdHTTP.DoProxyConnectMethod(ASender: TObject);
var
  sPort: String;
begin
  InterceptEnabled := False; // disable the interceptor
  // Send the CONNECT command, if it is 200 OK the go on else disconnect
  sPort := IntToStr(FTunnelProxyPort);
  WriteLn('CONNECT ' + FTunnelProxyHost + ':' + sPort + ' HTTP/' + FTunnelProxyProtocol);
  WriteLn;
  ReadLn;
  ReadLn;
  ReadLn;
  InterceptEnabled := True; // reenable the interceptor
end;

end.
