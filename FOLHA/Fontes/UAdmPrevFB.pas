// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Alteração  : LeParam
//Nº SIG.....: 99503
//Data.......: 20/04/2020
//Responsável: Andre Imakawa
//Descrição..: Criado parametros para mes de pagamento abono FUNCEF/INSS
//------------------------------------------------------------------------------
//Alteração  : LeParam
//Nº SIG.....: 99272
//Data.......: 23/03/2020
//Responsável: Andre Imakawa
//Descrição..: Criado parametros para mes de pagamento abono
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Pendência   : 19772
// Data        : 23/02/2006
// Alteração   : criação do campo FLGATUPERCGF
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 28/11/2005
// Rotina      : LeParam
// Pendência   : 19791
// Descricao   : Criei variável global para guardar a regra de plano contábil a
//               ser executada na folha extra. 
//------------------------------------------------------------------------------
unit UAdmPrevFB;

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Machklb,Registry,checklst;

const
  cteIdModuloAdmPREV  = 16;
  cteIdModuloCCP      = 32;
  cteIdModuloFolhaBen = 18;
  cteIdModuloFolhaCM  = 21;

var
   { Variáveis Globais }

   sTipoPrevidencia : string; { Caracter que indica se o sistema é aberto(A) ou fechado(F) }
   iIdFundacao     : longint; { Identificador da fundacao no caso de monofundacao }
   iIdFundacaoAtual : integer;
   bExibeQuery,
   bPedeFundacao : boolean; { True- entrar no cadastro de fundacao na abertura do sistema}
   { Parâmetros do Sistema }
   prmFlgImpCertif   : boolean;
   prmflgMultiFundacao  : boolean;
   prmIdMotivoContrib : integer;
   prmIDMOTIVOFOLHABEN : integer;
   prmIdMotivoDevolBen : integer;
   prmFLGCOBPATROFOLHA : integer;  
   prmIdMotivoQuitacao : Integer;  
   prmIdRgPlanPrevCont : Integer;  
   prmFlgIntContab,
   prmFLGINTCRECEBERPR,
   prmFlgIntCPagarPrev : boolean;
   prmIdRamoTipoFor,
   prmIdRamoTipoCli : longint;
   // Variaveis de integracao com financeiro
   prmIdRamoTipoCliAtivo,
   prmIdRamoTipoCliPatro,
   prmIdRamoTipoCliMantido,
   prmIdRamoTipoCliMantidoParc,
   prmIdRamoTipoCliAssistido,
   prmIdRamoTipoForAtivo,
   prmIdRamoTipoForPatro,
   prmIdRamoTipoForMantido,
   prmIdRamoTipoForMantidoParc,
   prmIdRamoTipoForAssistido    : longint;
   prmUnidNegoc : longint;
   prmCodCentroRespon,
   prmTpOperCobranca,
   prmTpDocRRecBanco,
   prmTpDocCrFlhBeneLet,
   prmTpDocRRecPatro,
   prmTpDocPEnvioPatro,
   prmTpDocPEnvioBanco  : string;

   iIdCalculoGeral : longInt ; // variavel criada para passar para a funcao RegraNumerica
                              // caso o procedimento chamador nao necessite deste paramentro

   prmIdRubricaIRRF : integer;
   prmIdMotivoAbono : integer;
   prmIdRubAbono : integer;
   prmIdRubAntecAbono : integer;
   prmIdRubDescAntecAbono : integer;
   prmFLGFORMADESCONTO : Integer;
   prmIdRubricaCPMF : Integer;
   prmPercCPMF : Double;
   prmTipCodigo : string;
   prmCodTipDoc : string;
   prmDebCre : string;

   prmIDRUBIRRFINSS : integer;
   prmIDRUBIRRFABONO : integer;
   prmIDRUBIRRFPENSAO : integer;
   prmIDRUBIRRFPENALIM : integer;
   prmIDRUBARRED : Integer;
   prmIDRUBARREDMESANT : Integer;
   prmIDTIPOAGRECPMF : Double;

   prmFlgUsaFolhaResg,
   prmFlgTrataPrevia,
   prmFlgCalculoValores,  {Folha Beneficio - indicar se as rubricas terão
                           seu valor truncado (=0) ou arredondado (=1)}
   prmFlgCorrigeBenef,
   prmIdRubIRRFResg    : Integer;

   prmVlrArredSalario,
   prmVlrBenefMin     : Double;

   prmIdRubCmBenef,
   prmIdRubCmCont,
   prmIdRubAjCmBenef,
   prmIdRubAjCmCont    : Integer;

   // Parametro que indica a obrigatoriedade da indicacao do alimentado na PA
   prmFLGOBRIGAALMENTDO : Integer;

   //portador forma para pagamento de convenio com as patrocinadoras
   prmPortFormaPatro : integer;

   //PARAMETROS GLOBAIS COM RUBRICAS INFORMATIVAS PARA DEDUCOES POR DEP E IDADE
   prmIdRubDeducaoDep,
   prmIdRubDeducaoIdade : integer;

   prmIdMotDevPagtoNIdent : Integer;

   { Parametro temporario para dizer se testa ou nao REGRA }
   bTestaRegra : boolean;

   //PARAMETRO GLOBAL PARA REGRA DE VERIFICACAO DA FOLHA
   prmIdRegraVerifica : integer;

   //PAR. GLOBAL QUE ARMAZENA VALOR MINIMO PARA DESCONSIDERAR O IRRF.
   prmVLMINIRFF: Double;

   //PAR. GLOBAL QUE CONSIDERA OU NÃO O ABONO SOBRE O VALOR MÍNIMO
   // DO IRRF. VER prmVLMINIRFF.
   prmFLGVLIRVLMINABONO : Integer;

   //PAR. QUE IDENTIFICA A RUBRICA  PARA COMPENSACAO DE IRRF
   prmIDRUBIRRFCOMPIR : Integer;
   //PAR. QUE DETERMINA SE VAI HAVER RECALCULO MENSAL DO SRB
   prmFLGRECALCULOSRBMES : Integer;
   // IDENTIFICA SE A REGRA DE BENEFICIO MINIMO SERÁ EXECUTADA TODO MÊS PELA
   // FOLHA DE BENEFÍCIOS NO PREPARO.
   prmFLGEXECRGBMINMES : Integer;
   // IDENTIFICA A RUBRICA DE CRÉDITO DE ADIANTAMENTO DE BENEFÍCIOS
   prmIdRubCompAdiant, prmIdRubCredAdiant :  Integer;

   // IDENTIFICA SE O SISTEMA VAI TRABALHAR COM O CODIGO E DESCRICAO DA RUBRICA INTERNO OU EXTERNO
   prmFLGUSACODRUBEXT : Integer;

   // IDENTIFICA SE O SISTEMA VAI CONTROLAR PRAZO PARA AS RUBRICAS
   prmFLGUSAPRAZORUB : Integer;

   // IDENTIFICA SE O SISTEMA VAI TRABALHAR COM TODAS AS RUBRICAS OU SO COM AS
   // RUBRICAS DA FOLHA DE BENEFICIOS.
   prmFLGVERRUBFOLBEN  : Integer;

   // IDENTIFICA SE O SISTEMA VAI PERMITIR O LANCAMENTO DE RUBRICAS INDIVIDUAIS SO
   // PARA ASSISTIDOS E PENSIONISTAS OU TAMBEM PARA OS ATIVOS
   prmFLGVERATIVOS : Integer;

   // Parametro global que indica qual é o grau de instrucao considerado como universitario
   prmIDGRINSTR : Integer;

   {PARAMETROS TEXTO PARA COLOCAR NO INICIO E NO FINAL
     DO ARQUIVO TEXTO DE CONTRA-CHEQUE}
   prmCabecArqCC : string;
   prmRodapeArqCC : string;

   prmFLGATUPERCGF: integer = 0;

   // Andre Imakawa - SIG 99272 - Inicio
   prmMesAdiantAbonoFund, prmMesAdiantAbonoINSS  : string;
   // Andre Imakawa - SIG 99272 - Fim

   // Andre Imakawa - SIG 99503 - Inicio
   prmMesAbonoFund, prmMesAbonoINSS  : string;
   // Andre Imakawa - SIG 99503 - Fim

   procedure TiraQuery(qryAux : TwwQuery);
   { Rotina para ler a tabela de parametros do Sistema AdmPrev
     e preencher as variaveis de paramentro necessárias }
   function LeParam(nomeBaseDados : string; bInicVar:boolean ) : boolean;
   procedure CadastraFundacao(qry : TwwQuery);

   { Rotina que calcula a idade em anos de uma pessoa }
   function CalcIdade(dDataNasc : TDateTime) : integer;

   { Rotinas para tratar PONTOS e VIRGULAS do Delphi x  Oracle }
   function OraNumero(sNumero : string):string;
   function ClienteNumero(sNumero : string):string;

   { Rotinas para executar regras }
   function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
   function RegraNumerica(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
   function ExecutaRegra(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;

   { Rotinas para tratar meses e anos }
   function ProximoAnoMes(iMes,iAno : integer) : string;
   function ProximoMesAno(iMes, iAno : integer) : string;

   { Rotina para identificar Id do item checado em um checkListBox }
   function PegaidCheck(chklst : TCheckListBox ;chave,nome: string ; var qryaux : TwwQuery ):String;

   { Rotina para criticar Data da Cobranca dependendo da SITUACAO(DatasPatroPlano) }
   //sTipoData = N(Normal), A(Atraso), D(Devolução) ; sTpCobranca F(Folha), O(Outros)
   function CriticaDataCobrancaSit( qry : TwwQuery;
				 sIdPessJur, sIdPlanoPrev, sSitFundacao : string;
				 sTipoData                              : char;
				 sMesReferencia, sAnoReferencia         : string) : string;

   { Rotina para criticar Data da Cobranca INDEPENDENTE DA SITUACAO(DatasPatroPlano) }
   function RetornaDataCobranca(iDia : integer; sUtil,sAnterior,sMesCorrente,sMesReferencia,sAnoReferencia : string) : String;

   { Rotina que retorna o 'N' Dia Útil do mes }
   function DiaUtil(sDiaUtil, sMesAno: string): string; // ex: se sDiaUtil = 5, pega o quinto dia util do mes e ano informados

   { Rotina que retorna o mes de cobrança com relação ao sistema assistencial}
   function CriticaMesCobrancaAssist(qry : TwwQuery; sIdPessJur, sIdPlanoPrev,sIdplanass , sTipoData, sMesReferencia, sAnoReferencia: string): string;
   function AnoMesAnterior(iMes, iAno : integer) : string;
   function SAnoMesAnterior(sAnoMes : string) : string;
   function CriticaMesCobrancaPatro(qry : TwwQuery; sIdPessJur, sIdplanass , sMesReferencia, sAnoReferencia: string): string;
   function MesAnoAnterior(iMes, iAno : integer) : string;

   procedure ExibeQueryRegra(sSQL,sIdRegra : string);

   function  MudaSeparador(sNumero : string):string;

   procedure TiraSQL( qry : TwwQuery);

   procedure PedeInfAux(sCaptionForm, sTituloInf1,sMascInf1 : string;  iNumInf : integer;
                     var sValor1 : string );

   // Faz o calculo de um valor pro-rata do inicio do mes até o dia final
   function ValorProRataUltimo(psValorIntegral , psDataRefFinal : string) : double;

   function ValorProRataMes(psValorIntegral, psAnoMesRef, psDataRefInicio, psDataRefFinal : string) : double;

   // Faz o calculo de um valor pro-rata do dia de inicio até o final do mes
   function ValorProRataPrimeiro(psValorIntegral, psDataRefInicio : string) : double;

implementation
                          
uses UMensErro,DAPrev,UMascaras,USistema,UAutorizacao,DBaseDados,FTelaAuxRegra,
     FPedeInfAux;

{ FUNCOES UTEIS AO SISTEMA DE ADMINISTRACAO PREVIDENCIARIA }
procedure TiraSQL( qry : TwwQuery);
begin
   with qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT 1 FROM DUAL ');
     Open;
     Close;
   end;
end;

function OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = ','
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   if trim(sResult) = '' then
     sResult:='0';
   Result := sResult;
end;

function MudaSeparador(sNumero : string):string;
var i : integer;
    sOra : string;
begin
   sOra  := '';
   for i := 1 to length(Trim(sNumero))
   do begin
     if (sNumero[i] = '.') or (sNumero[i] = ',') then
        sOra   := sOra + DecimalSeparator
     else sOra := sOra + sNumero[i]
   end;
   Result := sOra;
end;


{ FUNCOES UTEIS AO SISTEMA DE ADMINISTRACAO PREVIDENCIARIA }
function ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   if trim(sResult) = '' then
     sResult:='0';
   Result := sResult;
end;

function LeParam(nomeBaseDados : string; bInicVar:boolean ) : boolean;
var
   qry, QryAux : TwwQuery;
   sSql : String;
begin
   bPedeFundacao := False;

   // Verificar no registro se o sistema é Aberto ou fechado
   sTipoPrevidencia    := 'F';

   // Se variaveis ainda nao foram inicilizadas, inicializá-las
   if bInicVar
   then begin
      bTestaRegra := True;
   end;

   // Criar query temporária
   Result := True;
   qry := TwwQuery.Create(Application);
   qry.DatabaseName := nomeBaseDados;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT IDDOCUMENTO,IDREGRACALCINSS,IDMOTIVOCONTRIBP,IDRUBIRRF,');
   qry.SQL.Add('IDPESSOA,CODALTDESPDESCFO,CODALTIRCOM,FLGIMPCERTIF,DATAULTDVR,');
   qry.SQL.Add('PRAZODVR,');
   qry.SQL.Add('FLGINTCONTAB,MASCTIPORESERVA,FLGMULTIFUNDACAO,');
   qry.SQL.Add('IDMOTIVOEMPRESTI,');
   qry.SQL.Add('IDMOTIVOCONTRIBA,');
   qry.SQL.Add('IDMOTIVOFOLHABEN,');
   qry.SQL.Add('IDMOTIVOFORNPAG,');
   qry.SQL.Add('IDMOTIVOFORNCOMI,');
   qry.SQL.Add('FLGINTCONTBASS,');
   qry.SQL.Add('FLGINTCPAGAR,');
   qry.SQL.Add('FLGINTCRECEBER,');
   qry.SQL.Add('FLGINTCPAGARPREV,');
   qry.SQL.Add('FLGINTCRECEBERPR,');
   qry.SQL.Add('IDMOTIVOABONO,');
   qry.SQL.Add('IDRUBQUITAEMPREST,');
   qry.SQL.Add('IDRUBQUITAPREV,');
   qry.SQL.Add('IDRUBQUITAASSIST,');
   qry.SQL.Add('IDRUBPENSAO,');
   qry.SQL.Add('IDMOTIVODEVOLAS,');
   qry.SQL.Add('IDMOTIVOATRASOAS,');
   qry.SQL.Add('IDMOTIVOFINANCAS,');
   qry.SQL.Add('IDMOTIVODEVOLBEN,');
   qry.SQL.Add('FLGFORMADESCONTO,');
   qry.SQL.Add('PERCCPMF,');
   qry.SQL.Add('IDRUBRICACPMF,');
   qry.SQL.Add('TPDOCPFLHBENELET,');
   qry.SQL.Add('TPDOCPFLHBENINDIV,');
   qry.SQL.Add('TPDOCRFLHBENELET,');
   qry.SQL.Add('TPDOCRFLHBENINDIV,');
   qry.SQL.Add('TPDOCPENVIOBANCO,');
   qry.SQL.Add('TPDOCPENVIOPATRO,');
   qry.SQL.Add('TPDOCRRECBANCO,');
   qry.SQL.Add('TPDOCRRECPATRO,');
   qry.SQL.Add('TIPOPERENVIO,');
   qry.SQL.Add('TIPOPERCOBRANCA,');
   qry.SQL.Add('TIPOPERDIVERG,');
   qry.SQL.Add('TIPOPERRESERVA,');
   qry.SQL.Add('TIPOPERFLHBEN,');
   qry.SQL.Add('TIPOCLIPATRO,');
   qry.SQL.Add('TIPOCLIATIVOS,');
   qry.SQL.Add('TIPOCLIMANTIDOS,');
   qry.SQL.Add('TIPOCLIASSISTIDOS,');
   qry.SQL.Add('TIPOCLIMANTPARC,');
   qry.SQL.Add('TIPOFAVPATRO,');
   qry.SQL.Add('TIPOFAVATIVOS,');
   qry.SQL.Add('TIPOFAVMANTIDOS,');
   qry.SQL.Add('TIPOFAVASSISTIDOS,');
   qry.SQL.Add('TIPOFAVMANTPARC,');
   qry.SQL.Add('IDCONTRACHEQUE,');
   qry.SQL.Add('IDRUBADIANT,');
   qry.SQL.Add('IDMOTIVOADIANT,');
   qry.SQL.Add('IDRUBIRRFINSS,');
   qry.SQL.Add('IDRUBIRRFABONO,');
   qry.SQL.Add('FLGCOBPATROFOLHA,'); 
   qry.SQL.Add('IDRUBIRRFEXT,');
   qry.SQL.Add('IDRUBIRRFPENSAO,');
   qry.SQL.Add('IDRUBIRRFPENALIM, ');
   qry.SQL.Add('IDRUBARRED, ');
   qry.SQL.Add('IDRUBARREDMESANT, ');
   qry.SQL.Add('IDTIPOAGRECPMF, ');
   qry.SQL.Add('FLGUSAFOLHARESG, FLGTRATAPREVIAPA, FLGCALCULOVALORES,        ');
   qry.SQL.Add('FLGCORRIGEBENEF, VLRARREDSALARIO,  IDRUBIRRFRESG, VLRBENEFMIN, ');
   qry.SQL.Add('IDRUBCMBENEF, IDRUBCMCONT, IDRUBAJCMBENEF, IDRUBAJCMCONT, FLGCALCJUNTO, ');
   qry.SQL.Add(' IDRUBPALIMINSS, ');
   qry.SQL.Add('IDRUBIRRFCOMPIR, ');
   qry.SQL.Add('FLGRECALCULOSRBMES, FLGEXECRGBMINMES, IDRUBCREDADIANT, ');
   qry.SQL.Add('IDRUBDESCDEP, IDRUBDESCIDADE, IDRUBIRRFPROVJUD, IDMOTDEVOLNAOIDEN, ');
   qry.SQL.Add('IDREGRAVERIFFOLHA, VLMINIRFF, FLGVLIRMINABONO, FLGOBRIGAALMENTDO,FLGUSACODRUBEXT, ');
   qry.SQL.Add('FLGATUPERCGF, '); 
   qry.SQL.Add(' FLGUSAPRAZORUB, FLGUSABENEFXRUB, FLGVERRUBFOLBEN, FLGVERATIVOS, IDGRINSTR ');
   qry.SQL.Add(', IDMOTIVOQUITANT ');   
   qry.SQL.Add(', IDRGCONTABBENEF ');   
   qry.SQL.Add(',CABECARQCC, RODAPEARQCC, CODPORTFORMAPATRO ');
   qry.SQL.Add(',MESADIANTABONOFUND, MESADIANTABONOINSS '); // Andre Imakawa - SIG 99272
   qry.SQL.Add(',MESABONOFUND, MESABONOINSS ');             // Andre Imakawa - SIG 99503
   qry.SQL.Add('FROM PARAMAPREV');
   try
     qry.Open;
   except
     MsgDlg('Erro na leitura de parâmetros','Erro',mtError,[mbOk,mbHelp],0);
     Result := False;
     qry.Close;
     qry.Free;
     exit;
   end;

   sSql := Qry.SQL.GetText;

   { Se nao existir registro na tabela de parametros, significa que o sistema
     ainda nao foi instalado, ou seja, está sendo instalado pela 1a. vez.
     Neste caso, o sistema deve gravar algums valores default. Além disto o
     sistema deverá :
        * Perguntar se o usuário trabalhará com mais de uma fundacao
          Se sim -> abrir cadastro de fundacao
          Se nao -> cadastrar empresa do login como fundacao
   }
   if qry.IsEmpty then
   begin
     if MsgDlg('Deseja trabalhar com o sistema Multi-Fundação ?', 'Confirmação',
               mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo then
     begin // Nao é multifundacao
       CadastraFundacao(qry); //Cadastrar EmpresaPropria como fundacao
       try
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add(' INSERT INTO PARAMAPREV(FLGIMPCERTIF,     FLGINTCONTAB,   FLGMULTIFUNDACAO, '+
                     '                        FLGINTCPAGARPREV, FLGINTCRECEBERPR) '+
                     ' VALUES(0,1,0,1,1) ');
         qry.ExecSQL;
       except
         MsgDlg('Erro na gravação da Fundação','Erro',mtError,[mbOk,mbHelp],0);
       end;
     end
     else
     begin // Usuario optou por sistema multifundacao
       qry.Close;
       qry.SQL.Clear;
       qry.SQL.Add(' INSERT INTO PARAMAPREV(FLGIMPCERTIF,     FLGINTCONTAB,   FLGMULTIFUNDACAO, '+
                   '                        FLGINTCPAGARPREV, FLGINTCRECEBERPR) '+
                   ' VALUES(0,1,1,1,1) ');
       try
         qry.ExecSQL;
       except
         on E:EDBEngineError do
         begin
           MostrarErro(E);
           qry.Close;
           qry.Free;
           Exit;
         end;
       end;
     end;
     qry.Close;
     qry.SQL.Clear;
     qry.Sql.Add(sSql);
     qry.Open;
   end;

   if qry.FieldByName('flgImpCertif').AsInteger = 1 then
     prmFlgImpCertif := True
   else
     prmFlgImpCertif := False;

   if qry.FieldByName('flgMultiFundacao').AsInteger = 1 then
     prmflgMultiFundacao := True
   else
     prmflgMultiFundacao := False;

   if qry.FieldByName('FLGINTCONTAB').AsInteger = 1 then
     prmFlgIntContab := True
   else
     prmFlgIntContab := False;

   if qry.FieldByName('FLGINTCPAGARPREV').AsInteger = 1 then
     prmFlgIntCPagarPrev := True
   else
     prmFlgIntCPagarPrev := False;

   if qry.FieldByName('FLGINTCRECEBERPR').AsInteger = 1 then
     prmFLGINTCRECEBERPR := True
   else
     prmFLGINTCRECEBERPR := False;

   // Andre Imakawa - SIG 99272 - Inicio
   prmMesAdiantAbonoFund := Trim(qry.FieldByName('MESADIANTABONOFUND').AsString);
   prmMesAdiantAbonoINSS := Trim(qry.FieldByName('MESADIANTABONOINSS').AsString);
   // Andre Imakawa - SIG 99272 - Fim

   // Andre Imakawa - SIG 99503 - Inicio
   prmMesAbonoFund := Trim(qry.FieldByName('MESABONOFUND').AsString);
   prmMesAbonoINSS := Trim(qry.FieldByName('MESABONOINSS').AsString);
   // Andre Imakawa - SIG 99503 - Fim

   prmIdMotivoContrib := qry.FieldByName('IDMOTIVOCONTRIBP').AsInteger;

   prmIdMotivoQuitacao   := qry.FieldByName('IDMOTIVOQUITANT').AsInteger; 
   prmIdRgPlanPrevCont   := qry.FieldByName('IDRGCONTABBENEF').AsInteger; 

   prmIdRubricaIRRF      := qry.FieldByName('IdRubIRRF').AsInteger;
   prmIDMOTIVOFOLHABEN   := qry.FieldByName('IDMOTIVOFOLHABEN').AsInteger;
   prmIdMotivoAbono      := qry.FieldByName('IdMotivoAbono').AsInteger;
   prmIdMotivoDevolBen   := qry.FieldByName('IdMotivoDevolBen').AsInteger;
   prmFLGCOBPATROFOLHA   := qry.FieldByName('FLGCOBPATROFOLHA').Asinteger;
   prmFLGFORMADESCONTO   := qry.FieldByName('FLGFORMADESCONTO').AsInteger;

   prmIdRubricaCPMF      := qry.FieldByName('IdRubricaCPMF').AsInteger;
   prmPercCPMF           := qry.FieldByName('PercCPMF').AsFloat + 1;

   prmTipCodigo          := qry.FieldByName('TipOperFlhBen').AsString;
   prmCodTipDoc          := qry.FieldByName('TpDocPFlhBenElet').AsString;
   prmIdRamoTipoFor      := qry.FieldByName('TIPOFAVASSISTIDOS').AsInteger;
   prmIdRamoTipoCli      := qry.FieldByName('TIPOCLIASSISTIDOS').AsInteger;

   // Parametros de integracao com o financeiro
   prmTpOperCobranca   := qry.FieldByName('TIPOPERCOBRANCA').AsString;
   prmTpDocRRecBanco   := qry.FieldByName('TPDOCRRECBANCO').AsString;
   prmTpDocCrFlhBeneLet := qry.FieldByName('TPDOCRFLHBENELET').AsString;
   prmTpDocRRecPatro   := qry.FieldByName('TPDOCRRECPATRO').AsString;
   prmTpDocPEnvioPatro := qry.FieldByName('TPDOCPENVIOPATRO').AsString;
   prmTpDocPEnvioBanco := qry.FieldByName('TPDOCPENVIOBANCO').AsString;

   prmIdRamoTipoCliAtivo        := qry.FieldByName('TIPOCLIATIVOS').AsInteger;
   prmIdRamoTipoCliPatro        := qry.FieldByName('TIPOCLIPATRO').AsInteger;
   prmIdRamoTipoCliMantido      := qry.FieldByName('TIPOCLIMANTIDOS').AsInteger;
   prmIdRamoTipoCliMantidoParc  := qry.FieldByName('TIPOCLIMANTPARC').AsInteger;
   prmIdRamoTipoCliAssistido    := qry.FieldByName('TIPOCLIASSISTIDOS').AsInteger;

   prmIdRamoTipoForAtivo        := qry.FieldByName('TIPOFAVATIVOS').AsInteger;
   prmIdRamoTipoForPatro        := qry.FieldByName('TIPOFAVPATRO').AsInteger;
   prmIdRamoTipoForMantido      := qry.FieldByName('TIPOFAVMANTIDOS').AsInteger;
   prmIdRamoTipoForMantidoParc  := qry.FieldByName('TIPOFAVMANTPARC').AsInteger;
   prmIdRamoTipoForAssistido    := qry.FieldByName('TIPOFAVASSISTIDOS').AsInteger;

   prmIDRUBIRRFINSS             := qry.FieldByName('IDRUBIRRFINSS').AsInteger;
   prmIDRUBIRRFABONO            := qry.FieldByName('IDRUBIRRFABONO').AsInteger;
   prmIDRUBARRED                := qry.FieldByName('IDRUBARRED').AsInteger;
   prmIDRUBARREDMESANT          := qry.FieldByName('IDRUBARREDMESANT').AsInteger;
   prmIDTIPOAGRECPMF            := qry.FieldByName('IDTIPOAGRECPMF').AsInteger;

   prmFlgUsaFolhaResg   := qry.FieldByName('FLGUSAFOLHARESG').AsInteger;
   prmFlgTrataPrevia    := qry.FieldByName('FLGTRATAPREVIAPA').AsInteger;
   prmFlgCalculoValores := qry.FieldByName('FLGCALCULOVALORES').AsInteger;
   prmFlgCorrigeBenef   := qry.FieldByName('FLGCORRIGEBENEF').AsInteger;
   prmIdRubIRRFResg     := qry.FieldByName('IDRUBIRRFRESG').AsInteger;
   prmVlrArredSalario   := qry.FieldByName('VLRARREDSALARIO').AsFloat;
   prmVlrBenefMin       := qry.FieldByName('VLRBENEFMIN').AsFloat;

   prmIdRubCmBenef     := qry.fieldbyname('IDRUBCMBENEF').AsInteger;
   prmIdRubCmCont      := qry.fieldbyname('IDRUBCMCONT').AsInteger;
   prmIdRubAjCmBenef   := qry.fieldbyname('IDRUBAJCMBENEF').AsInteger;
   prmIdRubAjCmCont    := qry.fieldbyname('IDRUBAJCMCONT').AsInteger;

   prmFLGOBRIGAALMENTDO := qry.fieldbyname('FLGOBRIGAALMENTDO').asInteger;

   //PARAMETROS GLOBAIS COM RUBRICAS INFORMATIVAS PARA DEDUCOES POR DEP E IDADE
   prmIdRubDeducaoDep := qry.fieldbyname('IDRUBDESCDEP').AsInteger;
   prmIdRubDeducaoIdade := qry.fieldbyname('IDRUBDESCIDADE').AsInteger;

   prmIdMotDevPagtoNIdent := qry.FieldByname('IDMOTDEVOLNAOIDEN').AsInteger;

   prmIdRegraVerifica := qry.fieldbyname('IDREGRAVERIFFOLHA').AsInteger;

   prmVLMINIRFF := qry.FieldByName('VLMINIRFF').AsFloat;

   prmFLGVLIRVLMINABONO := qry.FieldByName('FLGVLIRMINABONO').AsInteger;

   //PAR. QUE IDENTIFICA A RUBRICA  PARA COMPENSACAO DE IRRF
   prmidRubIrrfcompir := qry.Fieldbyname('IDRUBIRRFCOMPIR').AsInteger;
   //PAR. QUE DETERMINA SE VAI HAVER RECALCULO DO SRB
   // SE HOUVER REAJUSTE NO INSS OU NA PATROCINADORA
   prmFLGRECALCULOSRBMES := qry.Fieldbyname('FLGRECALCULOSRBMES').AsInteger;
   // IDENTIFICA SE A REGRA DE BENEFICIO MINIMO SERÁ EXECUTADA TODO MÊS PELA
   // FOLHA DE BENEFÍCIOS NO PREPARO.
   prmFLGEXECRGBMINMES := qry.Fieldbyname('FLGEXECRGBMINMES').AsInteger;
   // IDENTIFICA A RUBRICA DE CRÉDITO DE ADIANTAMENTO DE BENEFÍCIOS
   prmIdRubCompAdiant:=qry.Fieldbyname('IDRUBADIANT').AsInteger;
   prmIdRubCredAdiant:=qry.Fieldbyname('IDRUBCREDADIANT').AsInteger;

   // IDENTIFICA SE O SISTEMA VAI TRABALHAR COM O CODIGO E DESCRICAO DA RUBRICA INTERNO OU EXTERNO
   prmFLGUSACODRUBEXT := qry.Fieldbyname('FLGUSACODRUBEXT').asInteger;

   prmFLGUSAPRAZORUB := qry.Fieldbyname('FLGUSAPRAZORUB').asInteger;

   prmFLGATUPERCGF:=qry.FieldByName('FLGATUPERCGF').AsInteger;
   {Indica se o sistema irá atualizar o percentual de grupo }
   {familiar de acordo com o numero de beneficiário ativos. }

   prmFLGVERRUBFOLBEN := qry.FieldByname('FLGVERRUBFOLBEN').asInteger;

   prmFLGVERATIVOS := qry.Fieldbyname('FLGVERATIVOS').asInteger;

   prmIDGRINSTR := qry.Fieldbyname('IDGRINSTR').asInteger;

   {PARAMETROS TEXTO PARA COLOCAR NO INICIO E NO FINAL
     DO ARQUIVO TEXTO DE CONTRA-CHEQUE}
   prmCabecArqCC:=qry.Fieldbyname('CABECARQCC').asstring;
   prmRodapeArqCC:=qry.Fieldbyname('RODAPEARQCC').asstring;

   //PARAMETRO DO PORTADOR FORMA PARA PAGTO VIA PATROCINADORA
   prmPortFormaPatro := qry.FieldbyName('CODPORTFORMAPATRO').AsInteger;

   // Verificar se o parametro de multifundacao está preenchido e a fundacao não existe
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT IDPESSOA FROM FUNDACAO ');
   qry.Open;
   if qry.IsEmpty
   then begin // Nao existe nenhuma fundacao gravada
      if not prmflgMultiFundacao  // Sistema MonoFundacao
      then begin
         if MsgDlg(' O sistema está cadastrado como Mono-Fundação, porém não existe nenhuma fundação cadastrada. '+
                ' Deseja gravar Fundação neste momento ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
         then begin
            // Gravar fundacao
            CadastraFundacao(qry); //Cadastrar EmpresaPropria como fundacao
         end;
      end
      else begin // Sistema MultiFundacao
         MsgDlg('O sistema está cadastrado como Multi-Fundação, porém não existe nenhuma fundação cadastrada. '+
                'É recomendável que as Fundações seja cadastradas neste momento.','Informação',mtInformation,[mbOk,mbHelp],0);
      end;
   end;

   qry.Free;
end;

procedure CadastraFundacao(qry : TwwQuery);
var sNomeEmpresa : string;
begin
   if Sistema.IdEmpresa <= 0
   then begin
      MsgDlg('Empresa Própria não cadastrada como Fundação. Utilize o Cadastro de Fundação.','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;
   if Trim(Sistema.NomeEmpresa) = ''
   then sNomeEmpresa := '[Nome da Fundação]'
   else sNomeEmpresa := Sistema.NomeEmpresa;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT F.IDPESSOA, P.NOME FROM FUNDACAO F, PESSOA P '+
               ' WHERE P.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+' AND '+
               '       P.IDPESSOA = F.IDPESSOA(+)' );
   qry.Open;
   if (qry.IsEmpty) or  (qry.FieldByName('IdPessoa').AsString = '')
   then begin // Empresa nao cadastrada como fundacao
      try
         if qry.IsEmpty // empresa nao existe em pessoa
         then begin
            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add(' INSERT INTO PESSOA(IDPESSOA,NOME,TIPO,RAZAOSOCIAL,FLGFUNDACAO,       '+
                        '             FLGUSUARIO,FLGCONTATO,FLGCOTISTA,FLGCLIENTE, '+
                        '             FLGPATROCINADORA,FLGADMINISTRADORFUNDO,FLGADMINISTRADORA, '+
                        '             FLGEMPRESAEMITENTETITULOS,FLGBANCO,FLGBOLSA,FLGAUTARQUIA, '+
                        '             FLGSINDICATO,FLGOUTRO,FLGRESPONSAVEL,FLGTERCEIRO,FLGFORNSERV,'+
                        '             FLGFUNCIONARIO,FLGINVALIDO,FLGCANDIDATO,FLGESTRANGEIRO, '+
                        '             FLGGESTORFUNDO,FLGAVALISTA,FLGPAGADOR,FLGPRODUTOR, '+
                        '             FLGAVERBADORA,FLGAGENCIA,FLGDEPENDENTE,FLGELEGIVEL)'+
                        ' VALUES ('+IntToStr(Sistema.IdEmpresa)+','''+sNomeEmpresa+''', ''J'','''+
                                      sNomeEmpresa+''',1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)');
            qry.ExecSQL;
         end;
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('INSERT INTO FUNDACAO(IDPESSOA,FLGTIPOPREVIDENC) VALUES('+IntToStr(Sistema.IdEmpresa)+', '''+sTipoPrevidencia+''')');
         qry.ExecSQL;
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('UPDATE PESSOA SET FLGFUNDACAO = 1 WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
         qry.ExecSQL;
      except
         MsgDlg('Erro na gravação da Fundação','Erro',mtError,[mbOk,mbHelp],0);
      end;
   end;
end;

function CalcIdade(dDataNasc : TDateTime) : integer;
begin
 if Trim(FormatDateTime('dd/mm/yyyy', dDataNasc)) = ''
 then Result := 0
 else Result := Trunc((date - dDataNasc) / 365);
end;

{ FUNCOES RELACIONADAS AO SISTEMA DE  REGRA DE NEGOCIO }
function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
begin
   Result := False;
   bErro  := False;
   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      if qryRegra.IsEmpty
      then begin
         qryRegra.Close;
         Exit;
      end;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;

      regraAPrev.Execute;
      if not regraAPrev.Error
      then begin
         if UpperCase(regraAPrev.Result) = 'FALSE'
         then Result := False
         else Result := True;
      end // if not regra.error
      else bErro := True;
      qryRegra.Close;
   end;
end;


function RegraNumerica(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
begin
   Result := '';
   bErro := False;
   with dtmAPrev do
   begin
      regraAprev.IdEmpresa := Sistema.IdEmpresa;
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if qryRegra.IsEmpty
      then begin
         Result := '';
         bErro  := False;
         qryRegra.Close;
         tirasql(qryregra);
         Exit;
      end;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;
      regraAPrev.IdCalculo := piIdCalculo;
      regraAPrev.Execute;
      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;
         Result := OraNumero(regraAPrev.Result);
      end // if not regra.error
      else begin
         bErro := True;
         piIdCalculo := -1;
      end;
      qryRegra.Close;
   end;
end;

//PARA EXECUTAR A REGRA DE REAJUSTE 
function ExecutaRegra(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
begin
   Result := '';
   bErro := False;
   with dtmAPrev do
   begin
      regraAprev.IdEmpresa := Sistema.IdEmpresa;
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if qryRegra.IsEmpty
      then begin
         Result := '';
         bErro  := False;
         qryRegra.Close;
         tirasql(qryregra);
         Exit;
      end;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;
      regraAPrev.IdCalculo := piIdCalculo;
      regraAPrev.Execute;
      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;
         Result := regraAPrev.Result;
      end // if not regra.error
      else begin
         bErro := True;
         piIdCalculo := -1;
      end;
      qryRegra.Close;
   end;
end;

{ Rotinas para tratar meses e anos }
function ProximoAnoMes(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if iMes = 12
  then begin
     sAnoMes := IntToStr(iAno+1)+'/';
     sAnoMes := sAnoMes+'01';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes + 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//ProximoAnoMes

function AnoMesAnterior(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if iMes = 1
  then begin
     sAnoMes := IntToStr(iAno-1)+'/';
     sAnoMes := sAnoMes+'12';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes - 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//AnoMesAnterior

function MesAnoAnterior(iMes, iAno : integer) : string;
var sMesAno : string;
begin
  Result := '';
  if iMes = 1
  then begin
     sMesAno := '12/'+IntToStr(iAno-1);
  end
  else begin
    iMes := iMes - 1;
    if iMes <= 9
    then sMesAno := '0'+IntToStr(iMes)
    else sMesAno := IntToStr(iMes);
    sMesAno := sMesAno+'/'+IntToStr(iAno);
  end;
  Result := sMesAno;
end;//ProximoMesAno


function ProximoMesAno(iMes, iAno : integer) : string;
var sMesAno : string;
begin
  Result := '';
  if iMes = 12
  then begin
     sMesAno := '01/'+IntToStr(iAno+1);
  end
  else begin
    iMes := iMes + 1;
    if iMes <= 9
    then sMesAno := '0'+IntToStr(iMes)
    else sMesAno := IntToStr(iMes);
    sMesAno := sMesAno+'/'+IntToStr(iAno);
  end;
  Result := sMesAno;
end;//ProximoMesAno

function PegaidCheck(chklst : TCheckListBox;chave,nome: string ; var qryaux : TwwQuery ):String;
var marcado,i : integer;
    Volta : String;
begin
   marcado := 0;

   for i := 0 to chklst.Items.Count - 1 do
   begin
         if not chklst.checked[i] then
         continue
         else inc(marcado);
   end;

   Volta := '';
   if marcado = 0 then
   begin
      Result := '';
      Exit;
   end;

   for i := 0 to chklst.Items.Count - 1 do
   begin
      if (not chklst.checked[i]) and ( marcado <> 0) then continue;
      if not  qryaux.Locate(''+Nome+'',chklst.items[i],[]) then
      begin
         continue;
      end
      else
      begin
         Volta := qryaux.fieldbyname(''+chave+'').AsString + ',';
      end;
   end;

   Volta := Copy(Volta,Length(Volta) - 1 ,1);
   Result := Volta;
end;//PegaIdCheck

function RetornaDataCobranca(iDia : integer; sUtil,sAnterior,sMesCorrente,sMesReferencia,sAnoReferencia : string) : String;
var
  sDia, sMesAno, sData, sDiaUtil: string;
  dData: double;
begin
  Result := '';

  try
     if iDia <= 9
     then sDia := '0'+IntToStr(iDia)
     else sDia := IntToStr(iDia);

     if sMesCorrente = 'P'
     then sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
     else sMesAno := sMesReferencia + '/' + sAnoReferencia;
  except
     exit;
  end;
  if (smesReferencia = '02') and (sDia = '30') then sDia := '28';
  
  dData := StrToDate(sDia + '/' + sMesAno);

  if sUtil = 'N' // Dia NORMAL(FIXO) - Ex: se DIA = 5, pega Dia 5 do mes
  then begin
      if DayOfWeek(dData) = 1
      then begin// Se Dia da Semana for Domingo
         if sAnterior = 'A'
         then sData := FormatDateTime('dd/mm/yyyy', dData - 2) // Pegar Dia Anterior. 6a. feira
         else sData := FormatDateTime('dd/mm/yyyy', dData + 1);// Pegar Dia Posterior. 2a feira
      end
      else
         if DayOfWeek(dData) = 7
         then begin// Se Dia da Semana for Sábado
            if sAnterior = 'A'
            then sData := FormatDateTime('dd/mm/yyyy', dData - 1) // Pegar Dia Anterior. 6a. feira
            else sData := FormatDateTime('dd/mm/yyyy', dData + 2);// Pegar Dia Posterior 2a. feira
         end
         else sData := FormatDateTime('dd/mm/yyyy', dData);//Dia da Semana é Dia Útil
  end  //fim - DIA NORMAL(FIXO)
  else begin // DIA UTIL Ex.: se DIA = 5, pega 5° Dia Útil do mes
     sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
     if Length(sDiaUtil) = 1
     then sDiaUtil := '0' + sDiaUtil;
     sData := sDiaUtil + '/' + sMesAno;
  end; //fim - DIA UTIL
  Result := sData;
end;//RetornaDataCobranca

{ Rotina para tratar Dia Útil (DatasPatroPlano) }
function CriticaDataCobrancaAssist(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass ,
                                   sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sDia, sMesAno, sData, sDiaUtil: string;
  dData: double;
begin
  Result := '';

 {Filtra DATASPATROPLANO}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + ' AND ' +
          '       SITFUNDACAO = ''' + sSitFundacao+'''';

  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('As datas de cobrança não estão devidamente cadastradas.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;
          Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}


 {Verifica Data Cobrança Normal}
  if sTipoData = 'N' then //Normal
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBNORMAL').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBNORMAL').AsString
          else
             sDia := qry.FieldByName('DIACOBNORMAL').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Normal}
          if qry.FieldByName('FLGUTILNORMAL').AsString = 'N' then // ex: se DIACOBNORMAL = 5, pega Dia 5 do mes
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORNORMAL').AsString = 'A' then // Pegar Dia Anterior
                             sData := FormatDateTime('dd/mm/yyyy', dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := FormatDateTime('dd/mm/yyyy', dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORNORMAL').AsString = 'A' then // Pegar Dia Anterior
                             sData := FormatDateTime('dd/mm/yyyy', dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := FormatDateTime('dd/mm/yyyy', dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := FormatDateTime('dd/mm/yyyy', dData);
             end
         {Fim - Dia Normal}
          else //FLGUTILNORMAL = U
         {Dia Útil}
             begin // ex: se DIACOBNORMAL = 5, pega 5° Dia Útil do mes}
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data Cobrança Normal}

 {Verifica Data Cobrança em Atraso}
  if sTipoData = 'A' then //Atraso
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBATRASO').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBATRASO').AsString
          else
             sDia := qry.FieldByName('DIACOBATRASO').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBATRASO').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Atraso}
          if qry.FieldByName('FLGUTILATRASO').AsString = 'N' then // ex: se DIACOBATRASO = 5, pega Dia 5
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORATRASO').AsString = 'A' then // Pegar Dia Anterior
                             sData := FormatDateTime('dd/mm/yyyy', dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := FormatDateTime('dd/mm/yyyy', dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORATRASO').AsString = 'A' then // Pegar Dia Anterior
                             sData := FormatDateTime('dd/mm/yyyy', dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := FormatDateTime('dd/mm/yyyy', dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := FormatDateTime('dd/mm/yyyy', dData);
             end
         {Fim - Dia Atraso}
          else //FLGUTILATRASO = U
         {Dia Útil}
             begin // ex: se DIACOBATRASO = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data Cobrança em Atraso}

 {Verifica Data de Devolução}
  if sTipoData = 'D' then //Devolução
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBDEVOLUCAO').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBDEVOLUCAO').AsString
          else
             sDia := qry.FieldByName('DIACOBDEVOLUCAO').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBDEVOLUCAO').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Devolucao}
          if qry.FieldByName('FLGUTILDEVOLUCAO').AsString = 'N' then //ex: se DIACOBDEVOLUCAO = 5, pega Dia 5 do mes
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORDEVOLUCAO').AsString = 'A' then // Pegar Dia Anterior
                             sData := FormatDateTime('dd/mm/yyyy', dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := FormatDateTime('dd/mm/yyyy', dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORDEVOLUCAO').AsString = 'A' then // Pegar Dia Anterior
                             sData := FormatDateTime('dd/mm/yyyy', dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := FormatDateTime('dd/mm/yyyy', dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := FormatDateTime('dd/mm/yyyy', dData);
             end
         {Fim - Dia Devolucao}
          else //FLGUTILDEVOLUCAO = U
         {Dia Útil}
             begin //ex: se DIACOBDEVOLUCAO = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data de Devolução}

//  qry.Free;
  Result := sData;
end;

function CriticaMesCobrancaAssist(qry : TwwQuery; sIdPessJur, sIdPlanoPrev,sIdplanass , sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  AnoMes : string;
begin
  Result := '';

 {Filtra DATASPATROPLANASS}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + '';


  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('As datas de cobrança não estão devidamente cadastradas.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;

          Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}

 {Verifica Data Cobrança Normal}
  if sTipoData = 'N' then //Normal
     begin

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             AnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else  if  qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C' then
             AnoMes := sAnoReferencia + '/' +sMesReferencia
          else
             AnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

     end;
 {Fim - Verifica Data Cobrança Normal}

 {Verifica Data Cobrança em Atraso}
  if sTipoData = 'A' then //Atraso
     begin

         {Mês Posterior}
	  if qry.FieldByName('FLGMESCOBATRASO').AsString = 'P' then
	     AnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else  if  qry.FieldByName('FLGMESCOBATRASO').AsString = 'C' then
             AnoMes := sAnoReferencia + '/' +sMesReferencia
          else
             AnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

     end;
 {Fim - Verifica Data Cobrança em Atraso}


 {Verifica Data de Devolução}
  if sTipoData = 'D' then //Devolução
     begin

         {Mês Posterior}
	  if qry.FieldByName('FLGMESCOBDEVOLUCAO').AsString = 'P' then
             AnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else  if  qry.FieldByName('FLGMESCOBDEVOLUCAO').AsString = 'C' then
             AnoMes := sAnoReferencia + '/' +sMesReferencia
          else
             AnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

     end;
 {Fim - Verifica Data de Devolução}

  Result := AnoMes;

end;

function CriticaMesCobrancaPatro(qry : TwwQuery; sIdPessJur, sIdplanass , sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sAnoMes : string;
begin
  Result := '';

 {Filtra DATASPATROPLANASS}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + '';


  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('Não existe informação com os dados informados.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;

	  Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}

          {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sAnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else  if  qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C' then
	     sAnoMes := sAnoReferencia + '/' +sMesReferencia
          else
             sAnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

  Result := sAnoMes;
end;

{ Rotina que retorna o 'N' Dia Útil do mes }
function DiaUtil(sDiaUtil, sMesAno: string): string;
var
  iDia: integer; // guarda o dia util
  iDiaUtil: integer; // controla o dia util
  dData: double;
begin
  Result := '';
  iDia := 1;
  iDiaUtil := 0;
  while StrToInt(sDiaUtil) <> iDiaUtil do
      begin
           if Length(IntToStr(iDia)) = 1 then
              dData := StrToDate('0' + IntToStr(iDia) + '/' + sMesAno)
	   else
              dData := StrToDate(IntToStr(iDia) + '/' + sMesAno);

           if (DayOfWeek(dData) <> 1) and (DayOfWeek(dData) <> 7)  then // Se Dia da Semana nao for Domingo nem Sabado
               iDiaUtil := iDiaUtil + 1;

           iDia := iDia + 1;
      end;

  Result := IntToStr(iDia - 1);
end;//DiaUtil

function CriticaDataCobrancaSit( qry : TwwQuery;
				 sIdPessJur, sIdPlanoPrev, sSitFundacao : string;
				 sTipoData                              : char;
				 sMesReferencia, sAnoReferencia         : string) : string;
var
  sSql, sAux,
  sTabela,
  sFiltro,
  sData     : string;
  iIdModulo : longint;
begin
  Result := '';

  if sSitFundacao = 'AS'
  then begin
	 sTabela := 'FUNDACAO';
	 sFiltro := ' AND (T.IDPESSOA = ' + sIdPessJur + ')';
	 sAux := 'Fundação';
       end
  else begin
	 sTabela := 'PLANPREVPATRO';
	 sFiltro := ' AND (T.IDPESSJUR = ' + sIdPessJur + ')' +
		    ' AND (T.IDPLANOPREV = ' + sIdPlanoPrev + ')';
	 sAux := 'Patrocinadora';
       end;

  sSQL := ' SELECT CD.IDCALENDARIO, CD.FLGINTERNO,      CD.ANOMESREF, '+
	  '        CD.DATACOBNORMAL, ' +
	  '        CD.DATACOBATRASO,CD.DATACOBDEVOLUCAO,CD.DATAPAGBENEF,' +
	  '        CD.DATAPAGABONO, CD.DATAPAGANTBENEF, CD.DATAPAGANTABONO' +
	  ' FROM   CALENDDATAS CD, ' + sTabela + ' T' +
	  ' WHERE  (CD.FLGINTERNO = ''' + sSitfundacao +''')' +
	  ' AND    (CD.ANOMESREF = ''' + sAnoReferencia + '/' + sMesReferencia + ''')' +
	  sFiltro +
	  ' AND    (T.IDCALENDARIO = CD.IDCALENDARIO)';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
	   MostrarErro(E);
	   qry.Close;
	   Exit;
      end;
  end;
  if qry.IsEmpty
  then begin
     MsgDlg('Não existe calendário associado. Confira o cadastro. ','Informação',mtInformation,[mbOk,mbHelp],0);
     qry.Close;
     Exit;
  end;

  // Verifica Tipo de Cobrança
  case sTipoData of
    'N' : sData := qry.FieldByName('DATACOBNORMAL').AsString;    // Cobrança Normal
    'A' : sData := qry.FieldByName('DATACOBATRASO').AsString;    // Cobrança Atrasada
    'D' : sData := qry.FieldByName('DATACOBDEVOLUCAO').AsString; // Pagamento de Devolução
    'P' : sData := qry.FieldByName('DATAPAGBENEF').AsString;     // Pagamento de Beneficio
    'B' : sData := qry.FieldByName('DATAPAGABONO').AsString;     //  Pagamento de Abono
    'T' : sData := qry.FieldByName('DATAPAGANTBENEF').AsString;  // Pagamento de Antecipacao de Beneficio
    'O' : sData := qry.FieldByName('DATAPAGANTABONO').AsString;  // Pagamento de Antecipacao de Abono
  end;

  Result := sData;
end;//CriticaDataCobrancaSit

function VoltaMesCob(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass , sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql,sMesAno: string;
  dData: double;
begin
  Result := '';

 {Filtra DATASPATROPLANO}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + ' AND ' +
          '       SITFUNDACAO = ''' + sSitFundacao+'''';

  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('Não existe informação com os dados informados.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;
          Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}


         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else
             sMesAno := sMesReferencia + '/' + sAnoReferencia;
         {Fim - Mês Posterior}

          Result := sMesAno;

end;

procedure ExibeQueryRegra(sSQL,sIdRegra : string);
begin
   if not bExibeQuery then Exit;
   with frmTelaAuxRegra do
   begin
      memREGRA.Lines.Clear;
      memRegra.Lines.Add('REGRA : '+sIdRegra);
      memREGRA.Lines.Add(sSQL);
      ShowModal;
   end;
end;

procedure TiraQuery(qryAux : TwwQuery);
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT 1 FROM DUAL');
   qryAux.Open;
end;

function SAnoMesAnterior(sAnoMes : string) : string;
var iAno, iMes : integer;
begin
   Result := '';
   iAno := StrToInt(Copy(sAnoMes,1,4));
   iMes := StrToInt(Copy(sAnoMes,6,2));
   Result := AnoMesAnterior(iMes,iAno);
end;

procedure PedeInfAux(sCaptionForm, sTituloInf1,sMascInf1 : string;  iNumInf : integer;
                     var sValor1 : string );
begin
   with frmPedeInfAux do
   begin
      Caption := sCaptionForm;
      lblTitulo1.Caption := sTituloInf1;
      edInf1.EditMask := sMascInf1+ ';0;_';
      ShowModal;
      sValor1 := edInf1.Text;
   end;
end; //PedeInfAux

function ValorProRataUltimo(psValorIntegral, psDataRefFinal : string) : double;
var dValorDiario,
    dValorSalario  : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefFinal) = '' then Exit;

   // Do inicio do mes até o dia informado
   iNumDiasProRata := StrToInt(Copy(psDataRefFinal,1,2));
   if iNumDiasProRata >= 30
   then iNumDiasProRata := 30;

   iMes := StrToInt(Copy(psDataRefFinal,4,2));
   iAno := StrToInt(Copy(psDataRefFinal,7,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes := 30; // mes comercial

   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

function ValorProRataPrimeiro(psValorIntegral, psDataRefInicio : string) : double;
var dValorDiario,
    dValorSalario   : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefInicio) = '' then Exit;
   // Do dia informado até o final do mes (mes comercial), considerando o dia informado
   iNumDiasProRata := 30 - StrToInt(Copy(psDataRefInicio,1,2));
   iNumDiasProRata := iNumDiasProRata + 1;     
   iMes := StrToInt(Copy(psDataRefInicio,4,2));
   iAno := StrToInt(Copy(psDataRefInicio,7,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes  := 30; // mes comercial

   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

function ValorProRataMes(psValorIntegral, psAnoMesRef, psDataRefInicio, psDataRefFinal : string) : double;
var dValorDiario,
    dValorSalario  : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefFinal)  = '' then Exit;
   if Trim(psDataRefInicio) = '' then Exit;

   if Copy(psDataRefInicio,7,4)+'/'+Copy(psDataRefInicio,4,2) < psAnoMesRef
   then psDataRefInicio := '01/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4);

   if Copy(psDataRefFinal,7,4)+'/'+Copy(psDataRefFinal,4,2) > psAnoMesRef
   then if Copy(psAnoMesRef,6,2) = '02'
        then psDataRefFinal := '28/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4)
        else psDataRefFinal := '30/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4);

   // Do inicio do mes até o dia informado
   iNumDiasProRata := Trunc(StrToDate(psDataRefFinal) - StrToDate(psDataRefInicio) + 1);
    
   if iNumDiasProRata >= 30
   then iNumDiasProRata := 30;

   iMes := StrToInt(Copy(psAnoMesRef,6,2));
   iAno := StrToInt(Copy(psAnoMesRef,1,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes := 30; // mes comercial
   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/02/2005 A 10/02/2005                         |
| VERSÃO PARA LIBERAÇÃO: 3.05.03                                               |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Foi criada uma variável global para guardar o motivo de quitação antecipada|
| na paramaprev, para ser testada na prévia posteriormente.                    |
|------------------------------------------------------------------------------|

| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/05/2002 A 16/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12R                                              |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Eliminação do parametro referente a exclusão de rubricas de pensão         |
|   alimenticia apenas no mes de Janeiro.                                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2002 A 25/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Eliminação do parâmetro PRMIDRUBPALIMINSS e do parâmetro PRMIDRUBDESCPA    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/08/2002 A 07/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Eliminação do parâmetro prmFlgAgrupaFolhaBen.                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/07/2003 A 04/07/2003                         |
| PENDÊNCIA: 14443                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO GERAL DE ROTINAS INTERNAS PARA MULTIFUNDAÇÃO.                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/07/2003 A 30/07/2003                         |
| PENDÊNCIA: 14746                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00b                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Trocar parametro de agrupa rubrica antigo (prmCalcJunto) pelo novo         |
| (Sistema.FLGAGRUPARUBRICA).                                                  |
| A variavel global referente a este parâmetro foi inibida.                    |
|                                                                              |
|------------------------------------------------------------------------------}
