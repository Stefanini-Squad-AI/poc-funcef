unit uCtrlParamInvestimob;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbParamInvestimob;

type TCtrlParamInvestimob = class(TCMControlObject)

  private
    FCdsParamInvestimob: TCMClientDataSet;
    FDbParamInvestimob: TDbParamInvestimob;
    procedure SetCdsParamInvestimob(const Value: TCMClientDataSet);
    procedure SetDbParamInvestimob(const Value: TDbParamInvestimob);

  protected
    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public
    constructor Create;  override;
    destructor  Destroy; override;

    property DbParamInvestimob : TDbParamInvestimob read FDbParamInvestimob write SetDbParamInvestimob;
    property CdsParamInvestimob : TCMClientDataSet read FCdsParamInvestimob write SetCdsParamInvestimob;

    function SelecionaParamInvestimob(const iIdPessoa:Integer ) : OLEVariant;
    function GravaParamInvestimob : Boolean;

  published

end;

implementation

{ TCtrlParamInvestimob }

procedure TCtrlParamInvestimob.AfterInitialize;
begin
  inherited;
  FDbParamInvestimob.DataBaseName := DataBaseName;
end;

constructor TCtrlParamInvestimob.Create;
begin
  inherited;
  FDbParamInvestimob := TDbParamInvestimob.Create( Self );
end;

destructor TCtrlParamInvestimob.Destroy;
begin
  FreeAndNil(FDbParamInvestimob);
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FreeAndNil(FCdsParamInvestimob);
  inherited;
end;

function TCtrlParamInvestimob.GravaParamInvestimob: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaParamInvestimob( CdsParamInvestimob.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsParamInvestimob, DbParamInvestimob, [], [] );
      if not Result then raise Exception.Create( DbParamInvestimob.MessageInfo );

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrlParamInvestimob.OnCreateAppServer;
begin
  inherited;
  FCdsParamInvestimob := TCMClientDataSet.Create( nil );
end;

function TCtrlParamInvestimob.SelecionaParamInvestimob(const iIdPessoa: Integer): OLEVariant;
begin
  Result := GetDataPacket( 'SELECT * FROM PARAMINVESTIMOB WHERE IDPESSOA = ' + IntToStr(iIdPessoa) );
end;

procedure TCtrlParamInvestimob.SetCdsParamInvestimob(const Value: TCMClientDataSet);
begin
  FCdsParamInvestimob := Value;
end;

procedure TCtrlParamInvestimob.SetDbParamInvestimob(const Value: TDbParamInvestimob);
begin
  FDbParamInvestimob := Value;
end;

end.
