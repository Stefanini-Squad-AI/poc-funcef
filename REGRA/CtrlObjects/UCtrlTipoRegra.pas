unit UCtrlTipoRegra;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbTipoRegra;

Type

  TCtrlTipoRegra = class(TCmControlObject)
  private
    FCdsTipoRegra: TCMClientDataSet;
    FDbTipoRegra: TDbTipoRegra;
    procedure SetCdsTipoRegra(const Value: TCMClientDataSet);
    procedure SetDbTipoRegra(const Value: TDbTipoRegra);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbTipoRegra : TDbTipoRegra     read FDbTipoRegra  write SetDbTipoRegra;
    property CdsTipoRegra : TCMClientDataSet read FCdsTipoRegra write SetCdsTipoRegra;

    function ListaTipoRegra : OleVariant;
    function SelecionaTipoRegra( iIdTipoRegra : Integer ) : OleVariant;
    function ExisteTipoRegra   ( iIdTipoRegra : Integer ) : Boolean;
    function GravaTipoRegra : Boolean;

  published

end;

implementation

{ TCtrlTipoRegra }

constructor TCtrlTipoRegra.Create;
begin
  inherited;
  FDbTipoRegra  := TDbTipoRegra.Create(Self);
  FCdsTipoRegra := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlTipoRegra.Destroy;
begin
  FDbTipoRegra.Free;
  FCdsTipoRegra.Free;
  inherited;
end;

procedure TCtrlTipoRegra.DoChangeDataBase;
begin
  inherited;
  FDbTipoRegra.DataBaseName := Self.DataBaseName;
end;


function TCtrlTipoRegra.GravaTipoRegra: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarTipoRegra( CdsTipoRegra.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsTipoRegra, DbTipoRegra, [], [] );

      Msg := DbTipoRegra.MessageInfo;

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


procedure TCtrlTipoRegra.SetCdsTipoRegra(const Value: TCMClientDataSet);
begin
  FCdsTipoRegra := Value;
end;

procedure TCtrlTipoRegra.SetDbTipoRegra(const Value: TDbTipoRegra);
begin
  FDbTipoRegra := Value;
end;

function TCtrlTipoRegra.SelecionaTipoRegra( iIdTipoRegra : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaTipoRegra( iIdTipoRegra );
  end else begin
    FDbTipoRegra.IdTipoRegra.AsInteger := iIdTipoRegra;
    Result := GetDataPacket( FDbTipoRegra.SSqlSelect );
  end;
end;


function TCtrlTipoRegra.ExisteTipoRegra(iIdTipoRegra: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbTipoRegra.IdTipoRegra.AsInteger := iIdTipoRegra;
    CdsTipoRegra.Data := GetDataPacket( FDbTipoRegra.SSqlSelect );
    Result := Not CdsTipoRegra.IsEmpty;
  end;
end;

function TCtrlTipoRegra.ListaTipoRegra: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaTipoRegra;
  end else begin
    Result := GetDataPacket( 'SELECT * FROM TIPOREGRA ORDER BY DESCREGRA' );
  end;
end;

end.

