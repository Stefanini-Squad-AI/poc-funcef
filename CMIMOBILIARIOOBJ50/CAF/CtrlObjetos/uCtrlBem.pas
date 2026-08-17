unit uCtrlBem;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, wwStoreP,
     SysUtils, dbclient, Provider, uSistema, uMidasUtil, uCMTypes,
     uDBBem, uDBBemxMoeda, uDBBemxDep, uDBPlanoPatroxBem,
     uDBSaldoContabBem, uDBSldCtbBemxDep, dMTBem,
     uCtrlParamCAF, uCtrlConjunto, uCtrlHistMovBem,
     uCtrlLancamento, uCtrlPeriodo, uCtrlContaContabil {Integração Contábil};

Type
   TCtrlBem = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbBem             : TDBBem;
      _dbBemxMoeda       : TDBBemxMoeda;
      _dbBemxDep         : TDBBemxDep;
      _dbPlanoPatroxBem  : TDBPlanoPatroxBem;

      _dbSaldoContabBem  : TDBSaldoContabBem;
      _dbSldCtbBemxDep   : TDBSldCtbBemxDep;

      _dMTBem           : tdtmMTBem;

      Fcds,
      FcdsBemxMoeda,
      FcdsBemxDep,
      FcdsPlanoPatroxBem,
      FcdsSaldoContabBem,
      FcdsSldCtbBemxDep,
      FcdsMontaContab,
      FcdsMovContabBem   : TClientDataSet;

      sprSaldoContabBem,
      sprSldCtbBemxDep   : TwwStoredProc;

      ParamCAF      : TCtrlParamCAF;
      Conjunto      : TCtrlConjunto;
      HistMovBem    : TCtrlHistMovBem;
      LancaContab   : TCtrlLancamento;
      ContaContab   : TCtrlContaContabil;
      PeriodoContab : TCtrlPeriodo;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsPlanoPatroxBem(const Value: TClientDataSet);
      procedure SetcdsSaldoContabBem(const Value: TClientDataSet);
      procedure SetcdsSldCtbBemxDep(const Value: TClientDataSet);
      procedure SetcdsMontaContab(const Value: TClientDataSet);
      procedure SetcdsMovContabBem(const Value: TClientDataSet);
      //----------------------------------------------------------------------------------
      // Funções de integração contábil
      //----------------------------------------------------------------------------------
      function VerificaPeriodoContabil(fEmpresa : Extended; dData: TDateTime;
                                       Var iExercicio, iPeriodo : Integer) : Boolean;
      function ContabilizaEntrada(iModulo, iEmpresa, iBem, iGrupo, iConjunto,
                                  iAtivProjeto, iSubConta : Integer;
                                  sPlaca, sDesBem, sGrupo : String;
                                  dDataLanc : TDatetime; nValOrg : Extended) : Boolean;
      function LeParamCafxContab(iEmpresa, iGrupo, iTipoMov : Integer;
                                 sTipoLanc: String;
                                 Var iPlano : Integer; Var sPlaConta : String) : Boolean;
      function MontaLancContab(iTipoContab : Integer; sDebCred : String;
                               iPlano : Integer; sConta, sCC : String;
                               iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo : Integer;
                               sGrupo : String; nValLanc : Extended;
                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5 : String) : Boolean;
      function RegistraPlanilhaContabil(nModulo, nEmpresa, nUsuario : Extended;
                                        sDataLanc : String) : Extended;
      //----------------------------------------------------------------------------------
      // Funções Auxiliares da Classe
      //----------------------------------------------------------------------------------
      function TiraCaracter(sStr : string; sCh : Char) : string;
      function ComplZeros(sCodigo : String; iTam : Integer) : string;
      function CotacaoMoeda(iMoeda : Integer; dData : tDateTime) : Extended;

   Public
      property cds : TClientDataSet               read Fcds               write Setcds;
      property cdsBemxMoeda : TClientDataSet      read FcdsBemxMoeda      write SetcdsBemxMoeda;
      property cdsBemxDep : TClientDataSet        read FcdsBemxDep        write SetcdsBemxDep;
      property cdsPlanoPatroxBem : TClientDataSet read FcdsPlanoPatroxBem write SetcdsPlanoPatroxBem;
      property cdsSaldoContabBem : TClientDataSet read FcdsSaldoContabBem write SetcdsSaldoContabBem;
      property cdsSldCtbBemxDep : TClientDataSet  read FcdsSldCtbBemxDep  write SetcdsSldCtbBemxDep;
      property cdsMontaContab : TClientDataSet    read FcdsMontaContab    write SetcdsMontaContab;
      property cdsMovContabBem : TClientDataSet   read FcdsMovContabBem   write SetcdsMovContabBem;

      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function ExecutaEntrada(fValorTotal : Extended = 0; iQuantidade : Integer = 1) : Boolean;
      function ExecutaEntradaBem(Var nPlanilha : Extended) : LongInt;
      function AtualizaSaldoContabBem(iEmpresaProp, iBem : Integer;
                                      dDataSld : tDateTime;
                                      iMoeCodigo,
                                      iTaxaDep : Integer;
                                      nValOrg, nCmBem, nDepLanc, nCmDep,
                                      nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
                                      nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc, nUltReavCmDep : Extended;
                                      iCodMov, iPai : Integer) : Boolean;
      //----------------------------------------------------------------------------------
      function ProcurarBem(nIdPessoa, nIdBem : Extended) : OleVariant;
      function ProcurarBemxMoeda(nIdPessoa, nIdBem, nMoeCodigo : Extended) : OleVariant;
      function ProcurarBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep : Extended) : OleVariant;
      function ProcurarPlanoPatroxBem(nIdPessoa, nIdBem, nIdPlanoPrev, nIdPatro : Extended) : OleVariant;
      function ListaBem(nIdPessoa : Extended; nIdBem : Extended = -1): OleVariant;
      function ListaBemxMoeda(nIdPessoa, nIdBem : Extended; nMoeCodigo : Extended = -1): OleVariant;
      function ListaBemxDep(nIdPessoa, nIdBem : Extended; nMoeCodigo : Extended = -1;
                            nIdBemxDep : Extended = -1): OleVariant;
      function ListaPlanoPatroxBem(nIdPessoa, nIdBem : Extended; nIdPatro : Extended = -1;
                                   nIdPlanoPrev : Extended = -1) : OleVariant;
      function ListaFornecedor(nIdForn : Extended = -1): OleVariant;
      function BemcomMovimento(nIdPessoa, nIdBem : Extended) : Boolean;
      function BemSelecionado(nIdPessoa, nIdBem : Extended) : Boolean;
      function BuscaGrupoContab(nIdPessoa, nIdClasse, nIdLocal : Extended) : OleVariant;
      function GrupoxClasseOk(nIdGrupo, nIdClasse : Extended) : Boolean;
      function GrupoxConjuntoOk(nIdPessoa, nIdGrupo, nIdConjunto : Extended) : Boolean;
      function PlacaUnica(nEmpresa : Extended; sPlaca : String) : boolean;
      function GeraProxPlacaTomb(nEmpresa, nGrupo, nClasse, nPlacaAtual : Extended) : Extended;

   end;

implementation

{ TCtrlBem }

constructor TCtrlBem.Create;
begin
   inherited;
   _dbBem            := TDBBem.Create;
   _dbBemxMoeda      := TDBBemxMoeda.Create;
   _dbBemxDep        := TDBBemxDep.Create;
   _dbPlanoPatroxBem := TDBPlanoPatroxBem.Create;

   _dbSaldoContabBem := TDBSaldoContabBem.Create;
   _dbSldCtbBemxDep  := TDBSldCtbBemxDep.Create;

   _dMTBem           := tdtmMTBem.Create(nil);

   ParamCAF          := TCtrlParamCAF.Create;
   Conjunto          := TCtrlConjunto.Create;
   HistMovBem        := TCtrlHistMovBem.Create;
   LancaContab       := TCtrlLancamento.Create;
   ContaContab       := TCtrlContaContabil.Create;
   PeriodoContab     := TCtrlPeriodo.Create;
end;

destructor TCtrlBem.Destroy;
begin
   if IsAppServer then
      FreeCDS([FCds, FCdsBemxMoeda, FCdsBemxDep, FCdsPlanoPatroxBem,
               cdsMontaContab, cdsSaldoContabBem, cdsMovContabBem]);

   sprSaldoContabBem.Free;
   sprSldCtbBemxDep.Free;

   _dbBem.Free;
   _dbBemxMoeda.Free;
   _dbBemxDep.Free;
   _dbPlanoPatroxBem.Free;

   _dbSaldoContabBem.Free;
   _dbSldCtbBemxDep.Free;

   _dMTBem.Free;

   ParamCAF.Free;
   Conjunto.Free;
   HistMovBem.Free;
   LancaContab.Free;
   ContaContab.Free;
   PeriodoContab.Free;

   inherited;
end;

procedure TCtrlBem.OnCreateAppServer;
begin
   inherited;
   fCds               := TClientDataSet.Create(nil);
   fCdsBemxMoeda      := TClientDataSet.Create(nil);
   fCdsBemxDep        := TClientDataSet.Create(nil);
   fCdsPlanoPatroxBem := TClientDataSet.Create(nil);
   //-------------------------------------------------------------------------------------
   fCdsSaldoContabBem := TClientDataSet.Create(nil);
   fCdsSldCtbBemxDep  := TClientDataSet.Create(nil);
   fCdsMontaContab    := TClientDataSet.Create(nil);
   fCdsMovContabBem   := TClientDataSet.Create(nil);
   //-------------------------------------------------------------------------------------
   sprSaldoContabBem  := TwwStoredProc.Create(nil);
   sprSldCtbBemxDep   := TwwStoredProc.Create(nil);
end;

procedure TCtrlBem.DoChangeDataBase;
begin
   inherited;
   _dbBem.DataBaseName            := DataBaseName;
   _dbBemxMoeda.DataBaseName      := DataBaseName;
   _dbBemxDep.DataBaseName        := DataBaseName;
   _dbPlanoPatroxBem.DataBaseName := DataBaseName;

   ParamCAF.DataBase              := Self.DataBase;
   Conjunto.Database              := Self.Database;  
   HistMovBem.DataBase            := Self.DataBase;
   LancaContab.DataBase           := Self.DataBase;
   ContaContab.DataBase           := Self.DataBase;
   PeriodoContab.DataBase         := Self.DataBase;

   sprSaldoContabBem.DatabaseName   := DataBaseName;
   sprSaldoContabBem.StoredProcName := 'SPRSLDCONTABBEM';
   sprSldCtbBemxDep.DatabaseName    := DataBaseName;
   sprSldCtbBemxDep.StoredProcName  := 'SPRSLDCTBBEMXDEP';
end;

function TCtrlBem.ListaBem(nIdPessoa, nIdBem: Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT B.*, CB.DESCRICAO AS NOMECLASSE, S.DESCSITUACAO, C.DESCCONJUNTO, '+ #13 +
           '        F.NOME AS NOMEFORN, T.NOME, AS NOMETERCEIRO, G.NOME AS DESCGRUPO, '+ #13 +
           '        G.FLGIMOVEL, AP.NOME AS DESCATIVPROJ, S.NOMESUBCONTA '+ #13 +
           ' FROM BEM         B,  '+ #13 +
           '      CLASSEDEBEM CB, '+ #13 +
           '      SITUACAO    S,  '+ #13 +
           '      CONJUNTO    C,  '+ #13 +
           '      PESSOA      F,  '+ #13 +
           '      PESSOA      T,  '+ #13 +
           '      GRUPO       G,  '+ #13 +
           '      UNIDNEGOCIO AP, '+ #13 +
           '      SUBCONTA    S,  '+ #13 +
           ' WHERE (B.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (B.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (B.IDCLASSEBEM = CB.IDCLASSEBEM(+)) '+ #13 +
                  '   AND (B.IDSITUACAO  = S.IDSITUACAO(+))   '+ #13 +
                  '   AND (B.IDCONJUNTO  = C.IDCONJUNTO(+))   '+ #13 +
                  '   AND (B.IDFORNSERV  = F.IDPESSOA(+))     '+ #13 +
                  '   AND (B.IDTERCEIRO  = T.IDPESSOA(+))     '+ #13 +
                  '   AND (B.IDGRUPO     = G.IDGRUPO(+))      '+ #13 +
                  '   AND (B.UNIDNEGOC   = AP.UNIDNEGOC(+))   '+ #13 +
                  '   AND (B.IDPESSOA    = AP.IDPESSOA(+))    '+ #13 +
                  '   AND (B.CODSUBCONTA = S.CODSUBCONTA(+))  '+ #13 +
                  '   AND (B.IDPESSOA    = S.IDPESSOA(+))     '+ #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaBemxMoeda(nIdPessoa, nIdBem, nMoeCodigo : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT BM.IDBEM, BM.IDPESSOA, BM.MOECODIGO, M.MOEDESC,'+ #13 +
           '        BM.VALORG, BM.CMBEM '+ #13 +
           ' FROM BEMXMOEDA BM, '+ #13 +
           '      MOEDA M '+ #13 +
           ' WHERE (BM.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (BM.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (BM.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (BM.MOECODIGO = M.MOECODIGO) ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT BD.IDBEM, BD.IDPESSOA, BD.MOECODIGO, M.MOEDESC, '+ #13 +
           '        BD.IDBEMXDEP, BD.TAXADEP, GD.DESCTAXADEP, '+ #13 +
           '        BD.DEPLANC, BD.CMDEP '+ #13 +
           ' FROM BEMXDEP BD, '+ #13 +
           '      MOEDA M, '+ #13 +
           '      BEM B, '+ #13 +
           '      GRUPOTAXADEP GD '+ #13 +
           ' WHERE (BD.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (BD.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (BD.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBemxDep <> -1 then
      sSql := sSql + '   AND (BD.IDBEMXDEP = ' + floattostr(nIdBemxDep) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (BD.MOECODIGO = M.MOECODIGO) ' + #13 +
                  '   AND (BD.IDBEM     = B.IDBEM) ' + #13 +
                  '   AND (BD.IDPESSOA  = B.IDPESSOA) ' + #13 +
                  '   AND (B.IDGRUPO    = GD.IDGRUPO) ' + #13 +
                  '   AND (B.IDPESSOA   = GD.IDPESSOA) ' + #13 +
                  '   AND (BD.IDBEMXDEP = GD.IDTAXADEP) ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaPlanoPatroxBem(nIdPessoa, nIdBem, nIdPatro, nIdPlanoPrev: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT PP.IDBEM, PP.IDPESSOA, PP.PLANOPREV, PP.IDPATRO, '+ #13 +
           '        PP.PPBPERCRATEIO '+ #13 +
           '        PV.NOME AS DESCPLANOPREV, PT.NOME AS DESCPATRO '+ #13 +
           ' FROM PLANOPATROXBEM PP, '+ #13 +
           '      PESSOA PT, '+ #13 +
           '      PLANPREVCONTABIL PV '+ #13 +
           ' WHERE (PP.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (PP.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdPatro <> -1 then
      sSql := sSql + '   AND (PP.IDPATRO = ' + floattostr(nIdPatro) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdPlanoPrev <> -1 then
      sSql := sSql + '   AND (PP.IDPLANOPREV = ' + floattostr(nIdPlanoPrev) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (PP.IDPLANOPREV = PV.IDPLANOPREV) ' + #13 +
                  '   AND (PP.IDPATRO = PT.IDPESSOA) ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaFornecedor(nIdForn : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT P.NOME, P.IDPESSOA, P.RAZAOSOCIAL, ' + #13 +
           ' F.IDFORCLI, F.CODSUBCONTA '                 + #13 +
           ' FROM EMPRESAFORN F, '                       + #13 +
           '      PESSOA P '                             + #13 ;
   //-------------------------------------------------------------------------------------
   if nIdForn <> -1 then
   begin
      sSql := sSql + '   WHERE (P.IDPESSOA = ' + floattostr(nIdForn) + ') AND ' + #13;
   end else
   begin
      sSql := sSql + '   WHERE '+ #13;
   end;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '         (F.IDFORCLI = P.IDPESSOA) '+ #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.BemcomMovimento(nIdPessoa, nIdBem : Extended) : Boolean;
var
   sSql : String;

begin
   Result := False;
   sSql := ' SELECT COUNT(IDMOVIMENTACAO) AS QTD '+ #13 +
           ' FROM   HISTORICOMOVIMENTACAO '+ #13 +
           ' WHERE (IDBEM  = ' + floattostr(nIdBem) + ') ' + #13 +
           '   AND (IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (IDTIPOMOVIMENTACAO <> 1)   /* ENTRADA TOTAL                                      */ '+ #13 +
           '   AND (IDTIPOMOVIMENTACAO <> 3)   /* ENTRADA FISICA                                     */ '+ #13 +
           '   AND (IDTIPOMOVIMENTACAO <> 17)  /* INCLUSAO DE DEPRECIACAO                            */ '+ #13 +
           '   AND (IDTIPOMOVIMENTACAO <> 15)  /* CORRECAO MONETARIA                                 */ '+ #13 +
           '   AND (IDTIPOMOVIMENTACAO <> 21)  /* CORRECAO MONETARIA DA DEPRECIACAO                  */ '+ #13 +
           '   AND (IDTIPOMOVIMENTACAO <> 32)  /* INCLUSAO DO SALDO DE REAVALIACAO                   */ '+ #13 +
           '   AND (IDTIPOMOVIMENTACAO <> 33)  /* INCLUSAO DA DEPRECIACAO DO SALDO DE REAVALIACAO    */ '+ #13 +
           '   AND (IDTIPOMOVIMENTACAO <> 22)  /* CORRECAO MONETARIA DA REAVALIACAO                  */ '+ #13 +
           '   AND (IDTIPOMOVIMENTACAO <> 19)  /* CORRECAO MONETARIA DA DEPRECIACAO DA REAVALIACAO   */ '+ #13 ;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.FieldByName('QTD').AsInteger <> 0 then
   begin
      MessageInfo := 'Bens já movimentados não podem ser Removidos !';
      Result := True;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

function TCtrlBem.BemSelecionado(nIdPessoa, nIdBem : Extended) : Boolean;
var
   sSql : String;

begin
   Result := False;
   sSql := ' SELECT SBB.IDSELBAIXA, SB.SBXTERMO, SB.SBTIPOMOV ' + #13 +
           ' FROM SELBAIXABENS SBB, ' + #13 +
           '      SELBAIXA SB ' + #13 +
           ' WHERE (SBB.IDBEM  = ' + floattostr(nIdBem) + ') ' + #13 +
           '   AND (SBB.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (SB.SBXFLGEXECUTADO <> 1) ' + #13 +
           '   AND (SBB.IDSELBAIXA = SB.IDSELBAIXA) ';
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if not _cds.IsEmpty then
   begin
      if _cds.FieldByName('SBTIPOMOV').AsInteger = 0 then // 0 - Baixa, 1 - Transferência
      begin
         MessageInfo := 'Bem selecionado no Termo de Baixa ' +
                        _cds.FieldByName('SBXTERMO').AsString + ' ainda não executado.' + #13 +
                        'Alteração Restrita.';
      end else
      begin
         MessageInfo := 'Bem selecionado no Termo de Transferência ' +
                        _cds.FieldByName('SBXTERMO').AsString + ' ainda não executado.' + #13 +
                        'Alteração Restrita.';
      end;
      Result := True;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

function TCtrlBem.BuscaGrupoContab(nIdPessoa, nIdClasse, nIdLocal : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT GXCC.IDGRUPO ' + #13 +
           ' FROM CLASSEXGRUPO CXG, ' + #13 +
           '      GRUPOBEMXCC GXCC, ' + #13 +
           '      LOCALIZACAO L ' + #13 +
           ' WHERE (CXG.IDCLASSEBEM = ' + floattostr(nIdClasse) + ') '+ #13 +
           '   AND (L.IDLOCALIZACAO = ' + floattostr(nIdLocal) + ')'+ #13 +
           '   AND (L.IDPESSOA      = ' + floattostr(nIdPessoa) + ')'+ #13 +
           '   AND (CXG.IDGRUPO = GXCC.IDGRUPO)'+ #13 +
           '   AND (GXCC.CODCENTROCUSTO = L.CODCENTROCUSTO)'+ #13 +
           '   AND (GXCC.IDEMPRESA = L.IDEMPRESA)'+ #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlBem.GrupoxClasseOk(nIdGrupo, nIdClasse : Extended) : Boolean;
var
   sSql : String;

begin
   Result := True;
   sSql := ' SELECT IDCLASSEBEM,IDGRUPO '+ #13 +
           ' FROM   CLASSEXGRUPO '+ #13 +
           ' WHERE (IDCLASSEBEM = ' + floattostr(nIdClasse) + ') '+ #13 +
           '   AND (IDGRUPO     = ' + floattostr(nIdGrupo)  + ') '+ #13;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.IsEmpty then
   begin
      MessageInfo := 'Grupo escolhido é inválido para a Classe selecionada do Bem. ' + #13 +
                     'Selecione o Grupo Correto';
      Result := False;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

function TCtrlBem.GrupoxConjuntoOk(nIdPessoa, nIdGrupo, nIdConjunto : Extended) : Boolean;
var
   sSql : String;

begin
   Result := False;
   sSql := ' SELECT GXCC.IDGRUPO '+ #13 +
           ' FROM CONJUNTO C, '+ #13 +
           '      LOCALIZACAO L, '+ #13 +
           '      GRUPOBEMXCC GXCC '+ #13 +
           ' WHERE (C.IDCONJUNTO     = ' + floattostr(nIdConjunto) + ') ' + #13 +
           '   AND (C.IDPESSOA       = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (GXCC.IDGRUPO     = ' + floattostr(nIdGrupo) + ') ' + #13 +
           '   AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO) ' + #13 +
           '   AND (L.CODCENTROCUSTO = GXCC.CODCENTROCUSTO) ' + #13 +
           '   AND (L.IDEMPRESA      = GXCC.IDEMPRESA) ' + #13 ;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.IsEmpty then
   begin
      MessageInfo := 'Grupo selecionado inválido para a Localização/Centro de Custo do Bem. '+ #13 +
                     'Selecione o Grupo Correto';
      Result := True;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

function TCtrlBem.ProcurarBem(nIdPessoa, nIdBem: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarBEM( nIdPessoa, nIdBem ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbBem.IDPESSOA.AsFloat := nIdPessoa;
      _dbBem.IDBEM.AsFloat    := nIdBem;
      Result := GetDataPacket(_dbBem.sSQLSelect);
   end;
end;

function TCtrlBem.ProcurarBemxMoeda(nIdPessoa, nIdBem, nMoeCodigo : Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarBEMXMOEDA( nIdPessoa, nIdBem, nMoeCodigo ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbBemxMoeda.IDPESSOA.AsFloat  := nIdPessoa;
      _dbBemxMoeda.IDBEM.AsFloat     := nIdBem;
      _dbBemxMoeda.MOECODIGO.AsFloat := nMoeCodigo;
      Result := GetDataPacket(_dbBemxMoeda.sSQLSelect);
   end;
end;

function TCtrlBem.ProcurarBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarBEMXDEP( nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbBemxDep.IDPESSOA.AsFloat    := nIdPessoa;
      _dbBemxDep.IDBEM.AsFloat       := nIdBem;
      _dbBemxDep.MOECODIGO.AsFloat   := nMoeCodigo;
      _dbBemxDep.IDBEMXDEP.AsFloat   := nIdBemxDep;
      Result := GetDataPacket(_dbBemxDep.sSQLSelect);
   end;
end;

function TCtrlBem.ProcurarPlanoPatroxBem(nIdPessoa, nIdBem, nIdPlanoPrev, nIdPatro: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarPLANOPATROXBEM( nIdPessoa, nIdBem, nIdPlanoPrev, nIdPatro ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbPlanoPatroxBem.IDPESSOA.AsFloat    := nIdPessoa;
      _dbPlanoPatroxBem.IDBEM.AsFloat       := nIdBem;
      _dbPlanoPatroxBem.IDPLANOPREV.AsFloat := nIdPlanoPrev;
      _dbPlanoPatroxBem.IDPATRO.AsFloat     := nIdPatro;
      Result := GetDataPacket(_dbPlanoPatroxBem.sSQLSelect);
   end;
end;

procedure TCtrlBem.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlBem.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
   FcdsBemxMoeda := Value;
end;

procedure TCtrlBem.SetcdsBemxDep(const Value: TClientDataSet);
begin
   FcdsBemxDep := Value;
end;

procedure TCtrlBem.SetcdsPlanoPatroxBem(const Value: TClientDataSet);
begin
   FcdsPlanoPatroxBem := Value;
end;

procedure TCtrlBem.SetcdsSaldoContabBem(const Value: TClientDataSet);
begin
   FcdsSaldoContabBem := Value;
end;

procedure TCtrlBem.SetcdsSldCtbBemxDep(const Value: TClientDataSet);
begin
   FcdsSldCtbBemxDep := Value;
end;

procedure TCtrlBem.SetcdsMontaContab(const Value: TClientDataSet);
begin
   FcdsMontaContab := Value;
end;

procedure TCtrlBem.SetcdsMovContabBem(const Value: TClientDataSet);
begin
   FcdsMovContabBem := Value;
end;
//========================================================================================
// Função que executa a Entrada de um Bem no Ativo Fixo
//
// Parâmetros :
//
//    fValorTotal - Valor Total dos bens adquiridos
//    iQuantidade - Quantidade de bens adquiridos
//
//========================================================================================
function TCtrlBem.ExecutaEntrada(fValorTotal : Extended; iQuantidade : Integer) : Boolean;
type
   rBemxDep = Record
      IDBEMXDEP : Integer;
      TAXADEP   : Extended;
   end;

var
   nIdBem, nPlanilha, nPlacaAtual,
   nValOrg, nFator                 : Extended;
   sDigMascPlaca                   : String;
   iQtd, iAux                      : Integer;
   aBemxDep                        : Array of rBemxDep;
   iaBemxDep                       : Integer;

begin
   if iQuantidade <= 0 then
   begin
      Result := False;
      MessageInfo := 'É obrigatório fornecer a quantidade de bens!';
      Raise Exception.Create(MessageInfo);
   end;
   //-------------------------------------------------------------------------------------
   // Carga dos parametros do sistema
   //-------------------------------------------------------------------------------------
   if not ParamCAF.CarregaProp(Fcds.FieldByName('IDPESSOA').AsFloat) then
   begin
      MessageInfo := 'Parâmetros do sistema inválidos!';
      Abort;
   end;
   //-------------------------------------------------------------------------------------
   // Calcula a proporção
   //-------------------------------------------------------------------------------------
   nValOrg := strtofloat(FormatFloat('#0.00',(((fValorTotal / iQuantidade) * 100) / 100)));
   //-------------------------------------------------------------------------------------
   // Registra em array os dados relativos a BEMXDEP em Moeda Oficial, para serem replicados
   // nas moedas restantes.
   //-------------------------------------------------------------------------------------
   iaBemxDep := 0;
   FcdsBemxDep.First;
   while not FcdsBemxDep.EOF do
   begin
      SetLength(aBemxDep,iaBemxDep + 1);
      aBemxDep[iaBemxDep].IDBEMXDEP := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
      aBemxDep[iaBemxDep].TAXADEP   := FcdsBemxDep.FieldByName('TAXADEP').AsFloat;
      iaBemxDep := iaBemxDep + 1;
      FcdsBemxDep.Next;
   end;
   //-------------------------------------------------------------------------------------
   // Realiza os lançamentos em BEMXMOEDA
   //-------------------------------------------------------------------------------------
   FcdsBemxMoeda.Data := ListaBemxMoeda(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   // Registro do Valor em Moeda Oficial
   //-------------------------------------------------------------------------------------
   FcdsBemxMoeda.Append;
   FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
   FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
   FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValOrg;
   FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
   FcdsBemxMoeda.Post;
   //-------------------------------------------------------------------------------------
   // Conversão do valor de aquisição para as quatro moedas suportadas pelo CAF
   //-------------------------------------------------------------------------------------
   if ParamCAF.MOEDAFISCAL > 0 then
   begin
      nFator := CotacaoMoeda(ParamCAF.MOEDAFISCAL,
                             Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nFator <> 0 then
      begin
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAFISCAL;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValOrg / nFator;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux <= iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAFISCAL;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end else
      begin
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if ParamCAF.MOEDAGERENCIAL > 0 then
   begin
      nFator := CotacaoMoeda(ParamCAF.MOEDAGERENCIAL,
                             Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nFator > 0 then
      begin
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValOrg / nFator;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux <= iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end else
      begin
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if ParamCAF.MOEDAGERENCIALB > 0 then
   begin
      nFator := CotacaoMoeda(ParamCAF.MOEDAGERENCIALB,
                             Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nFator > 0 then
      begin
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValOrg / nFator;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux <= iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end else
      begin
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if ParamCAF.MOEDAGERENCIALC > 0 then
   begin
      nFator := CotacaoMoeda(ParamCAF.MOEDAGERENCIALC,
                             Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nFator > 0 then
      begin
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALC;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValOrg / nFator;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux <= iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALC;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end else
      begin
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Complementa a placa com os digitos de subplaca
   //-------------------------------------------------------------------------------------
   if not Fcds.FieldByName('PLACA').IsNull then
   begin
      nPlacaAtual := Fcds.FieldByName('PLACA').AsFloat;
      if (iQuantidade > 1) then
      begin
         _cds.Data := GetDataPacket(' SELECT DIGMASCPLACA '+
                                    ' FROM PARAMETROSCAFMANUT '+
                                    ' WHERE (IDPESSOA = ' + Fcds.FieldByName('IDPESSOA').AsString + ')');
         sDigMascPlaca := StringOfChar('0',_cds.FieldByName('DIGMASCPLACA').AsInteger);
         //-------------------------------------------------------------------------------
         nPlacaAtual := strtofloat(floattostr(nPlacaAtual) + sDigMascPlaca);
         Fcds.FieldByName('PLACA').AsFloat := nPlacaAtual;
      end;
   end else
   begin
      nPlacaAtual := 0;
   end;
   Fcds.Post;
   //-------------------------------------------------------------------------------------
   nPlanilha := -1;
   iQtd := 1;
   while iQtd <= iQuantidade do
   begin
      nIdBem := ExecutaEntradaBem(nPlanilha);
      //----------------------------------------------------------------------------------
      if (nIdBem < 0) or (nPlanilha < 0) then
      begin
         Result := False;
         Exit;
      end;
      //----------------------------------------------------------------------------------
      iQtd := iQtd + 1;
      //----------------------------------------------------------------------------------
      if iQtd <= iQuantidade then
      begin
         if nPlacaAtual <> 0 then
         begin
            Fcds.Edit;
            Fcds.FieldByName('PLACA').AsFloat := GeraProxPlacaTomb(Fcds.FieldByName('IDPESSOA').AsFloat,
                                                                   Fcds.FieldByName('IDGRUPO').AsFloat,
                                                                   Fcds.FieldByName('IDCLASSEBEM').AsFloat,
                                                                   Fcds.FieldByName('PLACA').AsFloat);
            Fcds.Post;
         end;
      end;
   end;
   result := True;
end;
//========================================================================================
function TCtrlBem.ExecutaEntradaBem(Var nPlanilha : Extended) : LongInt;
var
   iFlgSemPlaca, iExercicio,
   iPeriodo, icBemxDep, iFlgPai          : Integer;
   sGrupo,sMensagem                      : String;
   nFator, nValOrg, nTipoMov, nSeqHist   : Extended;
   bResult                               : Boolean;

begin
   Result := -1;
   //-------------------------------------------------------------------------------------
   // Valida os parâmetros obrigatórios para entrada de bens
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('REGISTRO').IsNull then
   begin
      MessageInfo := 'É obrigatório fornecer o Código de Registro do bem!';
      Abort;
   end else
   if not ((Fcds.FieldbyName('REGISTRO').AsString = 'I') or (Fcds.FieldbyName('REGISTRO').AsString = 'O')) then
   begin
      MessageInfo := 'Código de registro inválido!';
      Abort;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('REGISTRO').AsString = 'O' then
   begin
      Fcds.Edit;
      Fcds.FieldByName('CONTROLE').AsString := 'F';
      Fcds.Post;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('CONTROLE').IsNull then
   begin
      MessageInfo := 'É obrigatório fornecer a Forma de Controle do bem!';
      Abort;
   end else
   if not ((Fcds.FieldbyName('CONTROLE').AsString = 'T') or (Fcds.FieldbyName('REGISTRO').AsString = 'F')) then
   begin
      MessageInfo := 'Código de controle inválido!';
      Abort;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('IDMODULO').IsNull then
   begin
      MessageInfo := 'Código do módulo CM inválido!';
      Abort;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('IDPESSOA').IsNull then
   begin
      MessageInfo := 'Código da EMPRESA PROPRIETÁRIA Inválido!';
      Abort;
   end else
   begin
      _cds.Data := GetDataPacket(' SELECT NOME '+
                                 ' FROM PESSOA '+
                                 ' WHERE (IDPESSOA = ' + Fcds.FieldbyName('IDPESSOA').AsString + ')');
      if _cds.isEmpty then
      begin
         MessageInfo := 'Código da EMPRESA PROPRIETÁRIA Inválido ou não cadastrado!';
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('IDCONJUNTO').IsNull then
   begin
      MessageInfo := 'Código do CONJUNTO do bem inválido!';
      Abort;
   end else
   begin
      _cds.Data := GetDataPacket(' SELECT DESCCONJUNTO '+
                                 ' FROM CONJUNTO '+
                                 ' WHERE (IDPESSOA = '   + Fcds.FieldbyName('IDPESSOA').AsString + ')' +
                                 '   AND (IDCONJUNTO = ' + Fcds.FieldbyName('IDCONJUNTO').AsString + ')');
      if _cds.IsEmpty then
      begin
         MessageInfo := 'Código do CONJUNTO do bem inexistente ou inválido!';
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('IDGRUPO').IsNull then
   begin
      MessageInfo := 'Código do GRUPO CONTÁBIL do bem inválido!';
      Abort;
   end else
   begin
      _cds.Data := GetDataPacket(' SELECT IDGRUPO, NOME, FLGSEMPLACA '+
                                 ' FROM PLANOGRUPO '+
                                 ' WHERE (IDPESSOA = ' + Fcds.FieldbyName('IDPESSOA').AsString + ')' +
                                 '   AND (IDGRUPO  = ' + Fcds.FieldbyName('IDGRUPO').AsString + ')' );
      if _cds.IsEmpty then
      begin
         MessageInfo := 'Código do GRUPO CONTÁBIL do bem inexistente ou inválido!';
         Abort;
      end;
      iFlgSemPlaca := _cds.FieldByName('FLGSEMPLACA').AsInteger;
      sGrupo       := _cds.FieldByName('NOME').AsString;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('IDCLASSEBEM').IsNull then
   begin
      MessageInfo := 'Código da CLASSE do bem inválido!';
      Abort;
   end else
   begin
      _cds.Data := GetDataPacket(' SELECT IDCLASSEBEM ' +
                                 ' FROM CLASSEDEBEM ' +
                                 ' WHERE (IDCLASSEBEM = ' + Fcds.FieldbyName('IDCLASSEBEM').AsString + ')') ;
      if _cds.IsEmpty then
      begin
         MessageInfo := 'Código de CLASSE de bem inexistente ou inválido!';
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('CODSUBCONTA').IsNull then
   begin
      _cds.Data := GetDataPacket(' SELECT CODSUBCONTA ' +
                                 ' FROM SUBCONTA ' +
                                 ' WHERE (CODSUBCONTA = ' + Fcds.FieldbyName('CODSUBCONTA').AsString + ')' +
                                 '   AND (IDPESSOA = ' + Fcds.FieldbyName('IDPESSOA').AsString + ')' );
      if _cds.IsEmpty then
      begin
         MessageInfo := 'Código de SUBCONTA de bem inválido!';
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('IDFORNSERV').IsNull then
   begin
      _cds.Data := GetDataPacket(' SELECT NOME '+
                                 ' FROM PESSOA '+
                                 ' WHERE (IDPESSOA = ' + Fcds.FieldbyName('IDFORNSERV').AsString + ')' );
      if _cds.isEmpty then
      begin
         MessageInfo := 'Código do FORNECEDOR Inválido ou não cadastrado!';
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('PLACA').IsNull then
   begin
      if iFlgSemPlaca = 0 then
      begin
         MessageInfo := 'É obrigatório fornecer o Número de TOMBAMENTO do bem!';
         Abort;
      end;
   end else
   begin
      if not PlacaUnica(Fcds.FieldbyName('IDPESSOA').AsFloat,
                        Fcds.FieldbyName('PLACA').AsString) then
      begin
         MessageInfo := 'Número da PLACA DE TOMBAMENTO já alocado a outro bem!';
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('SITUACAO').IsNull then
   begin
      MessageInfo := 'É obrigatório fornecer a ID da SITUAÇÃO FÍSICA do bem!';
      Abort;
   end else
   begin
      _cds.Data := GetDataPacket(' SELECT IDSITUACAO ' +
                                 ' FROM SITUACAO ' +
                                 ' WHERE (IDSITUACAO = ' + Fcds.FieldbyName('IDSITUACAO').AsString + ')' );
      if _cds.IsEmpty then
      begin
         MessageInfo := 'Código da SITUAÇÃO FÍSICA de bem inexistente ou inválido!';
         Abort;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('DESBEM').IsNull then
   begin
      MessageInfo := 'É obrigatório fornecer a DESCRIÇÃO do bem!';
      Abort;
   end;
   //-------------------------------------------------------------------------------------
   if (Fcds.FieldbyName('FLGBEMINTCONTAB').AsInteger = 1) and
      (Fcds.FieldbyName('DTACONTAB').IsNull) then
   begin
      MessageInfo := 'A data do registro do custo de entrada do bem na contabilidade deve ser informada!';
      Abort;
   end;
   //-------------------------------------------------------------------------------------
   if Fcds.FieldbyName('UNIDNEGOC').IsNull then
   begin
      Fcds.Edit;
      Fcds.FieldbyName('UNIDNEGOC').AsFloat := ParamCAF.ATIVPROJETO;
      Fcds.Post;
   end;
   //-------------------------------------------------------------------------------------
   // Verificar se o valor de aquisição em moeda corrente foi informado
   //-------------------------------------------------------------------------------------
   nValOrg := 0;
   icBemxDep := 0;
   FcdsBemxMoeda.First;
   while not FcdsBemxMoeda.EOF do
   begin
      if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial then
         nValOrg := FcdsBemxMoeda.FieldByName('VALORG').AsFloat;
      FcdsBemxMoeda.Next;
   end;
   if nValOrg = 0 then
   begin
      MessageInfo := 'O valor de aquisição do bem deve ser informado!';
      Abort;
   end;
   //-------------------------------------------------------------------------------------
   // Verificar se todas as taxas de depreciação foram informadas
   //-------------------------------------------------------------------------------------
   icBemxDep := 0;
   FcdsBemxDep.First;
   while not FcdsBemxDep.EOF do
   begin
      if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial then
         icBemxDep := icBemxDep + 1;
      FcdsBemxDep.Next;
   end;
   if icBemxDep <> ParamCAF.NUMTAXADEP then
   begin
      MessageInfo := 'As taxas de depreciação não foram totalmente informadas!';
      Abort;
   end;
   //-------------------------------------------------------------------------------------
   try
      StartTransaction;
      //----------------------------------------------------------------------------------
      // Gravação dos dados na tabela BEM
      //----------------------------------------------------------------------------------
      bResult := ApplyCds(Fcds,_dbBem,[],[]);
      sMensagem := _dbBem.MessageInfo;
      if not bResult then Raise Exception.Create(sMensagem);

      bResult := ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[_dbBem.IdBem],[_dbBemxMoeda.IdBem]);
      sMensagem := _dbBemxMoeda.MessageInfo;
      if not bResult then Raise Exception.Create(sMensagem);

      bResult := ApplyCds(FcdsBemxDep,_dbBemxDep,[_dbBem.IdBem],[_dbBemxDep.IdBem]);
      sMensagem := _dbBemxDep.MessageInfo;
      if not bResult then Raise Exception.Create(sMensagem);

      bResult := ApplyCds(FcdsPlanoPatroxBem,_dbPlanoPatroxBem,[_dbBem.IdBem],[_dbPlanoPatroxBem.IdBem]);
      sMensagem := _dbPlanoPatroxBem.MessageInfo;
      if not bResult then Raise Exception.Create(sMensagem);
      //----------------------------------------------------------------------------------
      // Registra a entrada na contabilidade
      //----------------------------------------------------------------------------------
      nPlanilha := -1;
      if (ParamCAF.INTEGRACONTAB = 'S') and
         (_dbBem.FLGBEMINTCONTAB.AsInteger = 1) and
         (_dbBem.CONTROLE.AsString = 'T') and
         ((_dbBem.IDMODULO.AsInteger = 7) or (_dbBem.IDMODULO.AsInteger = 64)) then
      begin
         if not VerificaPeriodoContabil(_dbBem.IDPESSOA.AsInteger, _dbBem.DTACONTAB.AsDateTime,
                                        iExercicio,iPeriodo) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Prepara o DataSet que irá acumular a planilha contábil para a integração
         //-------------------------------------------------------------------------------
         cdsMontaContab.Data := GetDataPacket(' SELECT LACNUMDOC,LACDEBCRE,LACHIST1,LACHIST2,LACHIST3, '+ #13 +
                                              '        LACHIST4, LACHIST5,CODCENTROCUSTO,UNIDNEGOC, '+ #13 +
                                              '        PLACONTA,LACVALOR,LACVALOFICIAL,LACVALGERENCIAL, '+ #13 +
                                              '        PLANO,CODSUBCONTA,IDPLANOPREV,IDPATRO ' + #13 +
                                              ' FROM LANCAMENTO ' + #13 +
                                              ' WHERE (PLNCODIGO = 0) ');
         //-------------------------------------------------------------------------------
         // Prepara o DataSet que irá acumular a planilha contábil para a integração
         //-------------------------------------------------------------------------------
         if not ContabilizaEntrada(_dbBem.IDMODULO.AsInteger, _dbBem.IDPESSOA.AsInteger,
                                   _dbBem.IDBEM.AsInteger, _dbBem.IDGRUPO.AsInteger,
                                   _dbBem.IDCONJUNTO.AsInteger, _dbBem.UNIDNEGOC.AsInteger,
                                   _dbBem.CODSUBCONTA.AsInteger, _dbBem.PLACA.AsString,
                                   _dbBem.DESBEM.AsString, sGrupo,
                                   _dbBem.DTACONTAB.AsDateTime, nValOrg) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra a Planilha Contábil
         //-------------------------------------------------------------------------------
         nPlanilha := RegistraPlanilhaContabil(_dbBem.IDMODULO.AsFloat,
                                               _dbBem.IDPESSOA.AsFloat,
                                               Sistema.IdUsuario,
                                               _dbBem.DTACONTAB.AsString);
         if nPlanilha < 0 then
            Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Registra a entrada no histórico
      //----------------------------------------------------------------------------------
      if _dbBem.CONTROLE.AsString = 'T' then
         nTipoMov := 01
      else
         nTipoMov := 03;
      //----------------------------------------------------------------------------------
      // Registra na tabela HISTORICOMOVIMENTACAO
      //----------------------------------------------------------------------------------
      nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                nTipoMov,                      // IDTIPOMOVIMENTACAO
                                                _dbBem.DTAINCLUSAO.AsDatetime, // DATAMOVIMENTACAO
                                                -1,                            // IDREAVALACRESC
                                                -1,                            // DATAULTDEP
                                                -1,                            // IDGRUPANT
                                                -1,                            // IDCONJANT
                                                -1,                            // IDLOCALANT
                                                -1,                            // IDRESPANT
                                                -1,                            // PLACAANT
                                                nPlanilha,                     // PLNCODIGO
                                                -1,                            // TAXADEPANT
                                                -1,                            // VALORGLAUDO
                                                '',                            // OBSREAVAL
                                                0,                             // TIPDEPPRORATA
                                                0,                             // IDTAXADEP
                                                -1,                            // IDTIPODESPESA
                                                '',                            // OBSACRESCIMO
                                                -1,                            // IDMOTIVOBAIXA
                                                0,                             // PROPBAIXA
                                                '');                           // OBSBAIXA
      if nSeqHist = -1 then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      // Registra na tabela VLRHISTMOVBEM e Atualiza o saldo contábil
      //----------------------------------------------------------------------------------
      _dbBemxMoeda.First;
      while not _dbBemxMoeda.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra o valor no histórico
         //-------------------------------------------------------------------------------
         if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                 _dbBemxMoeda.MOECODIGO.AsInteger,
                                                 _dbBemxMoeda.VALORG.AsInteger) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Atualiza o saldo contábil
         //-------------------------------------------------------------------------------
         iFlgPai := 1;
         _dbBemxDep.First;
         while not _dbBemxDep.EOF do
         begin
            if _dbBemxDep.MOECODIGO.AsInteger = _dbBemxDep.MOECODIGO.AsInteger then
            begin
               if not AtualizaSaldoContabBem(_dbBem.IDPESSOA.AsInteger, _dbBem.IDBEM.AsInteger,
                                             _dbBem.DTAINCLUSAO.AsDateTime,
                                             _dbBemxMoeda.MOECODIGO.AsInteger,
                                             _dbBemxDep.IDBEMXDEP.AsInteger,
                                             _dbBemxMoeda.VALORG.AsFloat, 0, 0, 0,
                                             0, 0, 0, 0,
                                             0, 0, 0, 0,
                                             0, iFlgPai) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0;
            end;
            _dbBemxDep.Next;
         end;
         _dbBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      Commit;
   except
      On E : Exception Do
      begin
         Rollback;
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que executa a atualização da tabela de Saldo Contábil de Bens
//----------------------------------------------------------------------------------------
function TCtrlBem.AtualizaSaldoContabBem(iEmpresaProp, iBem : Integer;
                                         dDataSld : tDateTime;
                                         iMoeCodigo,
                                         iTaxaDep : Integer;
                                         nValOrg, nCmBem, nDepLanc, nCmDep,
                                         nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
                                         nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc, nUltReavCmDep : Extended;
                                         iCodMov, iPai : Integer) : Boolean;
Var
   sSql                              : String;
   nSValOrg, nSCmBem,
   nSReavValOrg, nSReavCmBem,
   nSUltReavValOrg, nSUltReavCmBem,
   nSDepLanc, nSCmDep,
   nSReavDepLanc, nSReavCmDep,
   nSUltReavDepLanc, nSUltReavCmDep  : Extended;

begin
   try
      //----------------------------------------------------------------------------------
      // Processa a atualização através de Oracle Stored Procedure
      //----------------------------------------------------------------------------------
      if ParamCAF.TIPATUSALDOCONTAB = 0 then
      begin
         //-------------------------------------------------------------------------------
         // Atualiza os saldos dos valores com taxadep padrão
         //-------------------------------------------------------------------------------
         sprSaldoContabBem.ParamByName('PIDBEM').AsInteger        := iBem;
         sprSaldoContabBem.ParamByName('PIDPESSOA').AsInteger     := iEmpresaProp;
         sprSaldoContabBem.ParamByName('PDATASLDBEM').AsDateTime  := dDataSld;
         sprSaldoContabBem.ParamByName('PMOECODIGO').AsInteger    := iMoeCodigo;
         sprSaldoContabBem.ParamByName('PIDTAXADEP').AsInteger    := iTaxaDep;
         sprSaldoContabBem.ParamByName('PPAI').AsInteger          := iPai;
         sprSaldoContabBem.ParamByName('PCODMOV').AsInteger       := iCodMov;
         sprSaldoContabBem.ParamByName('PVALORG').AsFloat         := nValOrg;
         sprSaldoContabBem.ParamByName('PCMBEM').AsFloat          := nCmBem;
         sprSaldoContabBem.ParamByName('PDEPLANC').AsFloat        := nDepLanc;
         sprSaldoContabBem.ParamByName('PCMDEP').AsFloat          := nCmDep;
         sprSaldoContabBem.ParamByName('PREAVVALORG').AsFloat     := nReavValOrg;
         sprSaldoContabBem.ParamByName('PREAVCMBEM').AsFloat      := nReavCmBem;
         sprSaldoContabBem.ParamByName('PREAVDEPLANC').AsFloat    := nReavDepLanc;
         sprSaldoContabBem.ParamByName('PREAVCMDEP').AsFloat      := nReavCmDep;
         sprSaldoContabBem.ParamByName('PULTREAVVALORG').AsFloat  := nUltReavValOrg;
         sprSaldoContabBem.ParamByName('PULTREAVCMBEM').AsFloat   := nUltReavCmBem;
         sprSaldoContabBem.ParamByName('PULTREAVDEPLANC').AsFloat := nUltReavDepLanc;
         sprSaldoContabBem.ParamByName('PULTREAVCMDEP').AsFloat   := nUltReavCmDep;
         sprSaldoContabBem.ExecProc;
      end else
      //----------------------------------------------------------------------------------
      // Processa a atualização através de Delphi Procedure
      //----------------------------------------------------------------------------------
      begin
         //-------------------------------------------------------------------------------
         // Remove os saldos posteriores a data da movimentação estornada
         //-------------------------------------------------------------------------------
         if iCodMov = 2 then
         begin
            if iPai = 1 then           // Remove os saldos quando for a atualização do pai
            begin
               sSql := ' DELETE FROM SLDCTBBEMXDEP ' + #13 +
                       ' WHERE (IDBEM = ' + inttostr(iBem) + ')' + #13 +
                       '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' + #13 +
                       '   AND (DATASLDBEM >= TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataSld) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' + #13 +
                       '   AND (MOECODIGO = ' + inttostr(iMoeCodigo) + ')' + #13 ;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               sSql := ' DELETE FROM SALDOCONTABBEM ' + #13 +
                       ' WHERE (IDBEM = ' + inttostr(iBem) + ')' + #13 +
                       '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' + #13 +
                       '   AND (DATASLDBEM >= TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataSld) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' + #13 +
                       '   AND (MOECODIGO = ' + inttostr(iMoeCodigo) + ')' + #13;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Prepara os ClientDataSet's que irão gravar o saldo do bem
         //-------------------------------------------------------------------------------
         _dMTBem.sqlSaldoContabBem.Prepare;
         _dMTBem.sqlSaldoContabBem.ParamByName('IDBEM').AsInteger     := iBem;
         _dMTBem.sqlSaldoContabBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
         _dMTBem.sqlSaldoContabBem.ParamByName('DATASLD').AsDateTime  := dDataSld;
         _dMTBem.sqlSaldoContabBem.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
         cdsSaldoContabBem.Data := _dMTBem.sqlSaldoContabBem.Data;
         _dMTBem.sqlSldCtbBemxDep.Prepare;
         _dMTBem.sqlSldCtbBemxDep.ParamByName('IDBEM').AsInteger      := iBem;
         _dMTBem.sqlSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
         _dMTBem.sqlSldCtbBemxDep.ParamByName('DATASLD').AsDateTime   := dDataSld;
         _dMTBem.sqlSldCtbBemxDep.ParamByName('MOECODIGO').AsInteger  := iMoeCodigo;
         _dMTBem.sqlSldCtbBemxDep.ParamByName('IDTAXADEP').AsInteger  := iTaxaDep;
         cdsSldCtbBemxDep.Data  := _dMTBem.sqlSldCtbBemxDep.Data;
         //-------------------------------------------------------------------------------
         // Inicializa as variáveis de trabalho
         //-------------------------------------------------------------------------------
         if not cdsSaldoContabBem.IsEmpty then
         begin
            nSValOrg         := cdsSaldoContabBem.FieldByName('VALORG').AsFloat;
            nSCmBem          := cdsSaldoContabBem.FieldByName('CMBEM').AsFloat;
            nSReavValOrg     := cdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat;
            nSReavCmBem      := cdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat;
            nSUltReavValOrg  := cdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat;
            nSUltReavCmBem   := cdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
            nSDepLanc        := cdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat;
            nSCmDep          := cdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat;
            nSReavDepLanc    := cdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat;
            nSReavCmDep      := cdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat;
            nSUltReavDepLanc := cdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat;
            nSUltReavCmDep   := cdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat;
         end else
         begin
            nSValOrg         := 0;
            nSCmBem          := 0;
            nSReavValOrg     := 0;
            nSReavCmBem      := 0;
            nSUltReavValOrg  := 0;
            nSUltReavCmBem   := 0;
            nSDepLanc        := 0;
            nSCmDep          := 0;
            nSReavDepLanc    := 0;
            nSReavCmDep      := 0;
            nSUltReavDepLanc := 0;
            nSUltReavCmDep   := 0;
         end;
         //-------------------------------------------------------------------------------
         // Todas as movimentações, exceto REAVALIAÇÃO
         //-------------------------------------------------------------------------------
         if iCodMov = 0 then
         begin
            //----------------------------------------------------------------------------
            // Caso a data de Atualização já exista no cadastro, atualizar dados
            //----------------------------------------------------------------------------
            if cdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime = dDataSld then
            begin
               if iPai = 1 then
               begin
                  cdsSaldoContabBem.Edit;
                  cdsSaldoContabBem.FieldByName('VALORG').AsFloat         := nSValOrg         + nValOrg;
                  cdsSaldoContabBem.FieldByName('CMBEM').AsFloat          := nSCmBem          + nCmBem;
                  cdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat     := nSReavValOrg     + nReavValOrg;
                  cdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat      := nSReavCmBem      + nReavCmBem;
                  cdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat  := nSUltReavValOrg  + nUltReavValOrg;
                  cdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat   := nSUltReavCmBem   + nUltReavCmBem;
                  cdsSaldoContabBem.Post;
               end;
               cdsSldCtbBemxDep.Edit;
               cdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat        := nSDepLanc        + nDepLanc;
               cdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat          := nSCmDep          + nCmDep;
               cdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat    := nSReavDepLanc    + nReavDepLanc;
               cdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat      := nSReavCmDep      + nReavCmDep;
               cdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat := nSUltReavDepLanc + nUltReavDepLanc;
               cdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat   := nSUltReavCmDep   + nUltReavCmDep;
               cdsSldCtbBemxDep.Post;
           end else
            //----------------------------------------------------------------------------
            // Caso a data de Atualização não exista no cadastro, inserir saldo
            //----------------------------------------------------------------------------
            begin
               if iPai = 1 then
               begin
                  cdsSaldoContabBem.Append;
                  cdsSaldoContabBem.FieldByName('IDBEM').AsInteger        := iBem;
                  cdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger     := iEmpresaProp;
                  cdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime  := dDataSld;
                  cdsSaldoContabBem.FieldByName('MOECODIGO').AsInteger    := iMoeCodigo;
                  cdsSaldoContabBem.FieldByName('VALORG').AsFloat         := nSValOrg         + nValOrg;
                  cdsSaldoContabBem.FieldByName('CMBEM').AsFloat          := nSCmBem          + nCmBem;
                  cdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat     := nSReavValOrg     + nReavValOrg;
                  cdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat      := nSReavCmBem      + nReavCmBem;
                  cdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat  := nSUltReavValOrg  + nUltReavValOrg;
                  cdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat   := nSUltReavCmBem   + nUltReavCmBem;
                  cdsSaldoContabBem.Post;
               end;
               cdsSldCtbBemxDep.Append;
               cdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
               cdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
               cdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
               cdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
               cdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
               cdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc        + nDepLanc;
               cdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep          + nCmDep;
               cdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc    + nReavDepLanc;
               cdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep      + nReavCmDep;
               cdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc + nUltReavDepLanc;
               cdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep   + nUltReavCmDep;
               cdsSldCtbBemxDep.Post;
            end;
         end else
         //-------------------------------------------------------------------------------
         // Atualização de saldo decorrente de REAVALIAÇÃO
         //-------------------------------------------------------------------------------
         if iCodMov = 1 then
         begin
            //----------------------------------------------------------------------------
            // Caso a data de Atualização já exista no cadastro, atualizar dados
            //----------------------------------------------------------------------------
            if cdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime = dDataSld then
            begin
               if iPai = 1 then
               begin
                  cdsSaldoContabBem.Edit;
                  cdsSaldoContabBem.FieldByName('VALORG').AsFloat         := nSValOrg         + nValOrg;
                  cdsSaldoContabBem.FieldByName('CMBEM').AsFloat          := nSCmBem          + nCmBem;
                  cdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat     := nSReavValOrg     + nSUltReavValOrg;
                  cdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat      := nSReavCmBem      + nSUltReavCmBem;
                  cdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat  := nUltReavValOrg;
                  cdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat   := nUltReavCmBem;
                  cdsSaldoContabBem.Post;
               end;
               cdsSldCtbBemxDep.Edit;
               cdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat        := nSDepLanc        + nDepLanc;
               cdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat          := nSCmDep          + nCmDep;
               cdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat    := nSReavDepLanc    + nSUltReavDepLanc;
               cdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat      := nSReavCmDep      + nSUltReavCmDep;
               cdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat := nUltReavDepLanc;
               cdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat   := nUltReavCmDep;
               cdsSldCtbBemxDep.Post;
            end else
            //----------------------------------------------------------------------------
            // Caso a data de Atualização não exista no cadastro, inserir saldo
            //----------------------------------------------------------------------------
            begin
               if iPai = 1 then
               begin
                  cdsSaldoContabBem.Append;
                  cdsSaldoContabBem.FieldByName('IDBEM').AsInteger        := iBem;
                  cdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger     := iEmpresaProp;
                  cdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime  := dDataSld;
                  cdsSaldoContabBem.FieldByName('MOECODIGO').AsInteger    := iMoeCodigo;
                  cdsSaldoContabBem.FieldByName('VALORG').AsFloat         := nSValOrg         + nValOrg;
                  cdsSaldoContabBem.FieldByName('CMBEM').AsFloat          := nSCmBem          + nCmBem;
                  cdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat     := nSReavValOrg     + nSUltReavValOrg;
                  cdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat      := nSReavCmBem      + nSUltReavCmBem;
                  cdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat  := nUltReavValOrg;
                  cdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat   := nUltReavCmBem;
                  cdsSaldoContabBem.Post;
               end;
               cdsSldCtbBemxDep.Append;
               cdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
               cdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
               cdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
               cdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
               cdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
               cdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc        + nDepLanc;
               cdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep          + nCmDep;
               cdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc    + nSUltReavDepLanc;
               cdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep      + nSUltReavCmDep;
               cdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := nUltReavDepLanc;
               cdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := nUltReavCmDep;
               cdsSldCtbBemxDep.Post;
           end;
         end else
         //-------------------------------------------------------------------------------
         // Reconstroi Estornos
         //-------------------------------------------------------------------------------
         if iCodMov = 2 then
         begin
            _dMTBem.sqlMovContabBem.Prepare;
            _dMTBem.sqlMovContabBem.ParamByName('PIDBEM').AsInteger     := iBem;
            _dMTBem.sqlMovContabBem.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlMovContabBem.ParamByName('PDATASLD').AsDateTime  := dDataSld;
            _dMTBem.sqlMovContabBem.ParamByName('PMOECODIGO').AsInteger := iMoeCodigo;
            _dMTBem.sqlMovContabBem.ParamByName('PIDTAXADEP').AsInteger := iTaxaDep;
            cdsMovContabBem.Data := _dMTBem.sqlMovContabBem.Data;
            //----------------------------------------------------------------------------
            while not cdsMovContabBem.EOF do
            begin
               nSValOrg         := nSValOrg         + cdsMovContabBem.FieldByName('VALORG').AsFloat;
               nSCmBem          := nSCmBem          + cdsMovContabBem.FieldByName('CMBEM').AsFloat;
               nSDepLanc        := nSDepLanc        + cdsMovContabBem.FieldByName('DEPLANC').AsFloat;
               nSCmDep          := nSCmDep          + cdsMovContabBem.FieldByName('CMDEP').AsFloat;
               nSReavValOrg     := nSReavValOrg     + cdsMovContabBem.FieldByName('REAVVALORG').AsFloat;
               nSReavCmBem      := nSReavCmBem      + cdsMovContabBem.FieldByName('REAVCMBEM').AsFloat;
               nSReavDepLanc    := nSReavDepLanc    + cdsMovContabBem.FieldByName('REAVDEPLANC').AsFloat;
               nSReavCmDep      := nSReavCmDep      + cdsMovContabBem.FieldByName('REAVCMDEP').AsFloat;
               nSUltReavValOrg  := nSUltReavValOrg  + cdsMovContabBem.FieldByName('ULTREAVVALORG').AsFloat;
               nSUltReavCmBem   := nSUltReavCmBem   + cdsMovContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
               nSUltReavDepLanc := nSUltReavDepLanc + cdsMovContabBem.FieldByName('ULTREAVDEPLANC').AsFloat;
               nSUltReavCmDep   := nSUltReavCmDep   + cdsMovContabBem.FieldByName('ULTREAVCMDEP').AsFloat;
               //-------------------------------------------------------------------------
               if iPai = 1 then
               begin
                  cdsSaldoContabBem.Append;
                  cdsSaldoContabBem.FieldByName('IDBEM').AsInteger        := iBem;
                  cdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger     := iEmpresaProp;
                  cdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime  := dDataSld;
                  cdsSaldoContabBem.FieldByName('MOECODIGO').AsInteger    := iMoeCodigo;
                  cdsSaldoContabBem.FieldByName('VALORG').AsFloat         := nSValOrg;
                  cdsSaldoContabBem.FieldByName('CMBEM').AsFloat          := nSCmBem;
                  cdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat     := nSReavValOrg;
                  cdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat      := nSReavCmBem;
                  cdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat  := nSUltReavValOrg;
                  cdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat   := nSUltReavCmBem;
                  cdsSaldoContabBem.Post;
               end;
               cdsSldCtbBemxDep.Append;
               cdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
               cdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
               cdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
               cdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
               cdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
               cdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc;
               cdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep;
               cdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc;
               cdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep;
               cdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc;
               cdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep;
               cdsSldCtbBemxDep.Post;
               //-------------------------------------------------------------------------
               cdsMovContabBem.Next;
            end;
            cdsMovContabBem.Close;
         end;
      end;
      Result := True;
   except
      Result := False;
   end;
end;

//========================================================================================
// Funções de Integração Contábil
//========================================================================================
//========================================================================================
// Função que verifica se a data do lançamento e válida
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    fEmpresa     : id da Empresa Proprietária (Sistema.idEmpresa)
//    dData        : data do lançamento
//    iExercicio   : Exercicio Contábil da data de lançamento
//    iPeriodo     : Periodo Contábil da data de lançamento
//----------------------------------------------------------------------------------------
Function TCtrlBem.VerificaPeriodoContabil(fEmpresa : Extended; dData: tdatetime;
                                          Var iExercicio, iPeriodo : Integer) : Boolean;

begin
   Result := False;
   //-------------------------------------------------------------------------------------
   // Lê o periodo ao qual a data da movimentação pertence, verificando se é unico
   //-------------------------------------------------------------------------------------
   if not PeriodoContab.RetornaPeriodoExercicioData(fEmpresa,datetostr(dData)) then
   begin
      MessageInfo := 'Integração Contábil : ' + PeriodoContab.MessageInfo;
      exit;
   end;
   iExercicio := PeriodoContab.Exercicio;
   iPeriodo   := PeriodoContab.Periodo;
   //-------------------------------------------------------------------------------------
   // Verifica se o periodo existe
   //-------------------------------------------------------------------------------------
   if not PeriodoContab.TestaPeriodoExiste(fEmpresa, iPeriodo, iExercicio) then
   begin
      MessageInfo := 'Integração Contábil : ' + PeriodoContab.MessageInfo;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se o periodo está bloquedo pela contabilidade
   //-------------------------------------------------------------------------------------
   if PeriodoContab.TestaPeriodoBloqueado(fEmpresa, TBBLOQUEADO, iPeriodo, iExercicio,False) then
   begin
      MessageInfo := 'Integração Contábil : Período bloqueado pela Contabilidade!';
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se o periodo está bloquedo pela integração
   //-------------------------------------------------------------------------------------
   if PeriodoContab.TestaPeriodoBloqueado(fEmpresa, TBINTEGRADO, iPeriodo, iExercicio,False) then
   begin
      MessageInfo := 'Integração Contábil : Período bloqueado pela Integração!';
      exit;
   end;
   //-------------------------------------------------------------------------------------
   Result := True
end;
//========================================================================================
// Função que retorna um parâmetro contábil
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iEmpresa     : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Ativo Fixo
//    iTipoMov     : id da Movimentação
//    sTipoLanc    : Tipo do Lançamento Contábil (D - Débito, C - Crédito)
//    iPlano       : Plano Contábil
//    iPlaConta    : Conta Contábil
//----------------------------------------------------------------------------------------
function TCtrlBem.LeParamCafxContab(iEmpresa, iGrupo, iTipoMov : Integer;
                                    sTipoLanc: String;
                                    Var iPlano : Integer; Var sPlaConta : String) : Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.LEPARAMCAFXCONTAB(iEmpresa, iGrupo, iTipoMov, sTipoLanc,
                                                       iPlano, sPlaConta); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _cds.Data := GetDataPacket(' SELECT PLANO, PLACONTA, IDEMPRESA, CODCENTROCUSTO ' + #13 +
                                 ' FROM CONTASTIPOSMOVIMENTOGRUPOS ' + #13 +
                                 ' WHERE (IDGRUPO            = ' + inttostr(iGrupo) + ') ' + #13 +
                                 '   AND (IDTIPOMOVIMENTACAO = ' + inttostr(iTipoMov) + ') ' + #13 +
                                 '   AND (TIPOLANCAMENTO     = ' + #39 + sTipoLanc + #39 + ') ' + #13 +
                                 '   AND (IDPESSOA           = ' + inttostr(iEmpresa) + ') ' + #13 );
      Result := not _cds.IsEmpty;
   end;
end;
//========================================================================================
// Função que Contabiliza a Entrada do Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)
//    iEmpresa     : id da Empresa Proprietária (Sistema.idEmpresa)
//    iBem         : id do Bem movimentado
//    iGrupo       : id do Grupo do Bem movimentado
//    iConjunto    : id do Conjunto do Bem movimentado
//    iAtivProjeto : id da Unidade de Negócio / Atividade Projeto
//    iSubConta    : id da SubConta
//    sPlaca       : Placa Patrimonial
//    sDesBem      : Descrição do Bem
//    sGrupo       : Descrição do grupo do bem movimentado
//    dDataLanc    : Data da Entrada
//    fValOrg      : Valor da Entrada
//----------------------------------------------------------------------------------------
function TCtrlBem.ContabilizaEntrada(iModulo, iEmpresa, iBem, iGrupo, iConjunto,
                                     iAtivProjeto, iSubConta : Integer;
                                     sPlaca, sDesBem, sGrupo : String;
                                     dDataLanc : TDatetime; nValOrg : Extended) : Boolean;

var
   cdsCcRD                 : TClientDataSet;
   iTipoMov, iPlano        : Integer;
   sDebito, sCredito,
   sHistor1, sHistor2,
   sHistor3, sHistor4,
   sHistor5,
   sCC                     : String;
   nParticip1, nParticip2,
   nValLanc                : Extended;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.CONTABILIZAENTRADA(iModulo, iEmpresa,  iBem, iGrupo, iConjunto,
                                                        iAtivProjeto, iSubConta, sPlaca, sDesBem,
                                                        sGrupo, dDataLanc, nValOrg); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      Result := True;
      //----------------------------------------------------------------------------------
      try
         cdsCcRD := TClientDataSet.Create(nil);
         //-------------------------------------------------------------------------------
         iTipoMov := 01;
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Entrada do Bem
         //-------------------------------------------------------------------------------
         if not LeParamCafxContab(iEmpresa, iGrupo, iTipoMov, 'D', iPlano, sDebito) then
         begin
            MessageInfo := 'Conta a Débito para o Movimento de Entrada do Bem ' + sPlaca +
                           ' não cadastrada !';
            Result := False;
            Abort;
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Entrada do Bem
         //-------------------------------------------------------------------------------
         if not LeParamCafxContab(iEmpresa, iGrupo, iTipoMov, 'C', iPlano, sCredito) then
         begin
            MessageInfo := 'Conta a Crédito para o Movimento de Entrada do Bem ' + sPlaca +
                           ' não cadastrada !';
            Result := False;
            Abort;
         end;
         //-------------------------------------------------------------------------------
         // Processamento do Rateio dos Custos
         //-------------------------------------------------------------------------------
         sHistor1   := 'Entrada de Bem';
         sHistor2   := trim(sPlaca) + '-' + trim(sDesBem);
         sHistor3   := 'Grupo ' + sGrupo;
         sHistor4   := '';
         sHistor5   := '';
         nParticip1 := 0;
         nParticip2 := 0;
         //-------------------------------------------------------------------------------
         // Processa o rateio dos custos por centro de custo
         //-------------------------------------------------------------------------------
         cdsCcRD.Data := Conjunto.ListaRateioCustos(iEmpresa, iConjunto);
         while not cdsCcRD.EOF do
         begin
            if nParticip1 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil é valida
               //-------------------------------------------------------------------------
               if ContaContab.TestaContaContabil(iPlano, sDebito, False, False) then
               begin
                  MessageInfo := 'Integração Contábil : ' + ContaContab.MessageInfo;
                  Result := False;
                  Abort;
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil obriga centro de custo
               //-------------------------------------------------------------------------
               if ContaContab.ObrigaCentroCusto = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlano, iEmpresa, sDebito,
                                                   cdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := 'Integração Contábil : '+ ContaContab.MessageInfo;
                     Result := False;
                     Abort;
                  end else
                  begin
                     nParticip1 := cdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                     sCc        := cdsCcRD.FieldByName('CODCENTROCUSTO').AsString
                  end;
               end else
               begin
                  nParticip1 := 100;
                  sCc        := '';
               end;
               //-------------------------------------------------------------------------
               // Calcula Rateio
               //-------------------------------------------------------------------------
               nValLanc := (nValOrg * nParticip1) / 100;
               //-------------------------------------------------------------------------
               // Guarda o lançamento
               //-------------------------------------------------------------------------
               if not MontaLancContab(0, 'D', iPlano, sDebito, sCC, iSubConta, iAtivProjeto,
                                      iEmpresa, iBem, iGrupo, sGrupo, nValLanc, '',
                                      sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
               begin
                  Result := False;
                  Abort;
               end;
            end;
            //----------------------------------------------------------------------------
            if nParticip2 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil é valida
               //-------------------------------------------------------------------------
               if ContaContab.TestaContaContabil(iPlano, sCredito, False, False) then
               begin
                  MessageInfo := 'Integração Contábil : ' + ContaContab.MessageInfo;
                  Result := False;
                  Abort;
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil obriga centro de custo
               //-------------------------------------------------------------------------
               if ContaContab.ObrigaCentroCusto = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlano, iEmpresa, sCredito,
                                                   cdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := 'Integração Contábil : '+ ContaContab.MessageInfo;
                     Result := False;
                     Abort;
                  end else
                  begin
                     nParticip2 := cdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                     sCc        := cdsCcRD.FieldByName('CODCENTROCUSTO').AsString
                  end;
               end else
               begin
                  nParticip2 := 100;
                  sCc        := '';
               end;
               //-------------------------------------------------------------------------
               // Calcula Rateio
               //-------------------------------------------------------------------------
               nValLanc := (nValOrg * nParticip2) / 100;
               //-------------------------------------------------------------------------
               // Guarda o lançamento
               //-------------------------------------------------------------------------
               if not MontaLancContab(0, 'C', iPlano, sCredito, sCC, iSubConta, iAtivProjeto,
                                      iEmpresa, iBem, iGrupo, sGrupo, nValLanc, '',
                                      sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
               begin
                  Result := False;
                  Abort;
               end;
            end;
            //----------------------------------------------------------------------------
            cdsCcRD.Next;
         end;
      finally
         cdsCcRd.Free;
      end;
   end;
end;
//========================================================================================
// Função que recebe os lancamentos contábeis, acumulando-os para posterior registro
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iTipoContab  : Flag de Tipo Contabil
//    sDebCred     : Código do lançamento contábil (D - Débito / C - Crédito)
//    iPlano       : id do Plano de Contas
//    sConta       : Conta Contábil
//    sCc          : Centro de Custo
//    iSubConta    : id da SubConta
//    iAtivProjeto : Unidade de Negócio
//    fValLanc     : Valor do Lançamento
//    iEmpresa     : id da Empresa Proprietário (Sistema.idEmpresa)
//    iBem         : id do Bem movimentado
//    iGrupo       : id do Grupo do Bem movimentado
//    sNumDoc      : Identificação do documento que originou o lançamento
//    sHistor      : histórico da movimentacao
//    sHistor1     :     ''
//    sHistor2     :     ''
//    sHistor3     :     ''
//    sHistor4     :     ''
//
//----------------------------------------------------------------------------------------
function TCtrlBem.MontaLancContab(iTipoContab : Integer; sDebCred : String;
                                  iPlano : Integer; sConta, sCC : String;
                                  iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo : Integer;
                                  sGrupo : String; nValLanc : Extended;
                                  sNumDoc,sHistor1,sHistor2,sHistor3,
                                  sHistor4,sHistor5 : String) : Boolean;
var
   sNomeConta,
   sObrigaSubConta : String;
   iPatro,
   iPlanoPrev      : Integer;
   nPercRateio     : Extended;
   cdsRatPP        : TClientDataSet;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.MONTALANCCONTAB(iTipoContab, sDebCred, iPlano, sConta, sCC,
                                                     iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo,
                                                     sGrupo, nValLanc, sNumDoc, sHistor1, sHistor2,
                                                     sHistor3, sHistor4, sHistor5); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      Result := True;
      try
         cdsRatPP := TClientDataSet.Create(nil);
         try
            //----------------------------------------------------------------------------
            // Verifica se a subconta é obrigatória e se a conta contábil possui SubConta
            //----------------------------------------------------------------------------
            if ContaContab.ObrigaSubConta = 'S' then
            begin
               if iSubConta <= 0 then
               begin
                  MessageInfo := 'Integração Contábil : A SubConta ' + inttostr(iSubConta) +
                                 ' é obrigatória na Conta Contábil ' + sConta + #13 +
                                 'no Plano de Contas ' + inttostr(iPlano);
                  Result := False;
                  Abort;
               end else
               begin
                  if not ContaContab.TestaContaxSC(iPlano, iEmpresa, iSubConta, sConta) then
                  begin
                     MessageInfo := 'Integração Contábil : '+ ContaContab.MessageInfo;
                     Result := False;
                     Abort;
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Contabilização da movimentação dos bens, exceto Desmembramento e Obras
            //----------------------------------------------------------------------------
            if iTipoContab = 0 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Rateio de PlanoPatrocinadora do Bem para o calculo do rateio.
               // Caso não haja rateio definido, usa os Parâmetros do Sistema.
               //-------------------------------------------------------------------------
               cdsRatPP.Data := ListaPlanoPatroxBem(iEmpresa, iBem);
               //-------------------------------------------------------------------------
               repeat
                  if cdsRatPP.IsEmpty then
                  begin
                     iPatro      := ParamCAF.PATROPADRAO;
                     iPlanoPrev  := ParamCAF.PLANPREVPADRAO;
                     nPercRateio := 1;
                  end else
                  begin
                     iPatro      := cdsRatPP.FieldByName('IDPLANOPREV').AsInteger;
                     iPlanoPrev  := cdsRatPP.FieldByName('IDPATRO').AsInteger;
                     nPercRateio := cdsRatPP.FieldByName('PPBPERCRATEIO').AsFloat / 100;
                  end;
                  //----------------------------------------------------------------------
                  if not (cdsMontaContab.Locate('PLANO;PLACONTA;CODCENTROCUSTO;LACDEBCRE;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                          VarArrayOf([iPlano,sConta,sCc,sDebCred,iAtivProjeto,iPatro,iPlanoPrev]),[])) then
                  begin
                     cdsMontaContab.Append;
                     cdsMontaContab.FieldByName('PLANO').AsInteger         := iPlano;
                     cdsMontaContab.FieldByName('PLACONTA').AsString       := sConta;
                     cdsMontaContab.FieldByName('LACDEBCRE').AsString      := sDebCred;
                     cdsMontaContab.FieldByName('CODCENTROCUSTO').AsString := sCc;
                     cdsMontaContab.FieldByName('UNIDNEGOC').AsInteger     := iAtivProjeto;
                     cdsMontaContab.FieldByName('CODSUBCONTA').AsInteger   := iSubConta;
                     cdsMontaContab.FieldByName('IDPATRO').AsInteger       := ParamCAF.PATROPADRAO;
                     cdsMontaContab.FieldByName('IDPLANOPREV').AsInteger   := ParamCAF.PLANPREVPADRAO;
                     cdsMontaContab.FieldByName('LACHIST1').AsString       := sHistor1;
                     cdsMontaContab.FieldByName('LACHIST2').AsString       := sHistor2;
                     cdsMontaContab.FieldByName('LACHIST3').AsString       := sHistor3;
                     cdsMontaContab.FieldByName('LACHIST4').AsString       := sHistor4;
                     cdsMontaContab.FieldByName('LACHIST5').AsString       := sHistor5;
                     cdsMontaContab.FieldByName('LACNUMDOC').AsString      := sNumDoc;
                     cdsMontaContab.FieldByName('LACVALOR').AsCurrency     := nValLanc * nPercRateio;
                  end else
                  begin
                     cdsMontaContab.Edit;
                     cdsMontaContab.FieldByName('LACVALOR').AsCurrency := cdsMontaContab.FieldByName('LACVALOR').AsFloat +
                                                                          (nValLanc * nPercRateio);
                  end;
                  //----------------------------------------------------------------------
                  if not cdsRatPP.IsEmpty then
                     cdsRatPP.Next;
                  //----------------------------------------------------------------------
               until cdsRatPP.EOF;
            end else
            //----------------------------------------------------------------------------
            // Contabilização de Obras
            //----------------------------------------------------------------------------
            if iTipoContab = 1 then
            begin
               if not (cdsMontaContab.Locate('PLANO;PLACONTA;CODCENTROCUSTO;LACDEBCRE;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                       VarArrayOf([iPlano,sConta,sCc,sDebCred,iAtivProjeto,iPatro,iPlanoPrev]),[])) then
               begin
                  cdsMontaContab.Append;
                  cdsMontaContab.FieldByName('PLANO').AsInteger         := iPlano;
                  cdsMontaContab.FieldByName('PLACONTA').AsString       := sConta;
                  cdsMontaContab.FieldByName('CODCENTROCUSTO').AsString := sCc;
                  cdsMontaContab.FieldByName('UNIDNEGOC').AsInteger     := iAtivProjeto;
                  cdsMontaContab.FieldByName('CODSUBCONTA').AsInteger   := iSubConta;
                  cdsMontaContab.FieldByName('IDPATRO').AsInteger       := ParamCAF.PATROPADRAO;
                  cdsMontaContab.FieldByName('IDPLANOPREV').AsInteger   := ParamCAF.PLANPREVPADRAO;
                  cdsMontaContab.FieldByName('LACDEBCRE').AsString      := sDebCred;
                  cdsMontaContab.FieldByName('LACHIST1').AsString       := sHistor1;
                  cdsMontaContab.FieldByName('LACHIST2').AsString       := sHistor2;
                  cdsMontaContab.FieldByName('LACHIST3').AsString       := sHistor3;
                  cdsMontaContab.FieldByName('LACHIST4').AsString       := sHistor4;
                  cdsMontaContab.FieldByName('LACHIST5').AsString       := sHistor5;
                  cdsMontaContab.FieldByName('LACNUMDOC').AsString      := sNumDoc;
                  cdsMontaContab.FieldByName('LACVALOR').AsCurrency     := nValLanc;
               end else
               begin
                  cdsMontaContab.Edit;
                  cdsMontaContab.FieldByName('LACVALOR').AsCurrency := cdsMontaContab.FieldByName('LACVALOR').AsFloat + nValLanc;
               end;
            end else
            //----------------------------------------------------------------------------
            // Contabilização da movimentação Desmembramento
            //----------------------------------------------------------------------------
            if iTipoContab = 2 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Rateio de PlanoPatrocinadora do Bem para o calculo do rateio.
               // Caso não haja rateio definido, usa os Parâmetros do Sistema.
               //-------------------------------------------------------------------------
               cdsRatPP.Data := ListaPlanoPatroxBem(iEmpresa, iBem);
               //-------------------------------------------------------------------------
               repeat
                  if cdsRatPP.IsEmpty then
                  begin
                     iPatro      := ParamCAF.PATROPADRAO;
                     iPlanoPrev  := ParamCAF.PLANPREVPADRAO;
                     nPercRateio := 1;
                  end else
                  begin
                     iPatro      := cdsRatPP.FieldByName('IDPLANOPREV').AsInteger;
                     iPlanoPrev  := cdsRatPP.FieldByName('IDPATRO').AsInteger;
                     nPercRateio := cdsRatPP.FieldByName('PPBPERCRATEIO').AsFloat / 100;
                  end;
                  //----------------------------------------------------------------------
                  cdsMontaContab.Append;
                  cdsMontaContab.FieldByName('PLANO').AsInteger         := iPlano;
                  cdsMontaContab.FieldByName('PLACONTA').AsString       := sConta;
                  cdsMontaContab.FieldByName('LACDEBCRE').AsString      := sDebCred;
                  cdsMontaContab.FieldByName('CODCENTROCUSTO').AsString := sCc;
                  cdsMontaContab.FieldByName('UNIDNEGOC').AsInteger     := iAtivProjeto;
                  cdsMontaContab.FieldByName('CODSUBCONTA').AsInteger   := iSubConta;
                  cdsMontaContab.FieldByName('IDPATRO').AsInteger       := ParamCAF.PATROPADRAO;
                  cdsMontaContab.FieldByName('IDPLANOPREV').AsInteger   := ParamCAF.PLANPREVPADRAO;
                  cdsMontaContab.FieldByName('LACHIST1').AsString       := sHistor1;
                  cdsMontaContab.FieldByName('LACHIST2').AsString       := sHistor2;
                  cdsMontaContab.FieldByName('LACHIST3').AsString       := sHistor3;
                  cdsMontaContab.FieldByName('LACHIST4').AsString       := sHistor4;
                  cdsMontaContab.FieldByName('LACHIST5').AsString       := sHistor5;
                  cdsMontaContab.FieldByName('LACNUMDOC').AsString      := sNumDoc;
                  cdsMontaContab.FieldByName('LACVALOR').AsCurrency     := nValLanc * nPercRateio;
                  //----------------------------------------------------------------------
                  if not cdsRatPP.IsEmpty then
                     cdsRatPP.Next;
                  //----------------------------------------------------------------------
               until cdsRatPP.EOF;
            end;
         except
            On E : Exception Do
            begin
               Result := False;
               MessageInfo := E.Message;
            end;
         end;
      finally
         cdsRatPP.Free
      end;
   end;
end;
//========================================================================================
// Função que registra os Lancamentos da Movimentacao em um planilha na Contabilidade
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    nModulo   : Módulo responsável
//    nEmpresa  : Empresa Proprietária
//    nUsuario  : Usuário
//    sDataLanc : Data do Lançamento
//
//----------------------------------------------------------------------------------------
function TCtrlBem.RegistraPlanilhaContabil(nModulo, nEmpresa, nUsuario : Extended;
                                           sDataLanc : String) : Extended;
Var
   nPlnCodigo                          : Extended;
   sContaDeb, sContaCred, sCCDebito,
   sCCCredito, sSubContaD, sSubContaC  : String;
   sCodDebCred                         : Char;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.REGISTRAPLANILHACONTABIL(nModulo, nEmpresa, nUsuario,
                                                              sDataLanc); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      nPlnCodigo := 0;
      Result := nPlnCodigo;
      //----------------------------------------------------------------------------------
      cdsMontaContab.First;
      while not cdsMontaContab.EOF do
      begin
         sContaDeb  := '';
         sContaCred := '';
         sCCDebito  := '';
         sCCCredito := '';
         sSubContaD := '';
         sSubContaC := '';
         //-------------------------------------------------------------------------------
         if cdsMontaContab.FieldByName('LACDEBCRE').AsString = 'D' then
         begin
            sContaDeb  := cdsMontaContab.FieldByName('PLACONTA').AsString;
            sCCDebito  := cdsMontaContab.FieldByName('CODCENTROCUSTO').AsString;
            sSubContaD := cdsMontaContab.FieldByName('CODSUBCONTA').AsString;
         end else
         begin
            sContaCred := cdsMontaContab.FieldByName('PLACONTA').AsString;
            sCCCredito := cdsMontaContab.FieldByName('CODCENTROCUSTO').AsString;
            sSubContaC := cdsMontaContab.FieldByName('CODSUBCONTA').AsString;
         end;
         //-------------------------------------------------------------------------------
         if cdsMontaContab.FieldByName('LACDEBCRE').AsString = 'D' then
         begin
            sCodDebCred  := '0'
         end else
         begin
            sCodDebCred  := '1';
         end;
         //-------------------------------------------------------------------------------
         if cdsMontaContab.FieldByName('LACVALOR').AsFloat <> 0 then
         begin
            if not LancaContab.InsereLancaContab(sCodDebCred,                                       // 0 => Débito e 1 => Crédito
                                                 nEmpresa,                                          // Empresa proprietária
                                                 nModulo,                                           // Módulo responsável
                                                 nUsuario,                                          // Usuário
                                                 cdsMontaContab.FieldByName('PLANO').AsFloat,       // Plano Contábil
                                                 cdsMontaContab.FieldByName('UNIDNEGOC').AsFloat,   // Atividade/Projeto
                                                 strtofloat(sSubContaD),                            // SubConta a Débito
                                                 strtofloat(sSubContaC),                            // SubConta a Crédito
                                                 cdsMontaContab.FieldByName('IDPLANOPREV').AsFloat, // Plano Previdenciario
                                                 cdsMontaContab.FieldByName('IDPATRO').AsFloat,     // Patrocinadora
                                                 nPlnCodigo,                                        // Planilha
                                                 0,
                                                 sDataLanc,                                         // Data do lançamento
                                                 cdsMontaContab.FieldByName('LACNUMDOC').AsString,  // Número do Documento
                                                 cdsMontaContab.FieldByName('LACHIST1').AsString,   // Historico 1
                                                 cdsMontaContab.FieldByName('LACHIST2').AsString,   // Historico 2
                                                 cdsMontaContab.FieldByName('LACHIST3').AsString,   // Historico 3
                                                 cdsMontaContab.FieldByName('LACHIST4').AsString,   // Historico 4
                                                 cdsMontaContab.FieldByName('LACHIST5').AsString,   // Historico 5
                                                 ParamCAF.TIPOPERCTB,                               // Tipo de Operação
                                                 sCCDebito,                                         // Centro de Custo a Débito
                                                 sContaDeb,                                         // Conta Contábil a Débito
                                                 sCCCredito,                                        // Centro de Custo a Crédito
                                                 sContaCred,                                        // Conta Contábil a Crédito
                                                 '',
                                                 cdsMontaContab.FieldByName('LACVALOR').AsFloat,    // Valor do Lançamento
                                                 False,
                                                 Sistema.UsaPlanoPatro) then
            begin
               MessageInfo := LancaContab.MessageInfo;
               Result := -1;
               exit;
            end;
            //----------------------------------------------------------------------------
            nPlnCodigo := LancaContab.RetornoPlnCodigo;
         end;
         cdsMontaContab.Next;
      end;
      //----------------------------------------------------------------------------------
      cdsMontaContab.Close;
      Result := nPlnCodigo;
   end;
end;
//========================================================================================
// Funções genéricas
//========================================================================================
function TCtrlBem.TiraCaracter(sStr : string; sCh : Char) : string;
var
   iConta : Byte;

begin
   Result := '';
   for iConta := 1 to length(sStr) do
   begin
      if sStr[iConta] <> sCh then
         Result := Result + sStr[iConta];
   end;
end;
//========================================================================================
function TCtrlBem.ComplZeros(sCodigo : String; iTam : Integer) : string;
var
   iCont, iLen            : integer;
   sFull, sZeros, sResult : string;

begin
   sZeros := '';
   for iCont := 1 to iTam do
   begin
      sZeros := sZeros + '0';
   end;
   sFull := sZeros + trim(sCodigo);
   //-------------------------------------------------------------------------------------
   iLen := length(sFull);
   sResult := '';
   iCont := iTam;
   while iCont >= 1 do
   begin
      sResult := sFull[iLen] + sResult;
      iCont := iCont - 1;
      iLen  := iLen - 1;
   end;
   //-------------------------------------------------------------------------------------
   Result := sResult;
end;
//========================================================================================
function TCtrlBem.CotacaoMoeda(iMoeda : Integer; dData : tDatetime) : Extended;
var
   sData               : String;
   cdsMoeda, cdsMoedaC : TClientDataSet;

begin
   try
      cdsMoeda  := TClientDataSet.Create(nil);
      cdsMoedaC := TClientDataSet.Create(nil);
      //----------------------------------------------------------------------------------
      cdsMoeda.Data := GetDataPacket(' SELECT MOECODIGO, MOEPERIODICIDADE, MOEDESC ' + #13 +
                                     ' FROM MOEDA '+ #13 +
                                     ' WHERE (MOECODIGO = ' + inttostr(iMoeda) + ') ');
      //----------------------------------------------------------------------------------
      if cdsMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'M' then
      begin
         sData := copy(datetostr(dData),4,2) + copy(datetostr(dData),7,4);
         cdsMoedaC.Data := GetDataPacket(' SELECT COTVALOR ' + #13 +
                                         ' FROM COTACAOMOEDA ' + #13 +
                                         ' WHERE (MOECODIGO = ' + inttostr(iMoeda) + ') ' + #13 +
                                         '   AND (COTMESREF = ' + sData + ') ');
         //-------------------------------------------------------------------------------
         if cdsMoedaC.IsEmpty then
         begin
            MessageInfo := 'Cotação da Moeda ' + cdsMoeda.FieldByName('MOEDESC').AsString +
                           ' do Mês ' + sData + ' não Cadastrada!';
            result := -1;
         end else
            result := cdsMoedaC.FieldByName('COTVALOR').AsCurrency;
      end else
      //----------------------------------------------------------------------------------
      if cdsMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'D' then
      begin
         cdsMoedaC.Data := GetDataPacket(' SELECT COTVALOR ' + #13 +
                                         ' FROM COTACAOMOEDA ' + #13 +
                                         ' WHERE (MOECODIGO = ' + inttostr(iMoeda) + ') ' + #13 +
                                         '   AND (COTDATA   = ' + datetostr(dData) + ') ');
         //-------------------------------------------------------------------------------
         if cdsMoedaC.isEmpty then
         begin
            MessageInfo := 'Cotação da Moeda ' + cdsMoeda.FieldByName('MOEDESC').AsString +
                           ' do Dia ' + datetostr(dData) + ' não Cadastrada!';
            result := -1;
         end else
            result := cdsMoedaC.FieldByName('COTVALOR').AsCurrency;
      end;
   finally
      cdsMoeda.Free;
      cdsMoedaC.Free;
   end;
end;
//========================================================================================
function TCtrlBem.GeraProxPlacaTomb(nEmpresa, nGrupo, nClasse, nPlacaAtual : Extended) : Extended;
var
   sMascaraEmpresa,
   sCodPlaca, sClasse, sGrupo,
   sProximoCodigo, sProxPlaca,
   sDigMascPlaca, sSql           : String;
   iAux                          : Integer;
   bEdPlaca, bOk                 : boolean;

begin
   //-------------------------------------------------------------------------------------
   // Recarga dos parametros do sistema
   //-------------------------------------------------------------------------------------
   if not ParamCAF.CarregaProp(nEmpresa) then
   begin
      MessageInfo := 'Parâmetros do sistema inválidos!';
      Result := -1;
      Abort;
   end;
   //-------------------------------------------------------------------------------------
   bEdPlaca := ParamCAF.EDITACODBEM = 1;
   //-------------------------------------------------------------------------------------
   case ParamCAF.SEQBEMEMP of
      0 : sCodPlaca := 'E'; {sequencial por Empresa}
      1 : sCodPlaca := 'G'; {sequencial por Grupo}
      2 : sCodPlaca := 'C'; {sequencial por Classe}
      3 : sCodPlaca := 'S'; {sequencial Puro}
   end;
   //-------------------------------------------------------------------------------------
   sProxPlaca := '';
   bOk := False;
   while not bOk do
   begin
      if bEdPlaca then
      begin
         //-------------------------------------------------------------------------------
         // Calcula o Numero da Próxima Placa de Patrimônio
         //-------------------------------------------------------------------------------
         if ParamCAF.PROXIMAPLACA <= 0 then
         begin
            sProximoCodigo := '1';
         end else
         begin
            sProximoCodigo := FloatToStr(ParamCAF.PROXIMAPLACA);
         end;
         sDigMascPlaca := StringOfChar('0',ParamCAF.DIGMASCPLACA);
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' + floattostr(strtofloat(sProximoCodigo) + 1) +
                 ' WHERE (IDPESSOA = ' + floattostr(nEmpresa) + ')';
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Recarga dos parametros do sistema após a atualização
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresa) then
         begin
            MessageInfo := 'Parâmetros do sistema inválidos!';
            Result := -1;
            Abort;
         end;
         //-------------------------------------------------------------------------------
         // Calculo por GRUPO
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'G' then
         begin
            _cds.Data := GetDataPacket(' SELECT CLASSE FROM GRUPO ' +
                                       ' WHERE (IDGRUPO  = ' + floattostr(nGrupo) + ') ');
            sGrupo := trim(_cds.FieldByName('CLASSE').AsString);
            //----------------------------------------------------------------------------
            sProxPlaca := sGrupo + ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
         end;
         //-------------------------------------------------------------------------------
         // Calculo por CLASSE
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'C' then
         begin
            _cds.Data := GetDataPacket(' SELECT CODHIERARQ FROM CLASSEDEBEM '+
                                       ' WHERE (IDCLASSEBEM  = ' + floattostr(nClasse) + ') ');
            sClasse := trim(_cds.FieldByName('CODHIERARQ').AsString);
            //----------------------------------------------------------------------------
            sProxPlaca := sClasse + ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
         end;
         //-------------------------------------------------------------------------------
         // Calculo por EMPRESA
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'E' then
         begin
            sMascaraEmpresa := '';
            for iAux := 1 to length(trim(floattostr(nEmpresa))) do
            begin
               sMascaraEmpresa := sMascaraEmpresa + '9';
            end;
            //----------------------------------------------------------------------------
            sProxPlaca := ComplZeros(copy(floattostr(nPlacaAtual),1,length(sMascaraEmpresa))+
                                     sProximoCodigo,(Length(sMascaraEmpresa) + 9)) + sDigMascPlaca;
         end;
         //-------------------------------------------------------------------------------
         // Calculo SEQUENCIAL
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'S' then
         begin
            sProxPlaca := sProximoCodigo + sDigMascPlaca;
         end;
      end else
      begin
         sDigMascPlaca := StringOfChar('0',ParamCAF.DIGMASCPLACA);
         //-------------------------------------------------------------------------------
         if length(sDigMascPlaca) > 0 then
         begin
            sProxPlaca := copy(FloatToStr(nPlacaAtual),1,
                               length(FloatToStr(nPlacaAtual))-length(sDigMascPlaca));
            sProxPlaca := FloatToStr(StrToFloat(sProxPlaca) + 1) + sDigMascPlaca;
         end else
         begin
            sProxPlaca := FloatToStr(nPlacaAtual + 1);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Confere se a placa calculada já existe
      //----------------------------------------------------------------------------------
      bOk := PlacaUnica(nEmpresa, sProxPlaca);
   end;
   result := StrToFloat(sProxPlaca);
end;
//========================================================================================
function TCtrlBem.PlacaUnica(nEmpresa : Extended; sPlaca : string) : boolean;
var
   sSql, sPlacaAux : String;

begin
   sPlacaAux := sPlaca;
   while (pos('.',sPlacaAux) <> 0) do
      sPlacaAux := TiraCaracter(sPlacaAux,'.');
   //-------------------------------------------------------------------------------------
   sSql := ' SELECT IDBEM, DESBEM ' + #13 +
           ' FROM BEM ' + #13 +
           ' WHERE (PLACA = ' + sPlacaAux + ') ' + #13 +
           '   AND (IDPESSOA = ' + floattostr(nEmpresa) + ') ' + #13;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   result := _cds.IsEmpty;
end;

end.

