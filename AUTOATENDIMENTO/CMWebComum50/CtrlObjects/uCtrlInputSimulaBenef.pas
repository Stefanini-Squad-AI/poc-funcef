unit uCtrlInputSimulaBenef;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbInputSimulaBenef;

Type
  TCtrlInputSimulaBenef = class(TCmControlObject)
  private
    FCdsInputSimulaBenef: TCMClientDataSet;
    FDbInputSimulaBenef: TDbInputSimulaBenef;
    procedure SetCdsInputSimulaBenef(const Value: TCMClientDataSet);
    procedure SetDbInputSimulaBenef(const Value: TDbInputSimulaBenef);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbInputSimulaBenef : TDbInputSimulaBenef read FDbInputSimulaBenef write SetDbInputSimulaBenef;
    property CdsInputSimulaBenef : TCMClientDataSet read FCdsInputSimulaBenef write SetCdsInputSimulaBenef;

    function SelecionaInputSimulaBenef( iIdInput : integer ) : OleVariant;
    function RecuperaTitulo( iIdInput : integer ) : OleVariant;
    function GravaInputSimulaBenef( var iIdInput : integer ): Boolean;

  published

end;

implementation

{ TCtrlInputSimulaBenef }


procedure TCtrlInputSimulaBenef.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbInputSimulaBenef.DataBaseName    := DataBaseName
  else
    FDbInputSimulaBenef.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlInputSimulaBenef.Create;
begin
  inherited;
  FDbInputSimulaBenef  := TDbInputSimulaBenef.Create( self );
end;

destructor TCtrlInputSimulaBenef.Destroy;
begin
  FDbInputSimulaBenef.Free;
  if IsAppServer then FCdsInputSimulaBenef.Free;
  inherited;
end;

function TCtrlInputSimulaBenef.GravaInputSimulaBenef( var iIdInput : integer ): Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarInputSimulaBenef( CdsInputSimulaBenef.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsInputSimulaBenef, FDbInputSimulaBenef, [], [] );

      iIdInput := FDbInputSimulaBenef.IdInput.AsInteger;

      Msg := FDbInputSimulaBenef.MessageInfo;

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


procedure TCtrlInputSimulaBenef.OnCreateAppServer;
begin
  inherited;
  FCdsInputSimulaBenef := TCMClientDataSet.Create( nil );
end;

function TCtrlInputSimulaBenef.RecuperaTitulo(iIdInput: integer): OleVariant;
var
  cdsLocal : TCMClientDataSet;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket( 
     ' select TITULO                            ' +
     '   from INPUTSIMULABENEF                  ' +
     '  where IDINPUT = ' + IntToStr( iIdInput ) );

    Result := cdsLocal.FieldByName('TITULO').AsString;

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlInputSimulaBenef.SelecionaInputSimulaBenef( iIdInput : integer ) : OleVariant;
begin
  FDbInputSimulaBenef.IdInput.AsInteger := iIdInput;
  Result := GetDataPacket( FDbInputSimulaBenef.SSqlSelect );
end;

procedure TCtrlInputSimulaBenef.SetCdsInputSimulaBenef(
  const Value: TCMClientDataSet);
begin
  FCdsInputSimulaBenef := Value;
end;

procedure TCtrlInputSimulaBenef.SetDbInputSimulaBenef(
  const Value: TDbInputSimulaBenef);
begin
  FDbInputSimulaBenef := Value;
end;

end.

