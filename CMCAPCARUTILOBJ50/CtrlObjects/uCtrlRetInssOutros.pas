unit uCtrlRetInssOutros;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbRetInssOutros;

Type
  TCtrlRetInssOutros = class(TCmControlObject)
  private
    FCdsRetInssOutros: TCMClientDataSet;
    FDbRetInssOutros: TDbRetInssOutros;
    procedure SetCdsRetInssOutros(const Value: TCMClientDataSet);
    procedure SetDbRetInssOutros(const Value: TDbRetInssOutros);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbRetInssOutros : TDbRetInssOutros read FDbRetInssOutros write SetDbRetInssOutros;
    property CdsRetInssOutros : TCMClientDataSet read FCdsRetInssOutros write SetCdsRetInssOutros;

    function SelecionaRetInssOutros( iIdPessoa : integer; sAnoMes : string ) : OleVariant;
    function SelecionaPorFornec( iIdPessoa : integer ) : OleVariant;
    function GravaRetInssOutros : Boolean;

  published

end;

implementation

{ TCtrlRetInssOutros }

constructor TCtrlRetInssOutros.Create;
begin
  inherited;
  FDbRetInssOutros  := TDbRetInssOutros.Create( Self );
end;

destructor TCtrlRetInssOutros.Destroy;
begin
  FDbRetInssOutros.Free;
  if IsAppServer then FCdsRetInssOutros.Free;
  inherited;
end;

procedure TCtrlRetInssOutros.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbRetInssOutros.DataBaseName    := DataBaseName
  else
    FDbRetInssOutros.dbADOConnection := dbADOConnection;
end;

function TCtrlRetInssOutros.GravaRetInssOutros: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarRetInssOutros( CdsRetInssOutros.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsRetInssOutros, FDbRetInssOutros, [], [] );

      Msg := FDbRetInssOutros.MessageInfo;

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

procedure TCtrlRetInssOutros.OnCreateAppServer;
begin
  inherited;
  FCdsRetInssOutros := TCMClientDataSet.Create( nil );
end;

function TCtrlRetInssOutros.SelecionaRetInssOutros( iIdPessoa : integer; sAnoMes : string ) : OleVariant;
begin
  if ConnectionSide = cnsClient then
    Result := Connection.AppServer.SelecionaRetInssOutros( iIdPessoa, sAnoMes )
  else
  begin
    FDbRetInssOutros.IdPessoa.AsInteger := iIdPessoa;
    FDbRetInssOutros.AnoMes.AsString := sAnoMes;    
    Result := GetDataPacket( FDbRetInssOutros.SSqlSelect );
  end;
end;

procedure TCtrlRetInssOutros.SetCdsRetInssOutros(
  const Value: TCMClientDataSet);
begin
  FCdsRetInssOutros := Value;
end;

procedure TCtrlRetInssOutros.SetDbRetInssOutros(
  const Value: TDbRetInssOutros);
begin
  FDbRetInssOutros := Value;
end;

function TCtrlRetInssOutros.SelecionaPorFornec( iIdPessoa: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select   IDPESSOA,                                                  ' +
   '          ANOMES,                                                    ' +
   '          VLRETIDO,                                                  ' +
   '          substr( ANOMES, 5, 2 ) || substr( ANOMES, 1, 4 ) as MESANO ' +
   ' from     RETINSSOUTROS                                              ' +
   ' where    IDPESSOA = ' + IntToStr( iIdPessoa )                         +
   ' order by 1, 2                                                       ' );
end;

end.

