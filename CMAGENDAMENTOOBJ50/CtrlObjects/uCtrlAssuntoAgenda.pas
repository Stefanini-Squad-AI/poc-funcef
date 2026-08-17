unit uCtrlAssuntoAgenda;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbAssuntoAgenda;

Type
  TCtrlAssuntoAgenda = class(TCmControlObject)
  private
    FCdsAssuntoAgenda: TCMClientDataSet;
    FDbAssuntoAgenda: TDbAssuntoAgenda;
    procedure SetCdsAssuntoAgenda(const Value: TCMClientDataSet);
    procedure SetDbAssuntoAgenda(const Value: TDbAssuntoAgenda);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbAssuntoAgenda : TDbAssuntoAgenda read FDbAssuntoAgenda write SetDbAssuntoAgenda;
    property CdsAssuntoAgenda : TCMClientDataSet read FCdsAssuntoAgenda write SetCdsAssuntoAgenda;

    function SelecionaAssuntoAgenda( iIdAssuntoAgenda : integer ) : OleVariant;
    function GravaAssuntoAgenda : Boolean;

    function LookupAssunto : OLEVariant; 

  published

end;

implementation

{ TCtrlAssuntoAgenda }

procedure TCtrlAssuntoAgenda.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbAssuntoAgenda.DataBaseName    := DataBaseName
  else
    FDbAssuntoAgenda.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlAssuntoAgenda.Create;
begin
  inherited;
  FDbAssuntoAgenda  := TDbAssuntoAgenda.Create( self );
end;

destructor TCtrlAssuntoAgenda.Destroy;
begin
  inherited;
  FDbAssuntoAgenda.Free;
  if IsAppServer then FCdsAssuntoAgenda.Free;
end;

function TCtrlAssuntoAgenda.GravaAssuntoAgenda: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaAssuntoAgenda( CdsAssuntoAgenda.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds( FCdsAssuntoAgenda, FDbAssuntoAgenda, [], [] );
      Msg := FDbAssuntoAgenda.MessageInfo;
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

function TCtrlAssuntoAgenda.LookupAssunto: OLEVariant;
begin
  Result := GetDataPacket( ' select * from ASSUNTOAGENDA ' ); 
end;

procedure TCtrlAssuntoAgenda.OnCreateAppServer;
begin
  inherited;
  FCdsAssuntoAgenda := TCMClientDataSet.Create( nil );
end;

function TCtrlAssuntoAgenda.SelecionaAssuntoAgenda( iIdAssuntoAgenda: integer ): OleVariant;
begin
  FDbAssuntoAgenda.Idassuntoagenda.AsInteger := iIdAssuntoAgenda;
  Result := GetDataPacket( FDbAssuntoAgenda.SSqlSelect );
end;

procedure TCtrlAssuntoAgenda.SetCdsAssuntoAgenda( const Value: TCMClientDataSet );
begin
  FCdsAssuntoAgenda := Value;
end;

procedure TCtrlAssuntoAgenda.SetDbAssuntoAgenda( const Value: TDbAssuntoAgenda );
begin
  FDbAssuntoAgenda := Value;
end;

end.

