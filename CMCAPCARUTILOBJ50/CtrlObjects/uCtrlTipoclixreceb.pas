unit uCtrlTipoclixreceb;

interface

Uses sysutils, uCmControlObject, uDbTipoclixreceb, uCmDbObject, uSistema, DB, uDataBase,
DbClient, uCMTypes ;

type
  TCtrlTipoclixreceb = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer;override;
  private
    _DbTipoclixreceb : TDbTipoclixreceb;
    Fcds   : TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    function GravarTipoclixreceb: Boolean;
End;


implementation

{ TCtrlTipoclixreceb }

function TCtrlTipoclixreceb.GravarTipoclixreceb: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarTipoclixreceb(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbTipoclixreceb,[],[]);
        Msg    := _DbTipoclixreceb.MessageInfo;

        If Not Result Then Raise Exception.create(Msg);
          Commit;
     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

constructor TCtrlTipoclixreceb.Create;
begin
  inherited;
  _DbTipoclixreceb := TDbTipoclixreceb.Create(self);
end;

destructor TCtrlTipoclixreceb.Destroy;
begin
  _DbTipoclixreceb.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlTipoclixreceb.DoChangeDataBase;
begin
  inherited;
  _DbTipoclixreceb.DataBaseName := DataBaseName;
end;

procedure TCtrlTipoclixreceb.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlTipoclixreceb.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

end.
