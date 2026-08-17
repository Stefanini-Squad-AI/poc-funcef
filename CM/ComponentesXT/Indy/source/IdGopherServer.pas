unit IdGopherServer;

interface

{
2000-Apr-29 Pete Mee
 - Converted to new Indy format.
1999-Oct-03 Pete Mee
 - Gopher server is very basic... started & completed...
}

uses
  Classes,
  IdGlobal,
  IdTCPServer;

{Typical connection:
 - Client attaches with no data
 - Server accepts with no data
 - Client sends request with CR LF termate (CRLF only for root)
 - Server sends items available each with CRLF termating
 - Server sends .CRLF
 - Server close connection
}

Const
  Id_TIdGopherServer_TruncateUserFriendly = True;
  Id_TIdGopherServer_TruncateLength = 70;

Type
  TRequestEvent = procedure(AThread: TIdPeerThread;ARequest:String) of object;
  TPlusRequestEvent = procedure(AThread: TIdPeerThread;ARequest:String;
    APlusData : String) of object;

  TIdGopherServer = class(TIdTCPServer)
  private
    fAdminEmail : String;

    fOnRequest:TRequestEvent;
    fOnPlusRequest : TPlusRequestEvent;

    fTruncateUserFriendly : Boolean;
    fTruncateLength : Integer;
  protected
    function DoExecute(Thread : TIdPeerThread): boolean; override;
  public
    constructor Create(AOwner : TComponent); override;

    function ReturnGopherItem(ItemType : Char;
      UserFriendlyName, RealResourceName : String;
      HostServer : String; HostPort : Integer): String;
    procedure SendDirectoryEntry(Thread : TIdPeerThread;
      ItemType : Char; UserFriendlyName, RealResourceName : String;
      HostServer : String; HostPort : Integer);
    procedure SetTruncateUserFriendlyName(truncate : Boolean);
    procedure SetTruncateLength(length : Integer);
  published
    property AdminEmail : String read fAdminEmail write fAdminEmail;
    property OnRequest: TRequestEvent read fOnRequest write fOnRequest;
    property OnPlusRequest : TPlusRequestEvent read fOnPlusRequest
      write fOnPlusRequest;
    property TruncateUserFriendlyName : Boolean read fTruncateUserFriendly
      write SetTruncateUserFriendlyName default Id_TIdGopherServer_TruncateUserFriendly;
    property TruncateLength : Integer read fTruncateLength
      write SetTruncateLength default Id_TIdGopherServer_TruncateLength;
    property DefaultPort default IdPORT_GOPHER;
  end;

implementation

uses
  IdGopherConsts, IdResourceStrings,
  SysUtils;

constructor TIdGopherServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DefaultPort := IdPORT_GOPHER;
  fAdminEmail := '<gopher@domain.example>';
  FTruncateUserFriendly := Id_TIdGopherServer_TruncateUserFriendly;
  FTruncateLength := Id_TIdGopherServer_TruncateLength;
end;

function TIdGopherServer.DoExecute(Thread: TIdPeerThread): boolean;
var
   s : String;
   i : Integer;
begin
  result := true;
  with Thread.Connection do begin
    while Connected do begin
      try
        s:=ReadLn;
        i := Pos(TAB, s);
        if i > 0 then begin
          // Is a Gopher+ request
          if Assigned(OnPlusRequest) then begin
            OnPlusRequest(Thread, Copy(s, 1, i - 1), Copy(s, i + 1, length(s)));
          end else if Assigned(OnRequest) then begin
            OnRequest(Thread, s);
          end else begin
            Thread.Connection.Write(IdGopherPlusData_ErrorBeginSign
              + IdGopherPlusError_NotAvailable
              + RSGopherServerNoProgramCode + EOL
              + IdGopherPlusData_EndSign);
          end;
        end else if Assigned(OnRequest) then begin
           OnRequest(Thread, s)
        end else begin
            Thread.Connection.Write(RSGopherServerNoProgramCode
              + EOL + IdGopherPlusData_EndSign);
        end;
      except
        break;
      end;
      Thread.Connection.Disconnect;
    end;
  end;
end;

function TIdGopherServer.ReturnGopherItem(ItemType : Char;
  UserFriendlyName, RealResourceName : String;
  HostServer : String; HostPort : Integer): String;
begin
     if fTruncateUserFriendly then begin
        if (Length(UserFriendlyName) > fTruncateLength)
        and (fTruncateLength <> 0) then begin
            UserFriendlyName := Copy(UserFriendlyName, 1, fTruncateLength);
        end;
     end;
    result := ItemType + UserFriendlyName +
       TAB + RealResourceName + TAB + HostServer + TAB + IntToStr(HostPort);
end;

procedure TIdGopherServer.SendDirectoryEntry;
{
Format of server reply to directory (assume no spacing between - i.e.,
one line, with CR LF at the end)
 - Item Type
 - User Description (without tab characters)
 - Tab
 - Server-assigned string to this individual Item Type resource
 - Tab
 - Domain Name of host
 - Tab
 - Port # of host
}
begin
     Thread.Connection.WriteLn(ReturnGopherItem(ItemType, UserFriendlyName,
       RealResourceName, HostServer, HostPort));
end;

procedure TIdGopherServer.SetTruncateUserFriendlyName;
begin
     fTruncateUserFriendly := Truncate;
end;

procedure TIdGopherServer.SetTruncateLength;
begin
     fTruncateLength := Length;
end;

end.
