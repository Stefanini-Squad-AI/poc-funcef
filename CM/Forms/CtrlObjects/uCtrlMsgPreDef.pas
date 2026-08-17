unit uCtrlMsgPreDef;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbMsgPreDef;

Type
  TCtrlMsgPreDef = class(TCmControlObject)
  private
    FCdsMsgPreDef: TCMClientDataSet;
    FDbMsgPreDef: TDbMsgPreDef;
    procedure SetCdsMsgPreDef(const Value: TCMClientDataSet);
    procedure SetDbMsgPreDef(const Value: TDbMsgPreDef);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbMsgPreDef : TDbMsgPreDef read FDbMsgPreDef write SetDbMsgPreDef;
    property CdsMsgPreDef : TCMClientDataSet read FCdsMsgPreDef write SetCdsMsgPreDef;

    function SelecionaMsgPreDef( iIdMsgPreDef : integer ) : OleVariant;
    function GravaMsgPreDef : Boolean;

    function ListaContextos( iIdModulo : integer ) : Olevariant;

    function SelecionaTags( iIdMsgContexto : integer ) : Olevariant;

    function RecuperaDescContexto( iIdMsgContexto : integer ) : string;
    function ExisteMsgParaContexto( iIdMsgPreDef, iIdMsgContexto: integer): boolean;

  published

end;

implementation

{ TCtrlMsgPreDef }

procedure TCtrlMsgPreDef.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbMsgPreDef.DataBaseName    := DataBaseName
  else
    FDbMsgPreDef.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlMsgPreDef.Create;
begin
  inherited;
  FDbMsgPreDef  := TDbMsgPreDef.Create( self );
end;

destructor TCtrlMsgPreDef.Destroy;
begin
  FDbMsgPreDef.Free;
  if IsAppServer then FCdsMsgPreDef.Free;
  inherited;
end;

function TCtrlMsgPreDef.ExisteMsgParaContexto( iIdMsgPreDef, iIdMsgContexto: integer): boolean;
var
  sSQL : string;
begin
  with TCMClientDataset.Create( nil ) do
  begin
    sSQL :=
     ' select count(*)             ' +
     ' from   msgpredef        p , ' +
     '        msgcontexto      c   ' +
     ' where  p.idmsgcontexto    =  c.idmsgcontexto ' +
     '   and  c.flgconfigpropria =  0 ' +
     '   and  c.idmsgcontexto    =  ' + IntToStr( iIdMsgContexto ) ;

    if iIdMsgPreDef > 0 then
      sSQL := sSQL +
       ' and  p.idmsgpredef <> ' + IntToStr( iIdMsgPreDef   );

    Data := GetDataPacket( sSQL );     
    Result := ( Fields[0].AsInteger >= 1 );
  end;
end;

function TCtrlMsgPreDef.GravaMsgPreDef: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarMsgPreDef( CdsMsgPreDef.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsMsgPreDef, FDbMsgPreDef, [], [] );

      Msg := FDbMsgPreDef.MessageInfo;

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


function TCtrlMsgPreDef.ListaContextos( iIdModulo : integer ) : Olevariant;
begin
  Result := GetDataPacket(
   ' select * from MSGCONTEXTO where IDMODULO = ' + IntToStr( iIdModulo ) );
end;

procedure TCtrlMsgPreDef.OnCreateAppServer;
begin
  inherited;
  FCdsMsgPreDef := TCMClientDataSet.Create( nil );
end;

function TCtrlMsgPreDef.RecuperaDescContexto( iIdMsgContexto: integer): string;
begin
  with TCMClientDataset.Create( nil ) do
  begin
    Data := GetDataPacket( ' select DESCRICAO from MSGCONTEXTO ' +
     ' where IDMSGCONTEXTO = ' + IntToStr( iIdMsgContexto ) );
    Result := FieldByName('DESCRICAO').AsString;
  end;
end;

function TCtrlMsgPreDef.SelecionaMsgPreDef( iIdMsgPreDef : integer ) : OleVariant;
begin
  FDbMsgPreDef.IdMsgPreDef.AsInteger := iIdMsgPreDef;
  Result := GetDataPacket( FDbMsgPreDef.SSqlSelect );
end;


function TCtrlMsgPreDef.SelecionaTags( iIdMsgContexto : integer ) : Olevariant;
begin
  Result := GetDataPacket(
   ' select * ' +
   ' from MSGPALAVRACHAVE ' +
   ' where IDMSGCONTEXTO = ' + IntToStr( iIdMsgContexto ) +
   ' or IDMSGCONTEXTO is null ' +
   ' order by TAG ' );
end;

procedure TCtrlMsgPreDef.SetCdsMsgPreDef( const Value: TCMClientDataSet);
begin
  FCdsMsgPreDef := Value;
end;

procedure TCtrlMsgPreDef.SetDbMsgPreDef(const Value: TDbMsgPreDef);
begin
  FDbMsgPreDef := Value;
end;

end.

