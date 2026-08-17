unit uCtrlCafPaises;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,  
     SysUtils, dbclient, Provider,  
     uDBCAFPaises;

Type
   TCtrlCafPaises = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbCafPaises : TDBCafPaises;

      Fcds: TClientDataSet;
      procedure Setcds(const Value: TClientDataSet);

      function CMTranslate(sIgor : String) : String;

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
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function Procurar(nIdPessoa, nCAFPaises : Extended) : OleVariant;
      function ListaCafPaises(nIdPessoa, nCAFPaises : Extended): OleVariant;
      function ListaCafMoedas(nIdPessoa : Extended): OleVariant;
      function VerificaPais(nIdPessoa, nCAFPaises : Extended; sTipoOperacao : String) : Boolean;
   end;

implementation

{ TCtrlCafPaises }

function TCtrlCafPaises.AplicaOperacao(sTipoOperacao : String) : Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoCafPaises( sTipoOperacao, Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         if sTipoOperacao = 'E' then
         begin
            CdsToDbObject(Fcds,_dbCAFPaises);
            if not _dbCAFPaises.InsertAs(Fcds.FieldByName('IDCAFPAISES').AsFloat) then
               Raise Exception.Create(_dbCAFPaises.MessageInfo);
         end else
         begin
            if not ApplyCds(Fcds,_dbCafPaises,[],[]) then
               Raise Exception.Create(_dbCafPaises.MessageInfo);
         end;

         Commit;
         Result := True;
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

constructor TCtrlCafPaises.Create;
begin
   inherited;
   _dbCafPaises := TdbCafPaises.Create(Self);
   Fcds         := TClientDataSet.Create(nil);
end;

destructor TCtrlCafPaises.Destroy;
begin
   if Fcds.Active then
      Fcds.Close;

   Fcds := nil;
   Fcds.Free;

   _dbCafPaises.Free;

   inherited;
end;

procedure TCtrlCafPaises.DoChangeDataBase;
begin
   inherited;
   _dbCafPaises.DataBaseName := DataBaseName;
end;

function TCtrlCafPaises.Procurar(nIdPessoa, nCAFPaises : Extended): OleVariant;
begin
   _dbCafPaises.IDCAFPAISES.AsFloat := nCAFPaises;
   _dbCafPaises.IDPESSOA.AsFloat  := nIdPessoa;
   Result := GetDataPacket(_dbCafPaises.sSQLSelect);
end;

procedure TCtrlCafPaises.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

function TCtrlCafPaises.ListaCafPaises(nIdPessoa, nCAFPaises : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT CP.IDCAFPAISES, CP.IDPESSOA, CP.IDPAIS, CP.MOECODIGO, ' + #13 +
           '        CP.FLGCONTABIL, CP.FLGMULTITAXA, P.NOMEPAIS' + #13 +
           ' FROM CAFPAISES CP, ' + #13 +
           '      PAIS P ' + #13 +
           ' WHERE CP.IDPESSOA = ' + floattostr(nIdPessoa) + #13;
   //-------------------------------------------------------------------------------------
   if nCAFPaises <> -1 then
      sSql := sSql + '   AND CP.IDCAFPAISES = ' + floattostr(nCAFPaises) + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND CP.IDPAIS = P.IDPAIS ' + #13 +
                  ' ORDER BY CP.IDCAFPAISES ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlCafPaises.ListaCafMoedas(nIdPessoa : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC ' + #13 +
           ' FROM CAFMOEDAS CM, ' + #13 +
           '      MOEDA M ' + #13 +
           ' WHERE CM.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
           '   AND (CM.IDTIPOMOEDA = 1 OR CM.IDTIPOMOEDA = 3) ' + #13 +
           '   AND CM.MOECODIGO = M.MOECODIGO ' + #13 +
           ' ORDER BY CM.IDTIPOMOEDA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlCafPaises.VerificaPais(nIdPessoa, nCAFPaises : Extended;
                                     sTipoOperacao : String) : Boolean;
var
   sSql : String;

begin
   Result := True;
   //-------------------------------------------------------------------------------------
   if sTipoOperacao = 'I' then     // Inserir
   begin
      //----------------------------------------------------------------------------------
      // Verifica se o País já foi cadastrado
      //----------------------------------------------------------------------------------
      sSql := ' SELECT CP.IDCAFPAISES, CP.IDPESSOA, CP.IDPAIS, CP.MOECODIGO, ' + #13 +
              '        CP.FLGCONTABIL, CP.FLGMULTITAXA, P.NOMEPAIS' + #13 +
              ' FROM CAFPAISES CP, ' + #13 +
              '      PAIS P ' + #13 +
              ' WHERE CP.IDCAFPAISES = ' + floattostr(nCAFPaises) + #13 +
              '   AND CP.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
              '   AND CP.IDPAIS = P.IDPAIS ' + #13;
      _cds.Data := GetDataPacket( sSql );
      if _cds.RecordCount <> 0 then
      begin
         MessageInfo := CMTranslate('O País ') + trim(_cds.FieldByName('NOMEPAIS').AsString) + CMTranslate(' já foi cadastrado.');
         Result := False;
      end;
   end;
end;

function TCtrlCafPaises.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.

