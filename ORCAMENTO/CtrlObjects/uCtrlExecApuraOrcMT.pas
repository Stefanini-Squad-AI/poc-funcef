{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcio Motta                    }
{ Atualizado Em: 24/06/2005                             }
{                                                       }
{*******************************************************}


unit uCtrlExecApuraOrcMT;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbFormOrcado, uDbFormasApuraOrc;

Type
  TCtrlExecApuraOrcMT = class(TCmControlObject)
  private
    FCdsExecApuraOrcMT: TCMClientDataSet;
    FDbFormOrcado:      TDbFormOrcado;
    FDbFormOrcadoDet:   TDbFormOrcadoDet;

    procedure SetCdsExecApuraOrcMT(const Value: TCMClientDataSet);
    procedure SetDbFormOrcado(const Value: TDbFormOrcado);
    procedure SetDbFormOrcadoDet(const Value: TDbFormOrcadoDet);

  protected

    procedure AfterInitialize; override;
    procedure OnCreateAppServer; override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbFormOrcado      : TDbFormOrcado    read FDbFormOrcado      write SetDbFormOrcado;
    property DbFormOrcadoDet   : TDbFormOrcadoDet read FDbFormOrcadoDet   write SetDbFormOrcadoDet;    
    property CdsExecApuraOrcMT : TCMClientDataSet read FCdsExecApuraOrcMT write SetCdsExecApuraOrcMT;

    function GravaExecApuraOrcMT : Boolean;

  published

end;

implementation

{ TCtrlExecApuraOrcMT }

procedure TCtrlExecApuraOrcMT.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    begin
      FDbFormOrcado.DataBaseName    := DataBaseName;
      FDbFormOrcadoDet.DataBaseName := DataBaseName;
    end
  else
    begin
      FDbFormOrcado.DbAdoConnection    := DbAdoConnection;
      FDbFormOrcadoDet.DbAdoConnection := DbAdoConnection;
    end;
end;


procedure TCtrlExecApuraOrcMT.OnCreateAppServer;
begin
  inherited;
  FCdsExecApuraOrcMT := TCMClientDataSet.Create( nil );
end;


constructor TCtrlExecApuraOrcMT.Create;
begin
  inherited;
  FDbFormOrcado    := TDbFormOrcado.Create(self);
  FDbFormOrcadoDet := TDbFormOrcadoDet.Create(self);
end;


destructor TCtrlExecApuraOrcMT.Destroy;
begin
  FDbFormOrcado.Free;
  FDbFormOrcadoDet.Free;

  if IsAppServer then
    FCdsExecApuraOrcMT.Free;

  inherited;
end;


function TCtrlExecApuraOrcMT.GravaExecApuraOrcMT: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
    begin
      Result := Connection.AppServer.GravarExecApuraOrcMT( CdsExecApuraOrcMT.Data );
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    begin
      try
        StartTransaction;

        Result := ApplyCds( FCdsExecApuraOrcMT, FDbFormOrcado, [], [] );

        Msg := FDbFormOrcado.MessageInfo;

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


procedure TCtrlExecApuraOrcMT.SetCdsExecApuraOrcMT(const Value: TCMClientDataSet);
begin
  FCdsExecApuraOrcMT := Value;
end;


procedure TCtrlExecApuraOrcMT.SetDbFormOrcado(const Value: TDbFormOrcado);
begin
  FDbFormOrcado := Value;
end;


procedure TCtrlExecApuraOrcMT.SetDbFormOrcadoDet(const Value: TDbFormOrcadoDet);
begin
  FDbFormOrcadoDet := Value;
end;




end.

