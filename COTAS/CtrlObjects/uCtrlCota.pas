unit uCtrlCota;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbCotaPerfil, uDbCota;

type TCtrlCota = class(TCMControlObject)

  private
    FCdsCotaPerfil: TCMClientDataSet;
    FDbCotaPerfil: TDbCotaPerfil;
    FCdsCota: TCMClientDataSet;
    FDbCota: TDbCota;
    procedure SetCdsCotaPerfil(const Value: TCMClientDataSet);
    procedure SetDbCotaPerfil(const Value: TDbCotaPerfil);
    procedure SetCdsCota(const Value: TCMClientDataSet);
    procedure SetDbCota(const Value: TDbCota);

  protected
    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    Mensagem : procedure( sMsg : string ) of object;

    constructor Create;  override;
    destructor  Destroy; override;

    // tabela COTAPERFIL
    property DbCotaPerfil : TDbCotaPerfil read FDbCotaPerfil write SetDbCotaPerfil;
    property CdsCotaPerfil : TCMClientDataSet read FCdsCotaPerfil write SetCdsCotaPerfil;

    // tabela COTA
    property DbCota : TDbCota read FDbCota write SetDbCota;
    property CdsCota : TCMClientDataSet read FCdsCota write SetCdsCota;

    function ListaCota(const iIdPlanoPrev: Integer = -1; const iIdCotaPerfil: integer = -1; const iIdCota:Integer = -1 ): OLEVariant;
    function ListaCotaPerfil(const iIdCotaPerfil:Integer = -1; const bPossuiCota: Boolean = False ): OLEVariant;

    function GravaCota : Boolean;
    function GravaCotaPerfil : Boolean;

  published

end;

implementation

{ TCtrlCota }

procedure TCtrlCota.AfterInitialize;
begin
  inherited;
  FDbCotaPerfil.DataBaseName := DataBaseName;
  FDbCota.DataBaseName := DataBaseName;
end;

constructor TCtrlCota.Create;
begin
  inherited;
  FDbCotaPerfil := TDbCotaPerfil.Create( Self );
  FDbCota := TDbCota.Create ( Self );
end;

destructor TCtrlCota.Destroy;
begin
  FreeAndNil (FDbCotaPerfil);
  FreeAndNil (FDbCota);
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil (FCdsCotaPerfil);
    FreeAndNil (FCdsCota);
  end;
  inherited;
end;

function TCtrlCota.GravaCota: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaCota( CdsCota.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsCota, DbCota, [], [] );
      if not Result then raise Exception.Create( DbCota.MessageInfo );

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

function TCtrlCota.GravaCotaPerfil: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaCotaPerfil( CdsCotaPerfil.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsCotaPerfil, DbCotaPerfil, [], [] );
      if not Result then raise Exception.Create( DbCotaPerfil.MessageInfo );

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

function TCtrlCota.ListaCota(const iIdPlanoPrev, iIdCotaPerfil,
  iIdCota: Integer): OLEVariant;
var
  sSql, sParam : string;
begin
  sParam := '';
  if iIdPlanoPrev  <> -1 then sParam := sParam + '   AND ( C.IDPLANOPREV  = ' + IntToStr (iIdPlanoPrev)  + ' ) '+ #13;
  if iIdCotaPerfil <> -1 then sParam := sParam + '   AND ( C.IDCOTAPERFIL = ' + IntToStr (iIdCotaPerfil) + ' ) '+ #13;
  if iIdCota       <> -1 then sParam := sParam + '   AND ( C.IDCOTA       = ' + IntToStr (iIdCota)       + ' ) '+ #13;

  sSql := 'SELECT ' + #13 +
          '   C.IDCOTA, C. IDPLANOPREV, C.IDCOTAPERFIL, C.DESCRICAO, ' + #13 +
          '   C.DATAPRIMEIRA, P.DESCRICAO AS DES_PERFIL, L.NOME AS DES_PLANOPREV ' + #13 +
          'FROM ' + #13 +
          '   COTA C, COTAPERFIL P, PLANPREV L ' + #13 +
          'WHERE ' + #13 +
          '   ( C.IDCOTAPERFIL = P.IDCOTAPERFIL ) ' + #13 +
          '   AND ( C.IDPLANOPREV = L.IDPLANOPREV ) ' + #13 +
          sParam +
          'ORDER BY ' + #13 +
          '   C.DESCRICAO ';

  Result := GetDataPacket ( sSql );
end;

function TCtrlCota.ListaCotaPerfil(const iIdCotaPerfil: Integer; const bPossuiCota: Boolean): OLEVariant;
var
  sSql, sParam : string;
begin
  // Define Parâmetros
  sParam := '';
  if iIdCotaPerfil <> -1 then sParam := sParam + ' AND IDCOTAPERFIL = ' + IntToStr(iIdCotaPerfil);
  if bPossuiCota         then sParam := sParam + ' AND IDCOTAPERFIL IN( SELECT DISTINCT IDCOTAPERFIL FROM COTA ) '; 

  sSql := 'SELECT IDCOTAPERFIL, DESCRICAO FROM COTAPERFIL ' +#13+
          ' WHERE 1=1 ' +#13+ sParam +#13+
          'ORDER BY DESCRICAO ';

  Result := GetDataPacket ( sSql );
end;

procedure TCtrlCota.OnCreateAppServer;
begin
  inherited;
  FCdsCotaPerfil := TCMClientDataSet.Create( nil );
  FCdsCota := TCMClientDataSet.Create( nil );
end;

procedure TCtrlCota.SetCdsCota(const Value: TCMClientDataSet);
begin
  FCdsCota := Value;
end;

procedure TCtrlCota.SetCdsCotaPerfil(const Value: TCMClientDataSet);
begin
  FCdsCotaPerfil := Value;
end;

procedure TCtrlCota.SetDbCota(const Value: TDbCota);
begin
  FDbCota := Value;
end;

procedure TCtrlCota.SetDbCotaPerfil(const Value: TDbCotaPerfil);
begin
  FDbCotaPerfil := Value;
end;

end.
