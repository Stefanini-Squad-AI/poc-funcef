unit uCtrlSimulaBenefXResult;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbSimulaBenefXResult;

Type
  TCtrlSimulaBenefXResult = class(TCmControlObject)
  private
    FCdsSimulaBenefXResult: TCMClientDataSet;
    FDbSimulaBenefXResult: TDbSimulaBenefXResult;
    procedure SetCdsSimulaBenefXResult(const Value: TCMClientDataSet);
    procedure SetDbSimulaBenefXResult(const Value: TDbSimulaBenefXResult);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbSimulaBenefXResult : TDbSimulaBenefXResult read FDbSimulaBenefXResult write SetDbSimulaBenefXResult;
    property CdsSimulaBenefXResult : TCMClientDataSet read FCdsSimulaBenefXResult write SetCdsSimulaBenefXResult;

    function SelecionaSimulaBenefXResult( iIdSimulaBenef, iIdResult : integer ) : OleVariant;
    function SelecionaPorSimulacao( iIdSimulaBenef : integer ) : OleVariant;
    function GravaSimulaBenefXResult : Boolean;

  published

end;

implementation

{ TCtrlSimulaBenefXResult }


procedure TCtrlSimulaBenefXResult.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbSimulaBenefXResult.DataBaseName    := DataBaseName
  else
    FDbSimulaBenefXResult.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlSimulaBenefXResult.Create;
begin
  inherited;
  FDbSimulaBenefXResult  := TDbSimulaBenefXResult.Create( self );
end;

destructor TCtrlSimulaBenefXResult.Destroy;
begin
  FDbSimulaBenefXResult.Free;
  if IsAppServer then FCdsSimulaBenefXResult.Free;
  inherited;
end;

function TCtrlSimulaBenefXResult.GravaSimulaBenefXResult: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarSimulaBenefXResult( CdsSimulaBenefXResult.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsSimulaBenefXResult, FDbSimulaBenefXResult, [], [] );

      Msg := FDbSimulaBenefXResult.MessageInfo;

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


procedure TCtrlSimulaBenefXResult.OnCreateAppServer;
begin
  inherited;
  FCdsSimulaBenefXResult := TCMClientDataSet.Create( nil );
end;

function TCtrlSimulaBenefXResult.SelecionaPorSimulacao( iIdSimulaBenef: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select    IDSIMULABENEF,                               ' +
   '           IDRESULT,                                     ' +
   '           ORDEM                                        ' +
   '   from    SIMULABENEFXRESULT                            ' +
   '  where    IDSIMULABENEF = ' + IntToStr( iIdSimulaBenef ) +
   '  order by ORDEM                                        ' );
end;

function TCtrlSimulaBenefXResult.SelecionaSimulaBenefXResult( iIdSimulaBenef, iIdResult : integer ) : OleVariant;
begin
  FDbSimulaBenefXResult.Idsimulabenef.AsInteger := iIdSimulaBenef;
  FDbSimulaBenefXResult.IdResult.AsInteger := iIdResult;
  Result := GetDataPacket( FDbSimulaBenefXResult.SSqlSelect );
end;

procedure TCtrlSimulaBenefXResult.SetCdsSimulaBenefXResult(
  const Value: TCMClientDataSet);
begin
  FCdsSimulaBenefXResult := Value;
end;

procedure TCtrlSimulaBenefXResult.SetDbSimulaBenefXResult(
  const Value: TDbSimulaBenefXResult);
begin
  FDbSimulaBenefXResult := Value;
end;

end.

