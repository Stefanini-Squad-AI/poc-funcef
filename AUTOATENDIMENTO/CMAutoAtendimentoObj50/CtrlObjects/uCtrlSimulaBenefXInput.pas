unit uCtrlSimulaBenefXInput;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbSimulaBenefXInput;

Type
  TCtrlSimulaBenefXInput = class(TCmControlObject)
  private
    FCdsSimulaBenefXInput: TCMClientDataSet;
    FDbSimulaBenefXInput: TDbSimulaBenefXInput;
    procedure SetCdsSimulaBenefXInput(const Value: TCMClientDataSet);
    procedure SetDbSimulaBenefXInput(const Value: TDbSimulaBenefXInput);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbSimulaBenefXInput : TDbSimulaBenefXInput read FDbSimulaBenefXInput write SetDbSimulaBenefXInput;
    property CdsSimulaBenefXInput : TCMClientDataSet read FCdsSimulaBenefXInput write SetCdsSimulaBenefXInput;

    function SelecionaSimulaBenefXInput( iIdSimulaBenef, iIdInput : integer ) : OleVariant;
    function SelecionaPorSimulacao( iIdSimulaBenef : integer ) : OleVariant;
    function GravaSimulaBenefXInput : Boolean;

  published

end;

implementation

{ TCtrlSimulaBenefXInput }


procedure TCtrlSimulaBenefXInput.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbSimulaBenefXInput.DataBaseName    := DataBaseName
  else
    FDbSimulaBenefXInput.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlSimulaBenefXInput.Create;
begin
  inherited;
  FDbSimulaBenefXInput  := TDbSimulaBenefXInput.Create( self );
end;

destructor TCtrlSimulaBenefXInput.Destroy;
begin
  FDbSimulaBenefXInput.Free;
  if IsAppServer then FCdsSimulaBenefXInput.Free;
  inherited;
end;

function TCtrlSimulaBenefXInput.GravaSimulaBenefXInput: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarSimulaBenefXInput( CdsSimulaBenefXInput.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsSimulaBenefXInput, FDbSimulaBenefXInput, [], [] );

      Msg := FDbSimulaBenefXInput.MessageInfo;

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


procedure TCtrlSimulaBenefXInput.OnCreateAppServer;
begin
  inherited;
  FCdsSimulaBenefXInput := TCMClientDataSet.Create( nil );
end;

function TCtrlSimulaBenefXInput.SelecionaPorSimulacao( iIdSimulaBenef: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select    IDSIMULABENEF,                               ' +
   '           IDINPUT,                                     ' +
   '           ORDEM                                        ' +
   '   from    SIMULABENEFXINPUT                            ' +
   '  where    IDSIMULABENEF = ' + IntToStr( iIdSimulaBenef ) +
   '  order by ORDEM                                        ' );
end;

function TCtrlSimulaBenefXInput.SelecionaSimulaBenefXInput( iIdSimulaBenef, iIdInput : integer ) : OleVariant;
begin
  FDbSimulaBenefXInput.Idsimulabenef.AsInteger := iIdSimulaBenef;
  FDbSimulaBenefXInput.IdInput.AsInteger := iIdInput;
  Result := GetDataPacket( FDbSimulaBenefXInput.SSqlSelect );
end;

procedure TCtrlSimulaBenefXInput.SetCdsSimulaBenefXInput(
  const Value: TCMClientDataSet);
begin
  FCdsSimulaBenefXInput := Value;
end;

procedure TCtrlSimulaBenefXInput.SetDbSimulaBenefXInput(
  const Value: TDbSimulaBenefXInput);
begin
  FDbSimulaBenefXInput := Value;
end;

end.

