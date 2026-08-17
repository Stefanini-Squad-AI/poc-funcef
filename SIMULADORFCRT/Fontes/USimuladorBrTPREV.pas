unit USimuladorBrTPREV;

interface

uses  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
      Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      ComCtrls, Machklb,Registry,checklst, StdCtrls, Spin, Math ;

const
      cteIdModuloAdmPREV  = 16;
      cteIdModuloCCP      = 32;
      cteIdModuloFolhaBen = 18;
      cteIdModuloFolhaCM  = 21;

var   iIdFundacao     : longint;
      iIdCalculoGeral : longint;
      prmCalculaSRBNoRetroativo : boolean;
      prmIdRegraCalcBenefMin : longint;
      prmNumTentativasSalario : longint;
      sTipoTelaBenef : string;
      procedure TiraSQL( qry : TwwQuery);
      procedure VerifIndiceHist(qryaux : twwquery;  var sIndice : String ; sIdPLanoPrev, sIdTipoReserva: String ; sDataCota : String);
      function  OraNumero(sNumero : string):string;
      function  ClienteNumero(sNumero : string):string;
      function  RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
      function  RegraNumerica(sNumRegra,sSQL : string;var bErro : boolean; var piIdCalculo : integer) : string;
      function  TruncaRound(f:String;n:integer):string;
      function  ArredondaValor(Valor : String) : Extended;
      function  AnoMesAnterior(iMes, iAno : integer) : string;
      function  SAnoMesAnterior(sAnoMes : string   ) : string;
      function  ProximoAnoMes(iMes,iAno : integer)   : string;
      function  PreparaStrRegra( str : string ) : string;
      function  ValorProRataUltimo(psValorIntegral , psDataRefFinal : string) : double;
      function  ValorProRataPrimeiro(psValorIntegral, psDataRefInicio : string) : double;
      function  CalcRUBPARCIAL(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;
      function  CalcSalVIRTUAL(iIdPessJur, iIdPessoa  : integer; sMesRef : string; qry : TwwQuery) : string;
      function  CalcRUBMANTIDO(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;
      function  VoltaValorCotacao(qryaux : Twwquery ; sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva, sDataMov : String) : Double;
      function  CalcDataInscFund(iIdPessjur,iIdPlanoPrev,iIdPessoa,iSeqProposta : integer; qry : TwwQuery):string;
      function  CalcRemTotal(iIdPessJur, iIdPessoa : integer; sMesRef : string;qry : TwwQuery) : string;
      function  BuscaSalarioPESSOA (qryAux : TwwQuery;
                             piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                             psFlgIntSitPartHOJE,
                             psAnoMesBusca : string ) : string;

      function  BuscaUltimoEvento         ( qryAux                              : TwwQuery;
                                           piIdPessJur,   piIdPlanoPrev,
                                           piIdPessoa ,   piSeqProposta        : longint;
                                           psDataRef,
                                           psNomeCampoRetorno                  : string ) : string ;
      function BuscaSalario(piIdPessJur, piIdPlanoPrev, piIdPessoa  : longint;
                      psAnoMes, psSitFundacao,
                      sSalario                 : string;
                      var sMsgErro             : string;
                      qryAux                   : TwwQuery ) : string;
      function PegaValorIntegral( qryAux              : TwwQuery;
                            piNumeroProcesso,
                            piIdBeneficio,
                            piIdBeneficiario    : longint;
                            psDataInicio        : string;
                            piIdMotivo          : longint = -1 ) : double ; // CAMILLE - 28.11.2003

      function  AtualizaFlgDesativado    ( qryAux                        : TwwQuery;
                                          piIdPessJurAtual,
                                          piIdPlanoPrevAtual,
                                          piIdPessoa , piSeqProposta    : longint ) : boolean;

      function BuscaNumDiasBenefAnterior ( qry : TwwQuery;
                                     piIdPlanoPrev : longint;
                                     piIdBeneficio : longint ) : word;

      function  MontaSQLBenefAssoc (qryBenefAux: TwwQuery; piNumOrdem : longint) : string;
      
      function BuscaINSSEmVigor ( qry : TwwQuery;
                            piIdPessJur, piIdPlanoPrev, piIdTitular,
                            piIdPessoa,
                            piIdBeneficioAtual  : longint;
                            psDataInicioAtual    : string;
                            var psValorCalculado, psValorInformado,
                                psDataInicio,     psNumProcINSS,
                                psValorBase1,     psValorBase2,
                                psValorBase3, psNumProcesso                    : string ) : boolean;

      function  PegaBenefMinimo(qryAux : TwwQuery;
                         piIdPessJur,piIdPlanoPrev,piIdTitular,
                         piSeqProposta, piIdBeneficio : longint) : string;

      function  CalcSalPart(iIdPessJur, iIdPessoa  : integer; sMesRef : string; qry : TwwQuery) : string;

      function  CalcReservaPart( iIdPessJur, iIdPlanoPrev, iIdPessoa, iIdRegra, iSeqProposta : integer;
                          sDataRef, sDataInicio, sDataInicioPagto,
                          sDataRequerBenef, iIdBeneficio : string;
                          qry : TwwQuery):string;

      function  BuscaSituacoesPart(qryAux: TwwQuery; piIdTitular, piIdPlanoPrev,
                             piIdPessJur: Integer; psDataEvento: String;
                             Var sFlgInternoAntes : String;
                             Var sFlgInternoAtual : String;
                             Var sIdSitPartAntes  : String;
                             Var sIdSitPartDepois : String;
                             Var sIdSitPlanAntes  : String;
                             Var sIdSitPlanDepois : String;
                             Var sIdSitFuncAntes  : String;
                             Var sIdSitFuncDepois : String): Boolean;

      function  BuscaSalarioPESSOAINTEGRAL (qryAux : TwwQuery;
                                     piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                     psFlgIntSitPartHOJE,
                                     psAnoMesBusca : string ) : string;
      function  VerificaFechamento(const lIdPessJur, lIdModulo: LongInt;
                            const sAnoMesRef: string; const sOperacao: Char;
                            var   cTipoEnvPrev: Char): Boolean;

      function  VerificaUltimoReajuste(qryAux : twwquery;
                                pinumeroprocesso : longint) : string;

      function  ExecutaRegraValorTotal(qryAux : TwwQuery;
                                piIdRegraCalculo,  piIdPessJur,
                                piIdPlanoPrev,     piIdTitular,
                                piSeqProposta,     piNumeroProcesso,
                                piIdBeneficio,
                                piNumBenef                             : longint;
                                prOpcao1,          prOpcao2,
                                prOpcao3                               : double;
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
                                piIdPessoa : LongInt = -1;
                                piIdBeneficiario : LongInt = -1;      //  Augusto 18/02/2004
                                piFlgProvisorio       : integer = 0;            // Camille - 19.04.2004
                                piPrazoProvisorio     : integer = 0;            // Camille - 19.04.2004
                                pdPercProvisorio      : double  = 0 ) : double; // Camille - 19.04.2004


      function  ExecutaRegraCalculoBeneficio(qryAux                : TwwQuery;
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
                                      psDataFinalBenef      : String  = '';           // Gleyber - 20/08/2003 - Pendencia 14851
                                      piFlgProvisorio       : integer = 0;            // Camille - 19.04.2004
                                      piPrazoProvisorio     : integer = 0;            // Camille - 19.04.2004
                                      pdPercProvisorio      : double  = 0 ) : double; // Camille - 19.04.2004
      function ExecutaRegraCalculoSRB(qryAux : TwwQuery;
                                piIdRegraCalculo,
                                piIdPessJur, piIdPlanoPrev, piIdTitular,
                                piSeqProposta, piIdBeneficio, piNumeroProcesso,
                                piIdSitFunc, piIdSitPart, piIdSitPlano : longint;
                                prOpcao1, prOpcao2, prOpcao3           : double;
                                psSQLBenefAssoc,
                                psDataEvento, psDataInicio, psDataInicioINSS,
                                psDataInicioPagto,
                                psDataRequerimento,
                                psValorInfINSS,
                                psValorCalcINSS,
                                psValorReserva      : string;
                                bBeneficioGrupo     : boolean;
                                piFlgTipoInss       : integer;
                                psDataInicioAnt,
                                psValorBenefAnt,
                                psVALORBINSSANT1,
                                psVALORBINSSANT2,
                                psVALORBINSSANT3    : string;
                                var bErro           : boolean;
                                var sMsgErro        : string;
                                var piIdCalculo     : longInt;
                                piFlgPossuiAcompINSS : integer) : double;

      function BuscaDadosBeneficioAnterior ( qry : TwwQuery;
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
                                           pbAlteraDataInicioEValor : boolean;
                                           piIdPessoa : Integer = -1 ) : boolean;


      function PegaValorEmReal(  qryAux             : TwwQuery;
                           piIdTitular,
                           piIdBeneficiario,
                           piIdPessJur,
                           piIdPlanoPrev,
                           piIdBeneficio,
                           piSeqProposta,
                           piTotBeneficiarios : longint;
                           psDataInicio,
                           psDataPagamento,
                           psMesReferencia    : string; // CGUEDES - 22/07/2002
                           pdValorEmCotas     : double;
                           var bErro          : boolean;
                           var sMsgErro       : string ) : string;
      function CalcBeneficioINSSAtual( iIdPessJur,
                                 iIdPlanoPrev,
                                 iIdPessoa            : longint;
                                 sMesInicio,
                                 sMesRef              : string;
                                 var psIDTPPAGTOANT,
                                     psFlgBenefMinimo : string;
                                 qry                  : TwwQuery;
                                 iINumProcesso        : Integer;
                                 psFlgCampoRetorno : String = 'I')  : string; // Gleyber - 19/11/2002) : string;

      function  ExecutaRegraValorAbono( qryAux              : TwwQuery;
                                  piIdRegraCalculo,
                                  piIdPessJur,
                                  piIdPlanoPrev,
                                  piIdTitular,
                                  piSeqProposta,
                                  piIdPessoa,
                                  piIdBeneficio       : longInt;
                                  psDataInicio,
                                  psDataFinal,
                                  psAnoMesAtual       : string;
                                  prValorBenef        : double;
                                  psFlgProvisorio     : String;  // Gleyber - 16/12/2002
                                  var bErro           : boolean;
                                  var sMsgErro        : string;
                                  piTipoMov       : word;               // CAMILLE - 23.01.2003
                                  piNumBenef      : integer;  // CAMILLE - 27.01.2003
                                  psDataInicioFund : String = '') : double; { Augusto 11/11/2003 }

      function ExecutaRegraPrimUltPagtoBenef(qryAux : TwwQuery;
                                    piIdRegraPrimUltPagto,
                                    piIdTitular, piIdBeneficiario, piSeqProposta,
                                    piIdPessJur, piIdPlanoPrev,
                                    piIdBeneficio,  piTotBeneficiarios : longint;
                                    psDataInicio, psDataFinal,psValorTotal, psPrimUltPagto : string;
                                    var bErro : boolean;
                                    var sMsgErro : string) : double;


      function PagaMesPagAbono(QryAux:TwwQuery;  iIdPessjur, iIdPlanoPrev, iIdBeneficio : Integer; sMesPagAtual : String) : String;

      function BuscaPlanoOrigem ( pIdPessjur  : longint;
                            pIdTitular  : longint;
                            psAnoMesRef : string;
                            pIdPessoa   : longint = 0): String;

      function PegaSeqBeneficio(qryAux : TwwQuery;
                          piIdPessJur,   piIdTitular,
                          piIdPlanoPrev, piIdPessoa,
                          piSeqProposta, piNumeroProcesso,
                          piIdBeneficio, piIdMotivo         : longint;
                          psAnoMesPgmto, psAnoMesRef        : string): word;

      function  PreparaBeneficioConcedido( qryAux                                              : TwwQuery;
                                    piIdTitular,   piIdBeneficiario, piSeqProposta,
                                    piIdPessJur,   piIdPlanoPrev,    piNumeroProcesso,
                                    piIdBeneficio, piIdMotivo,       piTotBeneficiarios,
                                    piIdRegraCalculo,                piIdRegraReajuste,
                                    piIdRegraPrimPagto,              piIdRegraUltPagto,
                                    piIdTpPagto, piCodPortForma                         : longint;
                                    psNomeBeneficio, psNomePatro,    psNomePlano,
                                    psMatriculaTitular, psDataInicio, psDataFinal,
                                    psCalculaTodoMes                                    : string;
                                    dValorEmReal, dValorEmCotas, dValorTotal            : double;
                                    pbCalculaPrimUltPgto                                : boolean;
                                    var prValorAtualizadoRateado,
                                        prValorAtualizadoTotal : double;
                                    var psUltMesReajuste : string;
                                    var bErro, pbPreparaContrib13                       : boolean;
                                    var sMsgErro                                        : string;
                                    var piIdLote                                        : longint;
                                    psDataInicioOriginal                                : string;
                                    piTipoMov                                           : word; // Tipos de Movimento :
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
                                                                                                // 13 - Revisão de Benefícios.

                                    piFlgDataPrevista                                   : word;
                                    var dValorSRB                                       : double;
                                    pbMigracaoPlano : Boolean = False  //leofuncef - 06042004
                                    ) : boolean;
      function  CriticaDataCobrancaSit( qry : TwwQuery;
                                 sIdPessJur, sIdPlanoPrev, sSitFundacao : string;
                                 sTipoData                              : char;
                                 sMesReferencia, sAnoReferencia         : string) : string;

      function  VerificaSePagaAbonoParticip( qryAux : TwwQuery;
                              piIdPlanoPrev, piIdBeneficio : longInt;
                              psDataInicio,  psDataFinal   : string;
                              var piIdRegraAbono           : longint;
                              var pcTipoAbono              : char; // A - final do Ano e B - final do Beneficio
                              var bErro                    : boolean;
                              var sMsgErro                 : string) : boolean;

      function CalculaBeneficioMinimo ( piNumeroProcesso,
                                  piIdPessJur,
                                  piIdPlanoPrev,
                                  piIdTitular,
                                  piIdPessoa,
                                  piIdBeneficio           : longint;
                                  psValorPrev,
                                  psValorTotal            : string;
                                  piNumBenef              : word;
                                  psAnoMesReferencia,
                                  psDataInicio,
                                  psDataFinal             : string;
                                  var pdValorDepoisMinimo : double;
                                  var sMsgErro            : string ) : boolean;

      function ReajustaBenefConc (  qryAux                : TwwQuery ;
                              psAnoMesRef           ,
                              psDataInicio          : string;
                              piIdPessJur,
                              piIdPlanoPrev,
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
                                  bErro             : boolean;
                                  pbBenefReferencia : boolean;
                              var sMsgErro          : string;
                              var dValorTotal,
                                  dValorSRB         : double;
                                  pbRetroativo      : boolean;           // CAMILLE - 20.01.2003
                                  piOrigem          : integer;           // CAMILLE - 24.06.2003
                                  psUltMesReajuste  : string = '';
                                  pbCalculaTudo : Boolean = False;
                                  pbMigracaoPlano : Boolean = False  //leofuncef - 06042004
                                  ) : string; // CAMILLE - 27.11.2003

      function ExecutaRegraCalculoBeneficioBfciario(qryAux : TwwQuery;
                                      piIdRegraCalculo,    piIdRegraCalcReserva,
                                      piIdPessJur,         piIdPlanoPrev,
                                      piIdTitular,         piSeqProposta,
                                      piIdBeneficio,       piNumeroProcesso,
                                      piNumBenef          : longint;
                                      prOpcao1,            prOpcao2,
                                      prOpcao3                                 : double;
                                      psSQLBenefAssoc,     psDataEvento,
                                      psDataInicio,        psDataInicioINSS,
                                      psValorTotal,        psValorInfINSS,
                                      psValorCalcINSS,     psValorReserva      : string;
                                      var bErro                                : boolean;
                                      var sMsgErro                             : string;
                                      var piIdCalculo                          : longInt;
                                      piIdPessoa                               : longint;
                                      psIdDependencia,     psPercentual        : string;
                                      piFlgTipoInss                            : integer;
                                      psDataInicioAnt,
                                      psValorBenefAnt                          : string;
                                      psAnoMesRef : String = '';
                                      piIdBeneficiario : LongInt = -1;      //  Augusto 18/02/2004
                                      piFlgProvisorio       : integer = 0;            // Camille - 19.04.2004
                                      piPrazoProvisorio     : integer = 0;            // Camille - 19.04.2004
                                      pdPercProvisorio      : double  = 0 ) : double; // Camille - 19.04.2004



      function CalculaBeneficioAPagarNoMes(qryAux                        : TwwQuery;
                                     psAnoMesCalculo               : string;
                                     piIdTitular,
                                     piIdBeneficiario,
                                     piSeqProposta,
                                     piIdPessJur,
                                     piIdPlanoPrev,
                                     piNumeroProcesso,
                                     piIdBeneficio,
                                     piTotBeneficiarios,
                                     piIdRegraPrimPagto,
                                     piIdRegraUltPagto,
                                     piIdTpPagto                   : longint;
                                     psDataInicio,
                                     psDataFinal,
                                     psUltMesCalculo,
                                     psCalculaTodoMes              : string;
                                     var
                                     dValorEmReal, //leocbs - 29052002 - coloquei o var
                                     dValorTotal                   : double;
                                     dValorEmCotas                 : double;
                                     pbCalculaPrimUltPgto          : boolean;
                                     psDataInicioOriginal          : string;
                                     piTipoMov,
                                     piFlgDataPrevista             : word;
                                     var bErro, bReajustou         : boolean;
                                     var sUltMesReajuste           : string;
                                     var pdValorBeneficioIntegralOriginal,
                                         pdValorBeneficioIntegralAposMinimo,
                                         pdValorPrevAntesMinimo,
                                         pdValorBenefRateado,                 // AUGUSTO - 30.01.2003
                                         pdValorSRBRetorno         : double;  // CAMILLE - 23.08.2002
                                     psDataPagamento               : string;
                                     pbCalculaTudo : Boolean = False ;{ Augusto 20/02/2004 }
                                     pbMigracaoPlano : Boolean = False  //leofuncef - 06042004
                                      ) : double;

      function ArredondaMoeda(pNumero: double) : double;
      function TruncaMoeda(pNumero: double) : double;

implementation

uses DAPrev, DBaseDados, UDataBase, UMensErro, USistema, FAguarde, UPCS, UFuncoesUteis;

function OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if (sNumero[i] = ',') or (sNumero[i] = '@')
     then begin
        if sNumero[i] = '@'
        then DecimalSeparator := ',';
        
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
   Result := sResult;
end;

function ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   // CAMILLE - REFER - 23.08.1999
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

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
   Result := sResult;
end;

function RegraNumerica(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var cAux : char;
begin
   Result := '0';
   bErro := False;

   iIdCalculoGeral := 0;
   // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
   // erro se o idcalculo for menor que zero
   if piIdCalculo < 0 then piIdCalculo := 0;
   if Trim(sNumRegra) = '' then Exit;

   with dtmAPrev do
   begin
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
      cAux                 := DecimalSeparator;
      regraAPrev.QueryIn   := dtmAPrev.qryRegra;
      regraAPrev.IdCalculo := piIdCalculo;
      try
         regraAPrev.Execute;
      finally
         DecimalSeparator := cAux;
         iIdCalculoGeral := 0;
      end;

      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;

         // Verificar se o resultado da regra é um número válido
         try
            StrToFloat(ClienteNumero(RegraAPrev.Result))
         except
            MsgDlg('O valor retornado pela regra Nº '+sNumRegra+' não é um valor válido. Verifique. '+
                   '[VALOR = '+RegraAPrev.Result+']','Erro',mtError,[mbOk, mbHelp],0);
            bErro := True;
            piIdCalculo := -1;
         end;

         Result := OraNumero(regraAPrev.Result);
      end // if not regra.error
      else begin
         bErro := True;
         piIdCalculo := -1;
      end;

      qryRegra.Close;
   end;
end;

function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
    cAux    : char;
begin
   Result := True;
   bErro  := False;

   if Trim(sNumRegra) = '' then Exit;
   iIdCalculoGeral := 0;

   Result := False;
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
         tirasql(qryRegra);
         Exit;
      end;
      cAux := DecimalSeparator;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;
      try
         regraAPrev.Execute;
      finally
         DecimalSeparator := cAux;
         iIdCalculoGeral := 0;         
      end;
      if not regraAPrev.Error
      then begin
         sResult     := Trim(UpperCase(regraAPrev.Result));
         if sResult  = 'FALSE'
         then Result := False
         else Result := True;
      end // if not regra.error
      else bErro     := True;
      qryRegra.Close;
   end;
end;

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

function AtualizaFlgDesativado    ( qryAux                        : TwwQuery;
                                    piIdPessJurAtual,
                                    piIdPlanoPrevAtual,
                                    piIdPessoa , piSeqProposta    : longint ) : boolean;
begin
   Result := False;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add('  UPDATE PARTPREVPLAN SET FLGDESATIVADO = 1               '+
              '  WHERE  IDPESSOA     = '+IntToStr(piIdPessoa)             +
              '  AND    SEQPROPOSTA  = '+IntToStr(piSeqProposta)          +
              '  AND    ( (IDPLANOPREV  <> '+IntToStr(piIdPlanoPrevAtual) +') OR ' +
              '           (IDPESSJUR    <> '+IntToStr(piIdPessJurAtual)   +') )  ' );
      try
         ExecSQL;
      except
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('  UPDATE PARTPREVPLAN SET FLGDESATIVADO = 0          '+
              '  WHERE  IDPESSOA     = '+IntToStr(piIdPessoa)        +
              '  AND    SEQPROPOSTA  = '+IntToStr(piSeqProposta)     +
              '  AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrevAtual)+
              '  AND    IDPESSJUR    = '+IntToStr(piIdPessJurAtual)  );
      try
         ExecSQL;
      except
         Exit;
      end;
   end;
   Result := True;
end; // AtualizaFlgDesativado

function SAnoMesAnterior(sAnoMes : string) : string;
var iAno, iMes : integer;
begin
   Result := '';
   iAno := StrToInt(Copy(sAnoMes,1,4));
   iMes := StrToInt(Copy(sAnoMes,6,2));
   Result := AnoMesAnterior(iMes,iAno);
end;

function ProximoAnoMes(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if (iMes = 12) or (iMes = 13)
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

function PreparaBeneficioConcedido( qryAux                                              : TwwQuery;
                                    piIdTitular,   piIdBeneficiario, piSeqProposta,
                                    piIdPessJur,   piIdPlanoPrev,    piNumeroProcesso,
                                    piIdBeneficio, piIdMotivo,       piTotBeneficiarios,
                                    piIdRegraCalculo,                piIdRegraReajuste,
                                    piIdRegraPrimPagto,              piIdRegraUltPagto,
                                    piIdTpPagto, piCodPortForma                         : longint;
                                    psNomeBeneficio, psNomePatro,    psNomePlano,
                                    psMatriculaTitular, psDataInicio, psDataFinal,
                                    psCalculaTodoMes                                    : string;
                                    dValorEmReal, dValorEmCotas, dValorTotal            : double;
                                    pbCalculaPrimUltPgto                                : boolean;
                                    var prValorAtualizadoRateado,
                                        prValorAtualizadoTotal : double;
                                    var psUltMesReajuste : string;
                                    var bErro, pbPreparaContrib13                       : boolean;
                                    var sMsgErro                                        : string;
                                    var piIdLote                                        : longint;
                                    psDataInicioOriginal                                : string;
                                    piTipoMov                                           : word; // Tipos de Movimento :
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
                                                                                                // 13 - Revisão de Benefícios.

                                    piFlgDataPrevista                                   : word;
                                    var dValorSRB                                       : double;
                                    pbMigracaoPlano : Boolean = False  //leofuncef - 06042004
                                    ) : boolean;
var
  iSeqBeneficio,
  iMes, iIdLote, iIdRegraAbono          :  longint;
  sDataCompetencia,
  sAnoMesDataFinal, sDataFolha,
  sAnoMesDataInicio,       sAnoMesLote,
  sMesAtual,        sMesFinal,
  sMesRef,          sAnoRef,
  sMesUltPreparo,   sDescPreparo,
  sAnoMesAtual,     sData,
  sAnoMesRefAbono,  sAnoMesPagAbono,
  sDataPagAbono,
  sAnoMesFinal,
  sDezembroAnoAnterior,
  sValorReajustar,
  sValorInteiro, // sem 1o. ou ultimo pgto
  sValorFinal,
  sValorAbono,
  sIdRegraCalculo                       : string;

  dValorBenefRateado, { Augusto 23/01/2003 }
  rValorBase1,
  rValorBase2,
  rValorBase3,
  rValorTotalLote,
  rValorBenefTitular,
  rValorAbono,
  rValorBenef                           : double;

  cTipoAbono                            : char;
  bReajustou,

  bPrimeiroDoLote,
  bPagtoUnico,
  bPagaAbono,
  bPossuiAbono,
  bPagaIntegral,
  bJaGravouLote                         : boolean;
  iIncluiMesConc                        : integer;

  sFlgDevolucao,
  scodportforma , splanoorigem                        : string;

  dValorBeneficioNoMes,
  dValorBeneficioIntegralAposMinimo,
  dValorBeneficioIntegral,
  dValorPrevAntesMinimo                 : double;
  // Gleyber - 09/10/2002
  sFlagProvisorio, sVlrInfINSSInicial, sFlgReferencia  : String;
  //
  sDIbBenefAnt, sDataInicioParaCalculo, sDataInicioParaAbono                  : string; // CAMILLE - 23.01.2003
  iIdTitBenef                           : longint;


  sSQL, sMesAbono : String;
begin
  Result           := False;
  bErro            := False;
  bPagaAbono       := False;
  bPossuiAbono     := False;
  bJaGravouLote    := False;
  bPrimeiroDoLote  := False;
  bPagtoUnico      := False;
  iIdRegraAbono    := -1;
  rValorAbono      := 0; sValorAbono := '0'; dValorBenefRateado := 0; { Augusto 30/01/2003 }

  // Gleyber - 09/10/2002 - Início
  // Verifica o flagprovisorio
  qryAux.Close;
  qryAux.SQL.Clear;
  { Augusto 03/06/2004 - Inclusão da BENEFPLANPREV e FLGREFERENCIA }
  qryAux.SQL.Add(' SELECT BF.FLGPROVISORIO, BF.VLRINFINSS, BP.FLGREFERENCIA,  '+ { Augusto 10/11/2003 }
                 ' BF.DIBBENEFANT '+ { Augusto 17/06/2003 }
                 ' FROM BENEFBFCIARIO BF, BENEFPLANPREV BP'+
                 ' WHERE (BF.IDPESSJUR      ='+ IntToStr(piIdPessJur)+')'+
                 '   AND (BF.IDPLANOPREV    ='+ IntToStr(piIdPlanoPrev)+')'+
                 '   AND (BF.IDTITULAR      ='+ IntToStr(piIdTitular)+')'+
                 '   AND (BF.SEQPROPOSTA    ='+ IntToStr(piSeqProposta)+')'+
                 '   AND (BF.IDPESSOA       ='+ IntToStr(piIdBeneficiario)+')'+
                 '   AND (BF.IDBENEFICIO    ='+ IntToStr(piIdBeneficio)+')'+
                 '   AND (BF.NUMEROPROCESSO ='+ IntToStr(piNumeroProcesso)+')'+

                 '   AND (BF.IDPLANOPREV    = BP.IDPLANOPREV)'+
                 '   AND (BF.IDBENEFICIO    = BP.IDBENEFICIO)');
  qryAux.Open;

  // cguedes - 24/10/2002
  sFlagProvisorio    := IntToStr(qryAux.FieldByName('FLGPROVISORIO').AsInteger);
  { Augusto 10/11/2003 }
  sVlrInfINSSInicial := qryAux.FieldByName('VLRINFINSS').AsString;
  { Augusto 03/06/2004 }
  sFlgReferencia := qryAux.FieldByName('FLGREFERENCIA').AsString;
  { Augusto 17/06/2004 }
  sDIbBenefAnt   := qryAux.FieldByName('DIBBENEFANT').AsString;



  // Gleyber - 09/10/2002 - Fim

  // Verificar se o beneficio é pagamento unico
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT T.FLGFREQUENCIA '+
                 ' FROM   TPPAGTOBENEFICIO T   '+
                 ' WHERE  T.IDTPPAGTOBENEFIC = '+IntToStr(piIdTpPagto));
  qryAux.Open;
  if (qryAux.IsEmpty) or (qryAux.FieldByName('FlgFrequencia').AsString <> 'U')
  then bPagtoUnico := False
  else bPagtoUnico := True;

  // CAMILLE - 09.04.2002
  if bPagtoUnico and (psDataFinal <> '')
  then psDataFinal := '';

  // Verificar se o beneficio é para pagar integral no último mês de data prevista
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BP.FLGPAGAINTEG    '+
                 ' FROM   BENEFPLANPREV BP   '+
                 ' WHERE  BP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                 ' AND    BP.IDBENEFICIO   = '+IntToStr(piIdBeneficio));

  qryAux.Open;
  if not (qryAux.IsEmpty) and (qryAux.FieldByName('FLGPAGAINTEG').AsInteger > 0)
  then bPagaIntegral := True
  else bPagaIntegral := False;


  sMesUltPreparo   := '';

  sAnoMesDataInicio       := Copy(psDataInicio, 7,4)+'/'+Copy(psDataInicio, 4,2);
  sMesRef          := Copy(psDataInicio, 4,2);
  sAnoRef          := Copy(psDataInicio, 7,4);

  // Buscar ano/mes de pagamento e data prevista para o lote
  if piIdLote > 0
  then begin
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT DATAPREPARO, MESREFERENCIA, NVL(FLGINCLUIMESCONC,1) FLGINCLUIMESCONC FROM CTRLINTERFACE '+
                ' WHERE  IDLOTE = '+IntToStr(piIdLote));
        Open;

//        sDataFolha     := FieldByName('DATAPREPARO').AsString;
        // CAMILLE - 08.05.2002
        // A data tem que ser do calendário
        // CGUEDES - 14/05/2002: MUDEI A LINHA ABAIXO DE POSIÇÃO, POIS A QRYAUX
        // ERA ALTERADA NA FUNÇÃO CriticaDataCobrancaSit.
        iIncluiMesConc := FieldByName('FLGINCLUIMESCONC').Asinteger;
        sAnoMesLote    := FieldByName('MESREFERENCIA').AsString;
        sDataFolha := CriticaDataCobrancaSit(qryAux,IntToStr(iIdFundacao),'', 'AS', 'P',
                                             Copy(sAnoMesLote,6,2),
                                             Copy(sAnoMesLote,1,4) );

     end;
  end
  else begin
     sDataFolha := CriticaDataCobrancaSit(qryAux,IntToStr(iIdFundacao),'', 'AS', 'P',
                                          Copy(DateToStr(date),4,2),
                                          Copy(DateToStr(date),7,4) );

     if Trim(sDataFolha) = '' then sDataFolha := DateToStr(date);
     sAnoMesLote := Copy(sDataFolha,7,4) + '/' +Copy(sDataFolha,4,2);
  end;

  sDezembroAnoAnterior := IntToStr(StrToInt(Copy(sAnoMesLote,1,4))-1)+'/12';

  // Se o lote já foi gerado, nao gerar outro lote
  if piIdLote > 0
  then begin
     iIdLote       := piIdLote;
     bJaGravouLote := True;
  end
  else begin
     iIdLote        := LeUltRegistro(qryAux,'CTRLINTERFACE');
     piIdLote       := iIdLote;
     bJaGravouLote  := False;
     sDescPreparo   := 'Matrícula: '+psMatriculaTitular+' - Processo n°: '+IntToStr(piNumeroProcesso)+' - '+psNomeBeneficio;
     iIncluiMesConc := 1;
  end;

  // Verificar se o benefício tem abono
  bPossuiAbono := VerificaSePagaAbonoParticip( qryAux, piIdPlanoPrev, piIdBeneficio,
                                             psDataInicio,  psDataFinal,
                                             iIdRegraAbono,
                                             cTipoAbono, // A - final do Ano e B - final do Beneficio
                                             bErro, sMsgErro);

  if bErro
  then begin
     qryAux.Close;
     Exit;
  end;

  if Trim(psDataInicio) = '' then psDataInicio := DateToStr(date);

  // Se nao tem data final -> gerar beneficios da data de inicio até hoje
  // Se tem data final e a data final é menor que hoje,
  //    o mes final será o mes da data final
  // senao o mes final será o mes da folha
  if Trim(psDataFinal) = ''
  then begin
    if bPagtoUnico // CAMILLE - REFER - 18.08.1999
    then sMesFinal := sAnoMesDataInicio // data de inicio
    else sMesFinal := sAnoMesLote;
  end
  else begin
    sAnoMesDataFinal := Copy(psDataFinal,7,4)+'/'+Copy(psDataFinal,4,2);
    sMesFinal        := sAnoMesLote;
  end;

  // Se o beneficio tem datafinal <= MESATUAL
  // Entao Se a data final for no mes ATUAL (mes do lote)
  //       Entao Se o parametro de concessao for para conceder até mes anterior
  //             Entao NAO ENCERRAR BENEFICIO e NAO PAGAR MES ATUAL
  //             Senao ENCERRAR BENEFICIO e PAGAR MES ATUAL
  //       Senao // data final anterior ao mes atual
  //             ENCERRAR BENEFICIO e PAGAR ULTIMO MES

  if (Trim(psDataFinal) <> '') and ((Copy(psDataFinal,7,4)+'/'+Copy(psDataFinal,4,2) <=  sAnoMesLote))
  then begin
      if (Copy(psDataFinal,7,4)+'/'+Copy(psDataFinal,4,2)) = sAnoMesLote
      then begin
         if iIncluiMesConc = 0
         then sMesFinal := SAnoMesAnterior(sMesFinal)
         else sMesFinal := sMesFinal;
      end
      else sMesFinal := sAnoMesDataFinal;
  end
  else begin
     if (iIncluiMesConc = 0) and
        (not bPagtoUnico        ) and
        ( (Trim(psDataFinal) = '') or (Copy(psDataFinal,7,4)+'/'+Copy(psDataFinal,4,2) >=  sAnoMesLote) )
     then sMesFinal := SAnoMesAnterior(sMesFinal);
  end;

  sMesAtual := sAnoMesDataInicio;
  iMes := StrToInt(Copy(sMesAtual,6,2));
  rValorTotalLote := 0;

  // Buscar opcoes do beneficio para passar para a regra de reajuste
  with qryAux do
  begin
     Close;
     SQL.Clear;
     // cguedes - 31/07/2003 - Pend.: 14651/2
     If piIdTitular = piIdBeneficiario Then
       SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFPLANOPART '+
               ' WHERE  IDPESSJUR    = '+IntToStr(piIdPessJur)+
               ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
               ' AND    IDPESSOA     = '+IntToStr(piIdBeneficiario)+
               ' AND    SEQPROPOSTA  = '+IntToStr(piSeqProposta)+
               ' AND    IDBENEFICIO  = '+IntToStr(piIdBeneficio) )
     Else
         SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFBFCIARIO '+
                 ' WHERE  IDPESSJUR    = '+IntToStr(piIdPessJur)+
                 ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                 ' AND    IDTITULAR    = '+IntToStr(piIdTitular)+
                 ' AND    IDPESSOA     = '+IntToStr(piIdBeneficiario)+
                 ' AND    SEQPROPOSTA  = '+IntToStr(piSeqProposta)+
                 ' AND    IDBENEFICIO  = '+IntToStr(piIdBeneficio) );
     Open;
     if not IsEmpty
     then begin
        rValorBase1 := FieldByName('VALORBASE1').AsFloat;
        rValorBase2 := FieldByName('VALORBASE2').AsFloat;
        rValorBase3 := FieldByName('VALORBASE3').AsFloat;
     end
     else begin
        rValorBase1 := 0;
        rValorBase2 := 0;
        rValorBase3 := 0;
     end;

  end;

  // P.RAMOS 20.06.2001 CONTROLE CODPORTFORMA NULO
  if picodportforma > 0
  then scodportforma := inttostr(picodportforma)
  else scodportforma:='NULL';

  //leorefer - 0801 - inicio
  dValorBeneficioNoMes    := dValorEmReal;
  //leorefer - 0801 - fim

  // CAMILLE - 26.03.2003
  // TRATAMENTO DE BENEFICIO PARA BENEFICIARIO DO BENEFICIARIO
  if piIdTitular <> piIdBeneficiario
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDTITBENEF FROM BENEFBFCIARIO '+
                    ' WHERE  IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+
                    ' AND    IDBENEFICIO     = '+IntToStr(piIdBeneficio)+
                    ' AND    NUMEROPROCESSO  = '+IntToStr(piNumeroProcesso)+
                    ' AND    IDPESSJUR       = '+IntToStr(piIdPessJur)+
                    ' AND    IDTITULAR       = '+IntToStr(piIdTitular)+
                    ' AND    IDPESSOA        = '+IntToStr(piIdBeneficiario)+
                    ' AND    SEQPROPOSTA     = '+IntToStr(piSeqProposta) );
     qryAux.Open;
     iIdTitBenef := qryAux.FieldByName('IDTITBENEF').AsInteger;
  end
  else iIdTitBenef := -1;


  //Folha    //DataInicio     //Data Inicio  //Data final
  while (sAnoMesLote >= sAnoMesDataInicio) and (sMesAtual <= sMesFinal) do
  begin
      dValorBeneficioNoMes := CalculaBeneficioAPagarNoMes( qryAux,
                                                           sMesAtual,
                                                           piIdTitular,
                                                           piIdBeneficiario,
                                                           piSeqProposta,
                                                           piIdPessJur,
                                                           piIdPlanoPrev,
                                                           piNumeroProcesso,
                                                           piIdBeneficio,
                                                           piTotBeneficiarios,
                                                           piIdRegraPrimPagto,
                                                           piIdRegraUltPagto,
                                                           piIdTpPagto,
                                                           psDataInicio,
                                                           psDataFinal,
                                                           sMesFinal,
                                                           psCalculaTodoMes,
                                                           dValorEmReal,
                                                           dValorTotal,
                                                           dValorEmCotas,
                                                           pbCalculaPrimUltPgto,
                                                           psDataInicioOriginal,
                                                           piTipoMov,
                                                           piFlgDataPrevista,
                                                           bErro,
                                                           bReajustou,
                                                           psUltMesReajuste,
                                                           dValorBeneficioIntegral,
                                                           dValorBeneficioIntegralAposMinimo,
                                                           dValorPrevAntesMinimo,
                                                           dValorBenefRateado, { Augusto 23/01/2003 }
                                                           dValorSRB,
                                                           sDataFolha,
                                                           False, pbMigracaoPlano //leofuncef - 06042004
                                                           );
      sValorFinal   := FloatToStr(dValorBeneficioNoMes);
      sValorInteiro := FloatToStr(dValorBeneficioIntegral);

      // ***********************************************************************
      // CAMILLE - CBS - 06.03.2002
      // ***********************************************************************
      // Neste ponto a variavel dValorBeneficioIntegral está com o valor total
      // reajustado ( sem ratear por dias e sem ratear por beneficiarios )
      // Provisorio até liberar versao 15
      prValorAtualizadoRateado := dValorBeneficioIntegral;
      prValorAtualizadoTotal   := dValorBeneficioIntegral;
      // ***********************************************************************
      // CAMILLE - CBS - 06.03.2002
      // ***********************************************************************

      // Se ainda nao gravou o lote do registro, gravar
      if not bJaGravouLote
      then begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO CTRLINTERFACE ' +
                        ' (MESREFERENCIA,     TIPO,             IDPESSOA,         '+
                        '  FLGIDATMP,         FLGVOLTATMP,      FLGIDAINTERFACE,  '+
                        '  FLGVOLTAINTERFACE, DATAIDATMP,       DATAVOLTATMP,     '+
                        '  DATAIDAINTERFACE,  DATAVOLTAINTERFA, IDLOTE,           '+
                        '  NUMREG,           VLRTOTAL,         '+
                        '  FLGEMITIUCC,       DATAEMITIUCC,     FLGPREPARADO,     '+
                        '  DESCRICAO,         DATAPREPARO) ' +
                        '  VALUES (' +
                        '''' + sMesFinal + ''', ''B'', '+IntToStr(piIdPessJur)+ ',' +
                        '  0, 0, 0, 0, NULL , NULL, NULL, NULL, '+
                        IntToStr(iIdLote)+ ', 1, ' + OraNumero(sValorFinal) + ',' +
                        '  NULL, NULL, 1, ''' + sDescPreparo + ''',' +
                        ' To_Date(''' + DateTimeToStr(Date) + ''',''dd/mm/yyyy''))');
         try
            qryAux.ExecSQL;
         except
            bErro := True;
            sMsgErro := 'Erro na "Geração do Lote" para o preparo do benefício concedido. ';
            Exit;
         end;
         bJaGravouLote   := True;
         bPrimeiroDoLote := True;
      end; // if not bJaGravouLote

      // CAMILLE - CBS - 14.11.2001
      if (piIdTitular = piIdBeneficiario) // and ((dValorTotal <= 0)
      then dValorTotal := StrToFloat(ClienteNumero(sValorInteiro));

      sFlgDevolucao        := '0';

      // *********************************************************************************
      // Verificar se o benefício já existe no mês
      // *********************************************************************************
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT SUM(VALORPREV) AS VALORPREV  FROM HSTBENEFBFCIARIO '+
                 ' WHERE (IDPESSOA       = '+IntToStr(piIdBeneficiario)+') '+
                 ' AND   (MESREFERENCIA  = '''+sMesAtual      +'''       ) '+
                 ' AND   (IDBENEFICIO    = '+IntToStr(piIdBeneficio)+'   ) '+
                 ' AND   (NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+') '+
                 ' AND   (FLGDEVOLUCAO   = 0 ) ');
         Open;

         { Augusto 18/03/2004 - Qry com SUM não pode testar IsEmpty }
         if (FieldByName('VALORPREV').AsFloat > 0) and (piTipoMov > 2)
            { Augusto 03/06/2004 - Na migração INSS apenas gera HST demonstrativo }
            or ( (pbMigracaoPlano) and (sFlgReferencia <> '1') )
         then begin
            sValorFinal := FloatToStr( StrToFloat(ClienteNumero(sValorFinal)) - FieldByName('VALORPREV').AsFloat);

            if Abs(StrToFloat(ClienteNumero(sValorFinal))) < 0.01
            then begin
               sValorFinal := '0';
            end
            else begin
               if StrToFloat(ClienteNumero(sValorFinal)) < 0.01
               then begin
                  sFlgDevolucao := '1';
                  sValorFinal   := FloatToStr(-StrToFloat(ClienteNumero(sValorFinal)));
               end
               else sFlgDevolucao := '0';
            end;
         end;
      end;

      if StrToFloat(ClienteNumero(sValorFinal)) > 0
      then begin
         // Insere no Historico de Beneficios
         iSeqBeneficio := PegaSeqBeneficio(qryAux,
                                           piIdPessJur,   piIdTitular,
                                           piIdPlanoPrev, piIdBeneficiario,
                                           piSeqProposta, piNumeroProcesso,
                                           piIdBeneficio, piIdMotivo,
                                           sAnoMesLote,
                                           sMesAtual);

         if piIdRegraCalculo > 0
         then sIdRegraCalculo := IntToStr(piIdRegraCalculo)
         else sIdRegraCalculo := ' NULL ';

         { Augusto 05/12/2003 - Volta PLANOORIGEM para beneficiarios migrados }
         { e tratamento para o caso de beneficio para beneficiario            }
         sPlanoOrigem := BuscaPlanoOrigem(piIdPessjur,piIdTitular, sAnoMesLote, piIdBeneficiario);
         if (piIdTitular <> piIdBeneficiario) And (sPlanoOrigem = '-1') Then
           sPlanoOrigem := BuscaPlanoOrigem(piIdPessjur, iIdTitBenef, sAnoMesLote, piIdBeneficiario);
         //sPlanoOrigem := IntToStr(piIdPlanoPrev); // CAMILLE - 10.02.2003
         {-}

         // CGUEDES - 20/08/2002: A PEDIDO DO MENEZES, FOI ACERTADA O CAMPO DATAPAGAMENTO
         // COM A DATA VINDA DO CALENDARIO (PASSANDO MESREFERENCIA DO BENEFICIO)
         sDataFolha := CriticaDataCobrancaSit(qryAux,IntToStr(iIdFundacao),'', 'AS', 'P',
                                              Copy(sMesAtual,6,2),
                                              Copy(sMesAtual,1,4) );

         // Camille - 12.02.2004 - Pendencia 16036 - FUNCEF
         // Quando o calendario não existir, dar a mensagem uma unica vez
         if Trim(sDataFolha) = ''
         then begin
            bErro := True;
            sMsgErro := 'Calendário Não Encontrado. Operação Interrompida.';
            Exit;
         end;


         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add(' INSERT INTO HSTBENEFBFCIARIO ' +
                        '       (IDPESSJUR,      IDTITULAR,      IDPESSOA,    '+
                        '        IDPLANOPREV,    SEQPROPOSTA,    IDMOTIVO,    '+
                        '        NUMEROPROCESSO, IDBENEFICIO,    MES,         '+
                        '        MESREFERENCIA,  SEQBENEFICIO,   VALORPREV,   '+
                        '        VALORCALCULADO, VALORINTEGRAL,  VALORTOTAL,  '+
                        '        IDREGRACALCULO, IDLOTE,         FLGENVIADO,  '+
                        '        FLGCONCESSAO, CODPORTFORMA,     VALORSRB,    '+
                        '        FLGDEVOLUCAO, VALORPREVMIN, IDPLANOORIGEM,   '+
                        '        DATAPAGAMENTO, FLGPROVISORIO,                '+ // Gleyber - 09/10/2002 - Inclusão do FlagProvisório
                        '        VALOROP1, VALOROP2, VALOROP3, IDTITBENEF)    '+ // Gleyber - 12/12/2002
                        ' VALUES(' + IntToStr(piIdPessJur)      + ',' +
                                       IntToStr(piIdTitular)      + ',' +
                                       IntToStr(piIdBeneficiario) + ',' +
                                       IntToStr(piIdPlanoPrev)    + ',' +
                                       IntToStr(piSeqProposta)    + ',' +
                                       IntToStr(piIdMotivo)       + ',' +
                                       IntToStr(piNumeroProcesso) + ',' +
                                       IntToSTr(piIdBeneficio)    + ',' +
                                       '''' + sAnoMesLote + ''''      + ',' +
                                       '''' + sMesAtual  + ''''   + ',' +
                                       IntToStr(iSeqBeneficio)    + ',' +
                                       OraNumero(sValorFinal) + ',' +
                                       OraNumero(sValorFinal) + ',' ); // CAMILLE - 17.06.2004 - 16802
         // CAMILLE - 17.06.2004 - 16802
         if piIdTitular = piIdBeneficiario
         then qryAux.SQL.Add(OraNumero(FloatToStr(dValorBeneficioIntegral)) + ',' )
         else qryAux.SQL.Add(OraNumero(FloatToStr(dValorBenefRateado))      + ',' ); { Augusto 24/10/2003 - Valor rateado no VALORINTEGRAL } //OraNumero(sValorInteiro) + ',' +

         qryAux.SQL.Add( OraNumero(sValorInteiro)+','+
                         // OraNumero(sValorInteiro)+','+ { Augusto 29/06/2004 }
                         sIdRegraCalculo   + ',' +
                         IntToStr(iIdLote) + ',' + '0, 1,'+
                         sCodPortForma+','+
                         OraNumero(FloatToStr(dValorSRB))+','+sFlgDevolucao+','+
                         OraNumero(FloatToStr(dValorPrevAntesMinimo))+',' +
                         sPlanoOrigem + ','+
                         'TO_DATE('''+sDataFolha+''',''DD/MM/YYYY''),'+
                         sFlagProvisorio+', '+ // Gleyber - Inclusão do FlagProvisório
                         OraNumero(FloatToStr(rValorBase1))+ ','+ // Gleyber - 12/12/2002
                         OraNumero(FloatToStr(rValorBase2))+ ','+ // Gleyber - 12/12/2002
                         OraNumero(FloatToStr(rValorBase3))+ ',');// Gleyber - 12/12/2002
         // CAMILLE - 26.03.2003
         if iIdTitBenef > 0
         then qryAux.SQL.Add(IntToStr(iIdTitBenef)+')')
         else qryAux.SQL.Add('NULL)'                  );

         try
            qryAux.ExecSQL;
            if not bPrimeiroDoLote
            then rValorTotalLote := rValorTotalLote + StrToFloat(ClienteNumero(sValorFinal))
            else bPrimeiroDoLote := False;
         except
            bErro := True;
            sMsgErro := 'Erro na gravação do benefício concedido no histórico. ';
            Exit;
         end;
      end;

      // ***********************************************************************
      // TESTAR CONDIÇÕES PARA PAGAMENTO DO ABONO ANUAL DE BENEFÍCIO
      // ***********************************************************************
      // Se benefício é parametrizado para pagar abono E
      // [ ( o mês que está sendo calculado neste momento é o mes 12 ) ou
      //   ( Abono é no final do Ano e Estou no mes 12 ) ou
      //   ( Abono é no final do Beneficio e estou no ultimo mes do benefico) ] ou
      //   ( Abono é no final do Ano mas o beneficio comecou e acabou no ano anterior ) ou
      // Entao calcular abono e inserí-lo no historico de beneficio

      if bPossuiAbono
      then begin
         //verifica se existe o cadastro de mês de pagamento do abono
         //casoexista, assume-se este mês
         //caso não, asusme-se como o mês 12
         sMesAbono := PagaMesPagAbono(QryAux, piIdPessjur, piIdPlanoPrev, piIdBeneficio ,sMesAtual);

         if sAnoMesDataInicio > copy(sMesAtual,1,5)+sMesAbono then //leofuncef -05/02/2004
         sMesAbono :=  copy(sAnoMesDataInicio,6,2);

         if Trim(psDataFinal) = ''
         then begin
            if Copy(sMesAtual,6,2) = sMesAbono
            then bPagaAbono := True
            else bPagaAbono := False;
         end
         else begin
            // Se AnoMesDataFinal <= AnoMesLote e AnoMesLote = 12 e MesAtual = MesFinal
            if (sAnoMesDataFinal <= sAnoMesLote) and (sMesAtual = sMesFinal) and (Copy(sAnoMesLote,6,2) = sMesAbono)
                   { Gleyber 02/12/2003 - Pendencia 15721 }
               And (sMesFinal = Copy(psDataFinal,7,4)+'/'+Copy(psDataFinal,4,2))
            then bPagaAbono := True
            else begin
               if piFlgDataPrevista = 1 // Data Prevista
               then begin
                  if (Copy(sMesAtual,1,4) < Copy(sAnoMesDataFinal,1,4)) and (Copy(sMesAtual,6,2) = sMesAbono)
                  then bPagaAbono := True
                  else if (StrToDate(psDataFinal) >= StrToDate('30/'+sMesAbono+'/'+Copy(sMesAtual,1,4))) and (Copy(sMesAtual,6,2) = sMesAbono)
                       then bPagaAbono := True
                       else bPagaAbono := False
               end
               else begin // Data Efetiva
                  if (Copy(sMesAtual,1,4) < Copy(sAnoMesDataFinal,1,4)) and (Copy(sMesAtual,6,2) = sMesAbono)
                  then bPagaAbono := True
                  else begin
                     if (Copy(sAnoMesDataFinal,1,4) < Copy(sMesAtual,1,4)) and (Copy(sMesAtual,6,2) = sMesAbono)
                     then bPagaAbono := True
                     else begin
                        if (cTipoAbono = 'B') and (sMesAtual = sAnoMesDataFinal)
                        then bPagaAbono := True
                        else if Copy(sMesAtual,6,2) = sMesAbono
                             then bPagaAbono := True
                             else bPagaAbono := False;
                     end;
                  end
               end;
            end;
         end;
      end;

      if bPagaAbono
      then begin
         if (cTipoAbono = 'B')        and (sMesAtual = sMesFinal) and
            (Trim(psDataFinal) <> '') and (sAnoMesDataFinal <= sMesFinal)
         then pbPreparaContrib13 := True;

         // Camille - 23.01.2002
         // Se for uma renova, passar como data de inicio para calculo do abono
         // a nova data de inicio
{         if piTipoMov = 0 // Renova
         then sDataInicioParaAbono := psDataInicio
         else sDataInicioParaAbono := psDataInicioOriginal;
}

         { Inicio Augusto 16/06/2004 }
         sDataInicioParaAbono := psDataInicioOriginal;
         { No caso de migração de beneficios, o Abono deve ser calculado com base }
         { na DATAINICIO do beneficios origem da migração.                        }
         If pbMigracaoPlano Then Begin
           sDataInicioParaAbono := sDIbBenefAnt;
         End;

         rValorAbono :=  ExecutaRegraValorAbono ( qryAux,
                                                 iIdRegraAbono,
                                                 piIdPessJur,
                                                 piIdPlanoPrev,
                                                 piIdTitular,
                                                 piSeqProposta,
                                                 piIdBeneficiario,
                                                 piIdBeneficio,
                                                 { Augusto 10/11/2003 - DataInicioOriginal é a DIP }
                                                 sDataInicioParaAbono, // psDataInicioOriginal, // CAMILLE - 23.01.2003
                                                 // sDataInicioParaAbono,
                                                 psDataFinal,
                                                 sMesAtual,
                                                 { Augusto 30/01/2003 }
                                                 //dValorBeneficioIntegralAposMinimo,
                                                 dValorBenefRateado, { Para Regra de Abono, passar valor }
                                                                     { do Beneficio Final, rateado       }
                                                 sFlagProvisorio,
                                                 bErro,
                                                 sMsgErro, piTipoMov,piTotBeneficiarios
                                                 { Augusto 10/11/2003 - DataInicioFund é a DIB }
                                                 sDataInicioParaAbono); //psDataInicioOriginal);

         { Fim Augusto 16/06/2004 }

         if bErro
         then Exit // a variavel sMsgErro ja estará preenchida
         else sValorAbono := OraNumero(FloatToStr(rValorAbono));

         sAnoMesPagAbono := sAnoMesLote;
         sAnoMesRefAbono := Copy(sMesAtual,1,4)+'/13';

         // Insere no Historico de Beneficios
         if iIdRegraAbono > 0
         then sIdRegraCalculo := IntToStr(iIdRegraAbono)
         else sIdRegraCalculo := ' NULL ';

         sFlgDevolucao        := '0';
         // Verificar se uma parte do abono já foi paga em algum mês. Se foi, então
         // inserir apenas a diferença
         with qryAux do
         begin
            Close;
            SQL.Clear;
            // Gleyber - 28/01/2003 - Pendência 15936 - Início

            //SQL.Add(' SELECT SUM(VALORPREV ) AS VALORPREV FROM HSTBENEFBFCIARIO '+
            SQL.ADD(' SELECT SUM(DECODE(FLGDEVOLUCAO,1,-NVL(VLBENEFPGTO, VALORPREV),  NVL(VLBENEFPGTO,VALORPREV))) AS VALORPREV '+
                    ' FROM HSTBENEFBFCIARIO '+
                    ' WHERE (IDPESSOA       = '+IntToStr(piIdBeneficiario)+') '+
                    ' AND   (MESREFERENCIA  = '''+sAnoMesRefAbono+'''       ) '+
                    ' AND   (IDBENEFICIO    = '+IntToStr(piIdBeneficio)+'   ) '+
                    ' AND   (NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+') ');
             //       ' AND   (FLGDEVOLUCAO   = 0 ) ');

            // Gleyber - 28/01/2003 - Pendência 15936 - Fim
             Open;
            if not IsEmpty
            then begin
               sValorAbono   := FloatToStr( StrToFloat(ClienteNumero(sValorAbono)) - FieldByName('VALORPREV').AsFloat);

               if Abs(StrToFloat(ClienteNumero(sValorAbono))) < 0.01
               then sValorAbono := '0'
               else begin
                  if StrToFloat(ClienteNumero(sValorAbono)) < 0.001
                  then begin
                     sFlgDevolucao := '1';
                     sValorAbono   := FloatToStr(-StrToFloat(ClienteNumero(sValorAbono)));
                  end
                  else sFlgDevolucao := '0';
               end;
            end;
         end;


         if dValorBeneficioIntegralAposMinimo > 0
         then dValorPrevAntesMinimo := StrToFloat(ClienteNumero(sValorAbono)) * dValorPrevAntesMinimo / dValorBeneficioIntegralAposMinimo
         else dValorPrevAntesMinimo := StrToFloat(ClienteNumero(sValorAbono));

         if StrToFloat(ClienteNumero(sValorAbono)) >  0
         then begin
            iSeqBeneficio := PegaSeqBeneficio(qryAux,
                                               piIdPessJur,   piIdTitular,
                                               piIdPlanoPrev, piIdBeneficiario,
                                               piSeqProposta, piNumeroProcesso,
                                               piIdBeneficio, piIdMotivo,
                                               sAnoMesPagAbono,
                                               sAnoMesRefAbono);

            //leofuncef - 17032004
            //sPlanoOrigem := IntToStr(piIdPlanoPrev); // CAMILLE - 10.02.2003
            sPlanoOrigem := BuscaPlanoOrigem(piIdPessjur,piIdTitular, sAnoMesLote, piIdBeneficiario);
            if (piIdTitular <> piIdBeneficiario) And (sPlanoOrigem = '-1') Then
            sPlanoOrigem := BuscaPlanoOrigem(piIdPessjur, iIdTitBenef, sAnoMesLote, piIdBeneficiario);
            //leofuncef - 17032004

            qryAux.Close;
            qryAux.Sql.Clear;
            qryAux.Sql.Add(  ' INSERT INTO HSTBENEFBFCIARIO ' +
                             '       (IDPESSJUR,   IDTITULAR,      IDPESSOA, IDPLANOPREV, IDPLANOORIGEM, '+
                             '        SEQPROPOSTA, IDMOTIVO,       NUMEROPROCESSO, '+
                             '        IDBENEFICIO, MES,            MESREFERENCIA,  '+
                             '        VALORPREV,   VALORCALCULADO, VALORINTEGRAL,  VALORTOTAL, IDREGRACALCULO, '+
                             '        IDLOTE,      FLGENVIADO,     FLGCONCESSAO, SEQBENEFICIO, CODPORTFORMA,   '+
                             '        VALORSRB,    FLGDEVOLUCAO,   VALORPREVMIN, DATAPAGAMENTO, ' +
                             '        VALOROP1, VALOROP2, VALOROP3, '+                // Gleyber - 12/12/2002
                             '        FLGPROVISORIO, IDTITBENEF)                '+                // Gleyber - 06/01/2003
                             ' VALUES(' + IntToStr(piIdPessJur)      + ',' +
                                          IntToStr(piIdTitular)      + ',' +
                                          IntToStr(piIdBeneficiario) + ',' +
                                          IntToStr(piIdPlanoPrev)    + ',' +
                                          sPlanoOrigem               + ',' +
                                          IntToStr(piSeqProposta)    + ',' +
                                          IntToStr(piIdMotivo)       + ',' +
                                          IntToStr(piNumeroProcesso) + ',' +
                                          IntToSTr(piIdBeneficio)    + ',' +
                                          '''' + sAnoMesPagAbono     + '''' + ',' +
                                          '''' + sAnoMesRefAbono     + ''',' +
                                          OraNumero(sValorAbono)     + ',' +
                                          OraNumero(sValorAbono)     + ',' );
            // CAMILLE - 17.06.2004 - 16802
            if piIdTitular = piIdBeneficiario
            then qryAux.SQL.Add(OraNumero(FloatToStr(dValorBeneficioIntegral)) + ',' )
            else qryAux.SQL.Add(OraNumero(FloatToStr(dValorBenefRateado))      + ',' ); { Augusto 24/10/2003 - Valor rateado no VALORINTEGRAL } //OraNumero(sValorInteiro) + ',' +


            qryAux.SQL.Add(OraNumero(sValorInteiro)   +','+                 // Augusto 17/03/2004 OraNumero(sValorAbono)     + ',' +
                                     { Augusto 02/07/2004 }
                                     //OraNumero(sValorInteiro)   +','+ // Augusto 17/03/2004 OraNumero(sValorAbono)     + ',' +
                                          sIdRegraCalculo            + ',' +
                                          IntToStr(iIdLote)          + ',' +
                                          '0, 1, '+
                                          {P.RAMOS 13.07.2001 - FALTAVA SEQBENEFICIO}
                                          IntToStr(iSeqBeneficio) + ',' +
                                          {P.RAMOS 20.06.2001 - INCLUSÃO DO CODPORTFORMA}
                                          sCodPortForma+','+
                                          OraNumero(FloatToStr(dValorSRB))+','+
                                          OraNumero(sFlgDevolucao)+','+
                                          OraNumero(FloatToStr(dValorPrevAntesMinimo))+','+
                                          'TO_DATE('''+sDataFolha+''',''DD/MM/YYYY''), '+
                                          OraNumero(FloatToStr(rValorBase1))+ ','+ // Gleyber - 12/12/2002
                                          OraNumero(FloatToStr(rValorBase2))+ ','+ // Gleyber - 12/12/2002
                                          OraNumero(FloatToStr(rValorBase3))+ ','+ // Gleyber - 12/12/2002
                                          OraNumero(sFlagProvisorio)+ ',');        // Gleyber - 06/01/2003

            // CAMILLE - 26.03.2003
            if iIdTitBenef > 0
            then qryAux.SQL.Add(IntToStr(iIdTitBenef)+')')
            else qryAux.SQL.Add('NULL)'                  );

            try
               qryAux.ExecSQL;
            except
               bErro := True;
               sMsgErro := 'Erro na gravação do abono . ';
               Exit;
            end;
         end;
      end; // if bPagaAbono

      sMesUltPreparo := sMesAtual; // Guarda o ultimo mes de Preparo
      sMesAtual  := ProximoAnoMes(StrToInt(Copy(sMesAtual, 6,2)), StrToInt(Copy(sMesAtual, 1,4)));
  end;

  // Se Gerou historico,
  // Entao Gravar o ultimo mes de preparo
  //       Atualizar ctrlinterface com valor total do lote
  if sMesUltPreparo <> ''
  then begin
     // Grava o Ultimo Mes de Preparo
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' UPDATE BENEFBFCIARIO SET ULTMESPREPARO = ' + '''' + sMesUltPreparo + ''' ' +
                    ' WHERE SEQPROPOSTA    = ' + IntToStr(piSEQPROPOSTA) + ' AND ' +
                    '       IDPLANOPREV    = ' + IntToStr(piIDPLANOPREV) + ' AND ' +
                    '       IDTITULAR      = ' + IntToStr(piIDTITULAR)   + ' AND ' +
                    '       IDPESSJUR      = ' + IntToStr(piIDPESSJUR)   + ' AND ' +
                    '       NUMEROPROCESSO = ' + IntToStr(piNUMEROPROCESSO) + ' AND ' +
                    '       IDBENEFICIO    = ' + IntToStr(piIdBeneficio) + ' AND ' +
                    '       IDPESSOA       = ' + IntToStr(piIDBeneficiario));
     try
       qryAux.ExecSQL;
     except
       bErro := True;
       sMsgErro := 'Erro na atualização do "Último Mês de Preparo" do benefício concedido. ';
       Exit;
     end;

     // CBS - 17.01.2002 - PERFORMANCE
{     // Grava o valor total do lote
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' UPDATE CTRLINTERFACE SET VLRTOTAL = VLRTOTAL + '+OraNumero(FloatToStr(rValorTotalLote))+
                    ' WHERE  IDLOTE = '+IntToStr(iIdLote));
     try
       qryAux.ExecSQL;
     except
       bErro := True;
       sMsgErro := 'Erro na atualização do Valor Total do Lote '+IntToStr(iIdLote);
       Exit;
     end;
}
  end; // if sUltMesPreparo <> ''


  // Se for o ultimo pagamento do beneficio e nao for retencao, encerramento ou prorrogacao
  sAnoMesAtual := Copy(DateToStr(Date), 7,4) + '/' + Copy(DateToStr(Date), 4,2);
  if Trim(psDataFinal) <> ''
  then sAnoMesFinal := Copy(psDataFinal, 7,4) + '/' + Copy(psDataFinal, 4,2)
  else sAnoMesFinal := '9999/99';

  if (sAnoMesFinal <= sAnoMesAtual) and (piTipoMov <> 0) and (piTipoMov <> 1) and (piTipoMov <> 2)
  then begin
     //Alterar a Situacao para Encerrado
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = 3 ' +
                    ' WHERE SEQPROPOSTA    = ' + IntToSTr(piSeqProposta) + ' AND ' +
                    '       IDPLANOPREV    = ' + IntToSTr(piIDPLANOPREV) + ' AND ' +
                    '       IDTITULAR      = ' + IntToSTr(piIDTITULAR)   + ' AND ' +
                    '       IDPESSJUR      = ' + IntToSTr(piIDPESSJUR)   + ' AND ' +
                    '       NUMEROPROCESSO = ' + IntToSTr(piNUMEROPROCESSO)+ ' AND ' +
                    '       IDBENEFICIO    = ' + IntToSTr(piIdBeneficio) + ' AND ' +
                    '       IDPESSOA       = ' + IntToSTr(piIDBeneficiario));
     try
       qryAux.ExecSQL;
     except
        bErro := True;
        sMsgErro := 'Erro no encerramento do benefício. ';
        Exit;
     end;
  end;


  bErro    := False;
  sMsgErro := '';
  Result   := True;
end; // PreparaBeneficioConcedido

function CriticaDataCobrancaSit( qry : TwwQuery;
                                 sIdPessJur, sIdPlanoPrev, sSitFundacao : string;
                                 sTipoData                              : char;
                                 sMesReferencia, sAnoReferencia         : string) : string;
var
  sSql, sAux,
  sTabela,
  sFiltro,
  sAnoMesCiclo,
  sData           : string;
  iIdModulo       : longint;
  bEncontrouCicloAberto,
  bCicloEncerrado : boolean;
  cTipoEnvPrev    : char;
begin
  Result := '';
  // SINCRONISMO : Se o ciclo do mes/ano passados como parametros estiver encerrado,
  //               ir para o próximo.
  //               Esta função só poderá retornar uma data de um ciclo em aberto.

  bEncontrouCicloAberto := False;
  sAnoMesCiclo          := sAnoReferencia+'/'+sMesReferencia;
  while not bEncontrouCicloAberto do
  begin
     case sTipoData of
       'N' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM; // Cobranca Normal
       'A' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM; // Cobrança Atrasada
       'D' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM;// Pagamento de Devolução
       'P' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Beneficio
       'B' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Abono
       'T' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Antecipacao de Beneficio
       'O' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Antecipacao de Abono
     end;

     if sSitFundacao = 'PT'
     then bCicloEncerrado := False
     else bCicloEncerrado := VerificaFechamento( StrToInt(sIdPessJur),
                                                 iIdModulo,
                                                 sAnoMesCiclo,
                                                 'E' ,cTipoEnvPrev);
     if bCicloEncerrado
     then begin
        bEncontrouCicloAberto := False;
        sAnoMesCiclo := ProximoAnoMes(StrToInt(Copy(sAnoMesCiclo,6,2)), StrToInt(Copy(sAnoMesCiclo,1,4)));
     end
     else bEncontrouCicloAberto := True;
  end;

  sMesReferencia := Copy(sAnoMesCiclo,6,2);
  sAnoReferencia := Copy(sAnoMesCiclo,1,4);

  if sSitFundacao = 'MS' then sSitFundacao := 'AT';

  if sMesReferencia = '13'
  then sMesReferencia := '12';

  if sSitFundacao = 'AS'
  then begin
         sTabela := 'FUNDACAO';
//         sFiltro := ' AND (T.IDPESSOA = ' + sIdPessJur + ')'; // FDIAS - REFER - 04.06.2001
         sFiltro := ' AND (T.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ')'; // LEOCM - 25062002 - TROQUEI IIDFUNDACAO POR IDEMPRESA
         sAux := 'Fundação';
       end
  else begin
         sTabela := 'PLANPREVPATRO';
         sFiltro := ' AND (T.IDPESSJUR = ' + sIdPessJur + ')' +
                    ' AND (T.IDPLANOPREV = ' + sIdPlanoPrev + ')';
         sAux := 'Patrocinadora';
       end;

  sSQL := ' SELECT CD.IDCALENDARIO, CD.FLGINTERNO,      CD.ANOMESREF, '+
         { '        CD.DATACOBNORMAL, ' +
          '        CD.DATACOBATRASO,CD.DATACOBDEVOLUCAO,CD.DATAPAGBENEF,' +
          '        CD.DATAPAGABONO, CD.DATAPAGANTBENEF, CD.DATAPAGANTABONO' +}
          //leocbs - 0401 - inicio
          ' TO_CHAR(CD.DATACOBNORMAL,''DD/MM/YYYY'') DATACOBNORMAL, '+
          ' TO_CHAR(CD.DATACOBATRASO,''DD/MM/YYYY'') DATACOBATRASO,'+
          ' TO_CHAR(CD.DATACOBDEVOLUCAO,''DD/MM/YYYY'') DATACOBDEVOLUCAO, '+
          ' TO_CHAR(CD.DATAPAGBENEF,''DD/MM/YYYY'') DATAPAGBENEF, '+
          ' TO_CHAR(CD.DATAPAGABONO,''DD/MM/YYYY'') DATAPAGABONO, '+
          ' TO_CHAR(CD.DATAPAGANTBENEF,''DD/MM/YYYY'') DATAPAGANTBENEF, '+
          ' TO_CHAR(CD.DATAPAGANTABONO,''DD/MM/YYYY'') DATAPAGANTABONO '+
          //leocbs - 0401 - fim
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
     // CAMILLE - 19.04.2004 - MELHORIA DA MENSAGEM
     MsgDlg('O sistema não encontrou calendário/data cadastrada para o mês '+sMesReferencia+'/'+sAnoReferencia+'. Verifique.',
            'Informação',mtInformation,[mbOk],0);
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

function VerificaSePagaAbonoParticip( qryAux : TwwQuery;
                              piIdPlanoPrev, piIdBeneficio : longInt;
                              psDataInicio,  psDataFinal   : string;
                              var piIdRegraAbono           : longint;
                              var pcTipoAbono              : char; // A - final do Ano e B - final do Beneficio
                              var bErro                    : boolean;
                              var sMsgErro                 : string) : boolean;
//var iAnoAtual            : longint;
//    sUltimoDiaAnoPassado : string;
begin
   Result         := False;
   bErro          := False;
   sMsgErro       := '';
   piIdRegraAbono := -1;
   pcTipoAbono    := ' ';

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT FLGABONOFINALBEN, FLGPOSSUIABONO, IDREGRACALCABONO '+
                  ' FROM   BENEFPLANPREV '+
                  ' WHERE  IDBENEFICIO = '+IntToStr(piIdBeneficio)+
                  ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev) );
   qryAux.Open;

   if qryAux.IsEmpty then Exit; // Nao pagar abono

   if qryAux.FieldByName('flgPossuiAbono').AsString = '0'
   then Exit; // Nao possui abono

   // Possuindo abono, verificar o tipo de abono ( final do ano, final do beneficio )
   if qryAux.FieldByName('flgAbonoFinalBen').AsString = '1'
   then begin // Possui abono no final do beneficio
      pcTipoAbono := 'B';
   end
   else begin // Possui beneficio no final do ano
     pcTipoAbono := 'A';
   end;

   if qryAux.FieldByName('IdRegraCalcAbono').AsString = ''
   then begin
      Exit;
{      bErro    := True;
      sMsgErro := 'O beneficiário tem direito ao Abono Anual deste benefício. '+
                  'Porém a Regra de Cálculo para este abono não está cadastrada. '+
                  'Verifique. ';
      qryAux.Close;
      Exit;
}
   end
   else piIdRegraAbono := qryAux.FieldByName('IdRegraCalcAbono').AsInteger;

   Result := True;
end; // VerificaSePagaAbonoParticip

function CalculaBeneficioAPagarNoMes(qryAux                        : TwwQuery;
                                     psAnoMesCalculo               : string;
                                     piIdTitular,
                                     piIdBeneficiario,
                                     piSeqProposta,
                                     piIdPessJur,
                                     piIdPlanoPrev,
                                     piNumeroProcesso,
                                     piIdBeneficio,
                                     piTotBeneficiarios,
                                     piIdRegraPrimPagto,
                                     piIdRegraUltPagto,
                                     piIdTpPagto                   : longint;
                                     psDataInicio,
                                     psDataFinal,
                                     psUltMesCalculo,
                                     psCalculaTodoMes              : string;
                                     var
                                     dValorEmReal, //leocbs - 29052002 - coloquei o var
                                     dValorTotal                   : double;
                                     dValorEmCotas                 : double;
                                     pbCalculaPrimUltPgto          : boolean;
                                     psDataInicioOriginal          : string;
                                     piTipoMov,
                                     piFlgDataPrevista             : word;
                                     var bErro, bReajustou         : boolean;
                                     var sUltMesReajuste           : string;
                                     var pdValorBeneficioIntegralOriginal,
                                         pdValorBeneficioIntegralAposMinimo,
                                         pdValorPrevAntesMinimo,
                                         pdValorBenefRateado,                 // AUGUSTO - 30.01.2003
                                         pdValorSRBRetorno         : double;  // CAMILLE - 23.08.2002
                                     psDataPagamento               : string;
                                     pbCalculaTudo : Boolean = False ;{ Augusto 20/02/2004 }
                                     pbMigracaoPlano : Boolean = False  //leofuncef - 06042004
                                      ) : double;
var

   dValorBeneficioNoMes,
   dValorBase1,
   dValorBase2,
   dValorBase3,
   dValorEmRealOriginal,
   dValorTotalOriginal,
   dValorAReajustar,
   dValorDepoisMinimo      : double;

   sMsgErro,
   lsDataInicio,
   sValorFinal, sDia       : string;
   bPagtoUnico,
   bPagaIntegral           : boolean;

   sDataEvento,
   sFlgInternoAntes,      sFlgInternoAtual,   sIdSitPartAntes,
   sIdSitPlanAntes,       sIdSitFuncAntes,    sIdSitPartAtual,
   sIdSitPlanAtual,       sIdSitFuncAtual                         : string;
//   dValorSRBRetorno     : double;
   bRetroativo : boolean; // CAMILLE - 20.01.2003
   sVlrCalcInss, sVlrInfINSS : string;  // CAMILLE  - 23.01.2003
   sFlgBenefMinimo, sTPMODALIDADE,
   sIDTPPAGTOANT : string;
   iIdRegraCalculo : longint;
   iIdRegraCalcReserva : longint;
   iOrigem, iIdParticipante, iIdTitularBenef, iIdBeneficiario : integer;
begin
  Result                   := 0;
  dValorBeneficioNoMes     := 0;
  pdValorBeneficioIntegralOriginal := 0;
  pdValorBeneficioIntegralAposMinimo := 0;
  bErro                    := False;
  if sUltMesReajuste = ''
  then sUltMesReajuste     := VerificaUltimoReajuste(qryAux, piNumeroProcesso);
  dValorEmRealOriginal     := dValorEmReal;
  dValorTotalOriginal      := dValorTotal;

  if (piTipoMov = 6) or (piTipoMov = 12) or (piTipoMov = 13)
  then bRetroativo := True
  else bRetroativo := False;


  // Verificar se o beneficio é pagamento unico
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT T.FLGFREQUENCIA '+
                 ' FROM   TPPAGTOBENEFICIO T   '+
                 ' WHERE  T.IDTPPAGTOBENEFIC = '+IntToStr(piIdTpPagto));
  qryAux.Open;
  if (qryAux.IsEmpty) or (qryAux.FieldByName('FlgFrequencia').AsString <> 'U')
  then bPagtoUnico := False
  else bPagtoUnico := True;

  // Verificar se o beneficio é para pagar integral no último mês de data prevista
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BP.IDREGRACALCULO, BP.FLGPAGAINTEG, BP.IDREGRAPAGAMENTO,  '+
                 '        BP.TPMODALIDADE '+ { Augusto 12/10/2003 }
                 ' FROM   BENEFPLANPREV BP                              '+
                 ' WHERE  BP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)   +
                 ' AND    BP.IDBENEFICIO   = '+IntToStr(piIdBeneficio)  );

  qryAux.Open;
  if not (qryAux.IsEmpty) then begin
     sTPMODALIDADE := qryAux.FieldByName('TPMODALIDADE').AsString;
     if qryAux.FieldByName('FLGPAGAINTEG').AsInteger > 0
     then bPagaIntegral       := True
     else bPagaIntegral       := False;
     iIdRegraCalculo     := qryAux.FieldByName('IDREGRACALCULO').AsInteger;
     iIdRegraCalcReserva := qryAux.FieldByName('IDREGRAPAGAMENTO').AsInteger;
  end
  else begin
     bPagaIntegral       := False;
     iIdRegraCalculo     := -1;
     iIdRegraCalcReserva := -1;
  end;



  // Buscar opcoes do beneficio para passar para a regra de reajuste
  with qryAux do
  begin
     Close;
     SQL.Clear;
     // cguedes - 31/07/2003 - Pend.: 14651/2
     If piIdTitular = piIdBeneficiario Then
       SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFPLANOPART '+
               ' WHERE  IDPESSJUR    = '+IntToStr(piIdPessJur)+
               ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
               ' AND    IDPESSOA     = '+IntToStr(piIdBeneficiario)+
               ' AND    SEQPROPOSTA  = '+IntToStr(piSeqProposta)+
               ' AND    IDBENEFICIO  = '+IntToStr(piIdBeneficio) )
     Else
         SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFBFCIARIO '+
                 ' WHERE  IDPESSJUR    = '+IntToStr(piIdPessJur)+
                 ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                 ' AND    IDTITULAR    = '+IntToStr(piIdTitular)+
                 ' AND    IDPESSOA     = '+IntToStr(piIdBeneficiario)+
                 ' AND    SEQPROPOSTA  = '+IntToStr(piSeqProposta)+
                 ' AND    IDBENEFICIO  = '+IntToStr(piIdBeneficio) );
     Open;
     if not IsEmpty
     then begin
        dValorBase1 := FieldByName('VALORBASE1').AsFloat;
        dValorBase2 := FieldByName('VALORBASE2').AsFloat;
        dValorBase3 := FieldByName('VALORBASE3').AsFloat;
     end
     else begin
        dValorBase1 := 0;
        dValorBase2 := 0;
        dValorBase3 := 0;
     end;
  end;

  // CAMILLE - 30.04.2003
  // Se for retroativo do tipo revisão de benefício, chamar regra de calculo de beneficio
{  if piTipoMov = 13
  then begin
     // Buscar opcoes do beneficio para passar para a regra de reajuste
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT BF.NUMEROPROCESSO,   BF.IDPESSJUR,      BF.IDPLANOPREV, BF.IDPLANOORIGEM,     '+
                '        BF.IDTITULAR,        BF.IDPESSOA,       BF.SEQPROPOSTA,                       '+
                '        BF.IDBENEFICIO,      BF.IDBENEFREFEREN,                                       '+
                '        BF.CODPORTFORMA,     BF.IDSITBENEFICIO, BF.IDDEPENDENCIA,                     '+
                '        BF.IDTPPAGTOBENEFIC, BF.VALORATUAL,     BF.DATAREQUERIMENTO,                  '+
                '        BF.DATAINICIO,       BF.DATAFINAL,      BF.FLGFORMAPAGTO,                     '+
                '        BF.VALORCALCULADO, BF.DATAULTREAJUSTE,                                        '+
                '        BF.VLRCALCINSS,      BF.VLRINFINSS,     BF.DATAINICIOINSS,                    '+
                '        BF.NUMPROCINSS,      BF.DATAINICIOFUND, BF.VALORCOTAS,                        '+
                '        BF.DATACONCESSAO,    BF.FLGPROVISORIO,  BF.PERCPROVISORIO,                    '+
                '        BF.PRAZOPROVISORIO,  BF.ULTMESREAJUSTE, BF.ULTVALORATUALREAJ,                 '+
                '        BF.IDAGENCIARESGATE, BF.DATAFINALPREVISTA,                                    '+
                '        BF.FLGDATAPREVISTA,  BF.FLGTIPOINSS,    BF.DIBBENEFANT,                       '+
                '        BF.VALORBENEFANT,    BF.VALORBINSSANT1, BF.VALORBINSSANT2, BF.VALORBINSSANT3, '+
                '        BF.VALORTOTAL,       BF.FLGPOSSUIACOMPINSS, BF.FLGBENEFMIN,                   '+
                '        BF.VALORSRB,         P.DTEVENTO,                                              '+
                '        EL.IDSITFUNC,        PP.IDSITPART, PP.IDSITPLANOPREV                          '+
                ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PROCESSOBENEF P, BENEFBFCIARIO  BF             '+
                ' WHERE  BF.IDPESSJUR    = '+IntToStr(piIdPessJur)                                      +
                ' AND    BF.IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)                                    +
                ' AND    BF.IDPESSOA     = '+IntToStr(piIdTitular)                                      +
                ' AND    BF.SEQPROPOSTA  = '+IntToStr(piSeqProposta)                                    +
                ' AND    BF.IDBENEFICIO  = '+IntToStr(piIdBeneficio)                                    +
                ' AND    P.NUMEROPROCESSO = BF.NUMEROPROCESSO                                          '+
                ' AND    EL.IDPESSJUR     = BF.IDPESSJUR                                               '+
                ' AND    EL.IDPESSOA      = BF.IDTITULAR                                               '+
                ' AND    PP.IDPESSJUR     = BF.IDPESSJUR                                               '+
                ' AND    PP.IDPLANOPREV   = BF.IDPLANOPREV                                             '+
                ' AND    PP.IDPESSOA      = BF.IDTITULAR                                               '+
                ' AND    PP.SEQPROPOSTA   = BF.SEQPROPOSTA                                             ');
        Open;
     end;

     dValorEmReal := ExecutaRegraCalculoBeneficio( qryAux,
                                                   iIdRegraCalculo,
                                                   iIdRegraCalcReserva,
                                                   piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   piSeqProposta,
                                                   piIdBeneficio,
                                                   piNumeroProcesso,
                                                   dValorBase1,
                                                   dValorBase2,
                                                   dValorBase3,
                                                   '',
                                                   qryAux.FieldByName('DTEVENTO').AsString,
                                                   qryAux.FieldByName('DATAINICIOFUND').AsString,
                                                   qryAux.FieldByName('DATAINICIOINSS').AsString,
                                                   qryAux.FieldByName('DATAINICIO').AsString,
                                                   qryAux.FieldByName('DATAREQUERIMENTO').AsString,
                                                   qryAux.FieldByName('VLRINFINSS').AsString,
                                                   qryAux.FieldByName('VLRCALCINSS').AsString,
                                                   '0',
                                                   False,
                                                   0,
                                                   '',
                                                   '0',
                                                   '0',
                                                   '0',
                                                   '0',
                                                   bErro,
                                                   sMsgErro,
                                                   iIdCalculoGeral,
                                                   0,
                                                   qryAux.FieldByName('VALORSRB').AsFloat,
                                                   qryAux.FieldByName('IDSITPART').AsString,
                                                   qryAux.FieldByName('IDSITPLANOPREV').AsString,
                                                   qryAux.FieldByName('IDSITFUNC').AsString,
                                                   qryAux.FieldByName('IDSITPART').AsString,
                                                   qryAux.FieldByName('IDSITPLANOPREV').AsString,
                                                   qryAux.FieldByName('IDSITFUNC').AsString);
  end;
}

  // Se o benefício for em cotas
  // Entao converter para real na data de competencia
  // Senao Se houve reajuste no mes
  //       Entao reajusta beneficio conforme tabela de reajuste
  if psCalculaTodoMes = '1'
  then sValorFinal := PegaValorEmReal( qryAux,
                                       piIdTitular,
                                       piIdBeneficiario,
                                       piIdPessJur,
                                       piIdPlanoPrev,
                                       piIdBeneficio,
                                       piSeqProposta,
                                       piTotBeneficiarios,
                                       psDataInicio,
                                       psDataPagamento, // CAMILLE - CBS - 15.03.2002
                                       psAnoMesCalculo,
                                       dValorEmCotas,
                                       bErro,
                                       sMsgErro)
  else begin
       if (piTipoMov in [0,1,2,12]) // CAMILLE - 18.03.2003
       then lsDataInicio := psDataInicioOriginal
       else lsDataInicio := psDataInicio;

       if piIdTitular = piIdBeneficiario
       then dValorAReajustar := dValorEmReal
       else dValorAReajustar := dValorTotal;

       // CAMILLE - 24.06.2003
       // Origem :
       // 0 - Outros ,
       // 1 - Suspensao de contribuicao
       // 2 - Concessao de Beneficio
       // 3 - Renova
       // 4 - Encerramento

       case piTipoMov of
            0  : iOrigem := 3; //  Renovacao
            1  : iOrigem := 3; //  Reabertura
            2  : iOrigem := 3; //  Prorrogacao
            3  : iOrigem := 4; //  Retencao
            4  : iOrigem := 4; //  Encerramento
            5  : iOrigem := 5; //  Desdobramento { Augusto 25/11/2003 }
            6  : iOrigem := 0; //  Reajuste Judicial
            7  : iOrigem := 2; //  Concessao
            8  : iOrigem := 0; //  Recalculo de Beneficio Provisorio
            9  : iOrigem := 0; //  Registro de falecimento de beneficiario
            10 : iOrigem := 0; //  Desfazer
            11 : iOrigem := 0; //  Liberacao de pagamento integral
            12 : iOrigem := 0; //  Liberacao de Beneficio Retido
            13 : iOrigem := 2; //  Revisão de Benefícios
            14 : iOrigem := 0; //  Alteracao de Tipo de Beneficio
       end;
       // CAMILLE - 27.11.2003
       // SE FOR RETROATIVO, PASSAR ULTMESREAJUSTE
       if bRetroativo then
         sValorFinal := ReajustaBenefConc(qryAux,
                                        psAnoMesCalculo, //P.RAMOS - 16.08.2001 - REFER - VARIAVEL LOCAL PARA TRATAR DATA INICIO NO REAJUSTE DE RENOVA
                                        lsDataInicio,
                                        piIdPessJur,
                                        piIdPlanoPrev,
                                        piIdTitular,
                                        piIdBeneficiario,
                                        piIdBeneficio,
                                        piNumeroProcesso,
                                        piTotBeneficiarios,
                                        dValorAReajustar,
                                        dValorBase1,
                                        dValorBase2,
                                        dValorBase3,
                                        bReajustou,
                                        bErro,
                                        False, sMsgErro,
                                        dValorTotal,
                                        pdValorSRBRetorno,
                                        bRetroativo,       // CAMILLE - 20.01.2003
                                        iOrigem,           // CAMILLE - 24.06.2003
                                        sUltMesReajuste,   // CAMILLE - 27.11.2003
                                        pbCalculaTudo, { Augusto 20/02/2004 }
                                        pbMigracaoPlano) //leofuncef - 06042004
       else sValorFinal := ReajustaBenefConc(qryAux,
                                        psAnoMesCalculo, //P.RAMOS - 16.08.2001 - REFER - VARIAVEL LOCAL PARA TRATAR DATA INICIO NO REAJUSTE DE RENOVA
                                        lsDataInicio,
                                        piIdPessJur,
                                        piIdPlanoPrev,
                                        piIdTitular,
                                        piIdBeneficiario,
                                        piIdBeneficio,
                                        piNumeroProcesso,
                                        piTotBeneficiarios,
                                        dValorAReajustar,
                                        dValorBase1,
                                        dValorBase2,
                                        dValorBase3,
                                        bReajustou,
                                        bErro,
                                        False, sMsgErro,
                                        dValorTotal,
                                        pdValorSRBRetorno,
                                        bRetroativo,       // CAMILLE - 20.01.2003
                                        iOrigem,  // CAMILLE - 24.06.2003
                                        '' ,False,pbMigracaoPlano); //leoprovisorio

                                        
       if (bReajustou) and ((sUltMesReajuste = '') or (psAnoMesCalculo > sUltMesReajuste))
       then sUltMesReajuste := psAnoMesCalculo;

       if (piIdTitular <> piIdBeneficiario) and (not bReajustou)
       then begin
          dValorEmReal := dValorEmRealOriginal;
          dValorTotal  := dValorTotalOriginal;
          { Augusto 09/12/2003 }
          //sValorFinal  := FloatToStr(dValorEmRealOriginal);
          if piIdTitular = piIdBeneficiario
          then sValorFinal := FloatToStr(dValorEmRealOriginal)
          else sValorFinal := FloatToStr(dValorTotalOriginal);
       end;

       dValorEmReal := StrToFloat(ClienteNumero(sValorFinal));
       //dValorTotal  := StrToFloat(ClienteNumero(sValorFinal)); { Augusto 10/07/2003}
  end;

  if bErro then Exit;

  sValorFinal              := OraNumero(sValorFinal);
  dValorBeneficioNoMes     := StrToFloat(ClienteNumero(sValorFinal));

  if (piIdTitular <> piIdBeneficiario) and (not bReajustou)
  then pdValorBeneficioIntegralOriginal := dValorTotal
  else pdValorBeneficioIntegralOriginal := dValorBeneficioNoMes;

  pdValorBeneficioIntegralAposMinimo := pdValorBeneficioIntegralOriginal;

  // *************************************************************************************
  // ********************** TRATAMENTO DE BENEFÍCIO MÍNIMO *******************************
  // *************************************************************************************
  // Neste ponto a variavel sValorFinal, dValorTotal e dValorBeneficioNoMes está com o
  // valor do benefício reajustado, sem pro-rata de beneficiarios e sem pro-rata dias
  pdValorPrevAntesMinimo := dValorBeneficioNoMes;

  if not CalculaBeneficioMinimo ( piNumeroProcesso,
                                  piIdPessJur,
                                  piIdPlanoPrev,
                                  piIdTitular,
                                  piIdBeneficiario,
                                  piIdBeneficio,
                                  FloatToStr(dValorBeneficioNoMes),
                                  FloatToStr(pdValorBeneficioIntegralOriginal),
                                  piTotBeneficiarios,
                                  psAnoMesCalculo,
                                  psDataInicioOriginal,
                                  psDataFinal,
                                  dValorDepoisMinimo,
                                  sMsgErro)
  then Exit;

  if dValorDepoisMinimo > 0
  then begin
     sValorFinal                        := FloatToStr(dValorDepoisMinimo);
     dValorBeneficioNoMes               := StrToFloat(ClienteNumero(sValorFinal));
     //dValorTotal                        := StrToFloat(ClienteNumero(sValorFinal));
     pdValorBeneficioIntegralAposMinimo := StrToFloat(ClienteNumero(sValorFinal));
  end;

  // *************************************************************************************
  // ********************* FIM DO TRATAMENTO DE BENEFÍCIO MÍNIMO *************************
  // *************************************************************************************

  // *************************************************************************************
  // ********************* TRATAMENTO DE PRO-RATA BENEFICIARIOS  *************************
  // *************************************************************************************
  if ((piIdTitular <> piIdBeneficiario) and
     (bReajustou or (dValorDepoisMinimo > 0)))
     and (not pbMigracaoPlano)  //leofuncef - 08042004
  then begin
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

      sFlgInternoAntes := qryAux.FieldByName('flginternoant').AsString;
      sFlgInternoAtual := qryAux.FieldByName('flginterno').AsString;

      sIdSitPartAntes := qryAux.FieldByName('idsitpartatual').AsString;
      sIdSitPlanAntes := qryAux.FieldByName('idsitplanoatual').AsString;
      sIdSitFuncAntes := qryAux.FieldByName('idsitfuncatual').AsString;

      sIdSitPartAtual := qryAux.FieldByName('idsitpartnovo').AsString;
      sIdSitPlanAtual := qryAux.FieldByName('idsitplanonovo').AsString;
      sIdSitFuncAtual := qryAux.FieldByName('idsitfuncnovo').AsString;

      // CAMILLE - 23.01.2003
      // Buscar INSS INTEGRAL no mes que está sendo processado
      sFlgBenefMinimo := '0';
      sVlrInfINSS := CalcBeneficioINSSAtual( piIdPessJur,
                                             piIdPlanoPrev,
                                             piIdBeneficiario,
                                             psAnoMesCalculo,
                                             psAnoMesCalculo,
                                             sIDTPPAGTOANT,
                                             sFlgBenefMinimo,
                                             qryAux,
                                             piNumeroProcesso);
      { Inicio Augusto 24/06/2004 }
      { Buscar o VALORCALCULADO para o caso de Dupla Atividade (FUNCEF) }
      sVlrCalcInss := CalcBeneficioINSSAtual(piIdPessJur,
                                             piIdPlanoPrev,
                                             piIdBeneficiario,
                                             psAnoMesCalculo,
                                             psAnoMesCalculo,
                                             sIDTPPAGTOANT,
                                             sFlgBenefMinimo,
                                             qryAux,
                                             piNumeroProcesso,
                                             'C');
      { Fim Augusto 24/06/2004 }

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT 1 FLGCONCESSAO, '+ //leocm - 20062002 - adicionei flgconcessao
                     '        BF.SEQPROPOSTA,  '+ //leocm - 25062002 - adicionei seqproposta
                     '        P.DTEVENTO, BF.DATAINICIO, BF.DATAFINAL, BF.DATAINICIOINSS,         '+
                     '        BF.VLRINFINSS, BP.IDREGRAPAGAMENTO,  BP.IDREGRACALCULO,             '+
                     '        DP.IDDEPENDENCIA, BTIT.PERCENTUAL, BF.DIBBENEFANT, BF.VALORBENEFANT,'+
                     '        BF.VLRCALCINSS, '+
                     '        BF.IDTITBENEF, BF.IDTITULAR, BF.IDPESSOA '+ { Augusto 18/02/2004 }
                     ' FROM   BENEFPLANPREV BP, DEPENTIT DP, BFCIARIOTITPLAN BTIT, PROCESSOBENEF P, BENEFBFCIARIO BF    '+
                     ' WHERE  BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                     ' AND    BF.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                     ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                     ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)+
                     ' AND    BF.SEQPROPOSTA    = 1 '+
                     ' AND    BF.IDPESSOA       = '+IntToStr(piIdBeneficiario)+
                     ' AND    BF.IDBENEFICIO    = '+IntToStr(piIdBeneficio)+
                     ' AND    P.NUMEROPROCESSO  = BF.NUMEROPROCESSO '+
                     ' AND    BP.IDPLANOPREV    = BF.IDPLANOPREV    '+
                     ' AND    BP.IDBENEFICIO    = BF.IDBENEFICIO    '+
                     ' AND    BTIT.IDPESSJUR    = BF.IDPESSJUR      '+
                     ' AND    BTIT.IDPLANOPREV  = BF.IDPLANOPREV    '+
                     ' AND    BTIT.IDTITULAR    = BF.IDTITULAR      '+
                     ' AND    BTIT.IDPESSOA     = BF.IDPESSOA       '+
                     ' AND    BTIT.SEQPROPOSTA  = BF.SEQPROPOSTA    '+
                     ' AND    BTIT.IDBENEFICIO  = BF.IDBENEFICIO    '+
                     ' AND    DP.IDTITULAR      = BTIT.IDTITULAR    '+
                     ' AND    DP.IDPESSOA       = BTIT.IDPESSOA     ');
      qryAux.Open;

      { Augusto 18/02/2004 - Guarda dados }
      iIdParticipante := QryAux.FieldByName('IDTITBENEF').AsInteger;
      iIdTitularBenef := QryAux.FieldByName('IDTITULAR').AsInteger;
      iIdBeneficiario := QryAux.FieldByName('IDPESSOA').AsInteger;
      If (iIdParticipante = 0) Then begin
        iIdParticipante := iIdTitularBenef;
      End;

      // CAMILLE - 13.08.2002
      if qryAux.FieldByName('IDREGRACALCULO').AsInteger > 0
      then dValorBeneficioNoMes  := ExecutaRegraCalculoBeneficioBfciario( qryAux,
                                            qryAux.FieldByName('IDREGRACALCULO').AsInteger,
                                            -1,
                                            piIdPessJur,         piIdPlanoPrev,
                                            iIdParticipante, //piIdTitular, { Augusto 18/02/2004  }
                                            1,
                                            piIdBeneficio,       piNumeroProcesso,
                                            piTotBeneficiarios,
                                            dValorBase1, dValorBase2, dValorBase3,
                                            '', // psSQLBenefAssoc,
                                            qryAux.FieldByName('DTEVENTO').AsString,
                                            qryAux.FieldByName('DATAINICIO').AsString,
                                            qryAux.FieldByName('DATAINICIOINSS').AsString,
                                            OraNumero(FloatToStr(dValorBeneficioNoMes)),
                                            sVlrInfINSS, // CAMILLE - 23.01.2003
                                            sVlrCalcInss, { Augusto 24/06/2004 }//sVlrInfINSS,
                                            // qryAux.FieldByName('VLRINFINSS').AsString,
                                            // qryAux.FieldByName('VLRCALCINSS').AsString,
                                            '0', // psValorReserva,
                                            bErro,
                                            sMsgErro,
                                            iIdCalculoGeral,
                                            iIdBeneficiario, //piIdBeneficiario, { Augusto 18/02/2004  }
                                            qryAux.FieldByName('IDDEPENDENCIA').AsString,
                                            qryAux.FieldByName('PERCENTUAL').AsString,
                                            0,
                                            qryAux.FieldByName('DIBBENEFANT').AsString,
                                            qryAux.FieldByName('VALORBENEFANT').AsString,
                                            psAnoMesCalculo,
                                            iIdBeneficiario); { Augusto 18/02/2004  }

      { Guarda o valor do Beneficio "cheio" rateado entre os beneficiarios }
      pdValorBenefRateado := dValorBeneficioNoMes;
  end
  else pdValorBenefRateado := dValorBeneficioNoMes; // CAMILLE - 12.02.2003
  // *************************************************************************************
  // ******************** FIM DO TRATAMENTO DE PRO-RATA BENEFICIARIOS  *******************
  // *************************************************************************************

  // CAMILLE - 29.01.2004
  // Se não reajustou e o beneficio é para beneficiario, a variavel dValorBeneficioNoMes
  // está com o valor TOTAL, sem rateio de beneficiários
  if (piIdTitular <> piIdBeneficiario) And
     { Augusto 08/02/2004 - dValorBeneficioNoMes so não seria reateado se dValorDepoisMinimo <= 0}
     ((not bReajustou) And (dValorDepoisMinimo <= 0))
  then begin
     dValorBeneficioNoMes := dValorEmRealOriginal;
     pdValorBenefRateado  := dValorBeneficioNoMes;
  end;

  // Se for para executar regra de 1o. e ultimo pagamento
  // Entao Inicio
  //    Se for 1o. pagamento
  //    Entao executar regra de 1o pagamento
  //    Senao Se for ultimo pagamento
  //          Entao executar regra de ultimo pagamento
  // Final
  if (pbCalculaPrimUltPgto and (not bPagtoUnico))
     and (not pbMigracaoPlano) //leofuncef - 07042004
  then begin
     // Verificar se é 1o. pagamento
     if (psAnoMesCalculo = Copy(psDataInicio,7,4) + '/' + Copy(psDataInicio,4,2))
     then begin
        dValorBeneficioNoMes := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                               piIdRegraPrimPagto,
                                                               piIdTitular,
                                                               piIdBeneficiario,
                                                               piSeqProposta,
                                                               piIdPessJur,
                                                               piIdPlanoPrev,
                                                               piIdBeneficio,
                                                               piTotBeneficiarios,
                                                               psDataInicio,
                                                               psDataFinal,
                                                               OraNumero(FloatToStr(dValorBeneficioNoMes)),
                                                               ' Primeiro ', bErro, sMsgErro);

        if bErro then Exit;
     end; // if 1o. pagamento

     // Verificar se é ultimo pagamento
     if ((psAnoMesCalculo = psUltMesCalculo) and (Trim(psDataFinal) <> '') and
        (Copy(psDataFinal,7,4)+'/'+Copy(psDataFinal,4,2) <= psUltMesCalculo) and ( (piFlgDataPrevista = 0) or (not bPagaIntegral) ))
        and (not pbMigracaoPlano) //leofuncef - 07042004
     then begin
        dValorBeneficioNoMes := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                   piIdRegraUltPagto,
                                   piIdTitular, piIdBeneficiario, piSeqProposta,
                                   piIdPessJur, piIdPlanoPrev,
                                   piIdBeneficio,  piTotBeneficiarios,
                                   psDataInicio,
                                   // CAMILLE - 08.06.2004
                                   Copy(psDataFinal,1,2) + '/'+Copy(psAnoMesCalculo,6,2) + '/' + Copy(psAnoMesCalculo,1,4), // Passa para a regra a data de reajuste
                                   // A IMPLEMENTACA ABAIXO ESTÁ COMPLETAMENTE ERRADA POIS
                                   // LEVANDO O ULTIMO DIA DO MES PARA A REGRA DE PRO-RATA,
                                   // NÃO HAVERÁ PRO-RATA
                                   // Gleyber - 24/05/2004 - Pendência 16834 - Inicio
                                   // (FormatFloat('00',
                                   //           TrazUltDiaMes(StrToInt(Copy(psAnoMesCalculo,6,2)),
                                   //                         StrToInt(Copy(psAnoMesCalculo,1,4))
                                   //                         )
                                   //           )+ '/'+
                                   //            Copy(psAnoMesCalculo,6,2) + '/' +
                                   //            Copy(psAnoMesCalculo,1,4)
                                   //  ),
                                   // Gleyber - 24/05/2004 - Pendência 16834 - Fim
                                   OraNumero(FloatToStr(dValorBeneficioNoMes)),
                                   ' Último ', bErro, sMsgErro);
        if bErro then Exit;
     end; // if ultimo pagamento
  end; // if pbCalculaPrimUltPgto

  bErro    := False;

  Result   := dValorBeneficioNoMes;

end; // CalculaBeneficioAPagarNoMes

function PegaSeqBeneficio(qryAux : TwwQuery;
                          piIdPessJur,   piIdTitular,
                          piIdPlanoPrev, piIdPessoa,
                          piSeqProposta, piNumeroProcesso,
                          piIdBeneficio, piIdMotivo         : longint;
                          psAnoMesPgmto, psAnoMesRef        : string): word;
var sSQL : string;
begin

  sSQL := ' SELECT SEQBENEFICIO FROM HSTBENEFBFCIARIO '+
          ' WHERE (IDPESSJUR      = '+IntToStr(piIdPessJur)+'     ) '+
          ' AND   (IDTITULAR      = '+IntToStr(piIdTitular)+'     ) '+
          ' AND   (IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+'   ) ';
  if Trim(psAnoMesPgmto) <> ''
  then sSQL := sSQL + ' AND (MES  = '''+psAnoMesPgmto+'''         ) ';

  sSQL := sSQL + '  AND   (IDMOTIVO       = '+IntToStr(piIdMotivo)+'      ) '+
          ' AND   (IDBENEFICIO    = '+IntToStr(piIdBeneficio)+'   ) '+
          ' AND   (NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+') '+
          ' AND   (IDPESSOA       = '+IntToStr(piIdPessoa)+'      ) '+
          ' AND   (MESREFERENCIA  = '''+psAnoMesRef  +'''         ) '+
          ' AND   (SEQPROPOSTA    = '+IntToStr(piSeqProposta)+'   ) ';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if qryAux.IsEmpty
  then Result := 1
  else Result := qryAux.FieldByName('SeqBeneficio').AsInteger + 1;
  qryAux.Close;
end;

function BuscaPlanoOrigem ( pIdPessjur  : longint;
                            pIdTitular  : longint;
                            psAnoMesRef : string;
                            pIdPessoa   : longint = 0): String;
var
  qry : TwwQuery;
  bBuscaUltPlanoOrigem : boolean;
begin
  Result := '-1';
  if psAnoMesRef = ''
  then bBuscaUltPlanoOrigem := True
  else bBuscaUltPlanoOrigem := False;

  try
    qry := TwwQuery.Create(Application);
    qry.DatabaseName :=  'BaseDados';

    qry.SQL.Clear;
    qry.SQL.Add(' SELECT IDPLANOPREV  AS IDPLANOORIGEM    '+
                ' FROM   PARTPREVPLAN    '+
                ' WHERE  IDPESSJUR     = '+IntToStr(pIdPessjur)+
                ' AND    IDPESSOA      = '+IntToStr(pIdTitular));
    if not bBuscaUltPlanoOrigem
    then qry.SQL.Add(' AND    TO_CHAR(INSCRICAODATA,''YYYY/MM'') <= '''+psAnoMesRef+'''');

    qry.SQL.Add(' ORDER BY FLGDESATIVADO, DATACANCELAMENTO DESC ');
    qry.Open;
    if not qry.IsEmpty
    then Result := qry.FieldByName('IDPLANOORIGEM').AsString;
  finally
    qry.Free;
  end;
end;

Function PagaMesPagAbono(QryAux:TwwQuery;  iIdPessjur, iIdPlanoPrev, iIdBeneficio : Integer; sMesPagAtual : String) : String;
Begin
  Result := '12';



  //leofuncef - 04022004 - PROVISORIO
  //verifica meses de pagamento de antecipação de abono
  //uma estrutura deve ser criada para atender
  //pagamento de antecipação de abono, que na Funcef acontece
  //para as concessões de FEVEREIRO a JUNHO, sendo pago 50% do valor do abono
  qryaux.close;
  qryaux.sql.text := ' SELECT  PERCENTUAL '+
                     ' FROM  PARAMANTECIPABONO '+
                     ' WHERE IDPESSJUR = '+IntToStr(iIdPessjur)+' AND '+
                     ' MES = '''+sMesPagAtual+''' AND '+
                     ' IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+' AND '+
                     ' IDBENEFICIO = '+IntToStr(iIdBeneficio)+' ';
  qryaux.open;


  if qryAux.IsEmpty then Exit
  else
  begin
     Result := copy(sMesPagAtual,6,2);   //leofuncef - 05/02/2004
     exit;
  end;



  qryaux.close;
  qryaux.sql.text := ' SELECT MESPGABONO    '+
                     ' FROM PLANPREV      '+
                     ' WHERE IDPLANOPREV = '+IntToStr(iIdPlanoPrev);
  qryaux.open;

  // CAMILLE - 07.01.2004
  if qryAux.IsEmpty or (qryAux.FieldByName('MESPGABONO').AsString = '')
  then Exit;

  Result := qryaux.fieldbyname('MESPGABONO').AsString;

end;

function  ExecutaRegraValorAbono( qryAux              : TwwQuery;
                                  piIdRegraCalculo,
                                  piIdPessJur,
                                  piIdPlanoPrev,
                                  piIdTitular,
                                  piSeqProposta,
                                  piIdPessoa,
                                  piIdBeneficio       : longInt;
                                  psDataInicio,
                                  psDataFinal,
                                  psAnoMesAtual       : string;
                                  prValorBenef        : double;
                                  psFlgProvisorio     : String;  // Gleyber - 16/12/2002
                                  var bErro           : boolean;
                                  var sMsgErro        : string;
                                  piTipoMov       : word;               // CAMILLE - 23.01.2003
                                  piNumBenef      : integer;  // CAMILLE - 27.01.2003
                                  psDataInicioFund : String = '') : double; { Augusto 11/11/2003 }


var
   sSQL,
   sDataInicio, sDataFinal,
   sAnoMesReferencia,
   sValorAbono             : string;
   rValorAbono             : double;
  // Dados necessários do benefício anterior
  sDataInicioAnt,  // var. auxiliar apenas para passar para a funcao. A var. utilizada é a psDataInicioAnt
  sValorAnt,       // var. auxiliar apenas para passar para a funcao. A var. utilizada é a psValorBenefAnt
  sNomeBenefAnt,
  sIdTpPagtoAnt,
  sFlgBenefMinAnt,
  sDataEventoAnt,
  sCodBeneficioAnt,
  sNumProcINSS,
  sUltMesReajAnt,
  sValorBase1Ant,
  sValorBase2Ant,
  sValorBase3Ant,
  sDataInicioInss,
  sDataInicioFund    : string;

  bReferencia : Boolean;

begin
  Result := -1;
  if piIdRegraCalculo <= 0 then Exit;

  // Para a regra de calculo, DATAINICIO = DIB - DATA DE DIREITO = (QUASE SEMPRE) DATA DO EVENTO
  //                          DATAREF    = DATA DO EVENTO
  sDataInicio := psDataInicio;
  sDataFinal  := psDataFinal;
  sDataInicioFund := psDataInicioFund;

  sDataInicioInss := '';

  sAnoMesReferencia := Copy(psAnoMesAtual,1,4)+'/13'; // CAMILLE - CBS - 13.11.2001

  if Trim(sDataInicio) = ''   then sDataInicio := DateToStr(Date);

  // Se a data final estiver em branco, é porque o benefício é vitalício
  // ou não acabou no ano ainda, então passar a data do ultimo dia do ano
  if Trim(sDataFinal) = '' then sDataFinal := '31/12/'+Copy(sAnoMesReferencia,1,4);

  // Camille - 23.01.2002
  // Se não for RENOVA e Se o beneficio for de referencia e o parametro
  //    flgdataabono estiver como 1
  // Entao passar como data de inicio a data da suplementacao e não do inss
//  if piTipoMov <> 0
//  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT BP.FLGREFERENCIA, BP.FLGDATAABONO                    '+
                    ' FROM   BENEFPLANPREV BP                                     '+
                    ' WHERE  BP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)            +
                    ' AND    BP.IDBENEFICIO = '+IntToStr(piIdBeneficio)            );
     qryAux.Open;

     bReferencia := (qryAux.FieldByName('FLGREFERENCIA').AsInteger = 1);


     if bReferencia   and (qryAux.FieldbyName('FLGDATAABONO').AsInteger = 1)
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT BF.DATAINICIOFUND, BF.DATAINICIOINSS, BP.FLGDATAABONO '+
                       ' FROM   BENEFBFCIARIO BF,BENEFPLANPREV BP, BENEFICIO B                       '+
                       ' WHERE  BF.IDPESSJUR      = '+IntToStr(piIdPessJur)          +
                       ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)        +
                       ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)          +
                       ' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)           +
                       ' AND    BF.IDBENEFREFEREN = '+IntToStr(piIdBeneficio)        +
                       ' AND    BP.IDPLANOPREV    =  BF.IDPLANOPREV                ' +
                       ' AND    BP.IDBENEFICIO    =  BF.IDBENEFICIO                ' +
                       ' AND    TO_CHAR(BF.DATAINICIO,''YYYY/MM'') <= '''+psAnoMesAtual+''''+
                       ' AND    ((BF.DATAFINAL IS NULL) OR (TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+psAnoMesAtual+''''+') )'+
                       ' AND    B.IDBENEFICIO     = BF.IDBENEFICIO                  '+
                       ' AND    B.TIPOBENEFICIO   <> 99                             ');
        qryAux.Open;

        if not qryAux.IsEmpty then
        begin
           if (qryAux.FieldbyName('FLGDATAABONO').AsInteger = 1) then
               sDataInicio := qryAux.FieldByName('DATAINICIOFUND').AsString;

           sDataInicioInss := qryAux.FieldByName('DATAINICIOINSS').AsString;
           sDataInicioFund :=qryAux.FieldByName('DATAINICIOFUND').AsString;
        end;

     end;

     if bReferencia
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT BF.DATAINICIOFUND, BF.DATAINICIOINSS              '+
                       ' FROM   BENEFBFCIARIO BF, BENEFICIO B                       '+
                       ' WHERE  BF.IDPESSJUR      = '+IntToStr(piIdPessJur)          +
                       ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)        +
                       ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)          +
                       ' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)           +
                       ' AND    BF.IDBENEFICIO = '+IntToStr(piIdBeneficio)        +
                       ' AND    TO_CHAR(BF.DATAINICIO,''YYYY/MM'') <= '''+psAnoMesAtual+''''+
                       ' AND    ((BF.DATAFINAL IS NULL) OR (TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+psAnoMesAtual+''''+') )'+
                       ' AND    B.IDBENEFICIO     = BF.IDBENEFICIO                  '+
                       ' AND    B.TIPOBENEFICIO   <> 99                             ');
        qryAux.Open;

        if not qryAux.IsEmpty then
        begin
           sDataInicioInss := qryAux.FieldByName('DATAINICIOINSS').AsString;
           sDataInicioFund :=qryAux.FieldByName('DATAINICIOFUND').AsString;
        end;

     end;


//  end;

     BuscaDadosBeneficioAnterior ( qryAux,
                                   piIdPessJur, piIdPlanoPrev, piIdTitular,
                                   piIdBeneficio,
                                   0, // flgreferencia
                                   sDataInicio,
                                   sDataInicioAnt,
                                   sValorAnt,
                                   sNomeBenefAnt,
                                   sIdTpPagtoAnt,
                                   sUltMesReajAnt,
                                   sFlgBenefMinAnt,
                                   sDataEventoAnt,
                                   sCodBeneficioAnt,
                                   sValorBase1Ant, sValorBase2Ant, sValorBase3Ant, //leocm - 31102002 - esteve zerando os valoresbase
                                   sNumProcINSS,
                                   True);

  if sDataInicioAnt = '' then sDataInicioAnt := '         ';

  // Executa Regra de Cálculo do Valor do Beneficio
  sSQL := ' SELECT    1 FLGCONCESSAO, '+//leocm - 20062002 - adicionei flgconcessao
           psFlgProvisorio                     +' AS FLGPROVISORIO,    '+ // Gleyber - 16/12/2002
           ''+IntToStr(piIdPessoa)             +' AS IDPESSOA,         '+
           IntToStr(piIdPessJur)               +' AS IDPESSJUR,        '+
           IntToStr(piIdTitular)               +' AS IDTITULAR,        '+
           IntToStr(piIdPlanoPrev)             +' AS IDPLANOPREV,      '+
           IntToStr(piSeqProposta)             +' AS SEQPROPOSTA,      '+
           IntToStr(piIdBeneficio)             +' AS IDBENEFICIO,      '+
           '''' +   PreparaStrRegra(sDataInicio)          + ''' AS DATAINICIO,    '+
           '''' +   PreparaStrRegra(sDataFinal)           + ''' AS DATAFINAL,     '+
                     //'''' +   PreparaStrRegra(sDataFinal)           + ''' AS DATAREF,       '+
           { Augusto 09/02/2004 - Retornar o ultimo dia do mês }
           'LAST_DAY(TO_DATE(''01/'+copy(psAnoMesAtual,6,2)+'/'+ { Augusto 05/04/2004 - TO_DATE }
                                    copy(psAnoMesAtual,1,4)+''',''DD/MM/YYYY'')) AS DATAREF,  '+ // leofuncef - 02/02/2004
                     '''' +   PreparaStrRegra(sAnoMesReferencia)    + ''' AS MESREFERENCIA, '+
           '''' +   PreparaStrRegra(sAnoMesReferencia)    + ''' AS ANOMESREF,     '+
           //leofuncef - 11/07/203 - inicio - inclusão de campos para regra
           '''' +   PreparaStrRegra(sDataInicioFund)       + ''' AS DATAINICIOFUND, '+
           '''' +   PreparaStrRegra(sDataInicioInss)          + ''' AS DATAINICIOINSS,    '+
           //leofuncef - 11/07/2003 - fim
           OraNumero(FloatToStr(prValorBenef)) + ' AS VLBENEFPGTO,     '+
           OraNumero(FloatToStr(prValorBenef)) + ' AS VALORATUAL,      '+
           '''' +   Trim(sAnoMesReferencia)    + ''' AS ANOREF,        '+
           OraNumero(IntToStr(piNumBenef))     + ' AS NUMBENEF,        '+
           '''' +   PreparaStrRegra(sDataInicioAnt)          + ''' AS DATAINICIOANT ' ;
  { Augusto 01/03/2004 - Utilizado no encerramento  }
  If piTipoMov = 3 Then Begin
    sSQL := sSQL + ', 1 AS FLGENCERRAMENTO  ';
  End Else Begin
    sSQL := sSQL + ', 0 AS FLGENCERRAMENTO  ';
  End;

  sSQL := sSQL + ' FROM DUAL ';

  sValorAbono := RegraNumerica(IntToStr(piIdRegraCalculo),sSQL, bErro, iIdCalculoGeral );

  if bErro
   then begin
     bErro := True;
     sMsgErro := ' Ocorreu um erro na Regra de Cálculo do Valor do Abono  (nº '+IntToStr(piIdRegraCalculo)+') ';
     Result  := -1;
     Exit;
  end;

  if Trim(sValorAbono) = ''
  then begin
     bErro := True;
     sMsgErro := ' A Regra de Cálculo do Valor do Abono (nº '+IntToStr(piIdRegraCalculo)+')'+
                 ' retornou um valor em branco. ';
     Result  := -1;
     Exit;
  end;

  try
     rValorAbono := StrToFloat(ClienteNumero(sValorAbono));
  except
     bErro := True;
     sMsgErro := ' A Regra de Cálculo do Valor do Abono (nº '+IntToStr(piIdRegraCalculo)+')' +
                 ' retornou um valor inválido. [Valor Retornado = '+sValorAbono+']';
     Result  := -1;
     Exit;
  end;
  bErro := False;
  sMsgErro := ' ';
  Result := rValorAbono;
end; // ExecutaRegraValorAbono

function VerificaFechamento(const lIdPessJur, lIdModulo: LongInt;
                            const sAnoMesRef: string; const sOperacao: Char;
                            var   cTipoEnvPrev: Char): Boolean;
begin
  Result := False; //Inicializando "Result";

  if not (sOperacao in ['A', 'B', 'E', 'R', 'P']) then
  begin
    MsgDlg('Atenção! Tipo de Operação inválido.', 'Erro', mtError, [mbOK], 0);
    Exit;
  end;

  {-----}

  try
   Screen.Cursor := crHourGlass;

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

     SQL.Add('SELECT DATAFECHAMENTO,');
     SQL.Add('       TIPOENVPREV');
     SQL.Add('FROM   SINCRONPREV');
     SQL.Add('WHERE  IDPESSJUR = ' + IntToStr(lIdPessJur));
     SQL.Add('AND    IDMODULO  = ' + IntToStr(lIdModulo));
     SQL.Add('AND    OPERACAO  = ''' + sOperacao  + '''');
     SQL.Add('AND    ANOMESREF = ''' + sAnoMesRef + '''');

     Open;

     //Se a Query possuir algum registro, "Result" será "True";
     if not IsEmpty then
     begin
       Result := True;
       if not FieldByName('TIPOENVPREV').IsNull then
        cTipoEnvPrev := FieldByName('TIPOENVPREV').AsString[1]
       else
        cTipoEnvPrev := ' ';
     end
     else
     begin
       Result       := False;
       cTipoEnvPrev := ' ';
     end;

     Close;
     Free;
   end;

   Screen.Cursor := crDefault;
   except on Error: Exception do
   begin
     Screen.Cursor := crDefault;
     MsgDlg('Atenção! Não foi possível concluir a verificação devido ao erro: ' + Error.Message,
            'Erro', mtError, [mbOK], 0);
   end;         
  end;  
end;

function VerificaUltimoReajuste(qryAux : twwquery;
                                pinumeroprocesso : longint) : string;
begin
  try
    qryaux.sql.text:='select ULTMESREAJUSTE from benefbfciario '+
                     'where numeroprocesso = '+inttostr(pinumeroprocesso);
    qryaux.open;
    if qryaux.isempty then
      result:=''
    else
      result:=qryaux.fields[0].asstring;
  except
    result:='';
  end;
end;

function PegaValorEmReal(  qryAux             : TwwQuery;
                           piIdTitular,
                           piIdBeneficiario,
                           piIdPessJur,
                           piIdPlanoPrev,
                           piIdBeneficio,
                           piSeqProposta,
                           piTotBeneficiarios : longint;
                           psDataInicio,
                           psDataPagamento,
                           psMesReferencia    : string; // CGUEDES - 22/07/2002
                           pdValorEmCotas     : double;
                           var bErro          : boolean;
                           var sMsgErro       : string ) : string;
var sSQL,
    sIdRegraReajuste,
    sIndiceReajuste,
    sDataDaCota,
    sValorBeneficio   : string;
    rValorDaCota,
    rValorBeneficio   : double;
begin
  Result := ClienteNumero(FloatToStr(pdValorEmCotas));
  bErro  := False;
  rValorBeneficio := 0;

  if Trim(psDataPagamento) = ''
  then begin
     bErro    := True;
     sMsgErro := 'Erro na conversão do valor em cotas para real : Data de Pagamento não informada.';
     Exit;
  end;

  // Se tiver regra de reajuste
  // Entao utilizar a regra
  // Senao entao converter na cota do indice cadastrado
  qryAux.Close;
  qryAux.SQL.Clear;
  // CGUEDES - 11/07/2002: INCLUINDO CAMPO IDREGRAREAJBENEF
  qryAux.SQL.Add(' SELECT INDICEREAJBENEF, IDREGRAREAJBENEF '+
                 ' FROM   BENEFPLANPREV '+
                 ' WHERE  IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                 ' AND    IDBENEFICIO = '+IntToStr(piIdBeneficio));
  qryAux.Open;

  if qryAux.IsEmpty
  then begin
     bErro    := True;
     sMsgErro := 'Benefício não encontrado no plano.';
     Exit;
  end;

  sIdRegraReajuste := qryAux.FieldByName('IDREGRAREAJBENEF').AsString;
  sIndiceReajuste  := qryAux.FieldByName('IndiceReajBenef').AsString;
  qryAux.Close;

  if Trim(sIdRegraReajuste) <> ''
  then begin
     sSQL := ' SELECT   1 FLGCONCESSAO, '+ //leocm - 20062002 - adicionei flgconcessao
             '''' + sIndiceReajuste + '''' + ' AS INDICEREAJBENEF, '+
             '''' + PreparaStrRegra(psDataPagamento) + '''' + ' AS DATAREF, ' +
             '''' + PreparaStrRegra(psDataInicio) + '''' + ' AS DATAINICIO, ' +
             '''' + Copy(psDataPagamento,7,4)+'/'+Copy(psDataPagamento,4,2)+''' AS MESREFERENCIA, '+
             IntToStr(piIdTitular)      + ' AS IDTITULAR, ' +
             IntToStr(piIdBeneficiario) + ' AS IDPESSOA, ' +
             IntToStr(piIdPessJur)      + ' AS IDPESSJUR, ' +
             IntToStr(piIdPlanoPrev)    + ' AS IDPLANOPREV, ' +
             IntToStr(piIdBeneficio)    + ' AS IDBENEFICIO, ' +
             IntToStr(piSeqProposta)    + ' AS SEQPROPOSTA, ' +
             IntToStr(piTotBeneficiarios) + ' AS NUMBENEF, ' +
             OraNumero(FloatToStr(pdValorEmCotas)) + ' AS VALORPREV, ' +
             OraNumero(FloatToStr(pdValorEmCotas)) + ' AS VALORATUAL ' +
             ' FROM DUAL ';

     sValorBeneficio := RegraNumerica(sIdRegraReajuste, sSQL, bErro, iIdCalculoGeral );

     if bErro
     then begin
        bErro := True;
        sMsgErro := ' Ocorreu um erro na Regra de Reajuste do Benefício (nº '+sIdRegraReajuste+') ';
        Exit;
     end;

     if Trim(sValorBeneficio) = ''
     then begin
        bErro := True;
        sMsgErro := ' A Regra de Reajuste do Benefício (nº '+sIdRegraReajuste+')'+
                    ' retornou um valor em branco. ';
        Exit;
     end;

     try
        rValorBeneficio := StrToFloat(ClienteNumero(sValorBeneficio));
     except
        bErro := True;
        sMsgErro := ' A Regra de Reajuste do Benefício (nº '+sIdRegraReajuste+')' +
                    ' retornou um valor inválido. [Valor Retornado = '+sValorBeneficio+']';
        Exit;
     end;
  end
  else begin
     // O beneficio é em cotas -> converter pelo indice


     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COTVALOR, COTDATA '+
                    ' FROM   COTACAOMOEDA      '+
                    ' WHERE  (MOECODIGO = '+sIndiceReajuste+')'+
//                    ' AND    (COTDATA <= TO_DATE('''+psDataPagamento+''',''DD/MM/YYYY'') ) '+
                    ' AND    (TO_CHAR(COTDATA,''YYYY/MM'') <= ''' + psMesreferencia + ''') '+ // CGUEDES - 22/07/2002
                    ' ORDER BY COTDATA DESC ');
     qryAux.Open;
     if qryAux.IsEmpty
     then begin
        qryAux.Close;
        sMsgErro := 'O índice de conversão do valor do benefício não está cadastrado. '+
                    'Verifique no Cadastro de Cotações da Moeda.';
        bErro := True;
        Exit;
     end;

     qryAux.First;
     rValorDaCota := qryAux.FieldByName('CotValor').AsFloat;
     sDataDaCota  := DateToStr(qryAux.FieldByName('CotData').AsDateTime);

     // Converter de cota para real
     if rValorDaCota = 0
     then begin
        qryAux.Close;
        sMsgErro := 'O índice de conversão do valor do benefício está zerado. '+
                    'Verifique no Cadastro de Cotações da Moeda.';
        bErro := True;
     end
     else rValorBeneficio := pdValorEmCotas * rValorDaCota;
  end;

  bErro := False;
  sMsgErro := ' ';
  Result := ClienteNumero(FloatToStr(rValorBeneficio));
end; // PegaValorEmReal


function ReajustaBenefConc (  qryAux                : TwwQuery ;
                              psAnoMesRef           ,
                              psDataInicio          : string;
                              piIdPessJur,
                              piIdPlanoPrev,
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
                                  bErro             : boolean;
                                  pbBenefReferencia : boolean;
                              var sMsgErro          : string;
                              var dValorTotal,
                                  dValorSRB         : double;
                                  pbRetroativo      : boolean;           // CAMILLE - 20.01.2003
                                  piOrigem          : integer;           // CAMILLE - 24.06.2003
                                  psUltMesReajuste  : string = '';
                                  pbCalculaTudo : Boolean = False;
                                  pbMigracaoPlano : Boolean = False  //leofuncef - 06042004
                                  ) : string; // CAMILLE - 27.11.2003

var sSQL,
    sIdRegraReajuste,
    sValorBeneficio : string;

    sUltMesReajuste, // CAMILLE - 16.07.2002
    sDataInicioAnt,        sValorAnt,          sNomeBenefAnt,
    sIdTpPagtoAnt,         sUltMesReajAnt,     sFlgBenefMinAnt,
    sDataEventoAnt,        sCodBeneficioAnt,
    sValorBase1Ant, sValorBase2Ant,  sValorBase3Ant,
    sValorBase1, sValorBase2, sValorBase3,
    sNumProcINSS,          sUltMesReajusteINSS,  
    sDataEvento,           sValorTotal,        sValorSRB          : string;
    dValorTotalReajustado,
    dValorRateadoReajustado       : double;

    dValorAux        : double;
    bReajustaSRB     : boolean;
    sIdSitPart,    sIdSitPlan,    sIdSitFunc,
    sIdSitPartAntes,
    sIdSitPlanAntes,
    sIdSitFuncAntes,
    sIdSitPartAtual,
    sIdSitPlanAtual,
    sIdSitFuncAtual  : string;
    bPossuiReajusteINSS : boolean; // Variavel para controlar, quando for suplementacao,
                                   // se o INSS correspondente foi reajustado

    // GLEYBER - 21/08/2002
    sVlrInfInss,
    sVlrCalcInss : String;
    sFlgBenefMinimo : STRING;
    sVlrInfINSSDIB  : string; // CAMILLE - 20.06.2003
    sVlrCalcINSSDIB : string; // CAMILLE - 20.06.2003
    sDIBSupl        : string; // CAMILLE - 24.06.2003
    sDataInicioAntINSS,
    sValorAntINSS,
    sNomeBenefAntINSS,
    sIdTpPagtoAntINSS,
    sUltMesReajAntINSS,
    sFlgBenefMinAntINSS,
    sTPMODALIDADE,
    sDataEventoAntINSS,
    sCodBeneficioAntINSS,
    sValorBase1AntINSS, sDataRefSRB,
    sValorBase2AntINSS,
    sValorBase3AntINSS,
    sNumProcAntINSS          : string; // CAMILLE - 24.06.2003
    iIdCalculo, iNumeroProcessoINSS : LongInt;


    sSQLBenefAssoc, sDataInicioFund , sAnoMesRefAux: String;


    bReajustaSuplementacao,
    bReajustaInssNConcedido : Boolean;

    sValorBase1Inss, sValorBase2Inss, sValorBase3Inss : String;

    sDataInicioFundAux : String;  //leofuncef - 06042004
    iFlgProvisorio     : integer; // CAMILLE - 19.04.2004
    iFlgResgate, iPrazoProvisorio   : integer; // CAMILLE - 19.04.2004
    dPercProvisorio    : double;  // CAMILLE - 19.04.2004
begin
   Result  := ClienteNumero(FloatToStr(pdValorEmReal));
   bErro   := False;
   sMsgErro := ' ';
   bReajustou := False;


   bReajustaInssNConcedido := false;

   sValorBase1 := OraNumero(FloatToStr(pdValorBase1));
   sValorBase2 := OraNumero(FloatToStr(pdValorBase2));
   sValorBase3 := OraNumero(FloatToStr(pdValorBase3));


   BuscaDadosBeneficioAnterior ( qryAux,
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
                                 //sValorBase1, sValorBase2,sValorBase3,
                                 sValorBase1Ant, sValorBase2Ant, sValorBase3Ant, //leocm - 31102002 - estava zerando os valoresbase
                                 sNumProcINSS,
                                 True);

   // CAMILLE - 14.08.2002
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT BP.FLGREFERENCIA, B.FLGPECULIO, B.FLGRESGATE   '+
                  ' FROM   BENEFPLANPREV BP, BENEFICIO B '+
                  ' WHERE  BP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                  ' AND    BP.IDBENEFICIO = '+IntToStr(piIdBeneficio)+
                  ' AND    BP.IDBENEFICIO = B.IDBENEFICIO ');
   qryAux.Open;
   if (qryAux.IsEmpty) or (qryAux.FieldByName('FLGPECULIO').AsInteger = 1) { Augusto 15/10/2003 }
   then Exit
   else if qryAux.FieldByName('FLGREFERENCIA').AsInteger = 1
        then pbBenefReferencia := True
        else pbBenefReferencia := False;

   iFlgResgate := qryAux.FieldByName('FLGRESGATE').AsInteger; { Augusto 27/04/2004 }

   //leofuncef - 28102003 - inicio
   //caso a dib seja anterior a dib, e entre as duas tenha
   //um reajuste, este deve ser processado. O loop de pagamento/reajuste é todo
   //feito em cima da dip(DATAINICIO), mas a dib(DATAINICIOFUND) é que deve ser levada em conta
   //para o reajuste do inss, então caso seja reajuste do inss, a rotina deve buscar se, entre a dib
   //e a dip, há algum reajuste do inss, e processá-lo.
   sAnoMesRefAux   := psAnoMesRef;

   sDataInicioFund := psDataInicio;

   if (pbBenefReferencia) then
   begin

      {pega a datainiciofund}
      qryAux.Close;
      qryAux.SQl.Clear;
      qryAux.SQL.Add(' SELECT BF.DATAINICIOFUND, BF.ULTMESREAJUSTE, P.DTEVENTO '+
                     ' FROM   BENEFBFCIARIO BF, PROCESSOBENEF P, BENEFPLANPREV BP '+
                     ' WHERE  BF.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                     ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                     ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)+
                     ' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)+
                     ' AND    BF.IDBENEFICIO    = '+IntToStr(piIdBeneficio)+ { Augusto 30/03/2004 }
                     ' AND    BF.IDSITBENEFICIO IN (1,2,4,6,7)  '+  // Camille - Pendência 15724
                     ' AND    BP.IDPLANOPREV    = BF.IDPLANOPREV '+
                     ' AND    BP.IDBENEFICIO    = BF.IDBENEFICIO '+
                     ' AND    BP.FLGREFERENCIA  = 1              '+
                     ' AND    P.NUMEROPROCESSO  = BF.NUMEROPROCESSO          ');
      qryAux.Open;
      { Augusto 04/11/2003 - no caso de desdobramento Beneficios ainda não esta na base }
      If Not qryaux.IsEmpty Then
        sDataInicioFund :=  qryaux.fieldbyname('DATAINICIOFUND').AsString;
      sDataEvento     :=  qryaux.fieldbyname('DTEVENTO').AsString;
      try //alguma data em branco

         if (strtodate(sDataInicioFund) <  strtodate(psDataInicio)) then  //se dib menor que dip
         begin
            //verifica último mês em que o benefício foi reajustado
            if (pbRetroativo or pbMigracaoPlano) and (psUltMesReajuste <> '')
            then sUltMesReajuste :=  psUltMesReajuste
            else sUltMesReajuste :=  qryaux.fieldbyname('ULTMESREAJUSTE').AsString;

            //caso o último mês de reajuste seja maior que a dib, então
            //pegar a data de último reajuste
            if (trim(sUltMesReajuste) <> '') and
               (trim(sDataInicioFund) <> '') then
            begin
               if strtodate('01/'+copy(sUltMesReajuste,6,2)+'/'+copy(sUltMesReajuste,1,4)) >
                  strtodate(sDataInicioFund) then
                  sDataInicioFund :=  '01/'+copy(sUltMesReajuste,6,2)+'/'+copy(sUltMesReajuste,1,4);
            end;

            qryAux.Close;
            qryAux.SQl.Clear;
            qryAux.SQL.Add(' SELECT MIN(MESREAJ) MESREAJ     '+
                           ' FROM   REAJINSS      '+
                           ' WHERE  MESREAJ    <= '''+psAnoMesRef+'''  '+
                           ' AND   MESREAJ     > TO_CHAR(TO_DATE('''+sDataInicioFund+''',''DD/MM/YYYY''),''YYYY/MM'')  '+
                           ' AND IDRGREAJ IS NOT NULL  ' );
            qryAux.Open;
            { Augusto 16/06/2004 }
            if (not qryaux.isempty) and (qryaux.fieldbyname('MESREAJ').AsString <> '') then
              sAnoMesRefAux :=  qryaux.fieldbyname('MESREAJ').AsString;


         end;//if dib anterior a dip

      except end;
   end;


   while sAnoMesRefAux <= psAnoMesRef do
   begin
   //leofuncef - 28102003 - fim


      { Inicio Augusto 07/11/2003 }

      { Verifica se existe reajuste da patrocinadora, existindo recalcula o }
      { enquadramento. FUNCEF                                               }
      sSQL := 'SELECT IDRGREAJ, PERCENTUAL FROM  REAJSALPATRO '+
              ' WHERE  MESREAJ     = '+QuotedStr(psAnoMesRef)  +' AND '+
              '        IDPESSJUR   = '+IntToStr(piIdPessJur)   +' AND '+
              '        IDPLANOPREV = '+IntToStr(piIdPlanoPrev) +'     ';
      If (( (pbBenefReferencia = False) And FazQuery(QryAux,sSQL))
         Or (pbCalculaTudo = True))
         and (not pbMigracaoPlano) //leofuncef - 06042004
      Then Begin
        bReajustaSRB := True;
        bPossuiReajusteINSS := True;
        try
          { Por mais incrivel que parece; mais uma vez buscar os dados do beneficios }
          frmAguarde.Mostra('Executando reajuste de patrocinadora  ...');
          { No caso de desdobramento os dados do beneficio ainda não estao no Banco }
          { buscar os dados sem incluir o beneficio.  Augusto FUNCEF 25/11/2003     }
          If prmCalculaSRBNoRetroativo Then Begin
              If piOrigem = 5 Then Begin
                 sSQL := ' SELECT BP.IDREGRASRB,    '+
                         '        EL.IDSITFUNC,     '+
                         '        PP.IDSITPART, PP.IDSITPLANOPREV, '+
                         '        B.NUMORDEMEVENTO '+
                         ' FROM   ELEGPATRO EL, PARTPREVPLAN PP,    '+
                         '        BENEFPLANPREV BP, BENEFICIO B     '+
                         ' WHERE  EL.IDPESSJUR          = '+IntToStr(piIdPessJur)              +
                         ' AND    EL.IDPESSOA           = '+IntToStr(piIdTitular)              +
                         ' AND    PP.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)            +
                         ' AND    PP.SEQPROPOSTA        = 1                                   '+
                         ' AND    PP.FLGDESATIVADO      = 0                                   '+
                         ' AND    BP.IDBENEFICIO        = '+IntToStr(piIdBeneficio)            +
                         ' AND    EL.IDPESSJUR          = PP.IDPESSJUR                        '+
                         ' AND    EL.IDPESSOA           = PP.IDPESSOA                         '+
                         ' AND    BP.IDPLANOPREV        = PP.IDPLANOPREV                      '+
                         ' AND    BP.IDBENEFICIO        = B.IDBENEFICIO                       ';
              End Else Begin
                 sSQL := ' SELECT BF.ULTMESREAJUSTE, BF.VALORSRB, BF.DATAINICIOFUND,          '+
                         '        BF.VLRINFINSS,     BF.VLRCALCINSS, BF.VALORNADIB,           '+
                         '        BP.IDREGRASRB,    '+
                         '        EL.IDSITFUNC,  '+
                         '        PP.IDSITPART, PP.IDSITPLANOPREV, '+
                         '        B.NUMORDEMEVENTO '+
                         ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP, BENEFICIO B,            '+
                         '        ELEGPATRO EL, PARTPREVPLAN PP '+
                         ' WHERE  BF.IDPESSJUR          = '+IntToStr(piIdPessJur)              +
                         ' AND    BF.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)            +
                         ' AND    BF.IDTITULAR          = '+IntToStr(piIdTitular)              +
                         ' AND    BF.SEQPROPOSTA        = 1                                   '+
                         ' AND    BF.IDPESSOA           = '+IntToStr(piIdPessoa)               +
                         ' AND    BF.IDBENEFICIO        = '+IntToStr(piIdBeneficio)            +
                         ' AND    BF.IDSITBENEFICIO IN (1,2,3,4,7)  '+ // Camille - Pendência 15724
                                                               // CAMILLE - FCRT - 26.01.2004
                                                               // Acrescentei o 3
                                                               // Quando a data final é efetiva a situacao é = 3
                         
                         ' AND    BP.IDPLANOPREV        = BF.IDPLANOPREV                      '+
                         ' AND    BP.IDBENEFICIO        = BF.IDBENEFICIO                      '+

                         ' AND    BF.IDTITULAR          = EL.IDPESSOA                         '+
                         ' AND    BF.IDPESSJUR          = EL.IDPESSJUR                        '+

                         ' AND    BF.IDTITULAR          = PP.IDPESSOA                         '+
                         ' AND    BF.IDPESSJUR          = PP.IDPESSJUR                        '+
                         ' AND    BF.IDPLANOPREV        = PP.IDPLANOPREV                      '+
                         ' AND    PP.FLGDESATIVADO      = 0                                   '+
                         ' AND    BF.IDBENEFICIO        = B.IDBENEFICIO                       ';
              End;
              FazQuery(QryAux,sSQL);

              { Augusto 12/01/2003 - Somente para planos que tenha SRB }
              If QryAux.FieldByName('IDREGRASRB').AsInteger > 0 Then Begin
                sSQLBenefAssoc := MontaSQLBenefAssoc(qryAux, QryAux.FieldByName('NUMORDEMEVENTO').AsInteger);
                // Augusto 14/11/2003
                sDataRefSRB := '01/'+Copy(sAnoMesRefAux,6,2)+'/'+Copy(sAnoMesRefAux,1,4);
                dValorSRB      := 0;
                dValorSRB := ExecutaRegraCalculoSRB(qryAux,
                                                    QryAux.FieldByName('IDREGRASRB').AsInteger,
                                                    piIdPessJur,
                                                    piIdPlanoPrev,
                                                    piIdTitular,
                                                    1,
                                                    piIdBeneficio,
                                                    piNumeroProcesso,
                                                    QryAux.FieldByName('IDSITFUNC').AsInteger,
                                                    QryAux.FieldByName('IDSITPART').AsInteger,
                                                    QryAux.FieldByName('IDSITPLANOPREV').AsInteger,
                                                     //iIdSitFunc, iIdSitPart, iIdSitPlanoPrev,
                                                    pdValorBase1,
                                                    pdValorBase2,
                                                    pdValorBase3,
                                                    sSQLBenefAssoc,
                                                    sDataRefSRB, //sDataEvento,
                                                    sDataInicioFund,
                                                    sDataInicioFund,
                                                    psDataInicio,
                                                    sDataInicioFund, //dtDataRequerimento.Text,
                                                    '', //sValorInfINSS,
                                                    '', //reValorCalcINSS.Text,
                                                    '0',
                                                    False,
                                                    0,
                                                    sDataInicioAnt,
                                                    sValorAnt,
                                                    sValorBase1Ant, sValorBase2Ant, sValorBase3Ant,
                                                    bErro,
                                                    sMsgErro,
                                                    iIdCalculo,
                                                    0);
              End Else Begin
                bReajustaSRB := False;
                bPossuiReajusteINSS := False;
              End;
          End Else Begin
             DVALORSRB := DVALORSRB;
          End;
        except
           frmAguarde.Apaga;
        end;
        frmAguarde.Apaga;
      End;
      { Fim Augusto 07/11/2003 }



      qryAux.Close;
      qryAux.SQL.Clear;
      { Augusto 26/11/2003 - alterado para casos de resjuste de suplementação           }
      { sem existir INSS. Lembrar que para reajustar a Suplementação não precisa        }
      { recalcular o valor, basta utilizar o valor passado pelo parametro pdValorEmReal }
      bReajustaSuplementacao := False;
      if pbBenefReferencia then
        qryAux.SQL.Add(' SELECT IDRGREAJ      '+
                       ' FROM   REAJINSS      '+
                       ' WHERE  MESREAJ     = '''+sAnoMesRefAux+'''')
      else Begin
        qryAux.SQL.Add(' SELECT IDRGREAJ, FLGREAJSRB      '+ // CAMILLE - 14.08.2002
                          ' FROM   REAJBENEFICIO '+
                          ' WHERE  MESREAJ     = '''+sAnoMesRefAux+''''+
                          ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                          ' AND    IDBENEFICIO = '+IntToSTr(piIdBeneficio));
        // bReajustaSuplementacao := True; { Augusto 05/01/2004 }
      end;
      {-}

      qryAux.Open;
      bPossuiReajusteINSS := False;
      sDIBSupl := psDataInicio; // Gleyber - 24/05/2004 - Pendência 16834

      // Se nao encontrar é porque nao houve reajuste no mes em questao
      if qryAux.IsEmpty
      then begin
         if pbBenefReferencia then
         begin
            if bReajustou then //caso já tenha reajustado em um mês entre a dib e a dip
            begin
               bReajustou := True;
               bErro      := False;
               sMsgErro   := ' ';
               Result     := OraNumero(FloatToStr(dValorTotalReajustado));

               { Inicio Augusto 14/11/2003 }
               { incrememtar sAnoMesRefAux }
               sAnoMesRefAux := ProximoAnoMes(strtoint(copy(sAnoMesRefAux,6,2)), strtoint(copy(sAnoMesRefAux,1,4)));
               sDataInicioAnt := sDataInicioFund;
               Continue;
               { Fim Augusto 14/11/2003 }

            end;

            Exit;
         end;

         If iFlgResgate = 1 Then Exit; { Augusto 27/04/2004 - Sendo beneficio de resgate, sair }

         // Se for um beneficio de suplementacao, verificar se a pessoa tem beneficio do INSS // CAMILLE - 20.06.2003
         // Se sim, Entao verificar se o INSS foi reajustado
         // Se sim, entao o beneficio deve ser recalculado para considerar este novo valor
         qryAux.Close;
         qryAux.SQl.Clear;
         qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, DECODE(BF.VALORBASE1,NULL,BA.VALORBASE1, BF.VALORBASE1) VALORBASE1, '+
                        ' DECODE(BF.VALORBASE2,NULL,BA.VALORBASE2, BF.VALORBASE2) VALORBASE2, '+
                        ' DECODE(BF.VALORBASE3,NULL,BA.VALORBASE3, BF.VALORBASE3) VALORBASE3 '+
                        ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP, BENEFPLANOPART BA '+
                        ' WHERE  BF.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                        ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                        ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)+
                        ' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)+

                        ' AND    BA.IDPESSJUR(+)      = BF.IDPESSJUR '+
                        ' AND    BA.IDPLANOPREV(+)    = BF.IDPLANOPREV '+
                        ' AND    BA.IDPESSOA(+)       = BF.IDTITULAR '+
                        ' AND    BA.IDBENEFICIO(+)    = BF.IDBENEFICIO '+
                        ' AND    BA.SEQPROPOSTA(+)    = 1 '+

                        // CAMILLE - 24.06.2004
                        // Se fizermos uma renova com data final EFETIVA anterior
                        // ao mes atual, o beneficio do inss estará ENCERRADO (3)
                        // e deve ser considerado nessa query. Logo, irei alterar
                        // para considerar este caso.
                        { Augusto 15/10/2003 //' AND    BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+ }
                        // ' AND     BF.IDSITBENEFICIO IN (1,2,4,6,7)  '+ // Camille - Pendência 15724
                        ' AND    (                                       '+
                        '          ( BF.IDSITBENEFICIO IN (1,2,4,6,7) )  '+
                        '          OR                                    '+
                        '          ( (BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+') AND (BF.IDSITBENEFICIO = 3) AND (BP.FLGPAGAINSS = 0) ) '+
                        '        )                                       '+
                        {---}
                        ' AND    BP.IDPLANOPREV    = BF.IDPLANOPREV '+
                        ' AND    BP.IDBENEFICIO    = BF.IDBENEFICIO '+
                        ' AND    BP.FLGREFERENCIA  = 1              ' );
         qryAux.Open;

         // Gleyber - 24/05/2004 - Pendência 16834 - Início
         // Criado parametro para verificar se o inss deve ser reajustado mesmo que
         // não exista ainda na tabela benefbfciario, ou seja, não tenha sido requerido
         { Inicio Augusto 29/12/2003 }
         // if qryAux.IsEmpty then Exit;
         if qryAux.IsEmpty
         then begin
            qryAux.Close;
            qryAux.SQl.Clear;
            qryAux.SQL.Add(' SELECT FLGREAJINSSNREQ FROM PLANPREV '+
                           ' WHERE  IDPLANOPREV    = '+IntToStr(piIdPlanoPrev));
            qryAux.Open;
            if qryAux.FieldByName('FLGREAJINSSNREQ').AsInteger = 0
            then Exit;
         end;
         // Gleyber - 24/05/2004 - Pendência 16834 - Fim

         sValorBase1Inss := qryaux.fieldbyname('VALORBASE1').AsString;
         sValorBase2Inss := qryaux.fieldbyname('VALORBASE2').AsString;
         sValorBase3Inss := qryaux.fieldbyname('VALORBASE3').AsString;


         { Augusto 15/10/2003 - Guarda numero processo INSS }
         iNumeroProcessoINSS := QryAux.FieldByName('NUMEROPROCESSO').AsInteger;

         qryAux.Close;
         qryAux.SQl.Clear;
         qryAux.SQL.Add(' SELECT IDRGREAJ      '+
                        ' FROM   REAJINSS      '+
                        ' WHERE  MESREAJ     = '''+sAnoMesRefAux+'''');
         qryAux.Open;
         if (not qryAux.IsEmpty) then begin
            bPossuiReajusteINSS := True;
            sIdRegraReajuste := qryAux.FieldByName('IdRgReaj').AsString; //leofuncef - 30102003
         end else If (bReajustaSRB = False) and (pbCalculaTudo = False) Then
           Exit;
      end
      else begin
         // Se encontar mas a regra estiver em branco, considerar que nao houve reajuste
         if qryAux.FieldByName('IdRgReaj').AsString = ''  then Exit;
         sIdRegraReajuste := qryAux.FieldByName('IdRgReaj').AsString;
         if pbBenefReferencia  then Begin
           bReajustaSRB := False;
         end else if  qryAux.FieldByName('FLGREAJSRB').AsInteger = 1 then Begin
           bReajustaSRB := True
         end else begin
           bReajustaSRB := False;
         end;
         bReajustaSuplementacao := True; { Augusto 05/01/2004 - Apenas se existir reajuste }
         // CAMILLE - 24.06.2003
         // Se for beneficio de referencia, buscar DIB da suplementacao para passar
         // na query da regra
         if pbBenefReferencia
         then begin
            qryAux.Close;
            qryAux.SQl.Clear;
            qryAux.SQL.Add(' SELECT BF.DATAINICIOFUND           '+
                           ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP, BENEFICIO B '+
                           ' WHERE  BF.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                           ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                           ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)+
                           ' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)+
                           ' AND    BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                           ' AND    BP.IDPLANOPREV    = BF.IDPLANOPREV '+
                           ' AND    BP.IDBENEFICIO    = BF.IDBENEFICIO '+
                           ' AND    BP.FLGREFERENCIA  = 0              '+
                           ' AND    B.IDBENEFICIO     = BP.IDBENEFICIO ');
            qryAux.Open;
            if qryAux.IsEmpty
            then sDIBSupl := '          '
            else sDIBSupl := qryAux.FieldbyName('DATAINICIOFUND').AsString;
         end;
      end;

      // Verificar se o benefício tem no histórico para o mescalculo. Se tiver, entao o
      // beneficio já foi reajustado. Sair, para nao reajustar novamente.
      // Se for benefício provisório, é necessário fazer o recálculo
      // CAMILLE - 20.01.2003
      // Só exigir que não tenha linha na hst se não for um retroativo
      //também não pode na migração
      if (not pbRetroativo) and (not pbMigracaoPlano)
      then begin
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT IDBENEFICIO FROM HSTBENEFBFCIARIO '+
                    ' WHERE (IDPESSOA       = '+IntToStr(piIdPessoa)      +' ) '+
                    ' AND   (MESREFERENCIA  = '''+sAnoMesRefAux+'''          ) '+
                    ' AND   (IDBENEFICIO    = '+IntToStr(piIdBeneficio)+'    ) '+
                    ' AND   (NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+' ) '+
                    ' AND   (FLGDEVOLUCAO   = 0                              ) '+
                    ' AND   ((PERCPROVISORIO IS NULL) OR (PERCPROVISORIO = 0)) ' );
            Open;
            if (not IsEmpty) and (Not QryAux.FieldByName('IDBENEFICIO').IsNull) then Exit;
         end;
      end;

      // CAMILLE - 08.05.2002
      // Buscar VALORES DO SRB E INSS DO HISTORICO para passar para a regra
      with qryAux do
      begin
         Close;
         SQL.Clear;
         // CAMILLE - 27.01.2003
         // Não buscar valor do inss por esta query mas sim chamar a funcao CalcBeneficioINSSATual
         SQL.Add(' SELECT BF.ULTMESREAJUSTE, BF.VALORSRB, BF.DATAINICIOFUND,          '+
                 '        BF.VLRINFINSS,     BF.VLRCALCINSS, BF.VALORNADIB,           '+
                 '        BP.TPMODALIDADE,                                            '+ { Augusto 12/01/2004 }
                 '        BF.FLGPROVISORIO, BF.PRAZOPROVISORIO, BF.PERCPROVISORIO     '+ // CAMILLE - 19.04.2004
                 ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP                          '+
                 ' WHERE  BF.IDPESSJUR          = '+IntToStr(piIdPessJur)              +
                 ' AND    BF.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)            +
                 ' AND    BF.IDTITULAR          = '+IntToStr(piIdTitular)              +
                 ' AND    BF.SEQPROPOSTA        = 1                                   '+
                 ' AND    BF.NUMEROPROCESSO     = '+IntToStr(piNumeroProcesso)        ); // CAMILLE - 28.01.2004


         { Augusto 02/12/2003 - No Caso de desdobramento não pode buscar informações do }
         { beneficiario concedido no banco de dados, pois ele ainda não foi incluido.   }
         If piOrigem <> 5 Then { <> de Desdobramento }
           SQL.Add(' AND    BF.IDPESSOA           = '+IntToStr(piIdPessoa));

         SQL.Add(' AND    BF.IDBENEFICIO        = '+IntToStr(piIdBeneficio)            +
                 { Augusto 15/10/2003 }
                 //' AND    BF.NUMEROPROCESSO     = '+IntToStr(piNumeroProcesso)         +
                 ' AND    BF.IDSITBENEFICIO IN (1,2,3,4,7)  '+ // CAMILLE - PENDÊNCIA 15724
                                                               // CAMILLE - FCRT - 26.01.2004
                                                               // Acrescentei o 3
                                                               // Quando a data final é efetiva a situacao é = 3
                 ' AND    BP.IDPLANOPREV        = BF.IDPLANOPREV                      '+
                 ' AND    BP.IDBENEFICIO        = BF.IDBENEFICIO                      ');
         Open;
         if IsEmpty then begin
            sValorSRB       := FloatToStr(dValorSRB);
            sUltMesReajuste := '0000/00';
            // GLEYBER - 21/08/2002
            sVlrInfInss     := '0';
            sVlrCalcInss    := '0';
            sVlrInfINSSDIB  := '0';  // CAMILLE - 20.06.2003
            sVlrCalcINSSDIB := '0';  // CAMILLE - 20.06.2003
            //
            iFlgProvisorio     := 0; // CAMILLE - 19.04.2004
            iPrazoProvisorio   := 0; // CAMILLE - 19.04.2004
            dPercProvisorio    := 0; // CAMILLE - 19.04.2004

         end else begin
            sTPMODALIDADE      := qryAux.FieldByName('TPMODALIDADE').AsString; { Augusto 12/01/2004 }
            sValorSRB          := FieldByName('VALORSRB').AsString;

            iFlgProvisorio     := FieldByName('FLGPROVISORIO').AsInteger; // CAMILLE - 19.04.2004
            iPrazoProvisorio   := FieldByName('PRAZOPROVISORIO').AsInteger; // CAMILLE - 19.04.2004
            dPercProvisorio    := FieldByName('PERCPROVISORIO').AsFloat; // CAMILLE - 19.04.2004

            if (pbRetroativo or pbMigracaoPlano) and (psUltMesReajuste <> '')
            then sUltMesReajuste :=  psUltMesReajuste
            else sUltMesReajuste := FieldByName('ULTMESREAJUSTE').AsString;


            { Inicio Augusto 05/11/2003 }
            //If FieldByName('VALORNADIB').AsString = '' Then
            //If (sUltMesReajuste = '0000/00') or (Trim(sUltMesReajuste) = '') Then
              sVlrInfINSSDIB  := FieldByName('VLRINFINSS').AsString;   // CAMILLE - 20.06.2003
            //Else
            //  sVlrInfINSSDIB  := FieldByName('VLRINFINSS').AsString;
            { Fim Augusto 05/11/2003 }


            sVlrCalcINSSDIB := FieldByName('VLRCALCINSS').AsString;  // CAMILLE - 20.06.2003
            // GLEYBER - 21/08/2002
            // CAMILLE - 23.01.2003
            // Buscar INSS INTEGRAL no mes que está sendo processado
            sFlgBenefMinimo := '0';
            sVlrInfINSS := CalcBeneficioINSSAtual( piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdPessoa,
                                                   sAnoMesRefAux,
                                                   sAnoMesRefAux,
                                                   sIDTPPAGTOANT,
                                                   sFlgBenefMinimo,
                                                   qryAux,
                                                   // piNumepauloroProcesso); { Augusto 15/10/2003 }
                                                   iNumeroProcessoINSS);
            { Inicio Augusto 18/12/2003 }
            { Buscar o VALORCALCULADO para o caso de Dupla Atividade (FUNCEF) }
            //sVlrCalcInss    := sVlrInfINSS;
            sVlrCalcInss := CalcBeneficioINSSAtual( piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdPessoa,
                                                   sAnoMesRefAux,
                                                   sAnoMesRefAux,
                                                   sIDTPPAGTOANT,
                                                   sFlgBenefMinimo,
                                                   qryAux,
                                                   iNumeroProcessoINSS,
                                                   'C');
            { Fim Augusto 18/12/2003 }
         end;
         dValorSRB := StrToFloat(ClienteNumero(sValorSRB));
      end;


      if pbBenefReferencia
      then BuscaDadosBeneficioAnterior ( qryAux,
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

   {   MsgDlg('Reajuste Mês  : '+psAnoMesRef+#13+
             '         SRB  : '+ClienteNumero(sValorSRB)+#13+
             '         INSS : '+ClienteNumero(sVlrCalcINSS),'Verificação',mtInformation,[mbOK],0);
   }
      if sAnoMesRefAux              = '' then sAnoMesRefAux      := ' ';
      if psDataInicio             = '' then psDataInicio     := ' ';
      if sIdTpPagtoAnt            = '' then sIdTpPagtoAnt    := ' ';
      if sUltMesReajAnt           = '' then sUltMesReajAnt   := '0000/00';
      if sFlgBenefMinAnt          = '' then sFlgBenefMinAnt  := ' ';
      if Trim(sDataEventoAnt)     = '' then sDataEventoAnt   := ' ';
      if Trim(sCodBeneficioAnt)   = '' then sCodBeneficioAnt := ' ';
      if Trim(sDataInicioAnt)     = '' then sDataInicioAnt   := ' ';
      if Trim(sUltMesReajuste)    = '' then sUltMesReajuste := '0000/00';
      if Trim(sDataInicioAntINSS) = '' then sDataInicioAntINSS   := ' '; { Augusto 23/07/2003 }



      // Se o benefício for para beneficiário, passar como VALORATUAL O VALORTOTAL e
      // depois do reajuste, ratear o valor
      qryAux.Close;
      qryAux.SQL.Clear;
      { Augusto 10/01/2004 - Inclusão da ELEGPATRO e PARTPREVPLAN }
      qryAux.SQL.Add(' SELECT BF.VALORTOTAL , P.DTEVENTO, BF.DIBBENEFANT, '+ { Augusto 25/10/2003 }
                     '        BF.DATAINICIOFUND, '+ { Augusto 05/11/2003 }
                     '        PP.IDSITPLANOPREV, PP.IDSITPART, EL.IDSITFUNC, '+
                     '        BF. VALORBENEFANT'+ { Augusto 23/01/2004 }
                     ' FROM   PROCESSOBENEF P, BENEFBFCIARIO BF, ELEGPATRO EL, '+
                     '        PARTPREVPLAN PP '+
                     ' WHERE  BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                     ' AND    BF.IDPESSJUR      = '+IntToStr(piIdPessJur)     +
                     ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)   +
                     ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)     +
                     ' AND    BF.SEQPROPOSTA    = 1                          '+
                     ' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)      +
                     ' AND    BF.IDBENEFICIO    = '+IntToStr(piIdBeneficio)   +
                     ' AND    P.NUMEROPROCESSO  = BF.NUMEROPROCESSO          '+
                     ' AND    BF.IDTITULAR      = EL.IDPESSOA  '+
                     ' AND    BF.IDPESSJUR      = EL.IDPESSJUR '+
                     ' AND    BF.IDTITULAR      = PP.IDPESSOA  '+
                     ' AND    BF.IDPESSJUR      = PP.IDPESSJUR '+
                     ' AND    BF.IDPLANOPREV    = PP.IDPLANOPREV ');
      qryAux.Open;
      if not qryAux.IsEmpty then begin
         if piIdTitular <> piIdPessoa then begin
           { Inicio Augusto 05/05/2004 }
           if sUltMesReajuste < sAnoMesRefAux then { Augusto 10/07/2003 }
             pdValorEmReal  := qryAux.FieldByName('VALORTOTAL').AsFloat;
             if (pbRetroativo = True) Then pdValorEmReal := dValorTotal;
           { Inicio Augusto 05/05/2004 }
         end;

         sDataEvento     := qryAux.FieldByName('DTEVENTO').AsString;
         sDataInicioFund := qryAux.FieldByName('DATAINICIOFUND').AsString;

         If Trim(sDataInicioAnt) = '' Then Begin
           sDataInicioAnt := qryAux.FieldByName('DIBBENEFANT').AsString;
           if Trim(sDataInicioAnt)     = '' then sDataInicioAnt   := ' ';
         End;

         { Augusto 23/01/2004 }
         If ( (Trim(sValorAnt) = '') or (Trim(sValorAnt) = '0') ) Then Begin
           sValorAnt := qryAux.FieldByName('VALORBENEFANT').AsString;
           if Trim(sValorAnt)  = '' then sValorAnt   := '0';
         End;

         if Trim(sDataEvento) = '' then sDataEvento := psDataInicio;
         { Augusto 10/01/2004 }
         sIdSitPart := qryAux.FieldByName('IDSITPART').AsString;
         sIdSitPlan := qryAux.FieldByName('IDSITPLANOPREV').AsString;
         sIdSitFunc := qryAux.FieldByName('IDSITFUNC').AsString;

      end Else Begin
        { Augusto 01/12/2003 }
        if Trim(sDataEvento) = '' then sDataEvento := sDataInicioFund;

        { Augusto 10/01/2004 }
        sIdSitPart := ' ';
        sIdSitPlan := ' ';
        sIdSitFunc := ' ';
      end;
      { Augusto 30/03/2004 }
      sUltMesReajusteINSS := sUltMesReajuste;

      //leofuncef - 30102003 - inicio
      //na FUNCEF existe o caso de a suplementação ser conmcedida
      //antes do INSS.
      //Como na Funcef não existe benef. de referência, pois o INSS é pago pela própria,
      //não existe histórico.
      //O inss pode ser requerido meses depois, ou até não ser, por isso
      //caso não ache o valor do inss para o mês corrente, pegar o valor de concessão
      //e atualizar, se for o caso, para passar para a regra de suplementação.
      if (not pbBenefReferencia) And (Not bReajustaSuplementacao) then
      begin                          { Augusto 26/11/2003 ------}
         qryAux.Close;
         qryAux.SQl.Clear;
         qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.ULTMESREAJUSTE '+ // CAMILLE - 25.06.2004
                        ' FROM   HSTBENEFBFCIARIO H, BENEFBFCIARIO BF, BENEFPLANPREV BP '+
                        ' WHERE  H.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                        ' AND    H.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                        ' AND    H.IDTITULAR      = '+IntToStr(piIdTitular)+
                        ' AND    H.IDPESSOA       = '+IntToStr(piIdPessoa)+
                        ' AND    H.MESREFERENCIA =  '''+sAnoMesRefAux+''' '+
                        ' AND    BF.IDPESSJUR      =  H.IDPESSJUR '+
                        ' AND    BF.IDPLANOPREV    =  H.IDPLANOPREV '+
                        ' AND    BF.IDTITULAR      =  H.IDTITULAR '+
                        ' AND    BF.IDPESSOA       =  H.IDPESSOA '+
                        // CAMILLE - 24.06.2004
                        // Se fizermos uma renova com data final EFETIVA anterior
                        // ao mes atual, o beneficio do inss estará ENCERRADO (3)
                        // e deve ser considerado nessa query. Logo, irei alterar
                        // para considerar este caso.
                        { Augusto 15/10/2003 //' AND    BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+ }
                        // ' AND     BF.IDSITBENEFICIO IN (1,2,4,6,7)  '+ // Camille - Pendência 15724
                        ' AND    (                                       '+
                        '          ( BF.IDSITBENEFICIO IN (1,2,4,6,7) )  '+
                        '          OR                                    '+
                        '          ( (BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+') AND (BF.IDSITBENEFICIO = 3) AND (BP.FLGPAGAINSS = 0) ) '+
                        '        )                                       '+
                        ' AND    BP.IDPLANOPREV    = BF.IDPLANOPREV '+
                        ' AND    BP.IDBENEFICIO    = BF.IDBENEFICIO '+
                        ' AND    BP.FLGREFERENCIA  = 1        ' );
         qryAux.Open;

         if qryAux.IsEmpty then
         begin
            bReajustaInssNConcedido := true;
            pdValorEmReal := strtofloat(clientenumero(sVlrInfINSSDIB));
            If sUltMesReajuste <> '0000/00' Then sUltMesReajusteINSS := '0000/00';
         end;
      end;
      //leofuncef - 30102003 - fim


      //leofuncef - 06042004
      //para casos de migrações de plano, o reajuste deve ser feito em vista da NOVA DIB infromada
      //na tela e não pela DIB inserida no benefício
      if pbMigracaoPlano then sDataInicioFundAux  := psDataInicio
      else sDataInicioFundAux := sDataInicioFund;


      // CAMILLE - 14.08.2002
      // Se é suplementacao e não possui reajuste do INSS, rodar reajuste da suplementacao
      // Senao, rodar regra de CALCULO da suplementacao ( e nao de reajuste )

      if pbMigracaoPlano and bPossuiReajusteINSS then //leofuncef - 06042004
      begin
          bReajustaSuplementacao := False;
          bReajustaSRB := true;
      end;

      { Augusto 03/02/2004 - Dava Erro quando Tinha Reajuste SRB mas não tinha da Suplementação }
      //if ( (bReajustaSRB = True) Or (bReajustaSuplementacao = True) ) And
      if ( (bReajustaSRB = False) Or (bReajustaSuplementacao = True) ) And
         ((not bPossuiReajusteINSS) or (bReajustaInssNConcedido)) // Gleyber - 23/01/2004 - Pendencia 15981
         And (sIdRegraReajuste <> '') { Augusto 01/03/2004 }
      then begin
         if piIdTitular = piIdPessoa
         then begin
            sSQL := ' SELECT '+IntToStr(piIdBeneficio)+'     AS IDBENEFICIO,        '+// CAMILLE - 23.08.2002
                               IntToStr(piIdPessJur)  +'     AS IDPESSJUR,          '+// CAMILLE - 23.08.2002
                               IntToStr(piIdPlanoPrev)+'     AS IDPLANOPREV,        '+// CAMILLE - 23.08.2002
                               IntToStr(piIdTitular)  +'     AS IDTITULAR,          '+// CAMILLE - 23.08.2002
                               IntToStr(piIdPessoa)   +'     AS IDPESSOA,           '+// CAMILLE - 23.08.2002
                               IntToStr(piNumeroProcesso)+'  AS NUMEROPROCESSO,     '+// CAMILLE - 23.08.2002
                               IntToStr(piOrigem)     +   '  AS ORIGEM,             '+// CAMILLE - 24.06.2003
                    '1                                       AS FLGCONCESSAO,       '+
                    '1                                       AS SEQPROPOSTA,        '+ // LEOCM - 25062002 - ADICIONEI SEQPROPOSTA
                    OraNumero(sValorSRB)              +'     AS VALORSRB,           '+ // CAMILLE - 08.05.2002
                    ''''+sDIBSupl                     +'''   AS DIBSUPL,            '+ // CAMILLE - 24.06.2003
                    ''''+sDataInicioAntINSS           +'''   AS DATAINICIOINSSANT,  '+ // CAMILLE - 24.06.2003
                    ''''+sAnoMesRefAux                +'''   AS MESREAJ,            '+
                    ''''+sAnoMesRefAux                +'''   AS MESREFERENCIA,      '+
                    OraNumero(IntToStr(iFlgProvisorio))+'    AS FLGPROVISORIO,      '+ // CAMILLE - 19.04.2004
                    OraNumero(IntToStr(iPrazoProvisorio))+'  AS PRAZOPROVISORIO,    '+ // CAMILLE - 19.04.2004
                    OraNumero(FloatToStr(dPercProvisorio))+' AS PERCPROVISORIO,     '+ // CAMILLE - 19.04.2004
                    { Augusto 10/01/2004 }
                    QuotedStr(sIdSitFunc)      +  ' AS IDSITFUNCATUAL,         '+
                    QuotedStr(sIdSitPart)     +  ' AS IDSITPARTATUAL,         '+
                    QuotedStr(sIdSitPlan)     +  ' AS IDSITPLANOATUAL ,       '+

                    //leofuncef - 30102003 - inicio
                    //a data de início que deve ser considerada para o resjute é a dib e não a dip
                    ''''+psDataInicio            +'''     AS DATAINICIO,     '+
                    ''''+sDataInicioFundAux         +'''     AS DATAINICIOFUND,   '+
                    //leofuncef - 30102003 - fim

                    ''''+sIdTpPagtoAnt           +'''     AS IDTPPAGTOANT,   '+ // CAMILLE - REFER - 23.03.2001
                    ''''+sUltMesReajAnt          +'''     AS ULTMESREAJANT,  '+ // CAMILLE - REFER - 23.03.2001
                    ''''+sFlgBenefMinAnt         +'''     AS FLGBENEFMINANT, '+ // CAMILLE - REFER - 23.03.2001
                    '''' +sDataEventoAnt         +'''     AS DATAEVENTOANT,  '+ // CAMILLE - REFER - 23.03.2001
                    '''' +sCodBeneficioAnt       +'''     AS IDBENEFICIOANT, '+ // CAMILLE - REFER - 23.03.2001
                    '''' +sDataInicioAnt         +'''     AS DATAINICIOANT,  '+ // CAMILLE - REFER - 23.03.2001
                    OraNumero(sValorAnt)         +'       AS VLBENEFPGTO,    '+ // CAMILLE - REFER - 23.03.2001
                    OraNumero(sValorAnt)         +'       AS VALORBENEFANT,  '; // CAMILLE - REFER - 23.03.2001

                    if bReajustaInssNConcedido then
                    begin
                       sSQL := sSQL +oranumero(sValorBase1Inss)+' AS VALORBASE1,     '+
                       oranumero(sValorBase2Inss)+' AS VALORBASE2,     '+
                       oranumero(sValorBase3Inss)+' AS VALORBASE3,     ';
                    end
                    else
                    begin
                       sSQL := sSQL +OraNumero(FloatToStr(pdValorBase1))+' AS VALORBASE1,     '+
                       OraNumero(FloatToStr(pdValorBase2))+' AS VALORBASE2,     '+
                       OraNumero(FloatToStr(pdValorBase3))+' AS VALORBASE3,     ';
                    end;

                    sSQL := sSQL+''''+'01/'+copy(sAnoMesRefAux,6,2)+'/'+copy(sAnoMesRefAux,1,4)+''' AS DATAREF, '+

                    OraNumero(FloatToStr(pdValorEmReal))+' AS VALORTOTAL, '+
                    OraNumero(FloatToStr(pdValorEmReal))+' AS VALORATUAL, '+

                    { Augusto 30/03/2004 era sUltMesReajuste }
                    ''''+sUltMesReajusteINSS      +''' AS ULTMESREAJUSTE,       '+ // CAMILLE - 16.07.2002
                    ' EL.VALORBASE1 AS VALORBASE1_ELEG, '+
                    ' EL.VALORBASE2 AS VALORBASE2_ELEG, '+
                    ' EL.VALORBASE3 AS VALORBASE3_ELEG, '+
                    //leocm - 13112002 - valorbase4,5,6
                    ' EL.VALORBASE4 AS VALORBASE4_ELEG, '+
                    ' EL.VALORBASE5 AS VALORBASE5_ELEG, '+
                    ' EL.VALORBASE6 AS VALORBASE6_ELEG, '+
                    ' EL.IDPESSJUR, EL.IDPESSOA,  EL.MATRICULA,   '+  // CAMILLE - 27.01.2003
                    OraNumero(sVlrInfINSSDIB) +' AS VLRINFINSSDIB, '+  // CAMILLE - 20.06.2003
                    OraNumero(sVlrCalcINSSDIB)+' AS VLRCALCINSSDIB, '+ // CAMILLE - 20.06.2003
                    // GLEYBER - 21/08/2002
                    OraNumero(sVlrInfInss)         +'       AS VLRINFINSS,    '+ // GLEYBER - FCRT - 21/08/2002
                    OraNumero(sVlrCalcInss)        +'       AS VLRCALCINSS    '+ // GLEYBER - FCRT - 21/08/2002
                    //
                    ' FROM   ELEGPATRO  EL '+
                    ' WHERE  EL.IDPESSJUR = '+IntToStr(piIdPessJur)+
                    ' AND    EL.IDPESSOA  = '+IntToStr(piIdTitular);
         end
         else begin
            sSQL := ' SELECT '+IntToStr(piIdBeneficio)+' AS IDBENEFICIO,      '+
                               IntToStr(piIdPessJur)  +'    AS IDPESSJUR,       '+// CAMILLE - 23.08.2002
                               IntToStr(piIdPlanoPrev)+'    AS IDPLANOPREV,     '+// CAMILLE - 23.08.2002
                               IntToStr(piIdTitular)  +'    AS IDTITULAR,       '+// CAMILLE - 23.08.2002
                               IntToStr(piIdPessoa)   +'    AS IDPESSOA,        '+// CAMILLE - 23.08.2002
                               IntToStr(piNumeroProcesso)+' AS NUMEROPROCESSO,  '+// CAMILLE - 23.08.2002
                               IntToStr(piOrigem)     +   ' AS ORIGEM,          '+// CAMILLE - 24.06.2003
                    '1 AS FLGCONCESSAO,                                       '+
                    '1 AS SEQPROPOSTA,                                        '+ // LEOCM   - 25.06.2002 - ADICIONEI SEQPROPOSTA
                    OraNumero(sValorSRB)         +'   AS VALORSRB,            '+ // CAMILLE - 08.05.2002
                    ''''+sDIBSupl                +'''     AS DIBSUPL,        '+ // CAMILLE - 24.06.2003
                    ''''+sDataInicioAntINSS      +'''     AS DATAINICIOINSSANT, '+ // CAMILLE - 24.06.2003
                    ''''+sAnoMesRefAux             +''' AS MESREAJ,             '+
                    ''''+sAnoMesRefAux             +''' AS MESREFERENCIA,       '+
                    OraNumero(IntToStr(iFlgProvisorio))+'    AS FLGPROVISORIO,      '+ // CAMILLE - 19.04.2004
                    OraNumero(IntToStr(iPrazoProvisorio))+'  AS PRAZOPROVISORIO,    '+ // CAMILLE - 19.04.2004
                    OraNumero(FloatToStr(dPercProvisorio))+' AS PERCPROVISORIO,     '+ // CAMILLE - 19.04.2004

                    { Augusto 10/01/2004 }
                    QuotedStr(sIdSitFunc)     +  ' AS IDSITFUNCATUAL,         '+
                    QuotedStr(sIdSitPart)     +  ' AS IDSITPARTATUAL,         '+
                    QuotedStr(sIdSitPlan)     +  ' AS IDSITPLANOATUAL ,       '+

                    //leofuncef - 30102003 - inicio
                    //a data de início que deve ser considerada para o resjute é a dib e não a dip
                    ''''+psDataInicio            +'''     AS DATAINICIO,     '+
                    ''''+sDataInicioFundAux         +'''     AS DATAINICIOFUND,   '+
                    //leofuncef - 30102003 - fim

                    ''''+sIdTpPagtoAnt           +''' AS IDTPPAGTOANT,        '+ // CAMILLE - REFER - 23.03.2001
                    ''''+sUltMesReajAnt          +''' AS ULTMESREAJANT,       '+ // CAMILLE - REFER - 23.03.2001
                    ''''+sFlgBenefMinAnt         +''' AS FLGBENEFMINANT,      '+ // CAMILLE - REFER - 23.03.2001
                    '''' +sDataEventoAnt         +''' AS DATAEVENTOANT,       '+ // CAMILLE - REFER - 23.03.2001
                    '''' +sCodBeneficioAnt       +''' AS IDBENEFICIOANT,      '+ // CAMILLE - REFER - 23.03.2001
                    '''' +sDataInicioAnt         +''' AS DATAINICIOANT,       '+ // CAMILLE - REFER - 23.03.2001
                    OraNumero(sValorAnt)         +' AS VLBENEFPGTO,           '+ // CAMILLE - REFER - 23.03.2001
                    OraNumero(sValorAnt)         +' AS VALORBENEFANT,         '; // CAMILLE - REFER - 23.03.2001

                    if bReajustaInssNConcedido then
                    begin
                       sSQL := sSQL +oranumero(sValorBase1Inss)+' AS VALORBASE1,     '+
                       oranumero(sValorBase2Inss)+' AS VALORBASE2,     '+
                       oranumero(sValorBase3Inss)+' AS VALORBASE3,     ';
                    end
                    else
                    begin
                       sSQL := sSQL +OraNumero(FloatToStr(pdValorBase1))+' AS VALORBASE1,     '+
                       OraNumero(FloatToStr(pdValorBase2))+' AS VALORBASE2,     '+
                       OraNumero(FloatToStr(pdValorBase3))+' AS VALORBASE3,     ';
                    end;

                    sSQL := sSQL +''''+'01/'+copy(sAnoMesRefAux,6,2)+'/'+copy(sAnoMesRefAux,1,4)+''' AS DATAREF, '+
                    { Augusto 30/03/2004 era sUltMesReajuste }
                    ''''+sUltMesReajusteINSS      +''' AS ULTMESREAJUSTE,       '+ // CAMILLE - 16.07.2002

                    OraNumero(FloatToStr(pdValorEmReal))+' AS VALORTOTAL,     '+
                    OraNumero(FloatToStr(pdValorEmReal))+' AS VALORATUAL,     '+

                    OraNumero(sVlrInfINSSDIB)+' AS VLRINFINSSDIB, '+  // CAMILLE - 20.06.2003
                    OraNumero(sVlrCalcINSSDIB)+' AS VLRCALCINSSDIB, '+ // CAMILLE - 20.06.2003
                    ' DP.VALORBASE1 AS VALORBASE1_ELEG,                       '+
                    ' DP.VALORBASE2 AS VALORBASE2_ELEG,                       '+
                    ' DP.VALORBASE3 AS VALORBASE3_ELEG,                       '+
                    ' DP.DATACADASTRO,                                        '+ // CAMILLE = 30.01.2004
                    ' EL.IDPESSJUR, EL.IDPESSOA, PF.DATAMORTE, EL.MATRICULA   '+ // CAMILLE - 27.01.2003
                    ' FROM   PESSOAFISICA PF, ELEGPATRO  EL, DEPENTIT DP      '+
                    ' WHERE  EL.IDPESSJUR = '+IntToStr(piIdPessJur)            +
                    ' AND    EL.IDPESSOA  = '+IntToStr(piIdTitular)            +
                    ' AND    DP.IDTITULAR = EL.IDPESSOA                       '+
                    ' AND    DP.IDPESSOA  = '+IntToStr(piIdPessoa)             +
                    ' AND    PF.IDPESSOA  = EL.IDPESSOA                       ';
         end;
         // CBS - 05.06.2001
         // Se a regra retornar FALSE, considerar como se nao tivesse reajustado
         with dtmAPrev do
         begin
            regraAPrev.RuleName := sIdRegraReajuste;
            qryRegra.Close;
            qryRegra.SQL.Clear;
            qryRegra.SQl.Add(sSQL);
            qryRegra.Open;
            regraAPrev.QueryIn   := dtmAPrev.qryRegra;
            regraAPrev.IdCalculo := iIdCalculoGeral;
            If (Sistema.NomeUsuario = 'AUGUSTO.CM') or (Sistema.NomeUsuario = 'NEIL') Then Begin
              regraAPrev.QueryIn.SQL.SaveToFile('C:\TEMP\REGRA-'+regraAPrev.RuleName+'.TXT');
              regraAPrev.FlgReloadRule := True;
            End;
            regraAPrev.Execute;
            if regraAPrev.Error
            then begin
               bErro := True;
               sMsgErro := ' Ocorreu um erro na Regra de Reajuste do Benefício (nº '+sIdRegraReajuste+') ';
               Exit;
            end;

            if UPPERCASE(RegraAPrev.Result) = 'FALSE'
            then Exit;

            // Verificar se o resultado da regra é um número válido
            try
               { Augusto 18/11/2003 - Atualiza valor reajustado }
               pdValorEmReal := StrToFloat(ClienteNumero(RegraAPrev.Result))

            except
               MsgDlg('O valor retornado pela regra Nº '+sIdRegraReajuste+' não é um valor válido. Verifique. '+
                      '[VALOR = '+RegraAPrev.Result+']','Erro',mtError,[mbOk, mbHelp],0);
               bErro := True;
            end;


            bReajustou := true; //leofuncef - 30102003
         end; // with dtmAPREV

         { Inicio Augusto 05/11/2003  }
         If (bReajustou = True) And (bReajustaInssNConcedido = True) Then Begin { Augusto 26/01/2004 }
           //sSQL := 'UPDATE BENEFBFCIARIO SET VLRCALCINSS = '+OraNumero(dtmAPrev.regraAPrev.Result)+' '+
           sSQL := 'UPDATE BENEFBFCIARIO SET VLRINFINSS = '+OraNumero(dtmAPrev.regraAPrev.Result)+' '+
                   ' WHERE  IDPESSJUR          = '+IntToStr(piIdPessJur)              +
                   ' AND    IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)            +
                   ' AND    IDTITULAR          = '+IntToStr(piIdTitular)              +
                   ' AND    SEQPROPOSTA        = 1                                   '+
                   ' AND    IDPESSOA           = '+IntToStr(piIdPessoa)               +
                   ' AND    IDBENEFICIO        = '+IntToStr(piIdBeneficio)            +
                   ' AND    NUMEROPROCESSO     = '+IntToStr(piNumeroProcesso)         + // CAMILLE - 28.01.2004
                   ' AND    IDSITBENEFICIO IN (1,2,3,4,7)  ';// Camille - Pendência 15724
                                                               // CAMILLE - FCRT - 26.01.2004
                                                               // Acrescentei o 3
                                                               // Quando a data final é efetiva a situacao é = 3


           ExecutarQuery(qryAux,sSQL)
         End;
         { Fim  Augusto 05/11/2003  }

      end; // if not bPossuiReajusteINSS


      // CAMILLE - 14.08.2002
      // Se o reajuste for em cima do SRB, entao o resultado da regra retornou o SRB
      // reajustado. Agora, o sistema tem que executar a regra de calculo do beneficio
      // com este SRB reajustado

      if (bReajustaSRB or bPossuiReajusteINSS)
         and (not pbMigracaoPlano) //leofuncef - 06042004
      then begin
         if bReajustaSRB
         then begin
            if prmCalculaSRBNoRetroativo
            then sValorSRB       := OraNumero(dtmAPrev.regraAPrev.Result)
            else SVALORSRB       := ORANUMERO(FLOATTOSTR(DVALORSRB));
         end
         else begin
            sValorBeneficio := OraNumero(dtmAPrev.regraAPrev.Result);
            if  bReajustaInssNConcedido then   sVlrInfINSS := sValorBeneficio;
         end;

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

            sIdSitPartAntes := qryAux.FieldByName('idsitpartatual').AsString;
            sIdSitPlanAntes := qryAux.FieldByName('idsitplanoatual').AsString;
            sIdSitFuncAntes := qryAux.FieldByName('idsitfuncatual').AsString;

            sIdSitPartAtual := qryAux.FieldByName('idsitpartnovo').AsString;
            sIdSitPlanAtual := qryAux.FieldByName('idsitplanonovo').AsString;
            sIdSitFuncAtual := qryAux.FieldByName('idsitfuncnovo').AsString;

            qryAux.Close;
            qryAux.SQL.Clear;
            { Augusto 02/12/2003 - No Caso de desdobramento não pode buscar informações do }
            { beneficiario concedido no banco de dados, pois ele ainda não foi incluido.   }
            If piOrigem <> 5 Then Begin { <> de Desdobramento }
              // CGUEDES - 11/09/2002
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
            End Else Begin { = de Desdobramento }
              // CGUEDES - 11/09/2002
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
                             //' AND    BF.IDPESSOA         = '+IntToStr(piIdPessoa)+
                             ' AND    BF.SEQPROPOSTA      = 1 '+
                             ' AND    BF.IDBENEFICIO      = '+IntToStr(piIdBeneficio)+
                             ' AND    P.NUMEROPROCESSO    = BF.NUMEROPROCESSO '+
                             ' AND    BP.IDPLANOPREV      = BF.IDPLANOPREV    '+
                             ' AND    BP.IDBENEFICIO      = BF.IDBENEFICIO    ');
              qryAux.Open;
            End;
         end;

         // CAMILLE - 23.08.2002
         dValorSRB := StrToFloat(ClienteNumero(sValorSRB));
         dValorAux := StrToFloat(ClienteNumero(sVlrInfINSS));  // CAMILLE - 28.01.2003

         { Augusto 10/01/2004 - Beneficios de Contribuicao definida não recalcular - FUNCEF }
         If sTPMODALIDADE <> 'CD' Then Begin
           if piIdTitular = piIdPessoa then
             dValorAux       := ExecutaRegraCalculoBeneficio( dtmAPrev.qryAux,
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
                                        //leocm - 1809 - inicio
                                        //dtmAPrev.qryAux.FieldByName('DTEVENTO').AsString,
                                        '01/'+copy(sAnoMesRefAux,6,2)+'/'+copy(sAnoMesRefAux,1,4),
                                        //leocm - 1809 - fim
                                        dtmAPrev.qryAux.FieldByName('DATAINICIOFUND').AsString,
                                        dtmAPrev.qryAux.FieldByName('DATAINICIOINSS').AsString,
                                        dtmAPrev.qryAux.FieldByName('DATAINICIO').AsString,
                                        dtmAPrev.qryAux.FieldByName('DATAREQUERIMENTO').AsString,
                                        sVlrInfInss,
                                        sVlrCalcInss,
                                        '0', // Provisorio - VALORRESERVA
                                        False,
                                        0,  // piFlgTipoInss
                                        sDataInicioAnt,
                                        sValorAnt,
                                        sValorBase1,
                                        sValorBase2,
                                        sValorBase3,
                                        bErro,
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
                                        '',
                                        iFlgProvisorio   ,          // Camille - 19.04.2004
                                        iPrazoProvisorio ,          // Camille - 19.04.2004
                                        dPercProvisorio  )          //  Camille - 19.04.2004

           // cguedes - 11/09/2002
           else dValorAux       := ExecutaRegraValorTotal( dtmAPrev.qryAux,
                                        dtmAPrev.qryAux.FieldByName('IDRGVALORTOTAL').AsInteger,
                                        piIdPessJur,
                                        piIdPlanoPrev,
                                        piIdTitular,
                                        1,
                                        piNumeroProcesso,
                                        piIdBeneficio,
                                        piNumBenef,
                                        StrToFloat(ClienteNumero(sValorBase1)),
                                        StrToFloat(ClienteNumero(sValorBase2)),
                                        StrToFloat(ClienteNumero(sValorBase3)),
                                        '', // psSQLBenefAssoc,
                                        dtmAPrev.qryAux.FieldByName('DTEVENTO').AsString,
                                        dtmAPrev.qryAux.FieldByName('DATAINICIOFUND').AsString,
                                        dtmAPrev.qryAux.FieldByName('DATAINICIOINSS').AsString,
                                        sVlrCalcInss,
                                        sVlrInfINSS,
                                        dtmAPrev.qryAux.FieldByName('DATAINICIO').AsString,
                                        '0', // psValorReserva
                                        '', // psVALORBINSSANT1,
                                        '', // psVALORBINSSANT2,
                                        '', // psVALORBINSSANT3
                                        bErro,
                                        sMsgErro,
                                        iIdCalculoGeral,
                                        0, // piFlgTipoInss
                                        sDataInicioAnt,
                                        sValorAnt,
                                        StrToFloat(ClienteNumero(sValorSRB)),
                                        -1,
                                        -1,
                                        iFlgProvisorio   ,          // Camille - 19.04.2004
                                        iPrazoProvisorio ,          // Camille - 19.04.2004
                                        dPercProvisorio            //  Camille - 19.04.2004

                                        );

           sValorBeneficio := OraNumero(FloatToStr(dValorAux));
         End Else Begin
           { Quando beneficio de contribuicao definida, continuar com mesmo valor }
           sValorBeneficio := OraNumero(FloatToStr(dValorTotal));
         End;
         { Fim Augusto 10/01/2004 }

      end else begin
        { Augusto 16/06/2004 }
        //sValorBeneficio := OraNumero(dtmAPrev.regraAPrev.Result);
        sValorBeneficio := OraNumero(FloatToStr(pdValorEmReal));
      end;

      if bErro
      then begin
         bErro := True;
         sMsgErro := ' Ocorreu um erro na Regra de Reajuste do Benefício (nº '+sIdRegraReajuste+') ';
         Exit;
      end;

      if Trim(sValorBeneficio) = ''
      then begin
         bErro := True;
         sMsgErro := ' A Regra de Reajuste do Benefício (nº '+sIdRegraReajuste+')'+
                     ' retornou um valor em branco. ';
         Exit;
      end;

      qryAux.Close;
      qryAux.Sql.Clear;
      if piIdTitular = piIdPessoa
      then qryAux.Sql.Add(' UPDATE BENEFBFCIARIO SET ULTVALORATUALREAJ = VALORATUAL     , '+
                          '        VALORATUAL     = '+OraNumero(sValorBeneficio)       +','+
                          '        VALORTOTAL     = '+OraNumero(sValorBeneficio)       +','+
                          '        VALORCALCULADO = '+OraNumero(sValorBeneficio)       +','+
                          '        VALORSRB       = '+OraNumero(FloatToStr(dValorSRB)) +','+// CAMILLE - 14.08.2002
                          '        ULTMESREAJUSTE = '''+Trim(sAnoMesRefAux)              +''''+
                          ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)       +
                          ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)          +
                          ' AND    IDTITULAR      = '+IntToStr(piIdTitular)            +
                          ' AND    IDPESSJUR      = '+IntToStr(piIdPessJur)            +
                          ' AND    IDBENEFICIO    = '+IntToSTr(piIdBeneficio)          +
                          ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)             +
                          ' AND    SEQPROPOSTA    = 1                                  ')
      else begin
         dValorTotal := StrToFloat(ClienteNumero(sValorBeneficio));
         qryAux.Sql.Add(' UPDATE BENEFBFCIARIO SET ULTVALORATUALREAJ = VALORATUAL          ,'+
                          '        VALORTOTAL     = '+OraNumero(FloatToStr(dValorTotal)) +','+
                          '        VALORCALCULADO = '+OraNumero(FloatToStr(dValorTotal)) +','+
                          '        VALORSRB       = '+OraNumero(FloatToStr(dValorSRB))   +','+ // CAMILLE - 14.08.2002
                          '        ULTMESREAJUSTE = '''+Trim(sAnoMesRefAux)                +''''+
                          ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)         +
                          ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)            +
                          ' AND    IDTITULAR      = '+IntToStr(piIdTitular)              +
                          ' AND    IDPESSJUR      = '+IntToStr(piIdPessJur)              +
                          ' AND    IDBENEFICIO    = '+IntToSTr(piIdBeneficio)            +
                          ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)               +
                          ' AND    SEQPROPOSTA    = 1                                    ');
      end;

      try
         qryAux.ExecSQL;
      except
         bErro := True;
         sMsgErro := 'Erro na atualização do valor atual do benefício. ';
         Exit;
      end;

      // CAMILLE - 14.08.2002
      // Se for beneficio de referencia, atualizar os campos VLRCALCINSS e VLRINFINSS
      // da suplementação
      if pbBenefReferencia
      then begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET VLRINFINSS  = '+OraNumero(sValorBeneficio) +','+
                        '                          VLRCALCINSS = '+OraNumero(sValorBeneficio) +
                        ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)                +
                        ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)                   +
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
            bErro := True;
            sMsgErro := 'Erro na atualização do valor do inss no benefício. ';
            Exit;
         end;
      end;


      dValorTotal           := StrToFloat(ClienteNumero(sValorBeneficio));
      dValorTotalReajustado := dValorTotal;


      // Se o beneficio for para beneficiario, rateá-lo
      if (piIdTitular <> piIdPessoa)
         and (not pbMigracaoPlano) //leofuncef - 06042004
      then begin
         dValorTotalReajustado := dValorTotal;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT P.DTEVENTO, BF.DATAINICIO, BF.DATAFINAL, BF.DATAINICIOINSS,         '+
                        '        BF.VLRINFINSS, BP.IDREGRAPAGAMENTO,  BP.IDREGRACALCULO,             '+
                        '        DP.IDDEPENDENCIA, BTIT.PERCENTUAL, BF.DIBBENEFANT, BF.VALORBENEFANT,'+
                        '        BF.VLRCALCINSS                                                      '+
                        ' FROM   BENEFPLANPREV BP, DEPENTIT DP, BFCIARIOTITPLAN BTIT, PROCESSOBENEF P, BENEFBFCIARIO BF    '+
                        ' WHERE  BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                        ' AND    BF.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                        ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                        ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)+
                        ' AND    BF.SEQPROPOSTA    = 1 ');

         { Augusto 10/01/2004 - No caso de desdobramento não pode buscar informações do }
         { beneficiario concedido no banco de dados, pois ele ainda não foi incluido.   }
         If piOrigem <> 5 Then Begin { <> de Desdobramento }
           qryAux.SQL.Add(' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa));
         End;
         qryAux.SQL.Add(' AND    BF.IDBENEFICIO    = '+IntToStr(piIdBeneficio)+
                        ' AND    P.NUMEROPROCESSO  = BF.NUMEROPROCESSO '+
                        ' AND    BP.IDPLANOPREV    = BF.IDPLANOPREV    '+
                        ' AND    BP.IDBENEFICIO    = BF.IDBENEFICIO    '+
                        ' AND    BTIT.IDPESSJUR    = BF.IDPESSJUR      '+
                        ' AND    BTIT.IDPLANOPREV  = BF.IDPLANOPREV    '+
                        ' AND    BTIT.IDTITULAR    = BF.IDTITULAR      '+
                        ' AND    BTIT.IDPESSOA     = BF.IDPESSOA       '+
                        ' AND    BTIT.SEQPROPOSTA  = BF.SEQPROPOSTA    '+
                        ' AND    BTIT.IDBENEFICIO  = BF.IDBENEFICIO    '+
                        ' AND    DP.IDTITULAR      = BTIT.IDTITULAR    '+
                        ' AND    DP.IDPESSOA       = BTIT.IDPESSOA     ');
         qryAux.Open;

         // PENDENTE : psSQLbBenefAssoc, psValorReserva

         dValorRateadoReajustado  := ExecutaRegraCalculoBeneficioBfciario( qryAux,
                                               qryAux.FieldByName('IDREGRACALCULO').AsInteger,
                                               -1,
                                               piIdPessJur,         piIdPlanoPrev,
                                               piIdTitular,         1,
                                               piIdBeneficio,       piNumeroProcesso,
                                               piNumBenef,
                                               pdValorBase1, pdValorBase2, pdValorBase3,
                                               '', // psSQLBenefAssoc,
                                               qryAux.FieldByName('DTEVENTO').AsString,
                                               qryAux.FieldByName('DATAINICIO').AsString,
                                               qryAux.FieldByName('DATAINICIOINSS').AsString,
                                               OraNumero(FloatToStr(dValorTotalReajustado)),
                                               // qryAux.FieldByName('VLRINFINSS').AsString,
                                               // qryAux.FieldByName('VLRCALCINSS').AsString,
                                               sVlrInfINSS,
                                               sVlrCalcINSS,
                                               '0', // psValorReserva,
                                               bErro,
                                               sMsgErro,
                                               iIdCalculoGeral,
                                               piIdPessoa,
                                               qryAux.FieldByName('IDDEPENDENCIA').AsString,
                                               qryAux.FieldByName('PERCENTUAL').AsString,
                                               0,
                                               qryAux.FieldByName('DIBBENEFANT').AsString,
                                               qryAux.FieldByName('VALORBENEFANT').AsString,
                                               psAnoMesRef,
                                               -1,
                                               iFlgProvisorio   ,          // Camille - 19.04.2004
                                               iPrazoProvisorio ,          // Camille - 19.04.2004
                                               dPercProvisorio            //  Camille - 19.04.2004
                                               );

         // Atualizar o campo VALORATUAL com o valor reajustado rateado
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.Sql.Add(' UPDATE BENEFBFCIARIO SET VALORATUAL = '+OraNumero(FloatToStr(dValorRateadoReajustado))+
                        ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                        ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                        ' AND    IDTITULAR      = '+IntToStr(piIdTitular)+
                        ' AND    IDPESSJUR      = '+IntToStr(piIdPessJur)+
                        ' AND    IDBENEFICIO    = '+IntToSTr(piIdBeneficio)+
                        ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)+
                        ' AND    SEQPROPOSTA    = 1 ');
         try
            qryAux.ExecSQL;
         except
            bErro := True;
            sMsgErro := 'Erro na atualização do valor atual do benefício. ';
            Exit;
         end;
      end
      else dValorRateadoReajustado := StrToFloat(ClienteNumero(sValorBeneficio));

      {incrememtar sAnoMesRefAux}
      sAnoMesRefAux := ProximoAnoMes(strtoint(copy(sAnoMesRefAux,6,2)), strtoint(copy(sAnoMesRefAux,1,4)));

   end;//while de meses de reajuste entre a dib e a dip

   bReajustou := True;
   bErro      := False;
   sMsgErro   := ' ';
   // CAMILLE - CBS - 05.03.2002
   // Retornar o VALOR TOTAL REAJUSTADO, para que possa ser executada a regra de benefício mimino
   Result     := OraNumero(FloatToStr(dValorTotalReajustado));
end; // ReajustaBenefConc

function CalculaBeneficioMinimo ( piNumeroProcesso,
                                  piIdPessJur,
                                  piIdPlanoPrev,
                                  piIdTitular,
                                  piIdPessoa,
                                  piIdBeneficio           : longint;
                                  psValorPrev,
                                  psValorTotal            : string;
                                  piNumBenef              : word;
                                  psAnoMesReferencia,
                                  psDataInicio,
                                  psDataFinal             : string;
                                  var pdValorDepoisMinimo : double;
                                  var sMsgErro            : string ) : boolean;
var sSQL,
    sPercentual,
    sFlgCalcTodoMes,
    sSalarioIntegral,
    sDataRef,
    sValorRegra  : string;
    dValorRegra  : double;
    bErro        : boolean;
begin
   Result := False;

   pdValorDepoisMinimo := 0;
   if prmIdRegraCalcBenefMin <= 0
   then begin
      Result   := True;
      pdValorDepoisMinimo := StrToFloat(ClienteNumero(psValorPrev));
      sMsgErro := '';
      Exit;
   end;


   // Buscar campos auxiliares
   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT BTIT.PERCENTUAL        '+
              ' FROM   BFCIARIOTITPLAN BTIT  '+
              ' WHERE  BTIT.IDBENEFICIO = '+IntToStr(piIdBeneficio)+
              ' AND    BTIT.IDPESSJUR   = '+IntToStr(piIdPessJur)+
              ' AND    BTIT.IDPESSOA    = '+IntToStr(piIdPessoa)+
              ' AND    BTIT.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
              ' AND    BTIT.IDTITULAR   = '+IntToStr(piIdTitular)+
              ' AND    BTIT.SEQPROPOSTA = 1 ');
      Open;
      if (not IsEmpty) and (FieldByName('PERCENTUAL').AsFloat > 0)
      then sPercentual := FormatFloat('#0.000000', FieldByName('PERCENTUAL').AsFloat)
      else sPercentual := '100';
   end;

   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT BP.FLGCALCTODOMES '+
              ' FROM   BENEFPLANPREV BP  '+
              ' WHERE  BP.IDBENEFICIO = '+IntToStr(piIdBeneficio)+
              ' AND    BP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev));
      Open;
      if (not IsEmpty)
      then sFlgCalcTodoMes := FieldByName('FLGCALCTODOMES').AsString
      else sFlgCalcTodoMes := '0';
   end;

   sSalarioIntegral := BuscaSalarioPESSOAINTEGRAL ( dtmAPrev.qryAux,
                                                    piIdPessJur,  piIdPlanoPrev,
                                                    piIdTitular,   1,
                                                    'AS', psAnoMesReferencia );

   if (StrToInt(copy(psDataInicio,1,2)) >= 29) and
      (StrToInt(copy(psAnoMesReferencia,6,2)) = 2)
   then sDataRef := '28/'+copy(psAnoMesReferencia,6,2) + '/' + copy(psAnoMesReferencia,1,4)
   else sDataRef := copy(psDataInicio,1,2)+ '/' + copy(psAnoMesReferencia,6,2) + '/' + copy(psAnoMesReferencia,1,4);

   if (StrToFloat(ClienteNumero(psValorTotal)) <= 0)
   then psValorTotal := psValorPrev;


   sSQL  := ' SELECT '+ OraNumero(sFlgCalcTodoMes) +'  AS FLGBENEFCOTAS,  '+
            '        1                                 AS FLGCONCESSAO,   '+
            '        1                                 AS SEQPROPOSTA,    '+
            IntToStr(piIdPlanoPrev)                +'  AS IDPLANOPREV,    '+
            IntToStr(piIdPessJur)                  +'  AS IDPESSJUR,      '+
            IntToStr(piNumeroProcesso)             +'  AS NUMEROPROCESSO, '+
            IntToStr(piIdTitular)                  +'  AS IDTITULAR,      '+
            IntToStr(piIdPessoa)                   +'  AS IDPESSOA,       '+
            IntToStr(piIdBeneficio)                +'  AS IDBENEFICIO,    '+
            OraNumero(psValorPrev)                 +'  AS VALORATUAL,     '+
            OraNumero(psValorPrev)                 +'  AS VALORPREV,      '+   { Augusto 03/12/2003 }
            OraNumero(psValorPrev)                 +'  AS VALORORIGINAL,  '+
            OraNumero(psValorTotal)                +'  AS VALORTOTAL,     '+
            OraNumero(sPercentual)                 +'  AS PERCENTUAL,     '+
            OraNumero(sSalarioIntegral)            +'  AS VALORPROVENTO,  '+
            OraNumero(sSalarioIntegral)            +'  AS SALARIOINTEGRAL,  '+ { Augusto 28/08/2003 } 
            IntToStr(piNumBenef)                   +'  AS NUMBENEF,       '+
            QuotedStr(PreparaStrRegra(psAnoMesReferencia))          +'  AS MESREFERENCIA,  '+
            QuotedStr(PreparaStrRegra(psAnoMesReferencia))          +'  AS ANOMESREF,      '+
            QuotedStr(PreparaStrRegra(psDataInicio))               +'  AS DATAINICIO,     '+
            QuotedStr(PreparaStrRegra(psDataFinal))                 +'  AS DATAFINAL,      '+
            QuotedStr(PreparaStrRegra(sDataRef))                    +'  AS DATAREF,        '+
            QuotedStr('AS')                        +'  AS FLGINTERNO      '+
            ' FROM DUAL ';

   try
     sValorRegra := RegraNumerica(FloatToStr(prmIdRegraCalcBenefMin),sSQL, bErro, iIdCalculoGeral);
   except
     sValorRegra := '0';
     bErro       := True;
   end;


   if bErro
   then begin
      sMsgErro := 'Erro ao Executar a Regra de Cálculo de Benefício Mínimo - Regra Nº '+FloatToStr(prmIdRegraCalcBenefMin)+'.';
      Exit;
   end;

   try
      dValorRegra := StrToFloat(ClienteNumero(sValorRegra));
   except
      sMsgErro := 'Valor Retornado pela Regra de Cálculo de Benefício Mínimo - Regra Nº '+FloatToStr(prmIdRegraCalcBenefMin)+' inválido ['+sValorRegra+'].';
      Exit;
   end;

   pdValorDepoisMinimo := dValorRegra;

   Result := True;
end;

function CalcBeneficioINSSAtual( iIdPessJur,
                                 iIdPlanoPrev,
                                 iIdPessoa            : longint;
                                 sMesInicio,
                                 sMesRef              : string;
                                 var psIDTPPAGTOANT,
                                     psFlgBenefMinimo : string;
                                 qry                  : TwwQuery;
                                 iINumProcesso        : Integer;
                                 psFlgCampoRetorno : String = 'I')  : string; // Gleyber - 19/11/2002) : string;
var rValorTotal,
    rValorAUsar  : double;
    sAnoMesInicio,
    sAnoMesFinal, sSQL,
    sAnoMesAtual : string;
    i            : word;

begin
   Result := '0';
   psIdTpPagtoAnt := '';
   psFlgBenefMinimo := '0';

   if Trim(sMesInicio) = '' then sMesInicio := sMesRef;
   // NAO CONSIDERAR BENEFICIO DE PAGAMENTO UNICO
   // Verificar todos os beneficios que o participante estava recebendo
   // na data do evento
   // Esta query supoe que o beneficio anterior é o beneficio cuja data
   // de inicio é anterior a data parametrizada e cuja data final
   // nao é nula, ou seja, ele foi encerrado
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT BF.IDBENEFICIO,BF.VALORATUAL,BF.IDTPPAGTOBENEFIC,BF.FLGBENEFMIN, '+
   // Gleyber - 20/11/2002
               ' EV.FLGINTERNO, BF.IDSITBENEFICIO, BF.VALORTOTAL, BF.VALORCALCULADO '+ { Augusto 08/06/2004 }
               ' FROM   TPPAGTOBENEFICIO T, BENEFICIO B, BENEFPLANPREV BP, BENEFBFCIARIO BF, '+
   // Gleyber - 20/11/2002
               ' EVENTOGERADOR EV '+
               ' WHERE  (BF.IDPESSJUR       = '+IntToStr(iIdPessJur)   +')'+
               ' AND    (BF.IDPLANOPREV     = '+IntToStr(iIdPLANOPREV) +')'+
               ' AND    (BF.IDPESSOA        = '+IntToStr(iIdPESSOA)    +')'+
//               ' AND    (BF.IDTITULAR       = '+IntToStr(iIdPESSOA)    +')'+ // CAMILLE - 23.01.2003
               { Augusto 24/10/2003 }
//               ' AND    (BF.NUMEROPROCESSO  = '+IntToStr(iINumProcesso)+')'+ { Augusto 03/11/2003 }
               ' AND     BF.IDSITBENEFICIO IN (1,2,3,4,7,6)  '+ // CAMILLE - 10.12.2003 - Acrescentei o 2
                                                               // CAMILLE - FCRT - 26.01.2004
                                                               // Acrescentei o 3 porque na renova
                                                               // Quando a data final é efetiva a situacao é = 3

               ' AND BF.FLGPOSSUIACOMPINSS = 0 '+ { Augusto 24/11/2003 - Retirar Beneficio de acompanhante }

               ' AND    (TO_CHAR(BF.DATAINICIO,''YYYY/MM'') <= '''+sMesInicio+''') ');
   if Copy(sMesRef,6,2) <> '13'
   then qry.SQL.Add(' AND    ( (BF.DATAFINAL IS NULL) OR (TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+sMesRef+''') ) ');
   qry.SQL.Add(' AND    (BF.IDPLANOPREV     = BP.IDPLANOPREV) '+
               ' AND    (BF.IDBENEFICIO     = BP.IDBENEFICIO) '+
               ' AND    (BP.FLGREFERENCIA   = 1) '+
               ' AND    (BP.IDBENEFICIO     = B.IDBENEFICIO) '+
               ' AND    (B.IDTPPAGTOBENEFIC = T.IDTPPAGTOBENEFIC)'+
               ' AND    (T.FLGFREQUENCIA    <> ''U'')'+
   // Gleyber - 20/11/2002
               ' AND    (B.IDEVENTOGERADOR  = EV.IDEVENTOGERADOR)');

   //
   qry.Open;
   qry.First;

   { Inicio Augusto 10/11/2003 }
   { caso não encontre INSS na época, retonar os valor informado da Suplmentação }
   If qry.IsEmpty then Begin
     sSQL := ' SELECT BF.VLRCALCINSS, BF.VLRINFINSS, BF.VALORCALCULADO '+
             ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP '+
             ' WHERE  (BF.IDPESSJUR       = '+IntToStr(iIdPessJur)   +')'+
             '   AND  (BF.IDPLANOPREV     = '+IntToStr(iIdPlanoPrev) +')'+
             '   AND  (BF.IDPESSOA        = '+IntToStr(iIdPessoa)    +')'+
             '   AND  (BF.IDSITBENEFICIO IN (1,2,3,4,7,6)) '+ // CAMILLE - 10.12.2003 - Acrescentei o 2
                                                               // CAMILLE - FCRT - 26.01.2004
                                                               // Acrescentei o 3 porque na renova
                                                               // Quando a data final é efetiva a situacao é = 3

             '   AND  (BP.FLGREFERENCIA   = 0) '+
             '   AND  (BF.IDPLANOPREV     = BP.IDPLANOPREV) '+
             '   AND  (BF.IDBENEFICIO     = BP.IDBENEFICIO) ';
     If FazQuery(Qry, sSQL) Then Begin
       dtmAPrev.qryAux.Close;
       rValorTotal := Qry.FieldByName('VLRINFINSS').AsFloat;
       Result := OraNumero(FloatToStr(rValorTotal));
       
       { Augusto 29/12/2003 }
       If psFlgCampoRetorno = 'C' then begin
         rValorTotal := Qry.FieldByName('VLRCALCINSS').AsFloat;
         Result := OraNumero(FloatToStr(rValorTotal));
       end;

       if Trim(Result) = '' then Result := '0';
     End;
     Exit;
   End;
   { Fim Augusto 10/11/2003 }

   // Procurar beneficios no historico e somar seus valores
   // Caso nao os encontre no historico, somar valores da benefbfciario
   rValorTotal := 0;
   qry.First;
   while not qry.Eof do
   begin
       psIdTpPagtoAnt    := qry.FieldByName('IdTpPagtoBenefic').AsString;
       if not ((psFlgBenefMinimo = '1') and (qry.FieldByName('FlgBenefMin').AsString = '0'))
       then psFlgBenefMinimo := qry.FieldByName('FlgBenefMin').AsString;

       sAnoMesFinal  := sMesRef;
       sAnoMesInicio := sMesInicio;
       sAnoMesAtual := sAnoMesInicio;
       rValorAUsar  := 0;

       // CAMILLE - 27.08.2002
       dtmAPrev.qryAux.Close;
       dtmAPrev.qryAux.SQL.Clear;                      { Augusto 30/10/2003 }
       dtmAPrev.qryAux.SQL.Add(' SELECT VALORINTEGRAL, VALORTOTAL, VALORCALCULADO '+
                               ' FROM   HSTBENEFBFCIARIO                          '+
                               ' WHERE  (IDPESSOA      = '+IntToStr(iIdPESSOA)    +')'+
                               ' AND    (MESREFERENCIA = '''+sAnoMesAtual+''' '   +')'+
                               ' AND    (IDBENEFICIO   = '+qry.FieldbyName('IdBeneficio').AsString+') '+
                               ' ORDER BY MES DESC '); { Augusto 24/05/2004 }

       dtmAPrev.qryAux.Open;
       { Augusto 30/10/2003 }
       if not dtmAPrev.qryAux.IsEmpty then
         if psFlgCampoRetorno = 'I' then
           rValorAUsar := dtmAPrev.qryAux.FieldByName('VALORINTEGRAL').AsFloat
         Else If psFlgCampoRetorno = 'T' then
           rValorAUsar := dtmAPrev.qryAux.FieldByName('VALORTOTAL').AsFloat
         Else If psFlgCampoRetorno = 'C' then
           rValorAUsar := dtmAPrev.qryAux.FieldByName('VALORCALCULADO').AsFloat;
       { - }

{       while sAnoMesAtual <= sAnoMesFinal do
       begin
          dtmAPrev.qryAux.Close;
          dtmAPrev.qryAux.SQL.Clear;
          dtmAPrev.qryAux.SQL.Add(' SELECT VLBENEFPGTO, VALORPREV, FLGDEVOLUCAO     '+
                                  ' FROM   HSTBENEFBFCIARIO                         '+
                                  ' WHERE  (IDPESSOA      = '+IntToStr(iIdPESSOA)   +')'+
                                  ' AND    (MESREFERENCIA = '''+sAnoMesAtual+''' '  +')'+
                                  ' AND    (IDBENEFICIO   = '+qry.FieldbyName('IdBeneficio').AsString+')');

          dtmAPrev.qryAux.Open;

          if not dtmAPrev.qryAux.IsEmpty
          then begin
             dtmAPrev.qryAux.First;
             while not dtmAPrev.qryAux.Eof do
             begin
                if Trim(dtmAPrev.qryAux.FieldByName('VlBenefPgto').AsString) = ''
                then begin
                   if dtmAPrev.qryAux.FieldByName('FLGDEVOLUCAO').AsInteger = 0
                   then rValorAUsar := rValorAUsar + dtmAPrev.qryAux.FieldByName('ValorPrev').AsFloat
                   else rValorAUsar := rValorAUsar - dtmAPrev.qryAux.FieldByName('ValorPrev').AsFloat
                end
                else begin
                   if dtmAPrev.qryAux.FieldByName('FLGDEVOLUCAO').AsInteger = 0
                   then rValorAUsar := rValorAUsar + dtmAPrev.qryAux.FieldByName('VlBenefPgto').AsFloat
                   else rValorAUsar := rValorAUsar - dtmAPrev.qryAux.FieldByName('VlBenefPgto').AsFloat;
                end;
                dtmAPrev.qryAux.Next;
             end;
             break;
          end;

          sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
       end;
}

       { Augusto 08/06/2004 }
       If rValorAUsar <= 0 then Begin
         if psFlgCampoRetorno = 'I' then
           rValorAUsar := qry.FieldByName('VALORATUAL').AsFloat
         Else If psFlgCampoRetorno = 'T' then
           rValorAUsar := qry.FieldByName('VALORTOTAL').AsFloat
         Else If psFlgCampoRetorno = 'C' then
           rValorAUsar := qry.FieldByName('VALORCALCULADO').AsFloat;
       End;

       // Gleyber - 20/11/2002
       If Copy(sMesRef,6,2) <> '13'
        Then If (Trim(qry.FieldByName('FLGINTERNO').AsString) = 'IN') or
                (Trim(qry.FieldByName('FLGINTERNO').AsString) = 'AC')
              Then rValorTotal := rValorAUsar
              Else rValorTotal := rValorTotal + rValorAUsar
        Else rValorTotal := rValorTotal + rValorAUsar;
       //
       qry.Next;
   end;
   qry.Close;
   dtmAPrev.qryAux.Close;
   Result := OraNumero(FloatToStr(rValorTotal));
   if Trim(Result) = '' then Result := '0';
end;//CalcBeneficioINSSAtual


function ExecutaRegraCalculoBeneficioBfciario(qryAux : TwwQuery;
                                      piIdRegraCalculo,    piIdRegraCalcReserva,
                                      piIdPessJur,         piIdPlanoPrev,
                                      piIdTitular,         piSeqProposta,
                                      piIdBeneficio,       piNumeroProcesso,
                                      piNumBenef          : longint;
                                      prOpcao1,            prOpcao2,
                                      prOpcao3                                 : double;
                                      psSQLBenefAssoc,     psDataEvento,
                                      psDataInicio,        psDataInicioINSS,
                                      psValorTotal,        psValorInfINSS,
                                      psValorCalcINSS,     psValorReserva      : string;
                                      var bErro                                : boolean;
                                      var sMsgErro                             : string;
                                      var piIdCalculo                          : longInt;
                                      piIdPessoa                               : longint;
                                      psIdDependencia,     psPercentual        : string;
                                      piFlgTipoInss                            : integer;
                                      psDataInicioAnt,
                                      psValorBenefAnt                          : string;
                                      psAnoMesRef : String = '';
                                      piIdBeneficiario : LongInt = -1;      //  Augusto 18/02/2004
                                      piFlgProvisorio       : integer = 0;            // Camille - 19.04.2004
                                      piPrazoProvisorio     : integer = 0;            // Camille - 19.04.2004
                                      pdPercProvisorio      : double  = 0 ) : double; // Camille - 19.04.2004


var
  sDataInicio,
  sDataInicioINSS,
  sDataRef,
  sOp1, sOp2, sOP3,
  sSQL,
  sSALPART,
  sREMTOTAL,
  sValorBeneficio,
  sValorBeneficioRateado, { Augusto 30/01/2003 }
  sDataInscFund,
  sValorReserva,
  sFlgBenefMinimo,
  sAnoMesRef : string;
  rValorBeneficio : double;

  // Dados necessários do benefício anterior
  sDataInicioAnt,  // var. auxiliar apenas para passar para a funcao. A var. utilizada é a psDataInicioAnt
  sValorAnt,       // var. auxiliar apenas para passar para a funcao. A var. utilizada é a psValorBenefAnt
  sNomeBenefAnt,
  sIdTpPagtoAnt,
  sFlgBenefMinAnt, sDataEventoAnt,sCodBeneficioAnt,
  sUltMesReajAnt,
  sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
  sValorBase1Ant,
  sValorBase2Ant,
  sValorBase3Ant, sVlrINSSTotal,
  sFlgBenefCotas    : string;

  sFlgInternoAntes,   sFlgInternoAtual,
  sIdSitPartAntes,    sIdSitPlanAntes,
  sIdSitFuncAntes,    sIdSitPartDepois,
  sIdSitPlanDepois,   sIdSitFuncDepois  : string;

  sPlanoOrigem  : string;

begin
  Result := 0;
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
  then sFlgBenefCotas := '0'
  else sFlgBenefCotas := OraNumero(qryAux.FieldByName('FLGCALCTODOMES').AsString);

  // Para a regra de calculo, DATAINICIO = DIB - DATA DE DIREITO = (QUASE SEMPRE) DATA DO EVENTO
  //                          DATAREF    = DATA DO EVENTO

  { Augusto 22/03/2004 }
  sPlanoOrigem := BuscaPlanoOrigem(piIdPessjur,piIdTitular, psAnoMesRef, piIdPessoa );
  if (piIdTitular <> piIdPessoa) And (sPlanoOrigem = '-1') Then
    sPlanoOrigem := BuscaPlanoOrigem(piIdPessjur, piIdPessoa, psAnoMesRef, piIdBeneficiario);
  {-}

  if Trim(psDataEvento) = '' then psDataEvento := DateToStr(date);
  if Trim(psDataInicio) = '' then psDataInicio := DateToStr(date);
  if Trim(psDataInicioINSS) = '' then psDataInicioINSS := DateToStr(date);
  sDataInicio := psDataInicio;
  sDataRef    := psDataEvento;
  sDataInicioINSS := psDataInicioINSS;

  // Buscar situacoes do participante antes e depois do evento
  BuscaSituacoesPart(qryAux,piIdTitular, piIdPlanoPrev, piIdPessJur,psDataEvento,
                     sFlgInternoAntes , sFlgInternoAtual,
                     sIdSitPartAntes  , sIdSitPartDepois,
                     sIdSitPlanAntes  , sIdSitPlanDepois,
                     sIdSitFuncAntes  , sIdSitFuncDepois);


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

  sFlgInternoAntes := qryAux.FieldByName('flginternoant').AsString;
  sFlgInternoAtual := qryAux.FieldByName('flginterno').AsString;

  sIdSitPartAntes := qryAux.FieldByName('idsitpartatual').AsString;
  sIdSitPlanAntes := qryAux.FieldByName('idsitplanoatual').AsString;
  sIdSitFuncAntes := qryAux.FieldByName('idsitfuncatual').AsString;

  sIdSitPartDepois := qryAux.FieldByName('idsitpartnovo').AsString;
  sIdSitPlanDepois := qryAux.FieldByName('idsitplanonovo').AsString;
  sIdSitFuncDepois := qryAux.FieldByName('idsitfuncnovo').AsString;
   }

  // se foi passada regra para calculo da reserva, chamar a regra
  // senao, se foi passado um valor fixo como sendo o valor da reserva
  //        usar este valor
  //        senao colocar a soma das reservas como sendo o valor da reserva
  if piIdRegraCalcReserva > 0
  then //Executa regra para calcular valor da Reserva do Particip.
     sValorReserva := OraNumero(CalcReservaPart(piIdPessJur,
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
     then sValorReserva := psValorReserva
     else sValorReserva := OraNumero(CalcReservaPart(piIdPessJur,
                                                piIdPlanoPrev,
                                                piIdTitular,
                                                -1,
                                                piSeqProposta,
                                                psDataEvento,
                                                psDataInicio,
                                                '','',
                                                IntToStr(piIdBeneficio),
                                                qryAux));

  sAnoMesRef := Copy(psDataEvento,7,4) + '/' + Copy(psDataEvento,4,2);


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
                                //sValorBase1, sValorBase2, sValorBase3,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant,//leocm - 31102002 - estava zerando os valoresbase
                                sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
                                False);

  if psValorInfInss <> ''
  then psValorInfINSS := OraNumero(Trim(psValorInfINSS))
  else psValorInfINSS := '0';

  if psValorCalcInss <> ''
  then psValorCalcINSS := OraNumero(Trim(psValorCalcINSS))
  else psValorCalcINSS := '0';

  sSALPART  := ORANUMERO(CalcSalPart( piIdPessJur,
                                      piIdTitular,
                                      SAnoMesAnterior(sAnoMesRef),
                                      qryAux));

  sDataInscFund := CalcDataInscFund(piIdPessJur, piIdPlanoPrev, piIdTitular, piSeqProposta,qryAux);


  if Trim(sDataInscFund) = ''
  then sDataInscFund := DateToStr(Date);

  if Trim(psValorInfINSS) = '' then psValorInfINSS := '0';
  if Trim(psValorCalcINSS) = '' then psValorCalcINSS := '0';
  if Trim(sSalPart) = ''   then sSalPart := '0';
  if Trim(sRemTotal) = ''  then sRemTotal := '0';

  if prOpcao1 >= 0
  then sOp1 := OraNumero(FloatToStr(prOpcao1))
  else sOp1 := '0';

  if prOpcao2 >= 0
  then sOp2 := OraNumero(FloatToStr(prOpcao2))
  else sOp2 := '0';

  if prOpcao3 >= 0
  then sOp3 := OraNumero(FloatToStr(prOpcao3))
  else sOp3 := '0';

  if Trim(sValorReserva) = '' then sValorReserva := '0';
  if Trim(sDataRef) = ''      then sDataRef := DateToStr(Date);

  psValorTotal := OraNumero(psValorTotal);

  if Trim(psIdDependencia) = '' then psIdDependencia := 'PRP';
  if Trim(psPercentual)    = '' then psPercentual    := '0';

  if Trim(psDataInicioAnt)    = '' then psDataInicioAnt  := '          ';
  if Trim(sDataRef)           = '' then sDataRef         := '          ';
  if Trim(sDataInicio)        = '' then sDataInicio      := '          ';
  if Trim(psDataInicioINSS)   = '' then psDataInicioINSS := '          ';
  if Trim(sDataEventoAnt)     = '' then sDataEventoAnt   := '          ';
  if Trim(psDataInicioAnt)    = '' then psDataInicioAnt  := '          ';

  sFlgBenefMinimo := PegaBenefMinimo(qryAux, piIdPessJur,piIdPlanoPrev,piIdTitular,
                                     piSeqProposta, piIdBeneficio);

  { Inicio Augusto 30/10/2003 - Buscar o valor integral do Benedicio INSS }
  sVlrINSSTotal := CalcBeneficioINSSAtual( piIdPessJur,
                                           piIdPlanoPrev,
                                           piIdPessoa,
                                           psAnoMesRef,
                                           psAnoMesRef,
                                           sIDTPPAGTOANT,
                                           sFlgBenefMinimo,
                                           qryAux,
                                           piNumeroProcesso,
                                           'T' ); { 18/12/2003 Retornar o VALORTOTAL }

  If (sVlrINSSTotal = '0') Or
     (StrToFloat(ClienteNumero(sVlrINSSTotal)) < StrToFloat(ClienteNumero(psValorInfINSS))) Then
    sVlrINSSTotal := psValorInfINSS;
  { Fim Augusto 30/10/2003 - Buscar o valor integral do Benedicio INSS }

  // Executa Regra de Cálculo do Valor do Beneficio
  sSQL := ' SELECT DISTINCT  1 FLGCONCESSAO, '+//LEOCM - 20062002 - ADICIONEI FLGCONCESSAO

          { Augusto 04/02/2004 }
          //'        PP.IDPESSOA, PP.IDPESSJUR,    PP.IDPLANOPREV,       PP.INSCRICAODATA, PP.DTINICIOINSC,    '+
          '        PP.IDPESSJUR,    PP.IDPLANOPREV,       PP.INSCRICAODATA, PP.DTINICIOINSC,    '+
          '        PP.SEQPROPOSTA,       PF.DATANASC,     PF.SEXO,              PF.DATAMORTE,        ';


          //leofuncef - 08012004 - inicio
          qryaux.close;
          qryaux.sql.clear;
          qryaux.sql. text := ' SELECT SUM(VLBENEFPGTO) VALOR '+
             ' FROM HSTBENEFBFCIARIO                              '+
             ' WHERE  IDTITULAR    = ' + IntToStr(piIdTitular)   + ' AND '+
             '        IDPESSOA <> IDTITULAR    AND '+
             '        IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND '+
             '        IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND '+
             '        SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND '+
             '        MESREFERENCIA = TO_CHAR(TO_DATE('''+sDataRef+''',''DD/MM/YYYY'') -30 ,''YYYY/MM'') ';
          qryaux.open;

          if qryaux.isempty then
          begin
             //caso seja o beneficiário
             sSQL := sSQL +'        EL.SALTOTAL,  ';
          end
          else
          begin
             //caso seja o benefficiário do beneficiário
             //pegar a soma do INSS e Suplementeção no mês de falecimento
             //para não pegar nenhum reajuste posterior
             sSQL := sSQL +oranumero(qryaux.fieldbyname('valor').AsString)+' AS SALTOTAL,  ';


             //percentual para rateio pelo n. de beneficiários
             //try  psPercentual :=  floattostr((100/piNumBenef)) except end; { Augusto 23/01/2004 }

          end;
          //leofuncef - 08012004 - fim
          { Inicio Augusto 26/03/2004 }

(* FILTROS ERRADOS QUANDO USADOS NO REQUERIMENTO DE BENEFICIO
  sSQL := sSQL + ' EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+
          '        EL.TEMPOSERVTOTAL,    SP.FLGINTERNO,                       '+
          '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          '        EL.FLGDIRETOR, '+
          { Augusto 10/03/2004 }
          '        BFC.FLGPROVISORIO, BFC.PERCPROVISORIO, BFC.PRAZOPROVISORIO, '+
          IntToStr(piIdTitular)          +' AS IDTITULAR,                     '+
          IntToStr(piIdPessoa)           +' AS IDPESSOA,                      '+
          ''''+psIdDependencia           +''' AS IDDEPENDENCIA,               '+
          OraNumero(psPercentual)        +' AS PERCENTUAL,                    '+
          IntToStr(piIdBeneficio)        +' AS IDBENEFICIO,                   '+
          IntToStr(piNumeroProcesso)     +' AS NUMEROPROCESSO,                '+
          ''''+sDataInscFund             +''' AS INSCRICAODATAFUND ,          '+
          OraNumero(psValorTotal)        +  ' AS VALORTOTAL,                  '+
          OraNumero(psValorInfINSS)      +' AS VLRINFINSS,                    '+
          OraNumero(psValorCalcINSS)     +' AS VLRCALCINSS,                   '+
          OraNumero(sVlrINSSTotal)       +' AS VLRTOTALINSS,                  '+ { Augusto 30/10/2003 }
          sSALPART                       +' AS VALORPROVENTO,                 '+
          sREMTOTAL                      +' AS VALORREMTOTAL,                 '+
          sOp1                           +' AS VALORBASE1,                    '+
          sOp2                           +' AS VALORBASE2,                    '+
          sOp3                           +' AS VALORBASE3,                    '+
          ''''+    sIdTpPagtoAnt           +''' AS IDTPPAGTOANT,     '+ // FUNCEF - 08.01.2001
          ''''+    sUltMesReajAnt          +''' AS ULTMESREAJANT,    '+ // FUNCEF - 08.01.2001
          ''''+    sFlgBenefMinAnt         +''' AS FLGBENEFMINANT,   '+ // FUNCEF - 08.01.2001
          '''' +   Trim(sDataEventoAnt)    +''' AS DATAEVENTOANT,    '+ // FUNCEF - 08.01.2001
          '''' +   Trim(sCodBeneficioAnt)  +''' AS CODBENEFICIOANT,    '+ // FUNCEF - 08.01.2001
          '''' +   Trim(psDataInicioAnt)   +''' AS DATAINICIOANT,    '+ // FUNCEF - 08.01.2001
          OraNumero(psValorBenefAnt)       +' AS VLBENEFPGTO,        '+ // FUNCEF - 08.01.2001
          OraNumero(psValorBenefAnt)       +' AS VALORBENEFANT,      '+ // FUNCEF - 08.01.2001
       ''''+sFlgInternoAntes            +''' AS FLGINTERNOANT,               '+
       ''''+sFlgInternoAtual            +''' AS FLGINTERNO,                  '+
       ''''+sIdSitPartAntes             +''' AS IDSITPARTATUAL,              '+
       ''''+sIdSitPlanAntes             +''' AS IDSITPLANOATUAL,             '+
       ''''+sIdSitFuncAntes             +''' AS IDSITFUNCATUAL,              '+
       ''''+sIdSitPartDepois            +''' AS IDSITPARTNOVO,               '+
       ''''+sIdSitPlanDepois            +''' AS IDSITPLANONOVO,              '+
       ''''+sIdSitFuncDepois            +''' AS IDSITFUNCNOVO,               '+
          sValorReserva                  +'   AS VALORRESERVA,                '+
          '''' +   Trim(sDataRef)        +''' AS DATAREF,                     '+
          '''' +   Trim(sDataInicio)     +''' AS DATAINICIO,                  '+
          '''' +   sDataInicio+''' AS DATAINICIOFUND,    '+ { Augusto 21/01/2004 }
          '''' +   Trim(sDataInicioINSS) +''' AS DATAINICIOINSS,              '+
          IntToSTr(piFlgTipoInss)        +'   AS FLGTIPOINSS,                 '+
          IntToSTr(Sistema.Idmodulo)     +'   AS IDMODULO,                    '+
          IntToSTr(piNumBenef)           +'   AS NUMBENEF,                    '+
          sFlgBenefCotas                 +'   AS FLGBENEFCOTAS                '+
          psSQLBenefAssoc+

          //leofuncef - 22032004
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP, PESSOAFISICA PF,  SITFUNC SF,  '+
          ' BENEFBFCIARIO BFC '+
          ' WHERE  PP.IDPESSOA    = ' + IntToStr(piIdTitular)   + ' AND '+
          '        PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND '+
          '        PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND '+
          '        EL.IDPESSOA    = PP.IDPESSOA          AND '+
          '        EL.IDPESSJUR   = PP.IDPESSJUR         AND '+
          '        BFC.IDPESSJUR = PP.IDPESSJUR  AND '+
          '        BFC.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + '  AND '+
          '        BFC.IDTITULAR = PP.IDPESSOA AND '+
          '        BFC.IDPESSOA = '+IntToStr(piIdPessoa)+' AND '+
          '        BFC.IDBENEFICIO = '+IntToStr(piIdBeneficio)+'  AND '+
          '        PF.IDPESSOA    = BFC.IDPESSOA         AND '+
          '        EL.IDSITFUNC   = SF.IDSITFUNC(+)      AND '+
          '        PP.IDSITPART    = SP.IDSITPART(+)      ';
          //leofuncef - 22032004
*)

  {---------------------------------------------------------------------------------}
  { Augusto 30/06/2004 - Reformulação na consulta, retirando Tabelas nao usadas e   }
  { acertando filtro de plano para utilizar o plano de origem (que é do Titular)    }

  { OBS.: Apesar desta função tratar beneficios para beneficiario os dados passa-   }
  {       dos do pensionista para a Regra de calculo são Virtuais, os dados "Reais" }
  {       retornados pelas tabelas e os joins são os do Titular do Beneficio. Isso  }
  {       acontece pois no requerimento de beneficio, o registro do beneficio re-   }
  {       querido ainda não esta gravado na hora dos calculos.                      }

  sSQL := sSQL + ' EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,  '+
          '        EL.TEMPOSERVTOTAL,    SP.FLGINTERNO,                          '+
          '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA,                       '+
          '        EL.FLGDIRETOR,                                                '+
          OraNumero(FloatToStr(pdPercProvisorio))  + ' AS PERCPROVISORIO,  '+// CAMILLE - 19.04.2004
          OraNumero(IntToStr  (piFlgProvisorio))   + ' AS FLGPROVISORIO,   '+// CAMILLE - 19.04.2004
          OraNumero(IntToStr  (piPrazoProvisorio)) + ' AS PRAZOPROVISORIO, '+// CAMILLE - 19.04.2004
          // COMENTEI AS LINHAS ABAIXO POIS NO REQUERIMENTO A BENEFBFCIARIO AINDA NÃO EXISTE
          { Augusto 10/03/2004 }
          //'        BFC.FLGPROVISORIO, BFC.PRAZOPROVISORIO, '+
          IntToStr(piIdTitular)           +' AS IDTITULAR,                     '+
          IntToStr(piIdPessoa)            +' AS IDPESSOA,                      '+
          ''''+psIdDependencia            +''' AS IDDEPENDENCIA,               '+
          OraNumero(psPercentual)         +' AS PERCENTUAL,                    '+
          IntToStr(piIdBeneficio)         +' AS IDBENEFICIO,                   '+
          IntToStr(piNumeroProcesso)      +' AS NUMEROPROCESSO,                '+
          ''''+sDataInscFund              +''' AS INSCRICAODATAFUND ,          '+
          OraNumero(psValorTotal)         +  ' AS VALORTOTAL,                  '+
          OraNumero(psValorInfINSS)       +' AS VLRINFINSS,                    '+
          OraNumero(psValorCalcINSS)      +' AS VLRCALCINSS,                   '+
          OraNumero(sVlrINSSTotal)        +' AS VLRTOTALINSS,                  '+ { Augusto 30/10/2003 }
          sSALPART                        +' AS VALORPROVENTO,                 '+
          sREMTOTAL                       +' AS VALORREMTOTAL,                 '+
          sOp1                            +' AS VALORBASE1,                    '+
          sOp2                            +' AS VALORBASE2,                    '+
          sOp3                            +' AS VALORBASE3,                    '+
          ''''+    sIdTpPagtoAnt          +''' AS IDTPPAGTOANT,     '+ // FUNCEF - 08.01.2001
          ''''+    sUltMesReajAnt         +''' AS ULTMESREAJANT,    '+ // FUNCEF - 08.01.2001
          ''''+    sFlgBenefMinAnt        +''' AS FLGBENEFMINANT,   '+ // FUNCEF - 08.01.2001
          '''' +   Trim(sDataEventoAnt)   +''' AS DATAEVENTOANT,    '+ // FUNCEF - 08.01.2001
          '''' +   Trim(sCodBeneficioAnt) +''' AS CODBENEFICIOANT,    '+ // FUNCEF - 08.01.2001
          '''' +   Trim(psDataInicioAnt)  +''' AS DATAINICIOANT,    '+ // FUNCEF - 08.01.2001
          OraNumero(psValorBenefAnt)      +' AS VLBENEFPGTO,        '+ // FUNCEF - 08.01.2001
          OraNumero(psValorBenefAnt)      +' AS VALORBENEFANT,      '+ // FUNCEF - 08.01.2001
       ''''+sFlgInternoAntes              +''' AS FLGINTERNOANT,               '+
       ''''+sFlgInternoAtual              +''' AS FLGINTERNO,                  '+
       ''''+sIdSitPartAntes               +''' AS IDSITPARTATUAL,              '+
       ''''+sIdSitPlanAntes               +''' AS IDSITPLANOATUAL,             '+
       ''''+sIdSitFuncAntes               +''' AS IDSITFUNCATUAL,              '+
       ''''+sIdSitPartDepois              +''' AS IDSITPARTNOVO,               '+
       ''''+sIdSitPlanDepois              +''' AS IDSITPLANONOVO,              '+
       ''''+sIdSitFuncDepois              +''' AS IDSITFUNCNOVO,               '+
          sValorReserva                   +'   AS VALORRESERVA,                '+
          '''' +   Trim(sDataRef)         +''' AS DATAREF,                     '+
          '''' +   Trim(sDataInicio)      +''' AS DATAINICIO,                  '+
          '''' +   sDataInicio            +''' AS DATAINICIOFUND,    '+ { Augusto 21/01/2004 }
          '''' +   Trim(sDataInicioINSS)  +''' AS DATAINICIOINSS,              '+
          IntToSTr(piFlgTipoInss)         +'   AS FLGTIPOINSS,                 '+
          IntToSTr(Sistema.Idmodulo)      +'   AS IDMODULO,                    '+
          IntToSTr(piNumBenef)            +'   AS NUMBENEF,                    '+
          sFlgBenefCotas                  +'   AS FLGBENEFCOTAS                '+
          psSQLBenefAssoc+
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP, PESSOAFISICA PF,  SITFUNC SF'+

          { Augusto 30/06/2004 - Comentado }
          //' BENEFPLANOPART BPL, BENEFBFCIARIO BFC '+ { Augusto 10/03/2004 }

          ' WHERE  PP.IDPESSOA    = ' + IntToStr(piIdTitular)   + ' AND '+
          '        PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND '+
          // CAMILLE - 18.06.2004 - retirei o comentario do leo
          //leoprovisorio
          { Augusto 30/06/2004 }
          //'        PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev)   + ' AND '+
          '        PP.IDPLANOPREV = ' + sPlanoOrigem + ' AND '+

          '        PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND '+
          '        EL.IDPESSOA    = PP.IDPESSOA          AND '+
          '        EL.IDPESSJUR   = PP.IDPESSJUR         AND '+
          '        PF.IDPESSOA    = EL.IDPESSOA          AND '+
          '        EL.IDSITFUNC   = SF.IDSITFUNC(+)      AND '+
          '        SP.IDSITPART    = PP.IDSITPART(+)         ';

          { Inicio Augusto 30/06/2004 - Comentado }

          //'        PP.IDPESSOA    = BPL.IDPESSOA(+)      AND '+
          //'        PP.IDPESSJUR   = BPL.IDPESSJUR(+)     AND '+
          //'        PP.IDPLANOPREV = BPL.IDPLANOPREV(+)   AND '+
          { Augusto 10/03/2004 }

          //'        BPL.IDPESSJUR   = BFC.IDPESSJUR(+)    AND '+
          //'        BPL.IDPESSOA    = BFC.IDTITULAR(+)    AND '+
          //'        BPL.IDPESSOA    = BFC.IDPESSOA(+)     AND '+
          //'        BPL.IDPLANOPREV = BFC.IDPLANOPREV(+)  AND '+
          //'        BPL.SEQPROPOSTA = BFC.SEQPROPOSTA(+)  AND '+
          //'        BPL.IDBENEFICIO = BFC.IDBENEFICIO(+)   ';
          { Fim Augusto 26/03/2004 }

          { Fim Augusto 30/06/2004 - Comentado }


  sValorBeneficio := RegraNumerica(IntToStr(piIdRegraCalculo),sSQL, bErro, piIdCalculo );

  if bErro
   then begin
     bErro := True;
     sMsgErro := ' Ocorreu um erro na Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+') ';
     Result  := 0;
     Exit;
  end;

  if Trim(sValorBeneficio) = ''
  then begin
     bErro := True;
     sMsgErro := ' A Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+')'+
                 ' retornou um valor em branco. ';
     Result  := 0;
     Exit;
  end;

  try
     rValorBeneficio := StrToFloat(ClienteNumero(sValorBeneficio));
  except
     bErro := True;
     sMsgErro := ' A Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+')' +
                 ' retornou um valor inválido. [Valor Retornado = '+sValorBeneficio+']';
     Result  := 0;
     Exit;
  end;
  bErro := False;
  sMsgErro := ' ';
  Result := rValorBeneficio;
end;

function ExecutaRegraPrimUltPagtoBenef(qryAux : TwwQuery;
                                    piIdRegraPrimUltPagto,
                                    piIdTitular, piIdBeneficiario, piSeqProposta,
                                    piIdPessJur, piIdPlanoPrev,
                                    piIdBeneficio,  piTotBeneficiarios : longint;
                                    psDataInicio, psDataFinal,psValorTotal, psPrimUltPagto : string;
                                    var bErro : boolean;
                                    var sMsgErro : string) : double;

var sSQL,
    sDataRef,
    sValorBeneficio : string;
    iIdCalculo : longint;
    rValorBeneficio : double;
begin
  Result := -1;
  bErro  := False;

  psDataInicio := Trim(psDataInicio);
  psDataFinal  := Trim(psDataFinal);
  if Trim(psValorTotal) = '' then psValorTotal := '0';

  if piIdRegraPrimUltPagto <=0
  then begin
     // CHAMAR REGRA DE PRO-RATA ULTIMO OU PRIMEIRO
     if UpperCase(Trim(psPrimUltPagto)) = 'PRIMEIRO'
     then rValorBeneficio := ValorProRataPrimeiro(psValorTotal, psDataInicio)
     else rValorBeneficio := ValorProRataUltimo(psValorTotal, psDataFinal);

     Result := rValorBeneficio;
     Exit; // Supor que ele nao quer executar a regra
  end;

  if UpperCase(Trim(psPrimUltPagto)) = 'PRIMEIRO'
  then sDataRef := psDataInicio
  else begin
     // regra de ultimo pagamento
     // Passar data final como data ref
     // Se data inicio nao for no mesmo mes que a data final,
     // passar o 1o. dia do mes da data final como data inicio
     // CAMILLE - 23.01.2003 - PROVISORIO
     if (psDataInicio <> '') and (psDataFinal <> '') and
        ( Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2) <>
          Copy(psDataFinal,7,4) +'/'+Copy(psDataFinal,4,2) ) and
        (
          (Pos('FCRT',Sistema.NomeEmpresa) <= 0 ) or (Pos('BRTPREV',Sistema.NomeEmpresa) <= 0 ) // CAMILLE - 13.07.2004
         )
     then psDataInicio := '01/'+Copy(psDataFinal,4,2)+'/'+Copy(psDataFinal,7,4);
     sDataRef := psDataFinal;
  end;

  if Trim(psDataFinal)  = ''  then psDataFinal  := '          ';
  if Trim(psDataInicio) = ''  then psDataInicio := '          ';
  if Trim(sDataRef)     = ''  then sDataRef     := '          ';

  { Augusto 14/11/2003 - Retirada da BENEFPLANPREV, problemas com migração de  }
  { plano dos beneficiarios.                                                   }
  sSQL := ' SELECT 1 AS FLGCONCESSAO, PP.INSCRICAODATA, PP.DTINICIOINSC, ' +
          '''' + sDataRef    + ''''    + ' AS DATAREF,     ' +
          '''' + psDataInicio+ ''''    + ' AS DATAINICIO,  ' +
          '''' + psDataFinal + ''''    + ' AS DATAFINAL,   ' +
          IntToStr(piIdTitular)      + ' AS IDTITULAR,     ' +
          IntToStr(piIdBeneficiario) + ' AS IDPESSOA,      ' +
          IntToStr(piIdPessJur)      + ' AS IDPESSJUR,     ' +
          IntToStr(piIdPlanoPrev)    + ' AS IDPLANOPREV,   ' +
          IntToStr(piIdBeneficio)    + ' AS IDBENEFICIO,   ' +
          IntToStr(piSeqProposta)    + ' AS SEQPROPOSTA,   ' +
          IntToStr(piTotBeneficiarios) + ' AS NUMBENEF,    ' +
          OraNumero(psValorTotal)    + ' AS VALORPREV,     ' +
          OraNumero(psValorTotal)    + ' AS VALORATUAL,    ' +
          OraNumero(psValorTotal)    + ' AS VALORREFERENCIA '+
          //' FROM BENEFPLANPREV BF, PARTPREVPLAN PP ' +
          ' FROM PARTPREVPLAN PP ' +
          //' WHERE BF.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev)  + ' AND ' +
          ' WHERE ' +
          //'       BF.IDBENEFICIO = ' + IntToStr(piIdBeneficio)  + ' AND ' +
          '       PP.IDPESSOA    = ' + IntToStr(piIdTitular)    + ' AND ' +
          '       PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)    + ' AND ' +
          '       PP.SEQPROPOSTA = ' + IntToSTr(piSeqProposta)  + '     ' ;

          //+'       PP.IDPLANOPREV = BF.IDPLANOPREV ';

  sValorBeneficio := RegraNumerica(IntToStr(piIdRegraPrimUltPagto),sSQL, bErro, iIdCalculo );

  if bErro
  then begin
     bErro := True;
     sMsgErro := ' Ocorreu um erro na Regra de '+psPrimUltPagto+' Pagamento do Benefício (nº '+IntToStr(piIdRegraPrimUltPagto)+') ';
     Result  := -1;
     Exit;
  end;

  if Trim(sValorBeneficio) = ''
  then begin
     bErro := True;
     sMsgErro := ' A Regra de '+psPrimUltPagto+ ' Pagamento do Benefício (nº '+IntToStr(piIdRegraPrimUltPagto)+')'+
                 ' retornou um valor em branco. ';
     Result  := -1;
     Exit;
  end;

  try
     rValorBeneficio := StrToFloat(ClienteNumero(sValorBeneficio));
  except
     bErro := True;
     sMsgErro := ' A Regra de '+psPrimUltPagto+' Pagamento do Benefício (nº '+IntToStr(piIdRegraPrimUltPagto)+')' +
                 ' retornou um valor inválido. [Valor Retornado = '+sValorBeneficio+']';
     Result  := -1;
     Exit;
  end;
  bErro := False;
  sMsgErro := ' ';
  Result := rValorBeneficio;
end; //ExecutaRegraPrimPagtoBenef

function PreparaStrRegra( str : string ) : string;
begin
   if Trim(str) = ''
   then Result := ' '
   else Result := str;
end;

function BuscaDadosBeneficioAnterior ( qry : TwwQuery;
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
                                           pbAlteraDataInicioEValor : boolean;
                                           piIdPessoa : Integer = -1 ) : boolean;
var iNumeroProcessoEncontrado : longint;
    //P.RAMOS - 13.07.2001 - REFER
    dValorIntegral,
    dValorTotal               : double;
    psDataInicioAtualDB2      : String ;
    iNumDiasBenefAnt          : word;
begin
  Result := False;

  { Augusto 11/02/2004  }
  If piIdPessoa = -1 Then piIdPessoa := piIdTitular;

  // CAMILLE - 25.05.2004 - PENDENCIA 16254
  iNumDiasBenefAnt := BuscaNumDiasBenefAnterior ( qry,
                                                  piIdPlanoPrev,
                                                  piIdBeneficioAtual );

  with qry do
  begin
     // CAMILLE - REFER - 02.03.2001
     // Lise - Retirada no BF.DATAFINAL+1 do '+1' e criada variável
     // psDataInicioAtualDB2 para DB2.

     Close;
     SQL.Clear;
     SQL.Add(' SELECT P.DTEVENTO,          P.NUMEROPROCESSO, BP.FLGREFERENCIA,    '+
             '        BF.IDBENEFICIO,      BF.DATAINICIO,   BF.DATAINICIOINSS,    '+
             '        BF.NUMPROCINSS,                                             '+
             '        BF.IDTPPAGTOBENEFIC, BF.FLGBENEFMIN,   BF.ULTMESREAJUSTE,   '+
             '        BF.VALORATUAL,       B.NOME,                                '+
             '        BPP.VALORBASE1,      BPP.VALORBASE2,     BPP.VALORBASE3,     '+
             '        BP.FLGPAGAINSS '+ { Augusto 02/06/2004 }
             ' FROM   PROCESSOBENEF P,     BENEFPLANOPART BPP, BENEFBFCIARIO BF,  '+
             '        BENEFPLANPREV BP,    BENEFICIO B                            '+
             ' WHERE  (BF.IDPESSJUR       = '+IntToStr(piIdPessJur)    +')'+
             ' AND    (BF.IDPLANOPREV     = '+IntToStr(piIdPLANOPREV)  +')'+

             //' AND    (BF.IDPESSOA        = '+IntToStr(piIdTitular)    +')'+
             ' AND    (BF.IDPESSOA        = '+IntToStr(piIdPessoa)      +')'+ { Augusto 11/02/2004 }
             ' AND    (BF.IDTITULAR       = '+IntToStr(piIdTitular)    +')'+
             ' AND    (BF.IDBENEFICIO     <> '+IntToStr(piIdBeneficioAtual) +')'+
             ' AND    (BF.DATAINICIO      <= TO_DATE('''+ psDataInicioAtual +''',''DD/MM/YYYY''))');

             //P.RAMOS - REFER - 03.07.2001
             // ESTA ROTINA DEVE IDENTIFICAR BENEFICIO ANTERIOR DE CONVERSAO.
             // PORTANTO A DATA FINAL DO BENEFICIO ANTERIOR DEVE SER UM DIA ANTES
             // DA DATA INICIO DO BENEFICIO A SER REQUERIDO/CONCEDIDO
     // CAMILLE - 25.05.2004 - PENDENCIA 16254
     //     psDataInicioAtualDB2 := DateToStr((StrToDate(psDataInicioAtual) -  1)) ;
     psDataInicioAtualDB2 := DateToStr((StrToDate(psDataInicioAtual) -  iNumDiasBenefAnt)) ;

     SQL.Add(' AND   ((BF.DATAFINAL   >= TO_DATE('''+(psDataInicioAtualDB2)+''',''DD/MM/YYYY'') ) '+
             '     OR (BF.DATAFINAL   = TO_DATE('''+psDataInicioAtual+''',''DD/MM/YYYY'') )  ');

             //P.RAMOS ATÉ AQUI
     if sTipoTelaBenef = 'SI'
     then SQL.Add(' OR (BF.DATAFINAL IS NULL ) ');


     SQL.Add(' ) '+
             ' AND    (BF.IDPLANOPREV     = BP.IDPLANOPREV)   '+
             ' AND    (BF.IDBENEFICIO     = BP.IDBENEFICIO)   '+
             ' AND    (BF.NUMEROPROCESSO  = P.NUMEROPROCESSO) '+
             ' AND    (BP.FLGREFERENCIA   = '+IntToStr(piFlgReferenciaAtual)+')'+
             ' AND    (BP.IDBENEFICIO     = B.IDBENEFICIO)  '+
             ' AND    (BPP.IDPESSJUR(+)   = BF.IDPESSJUR)   '+
             ' AND    (BPP.IDPLANOPREV(+) = BF.IDPLANOPREV) '+
             ' AND    (BPP.IDPESSOA(+)    = BF.IDPESSOA)    '+
             ' AND    (BPP.SEQPROPOSTA(+) = BF.SEQPROPOSTA) '+
             ' AND    (BPP.IDBENEFICIO(+) = BF.IDBENEFICIO) '+
             ' ORDER BY BF.DATAINICIO DESC ' );
     Open;

     qry.First;
     if not qry.IsEmpty
     then begin
        if pbAlteraDataInicioEValor or (sTipoTelaBenef = 'SI')
        then begin
           if piFlgReferenciaAtual = 1 // CAMILLE - 24.06.2003
           then psDataInicioAnt := qry.FieldByName('DATAINICIOINSS').asString
           else psDataInicioAnt := qry.FieldByName('DATAINICIO').asString;

           psDataEventoAnt := qry.FieldbyName('DTEVENTO').AsString;
           psValorAnt      := OraNumero(qry.FieldByName('VALORATUAL').asString);
           dValorTotal     := qry.FieldByName('VALORATUAL').AsFloat;
           //P.RAMOS - 13.07.2001 - REFER
           dValorIntegral  := PegaValorIntegral( dtmAPrev.qryAux2,
                                                 qry.FieldByName('NumeroProcesso').AsInteger,
                                                 qry.FieldByName('IdBeneficio').AsInteger,
                                                 piIdTitular,
                                                 psDataInicioAtual);

        end;

        psNomeBenefAnt     := qry.FieldbyName('NOME').AsString;
        psIdTpPagtoAnt     := qry.FieldbyName('IDTPPAGTOBENEFIC').AsString;
        psUltMesReajAnt    := qry.FieldbyName('ULTMESREAJUSTE').AsString;
        psFlgBenefMinAnt   := qry.FieldbyName('FLGBENEFMIN').AsString;
        psCodBeneficioAnt  := qry.FieldbyName('IDBENEFICIO').AsString;
        psValorBase1       := qry.FieldbyName('VALORBASE1').AsString;
        psValorBase2       := qry.FieldbyName('VALORBASE2').AsString;
        psValorBase3       := qry.FieldbyName('VALORBASE3').AsString;
        psNumProcINSS      := qry.FieldbyName('NUMPROCINSS').AsString;

        if pbAlteraDataInicioEValor
        then begin
           iNumeroProcessoEncontrado := qry.FieldbyName('NUMEROPROCESSO').AsInteger;
           qry.Next;
           while not qry.Eof do
           begin
              if (qry.FieldbyName('NumeroProcesso').AsInteger = iNumeroProcessoEncontrado) and
                 (qry.FieldbyName('FLGREFERENCIA').AsInteger  = piFlgReferenciaAtual)
              then begin
                 dValorTotal     := dValorTotal + qry.FieldByName('VALORATUAL').AsFloat;
                 //P.RAMOS - 13.07.2001 - REFER
                 dValorIntegral  := dValorIntegral+ PegaValorIntegral( dtmAPrev.qryAux2,
                                                                       qry.FieldByName('NumeroProcesso').AsInteger,
                                                                       qry.FieldByName('IdBeneficio').AsInteger,
                                                                       piIdTitular,
                                                                       psDataInicioAtual );

              end;
              qry.Next;
           end;

           //P.RAMOS - 13.07.2001 - REFER
           if dvalorintegral > 0
           then psValorAnt:=OraNumero(FloatToStr(dvalorintegral))
           else psValorAnt:=OraNumero(FloatToStr(dValorTotal));
        end;
     end
     else begin
        if pbAlteraDataInicioEValor
        then begin
           psDataInicioAnt := '';
           psValorAnt      := '0';
           psDataEventoAnt := '';
        end;
        psNomeBenefAnt     := '';
        psIdTpPagtoAnt     := '';
        psUltMesReajAnt    := '';
        psFlgBenefMinAnt   := '';

        psCodBeneficioAnt  := '';
        psValorBase1       := '0';
        psValorBase2       := '0';
        psValorBase3       := '0';
        psNumProcINSS      := '';
     end;
     //Close;
  end;

  { Inicio Augusto 02/06/2004 - Caso INSS pago, verificar data e valor anterior }
  { na BENEFBFCIARIO                                                            }
  FazQuery(Qry,'SELECT BF.VALORBENEFANT, BF.DIBBENEFANT, BP.FLGREFERENCIA, '+
               '       BP.FLGPAGAINSS '+
               'FROM BENEFBFCIARIO BF, BENEFPLANPREV BP '+
               'WHERE (BF.IDPESSJUR   ='+ IntToStr(piIdPessJur)+')'+
               '  AND (BF.IDPLANOPREV ='+ IntToStr(piIdPlanoPrev)+')'+
               '  AND (BF.IDTITULAR   ='+ IntToStr(piIdTitular)+')'+
               //'  AND (BF.SEQPROPOSTA  ='+ IntToStr(piSeqProposta)+')'+
               //'  AND (BF.IDPESSOA    ='+ IntToStr(piIdPessoa)+')'+
               '  AND (BF.IDBENEFICIO ='+ IntToStr(piIdBeneficioAtual)+')'+
               '  AND (BF.IDPLANOPREV = BP.IDPLANOPREV)'+
               '  AND (BF.IDBENEFICIO = BP.IDBENEFICIO)');
  If (Not Qry.IsEmpty) And
     (Qry.FieldbyName('FLGREFERENCIA').AsInteger = 1) And
     (Qry.FieldbyName('FLGPAGAINSS').AsInteger = 1)
  Then begin
    psDataInicioAnt := Qry.FieldByName('DIBBENEFANT').AsString;
    psValorAnt      := Qry.FieldByName('VALORBENEFANT').AsString;
    Qry.Close;
  End;
  { Fim Augusto 02/06/2004 }

  Result := True;
end;

function  MontaSQLBenefAssoc (qryBenefAux: TwwQuery; piNumOrdem : longint) : string;
var sValor,
    sSQL : string;

    iNumBenefAssoc : integer;
begin
   Result := '';

   iNumBenefAssoc := 0;
   qryBenefAux.First;
   while not qryBenefAux.Eof do
   begin
      if qryBenefAux.FieldByName('NumOrdemEvento').AsInteger >= piNumOrdem
      then begin
         qryBenefAux.Next;
         continue;
      end;
      inc(iNumBenefAssoc);

      if qryBenefAux.FieldByName('FlgCalcTodoMes').AsInteger = 1
      then begin
         if Trim(qryBenefAux.FieldByName('VALORCOTAS').AsString) <> ''
         then sValor := qryBenefAux.FieldByName('VALORCOTAS').AsString
         else sValor := '0';
      end
      else begin
         if Trim(qryBenefAux.FieldByName('VALORATUAL').AsString) <> ''
         then sValor := qryBenefAux.FieldByName('VALORATUAL').AsString
         else sValor := '0';
      end;

      sSQL := sSQL +','+OraNumero(sValor)+' AS VALORASSOCIADO'+IntToStr(iNumBenefAssoc);

      if Trim(qryBenefAux.FieldByName('VALORBASE1').AsString) <> ''
      then sValor := qryBenefAux.FieldByName('VALORBASE1').AsString
      else sValor := '0';
      sSQL := sSQL +','+OraNumero(sValor)+' AS ASSOC'+IntToStr(iNumBenefAssoc)+'OP1';

      if Trim(qryBenefAux.FieldByName('VALORBASE2').AsString) <> ''
      then sValor := qryBenefAux.FieldByName('VALORBASE2').AsString
      else sValor := '0';
      sSQL := sSQL +','+OraNumero(sValor)+' AS ASSOC'+IntToStr(iNumBenefAssoc)+'OP2';

      if Trim(qryBenefAux.FieldByName('VALORBASE3').AsString) <> ''
      then sValor := qryBenefAux.FieldByName('VALORBASE3').AsString
      else sValor := '0';
      sSQL := sSQL +','+OraNumero(sValor)+' AS ASSOC'+IntToStr(iNumBenefAssoc)+'OP3';
      qryBenefAux.Next;
   end; //while
   Result := sSQL;
end; //MontaSQLBenefAssoc

function ExecutaRegraCalculoSRB(qryAux : TwwQuery;
                                piIdRegraCalculo, 
                                piIdPessJur, piIdPlanoPrev, piIdTitular,
                                piSeqProposta, piIdBeneficio, piNumeroProcesso,
                                piIdSitFunc, piIdSitPart, piIdSitPlano : longint;
                                prOpcao1, prOpcao2, prOpcao3           : double;
                                psSQLBenefAssoc,
                                psDataEvento, psDataInicio, psDataInicioINSS,
                                psDataInicioPagto,
                                psDataRequerimento,
                                psValorInfINSS,
                                psValorCalcINSS,
                                psValorReserva      : string;
                                bBeneficioGrupo     : boolean;
                                piFlgTipoInss       : integer;
                                psDataInicioAnt,
                                psValorBenefAnt,
                                psVALORBINSSANT1,
                                psVALORBINSSANT2,
                                psVALORBINSSANT3    : string;
                                var bErro           : boolean;
                                var sMsgErro        : string;
                                var piIdCalculo     : longInt;
                                piFlgPossuiAcompINSS : integer) : double;
var
  sDataInicio,
  sDataInicioINSS,
  sDataRef,
  sOp1, sOp2, sOP3,
  sSQL,


  sSALPART,         sREMTOTAL,
  sValorBeneficio,  sDataInscFund,
  sValorReserva,
  sAnoMesRef      : string;
  rValorBeneficio,
  dSomaItemNaDIB,
  dSomaItemNoPBC  : double;

  // Dados necessários do benefício anterior
  sDataInicioAnt,  // var. auxiliar apenas para passar para a funcao. A var. utilizada é a psDataInicioAnt
  sValorAnt,       // var. auxiliar apenas para passar para a funcao. A var. utilizada é a psValorBenefAnt
  sNomeBenefAnt,
  sIdTpPagtoAnt,
  sFlgBenefMinAnt,
  sDataEventoAnt,
  sCodBeneficioAnt,
  sUltMesReajAnt,
  sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
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
  slValorBase3INSS  : string;

  sAux : String;
begin
  Result := -1;
  if piIdRegraCalculo <= 0 then Exit;

  // Para a regra de calculo, DATAINICIO = DIB - DATA DE DIREITO = (QUASE SEMPRE) DATA DO EVENTO
  //                          DATAREF    = DATA DO EVENTO

  if Trim(psDataEvento)      = '' then psDataEvento      := DateToStr(date);
  if Trim(psDataInicio)      = '' then psDataInicio      := DateToStr(date);
  if Trim(psDataInicioINSS)  = '' then psDataInicioINSS  := DateToStr(date);
  if Trim(psDataInicioPagto) = '' then psDataInicioPagto := DateToStr(date);

  sDataInicio     := psDataInicio;
  sDataInicioINSS := psDataInicioINSS;
  sDataRef        := psDataEvento;

  sAnoMesRef := Copy(psDataEvento,7,4) + '/' + Copy(psDataEvento,4,2);

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
                                //sValorBase1, sValorBase2, sValorBase3,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant, //leocm - 31102002 - estava zerando os valoresbase
                                sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
                                False);

  if psValorInfInss <> ''
  then psValorInfINSS := OraNumero(Trim(psValorInfINSS))
  else psValorInfINSS := '0';

  sSALPART  := ORANUMERO(CalcSalPart( piIdPessJur,
                                      piIdTitular,
                                      SAnoMesAnterior(sAnoMesRef),
                                      qryAux));
  sREMTOTAL := ORANUMERO(CalcREMTOTAL( piIdPessJur,
                                       piIdTitular,
                                       SAnoMesAnterior(sAnoMesRef),
                                       qryAux));

  sDataInscFund := CalcDataInscFund(piIdPessJur, piIdPlanoPrev, piIdTitular,
                                    piSeqProposta,qryAux);


  if Trim(sDataInscFund) = ''
  then sDataInscFund := DateToStr(Date);

  if Trim(psValorInfINSS)  = '' then psValorInfINSS  := '0';
  if Trim(psValorCalcINSS) = '' then psValorCalcINSS := '0';
  if Trim(sSalPart)        = '' then sSalPart        := '0';
  if Trim(sRemTotal)       = '' then sRemTotal       := '0';

  if prOpcao1 >= 0
  then sOp1 := OraNumero(FloatToStr(prOpcao1))
  else sOp1 := '0';

  if prOpcao2 >= 0
  then sOp2 := OraNumero(FloatToStr(prOpcao2))
  else sOp2 := '0';

  if prOpcao3 >= 0
  then sOp3 := OraNumero(FloatToStr(prOpcao3))
  else sOp3 := '0';

  sDataEventoAnt := BuscaUltimoEvento( qryAux,
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdTitular,   piSeqProposta,
                                       psDataEvento,
                                       'DATAEVENTO');


  if Trim(sValorReserva) = ''      then sValorReserva := '0';
  if Trim(sDataRef) = ''           then sDataRef := DateToStr(Date);

  if Trim(psValorBenefAnt) = ''     then psValorBenefAnt := '0';

  if Trim(psDataRequerimento) = '' then psDataRequerimento := DateToStr(Date);
  if Trim(sDataEventoAnt) = ''     then sDataEventoAnt := DateToStr(Date);


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
        bErro := True;
        sMsgErro := ' Ocorreu um erro na geração do Resumo Funcional. ';
        Result  := -1;
        Exit;
     end;
     dSomaItemNaDib := CalculaTotalResumoFuncional ( piIdPessJur, piIdTitular,dSomaItemNoPBC );
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
     then iTotalBenef := 0
     else iTotalBenef := FieldByName('TOTALDEPENDENTES').AsInteger;
  end;

  // Verificar se o beneficio de INSS já foi requerido.
  // Se sim, entao trazer os dados do INSS já preenchidos
  BuscaINSSEmVigor ( qryAux,
                     piIdPessJur, piIdPlanoPrev, piIdTitular,
                     piIdTitular,
                     piIdBeneficio,
                     psDataInicio,
                     slValorCalcINSS,
                     slValorInfINSS,
                     slDataInicioINSS,
                     slNumProcINSS,
                     slValorBase1INSS,
                     slValorBase2INSS,
                     slValorBase3INSS,
                     sAux);


  if Trim(psSQLBenefAssoc) = ''
  then psSQLBenefAssoc := ', 0 AS VALORASSOCIADO, 0 AS ASSOC1OP1, 0 AS ASSOC2OP1, 0 AS ASSOC3OP1, '+
                          '                       0 AS ASSOC1OP2, 0 AS ASSOC2OP2, 0 AS ASSOC3OP2, '+
                          '                       0 AS ASSOC1OP3, 0 AS ASSOC2OP3, 0 AS ASSOC3OP3  ';

  // Executa Regra de Cálculo do Valor do Beneficio
  sSQL := ' SELECT DISTINCT  1 FLGCONCESSAO, '+ //leocm - 20062002 - adicionei flgconcessao
          '        PP.SEQPROPOSTA,  '+ //leocm - 25062002 - adicionei seqproposta  
          '        PP.IDPESSOA, PP.IDPESSJUR,     PP.IDPLANOPREV,   PP.INSCRICAODATA, '+
          '        PP.INSCRICAOTIPO,     PP.DTINICIOINSC,  PF.DATANASC,      PF.SEXO,          '+
          '        PF.DATAMORTE,         PP.IDPESSOA AS IDTITULAR,                             '+
          '        EL.SALTOTAL,          EL.DATAADMISSAO,  EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,  '+
          '        EL.TEMPOSERVTOTAL,    EL.DATADEMISSAO,  EL.FLGDIRETOR,        SP.FLGINTERNO,                         '+
          '        EL.TEMPOSERVTOTMES,   EL.TEMPOSERVTOTDIA,                                     '+
          '        PP.IDPESSOA AS IDTITULAR,                                                   '+
          IntToStr(piFlgPossuiAcompINSS)+' AS FLGPOSSUIACOMPINSS,                              '+
          IntToSTr(piIdBeneficio)    +  ' AS IDBENEFICIO ,                                     '+
          IntToSTr(piNumeroProcesso) +  ' AS NUMEROPROCESSO ,                                  '+
          IntToStr(piIdBeneficio)    +  ' AS IDBENEFICIO,                                      '+
          IntToStr(piNumeroProcesso) +  ' AS NUMEROPROCESSO,                                   '+
          ''''+sDataInscFund         +''' AS INSCRICAODATAFUND ,                               '+
          OraNumero(psValorCalcINSS) +  ' AS VLRCALCINSS,                                      '+
          OraNumero(psValorInfINSS)  +  ' AS VLRINFINSS,                                       '+
          sSALPART                   +  ' AS VALORPROVENTO,                                    '+
          sREMTOTAL                  +  ' AS VALORREMTOTAL,                                    '+
          sOp1                       +  ' AS VALORBASE1,                                       '+
          sOp2                       +  ' AS VALORBASE2,                                       '+
          sOp3                       +  ' AS VALORBASE3,                                       '+
          sValorReserva              +  ' AS VALORRESERVA,                                     '+
          IntToStr(piIdSitFunc)      +  ' AS IDSITFUNC,                                        '+
          IntToStr(piIdSitFunc)      +  ' AS IDSITFUNCATUAL,                                   '+
          IntToStr(piIdSitFunc)      +  ' AS IDSITFUNCNOVO,                                    '+
          IntToStr(piIdSitPart)      +  ' AS IDSITPART,                                        '+
          IntToSTr(piIdSitPlano)     +  ' AS IDSITPLANOPREV ,                                  '+
          IntToStr(piIdSitFunc)      +  ' AS IDSITFUNCATUAL,                                   '+
          IntToStr(piIdSitPart)      +  ' AS IDSITPARTATUAL,                                   '+
          IntToSTr(piIdSitPlano)     +  ' AS IDSITPLANOATUAL ,                                 '+
          IntToSTr(piFlgTipoInss)    +  ' AS FLGTIPOINSS,                                      '+
          '''' +   Trim(sDataRef)    +''' AS DATAREF,                                          '+
          '''' +   Trim(sDataInicio) +''' AS DATAINICIOFUND,  '+ { Augusto 20/11/2003 }
          '''' +   Trim(psDataInicioPagto) +''' AS DATAINICIO,                                 '+
          '''' +   Trim(sDataInicioINSS)   +''' AS DATAINICIOINSS,   '+
          '''' +   Trim(psDataInicioPagto) +''' AS DATAINICIOPAGTO,  '+
          '''' +   Trim(psDataRequerimento)+''' AS DATAREQUERIMENTO, '+
          ''''+    sIdTpPagtoAnt           +''' AS IDTPPAGTOANT,     '+ // FUNCEF - 08.01.2001
          ''''+    sUltMesReajAnt          +''' AS ULTMESREAJANT,    '+ // FUNCEF - 08.01.2001
          ''''+    sFlgBenefMinAnt         +''' AS FLGBENEFMINANT,   '+ // FUNCEF - 08.01.2001
          '''' +   Trim(sDataEventoAnt)    +''' AS DATAEVENTOANT,    '+ // FUNCEF - 08.01.2001
          '''' +   Trim(sCodBeneficioAnt)  +''' AS CODBENEFICIOANT,  '+ // FUNCEF - 08.01.2001
          '''' +   Trim(psDataInicioAnt)   +''' AS DATAINICIOANT,    '+ // FUNCEF - 08.01.2001
          OraNumero(psValorBenefAnt)       +' AS VLBENEFPGTO,        '+ // FUNCEF - 08.01.2001
          OraNumero(psValorBenefAnt)       +' AS VALORBENEFANT,      '+ // FUNCEF - 08.01.2001
          OraNumero(psVALORBINSSANT1)      +' AS VALORBINSSANT1,     '+ // FUNCEF - 20.02.2001
          OraNumero(psVALORBINSSANT2)      +' AS VALORBINSSANT2,     '+ // FUNCEF - 20.02.2001
          OraNumero(psVALORBINSSANT3)      +' AS VALORBINSSANT3,     '+ // FUNCEF - 20.02.2001
          IntToStr(iTotalBenef)            +' AS NUMBENEF,           '+ // FUNCEF - 02.02.2001
          OraNumero(slValorBase1INSS)      +' AS VALORBASE1INSS,     '+
          OraNumero(slValorBase2INSS)      +' AS VALORBASE2INSS,     '+
          OraNumero(slValorBase3INSS)      +' AS VALORBASE3INSS,     '+
          OraNumero(FloatToStr(dSomaItemNoPBC))+' AS SOMAITEMNOPBC,  '+ // SRB
          OraNumero(FloatToStr(dSomaItemNaDIB))+' AS SOMAITEMNADIB   '+ // SRB
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

  sValorBeneficio := RegraNumerica(IntToStr(piIdRegraCalculo),sSQL  , bErro, piIdCalculo );

  if bErro
   then begin
     bErro := True;
     sMsgErro := ' Ocorreu um erro na Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+') ';
     Result  := -1;
     Exit;
  end;

  if Trim(sValorBeneficio) = ''
  then begin
     bErro := True;
     sMsgErro := ' A Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+')'+
                 ' retornou um valor em branco. ';
     Result  := -1;
     Exit;
  end;

  try
     rValorBeneficio := StrToFloat(ClienteNumero(sValorBeneficio));
  except
     bErro := True;
     sMsgErro := ' A Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+')' +
                 ' retornou um valor inválido. [Valor Retornado = '+sValorBeneficio+']';
     Result  := -1;
     Exit;
  end;
  bErro := False;
  sMsgErro := ' ';
  Result := rValorBeneficio;
end;

function ExecutaRegraCalculoBeneficio(qryAux                : TwwQuery;
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
                                      psDataFinalBenef      : String  = '';           // Gleyber - 20/08/2003 - Pendencia 14851
                                      piFlgProvisorio       : integer = 0;            // Camille - 19.04.2004
                                      piPrazoProvisorio     : integer = 0;            // Camille - 19.04.2004
                                      pdPercProvisorio      : double  = 0 ) : double; // Camille - 19.04.2004
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
  sDataInicioAnt,  // var. auxiliar apenas para passar para a funcao. A var. utilizada é a psDataInicioAnt
  sValorAnt,       // var. auxiliar apenas para passar para a funcao. A var. utilizada é a psValorBenefAnt
  sNomeBenefAnt,
  sIdTpPagtoAnt,
  sFlgBenefMinAnt,
  sDataEventoAnt,
  sCodBeneficioAnt,
  sUltMesReajAnt,
  sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
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
  slValorBase3INSS    : string;

  sFlgSitPartAntes    : string;

  sAux : String;
begin
  Result := 0;
  if piIdRegraCalculo <= 0 then Exit;

  // Para a regra de calculo, DATAINICIO = DIB - DATA DE DIREITO = (QUASE SEMPRE) DATA DO EVENTO
  //                          DATAREF    = DATA DO EVENTO

  if Trim(psDataEvento)      = '' then psDataEvento      := DateToStr(date);
  if Trim(psDataInicio)      = '' then psDataInicio      := DateToStr(date);
  if Trim(psDataInicioINSS)  = '' then psDataInicioINSS  := DateToStr(date);
  if Trim(psDataInicioPagto) = '' then psDataInicioPagto := DateToStr(date);

  sDataInicio     := psDataInicio;
  sDataInicioINSS := psDataInicioINSS;
  sDataRef        := psDataEvento;

  // Se foi passada regra para calculo da reserva, chamar a regra
  // senao, se foi passado um valor fixo como sendo o valor da reserva E NAO É BENEFICIO DE GRUPO
  //        usar este valor
  //        senao colocar a soma das reservas como sendo o valor da reserva

  if (StrToFloat(ClienteNumero(psValorReserva) ) <= 0 )
    // or (bBeneficioGrupo )  // COMENTADO POR CAMILLE EM 12.08.2000 . MOTIVO : CBS
                              // A QUERY P/ REGRA DE CALCULO DE RESERVA PARA BENEFICIO
                              // NAO É A MESMA QUE ESTÁ NA FUNCAO CALCRESERVAPART E POR
                              // ISTO ELA NAO PODE SER CHAMADA
  then begin
     if piIdRegraCalcReserva > 0
     then //Executa regra para calcular valor da Reserva do Particip.
        sValorReserva := OraNumero(CalcReservaPart(piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   piIdRegraCalcReserva,
                                                   piSeqProposta,
                                                   psDataEvento,
                                                   psDataInicio,
                                                   psDataInicioPagto,
                                                   psDataRequerimento, // camille - serpros - 11.08.2000
                                                   IntToStr(piIdBeneficio),
                                                   qryAux))
     else
        if (Trim(psValorReserva) <> '') And (Trim(psValorReserva) <> '0') { Augusto 18/11/2003 }
        then sValorReserva := psValorReserva
        else sValorReserva := OraNumero(CalcReservaPart(piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   -1,
                                                   piSeqProposta,
                                                   psDataEvento,
                                                   psDataInicio,
                                                   psDataInicioPagto,
                                                   psDataRequerimento, // camille - serpros - 11.08.2000
                                                   IntToStr(piIdBeneficio),
                                                   qryAux));
  end
  else sValorReserva := OraNumero(psValorReserva);

  sAnoMesRef := Copy(psDataEvento,7,4) + '/' + Copy(psDataEvento,4,2);

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
                                //sValorBase1, sValorBase2, sValorBase3,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant, //leocm - 31102002 - esteve zerando os valoresbase
                                sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
                                False );

  if psValorInfInss <> ''
  then psValorInfINSS := OraNumero(Trim(psValorInfINSS))
  else psValorInfINSS := '0';

//  CAMILLE - CBS - 18.03.2002
//  sSALPART  := ORANUMERO(CalcSalPart( piIdPessJur,
//                                      piIdTitular,
//                                      SAnoMesAnterior(sAnoMesRef),
//                                      qryAux));


  // Buscar salario na HistRubSal
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+OraNumero(psIdSitPartAntes));
     Open;
     if IsEmpty
     then sFlgSitPartAntes    := 'AT'
     else sFlgSitPartAntes    := FieldByName('FLGINTERNO').AsString;
     Close;
  end;

  sSalPart         := '0';
  sSALPART         := BuscaSalario              (  piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2),
                                                   sFlgSitPartAntes,
                                                   sSalPart,
                                                   sMsgErro,
                                                   qryAux);


  sSalarioIntegral := BuscaSalarioPESSOAINTEGRAL ( qryAux,
                                                   piIdPessJur,
                                                   piIdPlanoPrev,
                                                   piIdTitular,
                                                   piSeqProposta,
                                                   sFlgSitPartAntes,
                                                   Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2) );


  sREMTOTAL := ORANUMERO(CalcREMTOTAL( piIdPessJur,
                                       piIdTitular,
                                       SAnoMesAnterior(sAnoMesRef),
                                       qryAux));

  sDataInscFund := CalcDataInscFund(piIdPessJur, piIdPlanoPrev, piIdTitular,
                                    piSeqProposta,qryAux);


  if Trim(sDataInscFund) = ''
  then sDataInscFund := DateToStr(Date);

  if Trim(psValorInfINSS)  = '' then psValorInfINSS  := '0';
  if Trim(psValorCalcINSS) = '' then psValorCalcINSS := '0';
  if Trim(sSalPart)        = '' then sSalPart        := '0';
  if Trim(sRemTotal)       = '' then sRemTotal       := '0';

  if prOpcao1 >= 0
  then sOp1 := OraNumero(FloatToStr(prOpcao1))
  else sOp1 := '0';

  if prOpcao2 >= 0
  then sOp2 := OraNumero(FloatToStr(prOpcao2))
  else sOp2 := '0';

  if prOpcao3 >= 0
  then sOp3 := OraNumero(FloatToStr(prOpcao3))
  else sOp3 := '0';

  sDataEventoAnt := BuscaUltimoEvento( qryAux,
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdTitular,   piSeqProposta,
                                       psDataEvento,
                                       'DATAEVENTO');


  if Trim(sValorReserva) = ''      then sValorReserva := '0';
  if Trim(sDataRef) = ''           then sDataRef := DateToStr(Date);

  if Trim(psValorBenefAnt) = ''     then psValorBenefAnt := '0';

  if Trim(psDataRequerimento) = '' then psDataRequerimento := DateToStr(Date);
  if Trim(sDataEventoAnt) = ''     then sDataEventoAnt := DateToStr(Date);


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
        bErro := True;
        sMsgErro := ' Ocorreu um erro na geração do Resumo Funcional. ';
        Result  := 0;
        Exit;
     end;
     dSomaItemNaDib := CalculaTotalResumoFuncional ( piIdPessJur, piIdTitular,dSomaItemNoPBC );
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
     then iTotalBenef := 0
     else iTotalBenef := FieldByName('TOTALDEPENDENTES').AsInteger;
  end;

  // Verificar se o beneficio de INSS já foi requerido.
  // Se sim, entao trazer os dados do INSS já preenchidos
  BuscaINSSEmVigor ( qryAux,
                     piIdPessJur, piIdPlanoPrev, piIdTitular,
                     piIdTitular,
                     piIdBeneficio,
                     psDataInicio,
                     slValorCalcINSS,
                     slValorInfINSS,
                     slDataInicioINSS,
                     slNumProcINSS,
                     slValorBase1INSS,
                     slValorBase2INSS,
                     slValorBase3INSS,
                     sAux);


  if Trim(psSQLBenefAssoc) = ''
  then psSQLBenefAssoc := ', 0 AS VALORASSOCIADO, 0 AS ASSOC1OP1, 0 AS ASSOC2OP1, 0 AS ASSOC3OP1, '+
                          '                       0 AS ASSOC1OP2, 0 AS ASSOC2OP2, 0 AS ASSOC3OP2, '+
                          '                       0 AS ASSOC1OP3, 0 AS ASSOC2OP3, 0 AS ASSOC3OP3  ';


  if Trim(psIdSitPartAntes) = '' then psIdSitPartAntes := psIdSitPartAtual;
  if Trim(psIdSitPlanAntes) = '' then psIdSitPlanAntes := psIdSitPlanAtual;
  if Trim(psIdSitFuncAntes) = '' then psIdSitFuncAntes := psIdSitFuncAtual;

  // Executa Regra de Cálculo do Valor do Beneficio
  sSQL := ' SELECT DISTINCT  1 FLGCONCESSAO, '+ //leocm - 20062002 - adicionei flgconcessao
          '        PP.SEQPROPOSTA,  '+ //leocm - 25062002 - adicionei seqproposta
          '        PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,  '+
          '        PP.INSCRICAOTIPO, PP.DTINICIOINSC,                                                      '+
          '        PF.DATANASC, PF.SEXO,  PF.DATAMORTE, PP.IDPESSOA AS IDTITULAR,  '+
          '        EL.SALTOTAL,  EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+
          '        EL.TEMPOSERVTOTAL,  EL.DATADEMISSAO, EL.FLGDIRETOR, SP.FLGINTERNO, '+
          '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          '        PP.IDPESSOA AS IDTITULAR, '+
          OraNumero(FloatToStr(pdPercProvisorio))  + ' AS PERCPROVISORIO,  '+// CAMILLE - 19.04.2004
          OraNumero(IntToStr  (piFlgProvisorio))   + ' AS FLGPROVISORIO,   '+// CAMILLE - 19.04.2004
          OraNumero(IntToStr  (piPrazoProvisorio)) + ' AS PRAZOPROVISORIO, '+// CAMILLE - 19.04.2004
          // COMENTEI AS LINHAS ABAIXO POIS NO REQUERIMENTO A BENEFBFCIARIO AINDA NÃO EXISTE
          { Augusto 10/03/2004 }
          // '        BFC.FLGPROVISORIO, BFC.PERCPROVISORIO, BFC.PRAZOPROVISORIO, '+
          IntToStr(piFlgPossuiAcompINSS)+' AS FLGPOSSUIACOMPINSS, '+
          IntToSTr(piIdBeneficio)    +  ' AS IDBENEFICIO , '+
          IntToSTr(piNumeroProcesso) +  ' AS NUMEROPROCESSO , '+
          IntToStr(piIdBeneficio)    +  ' AS IDBENEFICIO, '+
          IntToStr(piNumeroProcesso) +  ' AS NUMEROPROCESSO, '+
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
          OraNumero(psIdSitFuncAtual)+  ' AS IDSITFUNC, ' +
          OraNumero(psIdSitPartAtual)           +  ' AS IDSITPART, ' +
          OraNumero(psIdSitPlanAtual)           +  ' AS IDSITPLANOPREV ,  '+
          OraNumero(psIdSitPartAntes)           +  ' AS IDSITPARTATUAL,   '+
          OraNumero(psIdSitPlanAntes)           +  ' AS IDSITPLANOATUAL,  '+
          OraNumero(psIdSitFuncAntes)           +  ' AS IDSITFUNCATUAL,   '+
          IntToSTr(piFlgTipoInss)    +  ' AS FLGTIPOINSS, '+
          '''' +   Trim(sDataRef)    +''' AS DATAREF, '+
          '''' +   Trim(sDataInicio) +''' AS DATAINICIO, '+
          '''' +   Trim(sDataInicio) +''' AS DATAINICIOFUND, '+ { Augusto 21/01/2004 }
          '''' +   Trim(sDataInicioINSS)   +''' AS DATAINICIOINSS,   '+
          '''' +   Trim(psDataInicioPagto) +''' AS DATAINICIOPAGTO,  '+
          '''' +   Trim(psDataRequerimento)+''' AS DATAREQUERIMENTO, '+
          ''''+    sIdTpPagtoAnt           +''' AS IDTPPAGTOANT,     '+ // FUNCEF - 08.01.2001
          ''''+    sUltMesReajAnt          +''' AS ULTMESREAJANT,    '+ // FUNCEF - 08.01.2001
          ''''+    sFlgBenefMinAnt         +''' AS FLGBENEFMINANT,   '+ // FUNCEF - 08.01.2001
          '''' +   Trim(sDataEventoAnt)    +''' AS DATAEVENTOANT,    '+ // FUNCEF - 08.01.2001
          '''' +   Trim(sCodBeneficioAnt)  +''' AS CODBENEFICIOANT,  '+ // FUNCEF - 08.01.2001
          '''' +   Trim(psDataInicioAnt)   +''' AS DATAINICIOANT,    '+ // FUNCEF - 08.01.2001
          OraNumero(psValorBenefAnt)       +' AS VLBENEFPGTO,        '+ // FUNCEF - 08.01.2001
          OraNumero(psValorBenefAnt)       +' AS VALORBENEFANT,      '+ // FUNCEF - 08.01.2001
          OraNumero(psVALORBINSSANT1)      +' AS VALORBINSSANT1,     '+ // FUNCEF - 20.02.2001
          OraNumero(psVALORBINSSANT2)      +' AS VALORBINSSANT2,     '+ // FUNCEF - 20.02.2001
          OraNumero(psVALORBINSSANT3)      +' AS VALORBINSSANT3,     '+ // FUNCEF - 20.02.2001
          IntToStr(iTotalBenef)            +' AS NUMBENEF,           '+ // FUNCEF - 02.02.2001
          OraNumero(slValorBase1INSS)      +' AS VALORBASE1INSS,     '+
          OraNumero(slValorBase2INSS)      +' AS VALORBASE2INSS,     '+
          OraNumero(slValorBase3INSS)      +' AS VALORBASE3INSS,     '+
          OraNumero(FloatToStr(prValorSRB))+' AS VALORSRB,           '+
          OraNumero(FloatToStr(dSomaItemNoPBC))+' AS SOMAITEMNOPBC,  '+ // SRB
          OraNumero(FloatToStr(dSomaItemNaDIB))+' AS SOMAITEMNADIB   '; // SRB
  // Gleyber - 20/08/2003 - Pendencia 14851 - Início
  If psDataFinalBenef <> ''
  Then sSQL := sSQL + ', '+QuotedStr(Trim(psDataFinalBenef))+' AS DATAFINAL   '
  else sSQL := sSQL + ', ''          ''AS DATAFINAL   ';

  sSQL := sSQL +
  // Gleyber - 20/08/2003 - Pendencia 14851 - Fim
          psSQLBenefAssoc+
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF,  SITPART SP, SITFUNC SF, BENEFPLANOPART BPL,  '+
          { Augusto 10/03/2004 }
          ' BENEFBFCIARIO BFC '+
          ' WHERE  PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND '+
          '        PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND '+
          '        PP.IDPESSOA    = ' + IntToStr(piIdTitular)   + ' AND '+
          '        PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND '+
          // Gleyber - Pendência 16363 - 26/03/2004 - Início
          '        BFC.IDBENEFICIO(+) = '+IntToStr(piIdBeneficio)   + ' AND '+
          '        EL.IDPESSJUR       = PP.IDPESSJUR AND '+
          '        EL.IDPESSOA        = PP.IDPESSOA AND '+
          '        PF.IDPESSOA        = EL.IDPESSOA AND '+
          '        EL.IDSITFUNC       = SF.IDSITFUNC AND '+
          '        PP.IDPESSJUR       = BFC.IDPESSJUR(+) AND '+
          '        PP.IDPLANOPREV     = BFC.IDPLANOPREV(+) AND '+
          '        PP.IDPESSOA        = BFC.IDPESSOA(+) AND '+
          '        PP.SEQPROPOSTA     = BFC.SEQPROPOSTA(+) AND '+
          '        SP.IDSITPART       = PP.IDSITPART AND '+
          '        BPL.IDPESSJUR(+)   = BFC.IDPESSJUR AND '+
          '        BPL.IDPESSOA(+)    = BFC.IDTITULAR AND '+
          '        BPL.IDPESSOA (+)   = BFC.IDPESSOA AND '+
          '        BPL.IDPLANOPREV(+) = BFC.IDPLANOPREV AND '+
          '        BPL.SEQPROPOSTA(+) = BFC.SEQPROPOSTA AND '+
          '        BPL.IDBENEFICIO(+) = BFC.IDBENEFICIO ';
          (* A parte a seguir foi comentada
          { Augusto 10/03/2004 }
          '        BPL.IDBENEFICIO = '+IntToStr(piIdBeneficio)   + ' AND '+
          '        EL.IDPESSJUR   = PP.IDPESSJUR         AND '+
          '        EL.IDPESSOA    = PP.IDPESSOA          AND '+
          '        PF.IDPESSOA    = EL.IDPESSOA          AND '+
          '        EL.IDSITFUNC   = SF.IDSITFUNC(+)      AND '+
          '        PP.IDPESSJUR   = BPL.IDPESSJUR(+)     AND '+
          '        PP.IDPLANOPREV = BPL.IDPLANOPREV(+)   AND '+
          '        PP.IDPESSOA    = BPL.IDPESSOA(+)      AND '+
          '        PP.SEQPROPOSTA = BPL.SEQPROPOSTA(+)   AND '+
          { Augusto 10/03/2004 }
          '        SP.IDSITPART   = PP.IDSITPART         AND '+
          '        BPL.IDPESSJUR   = BFC.IDPESSJUR(+)    AND '+
          '        BPL.IDPESSOA    = BFC.IDTITULAR(+)    AND '+
          '        BPL.IDPESSOA    = BFC.IDPESSOA(+)     AND '+
          '        BPL.IDPLANOPREV = BFC.IDPLANOPREV(+)  AND '+
          '        BPL.SEQPROPOSTA = BFC.SEQPROPOSTA(+)  AND '+
          '        BPL.IDBENEFICIO = BFC.IDBENEFICIO(+)      ';*)


   sValorBeneficio := RegraNumerica(IntToStr(piIdRegraCalculo),sSQL, bErro, piIdCalculo );

  if bErro
   then begin
     bErro := True;
     sMsgErro := ' Ocorreu um erro na Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+') ';
     Result  := 0;
     Exit;
  end;

  if Trim(sValorBeneficio) = ''
  then begin
     bErro := True;
     sMsgErro := ' A Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+')'+
                 ' retornou um valor em branco. ';
     Result  := 0;
     Exit;
  end;

  try
     rValorBeneficio := StrToFloat(ClienteNumero(sValorBeneficio));
  except
     bErro := True;
     sMsgErro := ' A Regra de Cálculo do Valor do Benefício (nº '+IntToStr(piIdRegraCalculo)+')' +
                 ' retornou um valor inválido. [Valor Retornado = '+sValorBeneficio+']';
     Result  := 0;
     Exit;
  end;
  bErro := False;
  sMsgErro := ' ';
  Result := rValorBeneficio;
end;

function ExecutaRegraValorTotal(qryAux : TwwQuery;
                                piIdRegraCalculo,  piIdPessJur,
                                piIdPlanoPrev,     piIdTitular,
                                piSeqProposta,     piNumeroProcesso,
                                piIdBeneficio,
                                piNumBenef                             : longint;
                                prOpcao1,          prOpcao2,
                                prOpcao3                               : double;
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
                                piIdPessoa : LongInt = -1;
                                piIdBeneficiario : LongInt = -1;      //  Augusto 18/02/2004
                                piFlgProvisorio       : integer = 0;            // Camille - 19.04.2004
                                piPrazoProvisorio     : integer = 0;            // Camille - 19.04.2004
                                pdPercProvisorio      : double  = 0 ) : double; // Camille - 19.04.2004

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
  sDataInicioAnt,  // var. auxiliar apenas para passar para a funcao. A var. utilizada é a psDataInicioAnt
  sValorAnt,       // var. auxiliar apenas para passar para a funcao. A var. utilizada é a psValorBenefAnt
  sNomeBenefAnt,
  sIdTpPagtoAnt,
  sFlgBenefMinAnt, sDataEventoAnt,sCodBeneficioAnt,
  sUltMesReajAnt,
  sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
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
  sPlanoOrigem : string; // camille - 18.06.2004

begin
  Result := -1;
  if piIdRegraCalculo <= 0 then Exit;

  // Para a regra de calculo, DATAINICIO = DIB - DATA DE DIREITO = (QUASE SEMPRE) DATA DO EVENTO
  //                          DATAREF    = DATA DO EVENTO

  if Trim(psDataEvento) = '' then psDataEvento := DateToStr(date);
  if Trim(psDataInicio) = '' then psDataInicio := DateToStr(date);
  if Trim(psDataInicioINSS) = '' then psDataInicioINSS := DateToSTr(date);


  // CGUEDES - 19/03/2002: Tirado do parâmetro da função e posto diretamente aqui.
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

  sFlgInternoAntes := qryAux.FieldByName('flginternoant').AsString;
  sFlgInternoAtual := qryAux.FieldByName('flginterno').AsString;

  sIdSitPartAntes := qryAux.FieldByName('idsitpartatual').AsString;
  sIdSitPlanAntes := qryAux.FieldByName('idsitplanoatual').AsString;
  sIdSitFuncAntes := qryAux.FieldByName('idsitfuncatual').AsString;

  sIdSitPartDepois := qryAux.FieldByName('idsitpartnovo').AsString;
  sIdSitPlanDepois := qryAux.FieldByName('idsitplanonovo').AsString;
  sIdSitFuncDepois := qryAux.FieldByName('idsitfuncnovo').AsString;


  { Inicio Augusto 05/12/2002 }
  If sFlgInternoAntes = '' Then sFlgInternoAntes := ' ';
  If sFlgInternoAtual = '' Then sFlgInternoAtual := ' ';
  If sIdSitPartAntes  = '' Then sIdSitPartAntes  := ' ';
  If sIdSitPlanAntes  = '' Then sIdSitPlanAntes  := ' ';
  If sIdSitFuncAntes  = '' Then sIdSitFuncAntes  := ' ';
  If sIdSitPartDepois = '' Then sIdSitPartDepois := ' ';
  If sIdSitPlanDepois = '' Then sIdSitPlanDepois := ' ';
  If sIdSitFuncDepois = '' Then sIdSitFuncDepois := ' ';
  { Fim  Augusto 05/12/2002 }


  psVlrCalcINSS := OraNumero(psVlrCalcINSS);
  psVlrInfINSS  := OraNumero(psVlrInfINSS);

  sDataInicio := psDataInicio;
  sDataRef    := psDataEvento;

  sAnoMesRef := Copy(psDataEvento,7,4) + '/' + Copy(psDataEvento,4,2);

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
                                //sValorBase1, sValorBase2, sValorBase3,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant, //leocm -31102002 - estava zerando os valoresbase
                                sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
                                False);

  sSALPART  := ORANUMERO(CalcSalPart( piIdPessJur,
                                      piIdTitular,
                                      SAnoMesAnterior(sAnoMesRef),
                                      qryAux));
  sREMTOTAL := ORANUMERO(CalcREMTOTAL( piIdPessJur,
                                       piIdTitular,
                                       SAnoMesAnterior(sAnoMesRef),
                                       qryAux));

  sDataInscFund := CalcDataInscFund(piIdPessJur, piIdPlanoPrev, piIdTitular, piSeqProposta,qryAux);


  if Trim(sDataInscFund) = ''
  then sDataInscFund := DateToStr(Date);

  if Trim(sSalPart) = ''   then sSalPart := '0';
  if Trim(sRemTotal) = ''  then sRemTotal := '0';

  if prOpcao1 >= 0
  then sOp1 := OraNumero(FloatToStr(prOpcao1))
  else sOp1 := '0';

  if prOpcao2 >= 0
  then sOp2 := OraNumero(FloatToStr(prOpcao2))
  else sOp2 := '0';

  if prOpcao3 >= 0
  then sOp3 := OraNumero(FloatToStr(prOpcao3))
  else sOp3 := '0';

  if Trim(sDataRef) = ''   then sDataRef := DateToStr(Date);

  // CAMILLE - 05.08.2002

{ // CGUEDES - 22/05/2002: Para atender a CBS
  Else sDataRef := ' ';
}


//  if Trim(sValorUltBenef) = '' then sValorUltBenef := '0';

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
        then iIdRegraReserva := qryAux.FieldByName('IdRegraPagamento').AsInteger
        else iIdRegraReserva := -1;
     end; // with qryAux

     if iIdRegraReserva > 0 //Executa regra para calcular valor da Reserva do Particip
     then sValorReserva := OraNumero(CalcReservaPart(piIdPessJur,
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
     else sValorReserva := OraNumero(CalcReservaPart(piIdPessJur,
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
  else sValorReserva := OraNumero(psValorReserva);

  // Executa Regra de Cálculo do Valor do Beneficio
  sSQL := ' SELECT DISTINCT PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,  '+
          '        PP.SEQPROPOSTA, PP.INSCRICAOTIPO,   PF.DATANASC,    PF.SEXO,           ';

  { Inicio Augusto 18/02/2004 - Usado no caso de beneficio para Dependente de Pensionista }
  If piIdBeneficiario <> -1 Then Begin
    sSQL := sSQL + IntToStr(piIdTitular) + ' AS IDTITULAR, '+
                   IntToStr(piIdPessoa)  + ' AS IDPESSOA,  ';
  End Else Begin
    sSQL := sSQL + IntToStr(piIdTitular) + ' AS IDTITULAR, '+
                   IntToStr(piIdTitular) + ' AS IDPESSOA,  ';
  End;
  { Fim Augusto 18/02/2004 }

  if sTipoTelaBenef = 'SI'
  then sSQL := sSQL + ''''+psDataEvento+''' AS DATAMORTE, '
  else sSQL := sSQL + ' PF.DATAMORTE, ';

  if Trim(sDataRef)           = '' then sDataRef          := '          ';
  if Trim(sDataInicio)        = '' then sDataInicio       := '          ';
  if Trim(psDataInicioPagto)  = '' then psDataInicioPagto := '          '; { Augusto 21/01/2004 }
  if Trim(psDataInicioINSS)   = '' then psDataInicioINSS  := '          ';
  if Trim(sDataEventoAnt)     = '' then sDataEventoAnt    := '          ';
  if Trim(psDataInicioAnt)    = '' then psDataInicioAnt   := '          ';

  // CAMILLE - 18.06.2004
  if piIdTitular =  piIdPessoa
  then sPlanoOrigem := IntToStr(piIdPlanoPrev)
  else begin
     sPlanoOrigem := BuscaPlanoOrigem(piIdPessjur,piIdTitular, Copy(sDataRef,7,4)+'/'+Copy(sDataRef,6,2), piIdPessoa );
     if (piIdTitular <> piIdPessoa) And (sPlanoOrigem = '-1')
     Then sPlanoOrigem := BuscaPlanoOrigem(piIdPessjur, piIdPessoa, Copy(sDataRef,7,4)+'/'+Copy(sDataRef,6,2), piIdPessoa);
  end;

  // CGUEDES - 18/12/2001: ADICIONANDO FLGDIRETOR
  sSQL := sSQL + ' 1 FLGCONCESSAO, '+ //LEOCM - 20062002 ADICIONEI FLGCONCESSAO
          '        PP.SEQPROPOSTA,  '+ //leocm - 25062002 - adicionei seqproposta
          '        PP.DTINICIOINSC,  ';
          //'        PP.IDPESSOA AS IDTITULAR, PP.DTINICIOINSC,  '; { Augusto 18/02/2004 }


          //leofuncef - 08013004 - inicio
          qryaux.close;
          qryaux.sql.clear;
          qryaux.sql. text := ' SELECT SUM(VLBENEFPGTO) VALOR '+
             ' FROM HSTBENEFBFCIARIO                              '+
             ' WHERE  IDTITULAR    = ' + IntToStr(piIdTitular)   + ' AND '+
             '        IDPESSOA <> IDTITULAR    AND '+
             '        IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND '+
             '        IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND '+
             '        SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND '+
             '        MESREFERENCIA = TO_CHAR(TO_DATE('''+sDataRef+''',''DD/MM/YYYY'') - 30 ,''YYYY/MM'') ';
          qryaux.open;

          if qryaux.isempty then
          begin
             //caso seja o beneficiário
             sSQL := sSQL +'        EL.SALTOTAL,  ';
          end
          else
          begin
             //caso seja o benefficiário do beneficiário
             //pegar a soma do INSS e Suplementeção no mês de falecimento
             //para não pegar nenhum reajuste posterior
             sSQL := sSQL +oranumero(qryaux.fieldbyname('valor').AsString)+' AS SALTOTAL,  ';
          end;
          //leofuncef - 08012004 - fim



          sSQL := sSQL +'  EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+
          '        EL.TEMPOSERVTOTAL, '+
          '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          '        SP.FLGINTERNO, '+
          '        EL.FLGDIRETOR, '+
          OraNumero(FloatToStr(pdPercProvisorio))  + ' AS PERCPROVISORIO,  '+// CAMILLE - 19.04.2004
          OraNumero(IntToStr  (piFlgProvisorio))   + ' AS FLGPROVISORIO,   '+// CAMILLE - 19.04.2004
          OraNumero(IntToStr  (piPrazoProvisorio)) + ' AS PRAZOPROVISORIO, '+// CAMILLE - 19.04.2004
          // COMENTEI AS LINHAS ABAIXO POIS NO REQUERIMENTO A BENEFBFCIARIO AINDA NÃO EXISTE
          { Augusto 10/03/2004 }
          //'        BFC.FLGPROVISORIO, BFC.PERCPROVISORIO, BFC.PRAZOPROVISORIO, '+
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
          IntToStr(piFlgTipoInss)+ ' AS FLGTIPOINSS,       '+ // FUNCEF
          '''' +   sDataRef+ ''' AS DATAREF,        '+ //CGUEDES - 22/05/2002 retirado trim - CBS
          '''' +   sDataInicio+''' AS DATAINICIO,    '+//CGUEDES - 22/05/2002 retirado trim - CBS
          '''' +   sDataInicio+''' AS DATAINICIOFUND,    '+ { Augusto 21/01/2004 }
          '''' +   Trim(psDataInicioPagto) +''' AS DATAINICIOPAGTO,  '+ { Augusto 21/01/2004 }
          '''' +   psDataInicioINSS+''' AS DATAINICIOINSS, '+//CGUEDES - 22/05/2002 retirado trim - CBS
          ''''+    sIdTpPagtoAnt           +''' AS IDTPPAGTOANT,     '+ // FUNCEF - 08.01.2001
          ''''+    sUltMesReajAnt          +''' AS ULTMESREAJANT,    '+ // FUNCEF - 08.01.2001
          ''''+    sFlgBenefMinAnt         +''' AS FLGBENEFMINANT,   '+ // FUNCEF - 08.01.2001
          '''' +   sDataEventoAnt    +''' AS DATAEVENTOANT,          '+ // FUNCEF - 08.01.2001 CGUEDES - 22/05/2002 retirado trim - CBS
          '''' +   sCodBeneficioAnt  +''' AS CODBENEFICIOANT,        '+ // FUNCEF - 08.01.2001 CGUEDES - 22/05/2002 retirado trim - CBS
          '''' +   psDataInicioAnt   +''' AS DATAINICIOANT,          '+ // FUNCEF - 08.01.2001 - CGUEDES - 22/05/2002 retirado trim - CBS
          OraNumero(psValorBenefAnt)       +' AS VLBENEFPGTO,        '+ // FUNCEF - 08.01.2001
          OraNumero(psValorBenefAnt)       +' AS VALORBENEFANT,      '+ // FUNCEF - 08.01.2001
          OraNumero(psVALORBINSSANT1)      +' AS VALORBINSSANT1,      '+ // FUNCEF - 20.02.2001
          OraNumero(psVALORBINSSANT2)      +' AS VALORBINSSANT2,      '+ // FUNCEF - 20.02.2001
          OraNumero(psVALORBINSSANT3)      +' AS VALORBINSSANT3,      '+ // FUNCEF - 20.02.2001
          OraNumero(FloatToStr(prValorSRB))+' AS VALORSRB,           '+
          IntToSTr(piNumBenef)             +' AS NUMBENEF '+// DEIXAR SEM VIRGULA
          psSQLBenefAssoc+
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP, PESSOAFISICA PF,  SITFUNC SF, BENEFPLANOPART BPL,  '+
          { Augusto 10/03/2004 }
          ' BENEFBFCIARIO BFC '+
          ' WHERE  PP.IDPESSOA    = ' + IntToStr(piIdTitular)     + ' AND '+
          '        PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)     + ' AND '+
          // CAMILLE - 18.06.2004 - retirei o comentario do leo
          '        PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev)   + ' AND '+
          //leoprovisorio
          //'        PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev)   + ' AND '+
          '        PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta)   + ' AND '+
          { Augusto 10/03/2004 }
          '        BFC.IDBENEFICIO(+) = '+IntToStr(piIdBeneficio) + ' AND '+
          '        PP.FLGDESATIVADO = 0                  AND '+ // Gleyber - 19/05/2004 - Pendência 16821
          '        EL.IDPESSOA    = PP.IDPESSOA          AND '+
          '        EL.IDPESSJUR   = PP.IDPESSJUR         AND '+
          '        PF.IDPESSOA    = EL.IDPESSOA          AND '+
          '        EL.IDSITFUNC   = SF.IDSITFUNC(+)      AND '+
          '        PP.IDPESSOA    = BPL.IDPESSOA(+)      AND '+
          '        PP.IDPESSJUR   = BPL.IDPESSJUR(+)     AND '+
          '        PP.IDPLANOPREV = BPL.IDPLANOPREV(+)   AND '+
          { Augusto 10/03/2004 }
          '        SP.IDSITPART    = PP.IDSITPART        AND '+
          '        BPL.IDPESSJUR   = BFC.IDPESSJUR(+)    AND '+
          '        BPL.IDPESSOA    = BFC.IDTITULAR(+)    AND '+
          '        BPL.IDPESSOA    = BFC.IDPESSOA(+)     AND '+
          '        BPL.IDPLANOPREV = BFC.IDPLANOPREV(+)  AND '+
          '        BPL.SEQPROPOSTA = BFC.SEQPROPOSTA(+)  AND '+
          '        BPL.IDBENEFICIO = BFC.IDBENEFICIO(+)   ';

  sValorBeneficio := RegraNumerica(IntToStr(piIdRegraCalculo),sSQL, bErro, piIdCalculo );

  if bErro
   then begin
     bErro := True;
     sMsgErro := ' Ocorreu um erro na Regra de Cálculo do Valor Total do Benefício (nº '+IntToStr(piIdRegraCalculo)+') ';
     Result  := -1;
     Exit;
  end;

  if Trim(sValorBeneficio) = ''
  then begin
     bErro := True;
     sMsgErro := ' A Regra de Cálculo do Valor Total do Benefício (nº '+IntToStr(piIdRegraCalculo)+')'+
                 ' retornou um valor em branco. ';
     Result  := -1;
     Exit;
  end;

  try
     rValorBeneficio := StrToFloat(ClienteNumero(sValorBeneficio));
  except
     bErro := True;
     sMsgErro := ' A Regra de Cálculo do Valor Total do Benefício (nº '+IntToStr(piIdRegraCalculo)+')' +
                 ' retornou um valor inválido. [Valor Retornado = '+sValorBeneficio+']';
     Result  := -1;
     Exit;
  end;
  bErro := False;
  sMsgErro := ' ';
  Result := rValorBeneficio;
end; // ExecutaRegraValorTotal

function BuscaSalarioPESSOAINTEGRAL (qryAux : TwwQuery;
                                     piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                     psFlgIntSitPartHOJE,
                                     psAnoMesBusca : string ) : string;
var sSituacaoNaEpoca,
    sIdPessJurNaEpoca,
    sIdPlanoNaEpoca,
    sIdEventosPrevDaEpoca,
    sSalarioNaEpoca,
    sSalarioIntegral,
    sSQL,
    sMsgErro,
    sUltDiaMes              : string;
    iUltDiaMes              : integer;
    bErro                   : boolean;
    iIdRubrica              : longint;
    sMesAux                 : string;
    bAchou                  : boolean;
    iTentativas             : integer;
begin
    Result := '0';
    sSalarioIntegral := '';

    if Copy(psAnoMesBusca,6,2) = '13'
    then psAnoMesBusca := Copy(psAnoMesBusca,1,4)+'/12';

    iUltDiaMes := TrazUltDiaMes( StrToInt(Copy(psAnoMesBusca,6,2)),
                                 StrToInt(Copy(psAnoMesBusca,1,4)) );
    if iUltDiaMes <= 9
    then sUltDiaMes := '0'+IntToStr(iUltDiaMes)
    else sUltDiaMes := IntToStr(iUltDiaMes);

    with qryAux do
    begin


       Close;
       SQL.Clear;
       // CGUEDES - 31/05/2002: REMOVIDO  PT.IDRUBDECTERC
       SQL.Add(' SELECT EV.IDPESSJUR, EV.IDPLANOPREV, SP.FLGINTERNO, PT.IDRUBSALAUXDOENCA, '+
               '        PT.IDRUBSALMANUT, PT.IDRUBSALMANUTPARC, PT.IDRUBSALPARTICIP '+
               ' FROM   PATRO PT, SITPART SP, EVENTOSPREV EV '+
               ' WHERE  EV.IDPESSOA      = '+IntToStr(piIdPessoa)+
               ' AND    EV.SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
               ' AND    EV.DATAEVENTO    = TO_DATE('''+sUltDiaMes+'/'+Copy(psAnoMesBusca,6,2)+'/'+Copy(psAnoMesBusca,1,4)+''', ''DD/MM/YYYY'') '+
               ' AND    EV.IDPESSJUR     = PT.IDPESSOA '+
               ' AND    EV.IDSITPARTNOVO = SP.IDSITPART '+
               ' ORDER BY EV.DATAEVENTO DESC ');
       Open;

       if not IsEmpty
       then begin
          sSituacaoNaEpoca  := FieldByName('FlgInterno').AsString;
          sIdPessJurNaEpoca := FieldByName('IdPessJur').AsString;
          sIdPlanoNaEpoca   := FieldByName('IdPlanoPrev').AsString;
       end
       else begin
          sSituacaoNaEpoca  := psFlgIntSitPartHOJE;
          sIdPessJurNaEpoca := IntToSTr(piIdPessJur);
          sIdPlanoNaEpoca   := IntToSTr(piIdPlanoPrev);
       end;

       if sSituacaoNaEpoca = 'AT'
       then sSalarioNaEpoca := CalcSALPART( StrToInt(sIdPessJurNaEpoca),
                                          piIdPessoa,
                                          psAnoMesBusca,
                                          qryAux )

       else if sSituacaoNaEpoca = 'MP'
       then sSalarioNaEpoca := CalcRUBPARCIAL( StrToInt(sIdPessJurNaEpoca),
                                          StrToInt(sIdPlanoNaEpoca),
                                          piIdPessoa,
                                          piSeqProposta,
                                          psAnoMesBusca,
                                          qryAux )

       else if (sSituacaoNaEpoca = 'AS') Or (sSituacaoNaEpoca = 'MA') Then
       begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT PT.IDRUBSALAUXDOENCA, PT.IDRUBSALMANUT '+
                  ' FROM   PATRO PT  '+
                  ' WHERE  (PT.IDPESSOA     = '+sIdPessJurNaEpoca+')');
          Open;
          if IsEmpty then Exit;

          If sSituacaoNaEpoca = 'AS' Then
            iIdRubrica := FieldByName('IDRUBSALAUXDOENCA').AsInteger
          Else iIdRubrica := FieldByName('IDRUBSALMANUT').AsInteger;

          sMesAux := psAnoMesBusca;
          bAchou  := False;
          iTentativas := 0;
          while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
          begin
             Close;
             SQL.Clear;
             SQL.Add(' SELECT /*+ RULE */ H.VALORINTEGRAL, H.VALORPROVENTO '+
                     ' from   HISTRUBSAL H    '+
                     ' WHERE  (H.IDPESSOA  = '+IntToStr(piIdPessoa) +') '+
                     ' AND    (H.MES       = '''+sMesAux+''' )         '+
                     ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                     ' AND    (H.IDPESSJUR = '+sIdPessJurNaEpoca+') ');
             Open;
             if not IsEmpty
             then begin
                if Trim(FieldByName('VALORINTEGRAL').AsString) = ''
                then sSalarioIntegral := FieldByName('VALORPROVENTO').AsString
                else sSalarioIntegral := FieldByName('VALORINTEGRAL').AsString;
                bAchou := True;
                break;
             end;
             sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
             inc(iTentativas);
          end;
          if not bAchou then Result := '0';
          if Trim(Result) = '' then Result := '0';

       end;
    end;

    if sSalarioIntegral = '' then sSalarioIntegral := sSalarioNaEpoca;

    Result := OraNumero(sSalarioIntegral);
end; // BuscaSalarioPESSOAINTEGRAL

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

  sFlgInternoAntes := qryAux.FieldByName('flginternoant').AsString;
  sFlgInternoAtual := qryAux.FieldByName('flginterno').AsString;

  sIdSitPartAntes := qryAux.FieldByName('idsitpartatual').AsString;
  sIdSitPlanAntes := qryAux.FieldByName('idsitplanoatual').AsString;
  sIdSitFuncAntes := qryAux.FieldByName('idsitfuncatual').AsString;

  sIdSitPartDepois := qryAux.FieldByName('idsitpartnovo').AsString;
  sIdSitPlanDepois := qryAux.FieldByName('idsitplanonovo').AsString;
  sIdSitFuncDepois := qryAux.FieldByName('idsitfuncnovo').AsString;
End;

function CalcReservaPart( iIdPessJur, iIdPlanoPrev, iIdPessoa, iIdRegra, iSeqProposta : integer;
                          sDataRef, sDataInicio, sDataInicioPagto,
                          sDataRequerBenef, iIdBeneficio : string;
                          qry : TwwQuery):string;
var
   sSQL, sMesRef, sValorProvento : string;
   eAcumulador : extended;
   cAux : char;
   qryauxreserva : twwquery;
begin

   try
     Result := '0';
     eAcumulador := 0;

     if iIdRegra <= 0
     then begin
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(' SELECT RP.IDTIPORESERVA, RP.VALORRESERVA, R.INDICEREAJUSTE '+
                    ' FROM   RESERVAPART RP, RESERVAXPLANO R '+
                    ' WHERE  RP.IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)+' AND '+
                    '        RP.IDPESSJUR     = '+IntToStr(iIdPessJur)+' AND '+
                    '        RP.IDTIPORESERVA = R.IDTIPORESERVA AND '+
                    '        RP.IDPESSOA      = '+ IntToStr(iIdPessoa)+' AND '+
                    '        RP.SEQPROPOSTA   = '+ IntToStr(iSeqProposta)+' AND '+
                    '        RP.FLGATIVO      = 1 AND ' +
                    '        R.FLGCONTROLE    = 0 AND '+ // CAMILLE - REFER - 13.08.99
                    '        RP.IDPLANOPREV   = R.IDPLANOPREV AND '+
                    '        R.ANALITICOSINTETI = ''A'' ');
        qry.Open;

        qryAuxReserva := TwwQuery.Create(Application);
        qryAuxReserva.DatabaseName := 'BaseDados';

        qry.first;
        cAux             := DecimalSeparator;
        DecimalSeparator := '.';
        while not qry.eof do
        begin
           if not (qry.FieldByName('VALORRESERVA').AsInteger = 0) then
           eAcumulador := eAcumulador + (qry.FieldByName('VALORRESERVA').AsFloat *
                          VoltaValorCotacao(qryauxreserva,qry.fieldbyname('INDICEREAJUSTE').AsString,
                          IntToStr(iIdPlanoPrev),qry.fieldbyname('IDTIPORESERVA').AsString,
                          sDataRef));
           qry.next;
        end;//while

        Result := Floattostr(eAcumulador);
        DecimalSeparator := cAux;
        qry.Close;
     end
     else begin  // executar regra de calculo
        if sDataRef = ''    then sDataRef := DateToStr(date);
        if sDataInicio = '' then sDataInicio := DateToStr(date);
        sMesRef := Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2);

        sValorProvento :=   CalcSALPART(iIdPessJur,iIdPessoa,sMesRef,qry);
        if Trim(sValorProvento)   = '' then sValorProvento   := '0';
        if Trim(sDataInicioPagto) = '' then sDataInicioPagto := Trim(sDataInicio);
        if Trim(sDataRequerBenef) = '' then sDataRequerBenef := Trim(sDataInicio);

        sSQL := ' SELECT RP.IDTIPORESERVA,     RP.IDPLANOPREV,       RP.IDPESSJUR,    '+
                '        RP.IDPESSOA,          RP.DATAREFERENCIASA,  RP.VALORRESERVA, '+
                '        RP.PERCENTUALSAQUE,   R.NOME,               R.CODHIERARQUIA, '+
                '        R.INDICEREAJUSTE,     R.IDBENEFICIO,        M.MOESIGLA,      '+
                '        PF.DATANASC,          EL.DATAADMISSAO,      PP.INSCRICAODATA,'+
                '        PP.SEQPROPOSTA,       PP.DATACANCELAMENTO,  EL.IDSITFUNC,    '+
                '        PP.IDSITPART,         PP.IDPLANOPREV,                        '+
                ''''+sDataInicio+'''       AS DATAINICIO,                             '+
                ''''+sDataInicioPagto+'''  AS DATAINICIOPAGTO,                        '+
                ''''+sDataRequerBenef+'''  AS DATAREQUERIMENTO,                       '+
                ''''+sDataRef+'''          AS DATAREF,                                '+
                OraNumero(sValorProvento)+ ' AS VALORPROVENTO,                        '+
                ' 1 AS CONTRESERVA, 1 AS ULTRESERVA, 0 VALORBASE1, 0 VALORBASE2, 0 VALORBASE3      '+
                ' FROM  PESSOAFISICA PF, ELEGPATRO EL,    PARTPREVPLAN PP,            '+
                '       RESERVAPART RP,  RESERVAXPLANO R, MOEDA M                     '+
                ' WHERE RP.IDPLANOPREV      = ' + IntToStr(iIdPlanoPrev)+
                ' AND   RP.IDPESSJUR        = ' + IntToStr(iIdPessJur)+
                ' AND   RP.IDTIPORESERVA    = R.IDTIPORESERVA '+
                ' AND   RP.IDPESSOA         = ' + IntToStr(iIdPessoa)+
                ' AND   RP.SEQPROPOSTA      = ' + IntToStr(iSeqProposta)+
                ' AND   RP.IDPESSJUR        = PP.IDPESSJUR   '+
                ' AND   RP.IDPLANOPREV      = PP.IDPLANOPREV '+
                ' AND   RP.IDPESSOA         = PP.IDPESSOA    '+
                ' AND   RP.SEQPROPOSTA      = PP.SEQPROPOSTA '+
                ' AND   PF.IDPESSOA         = RP.IDPESSOA    '+
                ' AND   EL.IDPESSOA         = RP.IDPESSOA    '+
                ' AND   EL.IDPESSJUR        = RP.IDPESSJUR   '+
                ' AND   RP.FLGATIVO         = 1              '+
                ' AND   RP.IDPLANOPREV      = R.IDPLANOPREV  '+
                ' AND   R.ANALITICOSINTETI  = ''A''          '+
                ' AND   R.INDICEREAJUSTE    = M.MOECODIGO(+) ';

        dtmAPrev.qryRegra.Close;
        dtmAPrev.qryRegra.Sql.Clear;
        dtmAPrev.qryRegra.Sql.Add(sSQL);
        try
           dtmAPrev.qryRegra.Open;
        except
           on E:EDBEngineError do
           begin
                   MostrarErro(E);
                   try
                      qryauxreserva.free; // CAMILLE - REFER - 24.06.1999
                   except
                   end;
                   Exit;
              end;
        end;

        if dtmAPrev.qryRegra.IsEmpty then exit;

        dtmAPrev.regraAPrev.RuleName := IntToStr(iIdRegra);
        dtmAPrev.regraAPrev.Execute;

        Result := dtmAPrev.regraAPrev.Result;
     end;


     if Trim(Result) = ''  then
     Result := '0'
     else Result := TruncaRound(result,2);

  finally
     try
        qryauxreserva.free;
     except
     end;
  end;
end;

function CalcSalPart(iIdPessJur, iIdPessoa  : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica,
    iIdRubAuxDoe,
    iTentativas : integer;
    bAchou      : boolean;
    sMesAux     : string;
begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     // CGUEDES - 31/05/2002: REMOVIDO  PT.IDRUBDECTERC
     // Gleyber - 03/12/2003 - Pendência 15749 - Início
     // Alteração solicitada pelo usuário Menezes para que passe a pegar
     // além da rubrica de salário de participação, pegue também a rubrica
     // de salário virtual
     SQL.Add(' SELECT PT.IDRUBSALPARTICIP, PT.IDRUBSALAUXDOENCA  '+
             ' FROM   PATRO PT  '+
             ' WHERE  (PT.IDPESSOA     = '+IntToStr(iIdPessJur)+')');
     Open;
     if IsEmpty then Exit;

     // CGUEDES - 31/05/2002: comentada crítica que fazia referência ao campo IDRUBDECTERC (PATRO)
     // Pela lógica o resultado final deve ser assim: iIdRubrica := FieldByName('IdRubSalParticip').AsInteger;
     iIdRubrica   := FieldByName('IDRUBSALPARTICIP').AsInteger;
     iIdRubAuxDoe := FieldByName('IDRUBSALAUXDOENCA').AsInteger; // Gleyber - 03/12/2003 - Pendência 15749


{     if Copy(sMesRef,6,2) = '13' then
       if FieldByName('IdRubDecTerc').AsInteger > 0
          then iIdRubrica := FieldByName('IdRubDecTerc').AsInteger
          else iIdRubrica := FieldByName('IdRubSalParticip').AsInteger
     else iIdRubrica := FieldByName('IdRubSalParticip').AsInteger;
}
     sMesAux := sMesRef;

     bAchou  := False;
     iTentativas := 0;
     while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
     begin
        Close;
        SQL.Clear;
        // Gleyber - 11/11/2003 - Pendência 15054 - Início
        // SQL.Add(' SELECT /*+ RULE */ NVL(H.VALORINTEGRAL, H.VALORPROVENTO) AS VALORPROVENTO'+
        // O select da query foi alterado para considerar no campo VALORINTEGRAL:
        // para valores nulos ou zerados o campo VALORPROVENTO,
        // caso contrário usa-se VALORINTEGRAL
        SQL.Add(' SELECT /*+ RULE */ DECODE(H.VALORINTEGRAL, '+
                                             ' NULL, H.VALORPROVENTO, '+
                                             '    0, H.VALORPROVENTO, H.VALORINTEGRAL) AS VALORPROVENTO '+
        // Gleyber - 11/11/2003 - Pendência 15054 - Fim
                ' FROM   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+' OR H.IDRUBRICA = '+
                IntToStr(iIdRubAuxDoe)+') '+ // Gleyber - 03/12/2003 - Pendência 15749
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
        Open;
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  // Se nao achar o salario no historico de rubrica tentar usar o valor
  // da tabela de participante
  if StrToFloat(ClienteNumero(Result)) <= 0
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALPARTICIPACAO FROM PARTPREVPLAN '+
                    ' WHERE (IDPESSOA  = '+IntToStr(iIdPessoa)+')'+
                    ' AND   (IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
                    ' AND   (FLGDESATIVADO = 0) ');
     qry.Open;
     If Not qry.IsEmpty
      Then Begin
       Result := qry.FieldByName('SALPARTICIPACAO').AsString;
       bAchou := True;
      End;
  end;
end;

function CalcDataInscFund(iIdPessjur,iIdPlanoPrev,iIdPessoa,iSeqProposta : integer; qry : TwwQuery):string;
begin
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT INSCRICAODATA         '+
               ' FROM   PARTPREVPLAN          '+
               ' WHERE  IDPESSJUR   = '+ IntToStr(iIdPessjur)+
               ' AND    IDPLANOPREV = '+ IntToStr(iIdPlanoPrev)+
               ' AND    IDPESSOA    = '+ IntToStr(iIdPessoa)+
               ' AND    SEQPROPOSTA = '+ IntToStr(iSeqProposta)+
               ' ORDER BY INSCRICAODATA ');
   qry.Open;
   if qry.IsEmpty
   then Result := ''
   else Result := qry.FieldByName('InscricaoData').AsString;
end;

function PegaBenefMinimo(qryAux : TwwQuery;
                         piIdPessJur,piIdPlanoPrev,piIdTitular,
                         piSeqProposta, piIdBeneficio : longint) : string;
begin
   Result := '0';
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
   then Result := Trim(qryAux.FieldByName('FlgBenefMin').AsString);
end; // PegaBenefMinimo

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
   // CAMILLE - REFER - 03.09.1999
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

function BuscaNumDiasBenefAnterior ( qry : TwwQuery;
                                     piIdPlanoPrev : longint;
                                     piIdBeneficio : longint ) : word;
begin
   Result := 1;
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT NUMDIASBENEFANT FROM BENEFPLANPREV '+
              ' WHERE  IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
              ' AND    IDBENEFICIO = '+IntToStr(piIdBeneficio) );
      Open;
      if (not IsEmpty) and (FieldByName('NUMDIASBENEFANT').AsString <> '')
      then Result := FieldByName('NUMDIASBENEFANT').AsInteger;
   end;


end;

function PegaValorIntegral( qryAux              : TwwQuery;
                            piNumeroProcesso,
                            piIdBeneficio,
                            piIdBeneficiario    : longint;
                            psDataInicio        : string;
                            piIdMotivo          : longint = -1 ) : double ; // CAMILLE - 28.11.2003
var sAnoMes : string;
begin
   if Trim(psDataInicio) = '' then psDataInicio := DateToStr(date);

   sAnoMes := Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2);
   Result  := 0;

   // camille - 05.08.2002
   // Se o idbeneficio = -1, entao pegar de todos os beneficios do processo
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT H.IDBENEFICIO, MAX(H.VALORINTEGRAL) AS VALORINTEGRAL  '+
              ' FROM   HSTBENEFBFCIARIO H, BENEFPLANPREV BP '+
              ' WHERE  H.IDPESSOA       = '+IntToStr(piIdBeneficiario)+
              ' AND    H.MESREFERENCIA = '''+sAnoMes+'''');
      if piIdBeneficio > 0 // CAMILLE - 05.08.2002
      then SQL.Add(' AND    H.IDBENEFICIO    = '+IntToStr(piIdBeneficio) )
      else SQL.Add(' AND    BP.FLGREFERENCIA = 0                         ');  // CAMILLE - 27.11.2003

      if piIdMotivo > 0
      then SQL.Add(' AND    H.IDMOTIVO = '+IntToStr(piIdMotivo) );  // CAMILLE - 28.11.2003


      SQL.Add(' AND    H.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso) +
              ' AND    BP.IDPLANOPREV   = H.IDPLANOPREV '+
              ' AND    BP.IDBENEFICIO   = H.IDBENEFICIO '+
//              ' AND    BP.FLGREFERENCIA = 0             '+ // CAMILLE - 27.11.2003
              ' GROUP BY H.IDBENEFICIO                  ');

      Open;

      if (not IsEmpty) and (FieldByName('VALORINTEGRAL').AsFloat > 0)
      then begin
         First;
         while not Eof do
         begin
            Result := Result + FieldByName('VALORINTEGRAL').AsFloat;
            Next;
         end;
         Close;
//         Free; // CAMILLE - 21.01.2003
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
      then Result := FieldByName('VALORATUAL').AsFloat;
      Close;
   end;
end;

function CalcRemTotal(iIdPessJur, iIdPessoa : integer; sMesRef : string;qry : TwwQuery) : string;
var iIdRubrica,
    iTentativas : integer;
    bAchou     : boolean;
    sMesAux    : string;
begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDRUBREMTOTAL AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+IntToStr(iIDPessJur));
     Open;
     if IsEmpty then Exit;
     iIdRubrica := FieldByName('IdRubrica').AsInteger;

     sMesAux := sMesRef;
     bAchou  := False;
     iTentativas := 0;

     // CAMILLE - REFER - 02.07.1999
     while (not bAchou) and (iTentativas <= prmNumTentativasSalario) do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT /*+ RULE */ H.VALORPROVENTO '+
                ' from   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
        Open;
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  if Trim(Result) = '' then Result := '0';
end;

function BuscaUltimoEvento         ( qryAux                              : TwwQuery;
                                     piIdPessJur,   piIdPlanoPrev,
                                     piIdPessoa ,   piSeqProposta        : longint;
                                     psDataRef,
                                     psNomeCampoRetorno                  : string ) : string ;
begin
   Result := '';

   if Trim(psNomeCampoRetorno) = '' then psNomeCampoRetorno := 'IDEVENTOSPREV';
   if Trim(psDataRef) = ''          then psDataRef          := DateToStr(date);
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT IDEVENTOSPREV, IDSITPLANOATUAL, IDPESSOA, IDSITFUNCATUAL, '+
                  '        IDEVENTOGERADOR, IDPESSJUR, IDSITPARTATUAL, IDPLANOPREV,  '+
                  '        IDSITPLANONOVO, IDSITPARTNOVO, DATAREGISTRO, DATAEVENTO,  '+
                  '        FLGEFETIVADO, DATAEFETIVADO, DATAALTERADO, DATAVOLTA,     '+
                  '        FLGSITFUNCIMED, IDSITFUNCNOVO, FLGSITPARTIMED, FLGSITPLANOIMED, '+
                  '        SEQPROPOSTA, IDBENEFICIO, FLGTPDEMISSAO, IDREGRACALCBENEF,      '+
                  '        IDREGRARESGATE, FLGCOBROUPATRO, SALPARTICIPACAO  '+
                  ' FROM   EVENTOSPREV '+
                  ' WHERE  (IDPESSJUR   = '+IntToStr(piIdPessJur )   +') '+
                  ' AND    (IDPLANOPREV = '+IntToStr(piIdPlanoPrev )   +') '+
                  ' AND    (IDPESSOA    = '+IntToStr(piIdPessoa )   +') '+
                  ' AND    (SEQPROPOSTA = '+IntToStr(piSeqProposta) +') '+
                  ' AND    (DATAEVENTO  < TO_DATE('''+psDataRef+''',''DD/MM/YYYY'')) '+
                  ' ORDER BY DATAEVENTO DESC ');
   qryAux.Open;
   if qryAux.IsEmpty
   then Exit;

   qryAux.First;
   try
      Result := qryAux.FieldbyName(psNomeCampoRetorno).AsString
   except
      Result := '';
      MsgDlg('Campo '+psNomeCampoRetorno+' não existe no Registro de Eventos.','Erro',mtError,[mbOk,mbHelp],0);
   end;
   qryAux.Close;
end; // BuscaUltimoEvento

function BuscaINSSEmVigor ( qry : TwwQuery;
                            piIdPessJur, piIdPlanoPrev, piIdTitular,
                            piIdPessoa,
                            piIdBeneficioAtual  : longint;
                            psDataInicioAtual    : string;
                            var psValorCalculado, psValorInformado,
                                psDataInicio,     psNumProcINSS,
                                psValorBase1,     psValorBase2,
                                psValorBase3, psNumProcesso                    : string ) : boolean;
begin
  Result := True;
  with qry do
  begin
     // CAMILLE - REFER - 02.03.2001
     Close;
     SQL.Clear;
     SQL.Add(' SELECT BF.NUMPROCINSS, BF.VALORATUAL, BF.VLRINFINSS, BF.DATAINICIOINSS, '+
             '        BF.VALORTOTAL,                                                   '+
             '        BPP.VALORBASE1, BPP.VALORBASE2, BPP.VALORBASE3,                   '+
             '        BF.NUMEROPROCESSO '+ //leofuncef - 25/03/2003 - acrescentei BF.NUMEROPROCESSO
             ' FROM   PROCESSOBENEF P,     BENEFPLANOPART BPP, BENEFBFCIARIO BF,       '+
             '        BENEFPLANPREV BP,    BENEFICIO B                                 '+
             ' WHERE  (BF.IDPESSJUR       = '+IntToStr(piIdPessJur)    +')'+
             ' AND    (BF.IDPLANOPREV     = '+IntToStr(piIdPLANOPREV)  +')'+
             ' AND    (BF.IDPESSOA        = '+IntToStr(piIdPessoa)     +')'+ // CAMILLE - FUNCEF - 27.03.2001
             ' AND    (BF.IDTITULAR       = '+IntToStr(piIdTitular)    +')'+
             ' AND    (BF.IDBENEFICIO     <> '+IntToStr(piIdBeneficioAtual)+')'+
             //leofuncef - 30082003 - inicio
             //' AND    (BF.DATAINICIO      <= TO_DATE('''+psDataInicioAtual+''',''DD/MM/YYYY'') ) '+
             ' AND    (BF.DATAINICIOFUND      <= TO_DATE('''+psDataInicioAtual+''',''DD/MM/YYYY'') ) '+
             //leofuncef - 30/08/2003 - fim
             ' AND    (BF.IDSITBENEFICIO  IN (1,4) )          '+
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
             ' ORDER BY BF.DATAINICIO DESC                    ');
     Open;
     qry.First;
     if not qry.IsEmpty
     then begin
        if piIdTitular <> piIdPessoa
        then psValorCalculado := qry.FieldByName('VALORTOTAL').AsString
        else psValorCalculado := qry.FieldByName('VALORATUAL').AsString;

        psValorInformado := qry.FieldByName('VLRINFINSS').AsString;
        psDataInicio     := qry.FieldByName('DATAINICIOINSS').AsString;
        psNumProcINSS    := qry.FieldByName('NUMPROCINSS').AsString;
        psValorBase1     := qry.FieldByName('VALORBASE1').AsString;
        psValorBase2     := qry.FieldByName('VALORBASE2').AsString;
        psValorBase3     := qry.FieldByName('VALORBASE3').AsString;
        psNumProcesso    := qry.FieldByName('NUMEROPROCESSO').AsString;
     end
     else begin
        psValorCalculado := '0';
        psValorInformado := '0';
        psDataInicio     := '';
        psNumProcINSS    := '';
        psValorBase1     := '0';
        psValorBase2     := '0';
        psValorBase3     := '0';
        psNumProcesso    :=  '';
     end;
     Close;
  end;
  Result := True;
end;

function BuscaSalario(piIdPessJur, piIdPlanoPrev, piIdPessoa  : longint;
                      psAnoMes, psSitFundacao,
                      sSalario                 : string;
                      var sMsgErro             : string;
                      qryAux                   : TwwQuery ) : string;
var sNovoSalario,
    sNomeRubrica,
    sIdRubrica,
    sDescRubrica  : string;
begin
   Result := sSalario;

   sNovoSalario := '';

   // Preencher dados da rubrica de salario de participacao
   if psSitFundacao = 'MA' // Mantido
   then begin
      sDescRubrica := 'Salário de Manutenção Integral';
      sNomeRubrica := 'IDRUBSALMANUT';
   end
   else begin
      if psSitFundacao = 'MP' // Mantido Parcial
      then begin
         sDescRubrica := 'Salário de Manutenção Parcial';
         sNomeRubrica := 'IDRUBSALMANUTPARC';
      end
      else begin // Outras situacoes (Ativo, etc)
         if Copy(psAnoMes,6,2) = '13'
         then begin
            sDescRubrica := 'Décimo Terceiro Salário ';
//            sNomeRubrica := 'IDRUBDECTERC';

            { Inicio Augusto 01-07-2002 }
            with qryAux do
            begin
              // Busca Identificados da Rubrica na PARAMSAL13
              Close;
              SQL.Clear;
              SQL.Add(' SELECT PAR.IDPESSJUR, PAR.EXERCICIO,                 '+
                      '        PAR.MESREFERENCIA, PAR.IDREGRA, PAR.IDRUBRICA '+
                      ' FROM PARAMSAL13 PAR '+
                      ' WHERE (PAR.IDPESSJUR = '+IntToStr(piIdPessJur)+')  AND '+
                      '       (SUBSTR(PAR.MESREFERENCIA,1,4) = '''+Copy(psAnoMes,1,4)+''') ');

              Open;
              // Guarda identificador caso encontre
              if not IsEmpty
              then sIdRubrica := FieldByName('IDRUBRICA').AsString
              else begin
                 SQL.Clear;
                 SQL.Add(' SELECT PT.IDRUBSALPARTICIP AS IDRUBRICA,   RP.CODPROVDESC,  '+
                         '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
                         '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
                         ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
                         ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
                         ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
                         ' AND    RP.IDRUBRICA = PT.IDRUBSALPARTICIP '+
                         ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
                 Open;
                 if not IsEmpty
                 then sIdRubrica := FieldByName('IDRUBRICA').AsString
                 else begin
                    sMsgErro := 'A Rubrica de '+sDescRubrica+' não foi encontrada no cadastro. Verifique.';
                    Exit;
                 end;
              end;
            end;
              { Fim Augusto 01-07-2002 }
         end
         else begin
            sDescRubrica := 'Salário de Participação';
            sNomeRubrica := 'IDRUBSALPARTICIP';
         end;
      end;
   end;


   { Caso seja Rubrica da 13º, pesquisa já foi feita }
   if (Copy(psAnoMes,6,2) <> '13' ) { Augusto 01-07-2002}
      or ((psSitFundacao = 'MP') OR (psSitFundacao = 'MA')) then begin //leofuncef - 08022004
     with qryAux do
     begin
        SQL.Clear;
        SQL.Add(' SELECT PT.'+sNomeRubrica+' AS IDRUBRICA,   RP.CODPROVDESC,  '+
                '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
                '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
                ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
                ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
                ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
                ' AND    RP.IDRUBRICA = PT.'+sNomeRubrica+
                ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
        Open;
        if not IsEmpty
        then sIdRubrica := FieldByName('IDRUBRICA').AsString
        else begin
           sMsgErro := 'A Rubrica de '+sDescRubrica+' não foi encontrada no cadastro. Verifique.';
           Exit;
        end;
     end; // with
   end;


   if trim(sIdRubrica) = '' then
   begin
      qryaux.close;
      qryaux.SQL.Clear;
      qryaux.SQL.Add(' SELECT PT.IDRUBSALPARTICIP AS IDRUBRICA,   RP.CODPROVDESC,  '+
              '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
              '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
              ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
              ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
              ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
              ' AND    RP.IDRUBRICA = PT.IDRUBSALPARTICIP '+
              ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
      qryaux.Open;
      if not qryaux.IsEmpty
      then sIdRubrica := qryaux.FieldByName('IDRUBRICA').AsString
      else begin
         sMsgErro := 'A Rubrica de '+sDescRubrica+' não foi encontrada no cadastro. Verifique.';
         Exit;
      end;
   end;

   with qryAux
   do begin
      // Verificar se salário já existe neste mes
      Close;
      SQL.Clear;
      SQL.Add(' SELECT /*+ RULE */ DECODE(VLRANTRETROATIVO, NULL, VALORPROVENTO , VLRANTRETROATIVO) AS VALORPROVENTO '+
              ' FROM HISTRUBSAL '+
              ' WHERE (IDPESSOA  = '+IntToStr(piIdPessoa) +')  AND '+
              '       (MES       = '''+psAnoMes           +''')  AND '+
              '       (IDRUBRICA = '''+sIdRubrica         +''')  AND '+
              '       (IDPESSJUR = '+IntToStr(piIdPessJur)+')  ');


      Open;
      if not IsEmpty
      then sNovoSalario := FieldByName('ValorProvento').AsString
      else sNovoSalario := sSalario;
   end;
   qryAux.Close;

   if StrToFloat(ClienteNumero(sNovoSalario)) <= 0
   then begin
      sNovoSalario := BuscaSalarioPESSOA (qryAux,
                                          piIdPessJur, piIdPlanoPrev, piIdPessoa, 1,
                                          psSitFundacao,
                                          psAnoMes );
   end;

   Result := sNovoSalario;
end; // BuscaSalario

function CalcRUBPARCIAL(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica : integer;
    iTentativas : integer;
    bAchou      : boolean;
    sMesAux     : string;

begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDRUBSALMANUTPARC AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+IntToStr(iIDPessJur));
     Open;
     if IsEmpty then Exit;
     iIdRubrica := FieldByName('IdRubrica').AsInteger;

     sMesAux := sMesRef;

     bAchou  := False;
     iTentativas := 0;

     while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT /*+ RULE */ H.VALORPROVENTO '+
                ' from   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
        Open;
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  if Trim(Result) = ''
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALMANTIDO FROM PARTPREVPLAN '+
                 ' WHERE IDPESSJUR = '+IntToStr(iIdPessJur)+' AND '+
                 '       IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+' AND '+
                 '       IDPESSOA = '+IntToStr(iIdPessoa)+' AND '+
                 '       SEQPROPOSTA = '+IntToSTr(iSeqProposta));
     qry.Open;
     if qry.IsEmpty
     then Result := '0'
     else if qry.FieldByName('SalMantido').AsSTring <> ''
          then Result := qry.FieldByName('SalMantido').AsString
          else Result := '0';
  end;
end;

function TruncaRound(f:String;n:integer):string;
var
 i,j:integer;
// Inteiro , Decimal, DecimalPos, sAux : String; // CAMILLE - REFER - 15.03.99
// rDecimalPos, // CAMILLE - REFER - 15.03.99
 rInteiro : Extended;
 cAux :Char;
begin
   cAux := DecimalSeparator;
   Result := (f);

   i:=pos(',',result);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',result);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if (i <> 0) and (length(copy(result,i+1,length(result)))>n) then
   begin
       rInteiro := strtofloat(result);
       rInteiro := strtofloat(f)*power(10,n);
       j := pos(DecimalSeparator,floattostr(rinteiro));
       //if j <> 0 then  rInteiro := round(rinteiro);
       if j <> 0 then  rInteiro := ArredondaValor(floattostr(rinteiro));
       rInteiro := rInteiro/power(10,n);
       Result := copy(floattostr(rinteiro),1,i+n)
   end;
   DecimalSeparator := cAux;
end;

function VoltaValorCotacao(qryaux : Twwquery ; sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva, sDataMov : String) : Double;
var cAux : char ;
    stipoMoeda : String;
begin
 Result := 0;
 if Trim(sIndiceReajuste) = '' then Exit;

 //leo - 15042002
 VerifIndiceHist(qryaux , sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva ,sDataMov );

 //transformar o número de cotas da reserva em moeda
 qryaux.Close;
 qryaux.sql.clear;
 qryaux.SQL.add('SELECT  MOEPERIODICIDADE '+
                ' FROM MOEDA '+
                ' WHERE MOECODIGO = '+sIndiceReajuste+' ');
 Try
   qryaux.Open;
 Except
   result := 0;
   exit;
 End;
 if qryaux.IsEmpty then begin
   result := 0;
   exit;
 end;


 sTipoMoeda := qryAux.FieldByName('MOEPERIODICIDADE').AsString;
 qryaux.Close;
 qryaux.sql.clear;
 if sTipoMoeda = 'M' Then Begin

    qryaux.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                   ' AND (COTMESREF = '''+copy(sDataMov,4,2)+copy(sDataMov,7,4)+ '''))'); // CAMILLE - 09.02.2000
// FDIAS - REFER - 04.06.2001 RETIRADO COTMESREF <=
  end
  else begin
    qryaux.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                   ' AND COTDATA <= TO_DATE(''' + sDataMov +''',''DD/MM/YYYY'')) '); // leofuncef - 03092003 - tirei = e coloquei <=
// FDIAS - REFER - 04.06.2001 RETIRADO COTMESREF <=

  end;
  try
    qryaux.Open;
  except
   result := 0;
   exit;
  end;
 if qryaux.IsEmpty then
 begin
   //erro - não encontrou cotacao para moeda
   result := 0;
   exit;
 end
 else
 begin
    cAux := DecimalSeparator;
    DecimalSeparator := '.';
    result := strtofloat(ClienteNumero(truncaround(qryaux.fieldbyname('COTVALOR').AsString,8))); //leorefer - 0901 - mudei de 6 para 8
    DecimalSeparator := cAux;
 end;

end;

function BuscaSalarioPESSOA (qryAux : TwwQuery;
                             piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                             psFlgIntSitPartHOJE,
                             psAnoMesBusca : string ) : string;
var sSituacaoNaEpoca,
    sIdPessJurNaEpoca,
    sIdPlanoNaEpoca,
    sIdEventosPrevDaEpoca,
    sSalarioNaEpoca,
    sUltDiaMes              : string;
    iUltDiaMes              : integer;
begin
    Result := '0';

    if Copy(psAnoMesBusca,6,2) = '13'
    then psAnoMesBusca := Copy(psAnoMesBusca,1,4)+'/12';

    iUltDiaMes := TrazUltDiaMes( StrToInt(Copy(psAnoMesBusca,6,2)),
                                 StrToInt(Copy(psAnoMesBusca,1,4)) );
    if iUltDiaMes <= 9
    then sUltDiaMes := '0'+IntToStr(iUltDiaMes)
    else sUltDiaMes := IntToStr(iUltDiaMes);

    with qryAux do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT EV.IDPESSJUR, EV.IDPLANOPREV, SP.FLGINTERNO,  PT.IDRUBSALAUXDOENCA, '+
               '        PT.IDRUBSALMANUT, PT.IDRUBSALMANUTPARC, PT.IDRUBSALPARTICIP '+
               ' FROM   PATRO PT, SITPART SP, EVENTOSPREV EV '+
               ' WHERE  EV.IDPESSOA      = '+IntToStr(piIdPessoa)+
               ' AND    EV.SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
               ' AND    EV.DATAEVENTO    = TO_DATE('''+sUltDiaMes+'/'+Copy(psAnoMesBusca,6,2)+'/'+Copy(psAnoMesBusca,1,4)+''', ''DD/MM/YYYY'') '+
               ' AND    EV.IDPESSJUR     = PT.IDPESSOA '+
               ' AND    EV.IDSITPARTNOVO = SP.IDSITPART '+
               ' ORDER BY EV.DATAEVENTO DESC ');
       Open;

       if not IsEmpty
       then begin
          sSituacaoNaEpoca  := FieldByName('FlgInterno').AsString;
          sIdPessJurNaEpoca := FieldByName('IdPessJur').AsString;
          sIdPlanoNaEpoca   := FieldByName('IdPlanoPrev').AsString;
       end
       else begin
          sSituacaoNaEpoca  := psFlgIntSitPartHOJE;
          sIdPessJurNaEpoca := IntToSTr(piIdPessJur);
          sIdPlanoNaEpoca   := IntToSTr(piIdPlanoPrev);
       end;
       if sSituacaoNaEpoca = 'AT'
       then sSalarioNaEpoca := CalcSALPART( StrToInt(sIdPessJurNaEpoca),
                                          piIdPessoa,
                                          psAnoMesBusca,
                                          qryAux )
       else if sSituacaoNaEpoca = 'MA'
            then sSalarioNaEpoca := CalcRUBMANTIDO( StrToInt(sIdPessJurNaEpoca),
                                          StrToInt(sIdPlanoNaEpoca),
                                          piIdPessoa,
                                          piSeqProposta,
                                          psAnoMesBusca,
                                          qryAux )
            else if sSituacaoNaEpoca = 'MP'
                 then sSalarioNaEpoca := CalcRUBPARCIAL( StrToInt(sIdPessJurNaEpoca),
                                          StrToInt(sIdPlanoNaEpoca),
                                          piIdPessoa,
                                          piSeqProposta,
                                          psAnoMesBusca,
                                          qryAux )
                 else sSalarioNaEpoca := CalcSALVIRTUAL( StrToInt(sIdPessJurNaEpoca),
                                          piIdPessoa,
                                          psAnoMesBusca,
                                          qryAux );
    end;
    Result := OraNumero(sSalarioNaEpoca);
end;

function ArredondaValor(Valor : String) : Extended;
var cAux : Char;
    i : Integer;
    sValorInt, sValorDec : String;
    dValorInt , dValorDec : Extended;
begin
   cAux := DecimalSeparator;

   if Valor = '' then
   begin
      Result := 0;
      exit;
   end;

   i:=pos(',',Valor);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',Valor);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if i <> 0 then
   begin
      sValorInt := Copy(valor,0,i-1);
      sValorDec := Copy(valor,i+1,1);
      dValorInt := strtofloat(sValorInt);
      dValorDec := strtofloat(sValorDec);

      if dValorDec >= 5 then
      dValorInt := dValorInt + 1;
   end
   else dValorInt := StrToFloat(Valor);


   Result := dValorInt;
   DecimalSeparator := cAux;
end;

procedure VerifIndiceHist(qryaux : twwquery;  var sIndice : String ; sIdPLanoPrev, sIdTipoReserva: String ; sDataCota : String);
begin

   //verifica histórico de índices de reservas
   //para o mês informado
   //vai pegar a última moeda cadastrada
   qryaux.Close;
   qryaux.sql.clear;
   qryaux.SQL.add(' SELECT  INDICEREAJUSTE '+
                  ' FROM HISTINDICERESERVA '+
                  ' WHERE '+
                  ' IDPLANOPREV = '''+sIdPLanoPrev+''' AND '+
                  ' IDTIPORESERVA = '''+sIdTipoReserva+''' AND '+
                  ' TO_DATE(TO_CHAR(DATAFIM,''DD/MM/YYYY''),''DD/MM/YYYY'')  '+
                  ' >= TO_DATE('''+sDataCota+''',''DD/MM/YYYY'') '+
                  ' ORDER BY DATAFIM DESC ');
   Try
     qryaux.Open;
   Except
     exit;
   End;
   //se houver algum registro, que dizer que já houve
   //miudança no cadastro de índice
   //então pego o primeiro registro e troco o id da função
   if not qryaux.isempty then
      sIndice := qryaux.fieldbyname('INDICEREAJUSTE').AsString;

end;

function CalcRUBMANTIDO(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica : integer;
    iTentativas : integer;
    bAchou      : boolean;
    sMesAux     : string;

begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDRUBSALMANUT AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+IntToStr(iIDPessJur));
     Open;
     if IsEmpty then Exit;
     iIdRubrica := FieldByName('IdRubrica').AsInteger;

     sMesAux := sMesRef;

     bAchou  := False;
     iTentativas := 0;

     while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
     begin
        Close;
        SQL.Clear;
        
        // Gleyber - 18/06/2004 - Pendência 17034 - Início
        // SQL.Add(' SELECT /*+ RULE */ H.VALORPROVENTO '+
        // O select da query foi alterado para considerar no campo VALORINTEGRAL:
        // para valores nulos ou zerados o campo VALORPROVENTO,
        // caso contrário usa-se VALORINTEGRAL
        // assemelhando-se assim a rotina CalcSalPart
        SQL.Add(' SELECT /*+ RULE */ DECODE(H.VALORINTEGRAL, '+
                                             ' NULL, H.VALORPROVENTO, '+
                                             '    0, H.VALORPROVENTO, H.VALORINTEGRAL) AS VALORPROVENTO '+
        // Gleyber - 18/06/2004 - Pendência 17034 - Fim
                ' from   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
        Open;
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  if Trim(Result) = ''
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALMANTIDO FROM PARTPREVPLAN '+
                 ' WHERE IDPESSJUR = '+IntToStr(iIdPessJur)+' AND '+
                 '       IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+' AND '+
                 '       IDPESSOA = '+IntToStr(iIdPessoa)+' AND '+
                 '       SEQPROPOSTA = '+IntToSTr(iSeqProposta));
     qry.Open;
     if qry.IsEmpty
     then Result := '0'
     else if qry.FieldByName('SalMantido').AsSTring <> ''
          then Result := qry.FieldByName('SalMantido').AsString
          else Result := '0';
  end;
end;

function CalcSalVIRTUAL(iIdPessJur, iIdPessoa  : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica  : longint;
    iTentativas : integer;
    bAchou      : boolean;
    sMesAux     : string;
begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT PT.IDRUBSALAUXDOENCA '+
             ' FROM   PATRO PT  '+
             ' WHERE  (PT.IDPESSOA     = '+IntToStr(iIdPessJur)+')');
     Open;
     if IsEmpty then Exit;

     iIdRubrica := FieldByName('IdRubSalAuxDoenca').AsInteger;
     sMesAux := sMesRef;
     bAchou  := False;
     iTentativas := 0;
     while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT /*+ RULE */ H.VALORPROVENTO '+
                ' from   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
        Open;
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  // Se nao achar o salario no historico de rubrica tentar usar o valor
  // da tabela de participante
  if StrToFloat(ClienteNumero(Result)) <= 0
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALAUXDOENCA FROM PARTPREVPLAN '+
                    ' WHERE (IDPESSOA  = '+IntToStr(iIdPessoa)+')'+
                    ' AND   (IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
                    ' AND   (FLGDESATIVADO = 0) ');
     qry.Open;
     if qry.IsEmpty then Exit;
     Result := qry.FieldByName('SALAUXDOENCA').AsString;
  end;
end;

function  ArredondaMoeda(pNumero: double) : double;
 var p: double;
     s: string;
begin
  p:=pNumero*100;
  s:=floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p:=round( p );
  result:=p/100;
end;

function TruncaMoeda(pNumero: double) : double;
 var p: double;
     s: string;
begin
  p:=pNumero*100;
  s:=floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p:=trunc( p );
  result:=p/100;
end;

end.
