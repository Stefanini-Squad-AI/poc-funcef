unit uCtrlParamImovel;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbParamImovel;

type TCtrlParamImovel = class(TCMControlObject)

  private
    FCdsParamImovel: TCMClientDataSet;
    FDbParamImovel: TDbParamImovel;
    procedure SetCdsParamImovel(const Value: TCMClientDataSet);
    procedure SetDbParamImovel(const Value: TDbParamImovel);

  protected
    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public
    constructor Create;  override;
    destructor  Destroy; override;

    property DbParamImovel : TDbParamImovel read FDbParamImovel write SetDbParamImovel;
    property CdsParamImovel : TCMClientDataSet read FCdsParamImovel write SetCdsParamImovel;

    function SelecionaParamImovel(const iIdPessoa:Integer ) : OLEVariant;
    function GravaParamImovel : Boolean;

  published

end;

implementation

{ TCtrlParamImovel }

procedure TCtrlParamImovel.AfterInitialize;
begin
  inherited;
  FDbParamImovel.DataBaseName := DataBaseName;
end;

constructor TCtrlParamImovel.Create;
begin
  inherited;
  FDbParamImovel := TDbParamImovel.Create( Self );
end;

destructor TCtrlParamImovel.Destroy;
begin
  FreeAndNil(FDbParamImovel);
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FreeAndNil(FCdsParamImovel);
  inherited;
end;

function TCtrlParamImovel.GravaParamImovel: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaParamImovel( CdsParamImovel.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsParamImovel, DbParamImovel, [], [] );
      if not Result then raise Exception.Create( DbParamImovel.MessageInfo );

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

procedure TCtrlParamImovel.OnCreateAppServer;
begin
  inherited;
  FCdsParamImovel := TCMClientDataSet.Create( nil );
end;

function TCtrlParamImovel.SelecionaParamImovel(const iIdPessoa: Integer): OLEVariant;
begin
  Result := GetDataPacket( 'SELECT * FROM PARAMIMOVEL WHERE IDPESSOA = ' + IntToStr(iIdPessoa) );
end;

procedure TCtrlParamImovel.SetCdsParamImovel(const Value: TCMClientDataSet);
begin
  FCdsParamImovel := Value;
end;

procedure TCtrlParamImovel.SetDbParamImovel(const Value: TDbParamImovel);
begin
  FDbParamImovel := Value;
end;

end.
