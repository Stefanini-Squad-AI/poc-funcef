unit uCtrlWebPessoa;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebPessoa;

Type
  TCtrlWebPessoa = class(TCmControlObject)
  private
    FCdsWebPessoa: TCMClientDataSet;
    FDbWebPessoa: TDbWebPessoa;
    procedure SetCdsWebPessoa(const Value: TCMClientDataSet);
    procedure SetDbWebPessoa(const Value: TDbWebPessoa);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebPessoa : TDbWebPessoa read FDbWebPessoa write SetDbWebPessoa;
    property CdsWebPessoa : TCMClientDataSet read FCdsWebPessoa write SetCdsWebPessoa;

    function SelecionaWebPessoa( iIdPessoa, iIdWebLogAlteracao : integer ) : OleVariant;
    function GravaWebPessoa : Boolean;

  published

end;

implementation

{ TCtrlWebPessoa }

constructor TCtrlWebPessoa.Create;
begin
  inherited;
  FDbWebPessoa  := TDbWebPessoa.Create( Self );
end;

destructor TCtrlWebPessoa.Destroy;
begin
  FDbWebPessoa.Free;
  if IsAppServer then FCdsWebPessoa.Free;
  inherited;
end;

procedure TCtrlWebPessoa.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebPessoa.DataBaseName    := DataBaseName
  else
    FDbWebPessoa.dbADOConnection := dbADOConnection;
end;

function TCtrlWebPessoa.GravaWebPessoa: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebPessoa( CdsWebPessoa.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebPessoa, FDbWebPessoa, [], [] );

      Msg := FDbWebPessoa.MessageInfo;

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

procedure TCtrlWebPessoa.OnCreateAppServer;
begin
  inherited;
  FCdsWebPessoa := TCMClientDataSet.Create( nil );
end;

function TCtrlWebPessoa.SelecionaWebPessoa(
  iIdPessoa, iIdWebLogAlteracao : integer ) : OleVariant;
begin
  if ConnectionSide = cnsClient then
    Result := Connection.AppServer.SelecionaWebPessoa( iIdPessoa, iIdWebLogAlteracao )
  else
  begin
    FDbWebPessoa.IdPessoa.AsInteger := iIdPessoa;
    FDbWebPessoa.IdWebLogAlteracao.AsInteger := iIdWebLogAlteracao;
    Result := GetDataPacket( FDbWebPessoa.SSqlSelect );
  end;
end;

procedure TCtrlWebPessoa.SetCdsWebPessoa(
  const Value: TCMClientDataSet);
begin
  FCdsWebPessoa := Value;
end;

procedure TCtrlWebPessoa.SetDbWebPessoa(
  const Value: TDbWebPessoa);
begin
  FDbWebPessoa := Value;
end;

end.

