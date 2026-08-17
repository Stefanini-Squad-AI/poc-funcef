unit uCtrlClassedeBem;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, SysUtils, uCMTypes, dbclient,
     Provider, uSistema, uDBClassedeBem, uDBClassexGrupo;

Type
   TCtrlClassedeBem = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbClassedeBem  : TDbClassedeBem;
      _dbClassexGrupo : TDbClassexGrupo;

      Fcds,
      FcdsClassexGrupo : TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsClassexGrupo(const Value: TClientDataSet);

      function CalcGrau(sNoAnterior: String; lNivel: Array of Integer;
                        ind: Integer; var sPai: String) : Integer;
   Public
      property cds             : TClientDataSet read Fcds             write Setcds;
      property cdsClassexGrupo : TClientDataSet read FcdsClassexGrupo write SetcdsClassexGrupo;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function ProcurarClassedeBem(nIdClasse : Extended) : OleVariant;
      function ProcurarClassexGrupo(nIdClasse : Extended) : OleVariant;
      function ListaClassedeBem(nIdClasse : Extended = -1): OleVariant;
      function ListaClassexGrupo(nIdClasse, nIdPessoa: Extended): OleVariant;
      function MascaraOK(sMascara : String; var sMascPict : String;
                         var lNivel : Array of Integer;
                         var iSoma : Integer;var ind : Integer) : Boolean;
      function Verifica_Node(sClasse, sNode : String; bNovo : Boolean;
                             Var iGrau : Integer; lNivel: Array of Integer;
                             Var Ind : Integer) : boolean;
      function BensnaClasse(nIdClasse : Extended): Boolean;
      function Tem_Filhos(sTipo, sNode : String) : boolean;
   end;

implementation

{ TCtrlClassedeBem }

function TCtrlClassedeBem.AplicaOperacao(sTipoOperacao: String): Boolean;
Var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoCLASSEDEBEM(Fcds.Data,
                                                               FcdsClassexGrupo.Data,
                                                               sTipoOperacao);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         if sTipoOperacao = 'E' then // Inclusão e Alteração
         begin
            Result := ApplyCds(Fcds,_dbClassedeBem,[],[]);
            sMensagem := _dbClassedeBem.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsClassexGrupo,_dbClassexGrupo,[_dbClassedeBem.IdClasseBem],[_dbClassexGrupo.IdClasseBem]);
            sMensagem := _dbClassexGrupo.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);
         end else // Remoção
         begin
            Result := ApplyCds(FcdsClassexGrupo,_dbClassexGrupo,[_dbClassedeBem.IdClasseBem],[_dbClassexGrupo.IdClasseBem]);
            sMensagem := _dbClassexGrupo.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(Fcds,_dbClassedeBem,[],[]);
            sMensagem := _dbClassedeBem.MessageInfo;
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

constructor TCtrlClassedeBem.Create;
begin
   inherited;
   _dbClassedeBem  := TDbClassedeBem.Create;
   _dbClassexGrupo := TDbClassexGrupo.Create;

   fCds             := TClientDataSet.Create(nil);
   fCdsClassexGrupo := TClientDataSet.Create(nil);
end;

destructor TCtrlClassedeBem.Destroy;
begin
   if fCds.Active             then fCds.Close;
   if fCdsClassexGrupo.Active then fCdsClassexGrupo.Close;

   fCds := nil;
   fCdsClassexGrupo := nil;

   fCds.Free;
   fCdsClassexGrupo.Free;

   _dbClassedeBem.Free;
   _dbClassexGrupo.Free;

   inherited;
end;

procedure TCtrlClassedeBem.DoChangeDataBase;
begin
   inherited;
   _dbClassedeBem.DataBaseName  := DataBaseName;
   _dbClassexGrupo.DataBaseName := DataBaseName;
end;

function TCtrlClassedeBem.ProcurarClassedeBem(nIdClasse: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarCLASSEDEBEM( nIdClasse ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbClassedeBem.IDCLASSEBEM.AsFloat  := nIdClasse;
      Result := GetDataPacket(_dbClassedeBem.sSQLSelect);
   end;
end;

function TCtrlClassedeBem.ProcurarClassexGrupo(nIdClasse: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarCLASSEXGRUPO( nIdClasse ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbClassexGrupo.IDCLASSEBEM.AsFloat  := nIdClasse;
      Result := GetDataPacket(_dbClassexGrupo.sSQLSelect);
   end;
end;

procedure TCtrlClassedeBem.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlClassedeBem.SetcdsClassexGrupo(const Value: TClientDataSet);
begin
   FcdsClassexGrupo := Value;
end;

function TCtrlClassedeBem.ListaClassedeBem(nIdClasse: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDCLASSEBEM, CODHIERARQ, DESCRICAO, MASCARAIDOPCIONAL '+ #13 +
           ' FROM CLASSEDEBEM '+ #13 ;
   //-------------------------------------------------------------------------------------
   if nIdClasse <> -1 then
      sSql := sSql + ' WHERE (IDCLASSEBEM = ' + floattostr(nIdClasse) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY CODHIERARQ ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlClassedeBem.ListaClassexGrupo(nIdClasse, nIdPessoa: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT CG.IDCLASSEBEM, CG.IDGRUPO, PG.IDPESSOA, '+ #13 +
           '        C.DESCRICAO AS DESCCLASSE, G.NOME AS DESCGRUPO' + #13 +
           ' FROM CLASSEXGRUPO CG, '+ #13 +
           '      CLASSEDEBEM C, '+ #13 +
           '      PLANOGRUPO PG, '+ #13 +
           '      GRUPO G '+ #13 +
           ' WHERE (CG.IDCLASSEBEM = ' + floattostr(nIdClasse) + ') ' + #13 +
           '   AND (PG.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (CG.IDCLASSEBEM = C.IDCLASSEBEM) ' + #13 +
           '   AND (CG.IDGRUPO = G.IDGRUPO) ' + #13 +
           '   AND (G.IDGRUPO = PG.IDGRUPO) ' + #13 +
           ' ORDER BY CG.IDCLASSEBEM, CG.IDGRUPO';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlClassedeBem.Tem_Filhos(sTipo, sNode: String): boolean;
var
   sSql : String;

begin
   Result := False;
   if sTipo = 'S' then
   begin
      sSql := ' SELECT CODHIERARQ, ANASINT FROM CLASSEDEBEM ' +
              ' WHERE (CODHIERARQ LIKE ' + #39 + trim(sNode) + '%' + #39 + ')';
      _cds.Data := GetDataPacket( sSql );
      //----------------------------------------------------------------------------------
      if _cds.RecordCount > 1 then
      begin
         MessageInfo := 'Esta classe sintética possui filhos !';
         Result := True;
         Exit;
      end;
   end;
end;

function TCtrlClassedeBem.BensnaClasse(nIdClasse : Extended): Boolean;
var
   sSql : String;

begin
   Result := False;
   sSql := ' SELECT COUNT(IDCLASSEBEM) AS QTD ' +
           ' FROM BEM ' +
           ' WHERE (IDCLASSEBEM  = ' + floattostr(nIdClasse) + ') ';
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.FieldByName('QTD').AsInteger <> 0 then
   begin
      MessageInfo := 'Existem ' + _cds.FieldByName('QTD').AsString + ' bens cadastrados nesta classe !';
      Result := True;
      Exit;
   end;
end;

function TCtrlClassedeBem.Verifica_Node(sClasse, sNode: String; bNovo: Boolean;
                                        var iGrau: Integer; lNivel: array of Integer;
                                        var Ind: Integer): boolean;
var
   sPai, sSql : String;

begin
   Result := True;
   //-------------------------------------------------------------------------------------
   iGrau := CalcGrau(sNode, lNivel, ind, sPai);
   if iGrau = 0 then
   begin
      MessageInfo := 'Máscara de Classe Inválida';
      Result := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if bNovo then
   begin
      sSql := 'SELECT CODHIERARQ, ANASINT FROM CLASSEDEBEM WHERE CODHIERARQ = ' + sClasse;
      _cds.Data := GetDataPacket( sSql );
      if not _cds.IsEmpty then
      begin
         MessageInfo := 'Codigo da Classe já Cadastrado';
         Result := False;
         Exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if (iGrau > 1) then
   begin
      // Verifica se Conta Pai é Sintética
      sSql := 'SELECT CODHIERARQ, ANASINT FROM CLASSEDEBEM WHERE CODHIERARQ = ' + trim(sPai);
      _cds.Data := GetDataPacket( sSql );
      //----------------------------------------------------------------------------------
      if _cds.IsEmpty then
      begin
         MessageInfo := 'A Classe ' + sNode + ' não tem Pai';
         Result := False;
      end else
      begin
         if _cds.FieldByName('ANASINT').AsString = 'A' then
         begin // pai é analítico
            MessageInfo := 'Classe Pai é analítica';
            Result := False;
         end;
      end;
   end;
end;

function TCtrlClassedeBem.MascaraOK(sMascara: String; var sMascPict: String;
                                    var lNivel: array of Integer;
                                    var iSoma, ind: Integer): Boolean;
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

function TCtrlClassedeBem.CalcGrau(sNoAnterior: String; lNivel: array of Integer;
                                   ind: Integer; var sPai: String): Integer;
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
