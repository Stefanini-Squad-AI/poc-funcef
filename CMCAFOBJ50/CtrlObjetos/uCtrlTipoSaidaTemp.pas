unit uCtrlTipoSaidaTemp;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uDBTipoSaidaTemp;

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
      function ListaTipoSaidaTemp(nIdTipoSaidaTemp : Extended = -1) : OleVariant;
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
   _dbTipoSaidaTemp := TDbTipoSaidaTemp.Create(Self);
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

procedure TCtrlTipoSaidaTemp.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

function TCtrlTipoSaidaTemp.Procurar(nIdTipoSaidaTemp: Extended): OleVariant;
begin
   _dbTipoSaidaTemp.IDTIPOSAIDATEMP.AsFloat := nIdTipoSaidaTemp;
   Result := GetDataPacket(_dbTipoSaidaTemp.sSQLSelect);
end;

function TCtrlTipoSaidaTemp.ListaTipoSaidaTemp(nIdTipoSaidaTemp : Extended = -1) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDTIPOSAIDATEMP, DESCTIPSAITEMP ' + #13 +
           ' FROM TIPOSAIDATEMP ' + #13 ;
   //-------------------------------------------------------------------------------------
   if nIdTipoSaidaTemp <> -1 then
      sSql := sSql + ' WHERE (IDTIPOSAIDATEMP = ' + floattostr(nIdTipoSaidaTemp) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

end.
