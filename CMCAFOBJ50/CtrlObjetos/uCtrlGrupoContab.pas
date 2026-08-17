{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina...........: AplicaOperacao
Nº SOL...........: 198886.18334
Data da Alteração: 10/01/2017
Responsável......: Darivaldo Alencar
Descrição........: Inclusão na tela Cadastro de Classe de Bens a opção para
                   inclusão da taxa de depreciação.
--------------------------------------------------------------------------------}
unit uCtrlGrupoContab;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,  
     SysUtils, dbclient, Provider, uMidasUtil,
     dMTBem,
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

      _dMTBem          : tdtmMTBem;

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
      function CMTranslate(sIgor : String) : String;

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
      function IniciaEmpresaxGrupo(nEmpresaProp : Extended) : Boolean;
      function IniciaDataUltFec(nEmpresaProp : Extended) : Boolean;
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function ProcurarPlanoGrupo(nIdPessoa : Extended; nIdGrupo : Extended = -1) : OleVariant;
      function ProcurarGrupoContab(nIdGrupo : Extended) : OleVariant;
      function ProcurarGrupoBemxCC(nIdPessoa, nIdGrupo : Extended) : OleVariant;
      function ProcurarGrupoTaxaDep(nIdGrupo,nIdPessoa : Extended; nIdTaxaDep : Integer) : OleVariant;
      function ListaGrupoContab(nIdPessoa : Extended; nIdGrupo : Extended = -1;
                                sTipo : String = 'T'; iInativo : Integer = -1): OleVariant;
      function ListaPlanoGrupo(nIdPessoa : Extended; nIdGrupo : Extended = -1): OleVariant;
      function ListaGrupoBemxCC(nIdGrupo, nIdPessoa : Extended): OleVariant;
      function ListaGrupoTaxaDep(nIdGrupo, nIdPessoa : Extended; iIdTaxaDep : Integer = -1): OleVariant;
      function MascaraOK(sMascara : String; var sMascPict : String;
                         var lNivel : Array of Integer;
                         var iSoma : Integer;var ind : Integer) : Boolean;
      function Verifica_Node(nEmpresaProp : Extended;
                             sClasse, sNode : String; bNovo : Boolean;
                             Var iGrau : Integer; lNivel: Array of Integer;
                             Var Ind : Integer) : boolean;
      function BensnoGrupo(nIdGrupo, nIdPessoa : Extended): Boolean;
      function Tem_Filhos(nEmpresaProp : Extended; sTipo, sNode : String) : boolean;
      function TransfOK(nIdPessoa, nIdGrupo : Extended) : boolean;
   end;

implementation

{ TCtrlGrupoContab }

function TCtrlGrupoContab.TransfOK(nIdPessoa, nIdGrupo : Extended) : boolean;
var
   sSql : String;
begin
   sSql := ' SELECT /*+ RULE */ IDMOVIMENTACAO ' +
           ' FROM HISTORICOMOVIMENTACAO '+
           ' WHERE (IDPESSOA = ' + floattostr(nIdPessoa) + ')' +
           '   AND (IDGRUPANT = ' + floattostr(nIdGrupo) + ')' +
           '   AND ((IDTIPOMOVIMENTACAO = 05) OR ' +
           '        (IDTIPOMOVIMENTACAO = 11) OR ' +
           '        (IDTIPOMOVIMENTACAO = 12)) ';
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   Result := _cds.RecordCount = 0;
end;

function TCtrlGrupoContab.IniciaEmpresaxGrupo(nEmpresaProp: Extended): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.IniciaEmpresaxGrupo(nEmpresaProp);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         Result := False;
         try
            StartTransaction;
            //----------------------------------------------------------------------------
            Fcds.Data := ListaGrupoContab(1);                         // Empresa Principal
            FcdsPlanoGrupo.Data := ListaPlanoGrupo(0);
            while not Fcds.EOF do
            begin
               FcdsPlanoGrupo.Append;
               FcdsPlanoGrupo.FieldByName('IDPESSOA').AsFloat := nEmpresaProp;
               FcdsPlanoGrupo.FieldByName('IDGRUPO').AsFloat  := Fcds.FieldByName('IDGRUPO').AsFloat;
               FcdsPlanoGrupo.Post;
               //-------------------------------------------------------------------------
               Fcds.Next;
            end;
            if not Fcds.IsEmpty then
               if not ApplyCds(FcdsPlanoGrupo,_dbPlanoGrupo,[],[]) then
                  Raise Exception.Create(_dbPlanoGrupo.MessageInfo);
            //----------------------------------------------------------------------------
            Commit;
            Result := True;
         except
            On E : Exception Do
            begin
               Rollback;
               MessageInfo := E.Message;
               Result := False;
            end;
         end;
      finally
         if not Fcds.IsEmpty then
            Fcds.Close;
         if not FcdsPlanoGrupo.IsEmpty then
            FcdsPlanoGrupo.Close;
      end;
   end;
end;

function TCtrlGrupoContab.IniciaDataUltFec(nEmpresaProp: Extended): Boolean;
var
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.IniciaDataUltFec(nEmpresaProp);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         sSql := ' SELECT PG.IDPESSOA, PG.IDGRUPO, PG.DATAULTFEC, G.DATAULTDEP ' + #13 +
                 ' FROM PLANOGRUPO PG, ' + #13 +
                 '      GRUPO G ' + #13 +
                 ' WHERE (PG.IDPESSOA = ' + floattostr(nEmpresaProp) +') ' + #13 +
                 '   AND (PG.DATAULTFEC IS NULL) ' + #13 +
                 '   AND (G.TIPO = ''A'') ' + #13 +
                 '   AND (PG.INATIVO = 0) ' + #13 +
                 '   AND (PG.IDGRUPO = G.IDGRUPO) ' + #13;
         _cds.Data := GetDataPacket(sSql);
         //-------------------------------------------------------------------------------
         while not _cds.EOF do
         begin
            if not _cds.FieldByName('DATAULTDEP').IsNull then
            begin
               _dMTBem.sqlNewDataUltFec.Prepare;
               _dMTBem.sqlNewDataUltFec.ParamByName('DATAULTDEP').AsDateTime := _cds.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlNewDataUltFec.ParamByName('IDGRUPO').AsFloat  := _cds.FieldByName('IDGRUPO').AsFloat;
               _dMTBem.sqlNewDataUltFec.ParamByName('IDPESSOA').AsFloat := _cds.FieldByName('IDPESSOA').AsFloat;
               if not ExecSQL(_dMTBem.sqlNewDataUltFec.SQLChanged, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            _cds.Next;
         end;
         _cds.Close;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception Do
         begin
            Rollback;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;

function TCtrlGrupoContab.AplicaOperacao(sTipoOperacao: String): Boolean;
var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoGRUPOCONTAB(sTipoOperacao,
                                                               Fcds.Data,
                                                               FcdsPlanoGrupo.Data,
                                                               FcdsGrupoBemxCC.Data,
                                                               FcdsGrupoTaxaDep.Data);
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

            if assigned(FcdsGrupoTaxaDep) then begin //Darivaldo Alencar SOL.198886.18334
                Result := ApplyCds(FcdsGrupoTaxaDep,_dbGrupoTaxaDep,[_dbGrupoContab.Idgrupo],[_dbGrupoTaxaDep.Idgrupo]);
                sMensagem := _dbGrupoTaxaDep.MessageInfo;
                if not Result then Raise Exception.Create(sMensagem);
              end;
         end else // Remoção
         begin
            if not TransfOK(FcdsPlanoGrupo.FieldByName('IDPESSOA').AsFloat,
                            FcdsPlanoGrupo.FieldByName('IDGRUPO').AsFloat) then
               Raise Exception.Create(CMTranslate('Grupo Contábil registrado em Transferencias. Exclusão Negada!'));

            if assigned(FcdsGrupoTaxaDep) then begin //Darivaldo Alencar SOL.198886.18334
                  Result := ApplyCds(FcdsGrupoTaxaDep,_dbGrupoTaxaDep,[],[]);
                  sMensagem := _dbGrupoTaxaDep.MessageInfo;
                  if not Result then Raise Exception.Create(sMensagem);
              end;

            Result := ApplyCds(FcdsGrupoBemxCC,_dbGrupoBemxCC,[],[]);
            sMensagem := _dbGrupoBemxCC.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsPlanoGrupo,_dbPlanoGrupo,[],[]);
            sMensagem := _dbPlanoGrupo.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            if sTipoOperacao = 'S' then
            begin
               Result := ApplyCds(Fcds,_dbGrupoContab,[],[]);
               sMensagem := _dbGrupoContab.MessageInfo;
               if not Result then Raise Exception.Create(sMensagem);
            end;   
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
   _dbGrupoContab   := TDbGrupoContab.Create(Self);
   _dbPlanoGrupo    := TDbPlanoGrupo.Create(Self);
   _dbGrupoBemxCC   := TDbGrupoBemxCC.Create(Self);
   _dbGrupoTaxaDep  := TDbGrupoTaxaDep.Create(Self);

   _dMTBem          := tdtmMTBem.Create(Self);

end;

destructor TCtrlGrupoContab.Destroy;
begin
   if IsAppServer then
      FreeCDS([fCds,fCdsPlanoGrupo,fCdsGrupoBemxCC,fCdsGrupoTaxaDep]);

   _dbGrupoContab.Free;
   _dbPlanoGrupo.Free;
   _dbGrupoBemxCC.Free;
   _dbGrupoTaxaDep.Free;

   _dMTBem.Free;

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
   _dbPlanoGrupo.IDPESSOA.AsFloat := nIdPessoa;
   _dbPlanoGrupo.IDGRUPO.AsFloat  := nIdGrupo;
   Result := GetDataPacket(_dbPlanoGrupo.sSQLSelect);
end;

function TCtrlGrupoContab.ProcurarGrupoContab(nIdGrupo: Extended) : OleVariant;
begin
   _dbGrupoContab.IDGRUPO.AsFloat := nIdGrupo;
   Result := GetDataPacket(_dbGrupoContab.sSQLSelect);
end;

function TCtrlGrupoContab.ProcurarGrupoBemxCC(nIdPessoa, nIdGrupo : Extended) : OleVariant;
begin
   _dbGrupoBemxCC.IDGRUPO.AsFloat := nIdGrupo;
   _dbGrupoBemxCC.IDPESSOA.AsFloat := nIdPessoa;
   Result := GetDataPacket(_dbGrupoBemxCC.sSQLSelect);
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

function TCtrlGrupoContab.ListaGrupoContab(nIdPessoa : Extended; nIdGrupo : Extended;
                                           sTipo : String; iInativo : Integer): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT G.IDGRUPO, PG.IDPESSOA, G.CLASSE, G.NOME, G.TIPO, G.STATUS, ' +
           '        G.DEPRECIACAO, PG.DATAULTFEC, G.FLGIMOVEL, G.FLGSEMPLACA, G.INATIVO' +
           ' FROM PLANOGRUPO PG, ' +
           '      GRUPO G '+
           ' WHERE PG.IDPESSOA = ' + floattostr(nIdPessoa);
   //-------------------------------------------------------------------------------------
   if nIdGrupo <> -1 then
      sSql := sSql + '   AND PG.IDGRUPO = ' + floattostr(nIdGrupo);
   //-------------------------------------------------------------------------------------
   if sTipo <> 'T' then
      sSql := sSql + '   AND G.TIPO = ' + #39 + sTipo + #39;
   //-------------------------------------------------------------------------------------
   if iInativo <> -1 then
      sSql := sSql + '   AND G.INATIVO = ' + inttostr(iInativo);
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND PG.IDGRUPO = G.IDGRUPO ' +
                  ' ORDER BY G.CLASSE ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlGrupoContab.ListaPlanoGrupo(nIdPessoa, nIdGrupo: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDPESSOA, IDGRUPO, DATAULTFEC, INATIVO' + #13 +
           ' FROM PLANOGRUPO '+ #13 +
           ' WHERE (IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdGrupo <> -1 then
      sSql := sSql + '   AND (IDGRUPO = ' + floattostr(nIdGrupo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlGrupoContab.ListaGrupoBemxCC(nIdGrupo, nIdPessoa : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT GCC.IDGRUPO, GCC.IDPESSOA, RTRIM(GCC.CODCENTROCUSTO) AS CODCENTROCUSTO, GCC.IDEMPRESA, '+ #13 +
           '        G.NOME AS DESCGRUPO, CC.NOME AS DESCCCUSTO' + #13 +
           ' FROM GRUPOBEMXCC GCC, '+ #13 +
           '      GRUPO G, '+ #13 +
           '      CENTCUST CC '+ #13 +
           ' WHERE (GCC.IDGRUPO   = ' + floattostr(nIdGrupo) + ') ' + #13 +
           '   AND (GCC.IDEMPRESA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (GCC.IDGRUPO   = G.IDGRUPO) ' + #13 +
           '   AND (GCC.CODCENTROCUSTO = CC.CODCENTROCUSTO) ' + #13 +
           '   AND (GCC.IDEMPRESA = CC.IDEMPRESA) ' + #13 +
           ' ORDER BY GCC.IDGRUPO, CODCENTROCUSTO ';
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


function TCtrlGrupoContab.Tem_Filhos(nEmpresaProp : Extended;
                                     sTipo, sNode : String) : boolean;
var
   sSql : String;

begin
   Result := False;
   if sTipo = 'S' then
   begin
      sSql := ' SELECT G.CLASSE, G.TIPO ' +
              ' FROM GRUPO G, ' +
              '      PLANOGRUPO PG ' +
              ' WHERE RTRIM(CLASSE) LIKE ' + #39 + trim(sNode) + '%' + #39 +
              '   AND PG.IDPESSOA = ' + floattostr(nEmpresaProp) +
              '   AND PG.INATIVO = 0' +
              '   AND PG.IDGRUPO = G.IDGRUPO';
      _cds.Data := GetDataPacket( sSql );
      //----------------------------------------------------------------------------------
      if _cds.RecordCount > 1 then
      begin
         MessageInfo := CMTranslate('Este grupo sintético possui filhos !');
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
      MessageInfo := CMTranslate('Existem bens cadastrados neste grupo !');
      Result := True;
      Exit;
   end;
end;

function TCtrlGrupoContab.Verifica_Node(nEmpresaProp : Extended;
                                        sClasse, sNode : String; bNovo : Boolean;
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
      MessageInfo := CMTranslate('Máscara de Grupo Inválida');
      Result := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if bNovo then
   begin
      sSql := ' SELECT G.CLASSE, G.TIPO ' +
              ' FROM GRUPO G, ' +
              '      PLANOGRUPO PG ' +
              ' WHERE RTRIM(G.CLASSE) = ' + QuotedStr(trim(sClasse)) +
              '   AND PG.IDPESSOA = ' + floattostr(nEmpresaProp) +
              '   AND PG.INATIVO = 0' +
              '   AND PG.IDGRUPO = G.IDGRUPO';
      _cds.Data := GetDataPacket( sSql );
      if not _cds.IsEmpty then
      begin
         MessageInfo := CMTranslate('Código de Grupo já Cadastrado');
         Result := False;
         Exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if iGrau > 1 then
   begin
      // Verifica se Conta Pai é Sintética
      sSql := ' SELECT G.CLASSE, G.TIPO ' +
              ' FROM GRUPO G, ' +
              '      PLANOGRUPO PG ' +
              ' WHERE RTRIM(G.CLASSE) = ' + QuotedStr(trim(sPai)) +
              '   AND PG.IDPESSOA = ' + floattostr(nEmpresaProp) +
              '   AND PG.INATIVO = 0' +
              '   AND PG.IDGRUPO = G.IDGRUPO';
      _cds.Data := GetDataPacket( sSql );
      //----------------------------------------------------------------------------------
      if _cds.IsEmpty then
      begin
         MessageInfo := CMTranslate('O Grupo ') + sNode + CMTranslate(' não tem Pai');
         Result := False;
      end else
      begin
         if _cds.FieldByName('TIPO').AsString = 'A' then
         begin
            // pai é analítico
            MessageInfo := CMTranslate('Grupo Pai é analítico');
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


function TCtrlGrupoContab.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.
