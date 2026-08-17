unit uCtrlTipoSaidaTemp;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uSistema, uDBTipoSaidaTemp;

Type
   TCtrlTipoSaidaTemp = class(TCmControlObject)
   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbTipoSaidaTemp : TDbTipoSaidaTemp;

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
      function Procurar(nIdTipoSaidaTemp : Extended) : OleVariant;
   end;

implementation

{ TCtrlTipoSaidaTemp }

function TCtrlTipoSaidaTemp.AplicaOperacao: Boolean;
Var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoTIPOSAIDATEMP( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbTipoSaidaTemp,[],[]);
         sMensagem := _dbTipoSaidaTemp.MessageInfo;

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

constructor TCtrlTipoSaidaTemp.Create;
begin
   inherited;
   _dbTipoSaidaTemp := TDbTipoSaidaTemp.Create;
   fCds             := TClientDataSet.Create(nil);
end;

destructor TCtrlTipoSaidaTemp.Destroy;
begin
   if fCds.Active then
      fCds.Close;

   fCds := nil;
   fCds.Free;

   _dbTipoSaidaTemp.Free;

   inherited;
end;

procedure TCtrlTipoSaidaTemp.DoChangeDataBase;
begin
   inherited;
   _dbTipoSaidaTemp.DataBaseName := DataBaseName;
end;

function TCtrlTipoSaidaTemp.Procurar(nIdTipoSaidaTemp: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarTIPOSAIDATEMP( nIdTipoSaidaTemp ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbTipoSaidaTemp.IDTIPOSAIDATEMP.AsFloat := nIdTipoSaidaTemp;
      Result := GetDataPacket(_dbTipoSaidaTemp.sSQLSelect);
   end;
end;

procedure TCtrlTipoSaidaTemp.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

end.
