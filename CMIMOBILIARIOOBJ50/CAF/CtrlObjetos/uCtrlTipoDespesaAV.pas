unit uCtrlTipoDespesaAV;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uSistema, uDBTipoDespesaAV;

Type
   TCtrlTipoDespesaAV = class(TCmControlObject)
   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbTipoDespesaAV : TDbTipoDespesaAV;

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
      function Procurar(nIdTipoDespesa : Extended) : OleVariant;
      function Lista: OleVariant;
   end;

implementation

{ TCtrlTipoDespesaAV }

function TCtrlTipoDespesaAV.AplicaOperacao: Boolean;
Var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoTIPODESPESAAV( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbTipoDespesaAV,[],[]);
         sMensagem := _dbTipoDespesaAV.MessageInfo;

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

constructor TCtrlTipoDespesaAV.Create;
begin
   inherited;
   _dbTipoDespesaAV := TDbTipoDespesaAV.Create( Self );
   fCds             := TClientDataSet.Create(nil);
end;

destructor TCtrlTipoDespesaAV.Destroy;
begin
   if fCds.Active then
      fCds.Close;

   fCds := nil;
   fCds.Free;

   _dbTipoDespesaAV.Free;

   inherited;
end;

procedure TCtrlTipoDespesaAV.DoChangeDataBase;
begin
   inherited;
   _dbTipoDespesaAV.DataBaseName := DataBaseName;
end;

function TCtrlTipoDespesaAV.Lista: OleVariant;
var sSql: string;
begin
   sSql := ' SELECT IDTIPODESPESA, DESTIPODESPESA '+ #13 +
           ' FROM TIPODESPESAAV '+ #13 +
           ' ORDER BY DESTIPODESPESA ';
   Result := GetDataPacket(sSql);
end;

function TCtrlTipoDespesaAV.Procurar(nIdTipoDespesa: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarTIPODESPESAAV( nIdTipoDespesa ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbTipoDespesaAV.IDTIPODESPESA.AsFloat := nIdTipoDespesa;
      Result := GetDataPacket(_dbTipoDespesaAV.sSQLSelect);
   end;
end;

procedure TCtrlTipoDespesaAV.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

end.
