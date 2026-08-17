unit uCtrlMovBensPendentes;

interface

Uses DB, uCmDbObject, uCmControlObject, wwStoreP, uDatabase,
     SysUtils, dbclient, Provider, uMidasUtil, uCMTypes,
     dMTBem, uCtrlBem, uCtrlParamCAF, uDiasUteis;

Type
   TCtrlMovBensPendentes = class(TCmControlObject)

   Protected
      procedure AfterInitialize; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dMTBem : TdtmMTBem;

      Bem: TCtrlBem;
      ParamCAF: TCtrlParamCAF;

      FcdsBemxDep: TClientDataSet;
      FcdsBemxMoeda: TClientDataSet;
      FcdsBPPlanoPatroxBem: TClientDataSet;
      FcdsBPTaxasDep: TClientDataSet;
      FcdsTaxasDep: TClientDataSet;
      FcdsBP: TClientDataSet;
      Fcds: TClientDataSet;
      FcdsPlanoPatroxBem: TClientDataSet;
      FcdsImagem: TClientDataSet;
      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsBP(const Value: TClientDataSet);
      procedure SetcdsBPPlanoPatroxBem(const Value: TClientDataSet);
      procedure SetcdsBPTaxasDep(const Value: TClientDataSet);
      procedure SetcdsPlanoPatroxBem(const Value: TClientDataSet);
      procedure SetcdsTaxasDep(const Value: TClientDataSet);
      procedure SetcdsImagem(const Value: TClientDataSet);

      function CMTranslate(sIgor : String) : String;

   Public
      property cdsBP : TClientDataSet               read FcdsBP               write SetcdsBP;
      property cdsBPTaxasDep : TClientDataSet       read FcdsBPTaxasDep       write SetcdsBPTaxasDep;
      property cdsBPPlanoPatroxBem : TClientDataSet read FcdsBPPlanoPatroxBem write SetcdsBPPlanoPatroxBem;
      property cds : TClientDataSet                 read Fcds                 write Setcds;
      property cdsTaxasDep : TClientDataSet         read FcdsTaxasDep         write SetcdsTaxasDep;
      property cdsPlanoPatroxBem : TClientDataSet   read FcdsPlanoPatroxBem   write SetcdsPlanoPatroxBem;
      property cdsBemxMoeda : TClientDataSet        read FcdsBemxMoeda        write SetcdsBemxMoeda;
      property cdsBemxDep : TClientDataSet          read FcdsBemxDep          write SetcdsBemxDep;
      property cdsImagem :  TClientDataSet read FcdsImagem write SetcdsImagem;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //-------------------------------------------------------------------------------
      // Funções Públicas
      //-------------------------------------------------------------------------------
      function CarregaImagem(nImagem : Extended) : OleVariant;
      function ListarNotas(nIdPessoa : Extended) : OleVariant;
      function ListarBensNota(nIdPessoa, nIdFornServ: Extended; sIdNota : String) : OleVariant;
      function ListarBensNotaxDep(nIdPessoa, nIdFornServ: Extended; sIdNota : String) : OleVariant;
      function ListarBensNotaxRateio(nIdPessoa, nIdFornServ: Extended; sIdNota : String) : OleVariant;
      function DadosPlaca(nIdPessoa, nPlaca : Extended) : OleVariant;
      function RemoveBensPendentes(nIdPessoa, nIdBensPendentes : Extended) : Boolean;
      function RegistraBensNota(nUsuario : Extended) : Boolean;
      function ExecutaCadastroBem(nUsuario : Extended) : Boolean;

   end;

implementation

{ TCtrlMovBensPendentes }

constructor TCtrlMovBensPendentes.Create;
begin
   inherited;
   _dMTBem := tdtmMTBem.Create(Self);

   FcdsBP               := TClientDataSet.Create(nil);
   FcdsBPTaxasDep       := TClientDataSet.Create(nil);
   FcdsBPPlanoPatroxBem := TClientDataSet.Create(nil);
   Fcds                 := TClientDataSet.Create(nil);
   FcdsTaxasDep         := TClientDataSet.Create(nil);
   FcdsPlanoPatroxBem   := TClientDataSet.Create(nil);
   FcdsBemxMoeda        := TClientDataSet.Create(nil);
   FcdsBemxDep          := TClientDataSet.Create(nil);
   FcdsImagem           := TClientDataSet.Create(nil);

   Bem      := TCtrlBem.Create;
   ParamCAF := TCtrlParamCAF.Create;
end;

procedure TCtrlMovBensPendentes.AfterInitialize;
begin
   inherited;
   ParamCAF.InitializeAs(Self);
   Bem.InitializeAs(Self);
end;

destructor TCtrlMovBensPendentes.Destroy;
begin
   _dMTBem.Free;

   FcdsBP.Free;
   FcdsBPTaxasDep.Free;
   FcdsBPPlanoPatroxBem.Free;
   Fcds.Free;
   FcdsTaxasDep.Free;
   FcdsPlanoPatroxBem.Free;
   FcdsBemxMoeda.Free;
   FcdsBemxDep.Free;
   FcdsImagem.Free;

   Bem.Free;
   ParamCAF.Free;

   inherited;
end;

function TCtrlMovBensPendentes.ListarNotas(nIdPessoa : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT BP.IDPESSOA, BP.IDFORNSERV, P.NOME, BP.IDNOTA, BP.DTANOTA,  '+ #13 +
           '        SUM(BP.VALORG) AS SOMANOTA                                  '+ #13 +
           ' FROM BENSPENDENTES BP,                                             '+ #13 +
           '      PESSOA P                                                      '+ #13 +
           ' WHERE (BP.IDPESSOA    = '+ floattostr(nIdPessoa) +')               '+ #13 +
           '   AND (BP.IDFORNSERV = P.IDPESSOA)                                 '+ #13 +
           ' GROUP BY BP.IDPESSOA, BP.IDFORNSERV, P.NOME, BP.IDNOTA, BP.DTANOTA ';
   //----------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovBensPendentes.ListarBensNota(nIdPessoa, nIdFornServ: Extended; sIdNota : String) : OleVariant;
begin
   _dMTBem.sqlBensPendentes.Prepare;
   _dMTBem.sqlBensPendentes.ParamByName('PIDPESSOA').AsFloat   := nIdPessoa;
   _dMTBem.sqlBensPendentes.ParamByName('PIDFORNSERV').AsFloat := nIdFornServ;
   _dMTBem.sqlBensPendentes.ParamByName('PIDNOTA').AsString    := sIdNota;
   //----------------------------------------------------------------------------------
   Result := _dMTBem.sqlBensPendentes.Data;
end;

function TCtrlMovBensPendentes.ListarBensNotaxDep(nIdPessoa, nIdFornServ: Extended; sIdNota : String) : OleVariant;
begin
   _dMTBem.sqlBensPendentesxDep.Prepare;
   _dMTBem.sqlBensPendentesxDep.ParamByName('PIDPESSOA').AsFloat   := nIdPessoa;
   _dMTBem.sqlBensPendentesxDep.ParamByName('PIDFORNSERV').AsFloat := nIdFornServ;
   _dMTBem.sqlBensPendentesxDep.ParamByName('PIDNOTA').AsString    := sIdNota;
   //----------------------------------------------------------------------------------
   Result := _dMTBem.sqlBensPendentesxDep.Data;
end;

function TCtrlMovBensPendentes.ListarBensNotaxRateio(nIdPessoa, nIdFornServ: Extended; sIdNota : String) : OleVariant;
begin
   _dMTBem.sqlBensPendentesxRateio.Prepare;
   _dMTBem.sqlBensPendentesxRateio.ParamByName('PIDPESSOA').AsFloat   := nIdPessoa;
   _dMTBem.sqlBensPendentesxRateio.ParamByName('PIDFORNSERV').AsFloat := nIdFornServ;
   _dMTBem.sqlBensPendentesxRateio.ParamByName('PIDNOTA').AsString    := sIdNota;
   //----------------------------------------------------------------------------------
   Result := _dMTBem.sqlBensPendentesxRateio.Data;
end;

function TCtrlMovBensPendentes.DadosPlaca(nIdPessoa, nPlaca : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT B.IDBEM, B.IDPESSOA, B.PLACA, B.DESBEM, P.NOME AS NOMEFORN, B.IDNOTA, B.DTANOTA '+ #13 +
           ' FROM BEM B, '+ #13 +
           ' PESSOA P '+ #13 +
           ' WHERE (B.IDPESSOA = '+ floattostr(nIdPessoa) +') '+ #13 +
           '   AND (B.PLACA = '+ floattostr(nPlaca) +') '+ #13 +
           '   AND (B.IDFORNSERV = P.IDPESSOA(+)) '+ #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovBensPendentes.RemoveBensPendentes(nIdPessoa, nIdBensPendentes : Extended) : Boolean;
var
   sSql : String;

begin
   try
      sSql := ' DELETE FROM BENSPENDENTES ' + #13 +
              ' WHERE (IDBENSPENDENTES = ' + floattostr(nIdBensPendentes) + ')' + #13 +
              '   AND (IDPESSOA = ' + floattostr(nIdPessoa) + ')' + #13 ;
      if not ExecSQL(sSql, True) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlMovBensPendentes.RegistraBensNota(nUsuario : Extended) : boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.RegistraBensPendentesNota(nUsuario,
                                                               FcdsBP.Data,
                                                               FcdsBPTaxasDep.Data,
                                                               FcdsBPPlanoPatroxBem.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         FcdsBP.First;
         while not FcdsBP.EOF do
         begin
            if FcdsBP.FieldByName('ALTERADO').AsInteger = 1 then
            begin
               //-------------------------------------------------------------------------
               // Inicializa cds da persistencia
               //-------------------------------------------------------------------------
               Fcds.Data := Bem.ListaBem(0,0);
               FcdsTaxasDep.Data := Bem.ListaBemxDep(0,0,0);
               FcdsPlanoPatroxBem.Data := Bem.ListaPlanoPatroxBem(0,0);
               FcdsImagem.Data := CarregaImagem(-2);
               //-------------------------------------------------------------------------
               // Transfere os dados do registro corrente do cdsBP
               //-------------------------------------------------------------------------
               cds.Append;
               cds.FieldByName('IDPESSOA').AsFloat         := cdsBP.FieldByName('IDPESSOA').AsFloat         ;
               cds.FieldByName('IDMODULO').AsFloat         := cdsBP.FieldByName('IDMODULO').AsFloat         ;
               cds.FieldByName('IDFORNSERV').AsFloat       := cdsBP.FieldByName('IDFORNSERV').AsFloat       ;
               cds.FieldByName('IDNOTA').AsString          := cdsBP.FieldByName('IDNOTA').AsString          ;
               cds.FieldByName('IDITENSRECDEV').AsFloat    := cdsBP.FieldByName('IDITENSRECDEV').AsFloat    ;
               cds.FieldByName('IDSITUACAO').AsFloat       := cdsBP.FieldByName('IDSITUACAO').AsFloat    ;
               cds.FieldByName('PLACA').AsFloat            := cdsBP.FieldByName('PLACA').AsFloat            ;
               cds.FieldByName('DESBEM').AsString          := cdsBP.FieldByName('DESBEM').AsString          ;
               cds.FieldByName('IDGRUPO').AsFloat          := cdsBP.FieldByName('IDGRUPO').AsFloat          ;
               cds.FieldByName('IDCLASSEBEM').AsFloat      := cdsBP.FieldByName('IDCLASSEBEM').AsFloat      ;
               cds.FieldByName('IDCONJUNTO').AsFloat       := cdsBP.FieldByName('IDCONJUNTO').AsFloat       ;
               cds.FieldByName('CONTROLE').AsString        := cdsBP.FieldByName('CONTROLE').AsString        ;
               cds.FieldByName('COMPLNOTA').AsString       := cdsBP.FieldByName('COMPLNOTA').AsString       ;
               cds.FieldByName('DTANOTA').AsDateTime       := cdsBP.FieldByName('DTANOTA').AsDateTime       ;
               cds.FieldByName('DTAINCLUSAO').AsDateTime   := cdsBP.FieldByName('DTAINCLUSAO').AsDateTime   ;
               cds.FieldByName('NUMSERIE').AsString        := cdsBP.FieldByName('NUMSERIE').AsString        ;
               cds.FieldByName('IDTERCEIRO').AsFloat       := cdsBP.FieldByName('IDTERCEIRO').AsFloat       ;
               cds.FieldByName('REGISTRO').AsString        := cdsBP.FieldByName('REGISTRO').AsString        ;
               cds.FieldByName('VALHISTORICO').AsFloat     := cdsBP.FieldByName('VALORG').AsFloat     ;
               cds.FieldByName('DATAINICIODEP').AsDateTime := cdsBP.FieldByName('DATAINICIODEP').AsDateTime ;
               cds.FieldByName('IDOPCIONAL').AsString      := cdsBP.FieldByName('IDOPCIONAL').AsString      ;
               cds.FieldByName('PROCESSOAQUIS').AsString   := cdsBP.FieldByName('PROCESSOAQUIS').AsString   ;
               cds.FieldByName('EMPENHOAQUIS').AsString    := cdsBP.FieldByName('EMPENHOAQUIS').AsString    ;
               cds.FieldByName('PUBAUTOR').AsString        := cdsBP.FieldByName('PUBAUTOR').AsString        ;
               cds.FieldByName('PUBEDITORA').AsString      := cdsBP.FieldByName('PUBEDITORA').AsString      ;
               cds.FieldByName('PUBANO').AsFloat           := cdsBP.FieldByName('PUBANO').AsFloat           ;
               //-------------------------------------------------------------------------------------
               if (cdsBP.FieldByName('CODSUBCONTA').IsNull) or (cdsBP.FieldByName('CODSUBCONTA').AsFloat = 0) then
                  cds.FieldByName('CODSUBCONTA').Clear
               else
                  cds.FieldByName('CODSUBCONTA').AsFloat := cdsBP.FieldByName('CODSUBCONTA').AsFloat;
               if (cdsBP.FieldByName('UNIDNEGOC').IsNull) or (cdsBP.FieldByName('UNIDNEGOC').AsFloat = 0) then
                  cds.FieldByName('UNIDNEGOC').Clear
               else
                  cds.FieldByName('UNIDNEGOC').AsFloat := cdsBP.FieldByName('UNIDNEGOC').AsFloat;
               cds.Post;
               //-------------------------------------------------------------------------
               FcdsBPTaxasDep.Locate('IDBENSPENDENTES;IDPESSOA',
                                    VarArrayOf([FcdsBP.FieldByName('IDBENSPENDENTES').AsFloat,
                                                FcdsBP.FieldByName('IDPESSOA').AsFloat]),[]);
               while (not FcdsBPTaxasDep.EOF) and
                     (FcdsBPTaxasDep.FieldByName('IDBENSPENDENTES').AsFloat = FcdsBP.FieldByName('IDBENSPENDENTES').AsFloat) and
                     (FcdsBPTaxasDep.FieldByName('IDPESSOA').AsFloat = FcdsBP.FieldByName('IDPESSOA').AsFloat) do
               begin
                  MoveFields(cdsBPTaxasDep,cdsTaxasDep,opInserir,False);
                  FcdsBPTaxasDep.Next;
               end;
               //-------------------------------------------------------------------------
               FcdsBPPlanoPatroxBem.Locate('IDBENSPENDENTES;IDPESSOA',
                                           VarArrayOf([FcdsBP.FieldByName('IDBENSPENDENTES').AsFloat,
                                                       FcdsBP.FieldByName('IDPESSOA').AsFloat]),[]);
               while (not FcdsBPPlanoPatroxBem.EOF) and
                     (FcdsBPPlanoPatroxBem.FieldByName('IDBENSPENDENTES').AsFloat = FcdsBP.FieldByName('IDBENSPENDENTES').AsFloat) and
                     (FcdsBPPlanoPatroxBem.FieldByName('IDPESSOA').AsFloat = FcdsBP.FieldByName('IDPESSOA').AsFloat) do
               begin
                  MoveFields(cdsBPPlanoPatroxBem,cdsPlanoPatroxBem,opInserir,False);
                  FcdsBPPlanoPatroxBem.Next;
               end;
               //-------------------------------------------------------------------------
               // Cadastra um bem do documento de entrada
               //-------------------------------------------------------------------------
               if not ExecutaCadastroBem(nUsuario) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               // Remove o lancamento de pendencia
               //-------------------------------------------------------------------------
               if not RemoveBensPendentes(FcdsBP.FieldByName('IDPESSOA').AsFloat,
                                          FcdsBP.FieldByName('IDBENSPENDENTES').AsFloat) then
                  raise Exception.Create(MessageInfo);
            end;
            cdsBP.Next;
         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception do
         begin
            MessageInfo := E.Message;
            RollBack;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Função que processa o cadastro de bens pendentes no CAF
//========================================================================================
function TCtrlMovBensPendentes.ExecutaCadastroBem(nUsuario : Extended) : Boolean;
type
   rBemxDep = Record
      IDBEMXDEP  : Integer;
      TAXADEP    : Extended;
   end;

var
   nIdBem, nPlanilha,
   nValOrg, nValorMoeda            : Extended;
   iAux                            : Integer;
   aBemxDep                        : Array of rBemxDep;
   iaBemxDep                       : Integer;

begin
   try
      //-------------------------------------------------------------------------------
      // Carga dos parâmetros do sistema
      //-------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(Fcds.FieldByName('IDPESSOA').AsFloat) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      //-------------------------------------------------------------------------------
      FcdsBemxDep.Data := cdsTaxasDep.Data;
      //-------------------------------------------------------------------------------
      // Calcula a proporção
      //-------------------------------------------------------------------------------
      nValOrg := Fcds.FieldByName('VALHISTORICO').AsFloat;
      //-------------------------------------------------------------------------------
      // Registra em array os dados relativos a BEMXDEP em Moeda Oficial, para serem
      // replicados nas moedas restantes.
      //-------------------------------------------------------------------------------
      iaBemxDep := 0;
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger  = ParamCAF.MOEDAOFICIAL then
         begin
            FcdsBemxDep.Edit;
            FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
         end;
         SetLength(aBemxDep,iaBemxDep + 1);
         aBemxDep[iaBemxDep].IDBEMXDEP  := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
         aBemxDep[iaBemxDep].TAXADEP    := FcdsBemxDep.FieldByName('TAXADEP').AsFloat;
         iaBemxDep := iaBemxDep + 1;
         FcdsBemxDep.Next;
      end;
      //-------------------------------------------------------------------------------
      // Realiza os lançamentos em BEMXMOEDA
      //-------------------------------------------------------------------------------
      FcdsBemxMoeda.Data := Bem.ListaBemxMoeda(nUsuario,0);
      //-------------------------------------------------------------------------------
      // Registro do Valor em Moeda Oficial
      //-------------------------------------------------------------------------------
      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger   := Fcds.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAOFICIAL;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat       := nValOrg;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat        := 0;
      FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
      FcdsBemxMoeda.Post;
      //----------------------------------------------------------------------------------
      // Conversão do valor de aquisição para as quatro moedas suportadas pelo CAF
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAFISCAL > 0 then
      begin
         nValorMoeda := Bem.ConversaoMoeda(nValOrg,ParamCAF.MOEDAFISCAL,
                                           Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAFISCAL;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux < iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAFISCAL;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime  := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAGERENCIAL > 0 then
      begin
         nValorMoeda := Bem.ConversaoMoeda(nValOrg,ParamCAF.MOEDAGERENCIAL,
                                           Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux < iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAGERENCIALB > 0 then
      begin
         nValorMoeda := Bem.ConversaoMoeda(nValOrg,ParamCAF.MOEDAGERENCIALB,
                                           Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux < iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAGERENCIALB;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAGERENCIALC > 0 then
      begin
         nValorMoeda := Bem.ConversaoMoeda(nValOrg,ParamCAF.MOEDAGERENCIALC,
                                           Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALC;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux < iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAGERENCIALC;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Inclusão do Bem
      //----------------------------------------------------------------------------------
      nPlanilha := -1;
      //----------------------------------------------------------------------------------
      // Alimenta os datasets da classe de negócio
      //----------------------------------------------------------------------------------
      Bem.cds.Data               := Fcds.Data;
      Bem.cdsBemxMoeda.Data      := FcdsBemxMoeda.Data;
      Bem.cdsBemxDep.Data        := FcdsBemxDep.Data;
      Bem.cdsPlanoPatroxBem.Data := FcdsPlanoPatroxBem.Data;
      Bem.cdsImagem.Data         := FcdsImagem.Data;
      //----------------------------------------------------------------------------------
      nIdBem := Bem.ExecutaEntrada(Fcds.FieldByName('IDMODULO').AsInteger,
                                   Fcds.FieldByName('IDPESSOA').AsInteger,
                                   Trunc(nUsuario), nPlanilha);
      //----------------------------------------------------------------------------------
      if nIdBem < 0 then
         Raise Exception.Create(Bem.MessageInfo);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlMovBensPendentes.CarregaImagem(nImagem : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT I.IDIMAGEM, I.IMAGEM, I.DESCRIMAGEM ' + #13 +
           ' FROM IMAGENS I ' + #13 +
           ' WHERE I.IDIMAGEM = ' + floattostr(nImagem);
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

procedure TCtrlMovBensPendentes.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlMovBensPendentes.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlMovBensPendentes.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlMovBensPendentes.SetcdsBP(const Value: TClientDataSet);
begin
  FcdsBP := Value;
end;

procedure TCtrlMovBensPendentes.SetcdsBPPlanoPatroxBem(const Value: TClientDataSet);
begin
  FcdsBPPlanoPatroxBem := Value;
end;

procedure TCtrlMovBensPendentes.SetcdsBPTaxasDep(const Value: TClientDataSet);
begin
  FcdsBPTaxasDep := Value;
end;

procedure TCtrlMovBensPendentes.SetcdsPlanoPatroxBem(const Value: TClientDataSet);
begin
  FcdsPlanoPatroxBem := Value;
end;

procedure TCtrlMovBensPendentes.SetcdsTaxasDep(const Value: TClientDataSet);
begin
  FcdsTaxasDep := Value;
end;

procedure TCtrlMovBensPendentes.SetcdsImagem(const Value: TClientDataSet);
begin
  FcdsImagem := Value;
end;

function TCtrlMovBensPendentes.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.

