unit IdTelnetServer;

interface

uses
  Classes,
  IdException,
  IdGlobal, IdTCPServer;

const
  GLoginAttempts = 3;

type
  TTelnetData = class(TObject)
  public
    Username, Password: String;
    HUserToken: cardinal;
  end;

  TIdTelnetNegotiateEvent = procedure(AThread: TIdPeerThread) of object;
  TAuthenticationEvent = procedure(AThread: TIdPeerThread;
   const AUsername, APassword: string; var AAuthenticated: Boolean) of object;

  TIdTelnetServer = class(TIdTCPServer)
  protected
    FLoginAttempts: Integer;
    FOnAuthentication: TAuthenticationEvent;
    FLoginMessage: String;
    FOnNegotiate: TIdTelnetNegotiateEvent;
  public
    constructor Create(AOwner: TComponent); override;
    function DoAuthenticate(AThread: TIdPeerThread; const AUsername, APassword: string)
     : boolean; virtual;
    procedure DoNegotiate(AThread: TIdPeerThread); virtual;
    procedure DoConnect(AThread: TIdPeerThread); override;
  published
    property DefaultPort default IdPORT_TELNET;
    property LoginAttempts: Integer read FLoginAttempts write FLoginAttempts Default GLoginAttempts;
    property LoginMessage: String read FLoginMessage write FLoginMessage;
    property OnAuthentication: TAuthenticationEvent read FOnAuthentication write FOnAuthentication;
    property OnNegotiate: TIdTelnetNegotiateEvent read FOnNegotiate write FOnNegotiate;
  end;

  EIdTelnetServerException = class(EIdException);
  EIdNoOnAuthentication = class(EIdTelnetServerException);

  EIdLoginException = class(EIdTelnetServerException);
  EIdMaxLoginAttempt = class(EIdLoginException);
  
implementation

uses
  SysUtils, IdResourceStrings;

constructor TIdTelnetServer.Create(AOwner: TComponent);
begin
  inherited;
  LoginAttempts := GLoginAttempts;
  LoginMessage := RSTELNETSRVWelcomeString;
  DefaultPort := IdPORT_TELNET;
end;

function TIdTelnetServer.DoAuthenticate;
begin
  if not assigned(OnAuthentication) then begin
    raise EIdNoOnAuthentication.Create(RSTELNETSRVNoAuthHandler);
  end;
  result := False;
  OnAuthentication(AThread, AUsername, APassword, result);
end;

procedure TIdTelnetServer.DoConnect(AThread: TIdPeerThread);
Var
  Data: TTelnetData;
  i: integer;
begin
  try
    inherited;
    // What's the meaning of this branch ??
    // The thread data shouldn't be created yet...
    // SG 18/10/00: Nope, the data could have been created in the OnConnect event handler
    //              That allows the programmer to extend the TTelnetData class.
    if AThread.Data = nil then begin
      AThread.Data := TTelnetData.Create;
    end;
    Data := AThread.Data as TTelnetData;
    // do protocol negotiation first
    DoNegotiate(AThread);
    // Welcome the user
    if length(LoginMessage) > 0 then
    begin
      AThread.Connection.WriteLn(LoginMessage);
      AThread.Connection.WriteLn('');
    end;
    // Only prompt for creditentials if there is an authentication handler
    if assigned(OnAuthentication) then
    begin
      // ask for username/password.
      for i := 1 to LoginAttempts do
      begin
        // UserName
        AThread.Connection.Write(RSTELNETSRVUsernamePrompt);
        Data.Username := AThread.Connection.InputLn;
        // Password
        AThread.Connection.Write(RSTELNETSRVPasswordPrompt);
        Data.Password := AThread.Connection.InputLn('*');
        AThread.Connection.WriteLn;
        // Check authentication
        if DoAuthenticate(AThread, Data.Username, Data.Password) then begin
          Break; // exit the loop
        end else begin
          AThread.Connection.WriteLn(RSTELNETSRVInvalidLogin); // translate
          if i = FLoginAttempts then begin
            raise EIdMaxLoginAttempt.Create(RSTELNETSRVMaxloginAttempt); // translate
          end;
        end;
      end;
    end;
  except
    on E: Exception do begin
      AThread.Connection.WriteLn(E.Message);
      AThread.Connection.Disconnect;
    end;
  end;
end;

procedure TIdTelnetServer.DoNegotiate(AThread: TIdPeerThread);
begin
  if assigned(FOnNegotiate) then begin
    FOnNegotiate(AThread);
  end;
end;

end.
