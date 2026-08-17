unit uCtrlObraTipoEtapa;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uSistema, uDBObraTipoEtapa;

Type
   TCtrlObraTipoEtapa = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbObraTipoEtapa : TDbObraTipoEtapa;

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
      function Procurar(nIdObraTipoEtapa : Extended) : OleVariant;
   end;

implementation

{ TCtrlObraTipoEtapa }

function TCtrlObraTipoEtapa.AplicaOperacao: Boolean;
Var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoOBRATIPOETAPA( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbObraTipoEtapa,[],[]);
         sMensagem := _dbObraTipoEtapa.MessageInfo;

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

constructor TCtrlObraTipoEtapa.Create;
begin
   inherited;
   _dbObraTipoEtapa := TDbObraTipoEtapa.Create;
   fCds             := TClientDataSet.Create(nil);
end;

destructor TCtrlObraTipoEtapa.Destroy;
begin
   if fCds.Active then
      fCds.Close;

   fCds := nil;
   fCds.Free;

   _dbObraTipoEtapa.Free;

   inherited;
end;

procedure TCtrlObraTipoEtapa.DoChangeDataBase;
begin
   inherited;
   _dbObraTipoEtapa.DataBaseName := DataBaseName;
end;

function TCtrlObraTipoEtapa.Procurar(nIdObraTipoEtapa: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarOBRATIPOETAPA( nIdObraTipoEtapa ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbObraTipoEtapa.IDObraTipoEtapa.AsFloat := nIdObraTipoEtapa;
      Result := GetDataPacket(_dbObraTipoEtapa.sSQLSelect);
   end;
end;

procedure TCtrlObraTipoEtapa.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

end.
