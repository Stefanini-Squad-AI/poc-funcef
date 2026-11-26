unit UCtrlMotivo;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbMotivo;

Type

  TCtrlMotivo = class(TCmControlObject)
  private
    FCdsMotivo: TCMClientDataSet;
    FDbMotivo: TDbMotivo;
    procedure SetCdsMotivo(const Value: TCMClientDataSet);
    procedure SetDbMotivo(const Value: TDbMotivo);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbMotivo : TDbMotivo     read FDbMotivo  write SetDbMotivo;
    property CdsMotivo : TCMClientDataSet read FCdsMotivo write SetCdsMotivo;

    function ListaMotivo : OleVariant;
    function SelecionaMotivo( iIdMotivo : Integer ) : OleVariant;
    function ExisteMotivo   ( iIdMotivo : Integer ) : Boolean;
    function GravaMotivo : Boolean;

  published

end;

implementation

{ TCtrlMotivo }

constructor TCtrlMotivo.Create;
begin
  inherited;
  FDbMotivo  := TDbMotivo.Create(Self);
  FCdsMotivo := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlMotivo.Destroy;
begin
  FDbMotivo.Free;
  FCdsMotivo.Free;
  inherited;
end;

procedure TCtrlMotivo.DoChangeDataBase;
begin
  inherited;

  FDbMotivo.DataBaseName := Self.DataBaseName;
  
end;


function TCtrlMotivo.GravaMotivo: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarMotivo( CdsMotivo.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsMotivo, DbMotivo, [], [] );

      Msg := DbMotivo.MessageInfo;

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


procedure TCtrlMotivo.SetCdsMotivo(const Value: TCMClientDataSet);
begin
  FCdsMotivo := Value;
end;

procedure TCtrlMotivo.SetDbMotivo(const Value: TDbMotivo);
begin
  FDbMotivo := Value;
end;

function TCtrlMotivo.SelecionaMotivo( iIdMotivo : Integer ): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaMotivo( iIdMotivo );
  end else begin
    FDbMotivo.IdMotivo.AsInteger := iIdMotivo;
    Result := GetDataPacket( FDbMotivo.SSqlSelect );
  end;
end;


function TCtrlMotivo.ExisteMotivo(iIdMotivo: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbMotivo.IdMotivo.AsInteger := iIdMotivo;
    CdsMotivo.Data := GetDataPacket( FDbMotivo.SSqlSelect );
    Result := Not CdsMotivo.IsEmpty;
  end;
end;

function TCtrlMotivo.ListaMotivo: OleVariant;
Var
  sSQL : String;
begin

  if ConnectionSide = cnsclient then begin

    Result := Connection.AppServer.ListaMotivo;

  end else begin

    sSQL := 'SELECT '+
            '  MTV.IDMOTIVO,     MTV.DESCRICAO,   MTV.IDMOVCONTRCAGED,  MTV.MOTIVORAIS, '+
            '  MTV.MOTIVOFGTS,   MTV.OBSERVACAO,  MTV.GRUPOMOTIVO,      MTV.FLGTIPO     '+
            'FROM '+
            '  MOTIVO MTV '+
            'ORDER BY '+
            '  MTV.DESCRICAO ';

    Result := GetDataPacket( sSQL );

  end;

end;

end.

