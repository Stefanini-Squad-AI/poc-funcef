unit IvSocket;

{$I IVMULTI.INC}

interface

uses
  Windows, SysUtils, Messages, Classes,
{$IFDEF IVVB}
  IvWinSock,
{$ELSE}
  WinSock,
{$ENDIF}
  IvSynchr;

type
  EIvSocketError = class(Exception);

  TIvWinSocket = class(TObject)
  private
    FHost: String;
    FAddress: String;
    FService: String;
    FPort: Integer;
    FConnected: Boolean;
    FSocket: TSocket;
    FAddr: TSockAddrIn;
    FSocketLock: TIvCriticalSection;

  protected
    function InitSocket(
      var name, address, service: String;
      port: Word;
      client: Boolean): TSockAddrIn;
    procedure Disconnect(Socket: TSocket); virtual;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Open;
    procedure Close;

    procedure Lock;
    procedure Unlock;

    function LookupName(const name: string) : TInAddr;
    function LookupService(const service: string): Integer;

    property Port: Integer read FPort write FPort;
    property Host: String read FHost write FHost;
    property Address: String read FAddress write FAddress;
    property Connected: Boolean read FConnected;
    property Addr: TSockAddrIn read FAddr;
    property Handle: TSocket read FSocket;
  end;

  TIvWinSocketStream = class(TStream)
  private
    FSocket: TIvWinSocket;
    FTimeout: Longint;
    FEvent: TIvSimpleEvent;

  public
    constructor Create(socket: TIvWinSocket; timeOut: Longint);
    destructor Destroy; override;

    function WaitForData(timeout: Longint): Boolean;
    function Read(var buffer; count: Longint): Longint; override;
    function Write(const buffer; count: Longint): Longint; override;
    function Seek(offset: Longint; origin: Word): Longint; override;

    function ReadMessage(timeout: Integer): String;

    property TimeOut: Longint read FTimeout write FTimeout;
  end;

implementation

uses
  Forms;

const
  sWindowsSocketError = 'Windows socket error: %s (%d), on API ''%s''';
  sNoAddress = 'No address specified';
  sSocketAlreadyOpen = 'Socket already open';
  sCannotCreateSocket = 'Can''t create new socket';
  sSocketIOError = '%s error %d, %s';
  sSocketRead = 'Read';
  sSocketWrite = 'Write';

var
  WSAData: TWSAData;

function CheckSocketResult(ResultCode: Integer; const Op: string): Integer;
begin
  if ResultCode <> 0 then
  begin
    Result := WSAGetLastError;
    if Result <> WSAEWOULDBLOCK then
      raise EIvSocketError.CreateFmt(
        sWindowsSocketError,
        [SysErrorMessage(Result), Result, Op]);
  end
  else
    Result := 0;
end;

procedure Startup;
var
  ErrorCode: Integer;
begin
{$IFDEF IVVB}
  if not IsWinSockAvailable then
    Exit;
{$ENDIF}

  ErrorCode := WSAStartup($0101, WSAData);
  if ErrorCode <> 0 then
    raise EIvSocketError.CreateFmt(
      sWindowsSocketError,
      [SysErrorMessage(ErrorCode), ErrorCode, 'WSAStartup']);
end;

procedure Cleanup;
var
  ErrorCode: Integer;
begin
{$IFDEF IVVB}
  if not IsWinSockAvailable then
    Exit;
{$ENDIF}

  ErrorCode := WSACleanup;
  if ErrorCode <> 0 then
    raise EIvSocketError.CreateFmt(
      sWindowsSocketError,
      [SysErrorMessage(ErrorCode), ErrorCode, 'WSACleanup']);
end;

{ TCustomWinSocket }

constructor TIvWinSocket.Create;
begin
  inherited Create;
  Startup;
  FSocketLock := TIvCriticalSection.Create;
  FSocket := INVALID_SOCKET;
  FAddr.sin_family := PF_INET;
  FAddr.sin_addr.s_addr := INADDR_ANY;
  FAddr.sin_port := 0;
  FConnected := FSocket <> INVALID_SOCKET;
end;

destructor TIvWinSocket.Destroy;
begin
  if FConnected and (FSocket <> INVALID_SOCKET) then
    Disconnect(FSocket);
  FSocketLock.Free;
  Cleanup;
  inherited Destroy;
end;

procedure TIvWinSocket.Close;
begin
  Disconnect(FSocket);
end;

procedure TIvWinSocket.Lock;
begin
  FSocketLock.Enter;
end;

procedure TIvWinSocket.Unlock;
begin
  FSocketLock.Leave;
end;

function TIvWinSocket.LookupName(const Name: string): TInAddr;
var
  HostEnt: PHostEnt;
  InAddr: TInAddr;
begin
  HostEnt := gethostbyname(PChar(Name));
  FillChar(InAddr, SizeOf(InAddr), 0);
  if HostEnt <> nil then
  begin
    with InAddr, HostEnt^ do
    begin
{$IFDEF IVWIDE}
      S_un_b.s_b1 := h_addr^[0];
      S_un_b.s_b2 := h_addr^[1];
      S_un_b.s_b3 := h_addr^[2];
      S_un_b.s_b4 := h_addr^[3];
{$ELSE}
      S_un_b.s_b1 := h_addr_list^[0];
      S_un_b.s_b2 := h_addr_list^[1];
      S_un_b.s_b3 := h_addr_list^[2];
      S_un_b.s_b4 := h_addr_list^[3];
{$ENDIF}
    end;
  end;
  Result := InAddr;
end;

function TIvWinSocket.LookupService(const Service: string): Integer;
var
  ServEnt: PServEnt;
begin
  ServEnt := getservbyname(PChar(Service), 'tcp');
  if ServEnt <> nil then
    Result := ntohs(ServEnt.s_port)
  else Result := 0;
end;

function TIvWinSocket.InitSocket(
  var name, address, service: String;
  port: Word;
  client: Boolean): TSockAddrIn;
begin
  Result.sin_family := PF_INET;

  if Name <> '' then
    Result.sin_addr := LookupName(name)
  else if Address <> '' then
    Result.sin_addr.s_addr := inet_addr(PChar(Address))
  else if not Client then
    Result.sin_addr.s_addr := INADDR_ANY
  else
    raise EIvSocketError.Create(sNoAddress);

  if Service <> '' then
    Result.sin_port := htons(LookupService(Service))
  else
    Result.sin_port := htons(Port);
end;

procedure TIvWinSocket.Open;
var
  Blocking: Longint;
  SockAddrIn: TSockAddrIn;
begin
  if FConnected then
    raise EIvSocketError.Create(sSocketAlreadyOpen);

{$IFDEF IVVB}
  if IsWinSockAvailable then
{$ENDIF}
    FSocket := socket(PF_INET, SOCK_STREAM, IPPROTO_IP);

  if FSocket = INVALID_SOCKET then
    raise EIvSocketError.Create(sCannotCreateSocket);

  try
    SockAddrIn := InitSocket(FHost, FAddress, FService, FPort, True);
    Blocking := 0;
    ioctlsocket(FSocket, FIONBIO, Blocking);
    CheckSocketResult(connect(FSocket, SockAddrIn, SizeOf(SockAddrIn)), 'connect');
    FConnected := FSocket <> INVALID_SOCKET;
  except
    Disconnect(FSocket);
    raise;
  end;
end;

procedure TIvWinSocket.Disconnect(Socket: TSocket);
begin
  Lock;
  try
    if (Socket = INVALID_SOCKET) or (Socket <> FSocket) then
      exit;
    CheckSocketResult(closesocket(FSocket), 'closesocket');
    FSocket := INVALID_SOCKET;
    FConnected := False;
  finally
    Unlock;
  end;
end;

{ TWinSocketStream }

constructor TIvWinSocketStream.Create(socket: TIvWinSocket; timeOut: Longint);
begin
  FSocket := socket;
  FTimeOut := timeOut;
  FEvent := TIvSimpleEvent.Create;
  inherited Create;
end;

destructor TIvWinSocketStream.Destroy;
begin
  FEvent.Free;
  inherited Destroy;
end;

function TIvWinSocketStream.WaitForData(timeout: Longint): Boolean;
var
  FDSet: TFDSet;
  TimeVal: TTimeVal;
begin
  TimeVal.tv_sec := Timeout div 1000;
  TimeVal.tv_usec := (Timeout mod 1000)*1000;
  FDSet.fd_count := 0;
  if FDSet.fd_count < FD_SETSIZE then
  begin
    FDSet.fd_array[FDSet.fd_count] := FSocket.Handle;
    Inc(FDSet.fd_count);
  end;
  Result := select(0, @FDSet, nil, nil, @TimeVal) > 0;
end;

function TIvWinSocketStream.Read(var Buffer; Count: Longint): Longint;
var
  Overlapped: TOverlapped;
  ErrorCode: Integer;
  dw: DWord;
begin
  Result := 0;
  FSocket.Lock;
  try
    FillChar(Overlapped, SizeOf(Overlapped), 0);
    Overlapped.hEvent := FEvent.Handle;
    if not ReadFile(FSocket.Handle, Buffer, Count, dw, @Overlapped) and
      (GetLastError <> ERROR_IO_PENDING) then
    begin
      ErrorCode := GetLastError;
      raise EIvSocketError.CreateFmt(
        sSocketIOError,
        [sSocketRead, ErrorCode, SysErrorMessage(ErrorCode)]);
    end;
    Result := dw;

    if FEvent.WaitFor(FTimeOut) <> ivwrSignaled then
      Result := 0
    else
    begin
      GetOverlappedResult(FSocket.Handle, Overlapped, dw, False);
      Result := dw;
      FEvent.ResetEvent;
    end;
  finally
    FSocket.Unlock;
  end;
end;

function TIvWinSocketStream.Write(const Buffer; Count: Longint): Longint;
var
  Overlapped: TOverlapped;
  ErrorCode: Integer;
  dw: DWord;
begin
  Result := 0;
  FSocket.Lock;
  try
    FillChar(OVerlapped, SizeOf(Overlapped), 0);
    Overlapped.hEvent := FEvent.Handle;
    if not WriteFile(FSocket.Handle, Buffer, Count, dw,
      @Overlapped) and (GetLastError <> ERROR_IO_PENDING) then
    begin
      ErrorCode := GetLastError;
      raise EIvSocketError.CreateFmt(
        sSocketIOError,
        [sSocketWrite, ErrorCode, SysErrorMessage(ErrorCode)]);
    end;
    Result := dw;

    if FEvent.WaitFor(FTimeOut) <> ivwrSignaled then
      Result := 0
    else
    begin
      GetOverlappedResult(FSocket.Handle, Overlapped, dw, False);
      Result := dw;
    end;
  finally
    FSocket.Unlock;
  end;
end;

function TIvWinSocketStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  Result := 0;
end;

function TIvWinSocketStream.ReadMessage(timeout: Integer): String;
const
  SEGMENT_C = 256;
var
  str: String;
  bytesRead: Integer;
begin
  Result := '';
  bytesRead := 0;
  repeat
    if WaitForData(timeout) then
    begin
      bytesRead := Read(str[1], SEGMENT_C);
      if bytesRead > 0 then
      begin
        SetLength(str, bytesRead);
        Result := Result + str;
      end;
    end;
  until bytesRead <= SEGMENT_C;
end;

end.

