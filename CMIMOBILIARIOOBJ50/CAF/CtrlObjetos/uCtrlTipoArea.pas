unit uCtrlTipoArea;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject,
     SysUtils, dbclient, Provider, uSistema, uDbTipoArea, uCMTypes;

Type
   TCtrlTipoArea = class(TCmControlObject)
   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbTipoArea : TDbTipoArea;

      Fcds: TClientDataSet;
      procedure Setcds(const Value: TClientDataSet);

   Public
      property cds : TClientDataSet read Fcds write Setcds;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function AplicaOperacao : Boolean;
      function Procurar(nIdTipoArea : Extended) : OleVariant;
      function ListaTipoArea : OleVariant;
   end;

implementation

{ TCtrlTipoArea }

constructor TCtrlTipoArea.Create;
begin
   inherited;
   _dbTipoArea := TDbtipoArea.Create;
   fCds        := TClientDataSet.Create(nil);
end;

destructor TCtrlTipoArea.Destroy;
begin
   if fCds.Active then
      fCds.Close;

   fCds := nil;
   fCds.Free;

   _dbTipoArea.Free;

    inherited;
end;

procedure TCtrlTipoArea.DoChangeDataBase;
begin
   inherited;
   _dbTipoArea.DataBaseName := DataBaseName;
end;

function TCtrlTipoArea.AplicaOperacao: Boolean;
Var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoTIPOAREA( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbTipoArea,[],[]);
         sMensagem := _dbTipoArea.MessageInfo;

         if not Result then
            Raise Exception.Create(sMensagem);

         Commit;
      except
         On E : Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlTipoArea.Procurar(nIdTipoArea: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarTipoArea( nIdTipoArea ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbTipoArea.IDTIPOAREA.AsFloat := nIdTipoArea;
      Result := GetDataPacket(_dbTipoArea.sSQLSelect);
   end;
end;

procedure TCtrlTipoArea.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

function TCtrlTipoArea.ListaTipoArea: OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT IDTIPOAREA, DESCTIPOAREA ' +
           ' FROM TIPOAREA ' +
           ' ORDER BY DESCTIPOAREA ';
   Result := GetDataPacket(sSql);
end;

end.
