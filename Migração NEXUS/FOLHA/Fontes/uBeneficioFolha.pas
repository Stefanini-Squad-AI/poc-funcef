// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SOL 171522  Kintana 1539190
//Responsável : DOUGLAS DE SIQUEIRA
//Data        : 11/01/2012
//Descrição   : Falha no processo de preparo pois o mesmo não está inserindo o campo VALORHSTBENEFINSS
//              na query de entrada das regras de cálculo do benefício. 
//--------------------------------------------------------------------------------
//Pendência   : SOL 149847/6241 KINTANA 1405080
//Responsável : FERNANDO XAVIER
//Data        : 13/09/2011
//Descrição   : Erro na inserção do motivo de retenção e encerramento.
//--------------------------------------------------------------------------------
//Pendência   : SOL 147427 KINTANA 1055088
//Responsável : BRUNO AZEVEDO
//Data        : 08/12/2010
//Descrição   : Ao desfazer o preparo, atualizar as entidades filtrando pelo seqproposta.
//--------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Pendência   : SOL 150417 Kintana 1092011
// Descricao   : Favor incluir nas Qry encaminhadas por e-mail o IDPLANOORIGEM na rotina do
// preparo e ajustar o erro apresentado quando executado o qry SELECT * FROM calculo
// WHERE idpessoa = 768245 WHERE idcalculo = -1.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 04/01/2010
// Rotina      : ReajustaBenefConc
// Pendência   : SOL 129103 Kintana  705241
// Descricao   : Estava ocorrendo um erro na regra pois a SQL de entrada estava sem o campo
//               DataInicioInss.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 04/01/2010
// Rotina      : ReajustaBenefConc
// Pendência   : SOL 129027
// Descricao   : Favor ajustar a Qry de acerto de benefícios e incluir o campo IDPLANOCONTABIL
//               na Qry de entrada da regra 24424, do preparo de Benefícios.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 22/08/2007
// Rotina      : ReajustaBenefConc
// Pendência   : 25662
// Descricao   : Passa parâmetro de DataInicioFund para regra de reajuste.
//------------------------------------------------------------------------------
//  Autor(a)   : Claudio Faria
//  Rotina     : CriaLogOcorrencia
//  Data       : 21/08/2007
//  Pendencia  : 20934
//  Alteração  : Gravar IdModulo na MOVBENEF.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : ReajustaBenefConc
//  Data       : 20/04/2006
//  Pendencia  : 22121
//  Alteração  : No sql de entrada da regra de reajuste do INSS o campo
//               DATAINICIOINSSANT está sendo passado como '', fazendo com que
//               a regra não identifique este campo na execução.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : ReajustaBenefConc
//  Data       : 15/12/2005
//  Pendencia  : 21039
//  Alteração  : Na rotina de reajuste de benefício, incluir no sql de entrada
//               da regra de reajuste a data de nascimento do participante.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Tratamento de Antecipação de Abono
//  Data       : 13/12/2005
//  Pendencia  : 16732
//  Alteração  : Usar NUMDIASBENEFANT parametrizado na BENEFPLANPREV para
//               determinar a continuidade de benefícios.
//               Esta alteração foi simultanea da 20930 e portanto substituiu esta. 
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 06/12/2005
// Rotina      : BuscaDadosBeneficioAnterior
// Pendência   : 20930
// Descricao   : Buscar o campo NumDiasBenefAnt para saber por qual datafinal
//               buscar o o benefício anterior da pessoa.
//------------------------------------------------------------------------------
unit uBeneficioFolha;

interface

uses sysutils, wwQuery, UDatabase, uParticipanteFB, uAdmPrevFB, daprev, UPCS,
     usistema, UFuncoesUteisFB;

function BuscaDadosBeneficioAnterior ( qry: TwwQuery;
                                       piIdPessJur, piIdPlanoPrev, piIdTitular,
                                       piIdBeneficioAtual,
                                       piFlgReferenciaAtual  : longint;
                                       psDataInicioAtual     : string;
                                       var psDataInicioAnt,
                                           psValorAnt,
                                           psNomeBenefAnt,
                                           psIdTpPagtoAnt,
                                           psUltMesReajAnt,
                                           psFlgBenefMinAnt,
                                           psDataEventoAnt,
                                           psCodBeneficioAnt,
                                           psValorBase1,
                                           psValorBase2,
                                           psValorBase3,
                                           psNumProcINSS        : string; 
                                       pbAlteraDataInicioEValor : boolean ) : boolean;

function VerificaINSSConcedido ( qry : TwwQuery;
                                 piIdPessJur, piIdPlanoPrev, piIdTitular,
                                 piIdPessoa,
                                 piIdBeneficioAtual     : longint;
                                 var psCodBeneficioINSS : string ) : boolean;

function PegaValorIntegral( qryAux              : TwwQuery;
                         piNumeroProcesso,
                         piIdBeneficio,
                         piIdBeneficiario    : longint;
                         psDataInicio        : string ) : double ;

function ExecutaRegraDataPgtoBeneficio( piIdRegra,
                                        piIdPessJur,
                                        piIdPlanoPrev,
                                        piIdTitular,
                                        piSeqProposta,
                                        piIdPessoa,                      
                                        piIdBeneficio      : longint;
                                        prOpcao1,
                                        prOpcao2,
                                        prOpcao3           : double;
                                        psDataEvento,
                                        psDataInicio,
                                        psDataRegistro,
                                        psFlgTpDemissao    : string; // 0 - PID, 1 - PIA
                                        var bErro          : boolean;
                                        var sMsgErro       : string) : string;

function ExecutaRegraElegibilidadeBfciario(qryAux : TwwQuery;
                                   piIDREGRAELEGIBILI,
                                   piIdPessJur, piIdPlanoPrev, piIdTitular,
                                   piIdPessoa,
                                   piSeqProposta, piIdBeneficio : longint;
                                   prOpcao1, prOpcao2, prOpcao3           : double;
                                   psDataEvento, psDataInicio, psDataDemissao  : string;
                                   var bErro : boolean;
                                   var sMsgErro : string;
                                   piFlgTipoINSS       : integer
                                   ) : boolean; 

procedure CriaLogOcorrencia( sIdPlanoprev,
                             sIdPessjur,
                             sIdTitular,
                             sIdBeneficio,
                             sNumProcesso,
                             sIdPessoa,
                             sSeqProposta,
                             sTipoMov,
                             sDataMov,
                             sValorAtual,
                             sValorTotal,
                             sValorCotas,
                             sDataInicio,
                             sDataFinal,
                             sValorAtualAnt,
                             sDataInicioAnt,
                             sDataFinalAnt,
                             sIdSitBenefAnt  : string;
                             iFlgDataPrevAnt : integer;
                             qryAux          : TwwQuery;
                             sMotivo         : String;
                             piIdLote        : longint ); 


function ReajustaBenefConc (qryAux: TwwQuery ;
                            psAnoMesRef,
                            psDataInicio: string;
                            psDataInicioFund: string; 
                            piIdPessJur,
                            piIdPlanoPrev,
                            piIdplanoOrigem, 
                            piIdTitular,
                            piIdPessoa,
                            piIdBeneficio,
                            piNumeroProcesso,
                            piNumBenef            : longint;
                            pdValorEmReal,
                            pdValorBase1,
                            pdValorBase2,
                            pdValorBase3          : double;
                            var bReajustou,
                                pbBenefReferencia : boolean;
                            var sMsgErro          : string;
                            var dValorTotal,
                                dValorSRB,
                                dValorReaj: double;
                            aiflgprovisorio: integer; 
                            arpercprovisorio: real; 
                            aiprazoprovisorio: integer;
                            psDibBenefAnt : String = '';
                            PIDPLANPREVCONTAB : integer = -1): boolean;  // Daniel Begnami SOL 129027

function ExecutaRegraCalculoBeneficio(qryAux: TwwQuery;
                                      piIdRegraCalculo,
                                      piIdRegraCalcReserva,
                                      piIdPessJur,
                                      piIdPlanoPrev,
                                      piIdTitular,
                                      piSeqProposta,
                                      piIdBeneficio,
                                      piNumeroProcesso      : longint;
                                      prOpcao1,
                                      prOpcao2,
                                      prOpcao3              : double;
                                      psSQLBenefAssoc,
                                      psDataEvento,
                                      psDataInicio,
                                      psDataInicioINSS,
                                      psDataInicioPagto,
                                      psDataRequerimento,
                                      psValorInfINSS,
                                      psValorCalcINSS,
                                      psValorReserva        : string;
                                      bBeneficioGrupo       : boolean;
                                      piFlgTipoInss         : integer;
                                      psDataInicioAnt,
                                      psValorBenefAnt,
                                      psVALORBINSSANT1,
                                      psVALORBINSSANT2,
                                      psVALORBINSSANT3      : string;
                                      var bErro             : boolean;
                                      var sMsgErro          : string;
                                      var piIdCalculo       : longInt;
                                      piFlgPossuiAcompINSS  : integer;
                                      prValorSRB            : double;
                                      psIdSitPartAntes,
                                      psIdSitPlanAntes,
                                      psIdSitFuncAntes,
                                      psIdSitPartAtual,
                                      psIdSitPlanAtual,
                                      psIdSitFuncAtual      : string;
                                      var advalorcalc: double;
                                      aiflgprovisorio: integer; 
                                      arpercprovisorio: real; 
                                      aiprazoprovisorio: integer 
                                      ): boolean;

function ExecutaRegraValorTotal(qryAux : TwwQuery;
                                piIdRegraCalculo,
                                piIdPessJur,
                                piIdPlanoPrev,
                                piIdTitular,
                                piIdPessoa, 
                                piSeqProposta,
                                piNumeroProcesso,
                                piIdBeneficio,
                                piNumBenef: longint;
                                prOpcao1,
                                prOpcao2,
                                prOpcao3: double;
                                psSQLBenefAssoc,   psDataEvento,
                                psDataInicio,      psDataInicioINSS,
                                psVlrCalcINSS,     psVlrInfINSS,
                                psDataInicioPagto, psValorReserva      : string;
                                psVALORBINSSANT1,
                                psVALORBINSSANT2,
                                psVALORBINSSANT3                       : string;
                                var bErro                              : boolean;
                                var sMsgErro                           : string;
                                var piIdCalculo                        : longInt;
                                piFlgTipoInss                          : integer;
                                psDataInicioAnt,
                                psValorBenefAnt                        : string;
                                prValorSRB                             : double;
                                var advalorcalc: double;
                                aiflgprovisorio: integer; 
                                arpercprovisorio: real;
                                aiprazoprovisorio: integer 
                                ): boolean;

function ExecutaRegraCalculoBeneficioBfciario(qryAux : TwwQuery;
                                      piIdRegraCalculo,    piIdRegraCalcReserva,
                                      piIdPessJur,         piIdPlanoPrev,
                                      piIdplanoOrigem, 
                                      piIdTitular,         piSeqProposta,
                                      piIdBeneficio,       piNumeroProcesso,
                                      piNumBenef          : longint;
                                      prOpcao1,
                                      prOpcao2,
                                      prOpcao3: double;
                                      psSQLBenefAssoc,     psDataEvento,
                                      psDataInicio,        psDataInicioINSS,
                                      psValorTotal,        psValorInfINSS,
                                      psValorCalcINSS,     psValorReserva      : string;
                                      var bErro                                : boolean;
                                      var sMsgErro                             : string;
                                      var piIdCalculo                          : longInt;
                                      piIdPessoa                               : longint;
                                      psIdDependencia,     psPercentual        : string;
                                      piFlgBenefMin,
                                      piFlgTipoInss: integer;
                                      psDataInicioAnt,
                                      psValorBenefAnt: string;
                                      var advalorcalc: double;
                                      aiflgprovisorio: integer; 
                                      arpercprovisorio: real; 
                                      aiprazoprovisorio: integer 
                                      ): boolean;

function BuscaINSSEmVigor ( qry : TwwQuery;
                            piIdPessJur, piIdPlanoPrev, piIdTitular,
                            piIdPessoa,
                            piIdBeneficioAtual  : longint;
                            psDataInicioAtual    : string;
                            var psValorCalculado, psValorInformado,
                                psDataInicio,     psNumProcINSS,
                                psValorBase1,     psValorBase2,
                                psValorBase3                    : string ) : boolean;

Function  BuscaSituacoesPart(qryAux: TwwQuery; piIdTitular, piIdPlanoPrev,
                             piIdPessJur: Integer; psDataEvento: String;
                             Var sFlgInternoAntes : String;
                             Var sFlgInternoAtual : String;
                             Var sIdSitPartAntes  : String;
                             Var sIdSitPartDepois : String;
                             Var sIdSitPlanAntes  : String;
                             Var sIdSitPlanDepois : String;
                             Var sIdSitFuncAntes  : String;
                             Var sIdSitFuncDepois : String): Boolean;

function PegaBenefMinimo(qryAux : TwwQuery;
                         piIdPessJur,piIdPlanoPrev,piIdTitular,
                         piSeqProposta, piIdBeneficio : longint) : string;


implementation


const sTipoTelaBenef: string = 'AA';

// Tipos de Movimento :
// 0  - Renovacao
// 1  - Reabertura
// 2  - Prorrogacao
// 3  - Retencao
// 4  - Encerramento
// 5  - Desdobramento
// 6  - Reajuste Judicial
// 7  - Concessao
// 8  - Recalculo de Beneficio Provisorio
// 9  - Registro de falecimento de beneficiario
// 10 - Desfazer
// 11 - Liberacao de pagamento integral
// 12 - Liberacao de Beneficio Retido
// 13 - Revisão de Benefícios
procedure CriaLogOcorrencia( sIdPlanoprev,
                             sIdPessjur,
                             sIdTitular,
                             sIdBeneficio,
                             sNumProcesso,
                             sIdPessoa,
                             sSeqProposta,
                             sTipoMov,
                             sDataMov,
                             sValorAtual,
                             sValorTotal,
                             sValorCotas,
                             sDataInicio,
                             sDataFinal,
                             sValorAtualAnt,
                             sDataInicioAnt,
                             sDataFinalAnt,
                             sIdSitBenefAnt  : string;
                             iFlgDataPrevAnt : integer;
                             qryAux          : TwwQuery;
                             sMotivo         : String;
                             piIdLote        : longint ); 
var
  sql,sIdMovBenef : string;
begin
  sIdMovBenef := IntToStr(LeUltRegistro(nil,'MOVBENEF'));

  if Trim(sDataMov) = '' Then
    sDataMov := ' NULL '
  else
    sDataMov := ' TO_DATE('''+sDataMov+''', ''DD/MM/YYYY'')';

  if Trim(sDataInicio) = '' Then
    sDataInicio := ' NULL '
  else
    sDataInicio := ' TO_DATE('''+sDataInicio+''', ''DD/MM/YYYY'')';

  if Trim(sDataFinal) = '' Then
    sDataFinal := ' NULL '
  else
    sDataFinal := ' TO_DATE('''+sDataFinal+''', ''DD/MM/YYYY'')';

  if Trim(sDataInicioAnt) = '' Then
    sDataInicioAnt := ' NULL '
  else
    sDataInicioAnt := ' TO_DATE('''+sDataInicioAnt+''', ''DD/MM/YYYY'')';

  if Trim(sDataFinalAnt) = '' Then
    sDataFinalAnt := ' NULL '
  else
    sDataFinalAnt := ' TO_DATE('''+sDataFinalAnt+''', ''DD/MM/YYYY'')';

  if Trim(sIdSitBenefAnt) = '' Then
    sIdSitBenefAnt := ' NULL ';

  //if Trim(sMotivo) = '' Then  // SOL 149847/6241 KINTANA 1405080
  sMotivo := ' NULL ';

  
  sql := 'INSERT INTO MOVBENEF (IDMOVBENEF,   IDPLANOPREV,    IDPLANOORIGEM, IDPESSJUR,     IDTITULAR, ' +
         '                      IDBENEFICIO,  NUMEROPROCESSO, IDPESSOA,      SEQPROPOSTA,              ' +
         '                      TIPOMOV,      DATAMOV,        VALORATUAL,    VALORTOTAL,               ' +
         '                      VALORCOTAS,   DATAINICIO,     DATAFINAL,     DATAINICIOANT,            ' +
         '                      DATAFINALANT, VALORATUALANT,  IDSITANTERIOR, FLGDATAPREVANT,           ' +
         '                      MOTRETENC,    IDMODULO,       IDLOTEMOV ) '; 

  sql := sql + ' VALUES (' + sIdMovBenef  + ', ' + sIdPlanoprev + ', ' + sIdPlanoprev + ', ' + sIdPessjur   + ', ' + sIdTitular + ', ';

  sql := sql + sIdBeneficio + ', ' + sNumProcesso + ', ' + sIdPessoa    + ', ' + sSeqProposta + ', ';

  sql := sql + sTipoMov                   + ', ' +
               sDataMov                   + ', ' +
               OraNumero(sValorAtual)     + ', ' +
               OraNumero(sValorTotal)     + ', ' +
               OraNumero(sValorCotas)     + ', ' +
               sDataInicio                + ', ' +
               sDataFinal                 + ', ' +
               sDataInicioAnt             + ', ' +
               sDataFinalAnt              + ', ' +
               OraNumero(sValorAtualAnt)  + ', ' +
               sIdSitBenefAnt             + ', ' +
               IntToStr(iFLgDataPrevAnt)  + ', ' +
               sMotivo                    + ', ' + 
               IntToStr(Sistema.IdModulo) + ', ';  

  if piIdLote > 0 Then
    SQL := SQL + IntToStr(piIdLote)
  else
    SQL := SQL + 'NULL';

  SQL := SQL + ')';

  qryaux.close;
  qryaux.SQL.clear;
  qryaux.sql.Add(sql);
  qryaux.ExecSQL;
end;

function PegaValorIntegral( qryAux            : TwwQuery;
                            piNumeroProcesso,
                            piIdBeneficio,
                            piIdBeneficiario  : longint;
                            psDataInicio      : string ) : double ;
var sAnoMes : string;
begin
   if Trim(psDataInicio) = '' then psDataInicio:=DateToStr(date);

   sAnoMes:=Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2);
   Result:=0;

   // Se o idbeneficio = -1, entao pegar de todos os beneficios do processo
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT H.IDBENEFICIO, MAX(H.VALORINTEGRAL) AS VALORINTEGRAL  '+
              ' FROM   HSTBENEFBFCIARIO H, BENEFPLANPREV BP '+
              ' WHERE  H.IDPESSOA       = '+IntToStr(piIdBeneficiario)+
              ' AND    H.MESREFERENCIA = '''+sAnoMes+'''');
      if piIdBeneficio > 0 
      then SQL.Add(' AND    H.IDBENEFICIO    = '+IntToStr(piIdBeneficio) );
      SQL.Add(' AND    H.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso) +
              ' AND    BP.IDPLANOPREV   = H.IDPLANOPREV '+
              ' AND    BP.IDBENEFICIO   = H.IDBENEFICIO '+
              ' AND    BP.FLGREFERENCIA = 0             '+
              ' GROUP BY H.IDBENEFICIO                  ');

      Open;

      if (not IsEmpty) and (FieldByName('VALORINTEGRAL').AsFloat > 0)
      then begin
         First;
         while not Eof do
         begin
            Result:=Result + FieldByName('VALORINTEGRAL').AsFloat;
            Next;
         end;
         Close;
         Exit;
      end
   end;

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT VALORATUAL '+
              ' FROM   BENEFBFCIARIO '+
              ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
              ' AND    IDPESSOA       = '+IntToStr(piIdBeneficiario)+
              ' AND    IDBENEFICIO    = '+IntToStr(piIdBeneficio) );
      Open;
      if (not IsEmpty) and (FieldByName('VALORATUAL').AsFloat > 0)
      then Result:=FieldByName('VALORATUAL').AsFloat;
      Close;
   end;
end;

function BuscaDadosBeneficioAnterior ( qry: TwwQuery;
                                       piIdPessJur, piIdPlanoPrev, piIdTitular,
                                       piIdBeneficioAtual,
                                       piFlgReferenciaAtual  : longint;
                                       psDataInicioAtual    : string;
                                       var psDataInicioAnt,
                                           psValorAnt,
                                           psNomeBenefAnt,
                                           psIdTpPagtoAnt,
                                           psUltMesReajAnt,
                                           psFlgBenefMinAnt,
                                           psDataEventoAnt,
                                           psCodBeneficioAnt,
                                           psValorBase1,
                                           psValorBase2,
                                           psValorBase3,
                                           psNumProcINSS        : string;
                                           pbAlteraDataInicioEValor : boolean ) : boolean;
var iNumeroProcessoEncontrado : longint;
    dValorIntegral,
    dValorTotal               : double;
    psDataInicioAtualDB2      : String ;
    qryAux2: twwquery;
    linumdiasbenefant: integer; 
begin
  Result:=False;
  try
    qryAux2:=twwquery.Create(qry.owner);
    qryAux2.Databasename:=qry.DatabaseName;
  except
    exit;
  end;

  //PEGA O NÚMERO DE DIAS PARA O BENEFÍCIO CORRENTE
  try
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT NUMDIASBENEFANT '+
                 'FROM BENEFPLANPREV '+
                 'WHERE (IDPLANOPREV = '+IntToStr(piIdPLANOPREV)+')'+
                 'AND (IDBENEFICIO = '+IntToStr(piIdBeneficioAtual)+')');
    qry.Open;
    linumdiasbenefant:=qry.fieldbyname('NUMDIASBENEFANT').asinteger;
  except
    linumdiasbenefant:=0;
  end;

  try
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add('SELECT P.DTEVENTO, P.NUMEROPROCESSO, BP.FLGREFERENCIA, '+
                        'BF.IDBENEFICIO, BF.DATAINICIO, BF.NUMPROCINSS, '+
                        'BF.IDTPPAGTOBENEFIC, BF.FLGBENEFMIN, BF.ULTMESREAJUSTE, '+
                        'BF.VALORATUAL, B.NOME, BPP.VALORBASE1, BPP.VALORBASE2, '+
                        'BPP.VALORBASE3 '+
                 'FROM PROCESSOBENEF P, BENEFPLANOPART BPP, BENEFBFCIARIO BF, '+
                      'BENEFPLANPREV BP, BENEFICIO B '+
                 'WHERE (BF.IDPESSJUR = '+IntToStr(piIdPessJur)+')'+
                 'AND (BF.IDPLANOPREV = '+IntToStr(piIdPLANOPREV)+')'+
                 'AND (BF.IDPESSOA = '+IntToStr(piIdTitular)+')'+
                 'AND (BF.IDTITULAR = '+IntToStr(piIdTitular)+')'+
                 'AND (BF.IDBENEFICIO <> '+IntToStr(piIdBeneficioAtual)+')'+
                 'AND (BF.DATAINICIO <= TO_DATE('''+psDataInicioAtual+''',''DD/MM/YYYY''))');

     //TRATAR NÚMERO DE DIAS ENTRE OS BENEFÍCIO
     // ESTA ROTINA DEVE IDENTIFICAR BENEFICIO ANTERIOR DE CONVERSAO.
     // PORTANTO A DATA FINAL DO BENEFICIO ANTERIOR DEVE SER UM DIA ANTES
     // DA DATA INICIO DO BENEFICIO A SER REQUERIDO/CONCEDIDO
     if linumdiasbenefant = 0 then
       linumdiasbenefant:=1;
     psDataInicioAtualDB2:=DateToStr((StrToDate(psDataInicioAtual) - linumdiasbenefant)) ;
     qry.SQL.Add('AND ((BF.DATAFINAL >= TO_DATE('''+(psDataInicioAtualDB2)+''',''DD/MM/YYYY'') ) '+
                 ' OR (BF.DATAFINAL = TO_DATE('''+psDataInicioAtual+''',''DD/MM/YYYY'') )  ');
     if sTipoTelaBenef = 'SI' then
       qry.SQL.Add(' OR (BF.DATAFINAL IS NULL ) ');
     qry.SQL.Add(' ) '+
             ' AND (BF.IDPLANOPREV     = BP.IDPLANOPREV)   '+
             ' AND (BF.IDBENEFICIO     = BP.IDBENEFICIO)   '+
             ' AND (BF.NUMEROPROCESSO  = P.NUMEROPROCESSO) '+
             ' AND (BP.FLGREFERENCIA   = '+IntToStr(piFlgReferenciaAtual)+')'+
             ' AND (BP.IDBENEFICIO     = B.IDBENEFICIO)  '+
             ' AND (BPP.IDPESSJUR(+)   = BF.IDPESSJUR)   '+
             ' AND (BPP.IDPLANOPREV(+) = BF.IDPLANOPREV) '+
             ' AND (BPP.IDPESSOA(+)    = BF.IDPESSOA)    '+
             ' AND (BPP.SEQPROPOSTA(+) = BF.SEQPROPOSTA) '+
             ' AND (BPP.IDBENEFICIO(+) = BF.IDBENEFICIO) '+
             ' ORDER BY BF.DATAINICIO DESC ' );
     qry.Open;
     if not qry.IsEmpty then
     begin
       if pbAlteraDataInicioEValor or (sTipoTelaBenef = 'SI') then
       begin
         psDataInicioAnt:=qry.FieldByName('DATAINICIO').asString;
         psDataEventoAnt:=qry.FieldbyName('DTEVENTO').AsString;
         psValorAnt:=OraNumero(qry.FieldByName('VALORATUAL').asString);
         dValorTotal:=qry.FieldByName('VALORATUAL').AsFloat;
         
         dValorIntegral:=PegaValorIntegral( qryAux2,
                                               qry.FieldByName('NumeroProcesso').AsInteger,
                                               qry.FieldByName('IdBeneficio').AsInteger,
                                               piIdTitular,
                                               psDataInicioAtual);
       end;
       psNomeBenefAnt:=qry.FieldbyName('NOME').AsString;
       psIdTpPagtoAnt:=qry.FieldbyName('IDTPPAGTOBENEFIC').AsString;
       psUltMesReajAnt:=qry.FieldbyName('ULTMESREAJUSTE').AsString;
       psFlgBenefMinAnt:=qry.FieldbyName('FLGBENEFMIN').AsString;
       psCodBeneficioAnt:=qry.FieldbyName('IDBENEFICIO').AsString;
       psValorBase1:=qry.FieldbyName('VALORBASE1').AsString;
       psValorBase2:=qry.FieldbyName('VALORBASE2').AsString;
       psValorBase3:=qry.FieldbyName('VALORBASE3').AsString;
       psNumProcINSS:=qry.FieldbyName('NUMPROCINSS').AsString;
       if pbAlteraDataInicioEValor then
       begin
         iNumeroProcessoEncontrado:=qry.FieldbyName('NUMEROPROCESSO').AsInteger;
         qry.Next;
         while not qry.Eof do
         begin
           if (qry.FieldbyName('NumeroProcesso').AsInteger = iNumeroProcessoEncontrado) and
              (qry.FieldbyName('FLGREFERENCIA').AsInteger  = piFlgReferenciaAtual) then
           begin
             dValorTotal:=dValorTotal + qry.FieldByName('VALORATUAL').AsFloat;
             
             dValorIntegral:=dValorIntegral+
               PegaValorIntegral( qryAux2,
                 qry.FieldByName('NumeroProcesso').AsInteger,
                 qry.FieldByName('IdBeneficio').AsInteger,
                 piIdTitular,
                 psDataInicioAtual);
           end;
           qry.Next;
         end;
         
         if dvalorintegral > 0 then
           psValorAnt:=OraNumero(FloatToStr(dvalorintegral))
         else
           psValorAnt:=OraNumero(FloatToStr(dValorTotal));
       end;
     end
     else
     begin
       if pbAlteraDataInicioEValor then
       begin
         psDataInicioAnt:='';
         psValorAnt:='0';
         psDataEventoAnt:='';
       end;
       psNomeBenefAnt:='';
       psIdTpPagtoAnt:='';
       psUltMesReajAnt:='';
       psFlgBenefMinAnt:='';
       psCodBeneficioAnt:='';
       psValorBase1:='0';
       psValorBase2:='0';
       psValorBase3:='0';
       psNumProcINSS:='';
     end;
     qry.Close;
  finally
    qryAux2.free;
  end;
  Result:=True;
end;

function VerificaINSSConcedido ( qry : TwwQuery;
                                 piIdPessJur, piIdPlanoPrev, piIdTitular,
                                 piIdPessoa,
                                 piIdBeneficioAtual  : longint;
                                 var psCodBeneficioINSS : string ) : boolean;
begin
   Result:=False;
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT B.CODBENEFICIO, BF.DATAINICIO,BF.IDBENEFICIO,BF.VALORATUAL,BF.IDTPPAGTOBENEFIC,BF.FLGBENEFMIN, '+
              '        BF.VALORATUAL, B.NOME '+
              ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP, BENEFICIO B '+
              ' WHERE  (BF.IDPESSJUR      = '+IntToStr(piIdPessJur)     +')'+
              ' AND    (BF.IDPLANOPREV    = '+IntToStr(piIdPLANOPREV)   +')'+
              ' AND    (BF.IDPESSOA       = '+IntToStr(piIdPessoa)      +')'+
              ' AND    (BF.IDTITULAR      = '+IntToStr(piIdTitular)     +')'+
              ' AND    (BF.IDBENEFICIO    <> '+IntToStr(piIdBeneficioAtual)+')'+
              ' AND    (BF.IDSITBENEFICIO IN(1,4) )             '+
              ' AND    (BF.IDPLANOPREV    = BP.IDPLANOPREV) '+
              ' AND    (BF.IDBENEFICIO    = BP.IDBENEFICIO) '+
              ' AND    (BP.FLGREFERENCIA  = 1)              '+
              ' AND    (BP.IDBENEFICIO    = B.IDBENEFICIO)  ');
      Open;
      psCodBeneficioINSS:='';
      if not IsEmpty
      then Result:=True;

      psCodBeneficioINSS:=FieldByName('CODBENEFICIO').AsString;
      Close;
   end;
end; // VerificaINSSConcedido

function ExecutaRegraElegibilidadeBfciario( qryAux : TwwQuery;
                                            piIDREGRAELEGIBILI,
                                            piIdPessJur, piIdPlanoPrev, piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta, piIdBeneficio : longint;
                                            prOpcao1, prOpcao2, prOpcao3           : double;
                                            psDataEvento, psDataInicio, psDataDemissao  : string;
                                            var bErro : boolean;
                                            var sMsgErro : string;
                                            piFlgTipoINSS       : integer) : boolean; 
var sSQLDataDemissao,
    sDataInscFund,
    sDataInicio,
    sSQL,
    sDataRef : string;
    bConcedeBeneficio : boolean;
    // DADOS DO BENEFICIO ANTERIOR
    sDataInicioAnt,
    sValorAnt,
    sNomeBenefAnt,
    sIdTpPagtoAnt,
    sUltMesReajAnt,
    sFlgBenefMinAnt,
    sDataEventoAnt,
    sCodBeneficioAnt,
    sNumProcINSS, 
    sCodBeneficioINSS,
    sValorBase1Ant, sValorBase2Ant, sValorBase3Ant : string;
    piFlgINSSConcedido : word;
begin
  if piIDREGRAELEGIBILI <= 0 then
  begin
    Result:=True;
    Exit;
  end;

  Result:=False;
  sDataInscFund:=CalcDataInscFund(piIdPessJur, piIdPlanoPrev, piIdTitular, piSeqProposta, qryAux);

  if Trim(psDataEvento) = '' then psDataEvento:=DateToStr(date);
  if Trim(psDataInicio) = '' then psDataInicio:=DateToStr(date);
  sDataInicio:=psDataInicio;
  sDataRef:=psDataEvento;

  // Verificar se algum benefício do INSS está requerido
  if VerificaINSSConcedido ( qryAux,
                             piIdPessJur, piIdPlanoPrev, piIdTitular, piIdPessoa,
                             piIdBeneficio,sCodBeneficioINSS ) then
    piFlgINSSConcedido:=1
  else
    piFlgINSSConcedido:=0;


  if psDataDemissao = '' then
    sSQLDataDemissao:='EL.DATADEMISSAO '
  else
    sSQLDataDemissao:=''''+Trim(psDataDemissao)+''' AS DATADEMISSAO ';

  BuscaDadosBeneficioAnterior ( qryAux,
                                piIdPessJur, piIdPlanoPrev, piIdTitular,
                                piIdBeneficio,
                                0, // flgreferencia
                                psDataInicio,
                                sDataInicioAnt,
                                sValorAnt,
                                sNomeBenefAnt,
                                sIdTpPagtoAnt,
                                sUltMesReajAnt,
                                sFlgBenefMinAnt,
                                sDataEventoAnt,
                                sCodBeneficioAnt,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant,
                                sNumProcINSS, 
                                true);

  sSQL:=' SELECT  PF.DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL, PP.DTINICIOINSC,  '+
          ' EL.TEMPONAOCREDITADO, EL.DATAADMISSAO, EL.IDSITFUNC, '+
          ' EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, DE.FLGBENEFICIARIO, '+
          ' EL.TEMPOSERVTOTAL,    EL.DATADEMISSAO, '+
          ' EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          ' PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO, '+
          ' PP.IDSITPART AS IDSITPARTATUAL, PP.IDSITPLANOPREV AS IDSITPLANOATUAL, '+
          ' PP.IDSITPART, PP.IDSITPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA, '+
          ' PP.IDPESSJUR,  PP.IDPLANOPREV,  PP.INSCRICAODATA,SP.FLGINTERNO, '+
          ' BF.IDTITULAR, PP.SALPARTICIPACAO, '+
          ' BF.IDDEPENRESPON, BF.IDRESPONSAVEL, BF.PERCENTUAL, '+
          ' BF.PRIORIDADE, '+
          ' DE.IDDEPENDENCIA, D.IDSITDEPENDENTE, DE.IDTITULAR, '+
          sSQLDataDemissao+','+
          '''' + Trim(sDataInicio)    + ''' AS DATAINICIO, '+
          '''' + Trim(psDataEvento)   + ''' AS DATAEVENTO, '+
          '''' + Trim(psDataEvento)   + ''' AS DTEVENTO, '+
          '''' + sDataInscFund        + ''' AS INSCRICAODATAFUND, '+
          '''' + sDataRef             + ''' AS DATAREF, '+
          IntToStr(piFlgTipoINSS)     + ' AS FLGTIPOINSS, '+
          IntToStr(piFlgINSSConcedido)+ ' AS FLGINSSCONCEDIDO, '+
          ''''+sCodBeneficioINSS         + '''   AS CODBENEFICIOINSS, '+
          OraNumero(FloatToStr(prOpcao1))+ ' AS VALORBASE1, '+
          OraNumero(FloatToStr(prOpcao2))+ ' AS VALORBASE2, '+
          OraNumero(FloatToStr(prOpcao3))+ ' AS VALORBASE3, '+
          ''''+    sIdTpPagtoAnt           +''' AS IDTPPAGTOANT, '+ 
          ''''+    sUltMesReajAnt          +''' AS ULTMESREAJANT, '+ 
          ''''+    sFlgBenefMinAnt         +''' AS FLGBENEFMINANT, '+
          '''' +   Trim(sDataEventoAnt)    +''' AS DATAEVENTOANT, '+
          '''' +   Trim(sCodBeneficioAnt)  +''' AS CODBENEFICIOANT, '+ 
          '''' +   Trim(sDataInicioAnt)   +''' AS DATAINICIOANT, '+ 
          OraNumero(sValorAnt)       +' AS VLBENEFPGTO, '+ 
          OraNumero(sValorAnt)       +' AS VALORBENEFANT '+ 
          ' FROM ELEGPATRO EL, DEPENTIT DE, PESSOAFISICA PF, '+
               ' PARTPREVPLAN PP, SITPART SP, BFCIARIOTITPLAN BF, '+
               ' DEPENDENTE D '+
          ' WHERE PP.IDPESSOA = ' + IntToStr(piIdTitular)   + ' AND '+
                ' PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND '+
                ' PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND '+
                ' PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND '+
                ' DE.IDPESSOA    = ' + IntToStr(piIdPessoa )   + ' AND '+
                ' BF.IDBENEFICIO = ' + IntToStr(piIdBeneficio) + ' AND '+
                ' DE.IDPESSOA    = D.IDPESSOA AND '+
                ' EL.IDPESSOA  = PP.IDPESSOA  AND '+
                ' EL.IDPESSJUR = PP.IDPESSJUR AND '+
                ' SP.IDSITPART = PP.IDSITPART AND '+
                ' DE.IDTITULAR = EL.IDPESSOA  AND '+
                ' DE.IDPESSOA  = PF.IDPESSOA(+) AND '+
                ' BF.IDPESSOA  = DE.IDPESSOA AND '+
                ' BF.IDTITULAR = DE.IDTITULAR AND '+
                ' BF.IDPLANOPREV = PP.IDPLANOPREV AND '+
                ' BF.IDPESSJUR  = PP.IDPESSJUR ';

  bConcedeBeneficio:=RegraBooleana(IntToStr(piIDREGRAELEGIBILI) ,sSQL , bErro);

  if bErro then
  begin
    bErro:=True;
    sMsgErro:=' Ocorreu um erro na Regra de Elegibilidade do Benefício (nº '+IntToStr(piIDREGRAELEGIBILI)+') ';
    Result:=False;
    Exit;
  end;

  sMsgErro:=' ';
  Result:=bConcedeBeneficio;
end; // ExecutaRegraElegibilidadeBfciario

function ExecutaRegraDataPgtoBeneficio( piIdRegra,
                                        piIdPessJur,
                                        piIdPlanoPrev,
                                        piIdTitular,
                                        piSeqProposta,
                                        piIdPessoa,                      
                                        piIdBeneficio      : longint;
                                        prOpcao1,
                                        prOpcao2,
                                        prOpcao3           : double;
                                        psDataEvento,
                                        psDataInicio,
                                        psDataRegistro ,
                                        psFlgTpDemissao    : string;
                                        var bErro          : boolean;
                                        var sMsgErro       : string) : string;
var sSQL : string;
begin
  Result:='';
  if piIdRegra <= 0 then
    Exit;

  bErro:=False;
  if Trim(psDataInicio)   = '' then
    psDataInicio:=DateToStr(date);
  if Trim(psDataRegistro) = '' then
    psDataRegistro:=DateToStr(date);
  if Trim(psDataEvento)   = '' then
    psDataEvento:=DateToStr(date);

  sSQL:=' SELECT PF.DATANASC, PF.SEXO, EL.DATAADMISSAO, EL.DATADEMISSAO, EL.TEMPOSERVANTERIOR, ' +
          '        PP.IDPESSOA AS IDTITULAR, BE.IDREGRAINICIO, PP.INSCRICAODATA,                 ' +
          '        PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDSITPART, PP.IDSITPLANOPREV, EL.IDSITFUNC,  ' +
          '        EL.TEMPOSERVTOTAL, PP.DTINICIOINSC, EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA,   ' +
          '        D.IDSITDEPENDENTE, DP.IDDEPENDENCIA,                                          ' + 
                   '''' + psDataRegistro + '''' + ' AS DTREGISTRO, ' +
                   '''' + psDataEvento   +''''+' AS DATAEVENTO, '+
                   '''' + psDataEvento   +''''+' AS DATAREF, '+
                   '''' + psDataInicio   +''''+' AS DATAINICIO, '+
                   '''' + psDataEvento   +''''+' AS DATAMORTE, '+
                   OraNumero(FloatToStr(prOpcao1))+ ' AS VALORBASE1, '+
                   OraNumero(FloatToStr(prOpcao2))+ ' AS VALORBASE2, '+
                   OraNumero(FloatToStr(prOpcao3))+ ' AS VALORBASE3,  '+
                   '''' + psFlgTpDemissao+''''+' AS FLGTPDEMISSAO    '+
          ' FROM PESSOAFISICA PF, DEPENDENTE D, DEPENTIT DP, ELEGPATRO EL, PARTPREVPLAN PP, BENEFPLANPREV BE ' +
          ' WHERE PP.IDPESSOA    = ' + IntToStr(piIdTitular)   + ' AND ' +
          '       PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND ' +
          '       PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND ' +
          '       PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND ' +
          '       PF.IDPESSOA    = PP.IDPESSOA                     AND ' +
          '       PP.IDPESSOA    = EL.IDPESSOA                     AND ' +
          '       PP.IDPESSJUR   = EL.IDPESSJUR                    AND ' +
          '       PP.IDPLANOPREV = BE.IDPLANOPREV                  AND ' +
          '       DP.IDTITULAR   = PP.IDPESSOA                     AND ' +
          '       DP.IDPESSOA    = '+IntToStr(piIdPessoa)+'        AND ' + 
          '       D.IDPESSOA     = DP.IDPESSOA                     AND ' +
          '       BE.IDBENEFICIO = ' + IntToSTr(piIdBeneficio);

  with dtmAPrev do
  begin
    regraAPrev.RuleName:=IntToStr(piIdRegra);
    qryRegra.Close;
    qryRegra.SQL.Clear;
    qryRegra.SQl.Add(sSQL);
    try
      qryRegra.Open;
    except
      bErro:=True;
      sMsgErro:='Erro na leitura dos dados para a Regra de Cálculo da Data de Pagamento do Benefício. ';
      Result:='';
      Exit;
    end;
    if qryRegra.IsEmpty then
    begin
      qryRegra.Close;
      bErro:=True;
      sMsgErro:='Não existem dados para a Regra de Cálculo da Data de Pagamento do Benefício. ';
      Result:='';
      Exit;
    end;

    regraAPrev.QueryIn:=dtmAPrev.qryRegra;
    regraAPrev.Execute;
    qryRegra.Close;
    if regraAPrev.Error then
    begin
      bErro:=True;
      sMsgErro:='Ocorreu um erro na Regra de Cálculo da Data de Pagamento do Benefício (nº '+
                IntToStr(piIdRegra);
      Result:='';
      Exit;
    end;

    try
      StrToDate(regraAPrev.Result);
    except
      bErro:=True;
      sMsgErro:='O resultado retornado pela regra nº '+IntToStr(piIdRegra)+
                  ' não é uma data válida. ';
      Result:='';
      Exit;
    end;
    bErro:=False;
    sMsgErro:='';
    Result:=regraAPrev.Result;
  end; //with

end; // ExecutaRegraDataPgtoBeneficio

function ReajustaBenefConc(qryAux: TwwQuery ;
                           psAnoMesRef ,
                           psDataInicio: string;
                           psDataInicioFund: string; 
                           piIdPessJur,
                           piIdPlanoPrev,
                           piIdplanoOrigem, 
                           piIdTitular,
                           piIdPessoa,
                           piIdBeneficio,
                           piNumeroProcesso,
                           piNumBenef: longint;
                           pdValorEmReal,
                           pdValorBase1,
                           pdValorBase2,
                           pdValorBase3: double;
                           var bReajustou,
                               pbBenefReferencia : boolean;
                           var sMsgErro: string;
                           var dValorTotal,
                               dValorSRB,
                               dValorReaj: double;
                           aiflgprovisorio: integer; 
                           arpercprovisorio: real; 
                           aiprazoprovisorio: integer;
                           psDibBenefAnt : String = '';
                           PIDPLANPREVCONTAB : integer = -1): boolean;   //Daniel Begnami SOL 129027
var sSQL,
    sIdRegraReajuste,
    sValorBeneficio : string;

    sUltMesReajuste, 
    sDataInicioAnt,        sValorAnt,          sNomeBenefAnt,
    sIdTpPagtoAnt,         sUltMesReajAnt,     sFlgBenefMinAnt,
    sDataEventoAnt,        sCodBeneficioAnt,
    sValorBase1Ant, sValorBase2Ant,  sValorBase3Ant,
    sValorBase1, sValorBase2, sValorBase3,
    sNumProcINSS,
    sDataEvento,
    sValorTotal,
    sValorSRB: string;
    dValorTotalReajustado,
    dValorRateadoReajustado: double;

    rbenef, dValorAux: double;
    bReajustaSRB: boolean;
    sIdSitPartAntes,
    sIdSitPlanAntes,
    sIdSitFuncAntes,
    sIdSitPartAtual,
    sIdSitPlanAtual,
    sIdSitFuncAtual  : string;
    bPossuiReajusteINSS : boolean; // Variavel para controlar, quando for suplementacao,
                                   // se o INSS correspondente foi reajustado

    sVlrInfInss,
    sVlrCalcInss : String;

    
    iflgbenefmin: integer;

    bretornoerro: boolean;

    sVlrInfInssDib,sVlrCalcInssDib : String;
    sVlrPercentual : string; 
    sFlgBenefMinimo: string;

    sDIBSupl: string; 
    sDataInicioAntINSS,
    sValorAntINSS,
    sNomeBenefAntINSS,
    sIdTpPagtoAntINSS,
    sUltMesReajAntINSS,
    sFlgBenefMinAntINSS,
    sDataEventoAntINSS,
    sCodBeneficioAntINSS,
    sValorBase1AntINSS,
    sValorBase2AntINSS,
    sValorBase3AntINSS,
    sNumProcAntINSS          : string; 
    sValorInssTemp : String; 
    breajustacalcinss: boolean; 
    rvalorcalcinssreaj: real; 
    rvalorcalcinss: real; 
    iIdMostraRegraResultZero, 
    iIdMostraRegraCalcValTotal : Integer; 
    lbFlgPagaINSS: boolean; 
    lbRecalculo: boolean; 
begin
  breajustacalcinss:=TRUE;
  iIdMostraRegraResultZero := 0; 
  dValorReaj:=pdValorEmReal;
  result:=true;
  sMsgErro:=' ';
  bReajustou:=False;
  lbRecalculo:=false; 

  BuscaDadosBeneficioAnterior(qryAux,
                              piIdPessJur,
                              piIdPlanoPrev,
                              piIdTitular,
                              piIdBeneficio,
                              0,
                              psDataInicio,
                              sDataInicioAnt,
                              sValorAnt,
                              sNomeBenefAnt,
                              sIdTpPagtoAnt,
                              sUltMesReajAnt,
                              sFlgBenefMinAnt,
                              sDataEventoAnt,
                              sCodBeneficioAnt,
                              sValorBase1Ant, sValorBase2Ant, sValorBase3Ant, 
                              sNumProcINSS,
                              True);

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT FLGREFERENCIA, '+
                         'FLGPAGAINSS '+ 
                 ' FROM   BENEFPLANPREV '+
                 ' WHERE  IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                 ' AND    IDBENEFICIO = '+IntToStr(piIdBeneficio) );
  qryAux.Open;
  lbFlgPagaINSS:=false; 
  if qryAux.IsEmpty then
    Exit
  else
  
  begin
    pbBenefReferencia:=qryAux.FieldByName('FLGREFERENCIA').AsInteger = 1;
    lbFlgPagaINSS:=qryAux.FieldByName('FLGPAGAINSS').AsInteger = 1;
  end;
  qryAux.Close;
  qryAux.SQL.Clear;
  if pbBenefReferencia then
    qryAux.SQL.Add(' SELECT IDRGREAJ      '+
                   ' FROM   REAJINSS      '+
                   ' WHERE  MESREAJ     = '''+psAnoMesRef+'''')
  else
    qryAux.SQL.Add(' SELECT IDRGREAJ, FLGREAJSRB      '+ 
                   ' FROM   REAJBENEFICIO '+
                   ' WHERE  MESREAJ     = '''+psAnoMesRef+''''+
                   ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                   ' AND    IDBENEFICIO = '+IntToSTr(piIdBeneficio));
  qryAux.Open;
  bPossuiReajusteINSS:=False;

  // Se nao encontrar é porque nao houve reajuste no mes em questao
  if qryAux.IsEmpty then
  begin
    if pbBenefReferencia then
      Exit;
    // Se for um beneficio de suplementacao, verificar se o INSS foi reajustado
    //   Se sim, entao o beneficio deve ser recalculado para considerar este novo valor

    qryAux.Close;
    qryAux.SQl.Clear;
    qryAux.SQL.Add(' SELECT IDRGREAJ      '+
                   ' FROM   REAJINSS      '+
                   ' WHERE  MESREAJ     = '''+psAnoMesRef+'''');
    qryAux.Open;
    if not qryAux.IsEmpty then
      bPossuiReajusteINSS:=True
    else
      Exit;
  end
  else
  begin
    // Se encontar mas a regra estiver em branco, considerar que nao houve reajuste
    if qryAux.FieldByName('IdRgReaj').AsString = ''  then
      Exit;
    sIdRegraReajuste:=qryAux.FieldByName('IdRgReaj').AsString;

    if pbBenefReferencia then
      bReajustaSRB:=False
    else
      if qryAux.FieldByName('FLGREAJSRB').AsInteger = 1 then
        bReajustaSRB:=True
      else
        bReajustaSRB:=False;
      
      // Se for beneficio de referencia, buscar DIB da suplementacao para passar
      // na query da regra
      if pbBenefReferencia then
      begin
        qryAux.Close;
        qryAux.SQl.Clear;
        qryAux.SQL.Add(' SELECT BF.DATAINICIOFUND           '+
                       ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP, BENEFICIO B '+
                       ' WHERE  BF.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                       ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                       ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)+
                       ' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)+
                       ' AND    BF.IDSITBENEFICIO IN (1,2,6) '+ 
                       ' AND    BP.IDPLANOPREV    = BF.IDPLANOPREV '+
                       ' AND    BP.IDBENEFICIO    = BF.IDBENEFICIO '+
                       ' AND    BP.FLGREFERENCIA  = 0              '+
                       ' AND    B.IDBENEFICIO     = BP.IDBENEFICIO ');
        qryAux.Open;
        if qryAux.IsEmpty then
          sDIBSupl := '          '
        else
          sDIBSupl := qryAux.FieldbyName('DATAINICIOFUND').AsString;
      end;
   end;

   if sDIBSupl = '' then
     sDIBSupl := '          ';

  // Buscar VALORES DO SRB E INSS DO HISTORICO para passar para a regra
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT BF.ULTMESREAJUSTE, BF.VALORSRB, BF.VLRINFINSS, BF.VLRCALCINSS '+
             ' FROM   BENEFBFCIARIO BF '+
             ' WHERE  BF.IDPESSJUR          = '+IntToStr(piIdPessJur)     +
             ' AND    BF.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)   +
             ' AND    BF.IDTITULAR          = '+IntToStr(piIdTitular)     +
             ' AND    BF.SEQPROPOSTA        = 1                          '+
             ' AND    BF.IDPESSOA           = '+IntToStr(piIdPessoa)      +
             ' AND    BF.IDBENEFICIO        = '+IntToStr(piIdBeneficio)   +
             ' AND    BF.NUMEROPROCESSO     = '+IntToStr(piNumeroProcesso));
     Open;
     if IsEmpty then
     begin
       sValorSRB:=FloatToStr(dValorSRB);
       sUltMesReajuste:='0000/00';
       sVlrInfInss:='0';
       sVlrCalcInss:='0';
     end
     else
     begin
       sValorSRB:=FieldByName('VALORSRB').AsString;
       sUltMesReajuste:=FieldByName('ULTMESREAJUSTE').AsString;
       //SE ULTIMO REAJUSTE POSTERIOR AO MES EM QUESTÃO PULAR
       if sUltMesReajuste >= psAnoMesRef then
         exit;
       //TRATAR DUPLA ATIVIDADE DO INSS
       if Sistema.TipoCliente <> 19991 then {<> DE FUNCEF}
         sVlrCalcInss:=FloatToStr(FieldByName('VLRCALCINSS').AsFloat) 
       else
         sVlrCalcInss:=CalcBeneficioINSSAtual(piIdPessJur,
                                              piIdPlanoPrev,
                                              piIdPessoa,
                                              psAnoMesRef,
                                              psAnoMesRef,
                                              sIDTPPAGTOANT,
                                              sFlgBenefMinimo,
                                              dtmAPrev.qryAux,
                                              piNumeroProcesso,
                                              'C');

       sValorInssTemp:=FieldByName('VLRINFINSS').AsString;
       sVlrInfINSS:=CalcBeneficioINSSAtual(piIdPessJur,
                                           piIdPlanoPrev,
                                           piIdPessoa,
                                           psAnoMesRef,
                                           psAnoMesRef,
                                           sIDTPPAGTOANT,
                                           sFlgBenefMinimo,
                                           dtmAPrev.qryAux,
                                           piNumeroProcesso);
       If sVlrInfInss = '0' then
         sVlrInfInss:=sValorInssTemp;
       
       if strtofloat(clientenumero(sVlrCalcInss)) = 0 then
         sVlrCalcInss:=sVlrInfINSS
     end;
     
     try
       dValorSRB:=StrToFloat(ClienteNumero(sValorSRB));
     except
       dValorSRB:=0;
     end;
  end;

  if pbBenefReferencia then
     BuscaDadosBeneficioAnterior(qryAux,
                                 piIdPessJur,
                                 piIdPlanoPrev,
                                 piIdTitular,
                                 piIdBeneficio,
                                 1,
                                 psDataInicio,
                                 sDataInicioAntINSS,
                                 sValorAntINSS,
                                 sNomeBenefAntINSS,
                                 sIdTpPagtoAntINSS,
                                 sUltMesReajAntINSS,
                                 sFlgBenefMinAntINSS,
                                 sDataEventoAntINSS,
                                 sCodBeneficioAntINSS,
                                 sValorBase1AntINSS,
                                 sValorBase2AntINSS,
                                 sValorBase3AntINSS,
                                 sNumProcAntINSS,
                                 True);

   if sDataInicioAntINSS = '' then
     sDataInicioAntINSS:= '          ';

  if psAnoMesRef              = '' then psAnoMesRef:=' ';
  if psAnoMesRef              = '' then psAnoMesRef:=' ';
  if psDataInicio             = '' then psDataInicio:=' ';
  if psDataInicioFund         = '' then psDataInicioFund:=' '; 
  if sIdTpPagtoAnt            = '' then sIdTpPagtoAnt:=' ';
  if sUltMesReajAnt           = '' then sUltMesReajAnt:='0000/00';
  if sFlgBenefMinAnt          = '' then sFlgBenefMinAnt:=' ';
  if Trim(sDataEventoAnt)     = '' then sDataEventoAnt:=' ';
  if Trim(sCodBeneficioAnt)   = '' then sCodBeneficioAnt:=' ';
  if Trim(sDataInicioAnt)     = '' then sDataInicioAnt:=' ';
  if Trim(sUltMesReajuste)    = '' then sUltMesReajuste:='0000/00';

  // Se o benefício for para beneficiário, passar como VALORATUAL O VALORTOTAL e
  // depois do reajuste, ratear o valor
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BF.VLRINFINSS, BF.VLRCALCINSS, BF.VALORTOTAL , P.DTEVENTO, BF.FLGBENEFMIN '+
                 ', BBF.PERCENTUAL '+
                 ', BF.VALORCALCULADO '+ 
                 ' FROM PROCESSOBENEF P, BENEFBFCIARIO BF, BFCIARIOTITPLAN BBF '+
                 ' WHERE BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                 ' AND BF.IDPESSJUR      = '+IntToStr(piIdPessJur)     +
                 ' AND BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)   +
                 ' AND BF.IDTITULAR      = '+IntToStr(piIdTitular)     +
                 ' AND BF.SEQPROPOSTA    = 1                          '+
                 ' AND BF.IDPESSOA       = '+IntToStr(piIdPessoa)      +
                 ' AND BF.IDBENEFICIO    = '+IntToStr(piIdBeneficio)   +
                 ' AND BF.IDPESSOA = BBF.IDPESSOA '+
                 ' AND BF.IDTITULAR = BBF.IDTITULAR '+
                 ' AND BF.IDBENEFICIO = BBF.IDBENEFICIO '+
                 ' AND BF.IDPESSJUR = BBF.IDPESSJUR '+
                 ' AND BF.IDPLANOPREV = BBF.IDPLANOPREV '+
                 ' AND BF.IDPLANOORIGEM = BBF.IDPLANOORIGEM '+
                 ' AND BF.SEQPROPOSTA = BBF.SEQPROPOSTA '+
                 ' AND P.NUMEROPROCESSO  = BF.NUMEROPROCESSO ');

  qryAux.Open;
  if not qryAux.IsEmpty then
  begin
    if piIdTitular <> piIdPessoa then
      pdValorEmReal:=qryAux.FieldByName('VALORTOTAL').AsFloat;
    sDataEvento:=qryAux.FieldByName('DTEVENTO').AsString;
    if Trim(sDataEvento) = '' then
      sDataEvento:=psDataInicio;
    iflgbenefmin:=qryAux.FieldByName('FLGBENEFMIN').asinteger;
    sVlrInfInssDib:=qryAux.FieldByName('VLRINFINSS').asString; 
    sVlrCalcInssDib:=qryAux.FieldByName('VLRCALCINSS').asString; 
    sVlrPercentual:=qryAux.Fieldbyname('PERCENTUAL').asstring; 
    if pbBenefReferencia then
      rvalorcalcinss:=qryAux.FieldByName('VALORCALCULADO').asfloat; 
  end
  else
    iflgbenefmin:=0;

  If (pbBenefReferencia) And (Trim(sDataInicioAntINSS) = '') and
     (Trim(psDibBenefAnt) <> '') Then 
    sDataInicioAntINSS := psDibBenefAnt;
  if trim(sDataInicioAntINSS) = '' then
    sDataInicioAntINSS:= '          ';

  // Se é suplementacao e não possui reajuste do INSS, rodar reajuste da suplementacao
  // Senao, rodar regra de CALCULO da suplementacao ( e nao de reajuste )
  if not bPossuiReajusteINSS then
  begin
    if piIdTitular = piIdPessoa then
    begin
      sSQL := ' SELECT '+IntToStr(piIdBeneficio)+'    AS IDBENEFICIO, '+
                         IntToStr(piIdPessJur)  +'    AS IDPESSJUR, '+
                         IntToStr(piIdPlanoPrev)+'    AS IDPLANOPREV, '+
                         IntToStr(PIDPLANPREVCONTAB)+'    AS IDPLANPREVCONTAB, '+  // Daniel Begnami SOL 129027
                         IntToStr(piIdTitular)  +'    AS IDTITULAR, '+
                         IntToStr(piIdPessoa)   +'    AS IDPESSOA, '+
                         IntToStr(piNumeroProcesso)+' AS NUMEROPROCESSO, '+
              '0 AS FLGCONCESSAO, '+
              '0 AS ORIGEM, '+
              ''''+sDIBSupl                +'''     AS DIBSUPL,           '+
              ''''+sDataInicioAntINSS      +'''     AS DATAINICIOINSS,    '+ //Renato Visoni SOL 129103 Kintana 705241
              ''''+sDataInicioAntINSS      +'''     AS DATAINICIOINSSANT, '+
              inttostr(iflgbenefmin)+' AS FLGBENEFMIN, '+
              '1 AS SEQPROPOSTA, '+ 
              OraNumero(sValorSRB)         +' AS VALORSRB, '+ 
              ''''+psAnoMesRef             +''' AS MESREAJ, '+
              ''''+psAnoMesRef             +''' AS MESREFERENCIA, '+
              ''''+psDataInicio            +''' AS DATAINICIO, '+
              ''''+psDataInicioFund        +''' AS DATAINICIOFUND, '+  
              ''''+sIdTpPagtoAnt           +''' AS IDTPPAGTOANT, '+ 
              ''''+sUltMesReajAnt          +''' AS ULTMESREAJANT, '+ 
              ''''+sFlgBenefMinAnt         +''' AS FLGBENEFMINANT, '+ 
              '''' +sDataEventoAnt         +''' AS DATAEVENTOANT, '+ 
              '''' +sCodBeneficioAnt       +''' AS IDBENEFICIOANT, '+ 
              '''' +sDataInicioAnt         +''' AS DATAINICIOANT, '+ 
              OraNumero(sValorAnt)         +' AS VLBENEFPGTO, '+ 
              OraNumero(sValorAnt)         +' AS VALORBENEFANT, '+ 
              OraNumero(FloatToStr(pdValorBase1))+' AS VALORBASE1, '+
              OraNumero(FloatToStr(pdValorBase2))+' AS VALORBASE2, '+
              OraNumero(FloatToStr(pdValorBase3))+' AS VALORBASE3, '+
              ''''+'01/'+copy(psAnoMesRef,6,2)+'/'+copy(psAnoMesRef,1,4)+''' AS DATAREF, '+
              OraNumero(FloatToStr(pdValorEmReal))+' AS VALORTOTAL, '+
              OraNumero(FloatToStr(pdValorEmReal))+' AS VALORATUAL, '+
              ''''+sUltMesReajuste              +''' AS ULTMESREAJUSTE, '+ 
              ' EL.VALORBASE1 AS VALORBASE1_ELEG, '+
              ' EL.VALORBASE2 AS VALORBASE2_ELEG, '+
              ' EL.VALORBASE3 AS VALORBASE3_ELEG, '+
              ' EL.VALORBASE4 AS VALORBASE4_ELEG, '+
              ' EL.VALORBASE5 AS VALORBASE5_ELEG, '+
              ' EL.VALORBASE6 AS VALORBASE6_ELEG, '+
              ' EL.IDPESSJUR, EL.IDPESSOA, '+
              OraNumero(sVlrInfInss)         +' AS VLRINFINSS, '+ 
              OraNumero(sVlrCalcInss)        +' AS VLRCALCINSS, '+ 
              
              inttostr(aiflgprovisorio)+' AS FLGPROVISORIO, '+ 
              OraNumero(formatfloat('#0.000000',arpercprovisorio))+' AS PERCPROVISORIO, '+ 
              inttostr(aiprazoprovisorio)+' AS PRAZOPROVISORIO, '+ 
              OraNumero(sVlrInfInssDib)      +' AS VLRINFINSSDIB, '+
              //COLOCAR A DATA DE NASCIMENTO DO PARTICIPANTE
              OraNumero(sVlrCalcInssDib)     +' AS VLRCALCINSSDIB, '+
              ' PF.DATANASC '+
              ' FROM   ELEGPATRO  EL, PESSOAFISICA PF '+
              ' WHERE  EL.IDPESSJUR = '+IntToStr(piIdPessJur)+
              ' AND    EL.IDPESSOA  = '+IntToStr(piIdTitular)+
              ' AND    PF.IDPESSOA = EL.IDPESSOA ';
    end
    else
    begin
      sSQL := ' SELECT '+IntToStr(piIdBeneficio)+' AS IDBENEFICIO, '+
                         IntToStr(piIdPessJur)  +' AS IDPESSJUR, '+
                         IntToStr(piIdPlanoPrev)+' AS IDPLANOPREV, '+
                         IntToStr(PIDPLANPREVCONTAB)+'    AS IDPLANPREVCONTAB, '+  // Daniel Begnami SOL 129027
                         IntToStr(piIdTitular)  +' AS IDTITULAR, '+
                         IntToStr(piIdPessoa)   +' AS IDPESSOA, '+
                         IntToStr(piNumeroProcesso)+' AS NUMEROPROCESSO, '+
              '0 AS FLGCONCESSAO, '+
              
              '0 AS ORIGEM, '+
              ''''+sDIBSupl                +'''     AS DIBSUPL,           '+ 
               ''''+sDataInicioAntINSS      +'''     AS DATAINICIOINSS,    '+ // Renato Visoni SOL 129103 Kintana 705241
              ''''+sDataInicioAntINSS      +'''     AS DATAINICIOINSSANT, '+
              inttostr(iflgbenefmin)+' AS FLGBENEFMIN, '+
              '1 AS SEQPROPOSTA, '+ 
              OraNumero(sValorSRB)         +' AS VALORSRB, '+ 
              ''''+psAnoMesRef             +''' AS MESREAJ, '+
              ''''+psAnoMesRef             +''' AS MESREFERENCIA, '+
              ''''+psDataInicio            +''' AS DATAINICIO, '+
              ''''+psDataInicioFund        +''' AS DATAINICIOFUND, '+  
              ''''+sIdTpPagtoAnt           +''' AS IDTPPAGTOANT, '+ 
              ''''+sUltMesReajAnt          +''' AS ULTMESREAJANT, '+ 
              ''''+sFlgBenefMinAnt         +''' AS FLGBENEFMINANT, '+ 
              '''' +sDataEventoAnt         +''' AS DATAEVENTOANT, '+ 
              '''' +sCodBeneficioAnt       +''' AS IDBENEFICIOANT, '+ 
              '''' +sDataInicioAnt         +''' AS DATAINICIOANT, '+ 
              OraNumero(sValorAnt)         +' AS VLBENEFPGTO, '+ 
              OraNumero(sValorAnt)         +' AS VALORBENEFANT, '+ 
              OraNumero(FloatToStr(pdValorBase1))+' AS VALORBASE1, '+
              OraNumero(FloatToStr(pdValorBase2))+' AS VALORBASE2, '+
              OraNumero(FloatToStr(pdValorBase3))+' AS VALORBASE3, '+
              ''''+'01/'+copy(psAnoMesRef,6,2)+'/'+copy(psAnoMesRef,1,4)+''' AS DATAREF, '+
              ''''+sUltMesReajuste          +''' AS ULTMESREAJUSTE, '+ 
              OraNumero(FloatToStr(pdValorEmReal))+' AS VALORTOTAL, '+
              OraNumero(FloatToStr(pdValorEmReal))+' AS VALORATUAL, '+
              ''''+sVlrPercentual  +''' AS PERCENTUAL, '+
              ' DP.VALORBASE1 AS VALORBASE1_ELEG, '+
              ' DP.VALORBASE2 AS VALORBASE2_ELEG, '+
              ' DP.VALORBASE3 AS VALORBASE3_ELEG, '+
              ' EL.IDPESSJUR, EL.IDPESSOA, PF.DATAMORTE, '+
              
              ' PF.DATANASC, '+ 
              inttostr(aiflgprovisorio)+' AS FLGPROVISORIO, '+ 
              OraNumero(formatfloat('#0.000000',arpercprovisorio))+' AS PERCPROVISORIO, '+ 
              inttostr(aiprazoprovisorio)+' AS PRAZOPROVISORIO, '+ 
              OraNumero(sVlrInfInssDib)      +' AS VLRINFINSSDIB, '+ 
              OraNumero(sVlrCalcInssDib)     +' AS VLRCALCINSSDIB, '+ 
              OraNumero(sVlrInfInss)         +' AS VLRINFINSS, '+ 
              OraNumero(sVlrCalcInss)        +' AS VLRCALCINSS '+ 
              ' FROM   PESSOAFISICA PF, ELEGPATRO  EL, DEPENTIT DP '+
              ' WHERE  EL.IDPESSJUR = '+IntToStr(piIdPessJur)+
              ' AND    EL.IDPESSOA  = '+IntToStr(piIdTitular)+
              ' AND    DP.IDTITULAR = EL.IDPESSOA '+
              ' AND    DP.IDPESSOA  = '+IntToStr(piIdPessoa)+
              ' AND    PF.IDPESSOA  = EL.IDPESSOA';
    end;
    // Se a regra retornar FALSE, considerar como se nao tivesse reajustado
    with dtmAPrev do
    begin
      regraAPrev.RuleName:=sIdRegraReajuste;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      regraAPrev.QueryIn:=dtmAPrev.qryRegra;
      regraAPrev.IdCalculo:=iIdCalculoGeral;

      // tratamento do erro da regra
      try
        regraAPrev.Execute;
        if regraAPrev.Error then
        begin
          sMsgErro:=' Ocorreu um erro na Regra de Reajuste do Benefício (nº '+sIdRegraReajuste+') ';
          result:=false;
          exit;
        end;
      except
        sMsgErro:=' Ocorreu um erro na Regra de Reajuste do Benefício (nº '+sIdRegraReajuste+') ';
        result:=false;
        exit;
      end;

      if UPPERCASE(RegraAPrev.Result) = 'FALSE' then
      begin
        result:=false;
        exit;
      end;

      // Verificar se o resultado da regra é um número válido
      try
        StrToFloat(ClienteNumero(RegraAPrev.Result))
      except
        sMsgErro:='O valor retornado pela regra Nº '+sIdRegraReajuste+
           ' não é um valor válido. Verifique. '+
           '[VALOR = '+RegraAPrev.Result+']';
        result:=false;
        exit;
      end;
    end; // with dtmAPREV
  end; // if not bPossuiReajusteINSS

  // Se o reajuste for em cima do SRB, entao o resultado da regra retornou o SRB
  // reajustado. Agora, o sistema tem que executar a regra de calculo do beneficio
  // com este SRB reajustado
  if bReajustaSRB or bPossuiReajusteINSS then
  begin
    if bReajustaSRB then
      sValorSRB:=OraNumero(dtmAPrev.regraAPrev.Result)
    else
    
    sValorBeneficio:=OraNumero(dtmAPrev.regraAPrev.Result);

    with dtmAPrev do
    begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT EV.IDEVENTOSPREV,  EV.IDSITPLANOATUAL, EV.IDSITPLANONOVO, '+
                     '        EV.IDSITPARTATUAL, EV.IDSITPARTNOVO,   EV.IDSITFUNCATUAL, EV.IDSITFUNCNOVO, '+
                     '        ST.FLGINTERNO,     STA.FLGINTERNO AS FLGINTERNOANT    '+
                     ' FROM   EVENTOSPREV EV,    SITPART ST,  SITPART STA  '+
                     ' WHERE  EV.IDSITPARTATUAL = STA.IDSITPART         '+
                     ' AND    EV.IDSITPARTNOVO  = ST.IDSITPART          '+
                     ' AND    EV.IDEVENTOSPREV IN ( SELECT MAX(IDEVENTOSPREV) FROM EVENTOSPREV    '+
                     '                              WHERE  IDPESSOA    = '+ IntToStr(piIdTitular)   +
                     '                              AND    IDPLANOPREV = '+ IntToStr(piIdPlanoPrev) +
                     '                              AND    IDPESSJUR   = '+ IntToStr(piIdPessJur)   +
                     '                              AND   DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
                     '                                                     WHERE IDPESSOA     = '+IntToStr(piIdTitular)+
                     '                                                     AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                     '                                                     AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+') '+
                     '                              AND    DATAEVENTO  >= TO_DATE('''+sDataEvento+''',''DD/MM/YYYY''))');
      qryAux.Open;

      sIdSitPartAntes:=qryAux.FieldByName('idsitpartatual').AsString;
      sIdSitPlanAntes:=qryAux.FieldByName('idsitplanoatual').AsString;
      sIdSitFuncAntes:=qryAux.FieldByName('idsitfuncatual').AsString;

      sIdSitPartAtual:=qryAux.FieldByName('idsitpartnovo').AsString;
      sIdSitPlanAtual:=qryAux.FieldByName('idsitplanonovo').AsString;
      sIdSitFuncAtual:=qryAux.FieldByName('idsitfuncnovo').AsString;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT BP.IDREGRACALCULO,   BP.IDREGRAPAGAMENTO, P.DTEVENTO,     '+
                     '        BF.DATAINICIOFUND,   BF.DATAINICIOINSS,   BF.DATAINICIO,  '+
                     '        BF.DATAREQUERIMENTO, BF.VLRINFINSS,       BF.VLRCALCINSS, '+
                     '        BF.FLGPOSSUIACOMPINSS,                                     '+
                     '        BP.IDRGVALORTOTAL                                          '+
                     ' FROM   BENEFBFCIARIO BF, PROCESSOBENEF P, BENEFPLANPREV BP      '+
                     ' WHERE  BF.NUMEROPROCESSO   = '+IntToStr(piNumeroProcesso)+
                     ' AND    BF.IDPESSJUR        = '+IntToStr(piIdPessJur)+
                     ' AND    BF.IDPLANOPREV      = '+IntToStr(piIdPlanoPrev)+
                     ' AND    BF.IDTITULAR        = '+IntToStr(piIdTitular)+
                     ' AND    BF.IDPESSOA         = '+IntToStr(piIdPessoa)+
                     ' AND    BF.SEQPROPOSTA      = 1 '+
                     ' AND    BF.IDBENEFICIO      = '+IntToStr(piIdBeneficio)+
                     ' AND    P.NUMEROPROCESSO    = BF.NUMEROPROCESSO '+
                     ' AND    BP.IDPLANOPREV      = BF.IDPLANOPREV    '+
                     ' AND    BP.IDBENEFICIO      = BF.IDBENEFICIO    ');
      qryAux.Open;
      iIdMostraRegraResultZero   := qryAux.FieldByName('IDREGRACALCULO').AsInteger; 
      iIdMostraRegraCalcValTotal := qryAux.FieldByName('IDRGVALORTOTAL').AsInteger; 
    end;

    
    try
      
      dValorSRB:=StrToFloat(ClienteNumero(sValorSRB));
    except
      dValorSRB:=0;
    end;

    //GARANTIR QUE SÓ GRAVA VALOR POSITIVO
    if dValorSRB <= 0 then
    begin
      result:=false;
      exit;
    end;

    dValorAux:=dtmAPrev.qryAux.FieldByname('vlrinfinss').asfloat;
    if piIdTitular = piIdPessoa then
    begin
      if dtmAPrev.qryAux.FieldByName('IDREGRACALCULO').AsInteger = 0 then
      begin
        sMsgErro:='Regra de Cálculo de Cálculo não '+
          'parametrizada para o benefício:'+inttostr(piIdBeneficio);
        result:=false;
        exit;
      end
      else
      begin
        if not ExecutaRegraCalculoBeneficio(
                 dtmAPrev.qryAux,
                 dtmAPrev.qryAux.FieldByName('IDREGRACALCULO').AsInteger,
                 dtmAPrev.qryAux.FieldByName('IDREGRAPAGAMENTO').AsInteger,
                 piIdPessJur,
                 piIdPlanoPrev,
                 piIdTitular,
                 1,
                 piIdBeneficio,
                 piNumeroProcesso,
                 pdValorBase1,
                 pdValorBase2,
                 pdValorBase3,
                 '',
                 '01/'+copy(psAnoMesRef,6,2)+'/'+copy(psAnoMesRef,1,4),
                 dtmAPrev.qryAux.FieldByName('DATAINICIOFUND').AsString,
                 dtmAPrev.qryAux.FieldByName('DATAINICIOINSS').AsString,
                 dtmAPrev.qryAux.FieldByName('DATAINICIO').AsString,
                 dtmAPrev.qryAux.FieldByName('DATAREQUERIMENTO').AsString,
                 sVlrInfInss,
                 sVlrCalcInss,
                 '0', 
                 False,
                 0,  // piFlgTipoInss
                 sDataInicioAnt,
                 sValorAnt,
                 sValorBase1Ant,
                 sValorBase2Ant,
                 sValorBase3Ant,
                 bretornoerro,
                 sMsgErro,
                 iIdCalculoGeral,
                 dtmAPrev.qryAux.FieldByName('FLGPOSSUIACOMPINSS').AsInteger,
                 StrToFloat(ClienteNumero(sValorSRB)),
                 sIdSitPartAntes,
                 sIdSitPlanAntes,
                 sIdSitFuncAntes,
                 sIdSitPartAtual,
                 sIdSitPlanAtual,
                 sIdSitFuncAtual,
                 dValorAux,
                 aiflgprovisorio,
                 arpercprovisorio,
                 aiprazoprovisorio 
                 ) then
        begin
          sMsgErro:=' Ocorreu um erro na Regra de Cálculo do Benefício (nº '+
            inttostr(dtmAPrev.qryAux.FieldByName('IDREGRACALCULO').AsInteger)+') ';
          result:=false;
          exit;
        end;
        lbRecalculo:=true; 
      end;
    end
    else
    begin
      if dtmAPrev.qryAux.FieldByName('IDRGVALORTOTAL').AsInteger = 0 then
      begin
        sMsgErro:='Regra de Cálculo do Valor Total não '+
          'parametrizada para o benefício:'+inttostr(piIdBeneficio);
        result:=false;
        exit;
      end
      else
      begin
        if not ExecutaRegraValorTotal(
                 dtmAPrev.qryAux,
                 dtmAPrev.qryAux.FieldByName('IDRGVALORTOTAL').AsInteger,
                 piIdPessJur,
                 piIdPlanoPrev,
                 piIdTitular,
                 piIdPessoa, 
                 1,
                 piNumeroProcesso,
                 piIdBeneficio,
                 piNumBenef,
                 pdValorBase1,
                 pdValorBase2,
                 pdValorBase3,
                 '', // psSQLBenefAssoc,
                 '01/'+copy(psAnoMesRef,6,2)+'/'+copy(psAnoMesRef,1,4),
                 dtmAPrev.qryAux.FieldByName('DATAINICIOFUND').AsString,
                 dtmAPrev.qryAux.FieldByName('DATAINICIOINSS').AsString,
                 sVlrCalcInss,
                 sVlrInfInss,
                 dtmAPrev.qryAux.FieldByName('DATAINICIO').AsString,
                 '0', // psValorReserva
                 '', // psVALORBINSSANT1,
                 '', // psVALORBINSSANT2,
                 '', // psVALORBINSSANT3
                 bretornoerro,
                 sMsgErro,
                 iIdCalculoGeral,
                 0, // piFlgTipoInss
                 sDataInicioAnt,
                 sValorAnt,
                 StrToFloat(ClienteNumero(sValorSRB)),
                 dValorAux,
                 aiflgprovisorio, 
                 arpercprovisorio, 
                 aiprazoprovisorio 
                 ) then
        begin
          sMsgErro:=' Ocorreu um erro na Regra de Cálculo do Valor Total (nº '+
            inttostr(iIdMostraRegraCalcValTotal)+') ';
          result:=false;
          exit;
        end;
        lbRecalculo:=true; 
      end;
    end;

    sValorBeneficio:=OraNumero(FloatToStr(dValorAux));
  end
  else
  begin
    sValorBeneficio:=OraNumero(dtmAPrev.regraAPrev.Result);
  end;

  if Trim(sValorBeneficio) = '' then
  begin
    sMsgErro:=' A Regra de Reajuste do Benefício (nº '+sIdRegraReajuste+')'+
                ' retornou um valor em branco. ';
    result:=false;
    exit;
  end;

  //GARANTIR QUE SÓ GRAVA VALOR POSITIVO
  try
    rbenef:=strtofloat(ClienteNumero(sValorBeneficio));

    
    if breajustacalcinss and pbBenefReferencia then
    begin
      try
        if strtofloat(ClienteNumero(sVlrInfINSS)) <> rvalorcalcinss then
          rvalorcalcinssreaj:=ArredondaMoeda(
            rbenef/strtofloat(ClienteNumero(sVlrInfINSS))*rvalorcalcinss)
        else
          rvalorcalcinssreaj:=rbenef;
      except
        rvalorcalcinssreaj:=rbenef;
      end;
    end;

    if rbenef <= 0 then
    begin
      
      if lbRecalculo then
      begin
        sMsgErro:='Valor do benefício recalculado igual a zero.';
      end
      else
      begin
        sMsgErro:='Valor reajustado retornado pela Regra igual a zero.'; 
        result:=false;
        exit;
      end;
    end;
  except
    result:=false;
    exit;
  end;

  qryAux.Close;
  qryAux.Sql.Clear;
  if piIdTitular = piIdPessoa then
  begin
    qryAux.Sql.Add(' UPDATE BENEFBFCIARIO SET ULTVALORATUALREAJ = VALORATUAL, '+
                   '        VALORATUAL     = '+OraNumero(sValorBeneficio)+','+
                   '        VALORTOTAL     = '+OraNumero(sValorBeneficio)+',');
    
    if breajustacalcinss and pbBenefReferencia then
      qryAux.Sql.Add('        VALORCALCULADO = '+OraNumero(floattostr(rvalorcalcinssreaj))+',')
    else
      qryAux.Sql.Add('        VALORCALCULADO = '+OraNumero(sValorBeneficio)       +',');

    qryAux.Sql.Add('        VALORSRB       = '+OraNumero(FloatToStr(dValorSRB)) +','+
                   '        ULTMESREAJUSTE = '''+Trim(psAnoMesRef)              +''''+
                   ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)       +
                   ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)          +
                   //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
                   ' AND    IDPLANOORIGEM  = '+inttostr(piIdPlanoOrigem)+
                   ' AND    IDTITULAR      = '+IntToStr(piIdTitular)            +
                   ' AND    IDPESSJUR      = '+IntToStr(piIdPessJur)            +
                   ' AND    IDBENEFICIO    = '+IntToSTr(piIdBeneficio)          +
                   ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)             +
                   ' AND    SEQPROPOSTA    = 1');
    try
      qryAux.ExecSQL;
    except
      sMsgErro:='Erro na atualização do valor atual do benefício. ';
      result:=false;
      exit;
    end;
  end
  else
  begin
    dValorTotal:=StrToFloat(ClienteNumero(sValorBeneficio));
  end;

  
  // Se for beneficio de referencia, atualizar os campos VLRCALCINSS e VLRINFINSS
  // da suplementação
  if pbBenefReferencia then
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET VLRINFINSS  = '+OraNumero(sValorBeneficio) +',');
    
    if breajustacalcinss then
      qryAux.Sql.Add(' VLRCALCINSS = '+OraNumero(floattostr(rvalorcalcinssreaj)))
    else
      qryAux.Sql.Add(' VLRCALCINSS = '+OraNumero(sValorBeneficio));

    qryAux.Sql.Add(' WHERE  IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)                   +
                   //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
                   ' AND    IDPLANOORIGEM  = '+inttostr(piIdPlanoOrigem)+
                   ' AND    IDTITULAR      = '+IntToStr(piIdTitular)                     +
                   ' AND    IDPESSJUR      = '+IntToStr(piIdPessJur)                     +
                   ' AND    ((IDBENEFICIO    IN (SELECT IDBENEFICIO FROM BENEFPLANPREV  '+
                   '                           WHERE  IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                   '                           AND    IDBENEFREF  = '+IntToSTr(piIdBeneficio)+')) OR '+
                   '          (IDBENEFREFEREN = '+IntToSTr(piIdBeneficio)+') )   '+
                   ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)               +
                   ' AND    SEQPROPOSTA    = 1                                    ');
    try
      qryAux.ExecSQL;
    except
      sMsgErro:='Erro na atualização do valor do inss no benefício. ';
      result:=false;
      exit;
    end;
  end;

  dValorTotal:=StrToFloat(ClienteNumero(sValorBeneficio));
  dValorTotalReajustado:=dValorTotal;

  // Se o beneficio for para beneficiario, rateá-lo
  if piIdTitular <> piIdPessoa then
  begin
    dValorTotalReajustado:=dValorTotal;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT P.DTEVENTO, BF.DATAINICIO, BF.DATAFINAL, BF.DATAINICIOINSS,         '+
                   '        BF.VLRINFINSS, BP.IDREGRAPAGAMENTO,  BP.IDREGRACALCULO,             '+
                   '        DP.IDDEPENDENCIA, BTIT.PERCENTUAL, BF.DIBBENEFANT, BF.VALORBENEFANT,'+
                   '        BF.VLRCALCINSS                                                      '+
                   ' FROM   BENEFPLANPREV BP, DEPENTIT DP, BFCIARIOTITPLAN BTIT, PROCESSOBENEF P, BENEFBFCIARIO BF '+
                   ' WHERE  BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                   ' AND    BF.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                   ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                   ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)+
                   ' AND    BF.SEQPROPOSTA    = 1 '+
                   ' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)+
                   ' AND    BF.IDBENEFICIO    = '+IntToStr(piIdBeneficio)+
                   ' AND    P.NUMEROPROCESSO  = BF.NUMEROPROCESSO '+
                   ' AND    BP.IDPLANOPREV    = BF.IDPLANOPREV    '+
                   ' AND    BP.IDBENEFICIO    = BF.IDBENEFICIO    '+
                   ' AND    BTIT.IDPLANOORIGEM = BF.IDPLANOORIGEM '+ // Renato Visoni SOL 150417 Kintana 1092011
                   ' AND    BTIT.IDPESSJUR    = BF.IDPESSJUR      '+
                   ' AND    BTIT.IDPLANOPREV  = BF.IDPLANOPREV    '+
                   ' AND    BTIT.IDTITULAR    = BF.IDTITULAR      '+
                   ' AND    BTIT.IDPESSOA     = BF.IDPESSOA       '+
                   ' AND    BTIT.SEQPROPOSTA  = BF.SEQPROPOSTA    '+
                   ' AND    BTIT.IDBENEFICIO  = BF.IDBENEFICIO    '+
                   ' AND    DP.IDTITULAR      = BTIT.IDTITULAR    '+
                   ' AND    DP.IDPESSOA       = BTIT.IDPESSOA     ');
    qryAux.Open;

    if not pbBenefReferencia or lbFlgPagaINSS then
    begin
      if qryAux.FieldByName('IDREGRACALCULO').AsInteger = 0 then
      begin
        sMsgErro:='Regra de Cálculo não parametrizada, para o benefício:'+
          inttostr(piIdBeneficio)+') ';
        result:=false;
        exit;
      end
      else
      begin
        if not ExecutaRegraCalculoBeneficioBfciario(
                 qryAux,
                 qryAux.FieldByName('IDREGRACALCULO').AsInteger,
                 -1,
                 piIdPessJur,         piIdPlanoPrev,
                 piIdplanoOrigem, 
                 piIdTitular,         1,
                 piIdBeneficio,       piNumeroProcesso,
                 piNumBenef,
                 pdValorBase1, pdValorBase2, pdValorBase3,
                 '', 
                 qryAux.FieldByName('DTEVENTO').AsString,
                 qryAux.FieldByName('DATAINICIO').AsString,
                 qryAux.FieldByName('DATAINICIOINSS').AsString,
                 OraNumero(FloatToStr(dValorTotalReajustado)),
                 qryAux.FieldByName('VLRINFINSS').AsString,
                 qryAux.FieldByName('VLRCALCINSS').AsString,
                 '0', 
                 bretornoerro,
                 sMsgErro,
                 iIdCalculoGeral,
                 piIdPessoa,
                 qryAux.FieldByName('IDDEPENDENCIA').AsString,
                 qryAux.FieldByName('PERCENTUAL').AsString,
                 
                 iflgbenefmin,
                 0,
                 qryAux.FieldByName('DIBBENEFANT').AsString,
                 qryAux.FieldByName('VALORBENEFANT').AsString,
                 dValorRateadoReajustado,
                 aiflgprovisorio, 
                 arpercprovisorio, 
                 aiprazoprovisorio 
                 ) then
        begin
          sMsgErro:=' Ocorreu um erro na Regra de Cálculo do Valor Total (nº '+
            inttostr(qryAux.FieldByName('IDREGRACALCULO').AsInteger)+') ';
          result:=false;
          exit;
        end;

        if dValorRateadoReajustado = 0 then
        begin
          sMsgErro:='A regra de Rateio de Pensão retornou um valor igual a zero. [Regra:'+
            inttostr(iIdMostraRegraResultZero)+'] ';
          result:=false;
          exit;
        end;

      end;
    end
    else
      dValorRateadoReajustado:=dValorTotal;

    // GRAVAR O VALORATUAL PARA PENSÃO DE INSS
    // Atualizar o campo VALORATUAL com o valor reajustado rateado
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.Sql.Add(' UPDATE BENEFBFCIARIO SET ULTVALORATUALREAJ = VALORATUAL,'+
                   '        VALORATUAL     = '+OraNumero(FloatToStr(dValorRateadoReajustado))+','+
                   '        VALORTOTAL     = '+OraNumero(FloatToStr(dValorTotal)) +',');
    
    if breajustacalcinss and pbBenefReferencia then
      qryAux.Sql.Add('        VALORCALCULADO = '+OraNumero(floattostr(rvalorcalcinssreaj))+',')
    else
      qryAux.Sql.Add('        VALORCALCULADO = '+OraNumero(floattostr(dValorTotal))+',');

    qryAux.Sql.Add('        VALORSRB       = '+OraNumero(FloatToStr(dValorSRB))   +','+ 
                   '        ULTMESREAJUSTE = '''+Trim(psAnoMesRef)                +''''+
                   ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)         +
                   ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)            +
                   ' AND    IDTITULAR      = '+IntToStr(piIdTitular)              +
                   ' AND    IDPESSJUR      = '+IntToStr(piIdPessJur)              +
                   ' AND    IDBENEFICIO    = '+IntToSTr(piIdBeneficio)            +
                   ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)               +
                   ' AND    SEQPROPOSTA    = 1');
    try
      qryAux.ExecSQL;
    except
      sMsgErro:='Erro na atualização do valor atual do benefício. ';
      result:=false;
      exit;
    end;
  end
  else
    dValorRateadoReajustado:=StrToFloat(ClienteNumero(sValorBeneficio));

  bReajustou:=True;

  // Retornar o VALOR TOTAL REAJUSTADO, para que possa ser executada a regra de benefício minimo
  dValorReaj:=dValorTotalReajustado;
  result:=true;
end; // ReajustaBenefConc

function ExecutaRegraCalculoBeneficio(qryAux: TwwQuery;
                                      piIdRegraCalculo,
                                      piIdRegraCalcReserva,
                                      piIdPessJur,
                                      piIdPlanoPrev,
                                      piIdTitular,
                                      piSeqProposta,
                                      piIdBeneficio,
                                      piNumeroProcesso: longint;
                                      prOpcao1,
                                      prOpcao2,
                                      prOpcao3: double;
                                      psSQLBenefAssoc,
                                      psDataEvento,
                                      psDataInicio,
                                      psDataInicioINSS,
                                      psDataInicioPagto,
                                      psDataRequerimento,
                                      psValorInfINSS,
                                      psValorCalcINSS,
                                      psValorReserva        : string;
                                      bBeneficioGrupo       : boolean;
                                      piFlgTipoInss         : integer;
                                      psDataInicioAnt,
                                      psValorBenefAnt,
                                      psVALORBINSSANT1,
                                      psVALORBINSSANT2,
                                      psVALORBINSSANT3      : string;
                                      var bErro             : boolean;
                                      var sMsgErro          : string;
                                      var piIdCalculo       : longInt;
                                      piFlgPossuiAcompINSS  : integer;
                                      prValorSRB            : double;
                                      psIdSitPartAntes,
                                      psIdSitPlanAntes,
                                      psIdSitFuncAntes,
                                      psIdSitPartAtual,
                                      psIdSitPlanAtual,
                                      psIdSitFuncAtual: string;
                                      var advalorcalc: double;
                                      aiflgprovisorio: integer; 
                                      arpercprovisorio: real; 
                                      aiprazoprovisorio: integer 
                                      ): boolean;
var
  sDataInicio,
  sDataInicioINSS,
  sDataRef,
  sOp1, sOp2, sOP3,
  sSQL,


  sSALPART,
  sREMTOTAL,
  sSalarioIntegral,
  sValorBeneficio,
  sDataInscFund,
  sValorReserva,
  sAnoMesRef      : string;
  rValorBeneficio,
  dSomaItemNaDIB,
  dSomaItemNoPBC  : double;

  // Dados necessários do benefício anterior
  sDataInicioAnt,  
  sValorAnt,       
  sNomeBenefAnt,
  sIdTpPagtoAnt,
  sFlgBenefMinAnt,
  sDataEventoAnt,
  sCodBeneficioAnt,
  sUltMesReajAnt,
  sNumProcINSS, 
  sValorBase1Ant,
  sValorBase2Ant,
  sValorBase3Ant   : string;

  iTotalBenef        : longint;

  // Variaveis para buscar os dados do INSS em vigor
  slValorCalcINSS,
  slValorInfINSS,
  slDataInicioINSS,
  slNumProcINSS,
  slValorBase1INSS,
  slValorBase2INSS,
  slValorBase3INSS: string;

  sFlgSitPartAntes    : string;
begin
  advalorcalc:=0;
  Result:=false;
  if piIdRegraCalculo <= 0 then
    Exit;

  // Para a regra de calculo, DATAINICIO = DIB - DATA DE DIREITO = (QUASE SEMPRE) DATA DO EVENTO
  //                          DATAREF    = DATA DO EVENTO

  if Trim(psDataEvento)      = '' then psDataEvento:=DateToStr(date);
  if Trim(psDataInicio)      = '' then psDataInicio:=DateToStr(date);
  if Trim(psDataInicioINSS)  = '' then psDataInicioINSS:=DateToStr(date);
  if Trim(psDataInicioPagto) = '' then psDataInicioPagto:=DateToStr(date);

  sDataInicio:=psDataInicio;
  sDataInicioINSS:=psDataInicioINSS;
  sDataRef:=psDataEvento;

  // Se foi passada regra para calculo da reserva, chamar a regra
  // senao, se foi passado um valor fixo como sendo o valor da reserva E NAO É BENEFICIO DE GRUPO
  //        usar este valor
  //        senao colocar a soma das reservas como sendo o valor da reserva

  if (StrToFloat(ClienteNumero(psValorReserva) ) <= 0 )
  then begin
     if piIdRegraCalcReserva > 0
     then //Executa regra para calcular valor da Reserva do Particip.
        sValorReserva:=OraNumero(CalcReservaPart(piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   piIdRegraCalcReserva,
                                                   piSeqProposta,
                                                   psDataEvento,
                                                   psDataInicio,
                                                   psDataInicioPagto,
                                                   psDataRequerimento, 
                                                   IntToStr(piIdBeneficio),
                                                   qryAux))
     else
        if Trim(psValorReserva) <> ''
        then sValorReserva:=psValorReserva
        else sValorReserva:=OraNumero(CalcReservaPart(piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   -1,
                                                   piSeqProposta,
                                                   psDataEvento,
                                                   psDataInicio,
                                                   psDataInicioPagto,
                                                   psDataRequerimento, 
                                                   IntToStr(piIdBeneficio),
                                                   qryAux));
  end
  else sValorReserva:=OraNumero(psValorReserva);

  sAnoMesRef:=Copy(psDataEvento,7,4) + '/' + Copy(psDataEvento,4,2);

  BuscaDadosBeneficioAnterior ( qryAux,
                                piIdPessJur, piIdPlanoPrev, piIdTitular,
                                piIdBeneficio,
                                0, // flgreferencia
                                psDataInicio,
                                sDataInicioAnt,
                                sValorAnt,
                                sNomeBenefAnt,
                                sIdTpPagtoAnt,
                                sUltMesReajAnt,
                                sFlgBenefMinAnt,
                                sDataEventoAnt,
                                sCodBeneficioAnt,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant, 
                                sNumProcINSS, 
                                False);

  if psValorInfInss <> ''
  then psValorInfINSS:=OraNumero(Trim(psValorInfINSS))
  else psValorInfINSS:='0';

  // Buscar salario na HistRubSal
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+OraNumero(psIdSitPartAntes));
     Open;
     if IsEmpty
     then sFlgSitPartAntes:='AT'
     else sFlgSitPartAntes:=FieldByName('FLGINTERNO').AsString;
     Close;
  end;

  sSalPart:='0';
  sSALPART:=BuscaSalario              (  piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2),
                                                   sFlgSitPartAntes,
                                                   sSalPart,
                                                   sMsgErro,
                                                   qryAux);
  if trim(sSALPART) = '' then
    sSALPART:='0';

  sSalarioIntegral:=BuscaSalarioPESSOAINTEGRAL ( qryAux,
                                                   piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   piSeqProposta,
                                                   sFlgSitPartAntes,
                                                   Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2) );
  if trim(sSalarioIntegral) = '' then
    sSalarioIntegral:='0';

  sREMTOTAL:=ORANUMERO(CalcREMTOTAL( piIdPessJur,
                                       piIdTitular,
                                       SAnoMesAnterior(sAnoMesRef),
                                       qryAux));
  if trim(sREMTOTAL) = '' then
    sREMTOTAL:='0';

  sDataInscFund:=CalcDataInscFund(piIdPessJur, piIdPlanoPrev, piIdTitular,
                                    piSeqProposta,qryAux);


  if Trim(sDataInscFund) = ''
  then sDataInscFund:=DateToStr(Date);

  if Trim(psValorInfINSS)  = '' then psValorInfINSS:='0';
  if Trim(psValorCalcINSS) = '' then psValorCalcINSS:='0';
  if Trim(sSalPart)        = '' then sSalPart:='0';
  if Trim(sRemTotal)       = '' then sRemTotal:='0';

  if prOpcao1 >= 0
  then sOp1:=OraNumero(FloatToStr(prOpcao1))
  else sOp1:='0';

  if prOpcao2 >= 0
  then sOp2:=OraNumero(FloatToStr(prOpcao2))
  else sOp2:='0';

  if prOpcao3 >= 0
  then sOp3:=OraNumero(FloatToStr(prOpcao3))
  else sOp3:='0';

  sDataEventoAnt:=BuscaUltimoEvento( qryAux,
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdTitular,   piSeqProposta,
                                       psDataEvento,
                                       'DATAEVENTO');

  if Trim(sValorReserva) = ''      then sValorReserva:='0';
  if Trim(sDataRef) = ''           then sDataRef:=DateToStr(Date);

  if Trim(psValorBenefAnt) = ''     then psValorBenefAnt:='0';

  if Trim(psDataRequerimento) = '' then psDataRequerimento:=DateToStr(Date);
  if Trim(sDataEventoAnt) = ''     then sDataEventoAnt:=DateToStr(Date);


  // SRB : Verificar se o beneficio calculado utiliza Evolucao Funcional
  // Se sim, então gerar o Resumo Funcional do participante neste momento
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT FLGUSAEVOLFUNC FROM BENEFPLANPREV '+
                 ' WHERE  IDPLANOPREV = '+ IntToStr(piIdPlanoPrev)+
                 ' AND    IDBENEFICIO = '+ IntToStr(piIdBeneficio));
  qryAux.Open;

  if (not qryAux.IsEmpty) and (qryAux.FieldByName('FlgUsaEvolFunc').AsInteger = 1)
  then begin
     if not CalculaResumoFuncional ( piIdPessJur, piIdTitular,
                                     psDataInicio,
                                     sMsgErro )
     then begin
        bErro:=True;
        sMsgErro:=' Ocorreu um erro na geração do Resumo Funcional. ';
        advalorcalc:=0;
        Result:=false;
        Exit;
     end;
     dSomaItemNaDib:=CalculaTotalResumoFuncional ( piIdPessJur, piIdTitular,dSomaItemNoPBC );
  end;

  // Somar o total de beneficiarios do titular
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(IDPESSOA) AS TOTALDEPENDENTES '+
             ' FROM   DEPENTIT                            '+
             ' WHERE  IDTITULAR = '+IntToStr(piIdTitular) );
     Open;
     if IsEmpty
     then iTotalBenef:=0
     else iTotalBenef:=FieldByName('TOTALDEPENDENTES').AsInteger;
  end;

  // Verificar se o beneficio de INSS já foi requerido.
  // Se sim, entao trazer os dados do INSS já preenchidos
  BuscaINSSEmVigor ( qryAux,
                     piIdPessJur,
                     piIdPlanoPrev,
                     piIdTitular,
                     piIdTitular,
                     piIdBeneficio,
                     psDataInicio,
                     slValorCalcINSS,
                     slValorInfINSS,
                     slDataInicioINSS,
                     slNumProcINSS,
                     slValorBase1INSS,
                     slValorBase2INSS,
                     slValorBase3INSS);

  if Trim(psSQLBenefAssoc) = ''
  then psSQLBenefAssoc:=', 0 AS VALORASSOCIADO, 0 AS ASSOC1OP1, 0 AS ASSOC2OP1, 0 AS ASSOC3OP1, '+
                          '                       0 AS ASSOC1OP2, 0 AS ASSOC2OP2, 0 AS ASSOC3OP2, '+
                          '                       0 AS ASSOC1OP3, 0 AS ASSOC2OP3, 0 AS ASSOC3OP3  ';


  if Trim(psIdSitPartAntes) = '' then psIdSitPartAntes:=psIdSitPartAtual;
  if Trim(psIdSitPlanAntes) = '' then psIdSitPlanAntes:=psIdSitPlanAtual;
  if Trim(psIdSitFuncAntes) = '' then psIdSitFuncAntes:=psIdSitFuncAtual;

  // Executa Regra de Cálculo do Valor do Beneficio
  sSQL:=' SELECT DISTINCT 0 AS FLGCONCESSAO, '+ 
          '        PP.SEQPROPOSTA,  '+ 
          '        PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,  '+
          '        PP.INSCRICAOTIPO, PP.DTINICIOINSC, '+
          '        PF.DATANASC, PF.SEXO,  PF.DATAMORTE, PP.IDPESSOA AS IDTITULAR,  '+
          '        EL.SALTOTAL,  EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+
          '        EL.TEMPOSERVTOTAL,  EL.DATADEMISSAO, EL.FLGDIRETOR, SP.FLGINTERNO, '+
          '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          '        PP.IDPESSOA AS IDTITULAR, '+
          IntToStr(piFlgPossuiAcompINSS)+' AS FLGPOSSUIACOMPINSS, '+
          IntToSTr(piIdBeneficio)    +  ' AS IDBENEFICIO , '+
          IntToSTr(piNumeroProcesso) +  ' AS NUMEROPROCESSO , '+
          ''''+sDataInscFund         +''' AS INSCRICAODATAFUND , '+
          OraNumero(psValorCalcINSS) +  ' AS VLRCALCINSS, '+
          OraNumero(psValorInfINSS)  +  ' AS VLRINFINSS, '+
          OraNumero(sSALPART)        +  ' AS VALORPROVENTO, '+
          OraNumero(sREMTOTAL)       +  ' AS VALORREMTOTAL, '+
          OraNumero(sSalarioIntegral)+  ' AS VALORINTEGRAL, '+
          sOp1                       +  ' AS VALORBASE1, '+
          sOp2                       +  ' AS VALORBASE2, '+
          sOp3                       +  ' AS VALORBASE3, '+
          sValorReserva              +  ' AS VALORRESERVA, '+
          Oranumero(psIdSitFuncAtual)+  ' AS IDSITFUNC, ' +
          Oranumero(psIdSitPartAtual)+  ' AS IDSITPART, ' +
          Oranumero(psIdSitPlanAtual)+  ' AS IDSITPLANOPREV ,  '+
          Oranumero(psIdSitPartAntes)+  ' AS IDSITPARTATUAL,   '+
          oRANUMERO(psIdSitPlanAntes)+  ' AS IDSITPLANOATUAL,  '+
          Oranumero(psIdSitFuncAntes)+  ' AS IDSITFUNCATUAL,   '+
          IntToSTr(piFlgTipoInss)    +  ' AS FLGTIPOINSS, '+
          '''' +   Trim(sDataRef)    +''' AS DATAREF, '+
          '''' +   Trim(sDataInicio) +''' AS DATAINICIO, '+
          '''' +   Trim(sDataInicioINSS)   +''' AS DATAINICIOINSS,   '+
          ''''+Trim(sDataInicioINSS)+''' AS DATAEVENTO, '+ 
          '''' +   Trim(psDataInicioPagto) +''' AS DATAINICIOPAGTO,  '+
          '''' +   Trim(psDataRequerimento)+''' AS DATAREQUERIMENTO, '+
          ''''+    sIdTpPagtoAnt           +''' AS IDTPPAGTOANT,     '+ 
          ''''+    sUltMesReajAnt          +''' AS ULTMESREAJANT,    '+ 
          ''''+    sFlgBenefMinAnt         +''' AS FLGBENEFMINANT,   '+ 
          '''' +   Trim(sDataEventoAnt)    +''' AS DATAEVENTOANT,    '+ 
          '''' +   Trim(sCodBeneficioAnt)  +''' AS CODBENEFICIOANT,  '+ 
          '''' +   Trim(psDataInicioAnt)   +''' AS DATAINICIOANT,    '+ 
          OraNumero(psValorBenefAnt)       +' AS VLBENEFPGTO,        '+


          //Douglas.siqueira SOL 171522  Kintana 1539190
          'NVL((SELECT round(SUM(DECODE(HB.FLGDEVOLUCAO, 1, -hb.valorprev, HB.valorprev)), '+
          '                     2) VALORHSTBENEFINSS '+
          '         FROM benefbfciario bf '+
          '         JOIN hstbenefbfciario hb ON hb.IDPLANOPREV = bf.idplanoprev '+
          '                                 AND hb.IDBENEFICIO = bf.idbeneficio '+
          '                                 AND hb.NUMEROPROCESSO = bf.numeroprocesso '+
          '                                 AND hb.IDPESSJUR = bf.idpessjur '+
          '                                 AND hb.IDTITULAR = bf.idtitular '+
          '                                 AND hb.IDPLANOORIGEM = bf.idplanoorigem '+
          '                                 AND hb.IDPESSOA = bf.idpessoa '+
          '                                 AND hb.SEQPROPOSTA = bf.seqproposta '+
          '        WHERE bf.idtitular = ' + IntToStr(piIdTitular) +
          '          AND hb.mesreferencia = ' +  QuotedStr(sAnoMesRef) +
          '          AND bf.idbeneficio <> 358 '+
          '          AND bf.fontepagadora = 2 '+
          '          AND bf.idplanoprev = ' + IntToStr(piIdPlanoPrev) +
          '          AND bf.idtppagtobenefic = 1 '+
          '          AND bf.idsitbeneficio IN (1, 2)), 0) AS VALORHSTBENEFINSS, '+
          //Douglas.siqueira SOL 171522  Kintana 1539190




          OraNumero(psValorBenefAnt)       +' AS VALORBENEFANT,      '+ 
          OraNumero(psVALORBINSSANT1)      +' AS VALORBINSSANT1,     '+ 
          OraNumero(psVALORBINSSANT2)      +' AS VALORBINSSANT2,     '+ 
          OraNumero(psVALORBINSSANT3)      +' AS VALORBINSSANT3,     '+ 
          IntToStr(iTotalBenef)            +' AS NUMBENEF,           '+ 
          OraNumero(slValorBase1INSS)      +' AS VALORBASE1INSS,     '+
          OraNumero(slValorBase2INSS)      +' AS VALORBASE2INSS,     '+
          OraNumero(slValorBase3INSS)      +' AS VALORBASE3INSS,     '+
          OraNumero(FloatToStr(prValorSRB))+' AS VALORSRB,           '+
          inttostr(aiflgprovisorio)+' AS FLGPROVISORIO, '+ 
          OraNumero(formatfloat('#0.000000',arpercprovisorio))+' AS PERCPROVISORIO, '+ 
          inttostr(aiprazoprovisorio)+' AS PRAZOPROVISORIO, '+ 
          OraNumero(FloatToStr(dSomaItemNoPBC))+' AS SOMAITEMNOPBC,  '+ 
          OraNumero(FloatToStr(dSomaItemNaDIB))+' AS SOMAITEMNADIB   '+ 
          psSQLBenefAssoc+
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF,  SITPART SP, SITFUNC SF, BENEFPLANOPART BPL  '+
          ' WHERE  PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND '+
          '        PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND '+
          '        PP.IDPESSOA    = ' + IntToStr(piIdTitular)   + ' AND '+
          '        PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND '+
          '        EL.IDPESSJUR   = PP.IDPESSJUR         AND '+
          '        EL.IDPESSOA    = PP.IDPESSOA          AND '+
          '        PF.IDPESSOA    = EL.IDPESSOA          AND '+
          '        EL.IDSITFUNC   = SF.IDSITFUNC(+)      AND '+
          '        PP.IDPESSJUR   = BPL.IDPESSJUR(+)     AND '+
          '        PP.IDPLANOPREV = BPL.IDPLANOPREV(+)   AND '+
          '        PP.IDPESSOA    = BPL.IDPESSOA(+)      AND '+
          '        PP.SEQPROPOSTA = BPL.SEQPROPOSTA(+)   AND '+
          '        SP.IDSITPART   = PP.IDSITPART ';


  sValorBeneficio:=RegraNumerica(IntToStr(piIdRegraCalculo),sSQL, bErro, piIdCalculo );

  if bErro
   then begin
     bErro:=True;
     sMsgErro:=' Ocorreu um erro na Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+') ';
     advalorcalc:=0;
     Result:=false;
     Exit;
  end;

  if Trim(sValorBeneficio) = ''
  then begin
     bErro:=True;
     sMsgErro:=' A Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+')'+
                 ' retornou um valor em branco. ';
     advalorcalc:=0;
     Result:=false;
     Exit;
  end;

  try
     rValorBeneficio:=StrToFloat(ClienteNumero(sValorBeneficio));
  except
     bErro:=True;
     sMsgErro:=' A Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+')' +
                 ' retornou um valor inválido. [Valor Retornado = '+sValorBeneficio+']';
     advalorcalc:=0;
     Result:=false;
     Exit;
  end;
  bErro:=False;
  sMsgErro:=' ';
  advalorcalc:=rValorBeneficio;
  Result:=true;
end;

function ExecutaRegraValorTotal(
           qryAux : TwwQuery;
           piIdRegraCalculo,
           piIdPessJur,
           piIdPlanoPrev,
           piIdTitular,
           piIdPessoa, 
           piSeqProposta,
           piNumeroProcesso,
           piIdBeneficio,
           piNumBenef: longint;
           prOpcao1,
           prOpcao2,
           prOpcao3: double;
           psSQLBenefAssoc,   psDataEvento,
           psDataInicio,      psDataInicioINSS,
           psVlrCalcINSS,     psVlrInfINSS,
           psDataInicioPagto, psValorReserva      : string;
           psVALORBINSSANT1,
           psVALORBINSSANT2,
           psVALORBINSSANT3    : string;
           var bErro                              : boolean;
           var sMsgErro                           : string;
           var piIdCalculo                        : longInt;
           piFlgTipoINSS                          : integer;
           psDataInicioAnt,
           psValorBenefAnt                        : string;
           prValorSRB                             : double;
           var advalorcalc: double;
           aiflgprovisorio: integer; 
           arpercprovisorio: real; 
           aiprazoprovisorio: integer 
           ): boolean;
var
  sDataInicio,
  sDataRef,
  sOp1, sOp2, sOP3,
  sSQL,
  sSALPART,
  sREMTOTAL,
  sValorBeneficio,
  sDataInscFund,
  sValorReserva,
  sAnoMesRef,
  sSQLReserva,
  sPercentualSaque  : string;

  rValorReserva,
  rValorBeneficio  : double;
  iIdRegraReserva  : longint;

  // Dados necessários do benefício anterior
  sDataInicioAnt,  
  sValorAnt,       
  sNomeBenefAnt,
  sIdTpPagtoAnt,
  sFlgBenefMinAnt, sDataEventoAnt,sCodBeneficioAnt,
  sUltMesReajAnt,
  sNumProcINSS, 
  sValorBase1Ant,
  sValorBase2Ant,
  sValorBase3Ant,

  sFlgInternoAntes,
  sFlgInternoAtual,
  sIdSitPartAntes,
  sIdSitPlanAntes,
  sIdSitFuncAntes,
  sIdSitPartDepois,
  sIdSitPlanDepois,
  sIdSitFuncDepois      : string;

  slDataInicioINSS,
  slNumProcINSS,
  slValorInfINSS,
  slValorCalcINSS,
  slValorBase1INSS,
  slValorBase2INSS,
  slValorBase3INSS: string; 

begin
  Result:=false;
  advalorcalc:=0;
  if piIdRegraCalculo <= 0 then Exit;

  // Para a regra de calculo, DATAINICIO = DIB - DATA DE DIREITO = (QUASE SEMPRE) DATA DO EVENTO
  //                          DATAREF    = DATA DO EVENTO

  if Trim(psDataEvento) = '' then psDataEvento:=DateToStr(date);
  if Trim(psDataInicio) = '' then psDataInicio:=DateToStr(date);
  if Trim(psDataInicioINSS) = '' then psDataInicioINSS:=DateToSTr(date);


  
  // Verificar se o beneficio de INSS já foi requerido.
  // Se sim, entao trazer os dados do INSS já preenchidos
  BuscaINSSEmVigor ( qryAux,
                     piIdPessJur,
                     piIdPlanoPrev,
                     piIdTitular,
                     piIdPessoa, 
                     piIdBeneficio,
                     psDataInicio,
                     slValorCalcINSS,
                     slValorInfINSS,
                     slDataInicioINSS,
                     slNumProcINSS,
                     slValorBase1INSS,
                     slValorBase2INSS,
                     slValorBase3INSS);
  

  // Buscar situacoes do participante antes e depois do evento
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT EV.IDEVENTOSPREV,  EV.IDSITPLANOATUAL, EV.IDSITPLANONOVO, '+
             '        EV.IDSITPARTATUAL, EV.IDSITPARTNOVO,   EV.IDSITFUNCATUAL, EV.IDSITFUNCNOVO, '+
             '        ST.FLGINTERNO,     STA.FLGINTERNO AS FLGINTERNOANT    '+
             ' FROM   EVENTOSPREV EV,    SITPART ST,  SITPART STA  '+
             ' WHERE  EV.IDSITPARTATUAL = STA.IDSITPART         '+
             ' AND    EV.IDSITPARTNOVO  = ST.IDSITPART          '+
             ' AND    EV.IDEVENTOSPREV IN ( SELECT MAX(IDEVENTOSPREV) FROM EVENTOSPREV    '+
             '                              WHERE  IDPESSOA    = '+ IntToStr(piIdTitular)   +
             '                              AND    IDPLANOPREV = '+ IntToStr(piIdPlanoPrev) +
             '                              AND    IDPESSJUR   = '+ IntToStr(piIdPessJur)   +
             '                              AND   DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
             '                                                     WHERE IDPESSOA     = '+IntToStr(piIdTitular)+
             '                                                     AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
             '                                                     AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+') '+
             '                              AND    DATAEVENTO  >= TO_DATE('''+psDataEvento+''',''DD/MM/YYYY''))');
  qryAux.Open;

  sFlgInternoAntes:=qryAux.FieldByName('flginternoant').AsString;
  sFlgInternoAtual:=qryAux.FieldByName('flginterno').AsString;

  sIdSitPartAntes:=qryAux.FieldByName('idsitpartatual').AsString;
  sIdSitPlanAntes:=qryAux.FieldByName('idsitplanoatual').AsString;
  sIdSitFuncAntes:=qryAux.FieldByName('idsitfuncatual').AsString;

  sIdSitPartDepois:=qryAux.FieldByName('idsitpartnovo').AsString;
  sIdSitPlanDepois:=qryAux.FieldByName('idsitplanonovo').AsString;
  sIdSitFuncDepois:=qryAux.FieldByName('idsitfuncnovo').AsString;


  psVlrCalcINSS:=OraNumero(psVlrCalcINSS);
  psVlrInfINSS:=OraNumero(psVlrInfINSS);

  sDataInicio:=psDataInicio;
  sDataRef:=psDataEvento;

  sAnoMesRef:=Copy(psDataEvento,7,4) + '/' + Copy(psDataEvento,4,2);

  BuscaDadosBeneficioAnterior ( qryAux,
                                piIdPessJur, piIdPlanoPrev, piIdTitular,
                                piIdBeneficio,
                                0, // flgreferencia
                                psDataInicio,
                                sDataInicioAnt,
                                sValorAnt,
                                sNomeBenefAnt,
                                sIdTpPagtoAnt,
                                sUltMesReajAnt,
                                sFlgBenefMinAnt,
                                sDataEventoAnt,
                                sCodBeneficioAnt,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant, 
                                sNumProcINSS, 
                                False);

  sSALPART:=ORANUMERO(CalcSalPart( piIdPessJur,
                                      piIdTitular,
                                      SAnoMesAnterior(sAnoMesRef),
                                      qryAux));
  sREMTOTAL:=ORANUMERO(CalcREMTOTAL( piIdPessJur,
                                       piIdTitular,
                                       SAnoMesAnterior(sAnoMesRef),
                                       qryAux));

  sDataInscFund:=CalcDataInscFund(piIdPessJur, piIdPlanoPrev, piIdTitular, piSeqProposta,qryAux);


  if Trim(sDataInscFund) = ''
  then sDataInscFund:=DateToStr(Date);

  if Trim(sSalPart) = ''   then sSalPart:='0';
  if Trim(sRemTotal) = ''  then sRemTotal:='0';

  if prOpcao1 >= 0
  then sOp1:=OraNumero(FloatToStr(prOpcao1))
  else sOp1:='0';

  if prOpcao2 >= 0
  then sOp2:=OraNumero(FloatToStr(prOpcao2))
  else sOp2:='0';

  if prOpcao3 >= 0
  then sOp3:=OraNumero(FloatToStr(prOpcao3))
  else sOp3:='0';

  if Trim(sDataRef) = ''   then sDataRef:=DateToStr(Date);

  // Calcular reserva do participante
  if (StrToFloat(ClienteNumero(psValorReserva) ) <= 0 )
  then begin
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT IDREGRAPAGAMENTO FROM BENEFPLANPREV '+
                ' WHERE  IDBENEFICIO = '+IntToStr(piIdBeneficio)+
                ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev));
        Open;
        if (not qryAux.IsEmpty) and (Trim(qryAux.FieldByName('IdRegraPagamento').AsString) <> '')
        then iIdRegraReserva:=qryAux.FieldByName('IdRegraPagamento').AsInteger
        else iIdRegraReserva:=-1;
     end; // with qryAux

     if iIdRegraReserva > 0 //Executa regra para calcular valor da Reserva do Particip
     then sValorReserva:=OraNumero(CalcReservaPart(piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   iIdRegraReserva,
                                                   piSeqProposta,
                                                   psDataEvento,
                                                   psDataInicio,
                                                   psDataInicioPagto,
                                                   '',
                                                   IntToStr(piIdBeneficio),
                                                   qryAux))
     else sValorReserva:=OraNumero(CalcReservaPart(piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   -1,
                                                   piSeqProposta,
                                                   psDataEvento,
                                                   psDataInicio,
                                                   psDataInicioPagto,
                                                   '',
                                                   IntToStr(piIdBeneficio),
                                                   qryAux));
  end
  else sValorReserva:=OraNumero(psValorReserva);

  // Executa Regra de Cálculo do Valor do Beneficio
  sSQL:=' SELECT DISTINCT PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,  '+
          '        PP.SEQPROPOSTA, PP.INSCRICAOTIPO,   PF.DATANASC,    PF.SEXO,           ';

  if sTipoTelaBenef = 'SI'
  then sSQL:=sSQL + ''''+psDataEvento+''' AS DATAMORTE, '
  else sSQL:=sSQL + ' PF.DATAMORTE, ';

  if Trim(psDataInicioAnt)    = '' then psDataInicioAnt:='          ';
  if Trim(sDataRef)           = '' then sDataRef:='          ';
  if Trim(sDataInicio)        = '' then sDataInicio:='          ';
  if Trim(psDataInicioINSS)   = '' then psDataInicioINSS:='          ';
  if Trim(sDataEventoAnt)     = '' then sDataEventoAnt:='          ';
  if Trim(psDataInicioAnt)    = '' then psDataInicioAnt:='          ';

  sSQL:=sSQL + ' 0 AS FLGCONCESSAO, '+ 
          '        PP.SEQPROPOSTA,  '+ 
          '        PP.IDPESSOA AS IDTITULAR, PP.DTINICIOINSC,  '+
          '        EL.SALTOTAL,  EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+
          '        EL.TEMPOSERVTOTAL, '+
          '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          '        SP.FLGINTERNO, '+
          '        EL.FLGDIRETOR, '+
          ''''+sDataInscFund+''' AS INSCRICAODATAFUND , '+
          psVlrCalcINSS+' AS VLRCALCINSS, '+
          psVlrInfINSS +' AS VLRINFINSS, '+
          sSALPART  +' AS VALORPROVENTO, '+
          sREMTOTAL +' AS VALORREMTOTAL, '+
          sOp1      +' AS VALORBASE1,    '+
          sOp2      +' AS VALORBASE2,    '+
          sOp3      +' AS VALORBASE3,    '+
          sValorReserva+ ' AS VALORRESERVA,        '+
          ''''+sFlgInternoAntes+''' AS FLGINTERNOANT, '+
          ''''+sFlgInternoAtual+''' AS FLGINTERNO, '+
          ''''+sIdSitPartAntes+''' AS IDSITPARTATUAL, '+
          ''''+sIdSitPlanAntes+''' AS IDSITPLANOATUAL, '+
          ''''+sIdSitFuncAntes+''' AS IDSITFUNCATUAL, '+
          ''''+sIdSitPartDepois+''' AS IDSITPARTNOVO, '+
          ''''+sIdSitPlanDepois+''' AS IDSITPLANONOVO, '+
          ''''+sIdSitFuncDepois+''' AS IDSITFUNCNOVO, '+
          IntToStr(piNumeroProcesso)+ ' AS NUMEROPROCESSO, '+
          IntToStr(piIdBeneficio)+ ' AS IDBENEFICIO,       '+
          IntToStr(piFlgTipoInss)+ ' AS FLGTIPOINSS,       '+ 
          '''' +   sDataRef+ ''' AS DATAREF,        '+ 
          '''' +   sDataInicio+''' AS DATAINICIO,    '+
          '''' +   psDataInicioINSS+''' AS DATAINICIOINSS, '+
          ''''+Trim(psDataInicioINSS)+''' AS DATAEVENTO, '+ 
          ''''+    sIdTpPagtoAnt           +''' AS IDTPPAGTOANT,     '+ 
          ''''+    sUltMesReajAnt          +''' AS ULTMESREAJANT,    '+ 
          ''''+    sFlgBenefMinAnt         +''' AS FLGBENEFMINANT,   '+ 
          '''' +   sDataEventoAnt    +''' AS DATAEVENTOANT,          '+
          '''' +   sCodBeneficioAnt  +''' AS CODBENEFICIOANT,        '+
          '''' +   psDataInicioAnt   +''' AS DATAINICIOANT,          '+  
          OraNumero(psValorBenefAnt)       +' AS VLBENEFPGTO,        '+ 
          OraNumero(psValorBenefAnt)       +' AS VALORBENEFANT,      '+ 
          OraNumero(psVALORBINSSANT1)      +' AS VALORBINSSANT1,      '+ 
          OraNumero(psVALORBINSSANT2)      +' AS VALORBINSSANT2,      '+ 
          OraNumero(psVALORBINSSANT3)      +' AS VALORBINSSANT3,      '+ 
          OraNumero(slValorBase1INSS)      +' AS VALORBASE1INSS, '+ 
          OraNumero(slValorBase2INSS)      +' AS VALORBASE2INSS, '+ 
          OraNumero(slValorBase3INSS)      +' AS VALORBASE3INSS, '+ 
          OraNumero(FloatToStr(prValorSRB))+' AS VALORSRB,           '+
          inttostr(aiflgprovisorio)+' AS FLGPROVISORIO, '+ 
          OraNumero(formatfloat('#0.000000',arpercprovisorio))+' AS PERCPROVISORIO, '+ 
          inttostr(aiprazoprovisorio)+' AS PRAZOPROVISORIO, '+ 
          IntToSTr(piNumBenef)             +' AS NUMBENEF '+
          psSQLBenefAssoc+
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP, PESSOAFISICA PF,  SITFUNC SF, BENEFPLANOPART BPL  '+
          ' WHERE  PP.IDPESSOA    = ' + IntToStr(piIdTitular)   + ' AND '+
          '        PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND '+
          '        PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND '+
          '        PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND '+
          '        EL.IDPESSOA    = PP.IDPESSOA          AND '+
          '        EL.IDPESSJUR   = PP.IDPESSJUR         AND '+
          '        PF.IDPESSOA    = EL.IDPESSOA          AND '+
          '        EL.IDSITFUNC   = SF.IDSITFUNC(+)      AND '+
          '        PP.IDPESSOA    = BPL.IDPESSOA(+)      AND '+
          '        PP.IDPESSJUR   = BPL.IDPESSJUR(+)     AND '+
          '        PP.IDPLANOPREV = BPL.IDPLANOPREV(+)   AND '+
          '        SP.IDSITPART   = PP.IDSITPART ';

  sValorBeneficio:=RegraNumerica(IntToStr(piIdRegraCalculo),sSQL, bErro, piIdCalculo );

  if bErro
   then begin
     bErro:=True;
     sMsgErro:=' Ocorreu um erro na Regra de Cálculo do Valor Total do Benefício (nº '+IntToStr(piIdRegraCalculo)+') ';
     Result:=false;
     advalorcalc:=0;
     Exit;
  end;

  if Trim(sValorBeneficio) = ''
  then begin
     bErro:=True;
     sMsgErro:=' A Regra de Cálculo do Valor Total do Benefício (nº '+IntToStr(piIdRegraCalculo)+')'+
                 ' retornou um valor em branco. ';
     Result:=false;
     advalorcalc:=0;
     Exit;
  end;

  try
     rValorBeneficio:=StrToFloat(ClienteNumero(sValorBeneficio));
  except
     bErro:=True;
     sMsgErro:=' A Regra de Cálculo do Valor Total do Benefício (nº '+IntToStr(piIdRegraCalculo)+')' +
                 ' retornou um valor inválido. [Valor Retornado = '+sValorBeneficio+']';
     Result:=false;
     advalorcalc:=0;
     Exit;
  end;
  bErro:=False;
  sMsgErro:=' ';
  Result:=true;
  advalorcalc:=rValorBeneficio;
end; // ExecutaRegraValorTotal

function ExecutaRegraCalculoBeneficioBfciario(
           qryAux : TwwQuery;
           piIdRegraCalculo,    piIdRegraCalcReserva,
           piIdPessJur,         piIdPlanoPrev,
           piIdplanoOrigem, 
           piIdTitular,         piSeqProposta,
           piIdBeneficio,       piNumeroProcesso,
           piNumBenef          : longint;
           prOpcao1,
           prOpcao2,
           prOpcao3: double;
           psSQLBenefAssoc,     psDataEvento,
           psDataInicio,        psDataInicioINSS,
           psValorTotal,        psValorInfINSS,
           psValorCalcINSS,     psValorReserva      : string;
           var bErro                                : boolean;
           var sMsgErro                             : string;
           var piIdCalculo                          : longInt;
           piIdPessoa                               : longint;
           psIdDependencia,     psPercentual        : string;
           
           piFlgBenefMin,
           piFlgTipoInss: integer;
           psDataInicioAnt,
           psValorBenefAnt: string;
           var advalorcalc: double;
           aiflgprovisorio: integer; 
           arpercprovisorio: real; 
           aiprazoprovisorio: integer 
           ): boolean;
var
  sDataInicio,
  sDataInicioINSS,
  sDataRef,
  sOp1, sOp2, sOP3,
  sSQL,
  sSALPART,
  sREMTOTAL,
  sValorBeneficio,
  sDataInscFund,
  sValorReserva,
  sFlgBenefMinimo,
  sAnoMesRef : string;
  rValorBeneficio : double;

  // Dados necessários do benefício anterior
  sDataInicioAnt,  
  sValorAnt,       
  sNomeBenefAnt,
  sIdTpPagtoAnt,
  sFlgBenefMinAnt, sDataEventoAnt,sCodBeneficioAnt,
  sUltMesReajAnt,
  sNumProcINSS, 
  sValorBase1Ant,
  sValorBase2Ant,
  sValorBase3Ant,
  sFlgBenefCotas    : string;

  sFlgInternoAntes,   sFlgInternoAtual,
  sIdSitPartAntes,    sIdSitPlanAntes,
  sIdSitFuncAntes,    sIdSitPartDepois,
  sIdSitPlanDepois,   sIdSitFuncDepois  : string;

  slDataInicioINSS,
  slNumProcINSS,
  slValorInfINSS,
  slValorCalcINSS,
  slValorBase1INSS,
  slValorBase2INSS,
  slValorBase3INSS: string; 
begin
  Result:=false;
  advalorcalc:=0;
  if piIdRegraCalculo <= 0 then Exit;

  // Verificar e beneficio é em real ou em cotas
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT FLGCALCTODOMES '+
                 ' FROM   BENEFPLANPREV  '+
                 ' WHERE  IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                 ' AND    IDBENEFICIO  = '+IntToStr(piIdBeneficio));
  qryAux.Open;

  if qryAux.IsEmpty
  then sFlgBenefCotas:='0'
  else sFlgBenefCotas:=OraNumero(qryAux.FieldByName('FLGCALCTODOMES').AsString);

  // Para a regra de calculo, DATAINICIO = DIB - DATA DE DIREITO = (QUASE SEMPRE) DATA DO EVENTO
  //                          DATAREF    = DATA DO EVENTO

  if Trim(psDataEvento) = '' then psDataEvento:=DateToStr(date);
  if Trim(psDataInicio) = '' then psDataInicio:=DateToStr(date);
  if Trim(psDataInicioINSS) = '' then psDataInicioINSS:=DateToStr(date);
  sDataInicio:=psDataInicio;
  sDataRef:=psDataEvento;
  sDataInicioINSS:=psDataInicioINSS;

  // Buscar situacoes do participante antes e depois do evento
  BuscaSituacoesPart(qryAux,piIdTitular, piIdPlanoPrev, piIdPessJur,psDataEvento,
                     sFlgInternoAntes , sFlgInternoAtual,
                     sIdSitPartAntes  , sIdSitPartDepois,
                     sIdSitPlanAntes  , sIdSitPlanDepois,
                     sIdSitFuncAntes  , sIdSitFuncDepois);

  
  // Verificar se o beneficio de INSS já foi requerido.
  // Se sim, entao trazer os dados do INSS já preenchidos
  BuscaINSSEmVigor ( qryAux,
                     piIdPessJur,
                     piIdPlanoPrev,
                     piIdTitular,
                     piIdPessoa, 
                     piIdBeneficio,
                     psDataInicio,
                     slValorCalcINSS,
                     slValorInfINSS,
                     slDataInicioINSS,
                     slNumProcINSS,
                     slValorBase1INSS,
                     slValorBase2INSS,
                     slValorBase3INSS);
  

{  CGUEDES - 21/03/2002- CRIADA FUNÇAO
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT EV.IDEVENTOSPREV,  EV.IDSITPLANOATUAL, EV.IDSITPLANONOVO, '+
             '        EV.IDSITPARTATUAL, EV.IDSITPARTNOVO,   EV.IDSITFUNCATUAL, EV.IDSITFUNCNOVO, '+
             '        ST.FLGINTERNO,     STA.FLGINTERNO AS FLGINTERNOANT    '+
             ' FROM   EVENTOSPREV EV,    SITPART ST,  SITPART STA  '+
             ' WHERE  EV.IDSITPARTATUAL = STA.IDSITPART         '+
             ' AND    EV.IDSITPARTNOVO  = ST.IDSITPART          '+
             ' AND    EV.IDEVENTOSPREV IN ( SELECT MAX(IDEVENTOSPREV) FROM EVENTOSPREV    '+
             '                              WHERE  IDPESSOA    = '+ IntToStr(piIdTitular)   +
             '                              AND    IDPLANOPREV = '+ IntToStr(piIdPlanoPrev) +
             '                              AND    IDPESSJUR   = '+ IntToStr(piIdPessJur)   +
             '                              AND   DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
             '                                                     WHERE IDPESSOA     = '+IntToStr(piIdTitular)+
             '                                                     AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
             '                                                     AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+') '+
             '                              AND    DATAEVENTO  >= TO_DATE('''+psDataEvento+''',''DD/MM/YYYY''))');
  qryAux.Open;

  sFlgInternoAntes:=qryAux.FieldByName('flginternoant').AsString;
  sFlgInternoAtual:=qryAux.FieldByName('flginterno').AsString;

  sIdSitPartAntes:=qryAux.FieldByName('idsitpartatual').AsString;
  sIdSitPlanAntes:=qryAux.FieldByName('idsitplanoatual').AsString;
  sIdSitFuncAntes:=qryAux.FieldByName('idsitfuncatual').AsString;

  sIdSitPartDepois:=qryAux.FieldByName('idsitpartnovo').AsString;
  sIdSitPlanDepois:=qryAux.FieldByName('idsitplanonovo').AsString;
  sIdSitFuncDepois:=qryAux.FieldByName('idsitfuncnovo').AsString;
   }

  // se foi passada regra para calculo da reserva, chamar a regra
  // senao, se foi passado um valor fixo como sendo o valor da reserva
  //        usar este valor
  //        senao colocar a soma das reservas como sendo o valor da reserva
  if piIdRegraCalcReserva > 0
  then //Executa regra para calcular valor da Reserva do Particip.
     sValorReserva:=OraNumero(CalcReservaPart(piIdPessJur,
                                                piIdPlanoPrev,
                                                piIdTitular,
                                                piIdRegraCalcReserva,
                                                piSeqProposta,
                                                psDataEvento,
                                                psDataInicio,
                                                '','',
                                                IntToStr(piIdBeneficio),
                                                qryAux))
  else
     if Trim(psValorReserva) <> ''
     then sValorReserva:=psValorReserva
     else sValorReserva:=OraNumero(CalcReservaPart(piIdPessJur,
                                                piIdPlanoPrev,
                                                piIdTitular,
                                                -1,
                                                piSeqProposta,
                                                psDataEvento,
                                                psDataInicio,
                                                '','',
                                                IntToStr(piIdBeneficio),
                                                qryAux));

  sAnoMesRef:=Copy(psDataEvento,7,4) + '/' + Copy(psDataEvento,4,2);


  BuscaDadosBeneficioAnterior ( qryAux,
                                piIdPessJur, piIdPlanoPrev, piIdTitular,
                                piIdBeneficio,
                                0, // flgreferencia
                                psDataInicio,
                                sDataInicioAnt,
                                sValorAnt,
                                sNomeBenefAnt,
                                sIdTpPagtoAnt,
                                sUltMesReajAnt,
                                sFlgBenefMinAnt,
                                sDataEventoAnt,
                                sCodBeneficioAnt,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant,
                                sNumProcINSS, 
                                False);

  if psValorInfInss <> ''
  then psValorInfINSS:=OraNumero(Trim(psValorInfINSS))
  else psValorInfINSS:='0';

  if psValorCalcInss <> ''
  then psValorCalcINSS:=OraNumero(Trim(psValorCalcINSS))
  else psValorCalcINSS:='0';

  sSALPART:=ORANUMERO(CalcSalPart( piIdPessJur,
                                      piIdTitular,
                                      SAnoMesAnterior(sAnoMesRef),
                                      qryAux));

  sDataInscFund:=CalcDataInscFund(piIdPessJur, piIdPlanoPrev, piIdTitular, piSeqProposta,qryAux);


  if Trim(sDataInscFund) = ''
  then sDataInscFund:=DateToStr(Date);

  if Trim(psValorInfINSS) = '' then psValorInfINSS:='0';
  if Trim(psValorCalcINSS) = '' then psValorCalcINSS:='0';
  if Trim(sSalPart) = ''   then sSalPart:='0';
  if Trim(sRemTotal) = ''  then sRemTotal:='0';

  if prOpcao1 >= 0
  then sOp1:=OraNumero(FloatToStr(prOpcao1))
  else sOp1:='0';

  if prOpcao2 >= 0
  then sOp2:=OraNumero(FloatToStr(prOpcao2))
  else sOp2:='0';

  if prOpcao3 >= 0
  then sOp3:=OraNumero(FloatToStr(prOpcao3))
  else sOp3:='0';

  if Trim(sValorReserva) = '' then sValorReserva:='0';
  if Trim(sDataRef) = ''      then sDataRef:=DateToStr(Date);

  psValorTotal:=OraNumero(psValorTotal);

  if Trim(psIdDependencia) = '' then psIdDependencia:='PRP';
  if Trim(psPercentual)    = '' then psPercentual:='0';

  if Trim(psDataInicioAnt)    = '' then psDataInicioAnt:='          ';
  if Trim(sDataRef)           = '' then sDataRef:='          ';
  if Trim(sDataInicio)        = '' then sDataInicio:='          ';
  if Trim(psDataInicioINSS)   = '' then psDataInicioINSS:='          ';
  if Trim(sDataEventoAnt)     = '' then sDataEventoAnt:='          ';
  if Trim(psDataInicioAnt)    = '' then psDataInicioAnt:='          ';

  sFlgBenefMinimo:=PegaBenefMinimo(qryAux, piIdPessJur,piIdPlanoPrev,piIdTitular,
                                     piSeqProposta, piIdBeneficio);

  // Executa Regra de Cálculo do Valor do Beneficio
  sSQL:=' SELECT DISTINCT 0 AS FLGCONCESSAO, '+
          'PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA, PP.DTINICIOINSC, '+
          'PP.SEQPROPOSTA, PF.DATANASC, PF.SEXO, PF.DATAMORTE, '+
          'EL.SALTOTAL, EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+
          'EL.TEMPOSERVTOTAL, SP.FLGINTERNO, '+
          'EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          'EL.FLGDIRETOR, '+


          //Douglas.siqueira SOL 171522  Kintana 1539190
          'NVL((SELECT round(SUM(DECODE(HB.FLGDEVOLUCAO, 1, -hb.valorprev, HB.valorprev)), '+
          '                     2) VALORHSTBENEFINSS '+
          '         FROM benefbfciario bf '+
          '         JOIN hstbenefbfciario hb ON hb.IDPLANOPREV = bf.idplanoprev '+
          '                                 AND hb.IDBENEFICIO = bf.idbeneficio '+
          '                                 AND hb.NUMEROPROCESSO = bf.numeroprocesso '+
          '                                 AND hb.IDPESSJUR = bf.idpessjur '+
          '                                 AND hb.IDTITULAR = bf.idtitular '+
          '                                 AND hb.IDPLANOORIGEM = bf.idplanoorigem '+
          '                                 AND hb.IDPESSOA = bf.idpessoa '+
          '                                 AND hb.SEQPROPOSTA = bf.seqproposta '+
          '        WHERE bf.idtitular = ' + IntToStr(piIdTitular) +
          '          AND hb.mesreferencia = ' +  QuotedStr(sAnoMesRef) +
          '          AND bf.idbeneficio <> 358 '+
          '          AND bf.fontepagadora = 2 '+
          '          AND bf.idplanoprev = ' + IntToStr(piIdPlanoPrev) +
          '          AND bf.idtppagtobenefic = 1 '+
          '          AND bf.idsitbeneficio IN (1, 2)), 0) AS VALORHSTBENEFINSS, '+
          //Douglas.siqueira SOL 171522  Kintana 1539190


          inttostr(piflgbenefmin)+' AS FLGBENEFMIN, '+
          IntToStr(piIdTitular)+' AS IDTITULAR, '+
          IntToStr(piIdPessoa)+' AS IDPESSOA, '+
          ''''+psIdDependencia+''' AS IDDEPENDENCIA, '+
          OraNumero(psPercentual)+' AS PERCENTUAL, '+
          IntToStr(piIdBeneficio)+' AS IDBENEFICIO, '+
          IntToStr(piNumeroProcesso)+' AS NUMEROPROCESSO, '+
          ''''+sDataInscFund+''' AS INSCRICAODATAFUND, '+
          OraNumero(psValorTotal)+' AS VALORTOTAL, '+
          OraNumero(psValorInfINSS)+' AS VLRINFINSS, '+
          OraNumero(psValorCalcINSS)+' AS VLRCALCINSS, '+
          OraNumero(psValorInfINSS)+' AS VLRTOTALINSS, '+ 
          sSALPART+' AS VALORPROVENTO, '+
          sREMTOTAL+' AS VALORREMTOTAL, '+
          sOp1+' AS VALORBASE1, '+
          sOp2+' AS VALORBASE2, '+
          sOp3+' AS VALORBASE3, '+
          ''''+sIdTpPagtoAnt+''' AS IDTPPAGTOANT, '+ 
          ''''+sUltMesReajAnt+''' AS ULTMESREAJANT, '+ 
          ''''+sFlgBenefMinAnt+''' AS FLGBENEFMINANT, '+ 
          ''''+Trim(sDataEventoAnt)+''' AS DATAEVENTOANT, '+ 
          ''''+Trim(sCodBeneficioAnt)+''' AS CODBENEFICIOANT, '+ 
          ''''+Trim(psDataInicioAnt)+''' AS DATAINICIOANT, '+ 
          OraNumero(psValorBenefAnt)+' AS VLBENEFPGTO, '+ 
          OraNumero(psValorBenefAnt)+' AS VALORBENEFANT, '+ 
          ''''+sFlgInternoAntes+''' AS FLGINTERNOANT, '+
          ''''+sFlgInternoAtual+''' AS FLGINTERNO, '+
          ''''+sIdSitPartAntes+''' AS IDSITPARTATUAL, '+
          ''''+sIdSitPlanAntes+''' AS IDSITPLANOATUAL, '+
          ''''+sIdSitFuncAntes+''' AS IDSITFUNCATUAL, '+
          ''''+sIdSitPartDepois+''' AS IDSITPARTNOVO, '+
          ''''+sIdSitPlanDepois+''' AS IDSITPLANONOVO, '+
          ''''+sIdSitFuncDepois+''' AS IDSITFUNCNOVO, '+
          sValorReserva+' AS VALORRESERVA, '+
          ''''+Trim(sDataRef)+''' AS DATAREF, '+
          ''''+Trim(sDataInicio)+''' AS DATAINICIO, '+
          ''''+Trim(sDataInicioINSS)+''' AS DATAEVENTO, '+ 
          ''''+Trim(sDataInicioINSS)+''' AS DATAINICIOINSS, '+
          IntToSTr(piFlgTipoInss)+' AS FLGTIPOINSS, '+
          IntToSTr(Sistema.Idmodulo)+' AS IDMODULO, '+
          IntToSTr(piNumBenef)+' AS NUMBENEF, '+
          OraNumero(slValorBase1INSS)+' AS VALORBASE1INSS, '+ 
          OraNumero(slValorBase2INSS)+' AS VALORBASE2INSS, '+ 
          OraNumero(slValorBase3INSS)+' AS VALORBASE3INSS, '+ 
          inttostr(aiflgprovisorio)+' AS FLGPROVISORIO, '+ 
          OraNumero(formatfloat('#0.000000',arpercprovisorio))+' AS PERCPROVISORIO, '+ 
          inttostr(aiprazoprovisorio)+' AS PRAZOPROVISORIO, '+ 
          sFlgBenefCotas+' AS FLGBENEFCOTAS '+
          psSQLBenefAssoc+
          ' FROM ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP, PESSOAFISICA PF '+
          ' WHERE  PP.IDPESSOA    = ' + IntToStr(piIdTitular)   + ' AND '+
          '        PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND '+
          '        PP.IDPLANOPREV = ' + IntToStr(piIdPlanoOrigem) + ' AND '+
          '        PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND '+
          '        EL.IDPESSOA    = PP.IDPESSOA          AND '+
          '        EL.IDPESSJUR   = PP.IDPESSJUR         AND '+
          '        PF.IDPESSOA    = EL.IDPESSOA          AND '+
          '        SP.IDSITPART   = PP.IDSITPART ';

  sValorBeneficio:=RegraNumerica(IntToStr(piIdRegraCalculo),sSQL, bErro, piIdCalculo );

  if bErro
   then begin
     bErro:=True;
     sMsgErro:=' Ocorreu um erro na Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+') ';
     Result:=false;
     advalorcalc:=0;
     Exit;
  end;

  if Trim(sValorBeneficio) = ''
  then begin
     bErro:=True;
     sMsgErro:=' A Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+')'+
                 ' retornou um valor em branco. ';
     Result:=false;
     advalorcalc:=0;
     Exit;
  end;

  try
     rValorBeneficio:=StrToFloat(ClienteNumero(sValorBeneficio));
  except
     bErro:=True;
     sMsgErro:=' A Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+')' +
                 ' retornou um valor inválido. [Valor Retornado = '+sValorBeneficio+']';
     Result:=false;
     advalorcalc:=0;
     Exit;
  end;
  bErro:=False;
  sMsgErro:=' ';
  Result:=true;
  advalorcalc:=rValorBeneficio;
end;

function BuscaINSSEmVigor ( qry : TwwQuery;
                            piIdPessJur, piIdPlanoPrev, piIdTitular,
                            piIdPessoa,
                            piIdBeneficioAtual  : longint;
                            psDataInicioAtual    : string;
                            var psValorCalculado, psValorInformado,
                                psDataInicio,     psNumProcINSS,
                                psValorBase1,     psValorBase2,
                                psValorBase3                    : string ) : boolean;
begin
  Result:=True;
  with qry do
  begin
     
     Close;
     SQL.Clear;
     // TRATA PENSIONISTA PEGANDO OPÇÕES NA BENEFBFCIARIO
     if piidtitular = piidpessoa then
       SQL.Add(' SELECT BF.NUMPROCINSS, BF.VALORATUAL, BF.VLRINFINSS, BF.DATAINICIOINSS, '+
               '        BF.VALORTOTAL,                                                   '+
               '        BPP.VALORBASE1, BPP.VALORBASE2, BPP.VALORBASE3                   '+
               ' FROM   PROCESSOBENEF P,     BENEFPLANOPART BPP, BENEFBFCIARIO BF,       '+
               '        BENEFPLANPREV BP,    BENEFICIO B                                 '+
               ' WHERE  (BF.IDPESSJUR       = '+IntToStr(piIdPessJur)    +')'+
               ' AND    (BF.IDPLANOPREV     = '+IntToStr(piIdPLANOPREV)  +')'+
               ' AND    (BF.IDPESSOA        = '+IntToStr(piIdPessoa)     +')'+ 
               ' AND    (BF.IDTITULAR       = '+IntToStr(piIdTitular)    +')'+
               ' AND    (BF.IDBENEFICIO     <> '+IntToStr(piIdBeneficioAtual)+')'+
               ' AND    (BF.DATAINICIOFUND  <= TO_DATE('''+psDataInicioAtual+''',''DD/MM/YYYY'') ) '+
               ' AND    (BF.IDSITBENEFICIO  IN (1,2,6) )          '+
               ' AND    (BF.IDPLANOPREV     = BP.IDPLANOPREV)   '+
               ' AND    (BF.IDBENEFICIO     = BP.IDBENEFICIO)   '+
               ' AND    (BF.NUMEROPROCESSO  = P.NUMEROPROCESSO) '+
               ' AND    (BP.FLGREFERENCIA   = 1)                '+
               ' AND    (BP.IDBENEFICIO     = B.IDBENEFICIO)    '+
               ' AND    (BPP.IDPESSJUR(+)   = BF.IDPESSJUR)     '+
               ' AND    (BPP.IDPLANOPREV(+) = BF.IDPLANOPREV)   '+
               ' AND    (BPP.IDPESSOA(+)    = BF.IDPESSOA)      '+
               ' AND    (BPP.SEQPROPOSTA(+) = BF.SEQPROPOSTA)   '+
               ' AND    (BPP.IDBENEFICIO(+) = BF.IDBENEFICIO)   '+
               ' ORDER BY BF.DATAINICIO DESC ')
     else
       SQL.Add(' SELECT BF.NUMPROCINSS, BF.VALORATUAL, BF.VLRINFINSS, BF.DATAINICIOINSS, '+
               '        BF.VALORTOTAL, '+
               '        BF.VALORBASE1, BF.VALORBASE2, BF.VALORBASE3 '+
               ' FROM   PROCESSOBENEF P, BENEFBFCIARIO BF, '+
               '        BENEFPLANPREV BP, BENEFICIO B '+
               ' WHERE  (BF.IDPESSJUR       = '+IntToStr(piIdPessJur)    +')'+
               ' AND    (BF.IDPLANOPREV     = '+IntToStr(piIdPLANOPREV)  +')'+
               ' AND    (BF.IDPESSOA        = '+IntToStr(piIdPessoa)     +')'+ 
               ' AND    (BF.IDTITULAR       = '+IntToStr(piIdTitular)    +')'+
               ' AND    (BF.IDBENEFICIO     <> '+IntToStr(piIdBeneficioAtual)+')'+
               ' AND    (BF.DATAINICIOFUND  <= TO_DATE('''+psDataInicioAtual+''',''DD/MM/YYYY'') ) '+
               ' AND    (BF.IDSITBENEFICIO  IN (1,2,6) )          '+
               ' AND    (BF.IDPLANOPREV     = BP.IDPLANOPREV)   '+
               ' AND    (BF.IDBENEFICIO     = BP.IDBENEFICIO)   '+
               ' AND    (BF.NUMEROPROCESSO  = P.NUMEROPROCESSO) '+
               ' AND    (BP.FLGREFERENCIA   = 1)                '+
               ' AND    (BP.IDBENEFICIO     = B.IDBENEFICIO)    '+
               ' ORDER BY BF.DATAINICIO DESC ');

     Open;
     qry.First;
     if not qry.IsEmpty
     then begin
        if piIdTitular <> piIdPessoa
        then psValorCalculado:=qry.FieldByName('VALORTOTAL').AsString
        else psValorCalculado:=qry.FieldByName('VALORATUAL').AsString;

        psValorInformado:=qry.FieldByName('VLRINFINSS').AsString;
        psDataInicio:=qry.FieldByName('DATAINICIOINSS').AsString;
        psNumProcINSS:=qry.FieldByName('NUMPROCINSS').AsString;
        psValorBase1:=qry.FieldByName('VALORBASE1').AsString;
        psValorBase2:=qry.FieldByName('VALORBASE2').AsString;
        psValorBase3:=qry.FieldByName('VALORBASE3').AsString;
     end
     else begin
        psValorCalculado:='0';
        psValorInformado:='0';
        psDataInicio:='';
        psNumProcINSS:='';
        psValorBase1:='0';
        psValorBase2:='0';
        psValorBase3:='0';
     end;
     Close;
  end;
  Result:=True;
end;

Function  BuscaSituacoesPart(qryAux: TwwQuery; piIdTitular, piIdPlanoPrev,
                             piIdPessJur: Integer; psDataEvento: String;
                             Var sFlgInternoAntes : String;
                             Var sFlgInternoAtual : String;
                             Var sIdSitPartAntes  : String;
                             Var sIdSitPartDepois : String;
                             Var sIdSitPlanAntes  : String;
                             Var sIdSitPlanDepois : String;
                             Var sIdSitFuncAntes  : String;
                             Var sIdSitFuncDepois : String): Boolean;
Begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT EV.IDEVENTOSPREV,  EV.IDSITPLANOATUAL, EV.IDSITPLANONOVO, '+
             '        EV.IDSITPARTATUAL, EV.IDSITPARTNOVO,   EV.IDSITFUNCATUAL, EV.IDSITFUNCNOVO, '+
             '        ST.FLGINTERNO,     STA.FLGINTERNO AS FLGINTERNOANT    '+
             ' FROM   EVENTOSPREV EV,    SITPART ST,  SITPART STA  '+
             ' WHERE  EV.IDSITPARTATUAL = STA.IDSITPART         '+
             ' AND    EV.IDSITPARTNOVO  = ST.IDSITPART          '+
             ' AND    EV.IDEVENTOSPREV IN ( SELECT MAX(IDEVENTOSPREV) FROM EVENTOSPREV    '+
             '                              WHERE  IDPESSOA    = '+ IntToStr(piIdTitular)   +
             '                              AND    IDPLANOPREV = '+ IntToStr(piIdPlanoPrev) +
             '                              AND    IDPESSJUR   = '+ IntToStr(piIdPessJur)   +
             '                              AND   DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
             '                                                     WHERE IDPESSOA     = '+IntToStr(piIdTitular)+
             '                                                     AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
             '                                                     AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+') '+
             '                              AND    DATAEVENTO  >= TO_DATE('''+psDataEvento+''',''DD/MM/YYYY''))');
  qryAux.Open;

  sFlgInternoAntes:=qryAux.FieldByName('flginternoant').AsString;
  sFlgInternoAtual:=qryAux.FieldByName('flginterno').AsString;

  sIdSitPartAntes:=qryAux.FieldByName('idsitpartatual').AsString;
  sIdSitPlanAntes:=qryAux.FieldByName('idsitplanoatual').AsString;
  sIdSitFuncAntes:=qryAux.FieldByName('idsitfuncatual').AsString;

  sIdSitPartDepois:=qryAux.FieldByName('idsitpartnovo').AsString;
  sIdSitPlanDepois:=qryAux.FieldByName('idsitplanonovo').AsString;
  sIdSitFuncDepois:=qryAux.FieldByName('idsitfuncnovo').AsString;
End;

function PegaBenefMinimo(qryAux : TwwQuery;
                         piIdPessJur,piIdPlanoPrev,piIdTitular,
                         piSeqProposta, piIdBeneficio : longint) : string;
begin
   Result:='0';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT FLGBENEFMIN FROM BENEFBFCIARIO '+
                  ' WHERE  (IDPESSJUR    = '+IntToStr(piIdPessJur)  + ')'+
                  ' AND    (IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+ ')'+
                  ' AND    (IDPESSOA     = '+IntToStr(piIdTitular)+ ')'+
                  ' AND    (SEQPROPOSTA  = '+IntToStr(piSeqProposta)+ ')'+
                  ' AND    (IDBENEFICIO  = '+IntToStr(piIdBeneficio)+ ')');
   qryAux.Open;
   if (not qryAux.IsEmpty) and (Trim(qryAux.FieldByName('FlgBenefMin').AsString) <> '')
   then Result:=Trim(qryAux.FieldByName('FlgBenefMin').AsString);
end; // PegaBenefMinimo

end.
{==============================================================================|
| UNIT: UBENEFICIOFOLHA                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FUNÇÕES ORIGINÁRIAS DA UNIT UBENEFICIO DO ADMPREV ADAPTADAS PARA A FOLHA   |
| DE BENEFÍCIOS.                                                               |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/11/2002 A 11/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   CRIAÇÃO INICIAL DA UNIT.                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2003 A 24/06/2003                         |
| PENDÊNCIA: 14346                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06H                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR ORIEM E DIBSUPL NA CONSULTA PARA A REGRA DE REAJUSTE               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2003 A 24/06/2003                         |
| PENDÊNCIA: 14348                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06H                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - GRAVAR O VALORATUAL PARA PENSÃO DE INSS                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2003 A 24/06/2003                         |
| PENDÊNCIA: 14373                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06H                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DOS CAMPOS RELATIVOS AOS DADOS DO BENEFÍCIO ANTERIOR PARA A REGRA |
| DE REAJUSTE DE INSS, DE FORMA QUE O PROCESSAMENTO DA REGRA SEJA IGUAL AO REA-|
| LIZADO NA CONCESSÃO.                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2003 A 24/06/2003                         |
| PENDÊNCIA: 14374                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06H                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ACERTO DA CONSULTA QUE OBTÉM O VALOR DA DIBSUPL. FALTAVA UM JOIN.          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2003 A 24/06/2003                         |
| PENDÊNCIA: 14347                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06H                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PASSAR OS CAMPOS VLRCALCINSS E VLRINFINSS DO HISTÓRICO DE BENEFÍCIOS PARA  |
| A CONSULTA DE REAJUSTE DE INSS.                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2005 A 24/06/2005                         |
| PENDÊNCIA: 19341                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.05.05b                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Atribuir a datainicioinssant passado para a regra|
|                             o campo dibbenefant caso o mesmo não tenha valor |
|                                                                              |
|------------------------------------------------------------------------------}

