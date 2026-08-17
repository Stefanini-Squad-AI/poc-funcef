{-------------------------------------------------------------------------------
---------------------ALTERAÇÕES / IMPLEMENTAÇÕES -------------------------------
--------------------------------------------------------------------------------
Rotina...........: ListaClassedeBem
Nº SIG...........: 48344
Data da Alteração: 14/12/2018
Responsável......: Eveson Cunha
Descrição........: Segregação do inventário dos bens
De acordo com o MEG 075 de infraestrutura, subitem 5.1.10.1 - A COPAD realizará
inventário anual dos Bens Patrimoniais, exceto os equipamentos de TI.
Os equipamentos de TI serão inventariados pela GETIF.
--------------------------------------------------------------------------------
Rotina...........: _
Nº SOL...........: 198886.18334
Data da Alteração: 10/01/2017
Responsável......: Darivaldo Alencar
Descrição........: incluído na tela Cadastro de Classe de Bens a opção para
                   inclusão da taxa de depreciação
--------------------------------------------------------------------------------}


unit uCtrlClassedeBem;

interface

Uses DB, uCmDbObject, uCmControlObject, SysUtils, uCMTypes, dbclient,
     Provider, uDBClassedeBem, uDBClassexGrupo,uDBClasseTaxaDep,uSistema;

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
      _dbClasseTaxaDep: TDBClasseTaxaDep; //Darivaldo Alencar SOL.198886.18334

      Fcds,
      FcdsClassexGrupo : TClientDataSet;
      FCdsClasseTaxaDep: TClientDataSet;//Darivaldo Alencar SOL.198886.18334

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsClassexGrupo(const Value: TClientDataSet);
      procedure SetCdsClasseTaxaDep(const Value: TClientDataSet);//Darivaldo Alencar SOL.198886.18334

      function CalcGrau(sNoAnterior: String; lNivel: Array of Integer;
                        ind: Integer; var sPai: String) : Integer;
      function CMTranslate(sIgor : String) : String;
   Public
      property cds             : TClientDataSet read Fcds             write Setcds;
      property cdsClassexGrupo : TClientDataSet read FcdsClassexGrupo write SetcdsClassexGrupo;
      property CdsClasseTaxaDep: TClientDataSet read FCdsClasseTaxaDep write SetCdsClasseTaxaDep;//Darivaldo Alencar SOL.198886.18334
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function AplicaOperacao(nIdEmpresa : Extended; sTipoOperacao : String) : Boolean;
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
      function ProcurarClasseTaxaDep(nIdClasse: Extended): OleVariant; //Darivaldo Alencar SOL.198886.18334
   end;

implementation

{ TCtrlClassedeBem }

function TCtrlClassedeBem.AplicaOperacao(nIdEmpresa: Extended; sTipoOperacao: String): Boolean;
var
   sSql, sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoCLASSEDEBEM(nIdEmpresa,
                                                               sTipoOperacao,
                                                               Fcds.Data,
                                                               FcdsClassexGrupo.Data,
                                                               FCdsClasseTaxaDep.Data//Darivaldo Alencar SOL.198886.18334
                                                               );
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

            sSql := ' DELETE CLASSEXGRUPO ' + #13 +
                    ' WHERE (IDCLASSEBEM = ' + _dbClassedeBem.IdClasseBem.AsString + ')' + #13 +
                    '   AND (IDGRUPO IN (SELECT IDGRUPO ' + #13 +
                    '                    FROM PLANOGRUPO ' + #13 +
                    '                    WHERE IDPESSOA = ' + floattostr(nIdEmpresa) + '))' + #13;
            if not ExecSQL(sSql, False) then Raise Exception.Create(MessageInfo);

            Result := ApplyCds(FcdsClassexGrupo,_dbClassexGrupo,[_dbClassedeBem.IdClasseBem],[_dbClassexGrupo.IdClasseBem]);
            sMensagem := _dbClassexGrupo.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            //Darivaldo Alencar SOL.198886.18334-inicio
            if (Sistema.IdModulo = 7) then
              begin
                Result := ApplyCds(FCdsClasseTaxaDep,_dbClasseTaxaDep,[_dbClassedeBem.IdClasseBem],[_dbClasseTaxaDep.IdClasseBem]);
                sMensagem := _dbClasseTaxaDep.MessageInfo;
                if not Result then Raise Exception.Create(sMensagem);
              end;
            //Darivaldo Alencar SOL.198886.18334-fim
         end else // Remoção
         begin
            Result := ApplyCds(FcdsClassexGrupo,_dbClassexGrupo,[_dbClassedeBem.IdClasseBem],[_dbClassexGrupo.IdClasseBem]);
            sMensagem := _dbClassexGrupo.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            //Darivaldo Alencar SOL.198886.18334-inicio
            if (Sistema.IdModulo = 7) then
                begin
                  Result := ApplyCds(FCdsClasseTaxaDep,_dbClasseTaxaDep,[_dbClassedeBem.IdClasseBem],[_dbClasseTaxaDep.IdClasseBem]);
                  sMensagem := _dbClasseTaxaDep.MessageInfo;
                  if not Result then Raise Exception.Create(sMensagem);
                end;
            //Darivaldo Alencar SOL.198886.18334-fim

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
   _dbClassedeBem  := TDbClassedeBem.Create(Self);
   _dbClassexGrupo := TDbClassexGrupo.Create(Self);
   _dbClasseTaxaDep:= TDBClasseTaxaDep.Create(self); //Darivaldo Alencar SOL.198886.18334

   fCds             := TClientDataSet.Create(nil);
   fCdsClassexGrupo := TClientDataSet.Create(nil);
   FCdsClasseTaxaDep:= TClientDataSet.Create(nil);  //Darivaldo Alencar SOL.198886.18334
end;

destructor TCtrlClassedeBem.Destroy;
begin
   if fCds.Active             then fCds.Close;
   if fCdsClassexGrupo.Active then fCdsClassexGrupo.Close;
   if FCdsClasseTaxaDep.Active then FCdsClasseTaxaDep.Close; //Darivaldo Alencar SOL.198886.18334

   fCds := nil;
   fCdsClassexGrupo := nil;
   FCdsClasseTaxaDep:= nil;//Darivaldo Alencar SOL.198886.18334

   fCds.Free;
   fCdsClassexGrupo.Free;
   FCdsClasseTaxaDep.Free;//Darivaldo Alencar SOL.198886.18334

   _dbClassedeBem.Free;
   _dbClassexGrupo.Free;
   _dbClasseTaxaDep.Free; //Darivaldo Alencar SOL.198886.18334

   inherited;
end;

procedure TCtrlClassedeBem.DoChangeDataBase;
begin
   inherited;
   _dbClassedeBem.DataBaseName  := DataBaseName;
   _dbClassexGrupo.DataBaseName := DataBaseName;
   _dbClasseTaxaDep.DataBaseName := DataBaseName;//Darivaldo Alencar SOL.198886.18334
end;

function TCtrlClassedeBem.ProcurarClassedeBem(nIdClasse: Extended): OleVariant;
begin
   _dbClassedeBem.IDCLASSEBEM.AsFloat  := nIdClasse;
   Result := GetDataPacket(_dbClassedeBem.sSQLSelect);
end;

function TCtrlClassedeBem.ProcurarClassexGrupo(nIdClasse: Extended): OleVariant;
begin
   _dbClassexGrupo.IDCLASSEBEM.AsFloat  := nIdClasse;
   Result := GetDataPacket(_dbClassexGrupo.sSQLSelect);
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
//   sSql := ' SELECT IDCLASSEBEM, CODHIERARQ, DESCRICAO, MASCARAIDOPCIONAL '+ #13 +                 //Everson Cunha - SIG48344
   sSql := ' SELECT IDCLASSEBEM, CODHIERARQ, DESCRICAO, MASCARAIDOPCIONAL, FLGINVENTARIOTI '+ #13 +  //Everson Cunha - SIG48344
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
              ' WHERE (RTRIM(CODHIERARQ) LIKE ' + #39 + trim(sNode) + '%' + #39 + ')';
      _cds.Data := GetDataPacket( sSql );
      //----------------------------------------------------------------------------------
      if _cds.RecordCount > 1 then
      begin
         MessageInfo := CMTranslate('Esta classe sintética possui filhos !');
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
      MessageInfo := CMTranslate('Existem ') + _cds.FieldByName('QTD').AsString + CMTranslate(' bens cadastrados nesta classe !');
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
      MessageInfo := CMTranslate('Máscara de Classe Inválida');
      Result := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if bNovo then
   begin
      sSql := 'SELECT CODHIERARQ, ANASINT FROM CLASSEDEBEM WHERE RTRIM(CODHIERARQ) = ' + trim(sClasse);
      _cds.Data := GetDataPacket( sSql );
      if not _cds.IsEmpty then
      begin
         MessageInfo := CMTranslate('Codigo da Classe já Cadastrado');
         Result := False;
         Exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if (iGrau > 1) then
   begin
      // Verifica se Conta Pai é Sintética
      sSql := 'SELECT CODHIERARQ, ANASINT FROM CLASSEDEBEM WHERE RTRIM(CODHIERARQ) = ' + trim(sPai);
      _cds.Data := GetDataPacket( sSql );
      //----------------------------------------------------------------------------------
      if _cds.IsEmpty then
      begin
         MessageInfo := CMTranslate('A Classe ') + sNode + CMTranslate(' não tem Pai');
         Result := False;
      end else
      begin
         if _cds.FieldByName('ANASINT').AsString = 'A' then
         begin // pai é analítico
            MessageInfo := CMTranslate('Classe Pai é analítica');
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

function TCtrlClassedeBem.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

//Darivaldo Alencar SOL.198886.18334 -inicio
procedure TCtrlClassedeBem.SetCdsClasseTaxaDep(const Value: TClientDataSet);
begin
   FCdsClasseTaxaDep := Value;
end;

function TCtrlClassedeBem.ProcurarClasseTaxaDep(nIdClasse: Extended): OleVariant;
begin
   _dbClasseTaxaDep.IdClasseBem.AsFloat  := nIdClasse;
   Result := GetDataPacket(_dbClasseTaxaDep.sSQLSelect);
end;
//Darivaldo Alencar SOL.198886.18334 -fim

end.
