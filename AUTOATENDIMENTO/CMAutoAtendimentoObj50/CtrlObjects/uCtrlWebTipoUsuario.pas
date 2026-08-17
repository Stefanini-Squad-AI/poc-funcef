unit uCtrlWebTipoUsuario;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebTipoUsuario;

Type
  TCtrlWebTipoUsuario = class(TCmControlObject)
  private
    FCdsWebTipoUsuario: TCMClientDataSet;
    FDbWebTipoUsuario: TDbWebTipoUsuario;
    procedure SetCdsWebTipoUsuario(const Value: TCMClientDataSet);
    procedure SetDbWebTipoUsuario(const Value: TDbWebTipoUsuario);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebTipoUsuario : TDbWebTipoUsuario read FDbWebTipoUsuario write SetDbWebTipoUsuario;
    property CdsWebTipoUsuario : TCMClientDataSet read FCdsWebTipoUsuario write SetCdsWebTipoUsuario;

    function SelecionaWebTipoUsuario( iIdWebTipoUsuario : integer ) : OleVariant;
    function SelecionaTodos : OleVariant;    
    function GravaWebTipoUsuario : Boolean;

  published

end;

implementation

{ TCtrlWebTipoUsuario }

constructor TCtrlWebTipoUsuario.Create;
begin
  inherited;
  FDbWebTipoUsuario  := TDbWebTipoUsuario.Create( Self );
end;

destructor TCtrlWebTipoUsuario.Destroy;
begin
  FDbWebTipoUsuario.Free;
  if IsAppServer then FCdsWebTipoUsuario.Free;
  inherited;
end;

procedure TCtrlWebTipoUsuario.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebTipoUsuario.DataBaseName    := DataBaseName
  else
    FDbWebTipoUsuario.dbADOConnection := dbADOConnection;
end;

function TCtrlWebTipoUsuario.GravaWebTipoUsuario: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebTipoUsuario( CdsWebTipoUsuario.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebTipoUsuario, FDbWebTipoUsuario, [], [] );

      Msg := FDbWebTipoUsuario.MessageInfo;

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

function TCtrlWebTipoUsuario.SelecionaTodos : OleVariant;
begin
  Result := GetDataPacket( ' select   IDTIPOUSUARIO,  ' +
                           '          DESCTIPOUSUARIO ' +
                           '   from   WEBTIPOUSUARIO  ' +
                           ' order by IDTIPOUSUARIO   ' );
end;

procedure TCtrlWebTipoUsuario.OnCreateAppServer;
begin
  inherited;
  FCdsWebTipoUsuario := TCMClientDataSet.Create( nil );
end;

function TCtrlWebTipoUsuario.SelecionaWebTipoUsuario( iIdWebTipoUsuario : integer ) : OleVariant;
begin
  if ConnectionSide = cnsClient then
    Result := Connection.AppServer.SelecionaWebTipoUsuario( iIdWebTipoUsuario )
  else
  begin
    FDbWebTipoUsuario.IdTipoUsuario.AsInteger := iIdWebTipoUsuario;
    Result := GetDataPacket( FDbWebTipoUsuario.SSqlSelect );
  end;
end;

procedure TCtrlWebTipoUsuario.SetCdsWebTipoUsuario(
  const Value: TCMClientDataSet);
begin
  FCdsWebTipoUsuario := Value;
end;

procedure TCtrlWebTipoUsuario.SetDbWebTipoUsuario(
  const Value: TDbWebTipoUsuario);
begin
  FDbWebTipoUsuario := Value;
end;

end.

