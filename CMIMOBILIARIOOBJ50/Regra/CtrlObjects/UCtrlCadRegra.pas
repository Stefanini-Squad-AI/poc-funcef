unit UCtrlCadRegra;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uSistema, uCMTypes, uDbRegra;

Type

  TCtrlCadRegra = class(TCmControlObject)
  private
    FCdsRegra: TCMClientDataSet;
    FDbRegra: TDbRegra;
    procedure SetCdsRegra(const Value: TCMClientDataSet);
    procedure SetDbRegra(const Value: TDbRegra);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbRegra  : TDbRegra         read FDbRegra  write SetDbRegra;
    property CdsRegra : TCMClientDataSet read FCdsRegra write SetCdsRegra;

    function SelecionaRegra( iIdRegra : Integer ) : OleVariant;
    function ListaRegra    (const iIdGrpRegra:Integer = -1; const iIdRegra:Integer = -1) : OleVariant;
    function ExisteRegra   ( iIdRegra : Integer ) : Boolean;
    function GravaRegra : Boolean;

  published

end;

implementation

{ TCtrlCadRegra }

constructor TCtrlCadRegra.Create;
begin
  inherited;
  FDbRegra  := TDbRegra.Create(Self);
  FCdsRegra := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlCadRegra.Destroy;
begin
  FDbRegra.Free;
  FCdsRegra.Free;
  inherited;
end;

procedure TCtrlCadRegra.DoChangeDataBase;
begin
  inherited;
  FDbRegra.DataBaseName := Self.DataBaseName;
end;


function TCtrlCadRegra.GravaRegra: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarRegra( CdsRegra.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsRegra, DbRegra, [], [] );

      Msg := DbRegra.MessageInfo;

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


procedure TCtrlCadRegra.SetCdsRegra(const Value: TCMClientDataSet);
begin
  FCdsRegra := Value;
end;

procedure TCtrlCadRegra.SetDbRegra(const Value: TDbRegra);
begin
  FDbRegra := Value;
end;

function TCtrlCadRegra.SelecionaRegra( iIdRegra : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaRegra( iIdRegra );
  end else begin
    FDbRegra.IdRegra.AsInteger := iIdRegra;
    Result := GetDataPacket( FDbRegra.SSqlSelect );
  end;
end;

function TCtrlCadRegra.ExisteRegra(iIdRegra: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ExisteRegra;
  end else begin
    FDbRegra.IdRegra.AsInteger := iIdRegra;
    CdsRegra.Data := GetDataPacket( FDbRegra.SSqlSelect );
    Result := Not CdsRegra.IsEmpty;
  end;
end;

function TCtrlCadRegra.ListaRegra (const iIdGrpRegra, iIdRegra:Integer): OleVariant;
var sSql, sParam : String;
begin
  // Define Parametros
  sParam := '';
  if iIdGrpRegra > 0 then sParam := sParam + ' AND GR.IDGRUPOREGRA = ' + IntToStr(iIdGrpRegra);
  if iIdRegra > 0    then sParam := sParam + ' AND R.IDREGRA       = ' + IntToStr(iIdRegra);

  // Define Sql
  sSql := 'SELECT R.IDREGRA, R.NOMEREGRA, R.DESCRICAOREGRA '+#13+
          '  FROM REGRA R,      '+#13+
          '       TIPOREGRA TR, '+#13+
          '       GRUPOREGRA GR '+#13+
          ' WHERE R.IDTIPOREGRA   = TR.IDTIPOREGRA  '+#13+
          '   AND TR.IDGRUPOREGRA = GR.IDGRUPOREGRA '+#13+ sParam +#13+
          'ORDER BY NOMEREGRA';

  Result := GetDataPacket( sSql );
end;

end.

