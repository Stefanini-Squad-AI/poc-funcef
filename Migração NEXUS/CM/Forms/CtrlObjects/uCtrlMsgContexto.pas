unit uCtrlMsgContexto;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbMsgContexto;

Type
  TCtrlMsgContexto = class(TCmControlObject)
  private
    FCdsMsgContexto: TCMClientDataSet;
    FDbMsgContexto: TDbMsgContexto;
    procedure SetCdsMsgContexto(const Value: TCMClientDataSet);
    procedure SetDbMsgContexto(const Value: TDbMsgContexto);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbMsgContexto : TDbMsgContexto read FDbMsgContexto write SetDbMsgContexto;
    property CdsMsgContexto : TCMClientDataSet read FCdsMsgContexto write SetCdsMsgContexto;

    function SelecionaMsgContexto( iIdMsgContexto : integer ) : OleVariant;
    function GravaMsgContexto : Boolean;

    function ListaContextosSemConfigPropria( iIdModulo : integer ) : Olevariant;
    function RecuperaMsgPreDefPeloContexto( iIdmsgContexto : integer ) : string;

    function MsgDescricao( iIdMsgContexto: integer): string;

  published

end;

implementation

{ TCtrlMsgContexto }

procedure TCtrlMsgContexto.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbMsgContexto.DataBaseName    := DataBaseName
  else
    FDbMsgContexto.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlMsgContexto.Create;
begin
  inherited;
  FDbMsgContexto  := TDbMsgContexto.Create( self );
end;

destructor TCtrlMsgContexto.Destroy;
begin
  FDbMsgContexto.Free;
  if IsAppServer then FCdsMsgContexto.Free;
  inherited;
end;

function TCtrlMsgContexto.MsgDescricao( iIdMsgContexto: integer): string;
var
  sSQL : string;
begin
  with TCMClientDataset.Create( nil ) do
  begin
    sSQL :=
     ' select c.descricao          ' +
     ' from   msgpredef        p , ' +
     '        msgcontexto      c   ' +
     ' where  p.idmsgcontexto    =  c.idmsgcontexto ' +
     '   and  c.flgconfigpropria =  0 ' +
     '   and  c.idmsgcontexto    =  ' + IntToStr( iIdMsgContexto ) ;
    Data := GetDataPacket( sSQL );
    Result := Fields[0].AsString ;
  end;
end;

function TCtrlMsgContexto.GravaMsgContexto: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarMsgContexto( CdsMsgContexto.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsMsgContexto, FDbMsgContexto, [], [] );

      Msg := FDbMsgContexto.MessageInfo;

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


function TCtrlMsgContexto.ListaContextosSemConfigPropria( iIdModulo : integer ) : Olevariant;
begin
  Result := GetDataPacket(
   ' select * from MSGCONTEXTO where IDMODULO = ' + IntToStr( iIdModulo ) + ' and FLGCONFIGPROPRIA = 0 ' );
end;

procedure TCtrlMsgContexto.OnCreateAppServer;
begin
  inherited;
  FCdsMsgContexto := TCMClientDataSet.Create( nil );
end;

function TCtrlMsgContexto.SelecionaMsgContexto( iIdMsgContexto : integer ) : OleVariant;
begin
  FDbMsgContexto.IdMsgContexto.AsInteger := iIdMsgContexto;
  Result := GetDataPacket( FDbMsgContexto.SSqlSelect );
end;


procedure TCtrlMsgContexto.SetCdsMsgContexto( const Value: TCMClientDataSet);
begin
  FCdsMsgContexto := Value;
end;

procedure TCtrlMsgContexto.SetDbMsgContexto(const Value: TDbMsgContexto);
begin
  FDbMsgContexto := Value;
end;

function TCtrlMsgContexto.RecuperaMsgPreDefPeloContexto(
  iIdmsgContexto: integer): string;
begin
  with TCMClientDataset.Create( nil ) do
  begin
    Data := GetDataPacket( ' select DESCRICAO from MSGPREDEF ' +
     ' where IDMSGCONTEXTO = ' + IntToStr( iIdMsgContexto ) );
    Result := FieldByName('DESCRICAO').AsString;
  end;
end;

end.

