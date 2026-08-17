unit uCtrlConjunto;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uSistema, uMidasUtil,
     uDBConjunto, uDBRateioCustos;

Type
   TCtrlConjunto = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbConjunto      : TDbConjunto;
      _dbRateioCustos  : TDbRateioCustos;

      Fcds,
      FcdsRateioCustos : TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsRateioCustos(const Value: TClientDataSet);

   Public
      property cds             : TClientDataSet read Fcds             write Setcds;
      property cdsRateioCustos : TClientDataSet read FcdsRateioCustos write SetcdsRateioCustos;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function ProcurarConjunto(nIdConjunto : Extended) : OleVariant;
      function ProcurarRateioCustos(nIdConjunto : Extended) : OleVariant;
      function ListaConjunto(nIdPessoa, nIdConjunto: Extended): OleVariant;
      function ListaRateioCustos(nIdPessoa, nIdConjunto : Extended): OleVariant;
      function BensnoConjunto(nIdConjunto, nIdPessoa : Extended): Boolean;
   end;

implementation

{ TCtrlConjunto }

function TCtrlConjunto.AplicaOperacao(sTipoOperacao: String): Boolean;
var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoCONJUNTO(Fcds.Data, FcdsRateioCustos.Data,
                                                            sTipoOperacao);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         if sTipoOperacao = 'E' then // Inclusão e Alteração
         begin
            Result := ApplyCds(Fcds,_dbConjunto,[],[]);
            sMensagem := _dbConjunto.MessageInfo;
            if not Result then
               Raise Exception.Create(sMensagem)
            else
               MessageInfo := _dbConjunto.IDCONJUNTO.AsString; // Transfere o IDCONJUNTO Gerado

            Result := ApplyCds(FcdsRateioCustos,_dbRateioCustos,[_dbConjunto.IdConjunto],[_dbRateioCustos.IdConjunto]);
            sMensagem := _dbRateioCustos.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);
         end else // Remoção
         begin
            Result := ApplyCds(FcdsRateioCustos,_dbRateioCustos,[_dbConjunto.IdConjunto],[_dbRateioCustos.IdConjunto]);
            sMensagem := _dbRateioCustos.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(Fcds,_dbConjunto,[],[]);
            sMensagem := _dbConjunto.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);
         end;
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

constructor TCtrlConjunto.Create;
begin
  inherited;
   _dbConjunto     := TDbConjunto.Create;
   _dbRateioCustos := TDbRateioCustos.Create;
end;

destructor TCtrlConjunto.Destroy;
begin
   if IsAppServer then
      FreeCDS([fCds,fCdsRateioCustos]);

   _dbConjunto.Free;
   _dbRateioCustos.Free;

  inherited;
end;

procedure TCtrlConjunto.DoChangeDataBase;
begin
   inherited;
   _dbConjunto.DataBaseName     := DataBaseName;
   _dbRateioCustos.DataBaseName := DataBaseName;

end;

function TCtrlConjunto.ListaConjunto(nIdPessoa, nIdConjunto: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT C.IDCONJUNTO, C.IDPESSOA, C.IDLOCALIZACAO, C.IDRESPONSAVEL, ' + #13 +
           '        C.DESCCONJUNTO, C.DISPONIVEL, C.ALUGADO, ' + #13 +
           '        L.NOME AS DESCLOCAL, P.NOME AS NOMERESP ' + #13 +
           ' FROM CONJUNTO C, ' + #13 +
           '      LOCALIZACAO L, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE (C.IDCONJUNTO = ' + floattostr(nIdConjunto) + ') ' + #13 +
           '   AND (C.IDPESSOA = ' + floattostr(nIdPessoa)  + ') ' + #13 +
           '   AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO) ' + #13 +
           '   AND (C.IDPESSOA = L.IDPESSOA) ' + #13 +
           '   AND (C.IDRESPONSAVEL = P.IDPESSOA) ' + #13 +
           ' ORDER BY C.DESCCONJUNTO ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlConjunto.ListaRateioCustos(nIdPessoa, nIdConjunto: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT R.IDCONJUNTO, R.IDEMPRESA, C.DESCCONJUNTO, R.CODCENTROCUSTO, R.DTAINICIO, ' + #13 +
           '        R.PARTICIPACAO, R.DTAFIM, CC.NOME AS DESCCCUSTO ' + #13 +
           ' FROM RATEIODEPRECIACAO R, '  + #13 +
           '      CONJUNTO C, ' + #13 +
           '      CENTCUST CC ' + #13 +
           ' WHERE (C.IDCONJUNTO = ' + floattostr(nIdConjunto) + ') ' + #13 +
           '   AND (C.IDPESSOA = ' + floattostr(nIdPessoa)  + ') ' + #13 +
           '   AND (R.IDCONJUNTO = C.IDCONJUNTO) ' + #13 +
           '   AND (R.IDEMPRESA = C.IDPESSOA) ' + #13 +
           '   AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO) ' + #13 +
           '   AND (R.IDEMPRESA = CC.IDEMPRESA) '  + #13 +
           ' ORDER BY CC.CODCENTROCUSTO ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

procedure TCtrlConjunto.OnCreateAppServer;
begin
  inherited;
   fCds             := TClientDataSet.Create(nil);
   fCdsRateioCustos := TClientDataSet.Create(nil);
end;

function TCtrlConjunto.ProcurarConjunto(nIdConjunto: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarCONJUNTO( nIdConjunto ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbConjunto.IDCONJUNTO.AsFloat := nIdConjunto;
      Result := GetDataPacket(_dbConjunto.sSQLSelect);
   end;
end;

function TCtrlConjunto.ProcurarRateioCustos(nIdConjunto: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarRATEIOCUSTOS( nIdConjunto ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbRateioCustos.IDCONJUNTO.AsFloat := nIdConjunto;
      Result := GetDataPacket(_dbRateioCustos.sSQLSelect);
   end;
end;

procedure TCtrlConjunto.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlConjunto.SetcdsRateioCustos(const Value: TClientDataSet);
begin
   FcdsRateioCustos := Value;
end;

function TCtrlConjunto.BensnoConjunto(nIdConjunto, nIdPessoa : Extended) : Boolean;
var
   sSql : String;

begin
   Result := False;
   sSql := ' SELECT COUNT(IDCONJUNTO) AS QTD ' +
           ' FROM BEM ' +
           ' WHERE (IDCONJUNTO  = ' + floattostr(nIdConjunto) + ') ' +
           '   AND (IDPESSOA = ' + floattostr(nIdPessoa) + ') ' ;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.FieldByName('QTD').AsInteger <> 0 then
   begin
      MessageInfo := 'Existem bens cadastrados neste conjunto !';
      Result := True;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

end.
