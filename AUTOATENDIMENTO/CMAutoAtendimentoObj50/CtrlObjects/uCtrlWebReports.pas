unit uCtrlWebReports;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebReports, JCLSysUtils;

Type
  TCtrlWebReports = class(TCmControlObject)
  private
    FCdsWebReports: TCMClientDataSet;
    FDbWebReports: TDbWebReports;
    procedure SetCdsWebReports(const Value: TCMClientDataSet);
    procedure SetDbWebReports(const Value: TDbWebReports);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebReports : TDbWebReports read FDbWebReports write SetDbWebReports;
    property CdsWebReports : TCMClientDataSet read FCdsWebReports write SetCdsWebReports;

    function SelecionaWebReports( iIdWebReports, iIdWebInterface : integer ) : OleVariant;
    function GravaWebReports : Boolean;
    //Pendência 19090
    function ExcluiWebReports( iIdWebReports : integer ): Boolean;
    //Fim Pendência 19090

  published

end;

implementation

{ TCtrlWebReports }

procedure TCtrlWebReports.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebReports.DataBaseName    := DataBaseName
  else
    FDbWebReports.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlWebReports.Create;
begin
  inherited;
  FDbWebReports  := TDbWebReports.Create( self );
end;

destructor TCtrlWebReports.Destroy;
begin
  FDbWebReports.Free;
  if IsAppServer then FCdsWebReports.Free;
  inherited;
end;

function TCtrlWebReports.GravaWebReports: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebReports( CdsWebReports.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebReports, FDbWebReports, [], [] );

      Msg := FDbWebReports.MessageInfo;

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


procedure TCtrlWebReports.OnCreateAppServer;
begin
  inherited;
  FCdsWebReports := TCMClientDataSet.Create( nil );
end;

function TCtrlWebReports.SelecionaWebReports( iIdWebReports, iIdWebInterface : integer ) : OleVariant;
begin
  FDbWebReports.IdWebReports.AsInteger   := iIdWebReports;
  FDbWebReports.IdWebInterface.AsInteger := iIdWebInterface;
  Result := GetDataPacket( FDbWebReports.SSqlSelect );
end;

procedure TCtrlWebReports.SetCdsWebReports(
  const Value: TCMClientDataSet);
begin
  FCdsWebReports := Value;
end;

procedure TCtrlWebReports.SetDbWebReports(
  const Value: TDbWebReports);
begin
  FDbWebReports := Value;
end;

//Pendência 19090
function TCtrlWebReports.ExcluiWebReports( iIdWebReports : integer ): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExcluiWebReports( iIdWebReports );
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
      try
         Result := ExecSQL(
                   ' delete WEBREPORTS     ' +
                   ' where  IDWEBREPORTS = ' + IntToStr( iIdWebReports ) );
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
end;
//Fim Pendência 19090

end.

