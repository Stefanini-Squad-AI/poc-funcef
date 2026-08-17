unit uCtrlLocalizacao;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uSistema,
     uDBLocalizacao;

Type
   TCtrlLocalizacao = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbLocalizacao : TDbLocalizacao;

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
      function Procurar(nIdLocalizacao, nIdPessoa : Extended) : OleVariant;
      function ListaLocalizacao(fIdPessoa : Extended; fIdLocalizacao : Extended = -1): OleVariant;

   end;

implementation

{ TCtrlLocalizacao }

function TCtrlLocalizacao.AplicaOperacao: Boolean;
Var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoLOCALIZACAO( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbLocalizacao,[],[]);
         sMensagem := _dbLocalizacao.MessageInfo;

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

constructor TCtrlLocalizacao.Create;
begin
   inherited;
   _dbLocalizacao := TDbLocalizacao.Create;
   fCds           := TClientDataSet.Create(nil);
end;

destructor TCtrlLocalizacao.Destroy;
begin
   if fCds.Active then
      fCds.Close;

   fCds := nil;
   fCds.Free;

   _dbLocalizacao.Free;

   inherited;
end;

procedure TCtrlLocalizacao.DoChangeDataBase;
begin
   inherited;
   _dbLocalizacao.DataBaseName := DataBaseName;
end;

function TCtrlLocalizacao.Procurar(nIdLocalizacao, nIdPessoa: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarLOCALIZACAO( nIdLocalizacao, nIdPessoa ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbLocalizacao.IDLocalizacao.AsFloat := nIdLocalizacao;
      _dbLocalizacao.IDPessoa.AsFloat      := nIdPessoa;
      Result := GetDataPacket(_dbLocalizacao.sSQLSelect);
   end;
end;

function TCtrlLocalizacao.ListaLocalizacao(fIdPessoa, fIdLocalizacao : Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT L.IDLOCALIZACAO, L.IDPESSOA, L.IDRESPONSAVEL, L.IDEMPRESA, ' + #13 +
           '        L.CODCENTROCUSTO, L.IDTIPOAREA, L.NOME, L.ENDERECO, L.FLGLOCSAITEMP, ' + #13 +
           '        P.NOME AS NOMERESP, CC.NOME AS DESCCCUSTO ' + #13 +
           ' FROM LOCALIZACAO L, ' + #13 +
           '      PESSOA P, ' + #13 +
           '      CENTCUST CC ' + #13 +
           ' WHERE (L.IDPESSOA = ' + floattostr(fIdPessoa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if fIdLocalizacao <> -1 then
      sSql := sSql + '   AND (L.IDLOCALIZACAO = ' + floattostr(fIdLocalizacao) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (L.IDRESPONSAVEL = P.IDPESSOA) ' + #13 +
                  '   AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO) ' + #13 +
                  '   AND (L.IDEMPRESA = CC.IDEMPRESA) ' + #13 +
                  ' ORDER BY L.NOME ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

procedure TCtrlLocalizacao.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

end.
