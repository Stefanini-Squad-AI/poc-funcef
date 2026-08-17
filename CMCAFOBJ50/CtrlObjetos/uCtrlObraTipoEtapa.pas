unit uCtrlObraTipoEtapa;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider,
     uDBObraTipoEtapa;

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
      function ListaObraTipoEtapa(nObraTipoEtapa : Extended = -1) : OleVariant;
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
   _dbObraTipoEtapa := TDbObraTipoEtapa.Create(Self);
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
   _dbObraTipoEtapa.IDObraTipoEtapa.AsFloat := nIdObraTipoEtapa;
   Result := GetDataPacket(_dbObraTipoEtapa.sSQLSelect);
end;

procedure TCtrlObraTipoEtapa.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

function TCtrlObraTipoEtapa.ListaObraTipoEtapa(nObraTipoEtapa : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDOBRATIPOETAPA, DESCOBRATIPOETAPA ' + #13 +
           ' FROM CAFOBRATIPOETAPA '  + #13;
   //-------------------------------------------------------------------------------------
   if nObraTipoEtapa <> -1 then
      sSql := sSql + '   AND (IDOBRATIPOETAPA = ' + floattostr(nObraTipoEtapa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY DESCOBRATIPOETAPA ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

end.

