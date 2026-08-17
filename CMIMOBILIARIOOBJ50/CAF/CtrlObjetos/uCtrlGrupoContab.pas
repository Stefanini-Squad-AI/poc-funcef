unit uCtrlGrupoContab;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uSistema, uMidasUtil,
     uDBGrupoContab, uDBPlanoGrupo, uDBGrupoBemxCC, uDBGrupoTaxaDep;

Type
   TCtrlGrupoContab = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbGrupoContab   : TDbGrupoContab;
      _dbPlanoGrupo    : TDbPlanoGrupo;
      _dbGrupoBemxCC   : TDbGrupoBemxCC;
      _dbGrupoTaxaDep  : TDbGrupoTaxaDep;

      Fcds,
      FcdsPlanoGrupo,
      FcdsGrupoBemxCC,
      FcdsGrupoTaxaDep : TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsPlanoGrupo(const Value: TClientDataSet);
      procedure SetcdsGrupoBemxCC(const Value: TClientDataSet);
      procedure SetcdsGrupoTaxaDep(const Value: TClientDataSet);

      function CalcGrau(sNoAnterior: String; lNivel: Array of Integer;
                        ind: Integer; var sPai: String) : Integer;
   Public
      property cds             : TClientDataSet read Fcds             write Setcds;
      property cdsPlanoGrupo   : TClientDataSet read FcdsPlanoGrupo   write SetcdsPlanoGrupo;
      property cdsGrupoBemxCC  : TClientDataSet read FcdsGrupoBemxCC  write SetcdsGrupoBemxCC;
      property cdsGrupoTaxaDep : TClientDataSet read FcdsGrupoTaxaDep write SetcdsGrupoTaxaDep;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function ProcurarPlanoGrupo(nIdPessoa : Extended; nIdGrupo : Extended = -1) : OleVariant;
      function ProcurarGrupoContab(nIdGrupo : Extended) : OleVariant;
      function ProcurarGrupoBemxCC(nIdGrupo : Extended) : OleVariant;
      function ProcurarGrupoTaxaDep(nIdGrupo,nIdPessoa : Extended; nIdTaxaDep : Integer) : OleVariant;
      function ListaGrupoContab(nIdPessoa : Extended; nIdGrupo : Extended = -1; sTipo : String = 'T'; nFlgImovel: integer = -1): OleVariant;
      function ListaGrupoBemxCC(nIdGrupo, nIdPessoa : Extended): OleVariant;
      function ListaGrupoTaxaDep(nIdGrupo, nIdPessoa : Extended; iIdTaxaDep : Integer = -1): OleVariant;
      function MascaraOK(sMascara : String; var sMascPict : String;
                         var lNivel : Array of Integer;
                         var iSoma : Integer;var ind : Integer) : Boolean;
      function Verifica_Node(sClasse, sNode : String; bNovo : Boolean;
                             Var iGrau : Integer; lNivel: Array of Integer;
                             Var Ind : Integer) : boolean;
      function BensnoGrupo(nIdGrupo, nIdPessoa : Extended): Boolean;
      function Tem_Filhos(sTipo, sNode : String) : boolean;
   end;

implementation

{ TCtrlGrupoContab }

function TCtrlGrupoContab.AplicaOperacao(sTipoOperacao: String): Boolean;
Var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoGRUPOCONTAB(Fcds.Data, FcdsPlanoGrupo.Data,
                                                               FcdsGrupoBemxCC.Data, FcdsGrupoTaxaDep.Data,
                                                               sTipoOperacao);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         if sTipoOperacao = 'E' then // Inclusão e Alteração
         begin
            Result := ApplyCds(Fcds,_dbGrupoContab,[],[]);
            sMensagem := _dbGrupoContab.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsPlanoGrupo,_dbPlanoGrupo,[_dbGrupoContab.Idgrupo],[_dbPlanoGrupo.Idgrupo]);
            sMensagem := _dbPlanoGrupo.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsGrupoBemxCC,_dbGrupoBemxCC,[_dbGrupoContab.Idgrupo],[_dbGrupoBemxCC.Idgrupo]);
            sMensagem := _dbGrupoBemxCC.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsGrupoTaxaDep,_dbGrupoTaxaDep,[_dbGrupoContab.Idgrupo],[_dbGrupoTaxaDep.Idgrupo]);
            sMensagem := _dbGrupoTaxaDep.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);
         end else // Remoção
         begin
            Result := ApplyCds(FcdsGrupoTaxaDep,_dbGrupoTaxaDep,[],[]);
            sMensagem := _dbGrupoTaxaDep.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsGrupoBemxCC,_dbGrupoBemxCC,[],[]);
            sMensagem := _dbGrupoBemxCC.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsPlanoGrupo,_dbPlanoGrupo,[],[]);
            sMensagem := _dbPlanoGrupo.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(Fcds,_dbGrupoContab,[],[]);
            sMensagem := _dbGrupoContab.MessageInfo;
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

constructor TCtrlGrupoContab.Create;
begin
   inherited;
   _dbGrupoContab   := TDbGrupoContab.Create( Self );
   _dbPlanoGrupo    := TDbPlanoGrupo.Create( Self ) ;
   _dbGrupoBemxCC   := TDbGrupoBemxCC.Create( Self );
   _dbGrupoTaxaDep  := TDbGrupoTaxaDep.Create( Self );
end;

destructor TCtrlGrupoContab.Destroy;
begin
   if IsAppServer then
      FreeCDS([fCds,fCdsPlanoGrupo,fCdsGrupoBemxCC,fCdsGrupoTaxaDep]);

   _dbGrupoContab.Free;
   _dbPlanoGrupo.Free;
   _dbGrupoBemxCC.Free;
   _dbGrupoTaxaDep.Free;

   inherited;
end;

procedure TCtrlGrupoContab.DoChangeDataBase;
begin
   inherited;
   _dbGrupoContab.DataBaseName  := DataBaseName;
   _dbPlanoGrupo.DataBaseName   := DataBaseName;
   _dbGrupoBemxCC.DataBaseName  := DataBaseName;
   _dbGrupoTaxaDep.DataBaseName := DataBaseName;
end;

procedure TCtrlGrupoContab.OnCreateAppServer;
begin
   inherited;
   fCds             := TClientDataSet.Create(nil);
   fCdsPlanoGrupo   := TClientDataSet.Create(nil);
   fCdsGrupoBemxCC  := TClientDataSet.Create(nil);
   fCdsGrupoTaxaDep := TClientDataSet.Create(nil);
end;

function TCtrlGrupoContab.ProcurarPlanoGrupo(nIdPessoa: Extended; nIdGrupo : Extended) : OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarPLANOGRUPO( nIdPessoa, nIdGrupo ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbPlanoGrupo.IDPESSOA.AsFloat := nIdPessoa;
      if nIdGrupo <> -1 then
         _dbPlanoGrupo.IDGRUPO.AsFloat  := nIdGrupo;
      Result := GetDataPacket(_dbPlanoGrupo.sSQLSelect);
   end;
end;

function TCtrlGrupoContab.ProcurarGrupoContab(nIdGrupo: Extended) : OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarGRUPOCONTAB( nIdGrupo ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbGrupoContab.IDGRUPO.AsFloat := nIdGrupo;
      Result := GetDataPacket(_dbGrupoContab.sSQLSelect);
   end;
end;

function TCtrlGrupoContab.ProcurarGrupoBemxCC(nIdGrupo: Extended) : OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarGRUPOBEMXCC( nIdGrupo ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbGrupoBemxCC.IDGRUPO.AsFloat := nIdGrupo;
      Result := GetDataPacket(_dbGrupoBemxCC.sSQLSelect);
   end;
end;

function TCtrlGrupoContab.ProcurarGrupoTaxaDep(nIdGrupo,nIdPessoa: Extended; nIdTaxaDep: Integer) : OleVariant;
begin
   _dbGrupoTaxaDep.IDGRUPO.AsFloat   := nIdGrupo;
   _dbGrupoTaxaDep.IDPESSOA.AsFloat  := nIdPessoa;
   _dbGrupoTaxaDep.IDTAXADEP.AsFloat := nIdTaxaDep;
   Result := GetDataPacket(_dbGrupoTaxaDep.sSQLSelect);
end;

procedure TCtrlGrupoContab.SetcdsPlanoGrupo(const Value: TClientDataSet);
begin
   FcdsPlanoGrupo := Value;
end;

procedure TCtrlGrupoContab.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlGrupoContab.SetcdsGrupoBemxCC(const Value: TClientDataSet);
begin
   FcdsGrupoBemxCC := Value;
end;

procedure TCtrlGrupoContab.SetcdsGrupoTaxaDep(const Value: TClientDataSet);
begin
   FcdsGrupoTaxaDep := Value;
end;

function TCtrlGrupoContab.ListaGrupoContab(nIdPessoa : Extended; nIdGrupo : Extended; sTipo : String; nFlgImovel: integer): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT G.IDGRUPO, PG.IDPESSOA, G.CLASSE, G.NOME, G.TIPO, G.STATUS, '+ #13 +
           '        G.DEPRECIACAO, G.DATAULTDEP, G.FLGIMOVEL, G.FLGSEMPLACA' + #13 +
           ' FROM PLANOGRUPO PG, '+ #13 +
           '      GRUPO G '+ #13 +
           ' WHERE (PG.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdGrupo <> -1 then
      sSql := sSql + '   AND (PG.IDGRUPO = ' + floattostr(nIdGrupo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if sTipo <> 'T' then
      sSql := sSql + '   AND (G.TIPO = ' + #39 + sTipo + #39 + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nFlgImovel <> -1 then
      sSql := sSql + '   AND (G.FLGIMOVEL = ' + IntToStr(nFlgImovel) + ') ' +#13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (PG.IDGRUPO = G.IDGRUPO) ' + #13 +
                  ' ORDER BY G.CLASSE ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlGrupoContab.ListaGrupoBemxCC(nIdGrupo, nIdPessoa : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT GCC.IDGRUPO, GCC.CODCENTROCUSTO, GCC.IDEMPRESA, '+ #13 +
           '        G.NOME AS DESCGRUPO, CC.NOME AS DESCCCUSTO' + #13 +
           ' FROM GRUPOBEMXCC GCC, '+ #13 +
           '      GRUPO G, '+ #13 +
           '      CENTCUST CC '+ #13 +
           ' WHERE (GCC.IDGRUPO   = ' + floattostr(nIdGrupo) + ') ' + #13 +
           '   AND (GCC.IDEMPRESA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (GCC.IDGRUPO   = G.IDGRUPO) ' + #13 +
           '   AND (GCC.CODCENTROCUSTO = CC.CODCENTROCUSTO) ' + #13 +
           '   AND (GCC.IDEMPRESA = CC.IDEMPRESA) ' + #13 +
           ' ORDER BY GCC.IDGRUPO,GCC.CODCENTROCUSTO ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlGrupoContab.ListaGrupoTaxaDep(nIdGrupo, nIdPessoa : Extended; iIdTaxaDep : Integer): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDGRUPO, IDPESSOA, IDTAXADEP, '+ #13 +
           '        TAXADEP, DESCTAXADEP ' + #13 +
           ' FROM GRUPOTAXADEP '+ #13 +
           ' WHERE (IDGRUPO  = ' + floattostr(nIdGrupo) + ') ' + #13 +
           '   AND (IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if iIdTaxaDep <> -1 then
      sSql := sSql + '   AND (IDTAXADEP = ' + inttostr(iIdTaxaDep) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY IDGRUPO,IDPESSOA,IDTAXADEP ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlGrupoContab.Tem_Filhos(sTipo, sNode : String) : boolean;
var
   sSql : String;

begin
   Result := False;
   if sTipo = 'S' then
   begin
      sSql := ' SELECT CLASSE,TIPO FROM GRUPO ' +
              ' WHERE (CLASSE LIKE ' + #39 + trim(sNode) + '%' + #39 + ')';
      _cds.Data := GetDataPacket( sSql );
      //----------------------------------------------------------------------------------
      if _cds.RecordCount > 1 then
      begin
         MessageInfo := 'Este grupo sintético possui filhos !';
         Result := True;
         Exit;
      end;
   end;
end;

function TCtrlGrupoContab.BensnoGrupo(nIdGrupo, nIdPessoa : Extended): Boolean;
var
   sSql : String;

begin
   Result := False;
   sSql := ' SELECT COUNT(IDGRUPO) AS QTD ' +
           ' FROM BEM ' +
           ' WHERE (IDGRUPO  = ' + floattostr(nIdGrupo) + ') ' +
           '   AND (IDPESSOA = ' + floattostr(nIdPessoa) + ') ' ;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.FieldByName('QTD').AsInteger <> 0 then
   begin
      MessageInfo := 'Existem bens cadastrados neste grupo !';
      Result := True;
      Exit;
   end;
end;

function TCtrlGrupoContab.Verifica_Node(sClasse, sNode : String; bNovo : Boolean;
                                        Var iGrau : Integer; lNivel: Array of Integer;
                                        Var Ind : Integer) : boolean;
var
   sPai, sSql : String;

begin
   Result := True;
   //-------------------------------------------------------------------------------------
   iGrau := CalcGrau(sNode,lNivel,ind,sPai);
   if iGrau = 0 then
   begin
      MessageInfo := 'Máscara de Grupo Inválida';
      Result := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if bNovo then
   begin
      sSql := 'SELECT CLASSE, TIPO FROM GRUPO WHERE CLASSE = ' + sClasse;
      _cds.Data := GetDataPacket( sSql );
      if not _cds.IsEmpty then
      begin
         MessageInfo := 'Codigo de Grupo já Cadastrado';
         Result := False;
         Exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if (iGrau > 1) then
   begin
      // Verifica se Conta Pai é Sintética
      sSql := 'SELECT CLASSE,TIPO FROM GRUPO WHERE CLASSE = ' + trim(sPai);
      _cds.Data := GetDataPacket( sSql );
      //----------------------------------------------------------------------------------
      if _cds.IsEmpty then
      begin
         MessageInfo := 'O Grupo ' + sNode + ' não tem Pai';
         Result := False;
      end else
      begin
         if _cds.FieldByName('TIPO').AsString = 'A' then
         begin // pai é analítico
            MessageInfo := 'Grupo Pai é analítico';
            Result := False;
         end;
      end;
   end;
end;

function TCtrlGrupoContab.MascaraOK(sMascara : String; var sMascPict : String;
                                    var lNivel  : Array  of Integer;
                                    var iSoma : Integer;var ind : Integer) : Boolean;
var
   i : Integer;
begin
   Result    := true;
   lNivel[0] := 1;
   iSoma     := 0;
   sMascPict := copy(sMascara,1,1);
   for i := 1 to Length(sMascara) do
   begin
      if i > 1 then
         sMascPict := sMascPict + copy(sMascara,i,1);
      if copy(sMascara,i,1) ='.' then
      begin
         ind := ind + 1;
         lnivel[ind] := i - ind - iSoma;
         iSoma := iSoma + lNivel[ind];
      end;
   end;
   if (ind = 0) and (length(sMascara) > 0) then
   begin
      lnivel[1] := length(sMascara);
      ind := 1;
   end;
   if ind = 0 then
      Result := false;
   lNivel[ind+1] := Length(sMascara) - ind - iSoma;
end;

function TCtrlGrupoContab.CalcGrau(sNoAnterior: String; lNivel: Array of Integer;
                                   ind: Integer; var sPai: String) : Integer;
var
   i    : Integer;
   iAux : Integer;
   sAux : String;
   lAux : Boolean;
begin
   iAux   := 0;
   Result := 0;
   sAux   := '';
   lAux   := false;
   for i := 1 to (ind + 1) do
   begin
      inc(Result);
      iAux := iAux + lNivel[i];
      if length(sNoAnterior) = iAux then
      begin
         lAux := True;
         sPai := Copy(sNoAnterior, 1, iAux - lNivel[i]);
         break;
      end;
   end;
   if not lAux then
      Result := 0;
end;

end.
