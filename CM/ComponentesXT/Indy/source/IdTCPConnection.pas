unit IdTCPConnection;

interface

uses
	Classes, IdException,
  IdComponent, IdGlobal, IdSocketHandle, IdIntercept;

const
  GRecvBufferSizeDefault = 32768;
  GSendBufferSizeDefault = 32768;

type
  //TODO: Make this a buffered stream for more efficiency.
  TIdBuffer = class(TMemoryStream)
  public
    procedure RemoveXBytes(const AByteCount: integer);
  end;

  TIdTCPConnection = class(TIdComponent)
  protected
  	FASCIIFilter: boolean;
    FBinding: TIdSocketHandle;
    FBuffer: TIdBuffer;
    // TODO - Change the "move" functions to read write functinos. Get as much as possible down
    // to just TStream so we can replace it easily
  	FClosedGracefully: boolean;
    FCmdResultDetails: TStrings;
    FIntercept: TIdConnectionIntercept;
    FInterceptEnabled: Boolean;
    FOnDisconnected: TNotifyEvent;
    FReadLnTimedOut: Boolean;
  	FRecvBuffer: TIdBuffer; // To be used by ReadFromStack only
    FResultNo: SmallInt;
    FSendBufferSize: Integer;
    FWriteBuffer: TIdBuffer;
    FWriteBufferThreshhold: Integer;
    //
    procedure DoOnDisconnected; virtual;
    function GetCmdResult: string;
    function GetRecvBufferSize: Integer;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ResetConnection; virtual;
    procedure SetIntercept(AValue: TIdConnectionIntercept);
    procedure SetInterceptEnabled(AValue: Boolean);
    procedure SetRecvBufferSize(const Value: Integer);
  public
    function AllData: string; virtual;
    procedure CancelWriteBuffer;
    procedure Capture(ADest: TObject; const ADelim: string = '.'; const AIsRFCMessage: Boolean = False);
    procedure CheckForDisconnect(const ARaiseExceptionIfDisconnected: boolean = true;
     const AIgnoreBuffer: boolean = false); virtual;
    procedure CheckForGracefulDisconnect(const ARaiseExceptionIfDisconnected: boolean = true);
     virtual;
    function CheckResponse(const AResponse: SmallInt; const AAllowedResponses: array of SmallInt)
     : SmallInt; virtual;
    procedure ClearWriteBuffer;
    procedure CloseWriteBuffer;
    function Connected: boolean; virtual;
    constructor Create(AOwner: TComponent); override;
    function CurrentReadBuffer: string;
    function CurrentReadBufferSize: integer;
    destructor Destroy; override;
    procedure Disconnect; virtual;
    procedure DisconnectSocket; virtual;
    function ExtractXBytesFromBuffer(const AByteCount: Integer): string; virtual;
    procedure FlushWriteBuffer(const AByteCount: Integer = -1);
    function GetResponse(const AAllowedResponses: Array of SmallInt): SmallInt; virtual;
    function InputLn(const AMask: string = ''): string;
    procedure OpenWriteBuffer(const AThreshhold: Integer = -1);
    // RaiseExceptionForCmdResult - Overload necesary as a exception as a default param doesnt work
    procedure RaiseExceptionForCmdResult; overload; virtual;
    procedure RaiseExceptionForCmdResult(axException: TClassIdException); overload; virtual;
    procedure ReadBuffer(var ABuffer; const AByteCount: Longint);
    function ReadCardinal(const AConvert: boolean = true): Cardinal;
    // ReadFromStack must be only call to Recv
    function ReadFromStack(const ARaiseExceptionIfDisconnected: boolean = true;
     const ATimeout: integer = IdTimeoutInfinite; const AUseBuffer: boolean = true;
     ADestStream: TIdBuffer = nil): integer;
     virtual;
    function ReadInteger(const AConvert: boolean = true): Integer;
    function ReadLn(const ATerminator: string = '';
     const ATimeout: integer = IdTimeoutInfinite): string; virtual;
    function ReadLnWait: string;
    function ReadSmallInt(const AConvert: boolean = true): SmallInt;
    procedure ReadStream(AStream: TStream; AByteCount: LongInt = -1;
     const AReadUntilDisconnect: boolean = false);
    function ReadString(const ABytes: integer): string;
    procedure RemoveXBytesFromBuffer(const AByteCount: Integer); virtual;
    function SendCmd(const AOut: string; const AResponse: SmallInt = -1): SmallInt; overload;
    function SendCmd(const AOut: string; const AResponse: Array of SmallInt): SmallInt; overload;
     virtual;
    function WaitFor(const AString: string): string;
    procedure Write(AOut: string); virtual;
    // WriteBuffer must be the ONLY call to SEND - all data goes thru this method
    procedure WriteBuffer(const ABuffer; AByteCount: Longint; const AWriteNow: boolean = false);
    procedure WriteCardinal(AValue: Cardinal; const AConvert: boolean = true);
    procedure WriteHeader(axHeader: TStrings);
    procedure WriteInteger(AValue: Integer; const AConvert: boolean = true);
    procedure WriteLn(const AOut: string = ''); virtual;
    procedure WriteSmallInt(AValue: SmallInt; const AConvert: boolean = true);
    procedure WriteStream(AStream: TStream; const AAll: boolean = true;
     const AWriteByteCount: Boolean = false); virtual;
    procedure WriteStrings(AValue: TStrings);
    function WriteFile(AFile: String; const AEnableTransferFile: boolean = false): cardinal;
     virtual;
    //
    property Binding: TIdSocketHandle read FBinding;
  	property ClosedGracefully: boolean read FClosedGracefully;
    property CmdResult: string read GetCmdResult;
    property CmdResultDetails: TStrings read FCmdResultDetails;
    property ReadLnTimedOut: Boolean read FReadLnTimedOut;
    property ResultNo: SmallInt read FResultNo;
  published
  	property ASCIIFilter: boolean read FASCIIFilter write FASCIIFilter default False;
    property Intercept: TIdConnectionIntercept read FIntercept write SetIntercept;
    property InterceptEnabled: Boolean read FInterceptEnabled write SetInterceptEnabled Default False;
    property OnDisconnected: TNotifyEvent read FOnDisconnected write FOnDisconnected;
    property OnWork;
    property OnWorkBegin;
    property OnWorkEnd;
    property RecvBufferSize: Integer read GetRecvBufferSize write SetRecvBufferSize default GRecvBufferSizeDefault;
    property SendBufferSize: Integer read FSendBufferSize write FSendBufferSize default GSendBufferSizeDefault;
  end;

  EIdTCPConnectionError = class(EIdException);
  EIdObjectTypeNotSupported = class(EIdTCPConnectionError);
  EIdNotEnoughDataInBuffer = class(EIdTCPConnectionError);
  EIdInterceptPropIsNil = class(EIdTCPConnectionError);
  EIdInterceptPropInvalid = class(EIdTCPConnectionError);
  EIdNoDataToRead = class(EIdTCPConnectionError);

implementation

uses
  IdAntiFreezeBase,
  IdStack, IdStackConsts, IdResourceStrings,
  SysUtils;

function TIdTCPConnection.AllData: string;
begin
  BeginWork(wmRead); try
    result := '';
    while Connected do begin
      Result := Result + CurrentReadBuffer;
    end;
  finally EndWork(wmRead); end;
end;

procedure TIdTCPConnection.Capture(ADest: TObject; const ADelim: string = '.';
  const AIsRFCMessage: Boolean = False);
var
  s: string;
begin
  BeginWork(wmRead); try
    repeat
      s := ReadLn;
      if s = ADelim then begin
        exit;
      end;

      // For RFC 822 retrieves
      if AIsRFCMessage and (Copy(s, 1, 2) = '..') then begin
        Delete(s, 1, 1);
      end;

      // Write to output
      if ADest is TStrings then begin
        TStrings(ADest).Add(s);
      end else if ADest is TStream then begin
        TStream(ADest).WriteBuffer(s[1], Length(s));
        s := EOL;
        TStream(ADest).WriteBuffer(s[1], Length(s));
      end else if ADest <> nil then begin
        raise EIdObjectTypeNotSupported.Create(RSObjectTypeNotSupported);
      end;
    until false;
  finally EndWork(wmRead); end;
end;

procedure TIdTCPConnection.CheckForDisconnect(const ARaiseExceptionIfDisconnected: boolean = true;
 const AIgnoreBuffer: boolean = false);
begin
  // ClosedGracefully // Server disconnecte
  // (Binding.HandleAllocated = false) // Client disconnected
  if ClosedGracefully or (Binding.HandleAllocated = false) then begin
    if Binding.HandleAllocated then begin
    	DisconnectSocket;
    end;
    // Do not raise unless all data has been read by the user
	  if ((CurrentReadBufferSize = 0) or AIgnoreBuffer) and ARaiseExceptionIfDisconnected then begin
      (* ************************************************************* //
      ------ If you receive an exception here, please read. ----------

      If this is a SERVER
      -------------------
      The client has disconnected the socket normally and this exception is used to notify the
      server handling code. This exception is normal and will only happen from within the IDE, not
      while your program is running as an EXE. If you do not want to see this, add this exception
      or EIdSilentException to the IDE options as exceptions not to break on.

      From the IDE just hit F9 again and Indy will catch and handle the exception.

      Please see the FAQ and help file for possible further information.
      The FAQ is at http://www.nevrona.com/Indy/FAQ.html

      If this is a CLIENT
      -------------------
      The server side of this connection has disconnected normaly but your client has attempted
      to read or write to the connection. You should trap this error using a try..except.
      Please see the help file for possible further information.

      // ************************************************************* *)
      raise EIdConnClosedGracefully.Create(RSConnectionClosedGracefully);
    end;
  end;
end;

function TIdTCPConnection.Connected: boolean;
begin
  CheckForDisconnect(False);
  result := Binding.HandleAllocated;
end;

constructor TIdTCPConnection.Create(AOwner: TComponent);
begin
  inherited;
  FBinding := TIdSocketHandle.Create(nil);
  FCmdResultDetails := TStringList.Create;
 	FRecvBuffer := TIdBuffer.Create;

  RecvBufferSize := GRecvBufferSizeDefault;
  FSendBufferSize := GSendBufferSizeDefault;
  FBuffer := TIdBuffer.Create;
end;

function TIdTCPConnection.CurrentReadBuffer: string;
begin
  result := '';
  if Connected then begin
    ReadFromStack(False);
    result := ExtractXBytesFromBuffer(FBuffer.Size);
  end;
end;

function TIdTCPConnection.CurrentReadBufferSize: integer;
begin
  result := FBuffer.Size;
end;

destructor TIdTCPConnection.Destroy;
begin
  FreeAndNil(FBuffer);
 	FreeAndNil(FRecvBuffer);
  FreeAndNil(FCmdResultDetails);
  FreeAndNil(FBinding);
  inherited;
end;

procedure TIdTCPConnection.Disconnect;
begin
  DisconnectSocket;
end;

procedure TIdTCPConnection.DoOnDisconnected;
begin
  if assigned(OnDisconnected) then begin
    OnDisconnected(Self);
  end;
end;

function TIdTCPConnection.ExtractXBytesFromBuffer(const AByteCount: Integer): string;
begin
  if AByteCount > FBuffer.Size then begin
    raise EIdNotEnoughDataInBuffer.Create(RSNotEnoughDataInBuffer);
  end;
  SetString(result, PChar(FBuffer.Memory), AByteCount);
  RemoveXBytesFromBuffer(AByteCount);
end;

function TIdTCPConnection.GetCmdResult: string;
begin
	result := '';
	if CmdResultDetails.Count > 0 then begin
		result := CmdResultDetails[CmdResultDetails.Count - 1];
  end;
end;

function TIdTCPConnection.GetRecvBufferSize: Integer;
begin
	result := FRecvBuffer.Size;
end;

function TIdTCPConnection.GetResponse(const AAllowedResponses: Array of SmallInt): SmallInt;
var
  sLine, sTerm: string;
begin
  CmdResultDetails.Clear;
  sLine := ReadLnWait;
  CmdResultDetails.Add(sLine);
  if length(sLine) > 3 then begin
    if sLine[4] = '-' then begin // Multi line response coming
      sTerm := Copy(sLine, 1, 3) + ' ';
      {We keep reading lines until we encounter either a line such as "250"
       or "250 Read"}
      repeat
        sLine := ReadLnWait;
        CmdResultDetails.Add(sLine);
      until (Length(sLine) < 4) or (AnsiSameText(Copy(sLine, 1, 4), sTerm));
    end;
  end;

  if AnsiSameText(Copy(CmdResult, 1, 3), '+OK') then begin
    FResultNo := wsOK;
  end else if AnsiSameText(Copy(CmdResult, 1, 4), '-ERR') then begin
    FResultNo := wsErr;
  end else begin
    FResultNo := StrToIntDef(Copy(CmdResult, 1, 3), 0);
  end;

  Result := CheckResponse(ResultNo, AAllowedResponses);
end;

procedure TIdTCPConnection.RaiseExceptionForCmdResult(axException: TClassIdException);
begin
  raise axException.Create(CmdResult);
end;

procedure TIdTCPConnection.RaiseExceptionForCmdResult;
begin
  raise EIdProtocolReplyError.CreateError(ResultNo, CmdResult);
end;

procedure TIdTCPConnection.ReadBuffer(var ABuffer; const AByteCount: Integer);
begin
	if (AByteCount > 0) and (@ABuffer <> nil) then begin
    // Read from stack until we have enough data
    while CurrentReadBufferSize < AByteCount do begin
      ReadFromStack;
    end;
    // Copy it to the callers buffer
    Move(PChar(FBuffer.Memory)[0], ABuffer, AByteCount);
    // Remove used data from buffer
    RemoveXBytesFromBuffer(AByteCount);
  end;
end;

function TIdTCPConnection.ReadFromStack(const ARaiseExceptionIfDisconnected: boolean = true;
 const ATimeout: integer = IdTimeoutInfinite; const AUseBuffer: boolean = true;
 ADestStream: TIdBuffer = nil): integer;
// Reads any data in tcp/ip buffer and puts it into Winshoe buffer
// This must be the ONLY raw read from Winsock routine
// This must be the ONLY call to RECV - all data goes thru this method
var
  nByteCount, j: Integer;

  procedure DefaultRecv;
  begin
    // No need to call AntiFreeze, the Readable does that.
    nByteCount := Binding.Recv(ADestStream.Memory^, ADestStream.Size, 0);
  end;

begin
  result := 0;
  // Check here as this side may have closed the socket
  CheckForDisconnect(ARaiseExceptionIfDisconnected);
  if Connected then begin
    if ADestStream = nil then begin
      ADestStream := FRecvBuffer;
    end;
    if Binding.Readable(ATimeout) then begin
      if InterceptEnabled then begin
        if Intercept.RecvHandling then begin
          nByteCount := Intercept.Recv(ADestStream.Memory^, ADestStream.Size);
        end else begin
          DefaultRecv;
        end;
      end else begin
        DefaultRecv;
      end;

      FClosedGracefully := nByteCount = 0;
      if not ClosedGracefully then begin
        if GStack.CheckForSocketError(nByteCount, [Id_WSAESHUTDOWN]) then begin
          nByteCount := 0;
          if Binding.HandleAllocated then begin
            DisconnectSocket;
          end;
          // Do not raise unless all data has been read by the user
          if CurrentReadBufferSize = 0 then begin
            GStack.RaiseSocketError(Id_WSAESHUTDOWN);
          end;
        end;
        if ASCIIFilter then begin
          for j := 1 to nByteCount do begin
            PChar(ADestStream.Memory)[j] := Chr(Ord(PChar(ADestStream.Memory)[j]) and $7F);
          end;
        end;
      end;
      if AUseBuffer then begin
        FBuffer.Position := FBuffer.Size;
        FBuffer.WriteBuffer(ADestStream.Memory^, nByteCount);
      end else begin
        // If using ReadBuffer, DoWork is called when bytes are removed from the buffer
        // otherwise we need to call it here (as below).
        DoWork(wmRead, nByteCount);
      end;
      if InterceptEnabled then begin
        Intercept.DataReceived(ADestStream.Memory^, nByteCount);
      end;
      // Check here as other side may have closed connection
      CheckForDisconnect(ARaiseExceptionIfDisconnected);
      result := nByteCount;
    end;
  end;
end;

function TIdTCPConnection.ReadInteger(const AConvert: boolean = true): Integer;
begin
	ReadBuffer(Result, SizeOf(Result));
  if AConvert then begin
    Result := Integer(GStack.WSNToHL(LongWord(Result)));
  end;
end;

function TIdTCPConnection.ReadLn(const ATerminator: string = '';
 const ATimeout: integer = IdTimeoutInfinite): string;
var
  i: Integer;
  s: string;
  LTerminator: string;
begin
  if Length(ATerminator) = 0 then begin
    LTerminator := LF;
  end else begin
    LTerminator := ATerminator;
  end;
  FReadLnTimedOut := False;
 	i := 0;
  repeat
    if CurrentReadBufferSize > 0 then begin
	    //TODO: make searches more efficient, do not copy to a string, search mem directly
      SetString(s, PChar(FBuffer.Memory), FBuffer.Size);
      //Pos and NOT AnsiPos must be used here. AnsiPos stops whenever it sees a #0. Sometimes
      //bad newsgroup messages have #0s in them. Using Pos is not a problem though as ReadLn
      //works directly on the TCP connection and no TCP connections support MBCS without encoding
      //over top of SBCS.
      i := Pos(LTerminator, s);
    end;
    // ReadFromStack blocks - do not call unless we need to
    if i = 0 then begin
      // ReadLn needs to call this as data may exist in the buffer, but no EOL yet disconnected
      CheckForDisconnect(True, True);
      // Can only return 0 if error or timeout
      FReadLnTimedOut := ReadFromStack(True, ATimeout) = 0;
      if ReadLnTimedout then begin
        result := '';
        exit;
      end;
    end;
  until i > 0;
  Result := ExtractXBytesFromBuffer(i + Length(LTerminator) - 1);
  SetLength(Result, i - 1);
  if (Length(ATerminator) = 0) and (Copy(Result, Length(Result), 1) = CR) then begin
    SetLength(Result, Length(Result) - 1);
  end;
end;

function TIdTCPConnection.ReadLnWait: string;
begin
  Result := '';
  while length(Result) = 0 do begin
    Result := Trim(ReadLn);
  end;
end;

procedure TIdTCPConnection.ReadStream(AStream: TStream; AByteCount: Integer = -1;
 const AReadUntilDisconnect: boolean = false);
var
  i: integer;
  LBuffer: TIdBuffer;
  LBufferCount: integer;
  LWorkCount: integer;

  procedure AdjustStreamSize(AStream: TStream; const ASize: integer);
  var
    LStreamPos: LongInt;
  begin
    LStreamPos := AStream.Position;
    AStream.Size := ASize;
    // Must reset to original size as in some cases size changes position
    if AStream.Position <> LStreamPos then begin
      AStream.Position := LStreamPos;
    end;
  end;

begin
	if (AByteCount = -1) and (AReadUntilDisconnect = False) then begin
    // Read size from connection
  	AByteCount := ReadInteger;
  end;
  // Presize stream if we know the size - this reduces memory/disk allocations to one time
  if AByteCount > -1 then begin
    AdjustStreamSize(AStream, AStream.Position + AByteCount);
  end;

  if AReadUntilDisconnect then begin
    LWorkCount := High(LWorkCount);
    BeginWork(wmRead);
  end else begin
    LWorkCount := AByteCount;
    BeginWork(wmRead, LWorkCount);
  end;
  try
    // If data already exists in the buffer, write it out first.
    LBufferCount := Min(CurrentReadBufferSize, LWorkCount);
    Dec(LWorkCount, LBufferCount);
    AStream.WriteBuffer(FBuffer.Memory^, LBufferCount);
    FBuffer.RemoveXBytes(LBufferCount);
    //
    LBuffer := TIdBuffer.Create; try
      while Connected and (LWorkCount > 0) do begin
        i := Min(LWorkCount, RecvBufferSize);
        // Many streams will "resize" even if the size is the same, including VCL streams
        if LBuffer.Size <> i then begin
          LBuffer.Size := i;
        end;
        i := ReadFromStack(not AReadUntilDisconnect, IdTimeoutInfinite, False, LBuffer);
        if AStream.Position + i > AStream.Size then begin
          AdjustStreamSize(AStream, AStream.Size + 4 * CurrentReadBufferSize);
        end;
        AStream.WriteBuffer(LBuffer.Memory^, i);
        Dec(LWorkCount, i);
      end;
    finally LBuffer.Free; end;
  finally EndWork(wmRead); end;
  if AStream.Size > AStream.Position then begin
    AStream.Size := AStream.Position;
  end;
end;

procedure TIdTCPConnection.RemoveXBytesFromBuffer(const AByteCount: Integer);
begin
  FBuffer.RemoveXBytes(AByteCount);
  DoWork(wmRead, AByteCount);
end;

procedure TIdTCPConnection.ResetConnection;
begin
  Binding.Reset;
  FBuffer.Clear;
  FClosedGracefully := False;
end;

function TIdTCPConnection.SendCmd(const AOut: string; const AResponse: Array of SmallInt): SmallInt;
begin
  if AOut <> #0 then begin
    WriteLn(AOut);
  end;
  Result := GetResponse(AResponse);
end;

procedure TIdTCPConnection.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) then begin
    if (AComponent = FIntercept) then begin
      // Use Intercept and not FIntercept so InterceptEnabled gets updated
      Intercept := nil;
    end;
  end;
end;

procedure TIdTCPConnection.SetIntercept(AValue: TIdConnectionIntercept);
begin
  FIntercept := AValue;
  if FIntercept = nil then begin
    FInterceptEnabled := false;
  end else begin
    // add self to the Intercept's free notification list
    if assigned(FIntercept) then begin
      FIntercept.FreeNotification(self);
    end;
  end;
end;

procedure TIdTCPConnection.SetInterceptEnabled(AValue: Boolean);
begin
  if (Intercept = nil) and (not (csLoading in ComponentState)) and AValue then begin
    raise EIdInterceptPropIsNil.Create(RSInterceptPropIsNil);
  end;
  FInterceptEnabled := AValue;
end;

procedure TIdTCPConnection.SetRecvBufferSize(const Value: Integer);
begin
  FRecvBuffer.Size := Value;
end;

procedure TIdTCPConnection.Write(AOut: string);
begin
  if Length(AOut) > 0 then begin
  	WriteBuffer(AOut[1], length(AOut));
  end;
end;

procedure TIdTCPConnection.WriteBuffer(const ABuffer; AByteCount: Integer;
 const AWriteNow: boolean = false);
var
  nPos, nByteCount: Integer;

  procedure DefaultSend;
  begin
    nByteCount := Binding.Send(PChar(@ABuffer)[nPos - 1], AByteCount - nPos + 1, 0);
    // Write always does someting - never retuns 0
    // TODO - Have a AntiFreeze param which allows the send to be split up so that process
    // can be called more. Maybe a prop of the connection, MexSendSize?
    TIdAntiFreezeBase.DoProcess(False);
  end;

begin
	if (AByteCount > 0) and (@ABuffer <> nil) then begin
    // Check if disconnected
    CheckForDisconnect(True, True);

    if (FWriteBuffer = nil) or AWriteNow then begin
      nPos := 1;
      repeat
        if InterceptEnabled then begin
          if Intercept.SendHandling then begin
            nByteCount := Intercept.Send(PChar(@ABuffer)[nPos - 1], AByteCount - nPos + 1);
          end else begin
            DefaultSend;
          end;
        end else begin
          DefaultSend;
        end;
        FClosedGracefully := nByteCount = 0;
        //NOTE - this is currently kind of a hack - there is a newer/better plan that I have to find time
        //to implement
        //DoProcess;

        // Check if other side disconnected
        CheckForDisconnect;
        if GStack.CheckForSocketError(nByteCount, [ID_WSAESHUTDOWN]) then begin
          DisconnectSocket;
          GStack.RaiseSocketError(ID_WSAESHUTDOWN);
        end;
        DoWork(wmWrite, nByteCount);
        if InterceptEnabled then begin
          Intercept.DataSent(PChar(@ABuffer)[nPos - 1], AByteCount - nPos + 1);
        end;
        nPos := nPos + nByteCount
      until nPos > AByteCount;
    // Write Buffer is enabled
    end else begin
      FWriteBuffer.WriteBuffer(ABuffer, AByteCount);
      if (FWriteBuffer.Size >= FWriteBufferThreshhold) and (FWriteBufferThreshhold > 0) then begin
        // TODO: Instead of flushing - Write until buffer is smaller than Threshold. That is do at
        // least one physical send.
        FlushWriteBuffer(FWriteBufferThreshhold);
      end;
    end;
  end;
end;

function TIdTCPConnection.WriteFile(AFile: String; const AEnableTransferFile: boolean = false)
 : cardinal;
var
  LFileStream: TFileStream;
begin
  if assigned(GServeFileProc) and (InterceptEnabled = false) and AEnableTransferFile then begin
    result := GServeFileProc(Binding.Handle, AFile);
  end else begin
    LFileStream := TFileStream.Create(AFile, fmOpenRead	or fmShareDenyNone); try
      WriteStream(LFileStream);
      result := LFileStream.Size;
    finally LFileStream.free; end;
  end;
end;

procedure TIdTCPConnection.WriteHeader(axHeader: TStrings);
var
  i: Integer;
begin
  for i := 0 to axHeader.Count -1 do begin
    // No ReplaceAll flag - we only want to replace the first one
    WriteLn(StringReplace(axHeader[i], '=', ': ', []));
  end;
  WriteLn('');
end;

procedure TIdTCPConnection.WriteInteger(AValue: Integer; const AConvert: boolean = true);
begin
  if AConvert then begin
    AValue := Integer(GStack.WSHToNl(LongWord(AValue)));
  end;
	WriteBuffer(AValue, SizeOf(AValue));
end;

procedure TIdTCPConnection.WriteLn(const AOut: string = '');
begin
  Write(AOut + EOL);
end;

procedure TIdTCPConnection.WriteStream(AStream: TStream; const AAll: boolean = true;
 const AWriteByteCount: Boolean = false);
var
  LSize: integer;
  LBuffer: TMemoryStream;
begin
  if AAll then begin
    AStream.Position := 0;
  end;
  LSize := AStream.Size - AStream.Position;
  if AWriteByteCount then begin
  	WriteInteger(LSize);
  end;
  BeginWork(wmWrite, LSize); try
    LBuffer := TMemoryStream.Create; try
      LBuffer.SetSize(FSendBufferSize);
      while true do begin
        LSize := Min(AStream.Size - AStream.Position, FSendBufferSize);
        if LSize = 0 then begin
          Break;
        end;
        // Do not use ReadBuffer. Some source streams are real time and will not return as much data
        // as we request. Kind of like recv()
        LSize := AStream.Read(LBuffer.Memory^, LSize);
        if LSize = 0 then begin
          raise EIdNoDataToRead.Create(RSIdNoDataToRead);
        end;
        WriteBuffer(LBuffer.Memory^, LSize);
      end;
    finally FreeAndNil(LBuffer); end;
  finally EndWork(wmWrite); end;
end;

procedure TIdTCPConnection.WriteStrings(AValue: TStrings);
var
  i: Integer;
begin
  for i := 0 to AValue.Count - 1 do begin
    WriteLn(AValue.Strings[i]);
  end;
end;

function TIdTCPConnection.SendCmd(const AOut: string; const AResponse: SmallInt): SmallInt;
begin
  if AResponse = -1 then begin
    result := SendCmd(AOut, []);
  end else begin
    result := SendCmd(AOut, [AResponse]);
  end;
end;

procedure TIdTCPConnection.DisconnectSocket;
begin
  if Binding.HandleAllocated then begin
    DoStatus(hsDisconnecting,[Binding.PeerIP]);
    Binding.CloseSocket;
    FClosedGracefully := True;
    DoStatus(hsDisconnected,[Binding.PeerIP]);
    DoOnDisconnected;
  end;
  if InterceptEnabled then begin
    Intercept.Disconnect;
  end;
end;

procedure TIdTCPConnection.OpenWriteBuffer(const AThreshhold: Integer = -1);
begin
  FWriteBuffer := TIdBuffer.Create;
  FWriteBufferThreshhold := AThreshhold;
end;

procedure TIdTCPConnection.CloseWriteBuffer;
begin
  FlushWriteBuffer;
  FreeAndNil(FWriteBuffer);
end;

procedure TIdTCPConnection.FlushWriteBuffer(const AByteCount: Integer = -1);
begin
  if FWriteBuffer.Size > 0 then begin
    if (AByteCount = -1) or (FWriteBuffer.Size < AByteCount) then begin
      WriteBuffer(PChar(FWriteBuffer.Memory)[0], FWriteBuffer.Size, True);
      ClearWriteBuffer;
    end else begin
      WriteBuffer(PChar(FWriteBuffer.Memory)[0], AByteCount, True);
      FWriteBuffer.RemoveXBytes(AByteCount);
    end;
  end;
end;

procedure TIdTCPConnection.ClearWriteBuffer;
begin
  FWriteBuffer.Clear;
end;

function TIdTCPConnection.InputLn(const AMask: string =''): string;
var
  s: string;
begin
  result := '';
  while true do begin
    s := ReadString(1);
    if s = BACKSPACE then begin
      if length(result) > 0 then begin
        SetLength(result, Length(result) - 1);
        Write(BACKSPACE);
      end;
    end else if s = CR then begin
      ReadString(1); // LF
      WriteLn;
      exit;
    end else begin
      result := result + s;
      if Length(AMask) = 0 then begin
        Write(s);
      end else begin
        Write(AMask);
      end;
    end;
  end;
end;

function TIdTCPConnection.ReadString(const ABytes: integer): string;
begin
  SetLength(result, ABytes);
  if ABytes > 0 then begin
  	ReadBuffer(Result[1], Length(Result));
  end;
end;

procedure TIdTCPConnection.CancelWriteBuffer;
begin
  ClearWriteBuffer;
  CloseWriteBuffer;
end;

function TIdTCPConnection.ReadSmallInt(const AConvert: boolean = true): SmallInt;
begin
	ReadBuffer(Result, SizeOf(Result));
  if AConvert then begin
    Result := SmallInt(GStack.WSNToHs(Word(Result)));
  end;
end;

procedure TIdTCPConnection.WriteSmallInt(AValue: SmallInt; const AConvert: boolean = true);
begin
  if AConvert then begin
    AValue := SmallInt(GStack.WSHToNs(Word(AValue)));
  end;
	WriteBuffer(AValue, SizeOf(AValue));
end;

procedure TIdTCPConnection.CheckForGracefulDisconnect(
  const ARaiseExceptionIfDisconnected: boolean);
begin
  ReadFromStack(ARaiseExceptionIfDisconnected, 1);
end;

{ TIdBuffer }

procedure TIdBuffer.RemoveXBytes(const AByteCount: integer);
begin
  if AByteCount > Size then begin
    raise EIdNotEnoughDataInBuffer.Create(RSNotEnoughDataInBuffer);
  end;
  if AByteCount = Size then begin
    Clear;
  end else begin
    Move(PChar(Memory)[AByteCount], PChar(Memory)[0], Size - AByteCount);
    SetSize(Size - AByteCount);
  end;
end;

function TIdTCPConnection.WaitFor(const AString: string): string;
//TODO: Add a time out (default to infinite) and event to pass data
begin
  result := '';
  // NOTE: AnsiPos should be used here, but AnsiPos has problems if result has any #0 in it,
  // which is often the case. So currently this function is not MBCS compliant and should
  // not be used in MBCS environments. However this function should only be used on incoming
  // TCP text data as it is 7 bit.
  while Pos(AString, result) = 0 do begin
    Result := Result + CurrentReadBuffer;
    CheckForDisconnect;
  end;
end;

function TIdTCPConnection.ReadCardinal(const AConvert: boolean): Cardinal;
begin
	ReadBuffer(Result, SizeOf(Result));
  if AConvert then begin
    Result := GStack.WSNToHL(Result);
  end;
end;

procedure TIdTCPConnection.WriteCardinal(AValue: Cardinal; const AConvert: boolean);
begin
  if AConvert then begin
    AValue := GStack.WSHToNl(AValue);
  end;
	WriteBuffer(AValue, SizeOf(AValue));
end;

function TIdTCPConnection.CheckResponse(const AResponse: SmallInt;
 const AAllowedResponses: array of SmallInt): SmallInt;
var
  i: integer;
  LResponseFound: boolean;
begin
  if High(AAllowedResponses) > -1 then begin
    LResponseFound := False;
    for i := Low(AAllowedResponses) to High(AAllowedResponses) do begin
      if AResponse = AAllowedResponses[i] then begin
        LResponseFound := True;
        Break;
      end;
    end;
    if not LResponseFound then begin
      RaiseExceptionForCmdResult;
    end;
  end;
  Result := AResponse;
end;

end.