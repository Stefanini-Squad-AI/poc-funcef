unit uCtrlResultSimulaBenef;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbResultSimulaBenef;

Type
  TCtrlResultSimulaBenef = class(TCmControlObject)
  private
    FCdsResultSimulaBenef: TCMClientDataSet;
    FDbResultSimulaBenef: TDbResultSimulaBenef;
    procedure SetCdsResultSimulaBenef(const Value: TCMClientDataSet);
    procedure SetDbResultSimulaBenef(const Value: TDbResultSimulaBenef);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbResultSimulaBenef : TDbResultSimulaBenef read FDbResultSimulaBenef write SetDbResultSimulaBenef;
    property CdsResultSimulaBenef : TCMClientDataSet read FCdsResultSimulaBenef write SetCdsResultSimulaBenef;

    function SelecionaResultSimulaBenef( iIdResult : integer ) : OleVariant;
    function RecuperaTitulo( iIdResult : integer ) : OleVariant;
    function GravaResultSimulaBenef( var iIdResult : integer ) : Boolean;

  published

end;

implementation

{ TCtrlResultSimulaBenef }


procedure TCtrlResultSimulaBenef.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbResultSimulaBenef.DataBaseName    := DataBaseName
  else
    FDbResultSimulaBenef.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlResultSimulaBenef.Create;
begin
  inherited;
  FDbResultSimulaBenef  := TDbResultSimulaBenef.Create( self );
end;

destructor TCtrlResultSimulaBenef.Destroy;
begin
  FDbResultSimulaBenef.Free;
  if IsAppServer then FCdsResultSimulaBenef.Free;
  inherited;
end;

function TCtrlResultSimulaBenef.GravaResultSimulaBenef( var iIdResult : integer ): Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarResultSimulaBenef( CdsResultSimulaBenef.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsResultSimulaBenef, FDbResultSimulaBenef, [], [] );

      iIdResult := FDbResultSimulaBenef.IdResult.AsInteger;

      Msg := FDbResultSimulaBenef.MessageInfo;

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


procedure TCtrlResultSimulaBenef.OnCreateAppServer;
begin
  inherited;
  FCdsResultSimulaBenef := TCMClientDataSet.Create( nil );
end;

function TCtrlResultSimulaBenef.RecuperaTitulo(iIdResult: integer): OleVariant;
var
  cdsLocal : TCMClientDataSet;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket( 
     ' select TITULO                            ' +
     '   from RESULTSIMULABENEF                  ' +
     '  where IDRESULT = ' + IntToStr( iIdResult ) );

    Result := cdsLocal.FieldByName('TITULO').AsString;

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlResultSimulaBenef.SelecionaResultSimulaBenef( iIdResult : integer ) : OleVariant;
begin
  FDbResultSimulaBenef.IdResult.AsInteger := iIdResult;
  Result := GetDataPacket( FDbResultSimulaBenef.SSqlSelect );
end;

procedure TCtrlResultSimulaBenef.SetCdsResultSimulaBenef(
  const Value: TCMClientDataSet);
begin
  FCdsResultSimulaBenef := Value;
end;

procedure TCtrlResultSimulaBenef.SetDbResultSimulaBenef(
  const Value: TDbResultSimulaBenef);
begin
  FDbResultSimulaBenef := Value;
end;

end.

