unit uCtrlGrupoAtende;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbGrupoAtende, Db;

Type
  TCtrlGrupoAtende = class(TCmControlObject)
  private
    FCdsGrupoAtende: TCMClientDataSet;
    FDbGrupoAtende: TDbGrupoAtende;
    procedure SetCdsGrupoAtende(const Value: TCMClientDataSet);
    procedure SetDbGrupoAtende(const Value: TDbGrupoAtende);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbGrupoAtende : TDbGrupoAtende read FDbGrupoAtende write SetDbGrupoAtende;
    property CdsGrupoAtende : TCMClientDataSet read FCdsGrupoAtende write SetCdsGrupoAtende;

    function SelecionaGrupoAtende( iIdGrupoAtende : integer ) : OleVariant;
    function GravaGrupoAtende( sListaIdAtendeAgenda : string )  : Boolean;
    function ExcluiGrupoAtende( iIdGrupoAtende : integer )  : Boolean;

    function LookupGrupoAtende : OLEVariant;

  published

end;

implementation

{ TCtrlGrupoAtende }

procedure TCtrlGrupoAtende.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbGrupoAtende.DataBaseName    := DataBaseName
  else
    FDbGrupoAtende.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlGrupoAtende.Create;
begin
  inherited;
  FDbGrupoAtende  := TDbGrupoAtende.Create( self );
end;

destructor TCtrlGrupoAtende.Destroy;
begin
  inherited;
  FDbGrupoAtende.Free;
  if IsAppServer then FCdsGrupoAtende.Free;
end;

function TCtrlGrupoAtende.ExcluiGrupoAtende( iIdGrupoAtende: integer): Boolean;
begin
  StartTransaction;
  try
    ExecSQL( ' update ATENDEAGENDA         ' +
             ' set    IDGRUPOATENDE = null ' +
             ' where  IDGRUPOATENDE = ' + IntToStr( iIdGrupoAtende ) );

    ExecSQL( ' delete from GRUPOATENDE     ' +
             ' where  IDGRUPOATENDE = ' + IntToStr( iIdGrupoAtende ) );

    Commit;

    Result := True;
  except
    on E : Exception do
    begin
      Result := False;
      Rollback;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlGrupoAtende.GravaGrupoAtende( sListaIdAtendeAgenda : string ) : Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaGrupoAtende( CdsGrupoAtende.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      if not FCdsGrupoAtende.FieldByName('IDGRUPOATENDE').IsNull then
        if not ExecSQL( ' update ATENDEAGENDA         ' +
                        ' set    IDGRUPOATENDE = null ' +
                        ' where  IDGRUPOATENDE = ' + FCdsGrupoAtende.FieldByName('IDGRUPOATENDE').AsString ) then
          raise Exception.Create( FDbGrupoAtende.MessageInfo );

      Result := ApplyCds( FCdsGrupoAtende, FDbGrupoAtende, [], [] );
      Msg := FDbGrupoAtende.MessageInfo;
      if not Result then raise Exception.Create( Msg );

      if sListaIdAtendeAgenda <> '' then
        Result := ExecSQL( ' update ATENDEAGENDA         ' +
                           ' set    IDGRUPOATENDE = ' + DbGrupoAtende.Idgrupoatende.AsString +
                           ' where  IDATENDEAGENDA in ( ' + sListaIdAtendeAgenda + ' ) ' );

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

function TCtrlGrupoAtende.LookupGrupoAtende: OLEVariant;
begin
  Result := GetDataPacket( ' select * from GRUPOATENDE ' );
end;

procedure TCtrlGrupoAtende.OnCreateAppServer;
begin
  inherited;
  FCdsGrupoAtende := TCMClientDataSet.Create( nil );
end;

function TCtrlGrupoAtende.SelecionaGrupoAtende( iIdGrupoAtende: integer ): OleVariant;
begin
  FDbGrupoAtende.IdGrupoAtende.AsInteger := iIdGrupoAtende;
  Result := GetDataPacket( FDbGrupoAtende.SSqlSelect );
end;

procedure TCtrlGrupoAtende.SetCdsGrupoAtende( const Value: TCMClientDataSet );
begin
  FCdsGrupoAtende := Value;
end;

procedure TCtrlGrupoAtende.SetDbGrupoAtende( const Value: TDbGrupoAtende );
begin
  FDbGrupoAtende := Value;
end;

end.

