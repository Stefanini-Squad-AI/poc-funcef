{ --------------------------------------------------------------------------------------------------
Rotina    : ListTipoRDFaltantesFluxo
Data      : 07/03/2005
Autor     : Rodolpho da Silva
Pendencia : 18809
Descrição : Implementar relatório que informe os lançamentos em tipo de desembolso/recebimento que estão 
            sem relacionamento no período e prazo informado.
            Corrigir os campos da cláusula ORDER BY, pois estava gerando "Invalid Data Package"
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : ListTipoRDxCResponFinanc
Data      : 30/11/04
Autor     : Alex Pereira
Pendencia : 18035
Descrição : Eliminar do resultado da query os recebimentos / desembolsos que não
            estejam contidos em nenhuma linha do fluxo de caixa
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListPlanoPrev
Data      : 25/10/04
Autor     : Alex Pereira
Pendencia : 17584
Descrição : Não mostrar planos inativos na seleção de um planoprevcontabil
---------------------------------------------------------------------------------------------------}
//Atuializado por: André Tavares - 18/03/2004 pendência 15702 - listar somente os tiporecebdesmb ativos
//                 André Tavares - 07/05/2004 pendência 15702 - acerto

unit uCtrlListTercFinanc;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCtrlContaContabil;

type
   TCtrlListTercFinanc = Class(TCmControlObject)
   private
      CtrlContaContabil: TCtrlContaContabil;
   public
      constructor Create; override;
      destructor Destroy; override;
      function ListUnidNegocio(rIDPessoa, rUnidNegocio: Double; sUNeTipo,sUNeCodigo: String): OleVariant;
      function ListUnidNegxFluxo(rIDPessoa: Double; sFluxo: String): OleVariant;
      function ListUnidNegxFluxoComp(rIDPessoa: Double; sFluxo1,sFluxo2: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListTipoRD(rIDPessoa: Double; sRecPag, sAnaSint: String): OleVariant;
      function ListTipoRDFaltantesFluxo(rIDPessoa: Double; bVerificacao: Boolean): OleVariant;
      function ListTipoRDxCResponFinanc(rIDPessoa: Double; sCodCentroRespon,
                                        sEntradaSaida: String;
                                        // Alex 18035 30/11/04
                                        const bEliminaRecDesSemFluxo: Boolean = false): OleVariant;
      //---------------------------------------------------------------------------------
      function ListCentroRespon(rIDPessoa: Double; sAnaSint,sAtivo,
                                sCodCentroRespon: String): OleVariant;
      function ListCentroResponxUsuario(rIDPessoa, rIDUsuario: Double): OleVariant;

      { DAVID - 18/08/2003 (Pendência 14745)
        Recupera apenas os centros de responsabilidade ativos}
      function ListCentroResponxUsuarioAtivos(rIDPessoa, rIDUsuario: Double): OleVariant;

      function ListCentroResponxFluxo(rIDPessoa: Double; sFluxo: String): OleVariant;
      function ListCentroResponxFluxoComp(rIDPessoa: Double; sFluxo1,sFluxo2: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListCentroCusto(rIDPessoa: Double; sStatus,sAtivo: String): OleVariant;
      function ListCentroCustoxConta(rIDPessoa, rPlano: Double;sPlaConta: String): OleVariant;
      function ListCentroCustoxFluxo(rIDPessoa: Double; sFluxo: String): OleVariant;
      function ListCentroCustoxFluxoComp(rIDPessoa: Double; sFluxo1,sFluxo2: String): OleVariant;
      function ListSubConta(rIDPessoa, rPlano: Double;sPlaConta: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListTipoDoc(sRecPag: String): OleVariant;
      function ListTipDocXCompFluxoDisp: OleVariant;
      function ListTipDocFaltantesFluxo(rIDPessoa: Double): OleVariant;
      //---------------------------------------------------------------------------------
      function ListAlteradores(rIDPessoa: Double; sRecPag,sAcresDecres,sConverte: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListParamCAP(rIDPessoa: Double; sRecPag: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListParamContab(rIDPessoa: Double): OleVariant;
      //---------------------------------------------------------------------------------
      function ListPortadorConta(rIDPessoa, rCodPortador: Double): OleVariant;
      //---------------------------------------------------------------------------------
      function ListParamGlobal(rIDPessoa: Double): OleVariant;
      //---------------------------------------------------------------------------------
      function ListPrograma: OleVariant;
      //---------------------------------------------------------------------------------
      function ListPatrocinador: OleVariant;
      //---------------------------------------------------------------------------------
      function ListPlanoPrev: OleVariant;
      //---------------------------------------------------------------------------------
      function ListMoeda(rMoeCodigo: Double; bSoMoedaAtiva: Boolean): OleVariant;
      //---------------------------------------------------------------------------------
      function ListModulo(rIDModulo: Double): OleVariant;
      //---------------------------------------------------------------------------------
      function ListExercicio(rIDPessoa: Double): OleVariant;
      //---------------------------------------------------------------------------------      
      function ListPeriodo(rIDPessoa, rExercicio: Double): OleVariant;

      // Marchetti
      function ListTipoAgre(sRecPag: String): OleVariant;
      // Fim Marchetti

   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;


implementation

{ TCtrlListTercFinanc }

constructor TCtrlListTercFinanc.Create;
begin
   inherited;
   CtrlContaContabil:=TCtrlContaContabil.Create;   
end;

destructor TCtrlListTercFinanc.Destroy;
begin
   CtrlContaContabil.Free;
   inherited;
end;

procedure TCtrlListTercFinanc.AfterInitialize;
begin
   inherited;
   CtrlContaContabil.InitializeAs(Self);
end;

procedure TCtrlListTercFinanc.DoChangeDataBase;
begin
   inherited;
end;

//==============================================================================
// Unidade de Negócio
//==============================================================================

{TCtrlListTercFinanc.ListUnidNegocios(rIDPessoa,rUnidNegocio: Double; sUNeTipo: String): OleVariant

 Descrição:
 Retorna as Unidades de Negócio (Atividades)

 Parâmetros:
 IDPessoa     : Identificador do Pessoa (Empresa). Se <= 0 retorna todas as Empresas
 rUnidNegocio : Identificador da Unidade de Negócio. Se<=0 retorna todas as Unidades
 sUneTipo     : Tipo de Unidade de negócio. Se vazio retorna todos os tipos
 }
function TCtrlListTercFinanc.ListUnidNegocio(rIDPessoa,
  rUnidNegocio: Double; sUNeTipo,sUNeCodigo: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT UNIDNEGOC, NOME, UNECODIGO, UNETIPO, IDPESSOA '+
         'FROM UNIDNEGOCIO ';

   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (rUnidNegocio<>0) then
    if (sFiltro='') then
       sFiltro:='WHERE (UNIDNEGOC = '+FloatToStr(rUnidNegocio)+') '
    else
       sFiltro:=sFiltro+'AND (UNIDNEGOC = '+FloatToStr(rUnidNegocio)+') ';

   if Trim(sUNeTipo)<>'' then
    if (sFiltro='') then
       sFiltro:='WHERE (UNETIPO = '''+Trim(sUNeTipo)+''') '
    else
       sFiltro:=sFiltro+'AND (UNETIPO = '''+Trim(sUNeTipo)+''') ';

   if Trim(sUNeCodigo)<>'' then
    if (sFiltro='') then
       sFiltro:='WHERE (UNECODIGO = '''+Trim(sUNeCodigo)+''') '
    else
       sFiltro:=sFiltro+'AND (UNECODIGO = '''+Trim(sUNeCodigo)+''') ';

   sSql:=sSql+sFiltro+' ORDER BY NOME ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListUnidNegxFluxo(rIDPessoa: Double;
  sFluxo: String): OleVariant;
begin
   Result:=GetDataPacket('SELECT Distinct '+
                         '   U.UnidNegoc, '+
                         '   U.Nome '+
                         'FROM '+sFluxo+' F,'+
                         '   UnidNegocio U '+
                         'WHERE (F.UnidNegoc=U.UnidNegoc) AND '+
                         '      (U.IDPessoa = '+FloatToStr(rIDPessoa)+') '+
                         'ORDER BY U.Nome');
end;

function TCtrlListTercFinanc.ListUnidNegxFluxoComp(rIDPessoa: Double;
  sFluxo1, sFluxo2: String): OleVariant;
begin
   Result:=GetDataPacket(' SELECT Distinct '+
                         '    U.UnidNegoc, '+
                         '    U.Nome '+
                         ' FROM '+sFluxo1+' F,'+
                         '    UnidNegocio U '+
                         ' WHERE (F.UnidNegoc=U.UnidNegoc) AND '+
                         '       (U.IDPessoa = '+FloatToStr(rIDPessoa)+') '+
                         'UNION '+
                         ' SELECT Distinct '+
                         '    U.UnidNegoc, '+
                         '    U.Nome '+
                         ' FROM '+sFluxo2+' F,'+
                         '    UnidNegocio U '+
                         ' WHERE (F.UnidNegoc=U.UnidNegoc) AND '+
                         '       (U.IDPessoa = '+FloatToStr(rIDPessoa)+') '+
                         'ORDER BY Nome');
end;

//==============================================================================
// Tipos de Recebimento/Desembolso
//==============================================================================

{ListTiposRD(rIDPessoa: Double; sRecPag, sAnaSint: String): OleVariant

 Descrição:
 Retorna uma Lista dos Tipos de Recebimento/Desembolso

 Parâmetros:
 IDPessoa     : Identificador do Pessoa (Empresa). Se <= 0 retorna todas as Empresas
 sRecPag      : Tipo de Rec/Des (R ou P). Se vazio retorna todos os tipos
 sAnaSint     : Característica do Rec/Des (A ou S). Se vazio retorna todos}

function TCtrlListTercFinanc.ListTipoRD(rIDPessoa: Double; sRecPag, sAnaSint: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT CODTIPRECDES, DESCRICAO, RECPAG '+
         'FROM TIPORECEBDESEMB ';

   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (sRecPag<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE (RECPAG = '''+sRecPag+''') '
      else
         sFiltro:=sFiltro+'AND (RECPAG = '''+sRecPag+''') ';

   if (sAnaSint<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE (ANASINT = '''+sAnaSint+''') '
      else
         sFiltro:=sFiltro+'AND (ANASINT = '''+sAnaSint+''') ';
         
   // início - André Tavares - 18/03/2004 pendência 15702
   if sFiltro <> '' then
     sFiltro := sFiltro + ' AND ATIVO = ''S'' ';
   // fim - André Tavares - 18/03/2004 pendência 15702

   sSql:=sSql+sFiltro+' ORDER BY DESCRICAO ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListTipoRDFaltantesFluxo(rIDPessoa: Double; bVerificacao: Boolean): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT ';
         if bVerificacao then
            sSql:=sSql+'   TRD.CODTIPRECDES AS CODIGO, '
         else
            sSql:=sSql+'   TRD.CODTIPRECDES, ';

   sSql:=sSql+'   TRD.DESCRICAO, '+
         '   TRD.RECPAG, '+
         '   TRD.ANASINT, '+
         '   ''N'' AS SELECIONADO '+
         'FROM '+
         '   TIPORECEBDESEMB TRD ';
   sFiltro:='WHERE '+
         '   NOT EXISTS(SELECT '+
         '                 C.CODLINHAFLUXO '+
         '              FROM '+
         '                 CompFluxo C '+
         '              WHERE '+
         '                ((RTrim(C.CODTIPRECDES)=SubStr(RTrim(TRD.CODTIPRECDES),1, '+
         '                                                     Length(RTrim(C.CODTIPRECDES)))) OR '+
         '                 (RTrim(TRD.CODTIPRECDES)=SubStr(RTrim(C.CODTIPRECDES),1, '+
         '                                              Length(RTrim(TRD.CODTIPRECDES))))) AND '+
         '                 (C.RECPAG = TRD.RECPAG) AND (C.IDPESSOA = '+FloatToStr(rIDPessoa)+')) ';

   if (rIDPessoa<>0) then
      sFiltro:=sFiltro+'   AND (TRD.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   //  Rodolpho da Silva - P: 18809- 07/03/2005   
   //sSql:=sSql+sFiltro+' ORDER BY RECPAG,CODTIPRECDES ';
   sSql:=sSql+sFiltro+' ORDER BY RECPAG,1 ';




   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListTipoRDxCResponFinanc(rIDPessoa: Double;
                                       sCodCentroRespon, sEntradaSaida: String;
                                       // Alex 18035 30/11/04
                                       const bEliminaRecDesSemFluxo: Boolean): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   TRD.CODTIPRECDES, '+
         '   TRD.RECPAG, '+
         '   TRD.DESCRICAO, '+
         '   RTRIM(TRD.CODTIPRECDES)||''-''||TRD.RECPAG AS CODTIPRECDESAUX '+
         'FROM '+
         '   TIPORECEBDESEMB TRD '+
         'WHERE '+
         // início - André Tavares - 07/05/2004 pendência 15702
         '   (TRD.ATIVO = ''S'') AND '+
         // fim    - André Tavares - 07/05/2004 pendência 15702
         '   (TRD.ANASINT = ''A'') AND '+
         '   (TRD.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   ((TRD.CODTIPRECDES IN (SELECT CODTIPRECDES '+
         '                          FROM TRDXCRESPON '+
         '                          WHERE (CODCENTRORESPON = '''+Trim(sCodCentroRespon)+''') AND '+
         '                                (IDPESSOA='+FloatToStr(rIDPessoa)+') AND '+
         '                                (RECPAG=TRD.RECPAG)))     OR '+
         '    NOT EXISTS(SELECT * '+
         '               FROM TRDXCRESPON '+
         '               WHERE (CODCENTRORESPON = '''+Trim(sCodCentroRespon)+''') AND '+
         '                     (IDPESSOA='+FloatToStr(rIDPessoa)+'))) ';

         // Alex 18035 30/11/04
         if bEliminaRecDesSemFluxo then begin
           sSql := sSql + '  AND EXISTS(SELECT C.CODLINHAFLUXO '+
                          '             FROM COMPFLUXO C '+
                          '             WHERE '+
                          '                (C.CODTIPRECDES=TRD.CODTIPRECDES) AND'+
                          '                (C.RECPAG = TRD.RECPAG) AND (C.IDPESSOA = '+FloatToStr(rIDPessoa)+')) ';
         end;

         sSql := sSql +  'ORDER BY TRD.RECPAG ';

   if (sEntradaSaida='E') or (sEntradaSaida='R') then
      sSql:=sSql+' DESC, TRD.DESCRICAO'
   else
      sSql:=sSql+' ,TRD.DESCRICAO';

   Result:=GetDataPacket(sSql);
end;


//==============================================================================
// Centro de Responsabilidade
//==============================================================================

{ListCentrosRespon(rIDPessoa: Double; sAnaSint,sAtivo: String): OleVariant

 Descrição:
 Retorna uma Lista dos Centros de Responsabilidade

 Parâmetros:
 IDPessoa     : Identificador do Pessoa (Empresa). Se <= 0 retorna todas as Empresas
 sAnaSint     : Característica do Centro de Responsabilidade (A ou S). Se vazio retorna todos
 sAtivo       : Status do Centro de Responsabilidade (S ou N). Se vazio retorna todos os Status}

function TCtrlListTercFinanc.ListCentroRespon(rIDPessoa: Double; sAnaSint,
                                             sAtivo,sCodCentroRespon: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT CODCENTRORESPON, NOME '+
         'FROM CENTRESPON ';

   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (sAnaSint<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE (ANALITICOSINTET = '''+sAnaSint+''') '
      else
         sFiltro:=sFiltro+'AND (ANALITICOSINTET = '''+sAnaSint+''') ';

   if (sAtivo<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE ((ATIVO = '''+sAtivo+''') OR (ATIVO IS NULL))'
      else
         sFiltro:=sFiltro+'AND ((ATIVO = '''+sAtivo+''') OR (ATIVO IS NULL))';

   if (sCodCentroRespon<>'') then
      if (sFiltro='') then
          sFiltro:='WHERE (CODCENTRORESPON = '''+sCodCentroRespon+''') '
      else
          sFiltro:=sFiltro+'AND (CODCENTRORESPON = '''+sCodCentroRespon+''') ';

   sSql:=sSql+sFiltro+' ORDER BY NOME ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListCentroResponxUsuario(rIDPessoa,
  rIDUsuario: Double): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT DISTINCT CR.CODCENTRORESPON, CR.NOME '+
         'FROM CENTRESPON CR,PESSOAXCRESP PCR '+
         'WHERE '+
         '   (CR.IDPESSOA='+FloatToStr(rIDPessoa)+') AND '+
         '   (CR.CODCENTRORESPON <> ''9999999999'') AND '+
         '   (CR.ANALITICOSINTET = ''A'') AND '+
         '   (((PCR.IDPESSOA=CR.IDPESSOA) AND '+
         '     (PCR.CODCENTRORESPON=CR.CODCENTRORESPON) AND '+
         '     (PCR.IDPESSOAACESSO = '+FloatToStr(rIDUsuario)+')) OR '+
         '    (NOT EXISTS(SELECT * FROM PESSOAXCRESP PCR2 '+
         '                WHERE (PCR2.IDPESSOAACESSO = '+FloatToStr(rIDUsuario)+') AND '+
         '                      (PCR2.IDPESSOA = '+FloatToStr(rIDPessoa)+')))) '+
         'ORDER BY NOME';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListCentroResponxFluxo(rIDPessoa: Double;
  sFluxo: String): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT Distinct '+
         '   C.CodCentroRespon, '+
         '   C.Nome, '+
         '   C.AnaliticoSintet '+
         'FROM '+sFluxo+' F, '+
         '   CentRespon C '+
         'WHERE (F.CodCentroRespon=C.CodCentroRespon) AND '+
         '      (F.CodCentroRespon<>''9999999999'') AND '+
         '      (F.IDPessoa = '+FloatToStr(rIDPessoa)+') AND '+
         '      (F.IDPessoa = C.IDPessoa) '+
         'ORDER BY C.Nome';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListCentroResponxFluxoComp(rIDPessoa: Double;
  sFluxo1, sFluxo2: String): OleVariant;
var
   sSql    : String;
begin
   sSql:=' SELECT Distinct '+
         '    C.CodCentroRespon, '+
         '    C.Nome, '+
         '    C.AnaliticoSintet '+
         ' FROM '+sFluxo1+' F, '+
         '    CentRespon C '+
         ' WHERE (F.CodCentroRespon=C.CodCentroRespon) AND '+
         '       (F.CodCentroRespon<>''9999999999'') AND '+
         '       (F.IDPessoa = '+FloatToStr(rIDPessoa)+') AND '+
         '       (F.IDPessoa = C.IDPessoa) '+
         'UNION '+
         ' SELECT Distinct '+
         '    C.CodCentroRespon, '+
         '    C.Nome, '+
         '    C.AnaliticoSintet '+
         ' FROM '+sFluxo2+' F, '+
         '    CentRespon C '+
         ' WHERE (F.CodCentroRespon=C.CodCentroRespon) AND '+
         '       (F.CodCentroRespon<>''9999999999'') AND '+
         '       (F.IDPessoa = '+FloatToStr(rIDPessoa)+') AND '+
         '       (F.IDPessoa = C.IDPessoa) '+
         'ORDER BY Nome';
   Result:=GetDataPacket(sSql);
end;

//==============================================================================
// Centro de Custo
//==============================================================================

{ListCentroCusto(rIDPessoa: Double; sStatus,sAtivo: String): OleVariant

 Descrição:
 Retorna uma Lista dos Centros de Responsabilidade

 Parâmetros:
 IDPessoa     : Identificador do Pessoa (Empresa). Se <= 0 retorna todas as Empresas
 sStatus      : Status do Centro de Custo. Se vazio retorna todos os Status
 sAtivo       : Status do Centro de Custo (S ou N). Se vazio retorna todos os Status}

function TCtrlListTercFinanc.ListCentroCusto(rIDPessoa: Double; sStatus,sAtivo: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT CODCENTROCUSTO, NOME '+
         'FROM CENTCUST ';

   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='WHERE (IDEMPRESA = '+FloatToStr(rIDPessoa)+') ';

   if (sStatus<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE (STATUSGRUPOCDC = '''+sStatus+''') '
      else
         sFiltro:=sFiltro+'AND (STATUSGRUPOCDC = '''+sStatus+''') ';

   if (sAtivo<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE ((ATIVO = '''+sAtivo+''') OR (ATIVO IS NULL))'
      else
         sFiltro:=sFiltro+'AND ((ATIVO = '''+sAtivo+''') OR (ATIVO IS NULL))';

   sSql:=sSql+sFiltro+' ORDER BY NOME ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListCentroCustoxConta(rIDPessoa, rPlano: Double;
  sPlaConta: String): OleVariant;
var
   sSql    : String;
begin
   {ainda não está usando a tabela aranha}
   sSql:=' SELECT '+
         '    C.CODCENTROCUSTO, '+
         '    C.NOME, '+
         '    C.STATUSGRUPOCDC '+
         ' FROM '+
         '    CENTCUST C '+
         ' WHERE '+
         '    (C.IDEMPRESA ='+FloatToStr(rIDPessoa)+') AND '+
         '    (C.STATUSGRUPOCDC=''A'') AND '+
         '    (C.ATIVO=''S'') AND '+
         '    (NOT EXISTS (SELECT 1 '+
         '                 FROM CONTASxCC U '+
         '                 WHERE (U.PLACONTA = '''+Trim(sPlaConta)+ ''') AND '+
         '                       (U.PLANO = '+ FloatToStr(rPlano)+') AND '+
         '                       (U.IDEMPRESA = '+FloatToStr(rIDPessoa)+'))) '+
         'UNION '+
         ' SELECT '+
         '    C.CODCENTROCUSTO, '+
         '    C.NOME, '+
         '    C.STATUSGRUPOCDC '+
         ' FROM '+
         '    CENTCUST C, '+
         '    CONTASxCC CC '+
         ' WHERE '+
         '    (CC.PLANO = '+ FloatToStr(rPlano)+') AND '+
         '    (CC.PLACONTA = '''+Trim(sPlaConta)+ ''') AND '+
         '    (C.IDEMPRESA ='+FloatToStr(rIDPessoa)+') AND '+
         '    (C.STATUSGRUPOCDC=''A'') AND '+
         '    (C.ATIVO=''S'') AND '+
         '    (C.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND '+
         '    (C.IDEMPRESA = CC.IDEMPRESA) '+
         'ORDER BY CODCENTROCUSTO';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListCentroCustoxFluxo(rIDPessoa: Double;
  sFluxo: String): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT Distinct '+
         '   C.CodCentroCusto, '+
         '   C.Nome '+
         'FROM '+sFluxo+' F, '+
         '   CENTCUST C '+
         'WHERE (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '      (C.IDEMPRESA = F.IDPESSOA) AND '+
         '      (F.CODCENTROCUSTO=C.CODCENTROCUSTO) '+
         'ORDER BY C.Nome';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListCentroCustoxFluxoComp(rIDPessoa: Double;
  sFluxo1, sFluxo2: String): OleVariant;
var
   sSql    : String;
begin
   sSql:=' SELECT Distinct '+
         '    C.CodCentroCusto, '+
         '    C.Nome '+
         ' FROM '+sFluxo1+' F, '+
         '    CENTCUST C '+
         ' WHERE (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '       (C.IDEMPRESA = F.IDPESSOA) AND '+
         '       (F.CODCENTROCUSTO=C.CODCENTROCUSTO) '+
         'UNION '+
         ' SELECT Distinct '+
         '    C.CodCentroCusto, '+
         '    C.Nome '+
         ' FROM '+sFluxo2+' F, '+
         '    CENTCUST C '+
         ' WHERE (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '       (C.IDEMPRESA = F.IDPESSOA) AND '+
         '       (F.CODCENTROCUSTO=C.CODCENTROCUSTO) '+
         'ORDER BY Nome';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListSubConta(rIDPessoa, rPlano: Double; sPlaConta: String): OleVariant;
//var
//   sSql    : String;
begin
   Result:=CtrlContaContabil.ListContasxSC(rPlano,rIDPessoa,0,sPlaConta,toNome);

   {sSql:='SELECT '+
         '   S.NOMESUBCONTA, '+
         '   S.CODSUBCONTA  '+
         'FROM CONTASXSUBC C, SUBCONTA S '+
         'WHERE (RTRIM(C.PLACONTA) = '''+Trim(sPlaConta)+''') AND '+
         '      (C.PLANO = '+FloatToStr(rPlano)+') AND '+
         '      (S.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '      (C.CODSUBCONTA = S.CODSUBCONTA) AND '+
         '      (C.IDPESSOA = S.IDPESSOA) '+
         'ORDER BY S.NOMESUBCONTA';
   Result:=GetDataPacket(sSql);}
end;


//==============================================================================
// Tipos de Documento
//==============================================================================

{ListTipDocXCompFluxoDisp: OleVariant

 Descrição:
 Retorna uma Lista dos Tipos ainda não associados ao Fluxo de Caixa}


function TCtrlListTercFinanc.ListTipDocXCompFluxoDisp: OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT '+
         '   TD.CODTIPDOC, '+
         '   TD.DESCRICAO, '+
         '   TD.RECPAG '+
         'FROM '+
         '   TIPODOCRECPAG TD '+
         'WHERE '+
         '   NOT Exists(SELECT CF.CODTIPDOC '+
         '              FROM COMPFLUXO CF '+
         '              WHERE (CF.CODTIPDOC=TD.CODTIPDOC) AND '+
         '                    (TD.CODTIPDOC IS NOT NULL)) ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListTipDocFaltantesFluxo(rIDPessoa: Double): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT '+#13+
         '   TO_CHAR(TD.CODTIPDOC) AS CODIGO, '+#13+
         '   TD.DESCRICAO, '+#13+
         '   TD.RECPAG, '+#13+
         '   ''N'' AS SELECIONADO '+#13+
         'FROM '+#13+
         '   TIPODOCRECPAG TD '+#13+
         'WHERE '+#13+
         '   NOT EXISTS(SELECT '+#13+
         '                 C.CODLINHAFLUXO '+#13+
         '              FROM '+#13+
         '                 CompFluxo C '+#13+
         '              WHERE '+#13+
         '                 (C.CODTIPDOC=TD.CODTIPDOC) AND (C.RECPAG=TD.RECPAG) AND '+#13+
         '                 (C.IDPESSOA = '+FloatToStr(rIDPessoa)+')) '+#13+
         'ORDER BY TD.RECPAG,TD.CODTIPDOC ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListTipoDoc(sRecPag: String): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT '+
         '   TD.CODTIPDOC, '+
         '   TD.DESCRICAO, '+
         '   TD.RECPAG '+
         'FROM '+
         '   TIPODOCRECPAG TD ';

   if (sRecPag<>'') then sSql:=sSql+'WHERE (RECPAG='''+sRecPag+''') ';
   sSql:=sSql+'ORDER BY DESCRICAO';
   Result:=GetDataPacket(sSql);
end;

//==============================================================================
// Tipos de Documento
//==============================================================================

{ListAlteradores(rIDPessoa: Double; sRecPag,sACresDecres: String): OleVariant

 Descrição:
 }

function TCtrlListTercFinanc.ListAlteradores(rIDPessoa: Double; sRecPag,sAcresDecres,sConverte: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT '+
         '   CODALTERADOR, '+
         '   DESCRICAO, '+
         '   RECPAG, '+
         '   CONVERTE '+
         'FROM TIPOALTERADOR ';

   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='WHERE  (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (sRecPag<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE  (RECPAG = '''+sRecPag+''') '
      else
         sFiltro:=sFiltro+' AND (RECPAG = '''+sRecPag+''') ';

   if (sAcresDecres<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE  (ACRESDECRES = '''+sAcresDecres+''') '
      else
         sFiltro:=sFiltro+' AND (ACRESDECRES = '''+sAcresDecres+''') ';

   if (sConverte<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE  (CONVERTE = '''+sConverte+''') '
      else
         sFiltro:=sFiltro+' AND (CONVERTE = '''+sConverte+''') ';

   sSql:=sSql+sFiltro+'ORDER BY DESCRICAO ';

   Result:=GetDataPacket(sSql);
end;

//==============================================================================
// ParamCAP
//==============================================================================

function TCtrlListTercFinanc.ListParamCAP(rIDPessoa: Double;
  sRecPag: String): OleVariant;
var
   sSql : String;
   sFiltro : String;
begin
   sSql:='SELECT '+
         '   MASCARADESEMB, RECPAG '+
         'FROM PARAMCAP ';
   sFiltro:='WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (sRecPag<>'') then
      sFiltro:=sFiltro+'      (RECPAG = '''+sRecPag+''') ';

   sSql:=sSql+sFiltro;

   Result:=GetDataPacket(sSql);
end;

//==============================================================================
// PortadorConta
//==============================================================================

function TCtrlListTercFinanc.ListPortadorConta(rIDPessoa, rCodPortador: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   PC.*, '+
         '   BC.NUMBANCO '+
         'FROM '+
         '   PORTADORCONTA PC, '+
         '   BANCO BC '+
         'WHERE '+
         '   (PC.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (PC.IDBANCO = BC.IDPESSOA(+)) ';

   if (rCodPortador<>0) then
      sSql:=sSql+'   AND (PC.CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

   sSql:=sSql+'ORDER BY PC.DESCRICAO';
   Result:=GetDataPacket(sSql);
end;

//==============================================================================
// ParamGlobal
//==============================================================================

function TCtrlListTercFinanc.ListParamGlobal(rIDPessoa: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT USACRESPON,USAABC,UNIDNEGOC,CODCENTRORESPON,MOEDACORRENTE '+
         'FROM PARAMGLOBAL '+
         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';
   Result:=GetDataPacket(sSql);
end;

//==============================================================================
// ParamContab
//==============================================================================

function TCtrlListTercFinanc.ListParamContab(rIDPessoa: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT PACESTORNA '+
         'FROM PARAMCONTAB '+
         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';
   Result:=GetDataPacket(sSql);
end;

//==============================================================================
// Previdenciário
//==============================================================================

function TCtrlListTercFinanc.ListPatrocinador: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT PT.IDPESSOA, P.RAZAOSOCIAL '+
         'FROM PESSOA P, PATRO PT '+
         'WHERE (P.IDPESSOA = PT.IDPESSOA) '+
         'ORDER BY P.RAZAOSOCIAL ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListPlanoPrev: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT IDPLANOPREV, NOME '+
         'FROM PLANPREVCONTABIL '+
         'WHERE NVL(ATIVO, ''S'') = ''S'' '+
         'ORDER BY NOME ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListPrograma: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT IDPROGRAMA, DESCPROGRAMA '+
         'FROM PROGRAMA '+
         'ORDER BY DESCPROGRAMA ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListMoeda(rMoeCodigo: Double; bSoMoedaAtiva: Boolean): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT * '+
         'FROM MOEDA ';

   sFiltro:='';
   if (rMoeCodigo<>0) then
       sFiltro:='WHERE (MOECODIGO = '+FloatToStr(rMoeCodigo)+') ';

   if bSoMoedaAtiva then
      if (sFiltro='') then
         sFiltro:='WHERE (MOEINATIVO <> ''I'') '
      else
         sFiltro:=sFiltro+' AND (MOEINATIVO <> ''I'') ';

   sSql:=sSql+sFiltro+' ORDER BY MOEDESC ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListModulo(rIDModulo: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * FROM MODULO WHERE (IDMODULO = '+FloatToStr(rIDModulo)+') ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListExercicio(rIDPessoa: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT DISTINCT EXERCICIO '+
                         'FROM PERIODOORCAMEN '+
                         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') '+
                         'ORDER BY EXERCICIO');
end;

function TCtrlListTercFinanc.ListPeriodo(rIDPessoa, rExercicio: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT PERIODO, NOMEPERIODO '+
                         'FROM PERIODOORCAMEN '+
                         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                         '      (EXERCICIO = '+FloatToStr(rExercicio)+') '+
                         'ORDER BY PERIODO');
end;

{ DAVID - 18/08/2003 (Pendência 14745)
  Recupera apenas os centros de responsabilidade ativos}
function TCtrlListTercFinanc.ListCentroResponxUsuarioAtivos(rIDPessoa, rIDUsuario: Double): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT DISTINCT CR.CODCENTRORESPON, CR.NOME '+
         'FROM CENTRESPON CR,PESSOAXCRESP PCR '+
         'WHERE '+
         '   (CR.IDPESSOA='+FloatToStr(rIDPessoa)+') AND '+
         '   (CR.CODCENTRORESPON <> ''9999999999'') AND '+
         '   (CR.ANALITICOSINTET = ''A'') AND '+
         '   (((PCR.IDPESSOA=CR.IDPESSOA) AND '+
         '     (PCR.CODCENTRORESPON=CR.CODCENTRORESPON) AND '+
         '     (PCR.IDPESSOAACESSO = '+FloatToStr(rIDUsuario)+')) OR '+
         '    (NOT EXISTS(SELECT * FROM PESSOAXCRESP PCR2 '+
         '                WHERE (PCR2.IDPESSOAACESSO = '+FloatToStr(rIDUsuario)+') AND '+
         '                      (PCR2.IDPESSOA = '+FloatToStr(rIDPessoa)+')))) '+
         ' AND ( CR.ATIVO = ''S'' ) ' +
         'ORDER BY NOME';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListTipoAgre(sRecPag: String): OleVariant;
begin
   Result := GetDataPacket('SELECT CODTIPOCUSTAGREG, DESCCUSTAGREG FROM TIPOAGRE WHERE RECPAG = ' + QuotedStr(sRecPag));
end;

end.
