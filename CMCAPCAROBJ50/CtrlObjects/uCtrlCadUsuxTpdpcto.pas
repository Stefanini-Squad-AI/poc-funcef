unit uCtrlCadUsuxTpdpcto;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMTypes,
     uCMClientDataSet, uDbUsuarioxtpdocto;

type
  TCtrlCadUsuxTpdpcto = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
     _DbUsuarioxtpdocto : TDbUsuarioxtpdocto;
  Public
    _Cds : TClientDataSet;
    constructor Create;  Override;
    destructor  Destroy; Override;
    function    GravaCadUsuxTpdPcto : Boolean;
End;

implementation

{ TCtrlCadUsuxTpdpcto }

constructor TCtrlCadUsuxTpdpcto.Create;
begin
  inherited;
  _DbUsuarioxtpdocto := TDbUsuarioxtpdocto.Create(self);
end;

destructor TCtrlCadUsuxTpdpcto.Destroy;
begin
  _DbUsuarioxtpdocto.Free;
  if isAppServer then _Cds.Free;
  inherited;
end;

procedure TCtrlCadUsuxTpdpcto.DoChangeDataBase;
begin
  inherited;
  _DbUsuarioxtpdocto.DataBaseName := DataBaseName;
end;

function TCtrlCadUsuxTpdpcto.GravaCadUsuxTpdPcto: Boolean;
var
  Msg: string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaCadUsuxTpdPcto;
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(_Cds, _DbUsuarioxtpdocto, [], []);
      Msg := _DbUsuarioxtpdocto.MessageInfo;
      if not Result then
        raise Exception.create(Msg);
      Commit;
    except
      on E: Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrlCadUsuxTpdpcto.OnCreateAppServer;
begin
  inherited;
  _Cds := TCMClientDataSet.Create(nil);
end;

end.
