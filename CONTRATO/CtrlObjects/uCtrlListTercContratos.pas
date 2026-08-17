{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina........: ProgramaxCCxDesembolso 
N. Atender....: WO15797
Dt Alteração..: 20/02/2025
Responsável...: Paulo Nobre
Descrição.....: Ajustando a função para resultar, também, o Desembolso:
                CODTIPRECDES.
--------------------------------------------------------------------------------
Rotina......: ProgramaxCCxDesembolso
N. Sol......: 191844
N. Kintana..: 1822119
Data........: 15/07/2013
Responsável.: Edilaine Ferraresi
Descrição...: seleção automatica de programa em funçao do desembolso/c. custo
--------------------------------------------------------------------------------
Rotina ......: recuperaAtividadePerd, carregaAtividade e ListUnidNegocio
SOL..........: 163982
Kintana......: 1404974
Data.........: 23/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi adicionado os procedimentos recuperaAtividadePerd e
               carregaAtividade para retornar as atividades que estiverem
               destivadas. Foi modificado o procedimento ListUnidNegocio para
               retornar apenas as atividades ativas.
--------------------------------------------------------------------------------}
unit uCtrlListTercContratos;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes, uCtrlContaContabil;

type
   TCtrlListTercContratos = Class(TCmControlObject)

   private
      CtrlContaContabil: TCtrlContaContabil;

    function carregaAtividade(sCodAtividade: String): OleVariant;
   public
     function recuperaAtividadePerd(sCodAtividade: String): String; //VINICIUS MACIEL - SOL 163982 KTN 1404974
      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;

      function ListArtigoXProduto(sCodArtigo: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListTipoRD(rIDPessoa: Double; sRecPag, sAnaSint, sAtivo: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListSubConta(rIDPessoa, rPlano: Double;sPlaConta: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListMoeda(rMoeCodigo: Double; bSoMoedaAtiva: Boolean): OleVariant;
      //---------------------------------------------------------------------------------
      function ListMedida(sCodMedida: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListPatrocinador: OleVariant;
      //---------------------------------------------------------------------------------
      function ListPlanoPrev: OleVariant;
      //---------------------------------------------------------------------------------
      function ExistePlanoxPatro(const idPlano, idPatro : Integer): Boolean;
      //---------------------------------------------------------------------------------
      function ListPrograma: OleVariant;
      //---------------------------------------------------------------------------------
      function ListCentroCusto(rIDPessoa: Double; sStatus,sAtivo: String; IdPlanCentCusto: Extended = 0): OleVariant; // Daniel Simões
      //---------------------------------------------------------------------------------
      function ListContatos(rIDPessoa: Double): OleVariant;
      //---------------------------------------------------------------------------------
      function ListTelefoneContato(rIDContato: Double): OleVariant;
      //---------------------------------------------------------------------------------
      function ListUnidNegocio(rIDPessoa, rUnidNegocio: Double; sUNeTipo,sUNeCodigo: String; sAtivo : String = ''): OleVariant;  //Vinicius Maciel SOL 163982 KTN 1404974
      //---------------------------------------------------------------------------------
      function ListCentroRespon(rIDPessoa: Double; sAnaSint,sAtivo,
                                sCodCentroRespon: String; IdPlanCentRespon: Extended = 0): OleVariant;
      //---------------------------------------------------------------------------------
      function ListTipoDoc(sRecPag,sDebCre: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListProcessoRAD: OleVariant;
      //---------------------------------------------------------------------------------
      function ListPessoa(rIdPessoa: Double): OleVariant;
      //---------------------------------------------------------------------------------
      function ListAlterador(rIDPessoa: Double; sRecPag: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListFormaRecPag(rIDPessoa: Double; sRecPag: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListDadosContaBanc(rIDPessoa: Double): OleVariant;

//      function ProgramaxCCxDesembolso(iIdContrato, iIdItem, iIdObjeto, iCodCCusto : integer) : Integer;   // Edilaine - SOL 191844 / KTN 1822119
      function ProgramaxCCxDesembolso(iIdContrato, iIdItem, iIdObjeto, iCodCCusto : integer; sTipoRetorno : String) : String; // Paulo Nobre - WO15797

   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlListTercContratos }

constructor TCtrlListTercContratos.Create;
begin
   inherited;
   CtrlContaContabil:=TCtrlContaContabil.Create;
end;

procedure TCtrlListTercContratos.OnCreateAppServer;
begin
   inherited;
end;

destructor TCtrlListTercContratos.Destroy;
begin
   CtrlContaContabil.Free;
   inherited;
end;

procedure TCtrlListTercContratos.AfterInitialize;
begin
   inherited;
   CtrlContaContabil.InitializeAs(Self);
end;

procedure TCtrlListTercContratos.DoChangeDataBase;
begin
   inherited;
end;

function TCtrlListTercContratos.ListArtigoXProduto(
  sCodArtigo: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   A.CODARTIGO, P.DESCPROD '+
         'FROM ARTIGO A, PRODUTO P '+
         'WHERE (A.CODPRODUTO=P.CODPRODUTO) ';
         if (Trim(sCodArtigo)<>'') then
            sSql:=sSql+'      AND (A.CODARTIGO = '''+sCodArtigo+''') ';

         sSql:=sSql+'ORDER BY P.DESCPROD ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListTipoRD(rIDPessoa: Double; sRecPag,
  sAnaSint, sAtivo: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT CODTIPRECDES, DESCRICAO, RECPAG, PLACONTA, PLANO '+
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

   if (sAtivo<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE (ATIVO = '''+sAtivo+''') '
      else
         sFiltro:=sFiltro+'AND (ATIVO = '''+sAtivo+''') ';

   sSql:=sSql+sFiltro+' ORDER BY DESCRICAO ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListSubConta(rIDPessoa, rPlano: Double;
  sPlaConta: String): OleVariant;
begin
   Result:=CtrlContaContabil.ListContasxSC(rPlano,rIDPessoa,0,sPlaConta,toNome);
end;

function TCtrlListTercContratos.ListMoeda(rMoeCodigo: Double;
  bSoMoedaAtiva: Boolean): OleVariant;
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

function TCtrlListTercContratos.ListMedida(sCodMedida: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT  '+
         '   CODMEDIDA, '+
         '   DESCMEDIDA '+
         'FROM '+
         '   UNMEDIDA ';

   if (Trim(sCodMedida)<>'') then
      sSql:=sSql+'WHERE (CODMEDIDA = '+sCodMedida+') ';

   sSql:=sSql+'ORDER BY DESCMEDIDA ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListPatrocinador: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT PT.IDPESSOA, P.RAZAOSOCIAL '+
         'FROM PESSOA P, PATRO PT '+
         'WHERE (P.IDPESSOA = PT.IDPESSOA) '+
         'ORDER BY P.RAZAOSOCIAL ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListPlanoPrev: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT IDPLANOPREV, NOME, ATIVO '+
         'FROM PLANPREVCONTABIL '+
         'ORDER BY NOME ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListPrograma: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT IDPROGRAMA, DESCPROGRAMA '+
         'FROM PROGRAMA '+
         'ORDER BY DESCPROGRAMA ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListCentroCusto(rIDPessoa: Double; sStatus, sAtivo: String;
                                                IdPlanCentCusto: Extended = 0): OleVariant; // Daniel Simões
var
   sSql, sFiltro : String;
begin
   sFiltro := '';
   if rIdPessoa <> 0  then sFiltro := sFiltro + ' AND (IDEMPRESA = ' + FloatToStr(rIDPessoa) + ') ';
   if sStatus   <> '' then sFiltro := sFiltro + ' AND (STATUSGRUPOCDC = ''' + sStatus + ''') ';
   if sAtivo    <> '' then sFiltro := sFiltro + ' AND ((ATIVO = ''' + sAtivo + ''') OR (ATIVO IS NULL))';

   sSql := 'SELECT CODEXTERNO, CODCENTROCUSTO, NOME ' +#13+
           '  FROM CENTCUST ' +#13+
           ' WHERE 1=1 ' +#13+ sFiltro +#13+
           '   AND (IDPLANCENTCUST = '''+ FormatFloat('#0', IdPlanCentCusto) + ''') ' + #13 +
           ' ORDER BY NOME ';

   Result := GetDataPacket( sSql );
end;

function TCtrlListTercContratos.ListContatos(rIDPessoa: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT C.* '+
         'FROM PESSOA P,ENDPESS E,CONTATOPESS C '+
         'WHERE (P.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '      (P.IDPESSOA = E.IDPESSOA ) AND  '+
         '      (E.IDENDERECO = C.IDENDERECO ) '+
         'ORDER BY C.NOME ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListTelefoneContato(
  rIDContato: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   C.IDCONTATO, '+
         '   T.IDTELEFONE, '+
         '   T.DDI,T.DDD, '+
         '   T.NUMERO, '+
         '   C.RAMAL '+
         'FROM '+
         '   TELCONTATO C, '+
         '   TELENDPESS T '+
         'WHERE '+
         '   (C.IDCONTATO = '+FloatToStr(rIDContato)+') AND '+
         '   (T.IDTELEFONE = C.IDTELEFONE) ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListUnidNegocio(rIDPessoa,
  rUnidNegocio: Double; sUNeTipo, sUNeCodigo,sAtivo: String): OleVariant;   //VINICIUS MACIEL - SOL 163982 KTN 1404974
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

//VINICIUS MACIEL - SOL 163982 KTN 1404974
   if Trim(sAtivo)<>'' then
    if (sFiltro='') then
       sFiltro:='WHERE (ATIVO = '''+Trim(sAtivo)+''') '
    else
       sFiltro:=sFiltro+'AND (ATIVO = '''+Trim(sAtivo)+''') ';

       sFiltro:=sFiltro+    ' AND UNETIPO = '+QuotedStr('A')+ ' AND ATIVO = '+QuotedStr('S');
//VINICIUS MACIEL - SOL 163982 KTN 1404974 - Fim

   sSql:=sSql+sFiltro+' ORDER BY NOME ';

   Result:=GetDataPacket(sSql);
end;


//Vinicius Maciel - SOL 163982 KTN 1404974
function TCtrlListTercContratos.recuperaAtividadePerd(sCodAtividade : String) : String;
var
    CdsAux : TClientDataSet;
begin
    CdsAux := TClientDataSet.create(nil);
    CdsAux.Data := carregaAtividade(sCodAtividade);
    Result := CdsAux.FieldByName('Nome').asString;
    CdsAux.Free;
end;


function TCtrlListTercContratos.carregaAtividade(sCodAtividade : String) :OleVariant;
var
    sSQl : String;
begin
    sSQL := 'SELECT NOME FROM UNIDNEGOCIO WHERE UNIDNEGOC = '+sCodAtividade;
    result := GetDataPacket(sSQL);
end;

//Vinicius Maciel - SOL 163982 KTN 1404974 - Fim

function TCtrlListTercContratos.ListCentroRespon(rIDPessoa: Double;
  sAnaSint, sAtivo, sCodCentroRespon: String; IdPlanCentRespon: Extended = 0): OleVariant; // Daniel Simões - 26/01/2006
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
         sFiltro:='WHERE ((ATIVO = '''+sAtivo+''') )'
      else
         sFiltro:=sFiltro+'AND ((ATIVO = '''+sAtivo+''') )';

   if (sCodCentroRespon<>'') then
      if (sFiltro='') then
          sFiltro:='WHERE (CODCENTRORESPON = '''+sCodCentroRespon+''') '
      else
          sFiltro:=sFiltro+'AND (CODCENTRORESPON = '''+sCodCentroRespon+''') ';

// Daniel Simões - 26/01/2006 - Início -----------------------------------------
   if (IdPlanCentRespon<>0) then
      if (sFiltro='') then
          sFiltro:='WHERE (IDPLANCRESPON = '''+ FormatFloat('#0', IdPlanCentRespon) + ''') '
      else
          sFiltro:=sFiltro+'AND (IDPLANCRESPON = '''+ FormatFloat('#0', IdPlanCentRespon) +''') ';
// Daniel Simões - 26/01/2006 - Fim --------------------------------------------

   sSql:=sSql+sFiltro+' ORDER BY NOME ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListTipoDoc(sRecPag,sDebCre: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT * '+
         'FROM TIPODOCRECPAG TD ';

   sFiltro:='';
   if (sRecPag<>'') then sFiltro:='WHERE (RECPAG='''+sRecPag+''') ';

   if (sDebCre<>'') then
      if (sFiltro='') then
          sFiltro:='WHERE (DEBCRE='''+sDebCre+''') '
      else
          sFiltro:=sFiltro+'  AND (DEBCRE='''+sDebCre+''') ';      


   sSql:=sSql+sFiltro+' ORDER BY DESCRICAO';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListProcessoRAD: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * '+
         'FROM RADTIPOPROCESSO '+
         'ORDER BY NOME ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListPessoa(rIdPessoa: Double): OleVariant;
var
   sSql: String;
begin
   sSql:='SELECT * FROM PESSOA WHERE (IDPESSOA = '+FloatToStr(rIdPessoa)+') ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListAlterador(rIDPessoa: Double;
  sRecPag: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * FROM TIPOALTERADOR WHERE (IDPESSOA = '+FloatToStr(rIdPessoa)+') ';
   if (Trim(sRecPag)<>'') then sSql:=sSql+' AND (RECPAG = '''+sRecPag+''') ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListFormaRecPag(rIDPessoa: Double;
  sRecPag: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   CODFORMA, '+
         '   DESCRICAO '+
         'FROM '+
         '   FORMARECPAG '+
         'WHERE '+
         '   (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (RECPAG = '''+sRecPag+''') '+
         'ORDER BY DESCRICAO ';
   Result:=GetDataPacket(sSql);         
end;

function TCtrlListTercContratos.ListDadosContaBanc(
  rIDPessoa: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   DECODE(C.TIPOCONTA,''1'',''Conta Corrente'', '+
         '                      ''2'',''Cartão Salário'', '+
         '                      ''3'',''Conta Poupança'','''') AS DESCTIPOCONTA, '+
         '   C.CONTACORRENTE, '+
         '   B.NUMBANCO, '+
         '   A.NUMAGENCIA, '+
         '   C.TIPOCONTA, '+
         '   C.IDCBANCARIA, '+
         '   DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOMEAGENCIA, '+
         '   DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOMEBANCO '+
         'FROM '+
         '   PESSOA PA, '+
         '   PESSOA PB, '+
         '   CONTABANCARIA C, '+
         '   AGENCIABANCARIA A, '+
         '   BANCO B '+
         'WHERE '+
         '   (C.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (C.FLGCONTAPREF = 1) AND '+
         '   (C.IDAGENCIA = A.IDPESSOA) AND '+
         '   (A.IDBANCO   = B.IDPESSOA) AND '+
         '   (A.IDPESSOA = PA.IDPESSOA) AND '+
         '   (B.IDPESSOA = PB.IDPESSOA) ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ExistePlanoxPatro(const idPlano, idPatro: Integer): Boolean;
var sSql : String;
    cdsTemp : TCMClientDataSet;
begin
   Result := False;
   try
      cdsTemp := TCMClientDataSet.Create( nil );
      sSql := 'SELECT * FROM PLANPREVCONTABPATRO ' +#13+
              ' WHERE IDPLANOPREV = ' + IntToStr(idPlano) +#13+
              '   AND IDPATRO     = ' + IntToStr(idPatro);

      cdsTemp.data := GetDataPacket( sSql );
      Result  := not cdsTemp.IsEmpty;
   finally
      FreeAndNil( cdsTemp );
   end;
end;

// Paulo Nobre - WO15797 - Inicio
// Edilaine - SOL 191844 / KTN 1822119
function TCtrlListTercContratos.ProgramaxCCxDesembolso(iIdContrato,iIdItem, iIdObjeto, iCodCCusto: integer; sTipoRetorno : String): String;
var
  cdsTemp : TCMClientDataSet;
  sSQL : string;
begin
  Result := '-1';

  sSQL := 'SELECT OI.CODTIPRECDES, P.CODCENTROCUSTO, P.IDPROGRAMA '+
          '  FROM OBJETOSXITEMCONTR O, OBJETOXITEM OI, '+
          '       TIPORDXCCXCONTA P '+
          ' WHERE P.CODTIPRECDES = OI.CODTIPRECDES '+
          '   AND O.IDOBJETO = OI.IDOBJETO  '+
          '   AND O.IDITEM = OI.IDITEM  '+
          '   AND P.CODCENTROCUSTO = '+IntToStr(iCodCCusto) +
          '   AND O.IDCONTRATO = '+IntToStr(iIdContrato)+  // 779
          '   AND O.IDITEM = '+IntToStr(iIdItem)+  // 271
          '   AND O.IDOBJETO = '+IntToStr(iIdObjeto);  //176

   try
      cdsTemp := TCMClientDataSet.Create( nil );

      cdsTemp.data := GetDataPacket( sSql );

      if not cdsTemp.isEmpty then
      begin
        if sTipoRetorno = 'P' Then
          Result := cdsTemp.FieldByName('IDPROGRAMA').AsString;

        if sTipoRetorno = 'D' Then  // Desembolso
          Result := cdsTemp.FieldByName('CODTIPRECDES').AsString;
      end;

   finally
      FreeAndNil( cdsTemp );
   end;
end;
// Paulo Nobre - WO15797 - Fim

end.
