unit uCtrlSituacao;

interface

Uses DB, uCmDbObject, uCmControlObject, uDbSituacao,
     SysUtils, dbclient, Provider, uCMTypes;

Type
   TCtrlSituacao = class(TCmControlObject)
   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbSituacao : TDbSituacao;

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
      function Procurar(nIdSituacao : Extended) : OleVariant;
      function ListaSituacao(nIdSituacao : Extended = -1) : OleVariant;
   end;

implementation

{ TCtrlSituacao }

constructor TCtrlSituacao.Create;
begin
   inherited;
   _dbSituacao := TDbSituacao.Create(Self);
   fCds        := TClientDataSet.Create(nil);
end;

destructor TCtrlSituacao.Destroy;
begin
   if fCds.Active then
      fCds.Close;

   fCds := nil;
   fCds.Free;

   _dbSituacao.Free;

   inherited;
end;

procedure TCtrlSituacao.DoChangeDataBase;
begin
   inherited;
   _dbSituacao.DataBaseName := DataBaseName;
end;

function TCtrlSituacao.AplicaOperacao: Boolean;
Var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoSITUACAO( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbSituacao,[],[]);
         sMensagem := _dbSituacao.MessageInfo;

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

function TCtrlSituacao.Procurar(nIdSituacao : Extended) : OleVariant;
begin
   _dbSituacao.IDSITUACAO.AsFloat := nIdSituacao;
   Result := GetDataPacket(_dbSituacao.sSQLSelect);
end;

function TCtrlSituacao.ListaSituacao(nIdSituacao : Extended = -1) : OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT IDSITUACAO, DESCSITUACAO ' + #13 +
           ' FROM SITUACAO ' + #13 ;
   //-------------------------------------------------------------------------------------
   if nIdSituacao <> -1 then
      sSql := sSql + ' WHERE (IDSITUACAO = ' + floattostr(nIdSituacao) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

procedure TCtrlSituacao.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

end.
