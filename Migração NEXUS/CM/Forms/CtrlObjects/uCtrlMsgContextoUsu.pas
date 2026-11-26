unit uCtrlMsgContextoUsu;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbMsgContextoUsu;

Type
  TCtrlMsgContextoUsu = class(TCmControlObject)
  private
    FCdsMsgContextoUsu: TCMClientDataSet;
    FDbMsgContextoUsu: TDbMsgContextoUsu;
    procedure SetCdsMsgContextoUsu(const Value: TCMClientDataSet);
    procedure SetDbMsgContextoUsu(const Value: TDbMsgContextoUsu);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbMsgContextoUsu : TDbMsgContextoUsu read FDbMsgContextoUsu write SetDbMsgContextoUsu;
    property CdsMsgContextoUsu : TCMClientDataSet read FCdsMsgContextoUsu write SetCdsMsgContextoUsu;

    function SelecionaMsgContextoUsu( iIdMsgContextoUsu, iIdPessoa : integer ) : OleVariant;
    function GravaMsgContextoUsu : Boolean;

    function RecuperaDestContexto( iIdMsgContextoUsu : integer ) : OLEVariant;

  published

end;

implementation

{ TCtrlMsgContextoUsu }

procedure TCtrlMsgContextoUsu.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbMsgContextoUsu.DataBaseName    := DataBaseName
  else
    FDbMsgContextoUsu.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlMsgContextoUsu.Create;
begin
  inherited;
  FDbMsgContextoUsu  := TDbMsgContextoUsu.Create( self );
end;

destructor TCtrlMsgContextoUsu.Destroy;
begin
  FDbMsgContextoUsu.Free;
  if IsAppServer then FCdsMsgContextoUsu.Free;
  inherited;
end;

function TCtrlMsgContextoUsu.GravaMsgContextoUsu: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarMsgContextoUsu( CdsMsgContextoUsu.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsMsgContextoUsu, FDbMsgContextoUsu, [], [] );

      Msg := FDbMsgContextoUsu.MessageInfo;

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


procedure TCtrlMsgContextoUsu.OnCreateAppServer;
begin
  inherited;
  FCdsMsgContextoUsu := TCMClientDataSet.Create( nil );
end;

function TCtrlMsgContextoUsu.RecuperaDestContexto( iIdMsgContextoUsu : integer ): OLEVariant;
begin
  Result := GetDataPacket(
   ' select m.IDMSGCONTEXTO,        ' +
   '        m.IDPESSOA,             ' +
   '        p.NOME,                 ' +
   '        p.EMAIL                 ' +
   ' from   MSGCONTEXTOUSU m,       ' +
   '        PESSOA         p        ' +
   ' where  m.IDPESSOA = p.IDPESSOA ' +
   '   and  m.IDMSGCONTEXTO = ' + IntToStr( iIdMsgContextoUsu ) );
end;

function TCtrlMsgContextoUsu.SelecionaMsgContextoUsu( iIdMsgContextoUsu, iIdPessoa : integer ) : OleVariant;
begin
  FDbMsgContextoUsu.IdMsgContexto.AsInteger := iIdMsgContextoUsu;
  FDbMsgContextoUsu.IdPessoa.AsInteger := iIdPessoa;
  Result := GetDataPacket( FDbMsgContextoUsu.SSqlSelect );
end;


procedure TCtrlMsgContextoUsu.SetCdsMsgContextoUsu( const Value: TCMClientDataSet);
begin
  FCdsMsgContextoUsu := Value;
end;

procedure TCtrlMsgContextoUsu.SetDbMsgContextoUsu(const Value: TDbMsgContextoUsu);
begin
  FDbMsgContextoUsu := Value;
end;

end.
