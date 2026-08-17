unit uCtrlWebEndPess;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebEndPess, uCmFileUtils;

Type
  TCtrlWebEndPess = class(TCmControlObject)
  private
    FCdsWebEndPess: TCMClientDataSet;
    FDbWebEndPess: TDbWebEndPess;
    procedure SetCdsWebEndPess(const Value: TCMClientDataSet);
    procedure SetDbWebEndPess(const Value: TDbWebEndPess);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebEndPess : TDbWebEndPess read FDbWebEndPess write SetDbWebEndPess;
    property CdsWebEndPess : TCMClientDataSet read FCdsWebEndPess write SetCdsWebEndPess;

    function SelecionaWebEndPess( iIdEndereco, iIdWebLogAlteracao : integer ) : OleVariant;
    function GravaWebEndPess : Boolean;

  published

end;

implementation

{ TCtrlWebEndPess }

constructor TCtrlWebEndPess.Create;
begin
  inherited;
  FDbWebEndPess  := TDbWebEndPess.Create( Self );
end;

destructor TCtrlWebEndPess.Destroy;
begin
  FDbWebEndPess.Free;
  if IsAppServer then FCdsWebEndPess.Free;
  inherited;
end;

procedure TCtrlWebEndPess.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebEndPess.DataBaseName    := DataBaseName
  else
    FDbWebEndPess.dbADOConnection := dbADOConnection;
end;

function TCtrlWebEndPess.GravaWebEndPess: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebEndPess( CdsWebEndPess.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebEndPess, FDbWebEndPess, [], [] );

      Msg := FDbWebEndPess.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

procedure TCtrlWebEndPess.OnCreateAppServer;
begin
  inherited;
  FCdsWebEndPess := TCMClientDataSet.Create( nil );
end;

function TCtrlWebEndPess.SelecionaWebEndPess(
  iIdEndereco, iIdWebLogAlteracao : integer ) : OleVariant;
begin
  if ConnectionSide = cnsClient then
    Result := Connection.AppServer.SelecionaWebEndPess( iIdEndereco, iIdWebLogAlteracao )
  else
  begin
    FDbWebEndPess.IdPessoa.AsInteger := iIdEndereco;
    FDbWebEndPess.IdWebLogAlteracao.AsInteger := iIdWebLogAlteracao;
    Result := GetDataPacket( FDbWebEndPess.SSqlSelect );
  end;
end;

procedure TCtrlWebEndPess.SetCdsWebEndPess(
  const Value: TCMClientDataSet);
begin
  FCdsWebEndPess := Value;
end;

procedure TCtrlWebEndPess.SetDbWebEndPess(
  const Value: TDbWebEndPess);
begin
  FDbWebEndPess := Value;
end;

end.

