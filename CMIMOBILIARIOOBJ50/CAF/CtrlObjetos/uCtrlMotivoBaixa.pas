unit uCtrlMotivoBaixa;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, uMidasUtil, uCMTypes,
     SysUtils, dbclient, Provider, uSistema, uDBMotivoBaixa;

Type
   TCtrlMotivoBaixa = class(TCmControlObject)
   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;
   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbMotivoBaixa : TDbMotivoBaixa;

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
      function Procurar(nIdMotivoBaixa : Extended) : OleVariant;
   end;

implementation

{ TCtrlMotivoBaixa }

function TCtrlMotivoBaixa.AplicaOperacao: Boolean;
Var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoMOTIVOBAIXA( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbMotivoBaixa,[],[]);
         sMensagem := _dbMotivoBaixa.MessageInfo;

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

procedure TCtrlMotivoBaixa.OnCreateAppServer;
begin
   inherited;
   fCds := TClientDataSet.Create(nil);
end;

constructor TCtrlMotivoBaixa.Create;
begin
   inherited;
   _dbMotivoBaixa := TDbMotivoBaixa.Create;
end;

destructor TCtrlMotivoBaixa.Destroy;
begin
   if IsAppServer then
      FreeCDS([fCds]);

   _dbMotivoBaixa.Free;

   inherited;
end;

procedure TCtrlMotivoBaixa.DoChangeDataBase;
begin
   inherited;
   _dbMotivoBaixa.DataBaseName := DataBaseName;
end;

function TCtrlMotivoBaixa.Procurar(nIdMotivoBaixa: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarMOTIVOBAIXA( nIdMotivoBaixa ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbMotivoBaixa.IDMOTIVOBAIXA.AsFloat := nIdMotivoBaixa;
      Result := GetDataPacket(_dbMotivoBaixa.sSQLSelect);
   end;
end;

procedure TCtrlMotivoBaixa.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

end.
