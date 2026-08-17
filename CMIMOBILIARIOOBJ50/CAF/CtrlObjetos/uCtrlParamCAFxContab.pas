unit uCtrlParamCAFxContab;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uSistema, uMidasUtil,
     uDBTiposMovimentoGrupos, uDBContasTiposMovimentoGrupos;

Type
   TCtrlParamCAFxContab = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbTiposMovimentoGrupos       : TDbTiposMovimentoGrupos;
      _dbContasTiposMovimentoGrupos : TDbContasTiposMovimentoGrupos;

      Fcds,
      FcdsContasTiposMovimentoGrupos : TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsContasTiposMovimentoGrupos(const Value: TClientDataSet);

   Public
      property cds                           : TClientDataSet read Fcds                           write Setcds;
      property cdsContasTiposMovimentoGrupos : TClientDataSet read FcdsContasTiposMovimentoGrupos write SetcdsContasTiposMovimentoGrupos;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function ProcurarParamCAFxContab(nIdPessoa, nIdGrupo, nIdTipoMov : Extended) : OleVariant;
      function ListaTiposMovimentoGrupos(nIdPessoa : Extended; nIdGrupo : Extended = -1; nIdTipoMov: Extended = -1): OleVariant;
      function ListaParamCAFxContab(nIdPessoa : Extended; nIdGrupo : Extended = -1; nIdTipoMov : Extended = -1; sTipoLanc : String = ''): OleVariant;
      function ListaContabPlano(nPlano : Extended): OleVariant;
      function ListaContabPlanoConta(nPlano : Extended; sPlaConta : String = '') : OleVariant;
   end;

implementation

{ TCtrlParamCAFxContab }

function TCtrlParamCAFxContab.AplicaOperacao(sTipoOperacao: String): Boolean;
Var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoPARAMCAFXCONTAB(Fcds.Data, FcdsContasTiposMovimentoGrupos.Data,
                                                                   sTipoOperacao);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         if sTipoOperacao = 'E' then // Inclusão e Alteração
         begin
            Result := ApplyCds(Fcds,_dbTiposMovimentoGrupos,[],[]);
            sMensagem := _dbTiposMovimentoGrupos.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsContasTiposMovimentoGrupos,_dbContasTiposMovimentoGrupos,[],[]);
            sMensagem := _dbContasTiposMovimentoGrupos.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

         end else // Remoção
         begin
            Result := ApplyCds(FcdsContasTiposMovimentoGrupos,_dbContasTiposMovimentoGrupos,[],[]);
            sMensagem := _dbContasTiposMovimentoGrupos.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(Fcds,_dbTiposMovimentoGrupos,[],[]);
            sMensagem := _dbTiposMovimentoGrupos.MessageInfo;
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

constructor TCtrlParamCAFxContab.Create;
begin
   inherited;
   _dbTiposMovimentoGrupos       := TDbTiposMovimentoGrupos.Create;
   _dbContasTiposMovimentoGrupos := TDbContasTiposMovimentoGrupos.Create;
end;

destructor TCtrlParamCAFxContab.Destroy;
begin
   inherited;
   if IsAppServer then
      FreeCDS([fCds,fCdsContasTiposMovimentoGrupos]);

   _dbTiposMovimentoGrupos.Free;
   _dbContasTiposMovimentoGrupos.Free;
end;

procedure TCtrlParamCAFxContab.DoChangeDataBase;
begin
   inherited;
   _dbTiposMovimentoGrupos.DataBaseName       := DataBaseName;
   _dbContasTiposMovimentoGrupos.DataBaseName := DataBaseName;
end;

function TCtrlParamCAFxContab.ListaTiposMovimentoGrupos(nIdPessoa, nIdGrupo, nIdTipoMov: Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT TMG.IDPESSOA, TMG.IDGRUPO, TMG.IDTIPOMOVIMENTACAO '+ #13 +
           ' FROM TIPOSMOVIMENTOGRUPOS TMG '+ #13 +
           ' WHERE (TMG.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdTipoMov <> -1 then
      sSql := sSql + '   AND (TMG.IDGRUPO = ' + floattostr(nIdGrupo) + ') ' + #13 ;
   //-------------------------------------------------------------------------------------
   if nIdTipoMov <> -1 then
      sSql := sSql + '   AND (TMG.IDTIPOMOVIMENTACAO = ' + floattostr(nIdTipoMov) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAFxContab.ListaParamCAFxContab(nIdPessoa, nIdGrupo, nIdTipoMov: Extended; sTipoLanc : String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT TMG.IDPESSOA, TMG.IDGRUPO, TMG.IDTIPOMOVIMENTACAO, '+ #13 +
           '        G.CLASSE AS CODGRUPO, G.NOME AS DESCGRUPO, '+ #13 +
           '        TM.DESCTIPOMOVIMENTACAO, '+ #13 +
           '        CTMG.PLANO, CTMG.PLACONTA, CTMG.TIPOLANCAMENTO, '+ #13 +
           '        P.DESCPLANO, PC.PLANOME, CTMG.IDCONTASTIPOSMOV '+ #13 +
           ' FROM TIPOSMOVIMENTOGRUPOS TMG, '+ #13 +
           '      CONTASTIPOSMOVIMENTOGRUPOS CTMG, '+ #13 +
           '      GRUPO G, '+ #13 +
           '      TIPOMOVIMENTACAO TM, '+ #13 +
           '      PLANO P, '+ #13 +
           '      PLANOCONTA PC '+ #13 +
           ' WHERE (TMG.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdGrupo <> -1 then
      sSql := sSql + '   AND (TMG.IDGRUPO  = ' + floattostr(nIdGrupo) + ') ' + #13 ;
   //-------------------------------------------------------------------------------------
   if nIdTipoMov <> -1 then
      sSql := sSql + '   AND (TMG.IDTIPOMOVIMENTACAO = ' + floattostr(nIdTipoMov) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if (sTipoLanc = 'D') or (sTipoLanc = 'C') then
      sSql := sSql + '   AND (CTMG.TIPOLANCAMENTO = ' + #39 + sTipoLanc + #39 + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (TMG.IDPESSOA = CTMG.IDPESSOA) ' + #13 +
                  '   AND (TMG.IDGRUPO = CTMG.IDGRUPO) ' + #13 +
                  '   AND (TMG.IDTIPOMOVIMENTACAO = CTMG.IDTIPOMOVIMENTACAO) ' + #13 +
                  '   AND (CTMG.IDGRUPO = G.IDGRUPO) ' + #13 +
                  '   AND (CTMG.IDTIPOMOVIMENTACAO = TM.IDTIPOMOVIMENTACAO) ' + #13 +
                  '   AND (CTMG.PLANO = P.PLANO) '+ #13 +
                  '   AND (CTMG.PLANO = PC.PLANO) '+ #13 +
                  '   AND (CTMG.PLACONTA = PC.PLACONTA) '+ #13 +
                  ' ORDER BY TMG.IDPESSOA,TMG.IDGRUPO,TMG.IDTIPOMOVIMENTACAO ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAFxContab.ListaContabPlano(nPlano : Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT PLANO, DESCPLANO, MASCARA '+
           ' FROM PLANO '+
           ' WHERE (PLANO = ' + floattostr(nPlano) + ') ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAFxContab.ListaContabPlanoConta(nPlano : Extended; sPlaConta : String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT PLANO, PLANOME, PLACONTA, PLATIPO ' + #13 +
           ' FROM PLANOCONTA ' + #13 +
           ' WHERE (PLANO = ' + floattostr(nPlano) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if sPlaConta <> '' then
      sSql := sSql + '   AND (LTRIM(RTRIM(PLACONTA)) = ' + #39 + sPlaConta + #39 + ') ' + #13 ;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (PLAINATIVA = ''A'') ' + #13 +
                  ' ORDER BY PLACONTA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

procedure TCtrlParamCAFxContab.OnCreateAppServer;
begin
   inherited;
   fCds                           := TClientDataSet.Create(nil);
   fCdsContasTiposMovimentoGrupos := TClientDataSet.Create(nil);
end;

function TCtrlParamCAFxContab.ProcurarParamCAFxContab(nIdPessoa, nIdGrupo, nIdTipoMov: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarParamCAFxContab( nIdPessoa, nIdGrupo, nIdTipoMov ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbContasTiposMovimentoGrupos.IDPESSOA.AsFloat           := nIdPessoa;
      _dbContasTiposMovimentoGrupos.IDGRUPO.AsFloat            := nIdGrupo;
      _dbContasTiposMovimentoGrupos.IDTIPOMOVIMENTACAO.AsFloat := nIdTipoMov;
      Result := GetDataPacket(_dbContasTiposMovimentoGrupos.sSQLSelect);
   end;
end;

procedure TCtrlParamCAFxContab.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlParamCAFxContab.SetcdsContasTiposMovimentoGrupos(const Value: TClientDataSet);
begin
   FcdsContasTiposMovimentoGrupos := Value;
end;

end.
