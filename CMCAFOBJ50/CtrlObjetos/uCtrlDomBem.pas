{
--------------------------------------------------------------------------------
Rotina...........: ExecutaCadastroBem()
Nº SIG...........: 133619
Data da Alteração: 03/04/2023
Responsável......: Marcos Lima
Descrição........: Erro ao incluir anexo no cadasto e bem.
--------------------------------------------------------------------------------
Rotina...........: idImovelHistorico, qGruposContabeis
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 04/12/2013
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
Rotina...........: ExecutaCadastroBem
Nº SOL...........: 204458
Nº KINTANA.......: 1981316
Data da Alteração: 19/04/2013
Responsável......: Thiago Melo
Descrição........: ajustar as funcionalidades de alterar e excluir qualquer bem
                   na tela de cadastro de bens.
--------------------------------------------------------------------------------
Rotina ......: ExecutaCadastroBem
SOL..........: 127213
Kintana......: 672023
Data.........: 03/01/2011
Responsável..: Helen V. Bianchi
Descrição....: Alterada ExecutaCadastroBem
--------------------------------------------------------------------------------
Rotina...........:  ListaHistBemxDep
Nº SOL...........: 142551
Nº KINTANA.......: 911676
Data da Alteração: 06/12/2010
Responsável......: Helen V. Bianchi
Descrição........: Criação da Rotina
--------------------------------------------------------------------------------
Rotina : GeraProxPlacaTomb
Nº SOL : 148704
Nº KINTANA : 1050021
Data : 03/12/2010
Responsável : Felipe de Oliveira
Descrição : Arrumar a rotina de  inserção de novos bens no caf
--------------------------------------------------------------------------------
Rotina......: TCtrlDomBem.ExecutaCadastroBem
Nº SOL......: 136972
Nº KINTANA..: 823252
Data........: 21/07/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do parâmetro "nValorResidual"
---------------------------------------------------------------------------------------------------}

unit uCtrlDomBem;

interface

Uses DB, uCmDbObject, uCmControlObject, wwStoreP, Wwquery,
     SysUtils, dbclient, Provider, uMidasUtil, uCMTypes,
     uDBBem, uDBImagemBem, Classes,
     uCtrlParamCAF, uCtrlBem;

Type
   TCtrlDomBem = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;
      procedure AfterInitialize; Override;

   Private
      _dbBem : TDBBem;
      _dbImagem : TDBImagemBem;
      Fcds,
      FcdsBemxMoeda,
      FcdsBemxDep,
      FcdsPlanoPatroxBem,
      FcdsTaxasDep,
      FcdsImagem : TClientDataSet;
      FqGruposContabeis : TwwQuery; // Vando - SOL 154328-5901 / KTN 1373449
      FIdBem: Integer;
      FidImovelHistorico : Integer; // Vando - SOL 154328-5901 / KTN 1373449
      Bem : TCtrlBem;
      ParamCAF : TCtrlParamCAF;
      FcdsPlanoPatroxVigenciaBem: TClientDataSet;
      FlistaIdBem: TStringList; //Marcos Lima - SIG 133619 - Ajuste no Anexo
      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsPlanoPatroxBem(const Value: TClientDataSet);
      procedure SetcdsTaxasDep(const Value: TClientDataSet);
      procedure SetcdsImagem(const Value: TClientDataSet);
      procedure SetqGruposContabeis(const Value: TwwQuery); // Vando - SOL 154328-5901 / KTN 1373449
      procedure SetIdBem(const Value: Integer);
      procedure SetidImovelHistorico(const Value: Integer); // Vando - SOL 154328-5901 / KTN 1373449
      function CMTranslate(sIgor : String) : String;
      procedure SetcdsPlanoPatroxVigenciaBem(const Value: TClientDataSet);
      procedure SetlistaIdBem(const Value: TStringList);
   Public
      property cds : TClientDataSet read Fcds write Setcds;
      property cdsBemxMoeda : TClientDataSet read FcdsBemxMoeda write SetcdsBemxMoeda;
      property cdsBemxDep : TClientDataSet read FcdsBemxDep write SetcdsBemxDep;
      property cdsPlanoPatroxBem : TClientDataSet read FcdsPlanoPatroxBem write SetcdsPlanoPatroxBem;
      property cdsTaxasDep : TClientDataSet read FcdsTaxasDep write SetcdsTaxasDep;
      property cdsImagem : TClientDataSet read FcdsImagem write SetcdsImagem;
      property listaIdBem : TStringList read FlistaIdBem write SetlistaIdBem; //Marcos Lima - SIG 133619 - Ajuste no Anexo
      property qGruposContabeis : TwwQuery read FqGruposContabeis write SetqGruposContabeis; // Vando - SOL 154328-5901 / KTN 1373449

      //----------------------------------------------------------------------------------
      // Para o InvestImob
      //----------------------------------------------------------------------------------
      Property IdBem : Integer read FIdBem write SetIdBem;
      property cdsPlanoPatroxVigenciaBem : TClientDataSet read FcdsPlanoPatroxVigenciaBem write SetcdsPlanoPatroxVigenciaBem;
      Property idImovelHistorico : Integer read FidImovelHistorico write SetidImovelHistorico; // Vando - SOL 154328-5901 / KTN 1373449
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function ListaBem(nIdPessoa : Extended; nIdBem : Extended = -1): OleVariant;
      function ListaBemxMoeda(nIdPessoa, nIdBem : Extended; nMoeCodigo : Extended = -1): OleVariant;
      function ListaBemxDep(nIdPessoa, nIdBem : Extended; nMoeCodigo : Extended = -1;
                            nIdBemxDep : Extended = -1): OleVariant;
      function ListaHistBemxDep(nIdPessoa, nIdBem : Extended; nMoeCodigo : Extended = -1;
                            nIdBemxDep : Extended = -1): OleVariant;// Helen - SOL: 142551 KTN: 911676
      function ListaPlanoPatroxBem(nIdPessoa, nIdBem : Extended; nIdPatro : Extended = -1;
                                   nIdPlanoPrev : Extended = -1) : OleVariant;
      function PlacaUnica(nEmpresa : Extended; sPlaca : string) : boolean;
      function PlacaIdBem(nEmpresa : Extended; sPlaca : string) : Integer;
      function CarregaImagem(nImagem : Extended) : OleVariant;
      //----------------------------------------------------------------------------------
      function ListaFornecedor(nIdForn : Extended = -1): OleVariant;
      function BemcomMovimento(nIdPessoa, nIdBem : Extended) : Boolean;
      function BemSelecionado(nIdPessoa, nIdBem : Extended) : Boolean;
      function BuscaGrupoContab(nIdPessoa, nIdClasse, nIdLocal : Extended) : OleVariant;
      function GrupoxClasseOk(nEmpresaProp, nIdGrupo, nIdClasse : Extended) : Boolean;
      function GrupoxConjuntoOk(nIdPessoa, nIdGrupo, nIdConjunto : Extended) : Boolean;
      function GeraProxPlacaTomb(nEmpresa, nGrupo, nClasse, nPlacaAtual : Extended) : Extended;
      //----------------------------------------------------------------------------------
      function ExecutaCadastroBem(nModulo, nEmpresaProp, nUsuario : Extended;
                                  sTipoEntrada : String = 'I';
                                  nValorTotal : Extended = 0;
                                  iQuantidade : Integer = 1;
                                  nValorResidual : Extended = 0) : Boolean; 
      //----------------------------------------------------------------------------------
      // Funções Auxiliares da Classe
      //----------------------------------------------------------------------------------
      function ExecutaAlteracaoEntradaCtrlTotal(nUsuario : Extended) : Boolean;
      function ExecutaAlteracaoEntradaRestrita : Boolean;
      //Cássio - SOL 107352 KINTANA 482365 - Início
      function ListaPlanoPatroxVigenciaBem(nIdBem : Integer): OLEVariant;
      function ListaPlanoPatroxVigenciaImob(nIdImovel: Integer) : OLEVariant;
      procedure GravaPlanoPatroxVigenciaBem(nIdPlanoPatroxVigenciaBem, nIdPlanoPrev, nIdPatro, nIdBem,
                                            nIdPessoa: Integer; dDataVigencia: String; PercentRateio: Double);
      function RetornaPlanoPatroXBemxImovel(iIdImovel : Integer) : OLEVariant;
      function VerificaSegregacaoOrigemImovelxBem(iIdImovel: Integer; var cdsAux: TClientDataSet): Boolean;
      procedure ExcluiPlanoPatroxVigenciaBem(iIdBem: Integer);
      //Cássio - Verifica se o bem informado pertence a uim imóvel
      function VerificaBensImoveis(fIdBem: Extended): boolean;
   end;

implementation

{ TCtrlDomBem }

constructor TCtrlDomBem.Create;
begin
   inherited;
   _dbBem := TDBBem.Create(Self);
   _dbImagem := TDBImagemBem.Create(Self);

   FcdsBemxMoeda := TClientDataSet.Create(nil);
   FcdsBemxDep := TClientDataSet.Create(nil);

   Bem := TCtrlBem.Create;
   ParamCAF := TCtrlParamCAF.Create;
end;

procedure TCtrlDomBem.OnCreateAppServer;
begin
   inherited;
   Fcds                       := TClientDataSet.Create(nil);
   FcdsTaxasDep               := TClientDataSet.Create(nil);
   FcdsPlanoPatroxBem         := TClientDataSet.Create(nil);
   FcdsImagem                 := TClientDataSet.Create(nil);
   FcdsPlanoPatroxVigenciaBem := TClientDataSet.Create(nil);
   qGruposContabeis           := TwwQuery.create(nil); // Vando - SOL 154328-5901 / KTN 1373449
   flistaIdBem                := TStringList.Create; //Marcos Lima - SIG 133619 - Ajuste no Anexo
end;

procedure TCtrlDomBem.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   ParamCAF.InitializeAs(Self);
end;

destructor TCtrlDomBem.Destroy;
begin
   //-------------------------------------------------------------------------------------
   // Free nos CDS usados em forms
   //-------------------------------------------------------------------------------------
   if IsAppServer then
      FreeCDS([Fcds, FcdsTaxasDep, FcdsPlanoPatroxBem, FcdsImagem]);
   //-------------------------------------------------------------------------------------
   // Free nos CDS usados na classe
   //-------------------------------------------------------------------------------------
   FcdsBemxMoeda.Free;
   FcdsBemxDep.Free;

   //Cássio - SOL Nº107352 KINTANA Nº 482395
   FcdsPlanoPatroxVigenciaBem.Free;

   _dbBem.Free;
   _dbImagem.Free;

   Bem.Free;
   ParamCAF.Free;
   //Marcos Lima - SIG 133619 - Ajuste no Anexo - Inicio
   if Assigned(FlistaIDBem) then
     FlistaIDBem.Free;
   //Marcos Lima - SIG 133619 - Ajuste no Anexo - Fim

   inherited;
end;

procedure TCtrlDomBem.DoChangeDataBase;
begin
   _dbBem.DataBaseName := DataBaseName;
   _dbImagem.DataBaseName := DataBaseName;
end;

function TCtrlDomBem.ListaBem(nIdPessoa, nIdBem: Extended) : OleVariant;
begin
   Result := Bem.ListaBem(nIdPessoa,nIdBem);
end;

function TCtrlDomBem.ListaBemxMoeda(nIdPessoa, nIdBem, nMoeCodigo : Extended) : OleVariant;
begin
   Result := Bem.ListaBemxMoeda(nIdPessoa, nIdBem, nMoeCodigo);
end;

function TCtrlDomBem.ListaBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep : Extended): OleVariant;
begin
   Result := Bem.ListaBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep);
end;

function TCtrlDomBem.ListaPlanoPatroxBem(nIdPessoa, nIdBem, nIdPatro, nIdPlanoPrev: Extended): OleVariant;
begin
   Result := Bem.ListaPlanoPatroxBem(nIdPessoa, nIdBem, nIdPatro, nIdPlanoPrev);
end;

function TCtrlDomBem.PlacaUnica(nEmpresa : Extended; sPlaca : string) : boolean;
begin
   Result := Bem.PlacaUnica(nEmpresa, sPlaca);
end;

function TCtrlDomBem.PlacaIdBem(nEmpresa : Extended; sPlaca : string) : Integer;
begin
   Result := Bem.PlacaIdBem(nEmpresa, sPlaca);
end;

function TCtrlDomBem.ListaFornecedor(nIdForn : Extended): OleVariant;
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

function TCtrlDomBem.BemcomMovimento(nIdPessoa, nIdBem : Extended) : Boolean;
var
   sSql : String;

begin
   Result := False;
   sSql := ' SELECT COUNT(IDMOVIMENTACAO) AS QTD '+ #13 +
           ' FROM   HISTORICOMOVIMENTACAO '+ #13 +
           ' WHERE (IDBEM  = ' + floattostr(nIdBem) + ') ' + #13 +
           '   AND (IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (IDTIPOMOVIMENTACAO <> 01) ' + #13 +  // ENTRADA TOTAL
           '   AND (IDTIPOMOVIMENTACAO <> 03) ' + #13 +  // ENTRADA FISICA
           '   AND (IDTIPOMOVIMENTACAO <> 17) ' + #13 +  // INCLUSAO DE DEPRECIACAO
           '   AND (IDTIPOMOVIMENTACAO <> 15) ' + #13 +  // CORRECAO MONETARIA
           '   AND (IDTIPOMOVIMENTACAO <> 21) ' + #13 +  // CORRECAO MONETARIA DA DEPRECIACAO
           '   AND (IDTIPOMOVIMENTACAO <> 32) ' + #13 +  // INCLUSAO DO SALDO DE REAVALIACAO
           '   AND (IDTIPOMOVIMENTACAO <> 33) ' + #13 +  // INCLUSAO DA DEPRECIACAO DO SALDO DE REAVALIACAO
           '   AND (IDTIPOMOVIMENTACAO <> 22) ' + #13 +  // CORRECAO MONETARIA DA REAVALIACAO
           '   AND (IDTIPOMOVIMENTACAO <> 19) ' + #13 +  // CORRECAO MONETARIA DA DEPRECIACAO DA REAVALIACAO
           '   AND (IDTIPOMOVIMENTACAO <> 97) ' + #13 ;  // VALOR RESIDUAL // Alterado por FHBS - SOL: 136972 KTN: 823252
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.FieldByName('QTD').AsInteger <> 0 then
   begin
      MessageInfo := CMTranslate('Bens já movimentados não podem ser Removidos !');
      Result := True;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

function TCtrlDomBem.BemSelecionado(nIdPessoa, nIdBem : Extended) : Boolean;
var
   sSql : String;

begin
   Result := False;
   sSql := ' SELECT SBB.IDSELBAIXA, SB.SBXTERMO, SB.SBTIPOMOV ' + #13 +
           ' FROM SELBAIXABENS SBB, ' + #13 +
           '      SELBAIXA SB ' + #13 +
           ' WHERE (SBB.IDBEM  = ' + floattostr(nIdBem) + ') ' + #13 +
           '   AND (SBB.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (SBB.IDSELBAIXA = SB.IDSELBAIXA) ';
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if not _cds.IsEmpty then
   begin
      if _cds.FieldByName('SBTIPOMOV').AsInteger = 0 then // 0 - Baixa, 1 - Transferência
      begin
         MessageInfo := CMTranslate('Bem selecionado no Termo de Baixa ') +
                        _cds.FieldByName('SBXTERMO').AsString + #13 +
                        CMTranslate('Alteração Restrita.');
      end else
      begin
         MessageInfo := CMTranslate('Bem selecionado no Termo de Transferência ') +
                        _cds.FieldByName('SBXTERMO').AsString + #13 +
                        CMTranslate('Alteração Restrita.');
      end;
      Result := True;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

function TCtrlDomBem.BuscaGrupoContab(nIdPessoa, nIdClasse, nIdLocal : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT GXCC.IDGRUPO ' + #13 +
           ' FROM CLASSEXGRUPO CXG, ' + #13 +
           '      GRUPOBEMXCC GXCC, ' + #13 +
           '      LOCALIZACAO L, ' + #13 +
           '      PLANOGRUPO PG ' + #13 +
           ' WHERE (CXG.IDCLASSEBEM = ' + floattostr(nIdClasse) + ') '+ #13 +
           '   AND (L.IDLOCALIZACAO = ' + floattostr(nIdLocal) + ')'+ #13 +
           '   AND (L.IDPESSOA = ' + floattostr(nIdPessoa) + ')'+ #13 +
           '   AND (PG.IDPESSOA = ' + floattostr(nIdPessoa) + ')'+ #13 +
           '   AND (PG.INATIVO = 0)' + #13 +
           '   AND (CXG.IDGRUPO = GXCC.IDGRUPO)'+ #13 +
           '   AND (GXCC.CODCENTROCUSTO = L.CODCENTROCUSTO)'+ #13 +
           '   AND (GXCC.IDEMPRESA = L.IDEMPRESA)'+ #13 +
           '   AND (GXCC.IDGRUPO = PG.IDGRUPO)'+ #13 +
           '   AND (GXCC.IDPESSOA = PG.IDPESSOA)'+ #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlDomBem.GrupoxClasseOk(nEmpresaProp, nIdGrupo, nIdClasse : Extended) : Boolean;
var
   sSql : String;

begin
   Result := True;
   sSql := ' SELECT CG.IDCLASSEBEM, CG.IDGRUPO '+ #13 +
           ' FROM CLASSEXGRUPO CG,' + #13 +
           '      PLANOGRUPO PG ' + #13 +
           ' WHERE CG.IDCLASSEBEM = ' + floattostr(nIdClasse) + #13 +
           '   AND CG.IDGRUPO = ' + floattostr(nIdGrupo) + #13 +
           '   AND PG.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
           '   AND PG.INATIVO = 0 ' + #13 +
           '   AND CG.IDGRUPO = PG.IDGRUPO';
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.IsEmpty then
   begin
      MessageInfo := CMTranslate('Grupo escolhido é inválido para a Classe selecionada do Bem. ') + #13 +
                     CMTranslate('Selecione o Grupo Correto');
      Result := False;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

function TCtrlDomBem.GrupoxConjuntoOk(nIdPessoa, nIdGrupo, nIdConjunto : Extended) : Boolean;
var
   sSql : String;

begin
   Result := True;
   sSql := ' SELECT GXCC.IDGRUPO ' + #13 +
           ' FROM CONJUNTO C, ' + #13 +
           '      LOCALIZACAO L, ' + #13 +
           '      GRUPOBEMXCC GXCC, ' + #13 +
           '      PLANOGRUPO PG ' + #13 +
           ' WHERE (C.IDCONJUNTO = ' + floattostr(nIdConjunto) + ') ' + #13 +
           '   AND (C.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (GXCC.IDGRUPO = ' + floattostr(nIdGrupo) + ') ' + #13 +
           '   AND (PG.IDPESSOA = ' + floattostr(nIdPessoa) + ')'+ #13 +
           '   AND (PG.INATIVO = 0)' + #13 +
           '   AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO) ' + #13 +
           '   AND (L.CODCENTROCUSTO = GXCC.CODCENTROCUSTO) ' + #13 +
           '   AND (L.IDEMPRESA = GXCC.IDEMPRESA) ' + #13 +
           '   AND (GXCC.IDGRUPO = PG.IDGRUPO)'+ #13 +
           '   AND (GXCC.IDPESSOA = PG.IDPESSOA)'+ #13 ;
   _cds.Data := GetDataPacket(sSql);
   //-------------------------------------------------------------------------------------
   if _cds.IsEmpty then
   begin
      MessageInfo := CMTranslate('Grupo selecionado inválido para a Localização/Centro de Custo do Bem. ')+ #13 +
                     CMTranslate('Selecione o Grupo Correto');
      Result := False;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

function TCtrlDomBem.CarregaImagem(nImagem : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT I.IDIMAGEM, I.IMAGEM, I.DESCRIMAGEM ' + #13 +
           ' FROM IMAGENS I ' + #13 +
           ' WHERE I.IDIMAGEM = ' + floattostr(nImagem);
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

procedure TCtrlDomBem.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlDomBem.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
   FcdsBemxMoeda := Value;
end;

procedure TCtrlDomBem.SetcdsBemxDep(const Value: TClientDataSet);
begin
   FcdsBemxDep := Value;
end;

procedure TCtrlDomBem.SetcdsPlanoPatroxBem(const Value: TClientDataSet);
begin
   FcdsPlanoPatroxBem := Value;
end;

procedure TCtrlDomBem.SetcdsTaxasDep(const Value: TClientDataSet);
begin
   FcdsTaxasDep := Value;
end;

procedure TCtrlDomBem.SetcdsImagem(const Value: TClientDataSet);
begin
  FcdsImagem := Value;
end;

procedure TCtrlDomBem.SetIdBem(const Value: Integer);
begin
  FIdBem := Value;
end;

procedure TCtrlDomBem.SetidImovelHistorico(const Value: Integer);
begin
  FidImovelHistorico := Value;
end;

//========================================================================================
// Função que processa o cadastro de bens do CAF
//
// Parâmetros :
//
//    sTipoEntrada - Especifica o tipo de Entrada :
//                   I  - Inclusão
//                   AC - Alteração Controle Total/Física Completa
//                   AR - Alteração Controle Total Restrita
//                   R  - Estorna a Inclusão
//    nValorTotal  - Valor Total dos bens adquiridos
//    iQuantidade  - Quantidade de bens adquiridos
//    nValorResidual - Valor Residual Total dos bens adquiridos
//========================================================================================
function TCtrlDomBem.ExecutaCadastroBem(nModulo, nEmpresaProp, nUsuario : Extended;
                                        sTipoEntrada : String;
                                        nValorTotal : Extended; iQuantidade : Integer;
                                        nValorResidual : Extended) : Boolean;
type
   rBemxDep = Record
      IDBEMXDEP  : Integer;
      TAXADEP    : Extended;
   end;

var
   nIdBem, nPlanilha, nPlacaAtual,
   nValOrg, nValorMoeda            : Extended;
   nValorRes, nValorMoedaRes      : Extended;
   sDigMascPlaca                   : String;
   iQtd, iAux                      : Integer;
   aBemxDep                        : Array of rBemxDep;
   iaBemxDep                       : Integer;
   bTransaction                    : Boolean;   // Helen - SOL: 127213 KTN: 672023
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaCadastroBem(nModulo, nEmpresaProp, nUsuario,
                                                        sTipoEntrada, nValorTotal, iQuantidade,
                                                        nValorResidual,
                                                        Fcds.Data,
                                                        FcdsTaxasDep.Data,
                                                        FcdsPlanoPatroxBem.Data,
                                                        FcdsImagem.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         // Helen - SOL: 127213 KTN: 672023
         bTransaction  := InTransaction;
         if not bTransaction then
            StartTransaction;
         //-------------------------------------------------------------------------------
         if sTipoEntrada <> 'I' then
            if Fcds.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
            begin
               MessageInfo := CMTranslate('Bem em Saída Temporária!');
               Raise Exception.Create(MessageInfo);
            end else
            if Fcds.FieldByName('BAIXATOTAL').AsString = 'S' then
            begin
               MessageInfo := CMTranslate('Bem Baixado!');
               Raise Exception.Create(MessageInfo);
            end;
         //-------------------------------------------------------------------------------
         if iQuantidade <= 0 then
         begin
            MessageInfo := CMTranslate('É obrigatório fornecer a quantidade de bens!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------

         // Marchetti - Pendencia 20311 - 14/11/2005
         if (Fcds.FieldByName('CONTROLE').AsString = 'T') and (nValorTotal = 0) and (nModulo <> 54) then
//         if (Fcds.FieldByName('CONTROLE').AsString = 'T') and (nValorTotal = 0) then
         begin
            MessageInfo := CMTranslate('O valor de aquisição do(s) bem(ns) deve(m) ser informado(s)!');
            Raise Exception.Create(MessageInfo);
         end;
         // Fim Marchetti - Pendencia 20311 - 14/11/2005

         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(Fcds.FieldByName('IDPESSOA').AsFloat) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Data := FcdsTaxasDep.Data;
         //-------------------------------------------------------------------------------
         // Calcula a proporção
         //-------------------------------------------------------------------------------
         nValOrg := strtofloat(FormatFloat('#0.00',(((nValorTotal / iQuantidade) * 100) / 100)));
         nValorRes := strtofloat(FormatFloat('#0.00',(((nValorResidual / iQuantidade) * 100) / 100))); // Alterado por FHBS - SOL: 136972 KTN: 823252
         Fcds.Edit;
         Fcds.FieldByName('VALHISTORICO').AsFloat := nValOrg;
         Fcds.FieldByName('VALRESIDUAL').AsFloat := nValorRes; // Alterado por FHBS - SOL: 136972 KTN: 823252
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
         FcdsBemxMoeda.Data := Bem.ListaBemxMoeda(nEmpresaProp,0);
         //-------------------------------------------------------------------------------
         // Registro do Valor em Moeda Oficial
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger   := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAOFICIAL;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat       := nValOrg;
         FcdsBemxMoeda.FieldByName('VALORRES').AsFloat     := nValorRes; // Alterado por FHBS - SOL: 136972 KTN: 823252
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat        := 0;
         FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Conversão do valor de aquisição para as quatro moedas suportadas pelo CAF
         //-------------------------------------------------------------------------------
         if ParamCAF.MOEDAFISCAL > 0 then
         begin
            nValorMoeda := Bem.ConversaoMoeda(nValOrg, ParamCAF.MOEDAFISCAL,
                                              Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
            if nValorMoeda < 0 then
               Raise Exception.Create(Bem.MessageInfo);

            // Alterado por FHBS - SOL: 136972 KTN: 823252
            nValorMoedaRes := Bem.ConversaoMoeda(nValorRes, ParamCAF.MOEDAFISCAL,
                                                 Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
            if nValorMoedaRes < 0 then
               Raise Exception.Create(Bem.MessageInfo);
            // Fim - Alterado por FHBS

            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Append;
            FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAFISCAL;
            FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
            FcdsBemxMoeda.FieldByName('VALORRES').AsFloat    := nValorMoedaRes; // Alterado por FHBS - SOL: 136972 KTN: 823252
            FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
            FcdsBemxMoeda.Post;
            //----------------------------------------------------------------------------
            // Registra as taxas de depreciacao para esta moeda
            //----------------------------------------------------------------------------
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
         //-------------------------------------------------------------------------------
         if ParamCAF.MOEDAGERENCIAL > 0 then
         begin
            nValorMoeda := Bem.ConversaoMoeda(nValOrg, ParamCAF.MOEDAGERENCIAL,
                                              Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
            if nValorMoeda < 0 then
               Raise Exception.Create(Bem.MessageInfo);

            // Alterado por FHBS - SOL: 136972 KTN: 823252
            nValorMoedaRes := Bem.ConversaoMoeda(nValorRes, ParamCAF.MOEDAGERENCIAL,
                                                 Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
            if nValorMoedaRes < 0 then
               Raise Exception.Create(Bem.MessageInfo);
            // Fim - Alterado por FHBS

            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Append;
            FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
            FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
            FcdsBemxMoeda.FieldByName('VALORRES').AsFloat    := nValorMoedaRes; // Alterado por FHBS - SOL: 136972 KTN: 823252
            FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
            FcdsBemxMoeda.Post;
            //----------------------------------------------------------------------------
            // Registra as taxas de depreciacao para esta moeda
            //----------------------------------------------------------------------------
            iAux := 0;
            while iAux < iaBemxDep do
            begin
               FcdsBemxDep.Append;
               FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := Fcds.FieldByName('IDPESSOA').AsInteger;
               FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAGERENCIAL;
               FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
               FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
               FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
               FcdsBemxDep.Post;
               iAux := iAux + 1;
            end;
         end;
         //-------------------------------------------------------------------------------
         if ParamCAF.MOEDAGERENCIALB > 0 then
         begin
            nValorMoeda := Bem.ConversaoMoeda(nValOrg, ParamCAF.MOEDAGERENCIALB,
                                              Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
            if nValorMoeda < 0 then
               Raise Exception.Create(Bem.MessageInfo);

            // Alterado por FHBS - SOL: 136972 KTN: 823252
            nValorMoedaRes := Bem.ConversaoMoeda(nValorRes, ParamCAF.MOEDAGERENCIALB,
                                                 Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
            if nValorMoedaRes < 0 then
               Raise Exception.Create(Bem.MessageInfo);
            // Fim - Alterado por FHBS

            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Append;
            FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
            FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
            FcdsBemxMoeda.FieldByName('VALORRES').AsFloat    := nValorMoedaRes; // Alterado por FHBS - SOL: 136972 KTN: 823252
            FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
            FcdsBemxMoeda.Post;
            //----------------------------------------------------------------------------
            // Registra as taxas de depreciacao para esta moeda
            //----------------------------------------------------------------------------
            iAux := 0;
            while iAux < iaBemxDep do
            begin
               FcdsBemxDep.Append;
               FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
               FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
               FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
               FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
               FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
               FcdsBemxDep.Post;
               iAux := iAux + 1;
            end;
         end;
         //-------------------------------------------------------------------------------
         if ParamCAF.MOEDAGERENCIALC > 0 then
         begin
            nValorMoeda := Bem.ConversaoMoeda(nValOrg, ParamCAF.MOEDAGERENCIALC,
                                              Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
            if nValorMoeda < 0 then
               Raise Exception.Create(Bem.MessageInfo);

            // Alterado por FHBS - SOL: 136972 KTN: 823252
            nValorMoedaRes := Bem.ConversaoMoeda(nValorRes, ParamCAF.MOEDAGERENCIALC,
                                                 Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
            if nValorMoedaRes < 0 then
               Raise Exception.Create(Bem.MessageInfo);
            // Fim - Alterado por FHBS

            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Append;
            FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALC;
            FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
            FcdsBemxMoeda.FieldByName('VALORRES').AsFloat    := nValorMoedaRes; // Alterado por FHBS - SOL: 136972 KTN: 823252
            FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
            FcdsBemxMoeda.Post;
            //----------------------------------------------------------------------------
            // Registra as taxas de depreciacao para esta moeda
            //----------------------------------------------------------------------------
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
         //-------------------------------------------------------------------------------
         // Processa o Tipo de Cadastramento que está sendo realizado
         //-------------------------------------------------------------------------------
         if sTipoEntrada = 'I' then
         begin
            //----------------------------------------------------------------------------
            // Inclusão do Bem
            //----------------------------------------------------------------------------
            // Complementa a placa com os digitos de subplaca
            //----------------------------------------------------------------------------
            if not Fcds.FieldByName('PLACA').IsNull then
            begin
               nPlacaAtual := Fcds.FieldByName('PLACA').AsFloat;
               if iQuantidade > 1 then
               begin
                  _cds.Data := GetDataPacket(' SELECT DIGMASCPLACA '+
                                             ' FROM PARAMETROSCAFMANUT '+
                                             ' WHERE IDPESSOA = ' + Fcds.FieldByName('IDPESSOA').AsString);
                  sDigMascPlaca := StringOfChar('0',_cds.FieldByName('DIGMASCPLACA').AsInteger);
                  //----------------------------------------------------------------------
                  nPlacaAtual := strtofloat(floattostr(nPlacaAtual) + sDigMascPlaca);
                  Fcds.FieldByName('PLACA').AsFloat := nPlacaAtual;
               end;
            end else
            begin
               nPlacaAtual := 0;
            end;   
            //----------------------------------------------------------------------------
            nPlanilha := -1;
            iQtd := 1;
            while iQtd <= iQuantidade do
            begin
               //-------------------------------------------------------------------------
               // Alimenta os datasets da classe de negócio
               //-------------------------------------------------------------------------
               Bem.cds.Data               := Fcds.Data;
               Bem.cdsBemxMoeda.Data      := FcdsBemxMoeda.Data;
               Bem.cdsBemxDep.Data        := FcdsBemxDep.Data;
               Bem.cdsPlanoPatroxBem.Data := FcdsPlanoPatroxBem.Data;
               Bem.cdsImagem.Data         := FcdsImagem.Data;
               Bem.idImovelHistorico      := idImovelHistorico; // Vando - SOL 154328-5901 / KTN 1373449
               //-------------------------------------------------------------------------
               nIdBem := Bem.ExecutaEntrada(trunc(nModulo), trunc(nEmpresaProp),
                                            trunc(nUsuario), nPlanilha, qGruposContabeis);

               //Marcos Lima - SIG 133619 - Ajuste no Anexo - Inicio
               if not Assigned(flistaIDBem) then
                 flistaIdBem := TStringList.Create;

               flistaIDBem.Add(FloatToStr(nIdBem));
               //Marcos Lima - SIG 133619 - Ajuste no Anexo - Fim

               SetidImovelHistorico(Bem.idImovelHistorico); // Vando - SOL 154328-5901 / KTN 1373449
               //-------------------------------------------------------------------------
               if nIdBem < 0 then
                  Raise Exception.Create(Bem.MessageInfo);
               //-------------------------------------------------------------------------
               FIdBem := Trunc(nIdBem);
               //-------------------------------------------------------------------------
               iQtd := iQtd + 1;
               //-------------------------------------------------------------------------
               if iQtd <= iQuantidade then
               begin
                  if nPlacaAtual <> 0 then
                  begin
                     Fcds.Edit;
                     Fcds.FieldByName('PLACA').AsFloat := GeraProxPlacaTomb(Fcds.FieldByName('IDPESSOA').AsFloat,
                                                                            Fcds.FieldByName('IDGRUPO').AsFloat,
                                                                            Fcds.FieldByName('IDCLASSEBEM').AsFloat,
                                                                            Fcds.FieldByName('PLACA').AsFloat);
                  end;
               end;
            end;
         end else
         //-------------------------------------------------------------------------------
         // Alteração Completa de Bem
         //-------------------------------------------------------------------------------
         if sTipoEntrada = 'AC' then
         begin
            //----------------------------------------------------------------------------
            // Alimenta os datasets da classe de negócio
            //----------------------------------------------------------------------------
            Bem.cds.Data               := Fcds.Data;
            Bem.cdsBemxMoeda.Data      := FcdsBemxMoeda.Data;
            Bem.cdsBemxDep.Data        := FcdsBemxDep.Data;
            Bem.cdsPlanoPatroxBem.Data := FcdsPlanoPatroxBem.Data;
            Bem.cdsImagem.Data         := FcdsImagem.Data;
            if nModulo <> 8 then
            begin

              // Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
              Bem.cdsImovelxBem.Data := Bem.ListaImovelxBem(Fcds.FieldByName('IDPESSOA').AsInteger,
                                                            Fcds.FieldByName('IDBEM').AsInteger);
              // Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
              Bem.cdsLancImovelxBem.Data := Bem.ListaLancImovelxBem(Fcds.FieldByName('IDPESSOA').AsInteger,
                                                                    Fcds.FieldByName('IDBEM').AsInteger);

              //Cássio - SOL Nº107352 KINTANA Nº 482395 - Início
              Bem.cdsPlanoPatroxVigenciaBem.Data := Bem.ListaPlanoPatroxVigenciaBem(Fcds.FieldByName('IDPESSOA').AsInteger,
                                                                          Fcds.FieldByName('IDBEM').AsInteger);
              //Cássio - SOL Nº107352 KINTANA Nº 482395 - Fim

              // Thiago Melo SOL 204458 Kintana 1981316
              Bem.cdsHistBemxDep.Data := Bem.ListaItensHistBemxDep(Fcds.FieldByName('IDPESSOA').AsInteger, Fcds.FieldByName('IDBEM').AsInteger);

              if not ExecutaAlteracaoEntradaCtrlTotal(nUsuario) then
                Raise Exception.Create(MessageInfo);
            end else
            begin
               if not ExecutaAlteracaoEntradaRestrita then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FIdBem := Fcds.FieldByName('IDBEM').AsInteger;
         end else
         //-------------------------------------------------------------------------------
         // Alteração Restrita de Bem com Controle Total
         //-------------------------------------------------------------------------------
         if sTipoEntrada = 'AR' then
         begin
            Fcds.First;
            if not ExecutaAlteracaoEntradaRestrita then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            FIdBem := Fcds.FieldByName('IDBEM').AsInteger;
         end else
         begin
            //----------------------------------------------------------------------------
            // Remove o Bem do Cadastro
            //----------------------------------------------------------------------------
            Bem.cds.Data := Fcds.Data;
            Bem.cdsBemxMoeda.Data := FcdsBemxMoeda.Data;
            Bem.cdsBemxDep.Data := FcdsBemxDep.Data;
            Bem.cdsPlanoPatroxBem.Data := FcdsPlanoPatroxBem.Data;
            Bem.cdsImagem.Data := FcdsImagem.Data;
            //----------------------------------------------------------------------------
            if not Bem.EstornaEntrada(Fcds.FieldByName('IDMODULO').AsInteger,
                                      Fcds.FieldByName('IDPESSOA').AsInteger,
                                      Trunc(nUsuario),
                                      Fcds.FieldByName('IDBEM').AsInteger,
                                      Fcds.FieldByName('DTAINCLUSAO').AsDateTime,
                                      Fcds.FieldByName('DTAINCLUSAO').AsDateTime, 0) then
               Raise Exception.Create(Bem.MessageInfo);
            //----------------------------------------------------------------------------
            FIdBem := Fcds.FieldByName('IDBEM').AsInteger;
         end;
         Result := True;
         // Helen - SOL: 127213 KTN: 672023
         if not bTransaction then
            Commit;
      except
         on E : Exception Do
         begin
            // Helen - SOL: 127213 KTN: 672023
            if not bTransaction then
               RollBack;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;
//========================================================================================
Function TCtrlDomBem.ExecutaAlteracaoEntradaCtrlTotal(nUsuario : Extended) : Boolean;
var
   nPlanilha : Extended;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaAlteracaoEntradaCtrlTotal(nUsuario,
                                                                      Fcds.Data,
                                                                      FcdsBemxMoeda.Data,
                                                                      FcdsBemxDep.Data,
                                                                      FcdsPlanoPatroxBem.Data,
                                                                      FcdsImagem.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         //-------------------------------------------------------------------------------
         // Remove os lançamentos de historico e contabilidade
         //-------------------------------------------------------------------------------
         if not Bem.EstornaEntrada(Fcds.FieldByName('IDMODULO').AsInteger,
                                   Fcds.FieldByName('IDPESSOA').AsInteger,
                                   Trunc(nUsuario),
                                   Fcds.FieldByName('IDBEM').AsInteger,
                                   Fcds.FieldByName('DTAINCLUSAO').AsDateTime,
                                   Fcds.FieldByName('DTAINCLUSAO').AsDateTime, 0) then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra os novos dados do bem
         //-------------------------------------------------------------------------------
         if Bem.ExecutaEntrada(Fcds.FieldByName('IDMODULO').AsInteger,
                               Fcds.FieldByName('IDPESSOA').AsInteger,
                               trunc(nUsuario), nPlanilha, qGruposContabeis) < 0 then
            Raise Exception.Create(Bem.MessageInfo);


            idImovelHistorico := Bem.idImovelHistorico; // Vando - SOL 154328-5901 / KTN 1373449
         //-------------------------------------------------------------------------------
         Result := True; 
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;
//========================================================================================
Function TCtrlDomBem.ExecutaAlteracaoEntradaRestrita : Boolean;
var
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaAlteracaoEntradaRestrita(Fcds.Data, FcdsImagem.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         //-------------------------------------------------------------------------------
         // Tratamento da Imagem
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM IMAGENS ' +
                 ' WHERE IDIMAGEM = ' + floattostr(FcdsImagem.FieldByName('IDIMAGEM').AsFloat);
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         if not FcdsImagem.FieldByName('IMAGEM').IsNull then
         begin
            CdsToDbObject(FcdsImagem,_dbImagem);
            if not _dbImagem.Insert then
               Raise Exception.Create(_dbImagem.MessageInfo);
            //----------------------------------------------------------------------------
            Fcds.Edit;
            Fcds.FieldbyName('IDIMAGEM').AsFloat := _dbImagem.IDIMAGEM.AsFloat;
         end else
         begin
            Fcds.Edit;
            Fcds.FieldbyName('IDIMAGEM').Clear;
         end;
         //-------------------------------------------------------------------------------
         // Gravação dos dados na tabela BEM
         //-------------------------------------------------------------------------------
         CdsToDbObject(Fcds,_dbBem);
         if not _dbBem.Update then
            Raise Exception.Create(_dbBem.MessageInfo);
         //-------------------------------------------------------------------------------
         if Fcds.FieldByName('IDMODULO').AsInteger = 8 then
            if not Bem.ExecutaAlteracaoBemManut then
               Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;
//========================================================================================
function TCtrlDomBem.GeraProxPlacaTomb(nEmpresa, nGrupo, nClasse, nPlacaAtual : Extended) : Extended;
var
   sMascaraEmpresa,
   sCodPlaca, sClasse, sGrupo,
   sProximoCodigo, sProxPlaca,
   sDigMascPlaca, sSql           : String;
   iAux                          : Integer;
   bEdPlaca, bOk                 : boolean;

begin
   try
      //----------------------------------------------------------------------------------
      // Recarga dos parametros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresa) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      bEdPlaca := ParamCAF.EDITACODBEM = 1;
      //----------------------------------------------------------------------------------
      case ParamCAF.SEQBEMEMP of
         0 : sCodPlaca := 'E'; {sequencial por Empresa}
         1 : sCodPlaca := 'G'; {sequencial por Grupo}
         2 : sCodPlaca := 'C'; {sequencial por Classe}
         3 : sCodPlaca := 'S'; {sequencial Puro}
      end;
      //----------------------------------------------------------------------------------
      sProxPlaca := '';
      bOk := False;
      while not bOk do
      begin
         if bEdPlaca then
         begin
            //----------------------------------------------------------------------------
            // Calcula o Numero da Próxima Placa de Patrimônio
            //----------------------------------------------------------------------------
            if ParamCAF.PROXIMAPLACA <= 0 then
            begin
               sProximoCodigo := '1';
            end else
            begin
               sProximoCodigo := FloatToStr(ParamCAF.PROXIMAPLACA);
            end;
            sDigMascPlaca := StringOfChar('0',ParamCAF.DIGMASCPLACA);
            //----------------------------------------------------------------------------
            sSql := ' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' + floattostr(strtofloat(sProximoCodigo) + 1) +
                    ' WHERE IDPESSOA = ' + floattostr(nEmpresa);
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            // Recarga dos parametros do sistema após a atualização
            //----------------------------------------------------------------------------
            if not ParamCAF.CarregaProp(nEmpresa) then
            begin
               MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
               Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Calculo por GRUPO
            //----------------------------------------------------------------------------
            if sCodPlaca = 'G' then
            begin
               _cds.Data := GetDataPacket(' SELECT CLASSE FROM GRUPO ' +
                                          ' WHERE IDGRUPO  = ' + floattostr(nGrupo));
               sGrupo := trim(_cds.FieldByName('CLASSE').AsString);
               //-------------------------------------------------------------------------
               sProxPlaca := sGrupo + Bem.ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo por CLASSE
            //----------------------------------------------------------------------------
            if sCodPlaca = 'C' then
            begin
               _cds.Data := GetDataPacket(' SELECT CODHIERARQ FROM CLASSEDEBEM '+
                                          ' WHERE IDCLASSEBEM  = ' + floattostr(nClasse));
               sClasse := trim(_cds.FieldByName('CODHIERARQ').AsString);
               //-------------------------------------------------------------------------
               sProxPlaca := sClasse + Bem.ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo por EMPRESA
            //----------------------------------------------------------------------------
            if sCodPlaca = 'E' then
            begin
               sMascaraEmpresa := '';
               for iAux := 1 to length(trim(floattostr(nEmpresa))) do
               begin
                  sMascaraEmpresa := sMascaraEmpresa + '9';
               end;
               //-------------------------------------------------------------------------
               sProxPlaca := Bem.ComplZeros(copy(floattostr(nPlacaAtual),1,length(sMascaraEmpresa))+
                                            sProximoCodigo,(Length(sMascaraEmpresa) + 9)) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo SEQUENCIAL
            //----------------------------------------------------------------------------
            if sCodPlaca = 'S' then
            begin
               sProxPlaca := sProximoCodigo + sDigMascPlaca;
            end;
         end else
         begin
            sDigMascPlaca := StringOfChar('0',ParamCAF.DIGMASCPLACA);
            //----------------------------------------------------------------------------
            if length(sDigMascPlaca) > 0 then
            begin
               sProxPlaca := copy(FloatToStr(nPlacaAtual),1,
                                  length(FloatToStr(nPlacaAtual))-length(sDigMascPlaca));
               sProxPlaca := FloatToStr(StrToFloat(sProxPlaca) + 1) + sDigMascPlaca;
            end else
            begin
               sProxPlaca := FloatToStr(nPlacaAtual + 1);
            end;
//Nº SOL : 148704   Nº KINTANA : 1050021   Felipe de Oliveira - Início
            nPlacaAtual := StrToFloat(sProxPlaca);
//Nº SOL : 148704   Nº KINTANA : 1050021   Felipe de Oliveira - Fim            
         end;
         //-------------------------------------------------------------------------------
         // Confere se a placa calculada já existe
         //-------------------------------------------------------------------------------
         bOk := Bem.PlacaUnica(nEmpresa, sProxPlaca);

      end;
      result := StrToFloat(sProxPlaca);
   except
      on E : Exception do
      begin
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlDomBem.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;



procedure TCtrlDomBem.SetcdsPlanoPatroxVigenciaBem(const Value: TClientDataSet);
begin
  FcdsPlanoPatroxVigenciaBem := Value;
end;

function TCtrlDomBem.ListaPlanoPatroxVigenciaImob(nIdImovel: Integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT DISTINCT PPV.DATAVIGENCIA, '+ #13 +
          '       PPV.IDPLANOPREV,       '+ #13 +
          '       PPV.IDPATRO,           '+ #13 +
          '       PPV.PERCENTRATEIO    '+ #13 +
          '  FROM PLANOPATROXVIGENCIAIMOB PPV, '+ #13 +
          '       (SELECT MAX(DATAVIGENCIA) AS DATAVIGENCIA, IDPLANOPREV, IDPATRO, IDIMOVEL '+ #13 +
          '          FROM PLANOPATROXVIGENCIAIMOB '+ #13 +
          '         WHERE IDIMOVEL = ' + IntToStr(nIdImovel) + #13 +
          '         GROUP BY IDPLANOPREV, IDPATRO, IDIMOVEL) HST '+ #13 +
          ' WHERE PPV.IDIMOVEL = ' + IntToStr(nIdImovel) + #13 +
          '   AND HST.IDIMOVEL = PPV.IDIMOVEL '+ #13 +
          '   AND PPV.DATAVIGENCIA = HST.DATAVIGENCIA ';
  Result := GetDataPacket(sSQL);
end;


procedure TCtrlDomBem.GravaPlanoPatroxVigenciaBem(nIdPlanoPatroxVigenciaBem,
  nIdPlanoPrev, nIdPatro, nIdBem, nIdPessoa: Integer; dDataVigencia: String;
  PercentRateio: Double);
var
  sSQL: string;
begin
  sSQL := 'INSERT INTO PLANOPATROXVIGENCIABEM (IDPLANOPATROXVIGENCIABEM, IDBEM, IDPESSOA, DATAVIGENCIA, IDPLANOPREV, IDPATRO, PERCENTRATEIO) ' + #13 +
          ' VALUES (' + IntToStr(nIdPlanoPatroxVigenciaBem) + ',' + #13
                      + IntToStr(nIdBem) + ',' + #13
                      + IntToStr(nIdPessoa) + ',' + #13
                      + QuotedStr(dDataVigencia) + ',' + #13
                      + IntToStr(nIdPlanoPrev) + ',' + #13
                      + IntToStr(nIdPatro)+ ',' + #13
                      + QuotedStr(FloatToStr(PercentRateio))+ ')';
  if not ExecSql(sSQL) then
    raise Exception.Create('Erro ao gravar vigência de Segregação do Bem.');
end;

function TCtrlDomBem.RetornaPlanoPatroXBemxImovel(
  iIdImovel: Integer): OLEVariant;
var
  sSQL: String;
begin
  sSQL:= 'SELECT PPB.IDBEM '  +#13+
         '  FROM PLANOPATROXBEM PPB, ' +#13+
         '       IMOVELXBEM IXB ' +#13+
         ' WHERE IXB.IDIMOVEL = ' + IntToStr(iIdImovel) + #13+
         '   AND PPB.IDBEM = IXB.IDBEM';
  Result := GetDataPacket(sSQL);
end;

function TCtrlDomBem.VerificaSegregacaoOrigemImovelxBem(iIdImovel: Integer;
  var cdsAux: TClientDataSet): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'SELECT PPI.IDPATRO,                        ' + #10#13 +
          '       PES.NOME AS NOMEPATRO,              ' + #10#13 +
          '       PPI.IDPLANOPREV,                    ' + #10#13 +
          '       PREV.NOME AS NOMEPLANO,             ' + #10#13 +
          '       PPI.PPIPERCENTRATEIO                ' + #10#13 +
          '  FROM PLANOPATROXIMOVEL PPI,              ' + #10#13 +
          '       PESSOA PES,                         ' + #10#13 +
          '       PLANPREVCONTABIL PREV               ' + #10#13 +
          '  WHERE PPI.IDPLANOPREV = PREV.IDPLANOPREV ' + #10#13 +
          '    AND PPI.IDPATRO = PES.IDPESSOA         ' + #10#13 +
          '   AND PPI.IDIMOVEL =  ' + IntToStr(iIdImovel);
  cdsAux.Data := GetDataPacket(sSQL);
  if not cdsAux.IsEmpty then
    Result := True
  else
    Result := False;

end;

procedure TCtrlDomBem.ExcluiPlanoPatroxVigenciaBem(iIdBem: Integer);
var
  sSQL : string;
begin
  sSQL := 'DELETE FROM PLANOPATROXVIGENCIABEM ' +#13+
          ' WHERE IDBEM  = ' + IntToStr(iIdBem);
  if not ExecSQL(sSQL) then
  begin
    raise Exception.Create('Erro ao excluir histórico de Segregação do Bem.');
  end;
end;

function TCtrlDomBem.ListaPlanoPatroxVigenciaBem(nIdBem: Integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL:= 'SELECT PPB.IDBEM, ' + #13 +
         '       PPB.DATAVIGENCIA, ' +#13+
         '       PPB.IDPLANOPREV, ' +#13+
         '       PPC.NOME AS NOMEPLANO, ' +#13+
         '       PPB.IDPATRO, ' +#13+
         '       PES.NOME AS NOMEPATRO, ' +#13+
         '       PPB.PERCENTRATEIO ' +#13+
         '  FROM PLANOPATROXVIGENCIABEM PPB, ' +#13+
         '       PESSOA PES,' +#13+
         '       PLANPREVCONTABIL PPC ' +#13+
         ' WHERE PPB.IDBEM = ' + IntToStr(nIdBem) +#13+
         '   AND PPB.IDPATRO  = PES.IDPESSOA ' +#13+
         '   AND PPB.IDPLANOPREV = PPC.IDPLANOPREV ' +#13+
         ' ORDER BY PPB.DATAVIGENCIA DESC ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlDomBem.VerificaBensImoveis(fIdBem: Extended): boolean;
var
  sSQL : string;
  _cdsImovelXBem : TClientDataSet;
begin
  _cdsImovelxBem := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT IDBEM FROM IMOVELXBEM WHERE IDBEM = ' + FloatToStr(fIdBem);
    _cdsImovelxBem.Data := GetDataPacket(sSQL);
    Result := ( not _cdsImovelxBem.IsEmpty); 
  finally
    FreeAndNil(_cdsImovelxBem);
  end;
end;
function TCtrlDomBem.ListaHistBemxDep(nIdPessoa, nIdBem, nMoeCodigo,
  nIdBemxDep: Extended): OleVariant;
begin
   Result := Bem.ListaHistBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep);

end;

procedure TCtrlDomBem.SetqGruposContabeis(const Value: TwwQuery);
begin
  FqGruposContabeis := value;
end;

//Marcos Lima - SIG 133619 - Ajuste no Anexo
procedure TCtrlDomBem.SetlistaIdBem(const Value: TStringList);
begin
  FlistaIdBem := Value;
end;

end.
