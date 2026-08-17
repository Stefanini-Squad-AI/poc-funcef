unit UCtrlGrpRegra;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCMTypes, uDbGrupoRegra;

Type

  TCtrlGrpRegra = class(TCmControlObject)
  private
    FCdsGrpRegra: TCMClientDataSet;
    FDbGrupoRegra: TDbGrupoRegra;
    FDbGrpRegra: TDbGrupoRegra;
    procedure SetCdsGrpRegra(const Value: TCMClientDataSet);
    procedure SetDbGrpRegra(const Value: TDbGrupoRegra);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbGrpRegra : TDbGrupoRegra     read FDbGrpRegra  write SetDbGrpRegra;
    property CdsGrpRegra : TCMClientDataSet read FCdsGrpRegra write SetCdsGrpRegra;

    function SelecionaGrpRegra( iIdGrpRegra : Integer ) : OleVariant;
    function ListaGrpRegra : OleVariant;
    function ExisteGrpRegra   ( iIdGrpRegra : Integer ) : Boolean;
    function GravaGrpRegra : Boolean;

  published

end;

implementation

{ TCtrlGrpRegra }

constructor TCtrlGrpRegra.Create;
begin
  inherited;
  FDbGrpRegra  := TDbGrupoRegra.Create(Self);
  FCdsGrpRegra := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlGrpRegra.Destroy;
begin
  FDbGrpRegra.Free;
  FCdsGrpRegra.Free;
  inherited;
end;

procedure TCtrlGrpRegra.DoChangeDataBase;
begin
  inherited;
  FDbGrpRegra.DataBaseName := Self.DataBaseName;
end;


function TCtrlGrpRegra.GravaGrpRegra: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarGrpRegra( CdsGrpRegra.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsGrpRegra, DbGrpRegra, [], [] );

      Msg := DbGrpRegra.MessageInfo;

      if not Result then raise Exception.Create( Msg );

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


procedure TCtrlGrpRegra.SetCdsGrpRegra(const Value: TCMClientDataSet);
begin
  FCdsGrpRegra := Value;
end;

procedure TCtrlGrpRegra.SetDbGrpRegra(const Value: TDbGrupoRegra);
begin
  FDbGrpRegra := Value;
end;

function TCtrlGrpRegra.SelecionaGrpRegra( iIdGrpRegra : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaGrpRegra( iIdGrpRegra );
  end else begin
    FDbGrpRegra.IdGruporegra.AsInteger := iIdGrpRegra;
    Result := GetDataPacket( FDbGrpRegra.SSqlSelect );
  end;
end;

function TCtrlGrpRegra.ExisteGrpRegra(iIdGrpRegra: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ExisteGrpRegra;
  end else begin
    FDbGrpRegra.IdGruporegra.AsInteger := iIdGrpRegra;
    CdsGrpRegra.Data := GetDataPacket( FDbGrpRegra.SSqlSelect );
    Result := Not CdsGrpRegra.IsEmpty;
  end;
end;

function TCtrlGrpRegra.ListaGrpRegra: OleVariant;
begin
  Result := GetDataPacket( 'SELECT * FROM GRUPOREGRA ORDER BY DESCRICAO' );
end;

end.

