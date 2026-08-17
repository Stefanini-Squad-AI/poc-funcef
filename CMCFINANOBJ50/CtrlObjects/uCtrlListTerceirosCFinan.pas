unit uCtrlListTerceirosCFinan;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient;

type
   TCtrlListTerceiros = Class(TCmControlObject)
   private
   public
      constructor Create; override;
      destructor Destroy; override;
      function ListUnidNegocio(rIDPessoa, rUnidNegocio: Real; sUNeTipo,sUNeCodigo: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListTipoRD(rIDPessoa: Real; sRecPag, sAnaSint: String): OleVariant;
      function ListTipoRDFaltantesFluxo(rIDPessoa: Real): OleVariant;
      function ListTipoRDxCResponFinanc(rIDPessoa: Real; sCodCentroRespon,
                                        sEntradaSaida: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListCentroRespon(rIDPessoa: Real; sAnaSint,sAtivo,
                                sCodCentroRespon: String): OleVariant;
      function ListCentroResponxUsuario(rIDPessoa, rIDUsuario: Real): OleVariant;
      //---------------------------------------------------------------------------------
      function ListCentroCusto(rIDPessoa: Real; sStatus,sAtivo: String): OleVariant;
      function ListCentroCustoxConta(rIDPessoa, rPlano: Real;sPlaConta: String): OleVariant;
      function ListSubConta(rIDPessoa, rPlano: Real;sPlaConta: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListTipoDoc(sRecPag: String): OleVariant;
      function ListTipDocXCompFluxoDisp: OleVariant;
      //---------------------------------------------------------------------------------
      function ListAlteradores(rIDPessoa: Real; sRecPag,sAcresDecres,sConverte: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListParamCAP(rIDPessoa: Real; sRecPag: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListParamContab(rIDPessoa: Real): OleVariant;
      //---------------------------------------------------------------------------------
      function ListPortadorConta(rIDPessoa: Real): OleVariant;
      //---------------------------------------------------------------------------------
      function ListParamGlobal(rIDPessoa: Real): OleVariant;
      //---------------------------------------------------------------------------------
      function ListPrograma: OleVariant;
      //---------------------------------------------------------------------------------
      function ListPatrocinador: OleVariant;
      //---------------------------------------------------------------------------------
      function ListPlanoPrev: OleVariant;
      //---------------------------------------------------------------------------------
      function ListMoeda(rMoeCodigo: Real; bSoMoedaAtiva: Boolean): OleVariant;
      //---------------------------------------------------------------------------------
      function ListModulo(rIDModulo: Real): OleVariant;
      //---------------------------------------------------------------------------------
      function ListExercicio(rIDPessoa: Real): OleVariant;
      //---------------------------------------------------------------------------------      
      function ListPeriodo(rIDPessoa, rExercicio: Real): OleVariant;
   protected
      procedure DoChangeDataBase; override;

   end;


implementation

{ TCtrlListTerceiros }

constructor TCtrlListTerceiros.Create;
begin
   inherited;
end;

destructor TCtrlListTerceiros.Destroy;
begin
   inherited;
end;

procedure TCtrlListTerceiros.DoChangeDataBase;
begin
   inherited;
end;

//==============================================================================
// Unidade de Negócio
//==============================================================================

{TCtrlListTerceiros.ListUnidNegocios(rIDPessoa,rUnidNegocio: Real; sUNeTipo: String): OleVariant

 Descrição:
 Retorna as Unidades de Negócio (Atividades)

 Parâmetros:
 IDPessoa     : Identificador do Pessoa (Empresa). Se <= 0 retorna todas as Empresas
 rUnidNegocio : Identificador da Unidade de Negócio. Se<=0 retorna todas as Unidades
 sUneTipo     : Tipo de Unidade de negócio. Se vazio retorna todos os tipos
 }
function TCtrlListTerceiros.ListUnidNegocio(rIDPessoa,
  rUnidNegocio: Real; sUNeTipo,sUNeCodigo: String): OleVariant;
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

//==============================================================================
// Tipos de Recebimento/Desembolso
//==============================================================================

{ListTiposRD(rIDPessoa: Real; sRecPag, sAnaSint: String): OleVariant

 Descrição:
 Retorna uma Lista dos Tipos de Recebimento/Desembolso

 Parâmetros:
 IDPessoa     : Identificador do Pessoa (Empresa). Se <= 0 retorna todas as Empresas
 sRecPag      : Tipo de Rec/Des (R ou P). Se vazio retorna todos os tipos
 sAnaSint     : Característica do Rec/Des (A ou S). Se vazio retorna todos}

function TCtrlListTerceiros.ListTipoRD(rIDPessoa: Real; sRecPag, sAnaSint: String): OleVariant;
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

   sSql:=sSql+sFiltro+' ORDER BY DESCRICAO ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTerceiros.ListTipoRDFaltantesFluxo(rIDPessoa: Real): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT '+
         '   TRD.CODTIPRECDES, '+
         '   TRD.DESCRICAO, '+
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

   sSql:=sSql+sFiltro+' ORDER BY RECPAG,CODTIPRECDES ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTerceiros.ListTipoRDxCResponFinanc(rIDPessoa: Real;
                                       sCodCentroRespon, sEntradaSaida: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   TRD.CODTIPRECDES, '+
         '   TRD.RECPAG, '+
         '   TRD.DESCRICAO '+
         'FROM '+
         '   TIPORECEBDESEMB TRD '+
         'WHERE '+
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
         '                     (IDPESSOA='+FloatToStr(rIDPessoa)+'))) '+
         'ORDER BY TRD.RECPAG ';

   if (sEntradaSaida='E') then
      sSql:=sSql+' DESC, TRD.DESCRICAO'
   else
      sSql:=sSql+' ,TRD.DESCRICAO';

   Result:=GetDataPacket(sSql);
end;


//==============================================================================
// Centro de Responsabilidade
//==============================================================================

{ListCentrosRespon(rIDPessoa: Real; sAnaSint,sAtivo: String): OleVariant

 Descrição:
 Retorna uma Lista dos Centros de Responsabilidade

 Parâmetros:
 IDPessoa     : Identificador do Pessoa (Empresa). Se <= 0 retorna todas as Empresas
 sAnaSint     : Característica do Centro de Responsabilidade (A ou S). Se vazio retorna todos
 sAtivo       : Status do Centro de Responsabilidade (S ou N). Se vazio retorna todos os Status}

function TCtrlListTerceiros.ListCentroRespon(rIDPessoa: Real; sAnaSint,
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
      if (sFiltro<>'') then
          sFiltro:='WHERE (CODCENTRORESPON = '''+sCodCentroRespon+''') '
      else
          sFiltro:=sFiltro+'AND (CODCENTRORESPON = '''+sCodCentroRespon+''') ';

   sSql:=sSql+sFiltro+' ORDER BY NOME ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTerceiros.ListCentroResponxUsuario(rIDPessoa,
  rIDUsuario: Real): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT DISTINCT CR.CODCENTRORESPON, CR.NOME '+
         'FROM CENTRESPON CR,PESSOAXCRESP PCR '+
         'WHERE '+
         '   ((CR.IDPESSOA='+FloatToStr(rIDPessoa)+') AND '+
         '    (CR.CODCENTRORESPON <> ''9999999999'') AND '+
         '    (CR.ANALITICOSINTET = ''A'') AND '+
         '    (PCR.IDPESSOA=CR.IDPESSOA) AND '+
         '    (PCR.CODCENTRORESPON=CR.CODCENTRORESPON) AND '+
         '    (PCR.IDPESSOAACESSO = '+FloatToStr(rIDUsuario)+')) OR '+
         '   (NOT EXISTS(SELECT * FROM PESSOAXCRESP PCR2 '+
         '               WHERE (PCR2.IDPESSOAACESSO = '+FloatToStr(rIDUsuario)+') AND '+
         '                     (PCR2.IDPESSOA = '+FloatToStr(rIDPessoa)+'))) '+
         'ORDER BY NOME';
   Result:=GetDataPacket(sSql);
end;

//==============================================================================
// Centro de Custo
//==============================================================================

{ListCentroCusto(rIDPessoa: Real; sStatus,sAtivo: String): OleVariant

 Descrição:
 Retorna uma Lista dos Centros de Responsabilidade

 Parâmetros:
 IDPessoa     : Identificador do Pessoa (Empresa). Se <= 0 retorna todas as Empresas
 sStatus      : Status do Centro de Custo. Se vazio retorna todos os Status
 sAtivo       : Status do Centro de Custo (S ou N). Se vazio retorna todos os Status}

function TCtrlListTerceiros.ListCentroCusto(rIDPessoa: Real; sStatus,sAtivo: String): OleVariant;
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

function TCtrlListTerceiros.ListCentroCustoxConta(rIDPessoa, rPlano: Real;
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

function TCtrlListTerceiros.ListSubConta(rIDPessoa, rPlano: Real; sPlaConta: String): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT '+
         '   S.NOMESUBCONTA, '+
         '   S.CODSUBCONTA  '+
         'FROM CONTASXSUBC C, SUBCONTA S '+
         'WHERE (RTRIM(C.PLACONTA) = '''+Trim(sPlaConta)+''') AND '+
         '      (C.PLANO = '+FloatToStr(rPlano)+') AND '+
         '      (S.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '      (C.CODSUBCONTA = S.CODSUBCONTA) AND '+
         '      (C.IDPESSOA = S.IDPESSOA) '+
         'ORDER BY S.NOMESUBCONTA';
   Result:=GetDataPacket(sSql);
end;


//==============================================================================
// Tipos de Documento
//==============================================================================

{ListTipDocXCompFluxoDisp: OleVariant

 Descrição:
 Retorna uma Lista dos Tipos ainda não associados ao Fluxo de Caixa}


function TCtrlListTerceiros.ListTipDocXCompFluxoDisp: OleVariant;
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

function TCtrlListTerceiros.ListTipoDoc(sRecPag: String): OleVariant;
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

{ListAlteradores(rIDPessoa: Real; sRecPag,sACresDecres: String): OleVariant

 Descrição:
 }

function TCtrlListTerceiros.ListAlteradores(rIDPessoa: Real; sRecPag,sAcresDecres,sConverte: String): OleVariant;
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

function TCtrlListTerceiros.ListParamCAP(rIDPessoa: Real;
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

function TCtrlListTerceiros.ListPortadorConta(rIDPessoa: Real): OleVariant;
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
         '   (PC.IDBANCO = BC.IDPESSOA(+)) '+
         'ORDER BY PC.DESCRICAO';
   Result:=GetDataPacket(sSql);
end;

//==============================================================================
// ParamGlobal
//==============================================================================

function TCtrlListTerceiros.ListParamGlobal(rIDPessoa: Real): OleVariant;
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

function TCtrlListTerceiros.ListParamContab(rIDPessoa: Real): OleVariant;
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

function TCtrlListTerceiros.ListPatrocinador: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT PT.IDPESSOA, P.RAZAOSOCIAL '+
         'FROM PESSOA P, PATRO PT '+
         'WHERE (P.IDPESSOA = PT.IDPESSOA) '+
         'ORDER BY P.RAZAOSOCIAL ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTerceiros.ListPlanoPrev: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT IDPLANOPREV, NOME '+
         'FROM PLANPREVCONTABIL '+
         'ORDER BY NOME ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTerceiros.ListPrograma: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT IDPROGRAMA, DESCPROGRAMA '+
         'FROM PROGRAMA '+
         'ORDER BY DESCPROGRAMA ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTerceiros.ListMoeda(rMoeCodigo: Real; bSoMoedaAtiva: Boolean): OleVariant;
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

function TCtrlListTerceiros.ListModulo(rIDModulo: Real): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * FROM MODULO WHERE (IDMODULO = '+FloatToStr(rIDModulo)+') ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTerceiros.ListExercicio(rIDPessoa: Real): OleVariant;
begin
   Result:=GetDataPacket('SELECT DISTINCT EXERCICIO '+
                         'FROM PERIODOORCAMEN '+
                         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') '+
                         'ORDER BY EXERCICIO ');
end;

function TCtrlListTerceiros.ListPeriodo(rIDPessoa, rExercicio: Real): OleVariant;
begin
   Result:=GetDataPacket('SELECT PERIODO, NOMEPERIODO '+
                         'FROM PERIODOORCAMEN '+
                         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                         '      (EXERCICIO = '+FloatToStr(rExercicio)+') '+
                         'ORDER BY PERIODO');
end;

end.
