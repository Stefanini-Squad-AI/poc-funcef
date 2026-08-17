unit uCtrlEstadoTeste;

interface
Uses Classes, DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject,
     uCmControlObject, uDbEstadoTeste, usistema, uCtrlParamGlobal, uctrlpadroes;

Type
  TCtrlEstadoTeste = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    DbEstadoTeste: TDbEstadoTeste;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
    procedure OnCreateAppServer; override;

  Public

    Property cds: TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create; Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    function  ListaEstadoTeste(IdEstado: integer = -1; IdPais: integer = -1): OleVariant;
    function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlEstadoTeste.Gravar: Boolean;
Var
  Msg: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.Gravar(cds.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
     try
       StartTransaction;
       Result := ApplyCds(cds, dbEstadoTeste, [], []);

       if not Result then
          raise Exception.Create(dbEstadoTeste.MessageInfo);

       Commit;
     except
       On E: Exception do
       begin
         Result := False;
         RollBack;
         MessageInfo := E.Message;
       end;
     end;
   end;
end;

constructor TCtrlEstadoTeste.Create;
begin
  inherited Create;
  DbEstadoTeste := TDbEstadoTeste.Create(Self);

end;

destructor TCtrlEstadoTeste.Destroy;
begin
  if isAppServer then
     FreeAndNil(Fcds);

  FreeAndNil(DbEstadoTeste);
  inherited;
end;

procedure TCtrlEstadoTeste.DoChangeDataBase;
begin
  inherited;
  dbEstadoTeste.DataBaseName := DatabaseName;
end;

Function TCtrlEstadoTeste.ListaEstadoTeste(IdEstado: integer = -1; IdPais: integer = -1): OleVariant;
var
  sSql: string;
begin
  sSQL := 'SELECT ' + #13 +
          '   CODESTADO, IDPAIS, NOMEESTADO, IDESTADO, CODJURISDICAO, CODFISCAL '+ #13 +
          ' FROM ESTADO '+ #13 +
          ' WHERE 1 = 1 ';

  if idEstado <> -1 then
     ssQL := sSQL + ' AND IDESTADO = ' + IntToStr(IdEstado);

  if idPais <> -1 then
     ssQL := sSQL + ' AND IDPais = ' + IntToStr(IdPais);

  Result := GetDataPacket( sSql );
end;

procedure TCtrlEstadoTeste.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;


procedure TCtrlEstadoTeste.OnCreateAppServer;
begin
  inherited;
  FCds     := TClientDataSet.Create( nil );
end;

end.
