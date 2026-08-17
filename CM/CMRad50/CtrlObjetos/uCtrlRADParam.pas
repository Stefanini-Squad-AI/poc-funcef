unit uCtrlRADParam;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbRADParam, uDbEmailConexao;

Type
  TCtrlRADParam = class(TCmControlObject)
  private

    FCdsRADParam : TCMClientDataSet;
    FDbRADParam  : TDbRADParam;
    FDbEmailConexao: TDbEmailConexao;
    FCdsEmailConexao: TCMClientDataSet;
    procedure SetCdsRADParam(const Value: TCMClientDataSet);
    procedure SetDbRADParam(const Value: TDbRADParam);
    procedure SetDbEmailConexao(const Value: TDbEmailConexao);
    procedure SetCdsEmailConexao(const Value: TCMClientDataSet);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbRADParam : TDbRADParam read FDbRADParam write SetDbRADParam;
    property CdsRADParam : TCMClientDataSet read FCdsRADParam write SetCdsRADParam;
    property DbEmailConexao : TDbEmailConexao read FDbEmailConexao write SetDbEmailConexao;
    property CdsEmailConexao : TCMClientDataSet read FCdsEmailConexao write SetCdsEmailConexao;

    function SelecionaRADParam( iIdEmpresa : integer ) : OleVariant;
    procedure RecuperaConfigRAD;

    function Grava : boolean;

  published

end;

implementation

{ TCtrlRADParam }

procedure TCtrlRADParam.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
  begin
    FDbRADParam.DataBaseName     := DataBaseName;
    FDbEmailConexao.DataBaseName := DataBaseName;
  end
  else
  begin
    FDbRADParam.DbAdoConnection     := DbAdoConnection;
    FDbEmailConexao.DbAdoConnection := DbAdoConnection;
  end;
end;

constructor TCtrlRADParam.Create;
begin
  inherited;
  FDbRADParam     := TDbRADParam.Create( self );
  FDbEmailConexao := TDbEmailConexao.Create( self );
end;

destructor TCtrlRADParam.Destroy;
begin
  FDbRADParam.Free;
  FDbEmailConexao.Free;
  if IsAppServer then
  begin
    FCdsRADParam.Free;
    FCdsEmailConexao.Free;
  end;
  inherited;
end;


function TCtrlRADParam.Grava: boolean;
var
  iIdEmailConexao : integer;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Grava;
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
        Result := False;

      StartTransaction;

      if not FCdsEmailConexao.IsEmpty then
      begin
        {
        if FCdsEmailConexao.FieldByName('IDEMAILCONEXAO').AsInteger = 0 then
        begin
          iIdEmailConexao := GetSequence('EMAILCONEXAO');
          FCdsEmailConexao.Edit;
          FCdsEmailConexao.FieldByName('IDEMAILCONEXAO').AsInteger := iIdEmailConexao;
          FCdsEmailConexao.Post;
          FCdsRADParam.Edit;
          FCdsRADParam.FieldByName('IDEMAILCONEXAO').AsInteger := iIdEmailConexao;
          FCdsRADParam.Post;
        end;
        }

        if ApplyCds( FCdsEmailConexao, FDbEmailConexao, [], [] ) then
        begin
          if not FCdsEmailConexao.IsEmpty then
          begin
            FCdsRADParam.Edit;
            FCdsRADParam.FieldByName('IDEMAILCONEXAO').AsInteger := DbEmailConexao.Idemailconexao.AsInteger;
            FCdsRADParam.Post;
          end;
          Result := ApplyCds( FCdsRADParam, FDbRADParam, [], [] );
        end;

      end
      else
      begin
        FCdsRADParam.Edit;
        FCdsRADParam.FieldByName('IDEMAILCONEXAO').Clear;
        FCdsRADParam.Post;
        if ApplyCds( FCdsRADParam, FDbRADParam, [], [] ) then
          Result := ApplyCds( FCdsEmailConexao, FDbEmailConexao, [], [] );
      end;

      if Result then
        Commit
      else
        raise Exception.Create( MessageInfo );

   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
     end;
   end;
  end;
end;

procedure TCtrlRADParam.OnCreateAppServer;
begin
  inherited;
  FCdsRADParam     := TCMClientDataSet.Create( nil );
  FCdsEmailConexao := TCMClientDataSet.Create( nil );
end;

procedure TCtrlRADParam.RecuperaConfigRAD;
begin
  FCdsRADParam.Data := GetDataPacket( ' select * from RADPARAM ' );
  FCdsEmailConexao.Data := GetDataPacket( ' select * from EMAILCONEXAO ' +
   'where IDEMAILCONEXAO = ' + IntToStr( FCdsRADParam.FieldByName('IDEMAILCONEXAO').AsInteger ) );
end;

function TCtrlRADParam.SelecionaRADParam( iIdEmpresa : integer ) : OleVariant;
begin
  FDbRADParam.IdEmpresa.AsInteger := iIdEmpresa;
  Result := GetDataPacket( FDbRADParam.SSqlSelect );
end;

procedure TCtrlRADParam.SetCdsEmailConexao(const Value: TCMClientDataSet);
begin
  FCdsEmailConexao := Value;
end;

procedure TCtrlRADParam.SetCdsRADParam( const Value: TCMClientDataSet);
begin
  FCdsRADParam := Value;
end;

procedure TCtrlRADParam.SetDbEmailConexao(const Value: TDbEmailConexao);
begin
  FDbEmailConexao := Value;
end;

procedure TCtrlRADParam.SetDbRADParam(const Value: TDbRADParam);
begin
  FDbRADParam := Value;
end;

end.

