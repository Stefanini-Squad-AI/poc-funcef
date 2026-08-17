unit uCtrlPaisEstadoTeste;

interface
Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uCmTypes, uDbEstadoTeste, uDbPaisTeste;

Type
  TCtrlPaisEstadoTeste = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
    procedure OnCreateAppServer; Override;
  private
    FcdsEstadoTeste: TClientDataSet;
    FcdsPaisTeste: TClientDataSet;
    FDbEstadoTeste: TDbEstadoTeste;
    FDbPaisTeste: TDbPaisTeste;
    procedure SetcdsEstadoTeste(const Value: TClientDataSet);
    procedure SetcdsPaisTeste(const Value: TClientDataSet);
    procedure SetDbEstadoTeste(const Value: TDbEstadoTeste);
    procedure SetDbPaisTeste(const Value: TDbPaisTeste);
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------

  Public
    Property cdsEstadoTeste : TClientDataSet read FcdsEstadoTeste write SetcdsEstadoTeste;
    Property cdsPaisTeste : TClientDataSet read FcdsPaisTeste write SetcdsPaisTeste;

    property DbEstadoTeste: TDbEstadoTeste read FDbEstadoTeste write SetDbEstadoTeste;
    property DbPaisTeste: TDbPaisTeste read FDbPaisTeste write SetDbPaisTeste;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Function  ListaEstado( const iIdPais: integer = -1; const iIdEstado: integer = -1 ): OleVariant;
    Function  ListaPais  ( const iIdPais: integer = -1 ): OleVariant;

    Function  GravarEstado: Boolean;
    Function  GravarPaisEstado: Boolean;
    Function  ExcluiPaisEstado: Boolean;
  End;

implementation

{ TCtrlPaisEstadoTeste }

constructor TCtrlPaisEstadoTeste.Create;
begin
  inherited;
  FDbEstadoTeste := TDbEstadoTeste.Create (Self);
  FDbPaisTeste   := TDbPaisTeste.Create (Self);

end;

destructor TCtrlPaisEstadoTeste.Destroy;
begin
  FreeAndNil ( FDbEstadoTeste );
  FreeAndNil ( FDbPaisTeste );

  if isAppServer then begin
    FreeAndNil ( FcdsEstadoTeste );
    FreeAndNil ( FcdsPaisTeste );
  end;

  inherited;
end;

procedure TCtrlPaisEstadoTeste.DoChangeDataBase;
begin
  inherited;
  FDbEstadoTeste.DataBaseName := DataBaseName;
  FDbPaisTeste.DataBaseName := DataBaseName;
end;

function TCtrlPaisEstadoTeste.ExcluiPaisEstado: Boolean;
var
  Msg: string;
begin
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiPaisEstado( FcdsEstadoTeste.Data, FcdsEstadoTeste.Data );

    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    try
      StartTransaction;


//      FcdsEstadoTeste.First;
//      while not FcdsEstadoTeste.Eof do FcdsEstadoTeste.Delete;

      Result := ApplyCds( FcdsEstadoTeste, FDbEstadoTeste, [], [] );
      Msg    := FDbEstadoTeste.MessageInfo;

      if not Result then
        raise Exception.Create( Msg );

      Result := ApplyCds( FcdsPaisTeste, FDbPaisTeste, [], [] );
      Msg    := FDbEstadoTeste.MessageInfo;

      if not Result then
        raise Exception.Create( Msg );


      Commit;
    except
      on E:Exception do begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlPaisEstadoTeste.GravarEstado: Boolean;
var
  Msg: string;
begin
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravarEstado( FcdsEstadoTeste.Data );

    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    try
      StartTransaction;
      Result := ApplyCds( FcdsEstadoTeste, FDbEstadoTeste, [], [] );
      Msg    := FDbEstadoTeste.MessageInfo;

      if not Result then
        raise Exception.Create( Msg );

      Commit;
    except
      on E:Exception do begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlPaisEstadoTeste.GravarPaisEstado: Boolean;
var
  Msg: string;
begin
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravarPaisEstado( FcdsEstadoTeste.Data, FcdsEstadoTeste.Data );

    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    try
      StartTransaction;

      Result := ApplyCds( FcdsPaisTeste, FDbPaisTeste, [], [] );
      Msg    := FDbEstadoTeste.MessageInfo;

      if not Result then
        raise Exception.Create( Msg );

      Result := ApplyCds( FcdsEstadoTeste, FDbEstadoTeste, [FDbPaisTeste.Idpais], [FDbEstadoTeste.Idpais] );
      Msg    := FDbEstadoTeste.MessageInfo;

      if not Result then
        raise Exception.Create( Msg );

      Commit;
    except
      on E:Exception do begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlPaisEstadoTeste.ListaEstado(const iIdPais, iIdEstado: integer): OleVariant;
var sSql: string;
begin

  if ConnectionSide = CnsClient then begin
    Result := Connection.AppServer.ListaEstado(iIdPais, iIdEstado);

  end else begin

    sSql := 'SELECT * FROM ESTADO WHERE 1=1 ' + #13;

    if iIdPais <> -1 then
      sSql := sSql + 'AND IDPAIS = ' + IntToStr ( iIdPais ) + #13;

    if iIdEstado <> -1 then
      sSql := sSql + 'AND IDESTADO = ' + IntToStr ( iIdEstado ) + #13;

    Result := GetDataPacket ( sSql );
  end;

end;

function TCtrlPaisEstadoTeste.ListaPais(
  const iIdPais: integer): OleVariant;
var sSql: string;
begin

  if ConnectionSide = CnsClient then begin
    Result := Connection.AppServer.ListaEstado(iIdPais);

  end else begin

    sSql := 'SELECT * FROM PAIS ' + #13;

    if iIdPais <> -1 then
      sSql := sSql + 'WHERE IDPAIS = ' + IntToStr ( iIdPais ) + #13;

    Result := GetDataPacket ( sSql );
  end;

end;

procedure TCtrlPaisEstadoTeste.OnCreateAppServer;
begin
  inherited;
  // os clients data sets daqui são apontados a objetos da tela
  FcdsEstadoTeste := TClientDataSet.Create(nil);
  FcdsPaisTeste   := TClientDataSet.Create(nil);

end;

procedure TCtrlPaisEstadoTeste.SetcdsEstadoTeste(
  const Value: TClientDataSet);
begin
  FcdsEstadoTeste := Value;
end;

procedure TCtrlPaisEstadoTeste.SetcdsPaisTeste(
  const Value: TClientDataSet);
begin
  FcdsPaisTeste := Value;
end;

procedure TCtrlPaisEstadoTeste.SetDbEstadoTeste(
  const Value: TDbEstadoTeste);
begin
  FDbEstadoTeste := Value;
end;

procedure TCtrlPaisEstadoTeste.SetDbPaisTeste(const Value: TDbPaisTeste);
begin
  FDbPaisTeste := Value;
end;

end.
