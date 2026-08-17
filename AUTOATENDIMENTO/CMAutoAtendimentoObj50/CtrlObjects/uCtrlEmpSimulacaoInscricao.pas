unit uCtrlEmpSimulacaoInscricao;

interface

uses
  SysUtils, HTTPApp, ADODB, Db, Jpeg, extctrls, graphics, JCLStrings, uConstPaginasCampos, uDiasUteis, uSistema,
  uCmFileUtils, DModAutoAtendimento, Classes, uCtrlPadroes, uCmTypes, uVersoes, JCLSysUtils, uMidasUtil,
  uCtrlFuncoesAA, uTypesEmptmoAA, uCMClientDataSet, uWebEmpSimulacaoInscricao, uFuncoesEmprestimo;


//Dados do solicitante
Type TSolicitante = Record
     iIDTITULAR,
     iIDBENEF,
     iIDINSCRICAOPREV,
     iIDSITPART,
     iIDPESSJUR,
     iIDPLANOPREV : integer;
     sMATRICULA,
     sFLGINTERNO,
     sCPF,
     sCPF_TIT,
     sMATRICULA_TIT : String;
end;

//Parâmetros de empréstimo
Type TParamEmptmo = Record
     sFLGFORMAPAG,
     sFLGFORMAREC,
     sCODESTADO,
     sHORAENCERRA : String;
     iFLGTRATAASSINAT,
     iFLGPENDCONCESSAO,
     iFLGCALCDIA,
     iFLGCONTROLAINSC,
     iFLGRENPRESTAB,
     iFLGCONCULTDIAMES,
     iFLGDATAATUSLD,
     iFLGOBRIGAAVALISTA,
     iFLGSALDODEVANT,
     iFLGUSAFIARIO,
     iFLGESTORNOPOSQUIT,
     iFLGQUITAPARCMORTE,
     iIDREGRAAVAL,
     iIDITEMDEVSEGQUIT,
     iIDITEMPROVPERDA,
     iIDPAIS,
     iIDCIDADES,
     iIDESTADO,
     iIDITEMSEGCONC,
     iIDITEMSEGCOMPL,
     iFLGABONODIVERG : integer;
     bFLGEXCEPCIONAL : boolean;
     iIDREGRATIPOCONTR : integer;
     iIDREGRAPLANOCOB : integer; //Pendência 26775 - 26/12/2007
end;

//Dados do Tipo do Contrato
Type TTipoContratoEmptmo = Record
     iIDTIPOCONTREMPTMO,
     iIDTIPOEMPTMO,
     iIDREGRAELEG,
     iTCEMINRENOVA,
     iTEPMAXCONTRATO,
     iIDREGRADATACRED,
     iIDREGRAPRIMPARC,
     iIDREGRASALBAS,
     iIDREGRAMARGEM,
     iIDREGRARESERVA,
     iIDREGRAJURCONC,
     iIDREGRAJUREXIBE,
     iIDREGRAPRAZOSCONC,
     iIDREGRAPRAZOMAX,
     iIDREGRALIMITES,
     iTCEMAXINSCR,
     iTCEMAXCONTRATO,
     iTCENUMPARCSIM,
     iNUMPARCDESCONTO,
     iFLGOBRIGBENEF,
     iFLGVERPRAZOTIPOQUIT,
     //Pendência 27232 e 27749 - 17/04/2008
     iFLGVERIFICACONTRATO,
     iFLGVERIFICAITEMABERTO,
     iFLGNAOVERIFICAMRGPCL : integer;
     //Fim Pendência 27232 e 27749
     sTCEDESCRICAO,
     sDESCTIPOEMPTMO,
     sMOESIGLA,
     sMOECODIGO : string;
end;

// Parametros para simulação
type TParamSimulacao = record
     dDTCREDITO,
     dDT1APARCELA,
     dANTDATACREDITO,
     dDATAFINALBENEFICIO : TdateTime;
     iCARENCIA,
     iMINPARCELAS,
     iMAXPARCELAS,
     iANTIDCONTRATOEMPTMO,
     iANTIDTIPOCONTREMPTMO,
     iANTPRAZO,
     iANTULTPARCGERADA,
     iANTNUMPARCPAGAS,
     iQTDEPQUITADO,
     iQTDEITENSEMPTMO,
     iQTDEPARCELASEMABERTO,
     iPOSSUIASSINATURA : Integer;
     fVALRESERVA,
     fANTVALORSOLIC,
     fSALPARTICIPACAO,
     fSALMANTIDO,
     fSALAUXDOENCA,
     fSALBENEF,
     fVLRSALBASE,
     fVLRMARGEM,
     fVLRMAXPERMIT,
     fSALDOQUITACAO,
     fQUITACAO,
     fSALDOAQUITAR,
     fTXJUROS,
     fTXJUROSEXIBE,
     fTOTALPARCELAS,
     fTOTALPENDENCIAS,
     fVLRDEVSEG,
     fVLRSEGUROANT,
     fVLRSEGUROCOMPLANT,
     fVLREMABERTO  : Currency;
     sPARCELAS,
     sPARCELAS2,
     sARQCONTRATOSANTERIORES,
     sMSGRESTRITIVA : string;
     iIDULTHISTMOVEMPTMO : Extended;
end;

// Resultado da Simulacao
type TSimulacao = record
     vPARCELAS : OLEVariant;
     fVLRSOLICITADO: Currency;
     sARQLISTA : string;
     iSEQPASSO : Integer;
     iPARCELAS : Integer;
     sFORMAPAGTO,
     sFORMARECTO,
     sCODFORMAPAGTO,
     sCONTABANCARIAPAG,
     sCONTABANCARIAREC,
     sPORTFORMAPAGTO,
     sPORTFORMARECTO : string;
     fVLRPARCCALC,
     fVLRLIQUIDOEP : currency;
     iIDFORNCRED,
     iIDAVALISTA : int64;
     sBENEFICIARIOS: string;
     iCODAUTOEMP: Extended;
end;




Type TCtrlEmpSimulacaoInscricao = Class(TObject)

   Private
      FsMsgErro: String;
      procedure SetsMsgErro(const Value: String);
      function  GetsMsgErro: String;

   Public
      property sMsgErro : String read GetsMsgErro write SetsMsgErro;

      function CriaCdsResult : OLEVariant;
      function RecuperaCdsResult ( const vResult : OLEVariant; var rSolicitante : TSolicitante; var rParamEmptmo: TParamEmptmo;
                                                               var rTipoContratoEmptmo: TTipoContratoEmptmo ) : Boolean;
      function RecuperaParamSimulacao ( const vResult : OLEVariant; var rParamSimulacao : TParamSimulacao ) : Boolean;
      function RecuperaSimulacao ( const vResult, vParcelas : OLEVariant; var rSimulacao : TSimulacao ) : Boolean;


      function ParamSimulacao( var vResult, vContrAnteriores : OLEVariant; const sContrAQuitar: string) : Boolean;
      //Pendência 28160 - 12/06/2008
      //function Simulacao( const fVlrSolicitado: Currency; const sPrazos: string; var vResult: OLEVariant; var vParcelas: OLEVariant) : Boolean;
      function Simulacao( var fVlrSolicitado: Currency; const sPrazos: string; var vResult: OLEVariant; var vParcelas: OLEVariant) : Boolean;
      //Fim Pendência 28160
      function ParamConcessao( var vResult : OLEVariant; const vParcelas: OLEVariant; const fVlrSolicitado: Currency;
                               const iParcelas, iIdFornecedor, iCodAutoEmp: Extended;
                               const sBanco, sAgencia, sContaCorrente: string ) : Boolean;
      function InscricaoConcessao( const iTipoGravacao: Integer; var vResult: OLEVariant; const vParcelas, vContrAnt: OLEVariant) : Boolean;
      function InsereAssinaContr ( const iIdTitular,
                                         iIdBenef: Integer;
                                   const iIdContratoPadrao: Integer;
                                   const sNumContrato: string;
                                   const dDataAssinatura: TDateTime) : Boolean;
      //Pendência 27300 - 28/01/2008
      function RemoveAssinaContr(const sNumContrato: string): Boolean;
      //Fim Pendência 27300
      function ChecaAutoEmp (const fCodAutoEmp:Extended): Extended;


end;



var CtrlEmpSimulacaoInscricao : TCtrlEmpSimulacaoInscricao;



implementation

{ TCtrlEmpSimulacaoInscricao }

function TCtrlEmpSimulacaoInscricao.CriaCdsResult: OLEVariant;
var cdsTemp : TCMClientDataSet;
begin
   try
      cdsTemp := TCMClientDataSet.Create( nil );

      //-----------------------------------------
      // Monta parâmetros do solicitante
      //-----------------------------------------

      cdsTemp.FieldDefs.Add('sol_iIdTitular',       ftInteger );
      cdsTemp.FieldDefs.Add('sol_iIdBenef',         ftInteger );
      cdsTemp.FieldDefs.Add('sol_iIdInscricaoPrev', ftInteger );
      cdsTemp.FieldDefs.Add('sol_iIdSitPart',       ftInteger );
      cdsTemp.FieldDefs.Add('sol_iIdPessJur',       ftInteger );
      cdsTemp.FieldDefs.Add('sol_iIdPlanoPrev',     ftInteger );
      cdsTemp.FieldDefs.Add('sol_sMatricula',       ftString, 100 );
      cdsTemp.FieldDefs.Add('sol_sFlgInterno',      ftString, 100 );
      cdsTemp.FieldDefs.Add('sol_sCPF',             ftString, 100 );
      cdsTemp.FieldDefs.Add('sol_sCPF_TIT',         ftString, 100 );
      cdsTemp.FieldDefs.Add('sol_sMatricula_TIT',   ftString, 100 );
      cdsTemp.FieldDefs.Add('sol_sNumBanco',        ftString, 100 );
      cdsTemp.FieldDefs.Add('sol_sNumAgencia',      ftString, 100 );
      cdsTemp.FieldDefs.Add('sol_sNumContaCorrente',ftString, 100 );

      //-----------------------------------------
      // Monta parâmetros do empréstimo
      //-----------------------------------------

      cdsTemp.FieldDefs.Add('emp_sFlgFormaPag',       ftString, 1 );
      cdsTemp.FieldDefs.Add('emp_sFlgFormaRec',       ftString, 1 );
      cdsTemp.FieldDefs.Add('emp_sCodPortFormaRec',   ftString, 100 );
      cdsTemp.FieldDefs.Add('emp_sCodPortFormaPag',   ftString, 100 );
      cdsTemp.FieldDefs.Add('emp_sCodFormaPag',       ftString, 100 );
      cdsTemp.FieldDefs.Add('emp_sCodEstado',         ftString, 2   );
      cdsTemp.FieldDefs.Add('emp_sHoraEncerra',       ftString, 100 );
      cdsTemp.FieldDefs.Add('emp_iFlgTrataAssinat',   ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgPendConcessao',  ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgCalcDia',        ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgControlaInsc',   ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgRenPrestab',     ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgConcUltDiaMes',  ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgDataAtuSld',     ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgObrigaAvalista', ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgSaldoDevAnt',    ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgUsaFiario',      ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgEstornoPosQuit', ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgQuitaParcMorte', ftInteger );
      cdsTemp.FieldDefs.Add('emp_iIdRegraAval',       ftInteger );
      cdsTemp.FieldDefs.Add('emp_iIdItemDevSegQuit',  ftInteger );
      cdsTemp.FieldDefs.Add('emp_iIdItemProvPerda',   ftInteger );
      cdsTemp.FieldDefs.Add('emp_iIdPais',            ftInteger );
      cdsTemp.FieldDefs.Add('emp_iIdCidades',         ftInteger );
      cdsTemp.FieldDefs.Add('emp_iIdEstado',          ftInteger );
      cdsTemp.FieldDefs.Add('emp_iIdItemSegConc',     ftInteger );
      cdsTemp.FieldDefs.Add('emp_iIdItemSegCompl',    ftInteger );
      cdsTemp.FieldDefs.Add('emp_iFlgAbonoDiverg',    ftInteger );
      cdsTemp.FieldDefs.Add('emp_bFlgExcepcional',    ftBoolean );
      cdsTemp.FieldDefs.Add('emp_iIdRegraTipoContr',  ftInteger );
      //Pendência 26775 - 26/12/2007
      cdsTemp.FieldDefs.Add('emp_iIdRegraPlanoCob',   ftInteger );

      //-----------------------------------------
      // Monta parâmetros do tipo de contrato
      //-----------------------------------------

      cdsTemp.FieldDefs.Add('con_iIdTipoContrEmptmo', ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdTipoEmptmo',      ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraEleg',       ftInteger );
      cdsTemp.FieldDefs.Add('con_iTCEMinRenova',      ftInteger );
      cdsTemp.FieldDefs.Add('con_iTepMaxContrato',    ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraDataCred',   ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraPrimParc',   ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraSalBas',     ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraMargem',     ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraReserva',    ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraJurConc',    ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraJurExibe',   ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraPrazosConc', ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraPrazoMax',   ftInteger );
      cdsTemp.FieldDefs.Add('con_iIdRegraLimites',    ftInteger );
      cdsTemp.FieldDefs.Add('con_iTCEMaxInscr',       ftInteger );
      cdsTemp.FieldDefs.Add('con_iTCEMaxContrato',    ftInteger );
      cdsTemp.FieldDefs.Add('con_iTCENumParcSim',     ftInteger );
      cdsTemp.FieldDefs.Add('con_iNumParcDesconto',   ftInteger );
      cdsTemp.FieldDefs.Add('con_iFlgObrigBenef',     ftInteger );
      cdsTemp.FieldDefs.Add('con_iFlgVerPrazoTipoQuit', ftInteger );
      cdsTemp.FieldDefs.Add('con_iFlgVerificaContrato', ftInteger );
      //Pendência 27232 e 27749 - 17/04/2008
      cdsTemp.FieldDefs.Add('con_iFlgVerificaItemAberto', ftInteger );
      cdsTemp.FieldDefs.Add('con_iFlgNaoVerificaMrgPcl' , ftInteger );
      //Fim Pendência 27232 e 27749
      cdsTemp.FieldDefs.Add('con_sTCEDescricao',      ftString, 1000 );
      cdsTemp.FieldDefs.Add('con_sDescTipoEmptmo',    ftString, 1000 );
      cdsTemp.FieldDefs.Add('con_sMoeSigla',          ftString, 1000 );
      cdsTemp.FieldDefs.Add('con_sMoeCodigo',         ftString, 1000 );
      cdsTemp.FieldDefs.Add('con_sFlgFormaPag',       ftString, 1 );
      cdsTemp.FieldDefs.Add('con_sFlgFormaRec',       ftString, 1 );


      //-----------------------------------------
      // Monta parâmetros de simulação
      //-----------------------------------------

      cdsTemp.FieldDefs.Add('par_dDtCredito',              ftDateTime );
      cdsTemp.FieldDefs.Add('par_dDt1aParcela',            ftDateTime );
      cdsTemp.FieldDefs.Add('par_iCarencia',               ftInteger );
      cdsTemp.FieldDefs.Add('par_fValReserva',             ftCurrency );
      cdsTemp.FieldDefs.Add('par_iMinParcelas',            ftInteger );
      cdsTemp.FieldDefs.Add('par_iMaxParcelas',            ftInteger );
      cdsTemp.FieldDefs.Add('par_iAntIdContratoEmptmo',    ftInteger );
      cdsTemp.FieldDefs.Add('par_iAntIdTipoContrEmptmo',   ftInteger );
      cdsTemp.FieldDefs.Add('par_fAntValorSolic',          ftCurrency );
      cdsTemp.FieldDefs.Add('par_dAntDataCredito',         ftDateTime );
      cdsTemp.FieldDefs.Add('par_iAntPrazo',               ftInteger );
      cdsTemp.FieldDefs.Add('par_iAntUltParcGerada',       ftInteger );
      cdsTemp.FieldDefs.Add('par_iAntNumParcPagas',        ftInteger );
      cdsTemp.FieldDefs.Add('par_fSalParticipacao',        ftCurrency );
      cdsTemp.FieldDefs.Add('par_fSalMantido',             ftCurrency );
      cdsTemp.FieldDefs.Add('par_fSalAuxDoenca',           ftCurrency );
      cdsTemp.FieldDefs.Add('par_fSalBenef',               ftCurrency );
      cdsTemp.FieldDefs.Add('par_fVlrSalBase',             ftCurrency );
      cdsTemp.FieldDefs.Add('par_fVlrMargem',              ftCurrency );
      cdsTemp.FieldDefs.Add('par_fVlrMaxPermit',           ftCurrency );
      cdsTemp.FieldDefs.Add('par_dDataFinalBeneficio',     ftDateTime );
      cdsTemp.FieldDefs.Add('par_fSaldoQuitacao',          ftCurrency );
      cdsTemp.FieldDefs.Add('par_iQtdEPQuitado',           ftInteger );
      cdsTemp.FieldDefs.Add('par_sParcelas',               ftString, 2000 );
      cdsTemp.FieldDefs.Add('par_sParcelas2',              ftString, 2000 );
      cdsTemp.FieldDefs.Add('par_fQuitacao',               ftCurrency );
      cdsTemp.FieldDefs.Add('par_fSaldoaQuitar',           ftCurrency );
      cdsTemp.FieldDefs.Add('par_fTxJuros',                ftCurrency );
      cdsTemp.FieldDefs.Add('par_fTxJurosExibe',           ftCurrency );
      cdsTemp.FieldDefs.Add('par_fTotalParcelas',          ftCurrency );
      cdsTemp.FieldDefs.Add('par_fTotalPendencias',        ftCurrency );
      cdsTemp.FieldDefs.Add('par_fVlrDevSeg',              ftCurrency );
      cdsTemp.FieldDefs.Add('par_fVlrSeguroAnt',           ftCurrency );
      cdsTemp.FieldDefs.Add('par_fVlrSeguroComplAnt',      ftCurrency );
      cdsTemp.FieldDefs.Add('par_fVlrEmAberto',            ftCurrency );
      cdsTemp.FieldDefs.Add('par_iQtdeItensEmptmo',        ftInteger );
      cdsTemp.FieldDefs.Add('par_iQtdeParcelasEmAberto',   ftInteger );
      cdsTemp.FieldDefs.Add('par_iIdUltHistMovEmptmo',     ftFloat );
      cdsTemp.FieldDefs.Add('par_sArqContratosAnteriores', ftString, 2000 );
      cdsTemp.FieldDefs.Add('par_sMsgRestritiva',          ftString, 2000 );
      cdsTemp.FieldDefs.Add('par_iPossuiAssinaturaContr',  ftInteger );

      //-----------------------------------------
      // Monta simulação / Parametros da Concessao
      //-----------------------------------------

      cdsTemp.FieldDefs.Add('sim_fVlrSolicitado',          ftCurrency );
      cdsTemp.FieldDefs.Add('sim_sArqLista',               ftString, 2000 );
      cdsTemp.FieldDefs.Add('sim_iSeqPasso',               ftInteger );
      cdsTemp.FieldDefs.Add('sim_iParcelas',               ftInteger );
      cdsTemp.FieldDefs.Add('sim_sFormaPagto',             ftString, 1 );
      cdsTemp.FieldDefs.Add('sim_sFormaRecto',             ftString, 1 );
      cdsTemp.FieldDefs.Add('sim_sCodFormaPagto',          ftString, 100 );
      cdsTemp.FieldDefs.Add('sim_sContaBancariaPag',       ftString, 100 );
      cdsTemp.FieldDefs.Add('sim_sContaBancariaRec',       ftString, 100 );
      cdsTemp.FieldDefs.Add('sim_sPortFormaPagto',         ftString, 100 );
      cdsTemp.FieldDefs.Add('sim_sPortFormaRecto',         ftString, 100 );
      cdsTemp.FieldDefs.Add('sim_fVlrParcCalc',            ftCurrency );
      cdsTemp.FieldDefs.Add('sim_fVlrLiquidoEP',           ftCurrency );
      cdsTemp.FieldDefs.Add('sim_iIdAvalista',             ftInteger );
      cdsTemp.FieldDefs.Add('sim_sBeneficiarios',          ftString, 100 );

      cdsTemp.FieldDefs.Add('sim_iIdContratoEmptmo',       ftFloat );
      cdsTemp.FieldDefs.Add('sim_iIdFornCred',             ftFloat );
      cdsTemp.FieldDefs.Add('sim_sBancoPag',               ftString, 100 );
      cdsTemp.FieldDefs.Add('sim_sAgenciaPag',             ftString, 100 );
      cdsTemp.FieldDefs.Add('sim_sContaPag',               ftString, 100 );
      cdsTemp.FieldDefs.Add('sim_iCodAutoEmp',             ftFloat );

      cdsTemp.CreateDataSet;
      cdsTemp.Open;
      Result := cdsTemp.Data;

   finally
      FreeAndNil( cdsTemp );
   end;

end;


function TCtrlEmpSimulacaoInscricao.RecuperaCdsResult(const vResult: OLEVariant; var rSolicitante: TSolicitante;
                                                      var rParamEmptmo: TParamEmptmo;
                                                      var rTipoContratoEmptmo: TTipoContratoEmptmo ): Boolean;
var cdsResult : TCMClientDataSet;
begin
   try
      try
         Result    := True;
         cdsResult := TCMClientDataSet.Create( nil );
         cdsResult.Data := vResult;

         if cdsResult.IsEmpty then
            raise Exception.Create( 'Não foram encontrados dados iniciais para definição dos parâmetros de simulação / elegibilidade' );

         if cdsResult.FieldByName('sol_iIdTitular').IsNull then
            raise Exception.Create( 'Não foram encontrados dados do solicitante' );

         if cdsResult.FieldByName('emp_iIdCidades').IsNull then
            raise Exception.Create( 'Não foram encontrados dados do parâmetros do empréstimo' );

         if cdsResult.FieldByName('con_iIdTipoContrEmptmo').IsNull then
            raise Exception.Create( 'Não foram encontrados dados da modalidade de contrato' );

         rSolicitante.iIDTITULAR       := cdsResult.FieldByName('sol_iIdTitular').AsInteger;
         rSolicitante.iIDBENEF         := cdsResult.FieldByName('sol_iIdBenef').AsInteger;
         rSolicitante.iIDINSCRICAOPREV := cdsResult.FieldByName('sol_iIdInscricaoPrev').AsInteger;
         rSolicitante.iIDSITPART       := cdsResult.FieldByName('sol_iIdSitPart').AsInteger;
         rSolicitante.iIDPESSJUR       := cdsResult.FieldByName('sol_iIdPessJur').AsInteger;
         rSolicitante.iIDPLANOPREV     := cdsResult.FieldByName('sol_iIdPlanoPrev').AsInteger;
         rSolicitante.sMATRICULA       := cdsResult.FieldByName('sol_sMatricula').AsString;
         rSolicitante.sFLGINTERNO      := cdsResult.FieldByName('sol_sFlgInterno').AsString;
         rSolicitante.sCPF             := cdsResult.FieldByName('sol_sCPF').AsString;
         rSolicitante.sCPF_TIT         := cdsResult.FieldByName('sol_sCPF_TIT').AsString;
         rSolicitante.sMATRICULA_TIT   := cdsResult.FieldByName('sol_sMatricula_TIT').AsString;

         rParamEmptmo.sFLGFORMAPAG       := cdsResult.FieldByName('emp_sFlgFormaPag').AsString;
         rParamEmptmo.sFLGFORMAREC       := cdsResult.FieldByName('emp_sFlgFormaRec').AsString;
         rParamEmptmo.sCODESTADO         := cdsResult.FieldByName('emp_sCodEstado').AsString;
         rParamEmptmo.sHORAENCERRA       := cdsResult.FieldByName('emp_sHoraEncerra').AsString;
         rParamEmptmo.iFLGTRATAASSINAT   := cdsResult.FieldByName('emp_iFlgTrataAssinat').AsInteger;
         rParamEmptmo.iFLGPENDCONCESSAO  := cdsResult.FieldByName('emp_iFlgPendConcessao').AsInteger;
         rParamEmptmo.iFLGCALCDIA        := cdsResult.FieldByName('emp_iFlgCalcDia').AsInteger;
         rParamEmptmo.iFLGCONTROLAINSC   := cdsResult.FieldByName('emp_iFlgControlaInsc').AsInteger;
         rParamEmptmo.iFLGRENPRESTAB     := cdsResult.FieldByName('emp_iFlgRenPrestab').AsInteger;
         rParamEmptmo.iFLGCONCULTDIAMES  := cdsResult.FieldByName('emp_iFlgConcUltDiaMes').AsInteger;
         rParamEmptmo.iFLGDATAATUSLD     := cdsResult.FieldByName('emp_iFlgDataAtuSld').AsInteger;
         rParamEmptmo.iFLGOBRIGAAVALISTA := cdsResult.FieldByName('emp_iFlgObrigaAvalista').AsInteger;
         rParamEmptmo.iFLGSALDODEVANT    := cdsResult.FieldByName('emp_iFlgSaldoDevAnt').AsInteger;
         rParamEmptmo.iFLGUSAFIARIO      := cdsResult.FieldByName('emp_iFlgUsaFiario').AsInteger;
         rParamEmptmo.iFLGESTORNOPOSQUIT := cdsResult.FieldByName('emp_iFlgEstornoPosQuit').AsInteger;
         rParamEmptmo.iFLGQUITAPARCMORTE := cdsResult.FieldByName('emp_iFlgQuitaParcMorte').AsInteger;
         rParamEmptmo.iIDREGRAAVAL       := cdsResult.FieldByName('emp_iIdRegraAval').AsInteger;
         rParamEmptmo.iIDITEMDEVSEGQUIT  := cdsResult.FieldByName('emp_iIdItemDevSegQuit').AsInteger;
         rParamEmptmo.iIDITEMPROVPERDA   := cdsResult.FieldByName('emp_iIdItemProvPerda').AsInteger;
         rParamEmptmo.iIDPAIS            := cdsResult.FieldByName('emp_iIdPais').AsInteger;
         rParamEmptmo.iIDCIDADES         := cdsResult.FieldByName('emp_iIdCidades').AsInteger;
         rParamEmptmo.iIDESTADO          := cdsResult.FieldByName('emp_iIdEstado').AsInteger;
         rParamEmptmo.iIDITEMSEGCONC     := cdsResult.FieldByName('emp_iIdItemSegConc').AsInteger;
         rParamEmptmo.iIDITEMSEGCOMPL    := cdsResult.FieldByName('emp_iIdItemSegCompl').AsInteger;
         rParamEmptmo.iFLGABONODIVERG    := cdsResult.FieldByName('emp_iFlgAbonoDiverg').AsInteger;
         rParamEmptmo.bFLGEXCEPCIONAL    := cdsResult.FieldByName('emp_bFlgExcepcional').AsBoolean;
         rParamEmptmo.iIDREGRATIPOCONTR  := cdsResult.FieldByName('emp_iIdRegraTipoContr').AsInteger;
         //Pendência 26775 - 26/12/2007
         rParamEmptmo.iIDREGRAPLANOCOB   := cdsResult.FieldByName('emp_iIdRegraPlanoCob').AsInteger;

         rTipoContratoEmptmo.iIDTIPOCONTREMPTMO := cdsResult.FieldByName('con_iIdTipoContrEmptmo').AsInteger;
         rTipoContratoEmptmo.iIDTIPOEMPTMO      := cdsResult.FieldByName('con_iIdTipoEmptmo').AsInteger;
         rTipoContratoEmptmo.iIDREGRAELEG       := cdsResult.FieldByName('con_iIdRegraEleg').AsInteger;
         rTipoContratoEmptmo.iTCEMINRENOVA      := cdsResult.FieldByName('con_iTCEMinRenova').AsInteger;
         rTipoContratoEmptmo.iTEPMAXCONTRATO    := cdsResult.FieldByName('con_iTepMaxContrato').AsInteger;
         rTipoContratoEmptmo.iIDREGRADATACRED   := cdsResult.FieldByName('con_iIdRegraDataCred').AsInteger;
         rTipoContratoEmptmo.iIDREGRAPRIMPARC   := cdsResult.FieldByName('con_iIdRegraPrimParc').AsInteger;
         rTipoContratoEmptmo.iIDREGRASALBAS     := cdsResult.FieldByName('con_iIdRegraSalBas').AsInteger;
         rTipoContratoEmptmo.iIDREGRAMARGEM     := cdsResult.FieldByName('con_iIdRegraMargem').AsInteger;
         rTipoContratoEmptmo.iIDREGRARESERVA    := cdsResult.FieldByName('con_iIdRegraReserva').AsInteger;
         rTipoContratoEmptmo.iIDREGRAJURCONC    := cdsResult.FieldByName('con_iIdRegraJurConc').AsInteger;
         rTipoContratoEmptmo.iIDREGRAJUREXIBE   := cdsResult.FieldByName('con_iIdRegraJurExibe').AsInteger;
         rTipoContratoEmptmo.iIDREGRAPRAZOSCONC := cdsResult.FieldByName('con_iIdRegraPrazosConc').AsInteger;
         rTipoContratoEmptmo.iIDREGRAPRAZOMAX   := cdsResult.FieldByName('con_iIdRegraPrazoMax').AsInteger;
         rTipoContratoEmptmo.iIDREGRALIMITES    := cdsResult.FieldByName('con_iIdRegraLimites').AsInteger;
         rTipoContratoEmptmo.iTCEMAXINSCR       := cdsResult.FieldByName('con_iTCEMaxInscr').AsInteger;
         rTipoContratoEmptmo.iTCEMAXCONTRATO    := cdsResult.FieldByName('con_iTCEMaxContrato').AsInteger;
         rTipoContratoEmptmo.iTCENUMPARCSIM     := cdsResult.FieldByName('con_iTCENumParcSim').AsInteger;
         rTipoContratoEmptmo.iNUMPARCDESCONTO   := cdsResult.FieldByName('con_iNumParcDesconto').AsInteger;
         rTipoContratoEmptmo.iFLGOBRIGBENEF     := cdsResult.FieldByName('con_iFlgObrigBenef').AsInteger;
         rTipoContratoEmptmo.iFLGVERPRAZOTIPOQUIT := cdsResult.FieldByName('con_iFlgVerPrazoTipoQuit').AsInteger;
         rTipoContratoEmptmo.iFLGVERIFICACONTRATO := cdsResult.FieldByName('con_iFlgVerificaContrato').AsInteger;
         //Pendência 27232 e 27749 - 17/04/2008
         rTipoContratoEmptmo.iFLGVERIFICAITEMABERTO := cdsResult.FieldByName('con_iFlgVerificaItemAberto').AsInteger;
         rTipoContratoEmptmo.iFLGNAOVERIFICAMRGPCL  := cdsResult.FieldByName('con_iFlgNaoVerificaMrgPcl').AsInteger;
         //Fim Pendência 27232 e 27749
         rTipoContratoEmptmo.sTCEDESCRICAO      := cdsResult.FieldByName('con_sTCEDescricao').AsString;
         rTipoContratoEmptmo.sDESCTIPOEMPTMO    := cdsResult.FieldByName('con_sDescTipoEmptmo').AsString;
         rTipoContratoEmptmo.sMOESIGLA          := cdsResult.FieldByName('con_sMoeSigla').AsString;
         rTipoContratoEmptmo.sMOECODIGO         := cdsResult.FieldByName('con_sMoeCodigo').AsString;

      except
         On E : Exception do begin
            Result   := False;
            sMsgErro := E.Message;
         end;
      end;
   finally
      FreeAndNil( cdsResult );
   end;
end;


function TCtrlEmpSimulacaoInscricao.RecuperaParamSimulacao( const vResult: OLEVariant; var rParamSimulacao: TParamSimulacao): Boolean;
var cdsResult : TCMClientDataSet;
begin
   try
      try
         Result    := True;
         cdsResult := TCMClientDataSet.Create( nil );
         cdsResult.Data := vResult;

         if cdsResult.IsEmpty then
            raise Exception.Create( 'Não foram encontrados dados iniciais para definição dos parâmetros de simulação / elegibilidade' );

         if cdsResult.FieldByName('par_iMinParcelas').IsNull then
            raise Exception.Create( 'Não foram encontrados os parâmetros de simulação' );

         rParamSimulacao.dDTCREDITO              := cdsResult.FieldByName('par_dDtCredito').AsDateTime;
         rParamSimulacao.dDT1APARCELA            := cdsResult.FieldByName('par_dDt1aParcela').AsDateTime;
         rParamSimulacao.dANTDATACREDITO         := cdsResult.FieldByName('par_dAntDataCredito').AsDateTime;
         rParamSimulacao.dDATAFINALBENEFICIO     := cdsResult.FieldByName('par_dDataFinalBeneficio').AsDateTime;
         rParamSimulacao.iCARENCIA               := cdsResult.FieldByName('par_iCarencia').AsInteger;
         rParamSimulacao.iMINPARCELAS            := cdsResult.FieldByName('par_iMinParcelas').AsInteger;
         rParamSimulacao.iMAXPARCELAS            := cdsResult.FieldByName('par_iMaxParcelas').AsInteger;
         rParamSimulacao.iANTIDCONTRATOEMPTMO    := cdsResult.FieldByName('par_iAntIdContratoEmptmo').AsInteger;
         rParamSimulacao.iANTIDTIPOCONTREMPTMO   := cdsResult.FieldByName('par_iAntIdTipoContrEmptmo').AsInteger;
         rParamSimulacao.iANTPRAZO               := cdsResult.FieldByName('par_iAntPrazo').AsInteger;
         rParamSimulacao.iANTULTPARCGERADA       := cdsResult.FieldByName('par_iAntUltParcGerada').AsInteger;
         rParamSimulacao.iANTNUMPARCPAGAS        := cdsResult.FieldByName('par_iAntNumParcPagas').AsInteger;
         rParamSimulacao.iQTDEPQUITADO           := cdsResult.FieldByName('par_iQtdEPQuitado').AsInteger;
         rParamSimulacao.iQTDEITENSEMPTMO        := cdsResult.FieldByName('par_iQtdeItensEmptmo').AsInteger;
         rParamSimulacao.iQTDEPARCELASEMABERTO   := cdsResult.FieldByName('par_iQtdeParcelasEmAberto').AsInteger;
         rParamSimulacao.iPOSSUIASSINATURA       := cdsResult.FieldByName('par_iPossuiAssinaturaContr').AsInteger;
         rParamSimulacao.fVLREMABERTO            := cdsResult.FieldByName('par_fVlrEmAberto').AsCurrency;
         rParamSimulacao.fVALRESERVA             := cdsResult.FieldByName('par_fValReserva').AsCurrency;
         rParamSimulacao.fANTVALORSOLIC          := cdsResult.FieldByName('par_fAntValorSolic').AsCurrency;
         rParamSimulacao.fSALPARTICIPACAO        := cdsResult.FieldByName('par_fSalParticipacao').AsCurrency;
         rParamSimulacao.fSALMANTIDO             := cdsResult.FieldByName('par_fSalMantido').AsCurrency;
         rParamSimulacao.fSALAUXDOENCA           := cdsResult.FieldByName('par_fSalAuxDoenca').AsCurrency;
         rParamSimulacao.fSALBENEF               := cdsResult.FieldByName('par_fSalBenef').AsCurrency;
         rParamSimulacao.fVLRSALBASE             := cdsResult.FieldByName('par_fVlrSalBase').AsCurrency;
         rParamSimulacao.fVLRMARGEM              := cdsResult.FieldByName('par_fVlrMargem').AsCurrency;
         rParamSimulacao.fVLRMAXPERMIT           := cdsResult.FieldByName('par_fVlrMaxPermit').AsCurrency;
         rParamSimulacao.fSALDOQUITACAO          := cdsResult.FieldByName('par_fSaldoQuitacao').AsCurrency;
         rParamSimulacao.fQUITACAO               := cdsResult.FieldByName('par_fQuitacao').AsCurrency;
         rParamSimulacao.fSALDOAQUITAR           := cdsResult.FieldByName('par_fSaldoaQuitar').AsCurrency;
         rParamSimulacao.fTXJUROS                := cdsResult.FieldByName('par_fTxJuros').AsCurrency;
         rParamSimulacao.fTXJUROSEXIBE           := cdsResult.FieldByName('par_fTxJurosExibe').AsCurrency;
         rParamSimulacao.fTOTALPARCELAS          := cdsResult.FieldByName('par_fTotalParcelas').AsCurrency;
         rParamSimulacao.fTOTALPENDENCIAS        := cdsResult.FieldByName('par_fTotalPendencias').AsCurrency;
         rParamSimulacao.fVLRDEVSEG              := cdsResult.FieldByName('par_fVlrDevSeg').AsCurrency;
         rParamSimulacao.fVLRSEGUROANT           := cdsResult.FieldByName('par_fVlrSeguroAnt').AsCurrency;
         rParamSimulacao.fVLRSEGUROCOMPLANT      := cdsResult.FieldByName('par_fVlrSeguroComplAnt').AsCurrency;
         rParamSimulacao.sPARCELAS               := cdsResult.FieldByName('par_sParcelas').AsString;
         rParamSimulacao.sPARCELAS2              := cdsResult.FieldByName('par_sParcelas2').AsString;
         rParamSimulacao.sARQCONTRATOSANTERIORES := cdsResult.FieldByName('par_sArqContratosAnteriores').AsString;
         rParamSimulacao.sMSGRESTRITIVA          := cdsResult.FieldByName('par_sMsgRestritiva').AsString;
         rParamSimulacao.iIDULTHISTMOVEMPTMO     := cdsResult.FieldByName('par_iIdUltHistMovEmptmo').AsFloat;

      except
         On E : Exception do begin
            Result   := False;
            sMsgErro := E.Message;
         end;
      end;
   finally
      FreeAndNil( cdsResult );
   end;
end;


function TCtrlEmpSimulacaoInscricao.RecuperaSimulacao(const vResult, vParcelas: OLEVariant; var rSimulacao: TSimulacao): Boolean;
var cdsResult : TCMClientDataSet;
begin
   try
      try
         Result    := True;
         cdsResult := TCMClientDataSet.Create( nil );
         cdsResult.Data := vResult;

         if cdsResult.IsEmpty then
            raise Exception.Create( 'Não foram encontrados dados iniciais para definição dos parâmetros de simulação / elegibilidade' );

         if cdsResult.FieldByName('sim_fVlrSolicitado').IsNull then
            raise Exception.Create( 'Não foram encontrados os dados da simulação' );

         rSimulacao.vPARCELAS         := vParcelas;
         rSimulacao.sARQLISTA         := cdsResult.FieldByName('sim_sArqLista').AsString;
         rSimulacao.iCODAUTOEMP       := cdsResult.FieldByName('sim_iCodAutoEmp').AsFloat;
         rSimulacao.iSEQPASSO         := cdsResult.FieldByName('sim_iSeqPasso').AsInteger;
         rSimulacao.fVLRSOLICITADO    := cdsResult.FieldByName('sim_fVlrSolicitado').AsCurrency;
         rSimulacao.iPARCELAS         := cdsResult.FieldByName('sim_iParcelas').AsInteger;
         rSimulacao.sFORMAPAGTO       := cdsResult.FieldByName('sim_sFormaPagto').AsString;
         rSimulacao.sFORMARECTO       := cdsResult.FieldByName('sim_sFormaRecto').AsString;
         rSimulacao.sCODFORMAPAGTO    := cdsResult.FieldByName('sim_sCodFormaPagto').AsString;
         rSimulacao.sCONTABANCARIAPAG := cdsResult.FieldByName('sim_sContaBancariaPag').AsString;
         rSimulacao.sCONTABANCARIAREC := cdsResult.FieldByName('sim_sContaBancariaRec').AsString;
         rSimulacao.sPORTFORMAPAGTO   := cdsResult.FieldByName('sim_sPortFormaPagto').AsString;
         rSimulacao.sPORTFORMARECTO   := cdsResult.FieldByName('sim_sPortFormaRecto').AsString;
         rSimulacao.fVLRPARCCALC      := cdsResult.FieldByName('sim_fVlrParcCalc').AsCurrency;
         rSimulacao.fVLRLIQUIDOEP     := cdsResult.FieldByName('sim_fVlrLiquidoEP').AsCurrency;
         rSimulacao.iIDAVALISTA       := cdsResult.FieldByName('sim_iIdAvalista').AsInteger;
         rSimulacao.iIDFORNCRED       := cdsResult.FieldByName('sim_iIdFornCred').AsInteger;
         rSimulacao.sBENEFICIARIOS    := cdsResult.FieldByName('sim_sBeneficiarios').AsString;

      except
         On E : Exception do begin
            Result   := False;
            sMsgErro := E.Message;
         end;
      end;
   finally
      FreeAndNil( cdsResult );
   end;
end;






function TCtrlEmpSimulacaoInscricao.ParamSimulacao( var vResult, vContrAnteriores: OLEVariant; const sContrAQuitar: string): Boolean;
var
  rSolicitante        : TSolicitante;
  rParamEmptmo        : TParamEmptmo;
  rTipoContratoEmptmo : TTipoContratoEmptmo;

  //ClientDataSets locais
  cdsContratosAnteriores,
  cdsContratosAnteriores2,
  cdsOutrasDividas : TCMClientDataSet;

  cdsResult : TCMClientDataSet;


  //Dados do empréstimo
  dDtCredito,
  dDt1aParcela : TDatetime;
  iCarencia    : integer;
  iTotSiafi    : integer;
  fVlrEmAberto : Currency;
  i, j,
  iIdTpContEmptmoAux : integer;
  dAux,
  dDataAtualiza : TDateTime;
  bContratosMarcados : boolean;
  sJoinPlano, sQuitavel, sMes, sAno : string;

  //Hora do servidor
  dAgora : TDateTime;

  //Dados de dívidas anteriores
  iNUMPARCPAGAS : integer;

  //Quantidade mínima e máxima de parcelas
  iMinParcelas,
  iMaxParcelas : integer;

  //Saldo a quitar
  fQuitacao : Currency;
  sContrQuitacao: string;

  //Taxa de Juros
  fTxJuros,
  fTxJurosExibe : Currency;

  //Totais
  fTotalParcelas,
  fTotalPendencias : Currency;

  //Salário
  fSalParticipacao,
  fSalMantido,
  fSalAuxDoenca,
  fSalBenef,
  fVlrSalBase,
  fVlrMargem,
  fSaldoAQuitar,
  fVlrMaxPermit : Currency;

  //Dados de seguro
  fVlrDevSeg,
  fVlrSeguroAnt,
  fVlrSeguroComplAnt : Currency;

  //Reserva de Poupança
  fValReserva : Currency;

  //Data final de benefício
  dDataFinalBeneficio : TDateTime;

  dData : TDateTime;
  rSaldo : TSaldoDevAnt;

  //Dados de empréstimos anteriores
  iAntIdContratoEmptmo,
  iAntIdTipoContrEmptmo : integer;
  fAntValorSolic       : Currency;
  dAntDataCredito      : TDateTime;
  iAntPrazo            ,
  iAntUltParcGerada    ,
  iAntNumParcPagas     : integer;

  //Saldo de Quitacao
  fSaldoQuitacao : Currency;

  //Arquivo de dados contratos anteriores
  sArqContratosAnteriores : string;

  //Parcelas simuláveis
  sParcelas,
  sParcelas2 : string;
  aParcelas : array of string;

  //Parâmetros de empréstimo
  iQtdEPQuitado : integer;
  bContratoValido : boolean;

  //Pendência 23733 - 19/12/2006
  sMsgTipoContrato  : String;
  //Fim Pendência 23733

  iQtdeItensEmptmo,
  iQtdeParcelasEmAberto  : integer;
  iPossuiAssinaturaContr : integer;
  iIdUltHistMovEmptmo    : extended;

  sMsgRestritiva,
  sTituloCampo,
  sMensagens,
  sMsgValidaContrato,
  sMsgMargemConsignavel,
  sMsgPossuiAssinatura : string;

begin

  //Início dos cálculos

  Result := True;

  sMensagens            := '';
  sMsgRestritiva        := '';
  sMsgValidaContrato    := '';
  sMsgMargemConsignavel := '';
  sMsgPossuiAssinatura  := '';

  //Limpa variáveis
  fSalParticipacao := 0;
  fSalMantido      := 0;
  fSalAuxDoenca    := 0;
  fSalBenef        := 0;
  fVlrSalBase      := 0;
  fVlrMargem       := 0;
  fValReserva      := 0;
  fTxJuros         := 0;
  fTotalParcelas   := 0;
  fTotalPendencias := 0;
  fQuitacao        := 0;
  fSaldoAQuitar    := 0;

  cdsContratosAnteriores  := TCMClientDataSet.Create( nil );
  cdsContratosAnteriores2 := TCMClientDataSet.Create( nil );
  cdsOutrasDividas        := TCMClientDataSet.Create( nil );

  cdsResult := TCMClientDataSet.Create( nil );

  try

     try

        if bGeraLogProcesso then CMDebugToFile( 'Inicio ParamSimulacao... Elegível.. ', sNomeArqLog );

        // Carrega Variaveis Locais
        cdsResult.Data := vResult;
        if not RecuperaCdsResult(vResult, rSolicitante, rParamEmptmo, rTipoContratoEmptmo) then
           raise Exception.Create( sMsgErro );

        //Data e hora do servidor
        dAgora := WebEmprestimo.HoraServidor;

        //Recupera dados gerais de empréstimos para validação

        iQtdeItensEmptmo      := WebEmprestimo.QtdeItensEmptmo( rSolicitante.iIDTITULAR, rSolicitante.iIDBENEF );
        iQtdeParcelasEmAberto := WebEmprestimo.QtdeParcelasEmAberto( rSolicitante.iIDTITULAR, rSolicitante.iIDBENEF, Now );
        iIdUltHistMovEmptmo   := WebEmprestimo.UltIDHISTMOVEMPTMO;

        //Dados do tipo de contrato recuperados
        if bGeraLogProcesso then CMDebugToFile( 'Verifica Saldo de Quitação.. ', sNomeArqLog );

        //Saldo de Quitação
        fSaldoQuitacao := 0;
        cds.Data := WebEmprestimo.SaldoQuitacao( 0, 18 );
        if not( cds.IsEmpty ) then fSaldoQuitacao := cds.FieldByName('HMEVLRPREVISTO').AsCurrency;
        cds.Close;
        cds.Data := WebEmprestimo.SaldoQuitacao( 0, 45 );
        if not( cds.IsEmpty ) then fSaldoQuitacao := fSaldoQuitacao + cds.FieldByName('HMEVLRPREVISTO').AsCurrency;
        cds.Close;

        //Calcula a data de crédito...
        if bGeraLogProcesso then CMDebugToFile( 'Verifica Data de Crédito.. ', sNomeArqLog );

        if rTipoContratoEmptmo.iIDREGRADATACRED > 0 then
        begin

          //... utilizando regra.
          dDtCredito := WebEmprestimo.RegraDataCredito( IntToStr( rTipoContratoEmptmo.iIDREGRADATACRED ),
                                                        'C',
                                                        rSolicitante.sFLGINTERNO,
                                                        rParamEmptmo.sFLGFORMAPAG,
                                                        rParamEmptmo.sHORAENCERRA,
                                                        False,
                                                        rSolicitante.iIDPESSJUR,
                                                        rSolicitante.iIDPLANOPREV,
                                                        rParamEmptmo.iIDPAIS,
                                                        rParamEmptmo.iIDCIDADES,
                                                        rParamEmptmo.sCODESTADO,
                                                        dAgora,
                                                        iIdEmpresaProp );

        end
        else
        begin

          //... utilizando rotina interna de cálculo.
          sMes := FormatDateTime( 'MM',   dAgora );
          sAno := FormatDateTime( 'YYYY', dAgora );
          dDtCredito := CalcData( rSolicitante.iIDPESSJUR, rSolicitante.iIDPLANOPREV, rSolicitante.sFLGINTERNO,
                                  'C', sMes, sAno, rParamEmptmo.sFLGFORMAPAG,
                                  FormatDateTime('DD/MM/YYYY', dAgora ), 0, rSolicitante.sFLGINTERNO );

        end;

        if bGeraLogProcesso then CMDebugToFile( 'Verifica Data da primeira parcela.. ', sNomeArqLog );

        dDt1aParcela := 0;

        //Calcula data da 1a. parcela
        if rTipoContratoEmptmo.iIDREGRAPRIMPARC > 0 then
        begin

          //... utilizando regra.
          dDt1aParcela := WebEmprestimo.RegraData1aParc( IntToStr( rTipoContratoEmptmo.iIDREGRAPRIMPARC ),
                                                         rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                                         dDtCredito,
                                                         iIdEmpresaProp );
        end;

        if dDt1aParcela = 0 then
        begin

          //... utilizando rotina interna de cálculo.
          sMes := FormatDateTime( 'MM',   dDtCredito );
          sAno := FormatDateTime( 'YYYY', dDtCredito );
          dDt1aParcela := CalcData( rSolicitante.iIDPESSJUR, rSolicitante.iIDPLANOPREV, rSolicitante.sFLGINTERNO,
                                    'N', sMes, sAno, rParamEmptmo.sFLGFORMAREC,
                                    FormatDateTime('DD/MM/YYYY', dDtCredito ), 0, rSolicitante.sFlgInterno );
        end;


        //Cálculo da carência
        iCarencia := trunc( dDt1aParcela - dDtCredito );

        //Recupera dados de empréstimos anteriores
        if rParamEmptmo.iFLGPENDCONCESSAO = 0 then
             dAux := dDtCredito
        else dAux := DiasUteis.UltDiaMes( DiasUteis.ExtraiAno( dDtCredito ), DiasUteis.ExtraiMes( dDtCredito ) );

        sJoinPlano         := '';
        sQuitavel          := '';
        iIdTpContEmptmoAux := rTipoContratoEmptmo.iIDTIPOCONTREMPTMO;
        dDataAtualiza      := dDtCredito;

        if rParamEmptmo.bFLGEXCEPCIONAL then
        begin
          sJoinPlano       := '1';
          sQuitavel        := '1';
        end;


        if bGeraLogProcesso then CMDebugToFile( 'Verifica Contratos Anteriores.. ', sNomeArqLog );


        if not rParamEmptmo.bFLGEXCEPCIONAL then
           dDataAtualiza := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno( dDtCredito ), DiasUteis.ExtraiMes( dDtCredito ) );

        cdsContratosAnteriores.Close;
        cdsContratosAnteriores.Data := WebEmprestimo.ContratosAnteriores( rSolicitante.iIDTITULAR,
                                                                          rSolicitante.iIDBENEF,
                                                                          rTipoContratoEmptmo.iIDTIPOEMPTMO,
                                                                          iIdTpContEmptmoAux,
                                                                          dAux,
                                                                          dDataAtualiza,
                                                                          sJoinPlano,
                                                                          sQuitavel );

        cdsContratosAnteriores2.Close;
        if rParamEmptmo.bFLGEXCEPCIONAL then
          //Pendência 27232 - 17/04/2008
          //if rTipoContratoEmptmo.iIDTIPOCONTREMPTMO in [11, 12, 13, 14, 15, 16] then
          if rTipoContratoEmptmo.iFLGVERIFICAITEMABERTO <> 0 then
            cdsContratosAnteriores2.Data := WebEmprestimo.ContratosAnteriores2( rSolicitante.iIDTITULAR, rSolicitante.iIDBENEF );
          //Fim Pendência 27232

        sMsgCtrl := '';

        if bGeraLogProcesso then CMDebugToFile( 'Verifica Elegibilidade.. ', sNomeArqLog );

        //Executa regra de elegibilidade
        if not WebEmprestimo.VerificaElegibilidade( IntToStr( rTipoContratoEmptmo.iIDREGRAELEG ), rSolicitante.iIDTITULAR,
                                                    rSolicitante.iIDBENEF,
                                                    //Pendências 23311 e 23312 - 25/09/2006
                                                    rSolicitante.iIDPLANOPREV,
                                                    //Fim Pendências 23311 e 23312
                                                    rTipoContratoEmptmo.iTCEMINRENOVA, iNUMPARCPAGAS,
                                                    iIdEmpresaProp, rParamEmptmo.bFLGEXCEPCIONAL, sNomeEmpresa,
                                                    dDataFinalBeneficio ) then
           raise Exception.Create( iff( sMsgCtrl <> '', sMsgCtrl, 'Usuário não atende à Regra de Elegibilidade') );


        //Validando inscrição...
        if not WebEmprestimo.ValidaInscricao( rSolicitante.iIDTITULAR,
                                              rTipoContratoEmptmo.iIDTIPOEMPTMO,
                                              0,
                                              iIdEmpresaProp ) then
           raise Exception.Create( iff( sMsgCtrl <> '', sMsgCtrl, 'Não é permitida a simulação pois a inscrição não será possível.') );


        //Pendência 27857 - 07/05/2008
        //Validando contrato em quitação...
        if bGeraLogProcesso then CMDebugToFile( 'Valida Contrato Em Quitação.. ', sNomeArqLog );

        sMsgValidaContrato := '';

        if not WebEmprestimo.ValidaContratoEmQuitacao( rSolicitante.iIDTITULAR,
                                                       rSolicitante.iIDBENEF,
                                                       rTipoContratoEmptmo.iIDTIPOEMPTMO,
                                                       rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                                       iQtdEPQuitado,
                                                       iIdEmpresaProp,
                                                       rParamEmptmo.bFLGEXCEPCIONAL,
                                                       sMsgValidaContrato ) then
           raise Exception.Create( iff( sMsgValidaContrato <> '', sMsgValidaContrato, 'Não é permitida a simulação pois não será possível a contratação.') );
        //Fim Pendência 27857

        //Validando contrato...
        if bGeraLogProcesso then CMDebugToFile( 'Valida Contrato.. ', sNomeArqLog );

        sMsgValidaContrato    := '';
        sMsgMargemConsignavel := '';

        if not WebEmprestimo.ValidaContrato( rSolicitante.iIDTITULAR,
                                             rSolicitante.iIDBENEF,
                                             rTipoContratoEmptmo.iIDTIPOEMPTMO,
                                             rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                             iQtdEPQuitado,
                                             iIdEmpresaProp,
                                             rParamEmptmo.bFLGEXCEPCIONAL,
                                             sMsgValidaContrato ) then
           raise Exception.Create( iff( sMsgCtrl <> '', sMsgCtrl, 'Não é permitida a simulação pois não será possível a contratação.') );


        //Verifica se há empréstimos cuja concessão ainda não tenham sido efetivadas
        if bGeraLogProcesso then CMDebugToFile( 'Verifica Concessao Nao Efetivada.. ', sNomeArqLog );

        if not WebEmprestimo.VerificaConcessaoNaoEfetivada( rSolicitante.iIDTITULAR,
                                                            rSolicitante.iIDBENEF,
                                                            rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                                            rParamEmptmo.bFLGEXCEPCIONAL,
                                                            rTipoContratoEmptmo.iFLGVERIFICACONTRATO ) then
           raise Exception.Create( iff( sMsgCtrl <> '', sMsgCtrl, 'Participante nao podera solicitar outro emprestimo pois ' +
                                                                  'possui emprestimo anterior nao efetivado.') );

        //Recupera quantidade mínima e máxima de parcelas
        SetNumParcelas( rSolicitante.iIDTITULAR, rSolicitante.iIDBENEF, rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                        rTipoContratoEmptmo.iIDTIPOEMPTMO, rTipoContratoEmptmo.iIDREGRAPRAZOMAX,
                        rTipoContratoEmptmo.iIDREGRAPRAZOSCONC, dAgora, rParamEmptmo.bFLGEXCEPCIONAL,
                        iMinParcelas, iMaxParcelas );


        // Marca contratos selecionados para quitação
        sContrQuitacao := sContrAQuitar;
        while sContrQuitacao <> '' do
        begin
          if not cdsContratosAnteriores.Locate('IDCONTRATOEMPTMO', RetiraPrimeiroElemento( sContrQuitacao, ';' ), []) then
             raise exception.create('Contrato a quitar não encontrado');

          cdsContratosAnteriores.Edit;
          cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger := 1;
          cdsContratosAnteriores.Post;

        end;

        if bGeraLogProcesso then CMDebugToFile( 'Calcula empréstimo anterior... Elegível.. ', sNomeArqLog );

        sContrQuitacao := '';
        cdsContratosAnteriores.First;
        while not cdsContratosAnteriores.eof  do
        begin
          if (cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1) then
          begin
             sContrQuitacao := sContrQuitacao + cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsString + ';';
          end;
          cdsContratosAnteriores.next;
        end;
        sContrQuitacao := Copy(sContrQuitacao,1,Length(sContrQuitacao)-1);

        //Calcula empréstimos anteriores
        cdsContratosAnteriores.Data := WebEmprestimo.CalculaEPAnterior(
                                         cdsContratosAnteriores.Data,
                                         iIdEmpresaProp,
                                         rTipoContratoEmptmo.iIDTIPOEMPTMO,
                                         rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                         rParamEmptmo.iIDITEMDEVSEGQUIT,
                                         rParamEmptmo.iIDITEMPROVPERDA,
                                         dDtCredito,
                                         rParamEmptmo.bFLGEXCEPCIONAL,
                                         rTipoContratoEmptmo.iTEPMAXCONTRATO,
                                         //Pendência 26916 - 21/12/2007
                                         rTipoContratoEmptmo.iTCEMAXCONTRATO,
                                         //Fim Pendência 26916
                                         rParamEmptmo.iFLGABONODIVERG,
                                         iTipoCliente,
                                         bContratoValido,
                                         iQtdEPQuitado,
                                         fSaldoAQuitar,
                                         fTotalParcelas,
                                         fTotalPendencias,
                                         fQuitacao );

        iAntIdTipoContrEmptmo := -1;
        iAntNumParcPagas      :=  0;
        iAntPrazo             :=  0;
        iAntUltParcGerada     :=  0;

        fVlrDevSeg            := 0;
        fVlrSeguroAnt         := 0;
        fVlrSeguroComplAnt    := 0;

        iAntIdContratoEmptmo  := -1;
        fAntValorSolic        :=  0;
        dAntDataCredito       :=  0;
        iNUMPARCPAGAS         :=  0;

        //Pendência 23733 - 19/12/2006
        if rParamEmptmo.iIDREGRATIPOCONTR > 0 then
        begin
           if not WebEmprestimo.ValidaTipoContratoEmprestimo(cdsContratosAnteriores.Data,
                                                             iIdEmpresaProp,
                                                             rSolicitante.iIDTITULAR,
                                                             rSolicitante.iIDBENEF,
                                                             rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                                             rParamEmptmo.iIDREGRATIPOCONTR
                                                            ) then
              raise Exception.Create( 'Tipo de contrato de empréstimo não pode ser contratado.' );
        end;
        //Fim Pendência 23733

        if not ( cdsContratosAnteriores.IsEmpty ) then
        begin
          cdsContratosAnteriores.First;

          iAntIdTipoContrEmptmo := cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger;

          bContratosMarcados := False;

          while not ( cdsContratosAnteriores.Eof ) do
          begin

            if ( cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 ) or
               ( cdsContratosAnteriores.RecordCount = rTipoContratoEmptmo.iTEPMAXCONTRATO ) then
            begin
              bContratosMarcados   := True;

              iAntNumParcPagas      := cdsContratosAnteriores.FieldByName('NUMPARCPAGAS').AsInteger;
              iAntPrazo             := cdsContratosAnteriores.FieldByName('NUMPARCELAS').AsInteger;
              iAntUltParcGerada     := cdsContratosAnteriores.FieldByName('ULT_PARC').AsInteger;
              iAntIdTipoContrEmptmo := cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger;

              fAntValorSolic        := cdsContratosAnteriores.FieldByName('VLRCONTRATO').AsCurrency;
              dAntDataCredito       := cdsContratosAnteriores.FieldByName('DATACREDITO').AsDateTime;
              iNUMPARCPAGAS         := cdsContratosAnteriores.FieldByName('NUMPARCPAGAS').AsInteger;
            end;

            if rParamEmptmo.bFLGEXCEPCIONAL then
            begin
              if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 then
              begin
                fVlrDevSeg           := fVlrDevSeg           + cdsContratosAnteriores.FieldByName('VLRDEVSEG').AsCurrency;
                fVlrSeguroAnt        := fVlrSeguroAnt        + WebEmprestimo.PegaSeguroAnt( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat, rParamEmptmo.iIDITEMSEGCONC );
                fVlrSeguroComplAnt   := fVlrSeguroComplAnt   + WebEmprestimo.PegaSeguroComplAnt( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat, rParamEmptmo.iIDITEMSEGCOMPL );
              end;
            end;

            cdsContratosAnteriores.Next;
          end;

          //Verifica se o número de parcelas pagas é suficiente.
          if not rParamEmptmo.bFLGEXCEPCIONAL then
          begin

            if iAntNumParcPagas <  rTipoContratoEmptmo.iTCEMINRENOVA then
            begin

              sMsgMargemConsignavel := 'O número de parcelas pagas do contrato anterior é inferior ao permitido para renovação.';

              if sMsgRestritiva = '' then sMsgRestritiva := sMsgMargemConsignavel;

            end

          end
          else
          begin

            if ( cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger = rTipoContratoEmptmo.iIDTIPOCONTREMPTMO ) and
               ( iAntNumParcPagas < rTipoContratoEmptmo.iTCEMINRENOVA ) then
            begin

              if bContratosMarcados then
              begin

                if not WebEmprestimo.PrimeiraRenovacao2006( rSolicitante.iIDTITULAR, rSolicitante.iIdBenef, rTipoContratoEmptmo.iIdTipoContrEmptmo ) then
                begin

                  if sMsgMargemConsignavel = '' then
                  begin
                    sMsgMargemConsignavel := 'A renovação exige carência de meses e mínimo de parcelas pagas, condições ainda não atendidas no atual contrato.';

                    if sMsgRestritiva = '' then sMsgRestritiva := sMsgMargemConsignavel;

                  end;

                end;

              end;

            end;

          end;

        end;

        //Outras dívidas
        if bGeraLogProcesso then CMDebugToFile( 'Verifica Outras dívidas... Elegível.. ', sNomeArqLog );

        cdsOutrasDividas.Data := WebEmprestimo.OutrasDividas( rSolicitante.iIDBENEF, dDtCredito );

        iTotSiafi := 0;
        while not( cdsOutrasDividas.EOF ) do
        begin
          if rParamEmptmo.bFLGEXCEPCIONAL                                 and
             ( cdsOutrasDividas.FieldByName('CODTIPO').AsInteger    = 3 ) and
             ( cdsOutrasDividas.FieldByName('NUMPARCELA').AsInteger > 0 ) then
          begin
            Inc( iTotSiafi );
          end;

          cdsOutrasDividas.Next;
        end;


        //Calcula salário base
        if bGeraLogProcesso then CMDebugToFile( 'Calcula Salario Base... Elegível.. ', sNomeArqLog );
        if rTipoContratoEmptmo.iIDREGRASALBAS > 0 then
        begin
            fVlrSalBase := Arredonda( WebEmprestimo.BuscaSalarioBase( rSolicitante.iIDTITULAR,
                                                                      rSolicitante.iIDBENEF,
                                                                      iIdEmpresaProp,
                                                                      rTipoContratoEmptmo.iIDREGRASALBAS,
                                                                      rParamEmptmo.bFLGEXCEPCIONAL,
                                                                      dAgora, 0, iTipoCliente ), 2 );
        end;

        //Calcula Margem Consignável
        if bGeraLogProcesso then CMDebugToFile( 'Calcula Margem... Elegível.. ', sNomeArqLog );
        if rTipoContratoEmptmo.iIDREGRAMARGEM > 0 then
        begin
            fVlrMargem := Arredonda( WebEmprestimo.BuscaMargem( rSolicitante.iIDTITULAR,
                                                                rSolicitante.iIDBENEF,
                                                                iIdEmpresaProp,
                                                                rTipoContratoEmptmo.iIDREGRAMARGEM,
                                                                fVlrSalBase,
                                                                fTotalParcelas,
                                                                fTotalPendencias,
                                                                rParamEmptmo.bFLGEXCEPCIONAL,
                                                                //Pendência 22248 - 03/08/2006
                                                                //Now, False, 0 ), 2 );
                                                                Now, iMaxParcelas, False, 0, sContrQuitacao, iTipoCliente ), 2 );
                                                                //Fim Pendência 22248
        end;

        //Calcula Saldo de Reserva
        if bGeraLogProcesso then CMDebugToFile( 'Calcula Reserva... Elegível.. ', sNomeArqLog );
        if rTipoContratoEmptmo.iIDREGRARESERVA > 0 then
        begin
            fValReserva := Arredonda( BuscaReserva( rTipoContratoEmptmo.iIDREGRARESERVA,
                                                    rSolicitante.iIDBENEF,
                                                    rSolicitante.iIDPESSJUR,
                                                    rSolicitante.iIDPLANOPREV,
                                                    dAgora, 0 ), 2 );
        end;

        //Calcula Taxa de Juros
        fTxJuros := BuscaTxJuros( rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                  rTipoContratoEmptmo.iIDREGRAJURCONC,
                                  0,
                                  0,
                                  iMaxParcelas,
                                  0,
                                  rTipoContratoEmptmo.sMOESIGLA,
                                  dDtCredito,
                                  dDtCredito,
                                  dAgora,
                                  dAgora,
                                  0,
                                  0,
                                  rParamEmptmo.iIDPAIS,
                                  rParamEmptmo.iIDCIDADES,
                                  rParamEmptmo.iIDESTADO,
                                  rParamEmptmo.sCODESTADO,
                                  0 );

        if rTipoContratoEmptmo.iIDREGRAJUREXIBE > 0 then
        begin
          fTxJurosExibe := BuscaTxJuros( rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                         rTipoContratoEmptmo.iIDREGRAJUREXIBE,
                                         0,
                                         0,
                                         iMaxParcelas,
                                         0,
                                         rTipoContratoEmptmo.sMOESIGLA,
                                         dDtCredito,
                                         dDtCredito,
                                         dAgora,
                                         dAgora,
                                         0,
                                         0,
                                         rParamEmptmo.iIDPAIS,
                                         rParamEmptmo.iIDCIDADES,
                                         rParamEmptmo.iIDESTADO,
                                         rParamEmptmo.sCODESTADO,
                                         0 );
        end
        else
          fTxJurosExibe := fTxJuros;

        //Calcula Valor Máximo Permitido
        if bGeraLogProcesso then CMDebugToFile( 'Calcula valor máximo... Elegível.. ', sNomeArqLog );
        fVlrMaxPermit    := Arredonda( WebEmprestimo.BuscaVlrSolicMax(
                                       iIdEmpresaProp,
                                       rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                       rSolicitante.iIDPESSJUR,
                                       rSolicitante.iIDPLANOPREV,
                                       rSolicitante.iIDTITULAR,
                                       rSolicitante.iIDBENEF,
                                       rSolicitante.iIDSITPART,
                                       iMaxParcelas,
                                       rSolicitante.sFLGINTERNO,
                                       fVlrMargem,
                                       fValReserva,
                                       fTxJuros,
                                       fSaldoAQuitar,
                                       0,
                                       fQuitacao,
                                       fSalParticipacao,
                                       fSalMantido,
                                       fSalAuxDoenca,
                                       fSalBenef,
                                       fVlrSalBase,
                                       //Pendências 26950 e 26951 - 30/11/2007
                                       0,
                                       SysDate( WebEmprestimo ), //dDataAssinatura,
                                       dDtCredito,
                                       dDt1aParcela,
                                       iTipoCliente,
                                       sContrQuitacao,
                                       cdsContratosAnteriores.Data ), 2 );
                                       //Fim Pendências 26950 e 26951

        if rParamEmptmo.bFLGEXCEPCIONAL then
        begin

          if iTotSiafi > 0  then
            raise Exception.Create( 'Mutuário possui dívidas de Financiamento Habitacional. Não será possível conceder Empréstimos para o mesmo.' );

          // ----------------------------------------------------------------------------------------
          // Verifica se há itens em aberto de qq contrato (para adiantamento de 13º)
          //Pendência 27232 - 17/04/2008
          //if ( rTipoContratoEmptmo.iIDTIPOCONTREMPTMO in [11, 12, 13, 14, 15, 16] ) and ( cdsContratosAnteriores2.Active ) then
          if ( rTipoContratoEmptmo.iFLGVERIFICAITEMABERTO <> 0 ) and ( cdsContratosAnteriores2.Active ) then
          begin
          //Fim Pendência 27232

            cdsContratosAnteriores2.First;
            while not( cdsContratosAnteriores2.EOF ) do
            begin

              //Verificando de há itens em aberto...
              if WebEmprestimo.ExistemItensEmAberto_uCalc( cdsContratosAnteriores2.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                                           True, dDtCredito,
                                                           True, StrToInt( FormatDateTime( 'yyyy', dDtCredito ) ),
                                                           StrToInt( FormatDateTime( 'mm', dDtCredito ) ) ) then
                raise Exception.Create( 'Mutuário possui débitos anteriores em aberto. Não será possível conceder Empréstimo para o mesmo.' );

              //Pendência 27232 - 17/04/2008
              if rParamEmptmo.iIDREGRATIPOCONTR > 0 then
              begin
                if not WebEmprestimo.ValidaTipoContratoEmprestimo(cdsContratosAnteriores2.Data,
                                                                  iIdEmpresaProp,
                                                                  rSolicitante.iIDTITULAR,
                                                                  rSolicitante.iIDBENEF,
                                                                  rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                                                  rParamEmptmo.iIDREGRATIPOCONTR
                                                                 ) then
                  raise Exception.Create( 'Tipo de contrato em aberto impede contratação!' );
              end;
              {
              if ( ( rTipoContratoEmptmo.iIDTIPOCONTREMPTMO = 11 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [11, 12, 13] ) ) or
                 ( ( rTipoContratoEmptmo.iIDTIPOCONTREMPTMO = 12 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [11, 12, 13] ) ) or
                 ( ( rTipoContratoEmptmo.iIDTIPOCONTREMPTMO = 13 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [11, 12, 13] ) ) or
                 ( ( rTipoContratoEmptmo.iIDTIPOCONTREMPTMO = 14 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [14, 15, 16] ) ) or
                 ( ( rTipoContratoEmptmo.iIDTIPOCONTREMPTMO = 15 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [14, 15, 16] ) ) or
                 ( ( rTipoContratoEmptmo.iIDTIPOCONTREMPTMO = 16 ) and ( cdsContratosAnteriores2.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [14, 15, 16] ) ) then
                raise Exception.Create( 'Mutuário possui contrato anterior do mesmo tipo. Não será possível conceder Empréstimo para o mesmo.' );
              }
              //Fim Pendência 23733

              cdsContratosAnteriores2.Next;
            end;
          end;

          cdsContratosAnteriores.First;
          while not( cdsContratosAnteriores.EOF) do
          begin

            if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 then
            begin

              if rParamEmptmo.iFLGCALCDIA = 1 then
              begin

                //Verificando se possui atualização diária...
                if not ( WebEmprestimo.PossuiAtualizacaoDiaria( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat, dDtcredito ) ) then
                begin

                  //Verificando data da última atualização...
                  dData  := WebEmprestimo.UltimaDataAtualizacao( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat );
                  //Verificando saldo devedor anterior...
                  rSaldo := WebEmprestimo.SaldoDevAnt( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat, dData, -1, -1,
                                                       rParamEmptmo.iFLGSALDODEVANT, rParamEmptmo.iFLGCALCDIA, False );

                  if rSaldo.fSaldoDevAnt <> 0 then
                    raise Exception.Create( 'Contrato anterior não possui atualização diária para a data do crédito.' );

                end;
              end;

              if ( cdsContratosAnteriores.FieldByName('NUMPARCPAGAS').AsInteger < cdsContratosAnteriores.FieldByName('TCEMINRENOVA').AsInteger ) then
              begin

                //Verifica PrimeiraRenovacao2006...
                if not WebEmprestimo.PrimeiraRenovacao2006( rSolicitante.iIDTITULAR, rSolicitante.iIDBENEF, rTipoContratoEmptmo.iIdTipoContrEmptmo ) then
                begin
                  //Entrou na PrimeiraRenovacao2006...
                  if sMsgMargemConsignavel = '' then
                  begin
                    sMsgMargemConsignavel := 'A renovação exige carência de meses e mínimo de parcelas pagas, condições ainda não atendidas no atual contrato.';

                    if sMsgRestritiva = '' then sMsgRestritiva := sMsgMargemConsignavel;

                  end;

                end;

              end;

            end;

            cdsContratosAnteriores.Next;
          end;

        end;

        //Tratamento de Assinatura / Contrato Padrão
        if bGeraLogProcesso then CMDebugToFile( 'Verifica assinatura... Elegível.. ', sNomeArqLog );
        if rParamEmptmo.iFLGTRATAASSINAT = 1 then
        begin

          iPossuiAssinaturaContr := 1;
          if not ( WebEmprestimo.PossuiAssinatura( rSolicitante.iIDTITULAR,
                                                   rSolicitante.iIDBENEF,
                                                   rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                                   sMsgPossuiAssinatura ) ) then
          begin
            iPossuiAssinaturaContr := 0;
            if sMsgPossuiAssinatura <> '' then
              sMsgPossuiAssinatura := 'Mutuário não possui assinatura para esse tipo de contrato.';
//            Pendência 26951 - 18/12/2007
//            No auto-empréstimo a restrição de assinatura é tratada pela variável iPossuiAssinaturaContr
//            if sMsgRestritiva = '' then sMsgRestritiva := sMsgPossuiAssinatura;
          end;
        end;

        //Verificando se há itens anteriores em aberto...ParamSimulacao...
        if bGeraLogProcesso then CMDebugToFile( 'Verifica itens anteriores em aberto... Elegível.. ', sNomeArqLog );

        if ( fSaldoaQuitar > 0 ) and
           ( rParamEmptmo.iFLGRENPRESTAB = 1) and
           ( WebEmprestimo.ExistemItensEmAberto_fCad( dAgora, cdsContratosAnteriores.Data, fVlrEmAberto ) ) then begin

           if sMsgRestritiva = '' then
                sMsgRestritiva := 'Existem itens anteriores em aberto! ' + #13 + 'Não será permitida a Renovação.'
           else sMsgRestritiva := sMsgRestritiva +#13+ 'Existem itens anteriores em aberto! ' + #13 + 'Não será permitida a Renovação.';

           //Pendência 27857 - 07/05/2008
           //raise Exception.Create( sMsgRestritiva );
           //Fim Pendência 27857

        end;

        if bGeraLogProcesso then CMDebugToFile( 'Verifica parcelas simulaveis... Elegível.. ', sNomeArqLog );
        sParcelas := ParcelasSimulaveis( rSolicitante.iIDTITULAR, rSolicitante.iIDBENEF, iIdEmpresaProp,
                                         rTipoContratoEmptmo.iIDREGRAPRAZOSCONC,
                                         iMinParcelas, iMaxParcelas, rParamEmptmo.bFLGEXCEPCIONAL );
        sParcelas2 := sParcelas;

        sArqContratosAnteriores := SaveDataset( cdsContratosAnteriores.Data );

        vContrAnteriores := cdsContratosAnteriores.Data;

        //Salvando Contratos Anteriores..

        if cdsResult.IsEmpty then
             cdsResult.Insert
        else cdsResult.Edit;

        cdsResult.FieldByName('par_dDtCredito').AsDateTime            := dDtCredito;
        cdsResult.FieldByName('par_dDt1aParcela').AsDateTime          := dDt1aParcela;
        cdsResult.FieldByName('par_iCarencia').AsInteger              := iCarencia;
        cdsResult.FieldByName('par_fValReserva').AsCurrency           := fValReserva;
        cdsResult.FieldByName('par_iMinParcelas').AsInteger           := iMinParcelas;
        cdsResult.FieldByName('par_iMaxParcelas').AsInteger           := iMaxParcelas;
        cdsResult.FieldByName('par_iAntIdContratoEmptmo').AsInteger   := iAntIdContratoEmptmo;
        cdsResult.FieldByName('par_iAntIdTipoContrEmptmo').AsInteger  := iAntIdTipoContrEmptmo;
        cdsResult.FieldByName('par_fAntValorSolic').AsCurrency        := fAntValorSolic;
        cdsResult.FieldByName('par_dAntDataCredito').AsDateTime       := dAntDataCredito;
        cdsResult.FieldByName('par_iAntPrazo').AsInteger              := iAntPrazo;
        cdsResult.FieldByName('par_iAntUltParcGerada').AsInteger      := iAntUltParcGerada;
        cdsResult.FieldByName('par_iAntNumParcPagas').AsInteger       := iAntNumParcPagas;
        cdsResult.FieldByName('par_fSalParticipacao').AsCurrency      := fSalParticipacao;
        cdsResult.FieldByName('par_fSalMantido').AsCurrency           := fSalMantido;
        cdsResult.FieldByName('par_fSalAuxDoenca').AsCurrency         := fSalAuxDoenca;
        cdsResult.FieldByName('par_fSalBenef').AsCurrency             := fSalBenef;
        cdsResult.FieldByName('par_fVlrSalBase').AsCurrency           := fVlrSalBase;
        cdsResult.FieldByName('par_fVlrMargem').AsCurrency            := fVlrMargem;
        cdsResult.FieldByName('par_fVlrMaxPermit').AsCurrency         := fVlrMaxPermit;
        cdsResult.FieldByName('par_dDataFinalBeneficio').AsDateTime   := dDataFinalBeneficio;
        cdsResult.FieldByName('par_fSaldoQuitacao').AsCurrency        := fSaldoQuitacao;
        cdsResult.FieldByName('par_iQtdEPQuitado').AsInteger          := iQtdEPQuitado;
        cdsResult.FieldByName('par_sParcelas').AsString               := sParcelas;
        cdsResult.FieldByName('par_sParcelas2').AsString              := sParcelas2;
        cdsResult.FieldByName('par_fQuitacao').AsCurrency             := fQuitacao;
        cdsResult.FieldByName('par_fSaldoaQuitar').AsCurrency         := fSaldoaQuitar;
        cdsResult.FieldByName('par_fTxJuros').AsCurrency              := fTxJuros;
        cdsResult.FieldByName('par_fTxJurosExibe').AsCurrency         := fTxJurosExibe;
        cdsResult.FieldByName('par_fTotalParcelas').AsCurrency        := fTotalParcelas;
        cdsResult.FieldByName('par_fTotalPendencias').AsCurrency      := fTotalPendencias;
        cdsResult.FieldByName('par_fVlrDevSeg').AsCurrency            := fVlrDevSeg;
        cdsResult.FieldByName('par_fVlrSeguroAnt').AsCurrency         := fVlrSeguroAnt;
        cdsResult.FieldByName('par_fVlrSeguroComplAnt').AsCurrency    := fVlrSeguroComplAnt;
        cdsResult.FieldByName('par_iQtdeItensEmptmo').AsInteger       := iQtdeItensEmptmo;
        cdsResult.FieldByName('par_iQtdeParcelasEmAberto').AsInteger  := iQtdeParcelasEmAberto;
        cdsResult.FieldByName('par_fVlrEmAberto').AsCurrency          := fVlrEmAberto;
        cdsResult.FieldByName('par_iIdUltHistMovEmptmo').AsFloat      := iIdUltHistMovEmptmo;
        cdsResult.FieldByName('par_sArqContratosAnteriores').AsString := sArqContratosAnteriores;
        cdsResult.FieldByName('par_sMsgRestritiva').AsString          := sMsgRestritiva;
        cdsResult.FieldByName('par_iPossuiAssinaturaContr').AsInteger := iPossuiAssinaturaContr;
        cdsResult.Post;

        vResult := cdsResult.Data;

        cds.Close;

     except
        On E : Exception do begin
           Result   := False;
           sMsgErro := E.Message;
        end;
     end;

  finally
    cdsContratosAnteriores.Free;
    cdsContratosAnteriores2.Free;
    cdsOutrasDividas.Free;
    cdsResult.Free;
  end;
end; {CalcElegibilidade}



//Pendência 28160 - 12/06/2008
//function TCtrlEmpSimulacaoInscricao.Simulacao (const fVlrSolicitado: Currency; const sPrazos: string;
//Fim Pendência 28160
function TCtrlEmpSimulacaoInscricao.Simulacao (var fVlrSolicitado: Currency; const sPrazos: string;
                                                 var vResult: OLEVariant; var vParcelas: OLEVariant): Boolean;
var

  rSolicitante        : TSolicitante;
  rParamEmptmo        : TParamEmptmo;
  rTipoContratoEmptmo : TTipoContratoEmptmo;
  rParamSimulacao     : TParamSimulacao;

  // AutoEmprestimo
  cdsResult : TCMClientDataSet;

  sParc,
  sParcelas : string;

  i, iQtdeCampos, iLargura : integer;

  sAux,
  sTituloCampo,
  sTitCol,
  sDados,
  sValor,
  sClasse,
  sNomeCampo : string;

  dAgora : TDateTime;

  vLista : TListaItem;

  sArqLista : string;
  sMsgRestritiva : string;

  cdsLocal,
  cdsLista : TCMClientDataSet;


  //Pendência 24902 - 24/05/2007
  iSeqPasso : Integer;
  //Fim Pendência 24902

begin
  cdsLocal  := TCMClientDataSet.Create( nil );
  cdsLista  := TCMClientDataSet.Create( nil );
  cdsResult := TCMClientDataSet.Create( nil );
  try

    try

      //Recuperando valor solicitado.
      Result := True;
      cdsResult.Data := vResult;

      //Pendência 27857 - 05/05/2008
      //if fVlrSolicitado <= 0 then
      //  raise Exception.Create('Valor solicitado inválido.');
      //Fim Pendência 27857

      // Carrega Variaveis Locais
      if not RecuperaCdsResult(vResult, rSolicitante, rParamEmptmo, rTipoContratoEmptmo) then
         raise Exception.Create( sMsgErro );

      // Carrega Variaveis Locais
      if not RecuperaParamSimulacao(vResult, rParamSimulacao) then
         raise Exception.Create( sMsgErro );

      //Pendência 28160 - 12/06/2008
      if fVlrSolicitado = 0 then
         fVlrSolicitado := rParamSimulacao.fVLRMAXPERMIT;
      //Fim Pendência 28160

      //Pendência 22248 - 08/08/2006
      if (iTipoCliente <> 19981) and (fVlrSolicitado < rParamSimulacao.fSALDOAQUITAR) then
      //Fim Pendência 22248
        raise Exception.Create('O valor solicitado não pode ser inferior ao saldo a quitar.');

      if sPrazos <> '' then
           sParcelas := sPrazos
      else sParcelas := rParamSimulacao.sPARCELAS2;

      dAgora := WebEmprestimo.HoraServidor;

      if fVlrSolicitado > rParamSimulacao.fVLRMAXPERMIT  then
         raise Exception.Create( 'O valor solicitado ultrapassa o valor máximo de permitido para contratação.' );


      //Simulando...parcelas
      if bGeraLogProcesso then CMDebugToFile( 'Efetua SimulaEmprestimo... ', sNomeArqLog );      
      cdsLocal.Data := WebEmprestimo.SimulaEmprestimo( sParcelas,
                                                       rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                                       iIdEmpresaProp,
                                                       rParamEmptmo.iIDPAIS,
                                                       rParamEmptmo.iIDCIDADES,
                                                       rParamSimulacao.iANTIDTIPOCONTREMPTMO,
                                                       rParamEmptmo.sCODESTADO,
                                                       rParamSimulacao.fSALPARTICIPACAO,
                                                       rParamSimulacao.fSALMANTIDO,
                                                       rParamSimulacao.fSALAUXDOENCA,
                                                       rParamSimulacao.fSALBENEF,
                                                       rParamSimulacao.fVLRSALBASE,
                                                       rParamSimulacao.fVLRMAXPERMIT,
                                                       rTipoContratoEmptmo.sMOESIGLA,
                                                       0,
                                                       rParamSimulacao.fVLRMARGEM,
                                                       rParamSimulacao.fVALRESERVA,
                                                       rParamSimulacao.fTXJUROS,
                                                       rParamSimulacao.fSALDOAQUITAR,
                                                       fVlrSolicitado,
                                                       rParamSimulacao.fQUITACAO,
                                                       rParamSimulacao.fSALDOQUITACAO,
                                                       FormatDateTime( 'YYYYMM', dAgora ),
                                                       rParamSimulacao.dDTCREDITO,
                                                       dAgora,
                                                       dAgora,
                                                       rParamSimulacao.dDT1APARCELA,
                                                       rSolicitante.iIDSITPART,
                                                       rSolicitante.iIDPESSJUR,
                                                       rSolicitante.iIDPLANOPREV,
                                                       rSolicitante.iIDTITULAR,
                                                       rSolicitante.iIDBENEF,
                                                       rParamEmptmo.bFLGEXCEPCIONAL,
                                                       rParamSimulacao.iANTIDCONTRATOEMPTMO,
                                                       rParamSimulacao.iANTPRAZO,
                                                       rParamSimulacao.fANTVALORSOLIC,
                                                       rParamSimulacao.dANTDATACREDITO,
                                                       rParamSimulacao.iANTULTPARCGERADA,
                                                       rParamSimulacao.iANTPRAZO,
                                                       rParamSimulacao.iANTNUMPARCPAGAS,
                                                       rParamSimulacao.fVLRDEVSEG,
                                                       rParamSimulacao.fVLRSEGUROANT,
                                                       rParamSimulacao.fVLRSEGUROCOMPLANT,
                                                       0,
                                                       vLista,
                                                       //Pendência 22248 - 01/08/2006
                                                       rTipoContratoEmptmo.iIDREGRAMARGEM,
                                                       iTipoCliente,
                                                       rParamSimulacao.fTOTALPARCELAS,
                                                       rParamSimulacao.fTOTALPENDENCIAS,
                                                       rParamSimulacao.iMAXPARCELAS,
                                                       rSolicitante.sFLGINTERNO
                                                       //Fim Pendência 22248
                                                       );

      //Salva a lista em disco para posterior uso (se necessário)
      cdsLista.Data := WebEmprestimo.ListaItemToDataPacket( vLista );
      sArqLista := SaveDataset( cdsLista.Data );

      // Carrega resultado da simulacao no CDS
      cdsResult.Edit;
      cdsResult.FieldByName('sim_sArqLista').AsString := sArqLista;
      cdsResult.Post;

      vParcelas := cdsLocal.Data;
      vResult   := cdsResult.Data;


     except
        On E : Exception do begin
           Result   := False;
           sMsgErro := E.Message;
        end;
     end;

  finally
    cdsLocal.Free;
    cdsLista.Free;
    cdsResult.Free;
  end;

end; {Simulacao}




function TCtrlEmpSimulacaoInscricao.ParamConcessao(var vResult: OLEVariant;
                                                   const vParcelas: OLEVariant;
                                                   const fVlrSolicitado: Currency;
                                                   const iParcelas, iIdFornecedor, iCodAutoEmp: Extended;
                                                   const sBanco, sAgencia, sContaCorrente: string ): Boolean;
var cdsResult, cdsParcelas, cdsContas : TCMClientDataSet;

begin
  try
    cdsResult   := TCMClientDataSet.Create( nil );
    cdsParcelas := TCMClientDataSet.Create( nil );
    cdsContas   := TCMClientDataSet.Create( nil );

    try

       //Recuperando Parametros da Concessão.

       Result := True;
       cdsResult.Data   := vResult;
       cdsParcelas.Data := vParcelas;
       if cdsResult.IsEmpty then
          raise Exception.Create( 'Não foram encontrados os parâmetros da simulação' );

       cdsResult.Edit;
       cdsResult.FieldByName('sim_fVlrSolicitado').AsCurrency := fVlrSolicitado;
       cdsResult.FieldByName('sim_iParcelas').AsFloat         := iParcelas;
       cdsResult.FieldByName('sim_iCodAutoEmp').AsFloat       := iCodAutoEmp;
       cdsResult.FieldByName('sim_sBancoPag').AsString        := sBanco;
       cdsResult.FieldByName('sim_sAgenciaPag').AsString      := sAgencia;
       cdsResult.FieldByName('sim_sContaPag').AsString        := sContaCorrente;

       cdsResult.FieldByName('sim_iIdFornCred').AsFloat       := iIdFornecedor;

       if trim(cdsResult.FieldByName('con_sFlgFormaPag').AsString) <> '' then
            cdsResult.FieldByName('sim_sFormaPagto').AsString := cdsResult.FieldByName('con_sFlgFormaPag').AsString
       else cdsResult.FieldByName('sim_sFormaPagto').AsString := cdsResult.FieldByName('emp_sFlgFormaPag').AsString;

       if trim(cdsResult.FieldByName('con_sFlgFormaRec').AsString) <> '' then
            cdsResult.FieldByName('sim_sFormaRecto').AsString := cdsResult.FieldByName('con_sFlgFormaRec').AsString
       else cdsResult.FieldByName('sim_sFormaRecto').AsString := cdsResult.FieldByName('emp_sFlgFormaRec').AsString;

       cdsResult.FieldByName('sim_sPortFormaRecto').AsString  := cdsResult.FieldByName('emp_sCodPortFormaRec').AsString;
       cdsResult.FieldByName('sim_sPortFormaPagto').AsString  := cdsResult.FieldByName('emp_sCodPortFormaPag').AsString;
       cdsResult.FieldByName('sim_sCodFormaPagto').AsString   := cdsResult.FieldByName('emp_sCodFormaPag').AsString;

       // Busca valores da parcela simulada
       if cdsParcelas.Locate('QTDE_PARC',iParcelas,[]) then begin
          cdsResult.FieldByName('sim_fVlrLiquidoEP').AsCurrency  := cdsParcelas.FieldByName('VL_LIQUIDO').AsCurrency;
          cdsResult.FieldByName('sim_fVlrParcCalc').AsCurrency   := cdsParcelas.FieldByName('VL_PARCELA').AsCurrency;
       end else begin
          raise Exception.Create( 'Não foram encontradas as parcelas simuladas' );
       end;

       // Recupera Conta Bancária para debito
       cdsContas.Data := WebEmprestimo.DadosBancariosSolic( cdsResult.FieldByName('sol_iIdBenef').AsInteger );
       if not cdsContas.IsEmpty then begin
          cdsResult.FieldByName('sim_sContaBancariaRec').AsString := cdsContas.FieldByName('IDCBANCARIA').AsString;
       end;

       // Recupera Conta Bancária para Credito
       if iIdFornecedor > 0 then begin
          cdsContas.Data := WebEmprestimo.DadosBancariosSolic( StrToInt(FloatToStr(iIdFornecedor)) );
          if not cdsContas.IsEmpty then begin
             cdsResult.FieldByName('sim_sContaBancariaPag').AsString := cdsContas.FieldByName('IDCBANCARIA').AsString;
          end;
       end else begin
          cdsResult.FieldByName('sim_sContaBancariaPag').AsString := cdsResult.FieldByName('sim_sContaBancariaRec').AsString;
       end;

       if trim(cdsResult.FieldByName('sim_sContaBancariaPag').AsString) = '' then
          raise Exception.Create( 'Conta bancária de crédito não encontrada ou não cadastrada como preferencial' );

       cdsResult.Post;

       vResult   := cdsResult.Data;

     except
        On E : Exception do begin
           Result   := False;
           sMsgErro := E.Message;
        end;
     end;

  finally
    cdsResult.Free;
    cdsParcelas.Free;
  end;
end;




function TCtrlEmpSimulacaoInscricao.InscricaoConcessao( const iTipoGravacao: Integer;
                                                        var   vResult: OLEVariant;
                                                        const vParcelas, vContrAnt: OLEVariant ): Boolean;
var
  rSolicitante        : TSolicitante;
  rParamEmptmo        : TParamEmptmo;
  rTipoContratoEmptmo : TTipoContratoEmptmo;
  rParamSimulacao     : TParamSimulacao;
  rSimulacao          : TSimulacao;

  cdsResult,
  cdsItens,
  cdsAvalista,
  cdsContratosAnteriores,
  cdsLista,
  cdsResponsavel,
  cdsTemp,
  cdsRealizado : TCMClientDataset;

  iIdInscricaoEmptmo,
  fIdValidaContrato,
  iIdContratoEmptmo : extended;

  i,
  iIdItemEmptmo,
  iIdResponsavel,
  iIdRegraCalc : integer;

  oEstrutura : OleVariant;

  fRendaComp, fAux : currency;
  iPlanoAjuste : integer;

  dSysDate : TDateTime;

  vLista : TListaItem;

  rNovoContrato: TDadosContrato;
  bObrigaAvalista : Boolean;
  sMsgAux : string;

  //Pendência 26916 - 21/12/2007
  iQtdIDTIPOEMPTMO,
  iQtdIDTIPOCONTREMPTMO : Integer;
  //Fim Pendência 26916
begin

  cdsItens  := TCMClientDataset.Create( nil );
  cdsTemp   := TCMClientDataset.Create( nil );

  try

    try
      Result := True;

      // Carrega Variaveis Locais
      if not RecuperaCdsResult(vResult, rSolicitante, rParamEmptmo, rTipoContratoEmptmo) then
         raise Exception.Create( sMsgErro );

      // Carrega Variaveis Locais
      if not RecuperaParamSimulacao(vResult, rParamSimulacao) then
         raise Exception.Create( sMsgErro );

      // Carrega Variaveis Locais
      if not RecuperaSimulacao(vResult, vParcelas, rSimulacao) then   // ALTERAR PARA vParcelas
         raise Exception.Create( sMsgErro );


      cdsContratosAnteriores := TCMClientDataset.Create( nil );
      cdsLista               := TCMClientDataset.Create( nil );
      cdsContratosAnteriores.Data := vContrAnt;
      cdsLista.LoadFromFile( rSimulacao.sARQLISTA );

      //Valida preenchimento dos campos
      if trim( rSimulacao.sFORMAPAGTO ) = '' then
        raise Exception.Create('A Forma de Recebimento da Conecessão deve ser informada.');

      if trim( rSimulacao.sFORMARECTO ) = '' then
        raise Exception.Create('A Forma de Pagamento das Prestações deve ser informada.');

      if rSimulacao.fVLRLIQUIDOEP <= 0 then
        raise Exception.Create('Valor a ser creditado inválido.');

      //----- Validação da Inscrição -----//

      // Verifica se existe existe concessão de outro contrato para o mesmo dia ou posterior
      if not( WebEmprestimo.VerificaConcessaoIgualPosterior( rSolicitante.iIDTITULAR ,
                                                             rSolicitante.iIDBENEF ,
                                                             rParamSimulacao.dDTCREDITO ,
                                                             True ) ) then
        raise Exception.Create('Já existe outro contrato concedido para data posterior.' );

      // Verifica se já existe o codigo do autoemprestimo
      if WebEmprestimo.VerificaAutoEmprestimo(rSimulacao.iCODAUTOEMP,
                                              fIdValidaContrato ) then
        raise Exception.Create('Já existe outro contrato concedido com o mesmo código do Auto Empréstimo.' );

      // Verifica se já existe o codigo do autoemprestimo
      if ( rParamSimulacao.fSALDOAQUITAR > 0 ) and
         ( rParamEmptmo.iFLGRENPRESTAB = 1)    and
         ( rParamSimulacao.fVLREMABERTO > 0 )  then
        raise Exception.Create( 'Existem itens anteriores em aberto! ' + #13 + 'Não será permitida a Renovação.' );

      //Tratamento de Assinatura / Contrato Padrão
      if (rParamEmptmo.iFLGTRATAASSINAT = 1) and (rParamSimulacao.iPOSSUIASSINATURA = 0) then
        raise Exception.Create( 'Mutuário não possui assinatura para esse tipo de contrato.' );


      //Tratamento de Nr de parcelas pagas
      cdsTemp.Data := WebEmprestimo.BuscaCarenciaPorContratosQuitaveis(rTipoContratoEmptmo.iIDTIPOCONTREMPTMO);

      cdsContratosAnteriores.First;
      while not ( cdsContratosAnteriores.Eof ) do
      begin
        if rTipoContratoEmptmo.iFLGVERPRAZOTIPOQUIT = 1 then
        begin
           if cdsTemp.Locate('IDTIPOCONTREMPTMO', cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger,[]) then
           begin
             if ( cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 ) or
                ( cdsContratosAnteriores.RecordCount = rTipoContratoEmptmo.iTEPMAXCONTRATO ) then
             begin
                //Verifica se o número de parcelas pagas é suficiente.
                if not rParamEmptmo.bFLGEXCEPCIONAL then
                begin
                  if cdsContratosAnteriores.FieldByName('NUMPARCPAGAS').AsInteger <  cdsTemp.FieldByName('TCEMINRENOVA').AsInteger then
                     raise Exception.Create( 'O número de parcelas pagas do contrato anterior é inferior ao permitido para renovação.' );
                end
                else
                begin
                  if ( cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger = cdsTemp.FieldByName('IDTIPOCONTREMPTMO').AsInteger ) and
                     ( cdsContratosAnteriores.FieldByName('NUMPARCPAGAS').AsInteger < cdsTemp.FieldByName('TCEMINRENOVA').AsInteger ) then
                  begin
                    if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 then
                    begin
                      if not WebEmprestimo.PrimeiraRenovacao2006( rSolicitante.iIDTITULAR, rSolicitante.iIdBenef, rTipoContratoEmptmo.iIdTipoContrEmptmo ) then
                        raise Exception.Create( 'O número de parcelas pagas do contrato anterior é inferior ao permitido para renovação.' );
                    end;
                  end;
                end;
             end;
           end;
        end
        else
        begin
           if ( cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 ) or
              ( cdsContratosAnteriores.RecordCount = rTipoContratoEmptmo.iTEPMAXCONTRATO ) then
           begin

             //Verifica se o número de parcelas pagas é suficiente.
             if not rParamEmptmo.bFLGEXCEPCIONAL then
             begin
               if cdsContratosAnteriores.FieldByName('NUMPARCPAGAS').AsInteger <  rTipoContratoEmptmo.iTCEMINRENOVA then
                  raise Exception.Create( 'O número de parcelas pagas do contrato anterior é inferior ao permitido para renovação.' );
             end
             else
             begin
               if ( cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger = rTipoContratoEmptmo.iIDTIPOCONTREMPTMO ) and
                  ( cdsContratosAnteriores.FieldByName('NUMPARCPAGAS').AsInteger < rTipoContratoEmptmo.iTCEMINRENOVA ) then
               begin
                 if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 then
                 begin
                   if not WebEmprestimo.PrimeiraRenovacao2006( rSolicitante.iIDTITULAR, rSolicitante.iIdBenef, rTipoContratoEmptmo.iIdTipoContrEmptmo ) then
                     raise Exception.Create( 'O número de parcelas pagas do contrato anterior é inferior ao permitido para renovação.' );
                 end;
               end;
             end;
           end;

        end;

        cdsContratosAnteriores.Next;
      end;

      //roda a regra de limites...
      if not WebEmprestimo.BuscaLimites( rSolicitante.iIDTITULAR,
                                         rSolicitante.iIDBENEF,
                                         rTipoContratoEmptmo.iIDTIPOEMPTMO,
                                         rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                         rSimulacao.fVLRSOLICITADO,
                                         rSimulacao.fVLRPARCCALC,
                                         rSimulacao.iPARCELAS,
                                         0,
                                         rSolicitante.iIDSITPART,
                                         rTipoContratoEmptmo.iIDREGRALIMITES,
                                         rParamSimulacao.dDATAFINALBENEFICIO,
                                         rParamSimulacao.fVLRMARGEM,
                                         rParamSimulacao.fVALRESERVA,
                                         rParamSimulacao.fSALDOAQUITAR,
                                         rParamSimulacao.fTOTALPARCELAS,
                                         rParamSimulacao.fTOTALPENDENCIAS,
                                         Now,
                                         rSimulacao.fVLRLIQUIDOEP,
                                         iIdEmpresaProp,
                                         rParamSimulacao.fVLRSALBASE ) then
        raise Exception.Create('Empréstimo não passou na Regra de Limites.');


      //Prepara o dataset de itens
      cdsItens.Data := HistMovInscricao.SelecionaHistMovInscricao( 0 );


      if iTipoGravacao = 1 then
      begin

        //Inscrição
        iIdInscricaoEmptmo := WebEmprestimo.InscreveEmptmo(  rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                                             rTipoContratoEmptmo.iIDTIPOEMPTMO,
                                                             rSolicitante.iIDPESSJUR,
                                                             rSolicitante.iIDPLANOPREV,
                                                             rSolicitante.iIDTITULAR,
                                                             rSolicitante.iIDBENEF,
                                                             rSimulacao.iPARCELAS,
                                                             iIdEmpresaProp,
                                                             rSimulacao.sFORMAPAGTO,
                                                             rSimulacao.sFORMARECTO,
                                                             rSimulacao.sCODFORMAPAGTO,
                                                             rSimulacao.sPORTFORMAPAGTO,
                                                             rSimulacao.sPORTFORMARECTO,
                                                             rSimulacao.sCONTABANCARIAPAG,
                                                             rSimulacao.sCONTABANCARIAREC,
                                                             rTipoContratoEmptmo.sMOECODIGO,
                                                             rParamSimulacao.dDTCREDITO,
                                                             rSimulacao.fVLRSOLICITADO,
                                                             rParamSimulacao.fVLRSALBASE,
                                                             rParamSimulacao.fVLRMARGEM,
                                                             rParamSimulacao.fVLRMAXPERMIT,
                                                             rParamSimulacao.fTXJUROS,
                                                             rSimulacao.iIDAVALISTA,
                                                             rSimulacao.sBENEFICIARIOS,
                                                             True,
                                                             cdsItens.Data );

        if ( iIdInscricaoEmptmo <= 0 ) then
          raise Exception.Create( sMsgCtrl )
        else
        begin
          if WebEmprestimo.InTransaction then
            WebEmprestimo.Rollback;

          cdsRealizado := TCMClientDataset.Create( nil );
          try
            cdsRealizado.Data := InscricaoEmptmo.SelecionaDadosInscricao( rSolicitante.iIDBENEF, rSolicitante.iIDTITULAR, iIdInscricaoEmptmo, '', 0, 0 );

            if cdsRealizado.IsEmpty then
              raise Exception.Create('Houve um erro ao tentar localizar os dados da inscrição ' + FloatToStr( iIdInscricaoEmptmo ) + '.'  )
            else
            begin
              GravaTxt( sLogDir + 'Inscrição em Empréstimo ' + FloatToStr( iIdInscricaoEmptmo ) + '.txt',
               'A inscrição em empréstimo ' + FloatToStr( iIdInscricaoEmptmo ) + ' foi salva em ' + FormatDateTime( 'dd/mm/yyyy', Now ) + ', às ' +
               FormatDateTime( 'hh:mm:ss', Now ) + '.' + CR + CR +
               'IDTITULAR: ' + cdsRealizado.FieldByName('IDPESSOA').AsString + CR +
               'IDBENEF: ' + cdsRealizado.FieldByName('IDBENEF').AsString + CR +
               'Valor solicitado: ' + FormatFloat( '#,##0.00', cdsRealizado.FieldByName('VLRSOLIC').AsFloat ) + CR +
               'No. Parcelas: ' + cdsRealizado.FieldByName('NUMPARCELAS').AsString + CR +
               'Data de Crédito: ' + FormatDateTime( 'dd/mm/yyyy', cdsRealizado.FieldByName('DATACREDITO').AsDateTime ) + CR +
               'Conta Bancária de Pagamento: Selecionada: ' + trim(rSimulacao.sCONTABANCARIAPAG) + '; Gravada: ' + cdsRealizado.FieldByName('IDCBANCARIA').AsString );
            end;

          finally
            cdsRealizado.Free;
          end;

        end;


      end
      else
      begin

        //Contratação
        try

          //Valida contrato

          //Pendência 26916 - 21/12/2007
          // Verifica se o participante excedeu o número máximo de contrato,
          // logo ele será alertado que enquanto não Quitar quantidade
          // suficiente de contratos anteriores, NÃO poderá contratar este empréstimo
          iQtdIDTIPOEMPTMO      := 0;
          iQtdIDTIPOCONTREMPTMO := 0;

          cdsContratosAnteriores.First;

          while not cdsContratosAnteriores.EOF do
          begin

            if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger <> 1 then
            begin

                if ( cdsContratosAnteriores.FieldByName('IDTIPOEMPTMO').AsInteger = rTipoContratoEmptmo.iIdTipoEmptmo ) then
                     iQtdIDTIPOEMPTMO := iQtdIDTIPOEMPTMO + 1;

                if ( cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger = rTipoContratoEmptmo.iIdTipoContrEmptmo ) then
                     iQtdIDTIPOCONTREMPTMO := iQtdIDTIPOCONTREMPTMO + 1;

            end;

            cdsContratosAnteriores.Next;

          end;

          if ( rTipoContratoEmptmo.iTceMaxContrato <= iQtdIDTIPOCONTREMPTMO ) or
             ( rTipoContratoEmptmo.iTepMaxContrato <= iQtdIDTIPOEMPTMO ) then
          begin
            sMsgAux := 'Este empréstimo quitará parcelas de contratos anteriores.';
          end;
{
          if not WebEmprestimo.ValidaContrato( rSolicitante.iIDTITULAR,
                                               rSolicitante.iIDBENEF,
                                               rTipoContratoEmptmo.iIDTIPOEMPTMO,
                                               rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                               rParamSimulacao.iQTDEPQUITADO,
                                               iIdEmpresaProp,
                                               rParamEmptmo.bFLGEXCEPCIONAL,
                                               sMsgAux ) then
            raise Exception.Create('Não foi possível realizar esta contratação.');
}
          //Fim Pendência 26916

          //Verifica se o usuário possui suspensão de concessâo anterior.
          if WebEmprestimo.PossuiSuspensaoConcessao( rSolicitante.iIDBENEF, rParamSimulacao.dDTCREDITO ) then
            raise Exception.Create('Mutuário possui suspensão de concessão anterior e não pode contratar este empréstimo.');

          //Verifica se permite concessão no ultimo dia util do mes
          if (rParamEmptmo.iFLGCONCULTDIAMES = 1) and EhUltimoDiaUtilMes( Now, rParamEmptmo.iIDCIDADES, rParamEmptmo.iIDPAIS, rParamEmptmo.sCODESTADO ) then
            raise Exception.Create( 'Não é permitido concessão no último dia útil do mês.' );

          //Pendência 27749 - 17/04/2008
          {
          if rParamEmptmo.bFLGEXCEPCIONAL then
          begin
            if not( rTipoContratoEmptmo.iIDTIPOCONTREMPTMO in [11, 12, 13, 14, 15, 16]) then
            begin

              if ( ( rSimulacao.fVLRPARCCALC > rParamSimulacao.fVLRMARGEM ) ) then
              begin
                if rParamEmptmo.bFLGEXCEPCIONAL then
                  raise Exception.Create( 'Para a contratação, é exigida margem consignável com base na renda básica, descontadas parcelas obrigatórias e facultativas.' )
                else
                  raise Exception.Create( 'Valor da prestação não pode ser superior a margem consignável.' );
              end;
            end
            else
            begin

              if not( WebEmprestimo.VerificaContratoAtivo( rSolicitante.iIDTITULAR, rSolicitante.iIDBENEF, rTipoContratoEmptmo.iIDTIPOCONTREMPTMO, -1 ) ) then
                Exit;

            end;
          end
          else
          }
          if ( ( not rParamEmptmo.bFLGEXCEPCIONAL ) or
               ( rTipoContratoEmptmo.iFLGNAOVERIFICAMRGPCL = 0 ) ) then
          //Fim Pendência 27749
          begin

             if ( ( rSimulacao.fVLRPARCCALC > rParamSimulacao.fVLRMARGEM ) ) then
             begin
               //if rParamEmptmo.bFLGEXCEPCIONAL then
               //  raise Exception.Create( 'Para a contratação, é exigida margem consignável com base na renda básica, descontadas parcelas obrigatórias e facultativas.' )
               //else
                 raise Exception.Create( 'Valor da prestação não pode ser superior a margem consignável.' );
             end;
          end;


          //Valida o Avalista...
          bObrigaAvalista := ( rSolicitante.sFLGINTERNO = 'MA' ) and ( rParamEmptmo.iFLGOBRIGAAVALISTA = 1 ) and
                             ( WebEmprestimo.VerificaObrigatoriedadeAvalista( rSolicitante.iIDBENEF,
                                                                              rParamEmptmo.iIDREGRAAVAL, iIdEmpresaProp ) );

          if (bObrigaAvalista) then
          begin
            if rSimulacao.iIDAVALISTA <= 0 then
              raise Exception.Create ('É necessário indicar o avalista.' );

            fRendaComp := 0;

            cdsAvalista := TCMClientDataset.Create( nil );
            try
              cdsAvalista.Data := WebEmprestimo.DadosAvalista( rSimulacao.iIDAVALISTA );

              fRendaComp := cdsAvalista.FieldByName('RENDACOMP').AsCurrency;

              if fRendaComp < rParamSimulacao.fVLRSALBASE then
                raise Exception.Create( 'A renda do avalista deve ser igual ou superior ao salário base do Mutuário.' );

            finally
              cdsAvalista.Free;
            end;

          end;

          cdsResponsavel := TCMClientDataset.Create( nil );
          try
            cdsResponsavel.Data := WebEmprestimo.Responsavel( rSolicitante.iIDTITULAR, rSolicitante.iIDBENEF );
            iIdResponsavel := -1;
            if not cdsResponsavel.IsEmpty then
              iIdResponsavel := cdsResponsavel.FieldByName('IDRESPONSAVEL').AsInteger;
          finally
            cdsResponsavel.Free;
          end;

          LimpaRegistroContrato( rNovoContrato );

          dSysDate := SysDate( WebEmprestimo );

          rNovoContrato.IDContratoEmptmo  := WebEmprestimo.SeqContrato;
          rNovoContrato.IDContrQuitacao   := -1;
          rNovoContrato.IDInscricaoEmptmo := -1;
          rNovoContrato.IDTipoEmptmo      := rTipoContratoEmptmo.iIDTIPOEMPTMO;
          rNovoContrato.IDTipoContrEmptmo := rTipoContratoEmptmo.iIDTIPOCONTREMPTMO;
          rNovoContrato.IDPessoa          := rSolicitante.iIDTITULAR;
          rNovoContrato.IDBenef           := rSolicitante.iIDBENEF;
          rNovoContrato.IDSitPart         := rSolicitante.iIDSITPART;
          rNovoContrato.IDPlanoPrev       := rSolicitante.iIDPLANOPREV;
          rNovoContrato.IDPlanoOrigem     := rSolicitante.iIDPLANOPREV;

          // 12/12/2005 - pendência 20912 (ou 20848)
          if rParamEmptmo.bFLGEXCEPCIONAL then
          begin
            iPlanoAjuste  := WebEmprestimo.AcertaPlanoOrigem( -1,
                                                              rNovoContrato.IDBenef,
                                                              rNovoContrato.IDPlanoPrev,
                                                              rParamEmptmo.bFLGEXCEPCIONAL,
                                                              False );

             if iPlanoAjuste > 0 then
                rNovoContrato.IDPlanoOrigem   := iPlanoAjuste;
          end;
          // FIM pendência 20912 (ou 20848)

          rNovoContrato.IDPatro           := rSolicitante.iIDPESSJUR;
          rNovoContrato.IDResponsavel     := iIdResponsavel;
          rNovoContrato.NumParcelas       := rSimulacao.iPARCELAS;
          rNovoContrato.fValMargem        := 0;
          rNovoContrato.fValReserva       := rParamSimulacao.fVALRESERVA;
          rNovoContrato.fSalParticipacao  := rParamSimulacao.fSALPARTICIPACAO;
          rNovoContrato.fSalMantido       := rParamSimulacao.fSALMANTIDO;
          rNovoContrato.fSalAuxDoenca     := rParamSimulacao.fSALAUXDOENCA;
          rNovoContrato.fSalBenef         := rParamSimulacao.fSALBENEF;
          rNovoContrato.VlrSalBase        := rParamSimulacao.fVLRSALBASE;
          rNovoContrato.VlrMargem         := rParamSimulacao.fVLRMARGEM;
          rNovoContrato.VlrMaxPermit      := rParamSimulacao.fVLRMAXPERMIT;
          rNovoContrato.DataInscricao     := dSysDate;
          rNovoContrato.DataAssinatura    := dSysDate;
          rNovoContrato.DataCredito       := rParamSimulacao.dDTCREDITO;
          rNovoContrato.DataPrimParc      := rParamSimulacao.dDT1APARCELA;
          rNovoContrato.DataCanc          := 0;
          rNovoContrato.DataValidade      := 0;
          rNovoContrato.DataSaldoDev      := 0;
          rNovoContrato.DataPendencia     := 0;
          rNovoContrato.DataSituacao      := dSysDate;
          rNovoContrato.TxJuros           := rParamSimulacao.fTXJUROS;
          rNovoContrato.VlrContrato       := rSimulacao.fVLRSOLICITADO;
          rNovoContrato.VlrParcela        := rSimulacao.fVLRPARCCALC;
          rNovoContrato.VlrParcelaMes     := rParamSimulacao.fTOTALPARCELAS;
          rNovoContrato.VlrParcelaAtraso  := rParamSimulacao.fTOTALPENDENCIAS;
          rNovoContrato.VlrDebito         := 0;
          rNovoContrato.VlrReserva        := rParamSimulacao.fVALRESERVA;
          rNovoContrato.VlrSaldoDev       := 0;
          rNovoContrato.VlrPendencia      := rParamSimulacao.fTOTALPENDENCIAS;
          rNovoContrato.IDVerba           := -1;
          rNovoContrato.IDCBancaria       := StrToInt( rSimulacao.sCONTABANCARIAPAG );
          rNovoContrato.IDCBancariaDeb    := StrToInt( rSimulacao.sCONTABANCARIAREC );
          rNovoContrato.IDFornCred        := rSimulacao.iIDFORNCRED;
          rNovoContrato.CodFormaPag       := StrToInt( rSimulacao.sCODFORMAPAGTO );
          rNovoContrato.PortFormaPag      := StrToInt( rSimulacao.sPORTFORMAPAGTO );
          rNovoContrato.PortFormaRec      := StrToInt( rSimulacao.sPORTFORMARECTO );
          rNovoContrato.Indexador         := StrToInt( rTipoContratoEmptmo.sMOECODIGO );
          rNovoContrato.SiglaIndexador    := rTipoContratoEmptmo.sMOESIGLA;
          rNovoContrato.FlgFormaPag       := rSimulacao.sFORMAPAGTO;
          rNovoContrato.FlgFormaRec       := rSimulacao.sFORMARECTO;
          rNovoContrato.FlgSituacao       := 'A';
          rNovoContrato.NumParcDesconto   := rTipoContratoEmptmo.iNUMPARCDESCONTO;
          rNovoContrato.FlgExcepcional    := iff( rParamEmptmo.bFLGEXCEPCIONAL, 1, 0 );
          rNovoContrato.FlgFinanciamento  := 0;

          if rSimulacao.iCODAUTOEMP > 0 then
             rNovoContrato.IDCodAutoEmp   := rSimulacao.iCODAUTOEMP;

          if rParamEmptmo.iFLGCONTROLAINSC = 1 then
             rNovoContrato.FlgSituacao    := 'P';

          WebEmprestimo.DataPacketToListaItem( cdsLista.Data, rSimulacao.iPARCELAS, rSimulacao.sFORMAPAGTO, vLista );

          //Pendência 26775 - 26/12/2007
          if rParamEmptmo.iIDREGRAPLANOCOB <> 0 then
             rNovoContrato.IDPlanoCob := WebEmprestimo.IdentificaPlanoCobranca( rParamEmptmo.iIDREGRAPLANOCOB,
                                                                                rNovoContrato.IDPessoa,
                                                                                rNovoContrato.IDPlanoPrev,
                                                                                iIdEmpresaProp )
          else
             rNovoContrato.IDPlanoCob := -1;
          //Fim Pendência 26775

          //Faz a contratação do empréstimo
          iIdContratoEmptmo := WebEmprestimo.ContrataEmptmo( rNovoContrato,
                                                             vLista,
                                                             cdsContratosAnteriores.Data,
                                                             rParamEmptmo.iFLGCALCDIA,
                                                             rParamEmptmo.iFLGSALDODEVANT,
                                                             rTipoContratoEmptmo.iTEPMAXCONTRATO,
                                                             rParamSimulacao.dDTCREDITO,
                                                             rSimulacao.fVLRLIQUIDOEP,
                                                             rParamSimulacao.fSaldoAQuitar,
                                                             iIdEmpresaProp,
                                                             rTipoContratoEmptmo.iIDTIPOEMPTMO,
                                                             rTipoContratoEmptmo.iIDTIPOCONTREMPTMO,
                                                             rParamEmptmo.iFLGUSAFIARIO,
                                                             rParamEmptmo.iFLGESTORNOPOSQUIT,
                                                             rParamEmptmo.iFLGQUITAPARCMORTE,
                                                             rParamEmptmo.iFLGDATAATUSLD,
                                                             rParamEmptmo.iIDITEMPROVPERDA,
                                                             0,
                                                             460,
                                                             '',
                                                             rSimulacao.sFORMAPAGTO,
                                                             rSimulacao.sFORMARECTO,
                                                             rSimulacao.sCODFORMAPAGTO,
                                                             rSimulacao.sPORTFORMAPAGTO,
                                                             rSimulacao.sPORTFORMARECTO,
                                                             rSimulacao.sCONTABANCARIAPAG,
                                                             rSimulacao.sCONTABANCARIAREC,
                                                             rSimulacao.iIDAVALISTA,
                                                             rSimulacao.sBENEFICIARIOS,
                                                             rParamEmptmo.bFLGEXCEPCIONAL,
                                                             rParamEmptmo.iFLGABONODIVERG,
                                                             iTipoCliente,
                                                             rParamSimulacao.iQtdeItensEmptmo,
                                                             rParamSimulacao.iQtdeParcelasEmAberto,
                                                             rParamSimulacao.iIdUltHistMovEmptmo,
                                                             cdsItens.Data,
                                                             iIdInscricaoEmptmo );

          if ( iIdContratoEmptmo  <= 0 ) or
             ( iIdInscricaoEmptmo <= 0 ) then
            raise Exception.Create( sMsgCtrl )
          else
          begin
            if WebEmprestimo.InTransaction then
              WebEmprestimo.Rollback;

            cdsRealizado := TCMClientDataset.Create( nil );
            cdsResult    := TCMClientDataset.Create( nil );
            try
              cdsRealizado.Data := WebEmprestimo.ConsultaContrato( rSolicitante.iIDBENEF, iIdContratoEmptmo, '', 0, 0 );

              if cdsRealizado.IsEmpty then
                raise Exception.Create('Houve um erro ao tentar localizar os dados do contrato ' + FloatToStr( iIdContratoEmptmo ) +
                 ' (inscrição ' + FloatToStr( iIdInscricaoEmptmo ) + ').'  )
              else
              begin
                GravaTxt( sLogDir + 'Contratação do Empréstimo ' + FloatToStr( iIdContratoEmptmo ) + '.txt',
                 'O contrato de empréstimo ' + FloatToStr( iIdContratoEmptmo ) + ', inscrição ' +
                 FloatToStr( iIdInscricaoEmptmo ) + ', foi salvo em ' + FormatDateTime( 'dd/mm/yyyy', Now ) + ', às ' +
                 FormatDateTime( 'hh:mm:ss', Now ) + '.' + CR + CR +
                 'IDTITULAR: ' + cdsRealizado.FieldByName('IDPESSOA').AsString + CR +
                 'IDBENEF: ' + cdsRealizado.FieldByName('IDBENEF').AsString + CR +
                 'Valor solicitado: ' + FormatFloat( '#,##0.00', cdsRealizado.FieldByName('VLRCONTRATO').AsFloat ) + CR +
                 'No. Parcelas: ' + cdsRealizado.FieldByName('NUMPARCELAS').AsString + CR +
                 'Data de Crédito: ' + FormatDateTime( 'dd/mm/yyyy', cdsRealizado.FieldByName('DATACREDITO').AsDateTime ) );


                 cdsResult.Data := vResult;
                 cdsResult.Edit;
                 cdsResult.FieldByName('sim_iIdContratoEmptmo').AsFloat := iIdContratoEmptmo;
                 cdsResult.Post;

                 vResult := cdsResult.Data;
              end;

            finally
              cdsRealizado.Free;
              cdsResult.Free;
            end;

          end;

        finally
          cdsContratosAnteriores.Free;
          cdsLista.Free;
        end;

      end;

    except
        On E : Exception do begin
           Result    := False;
           fsMsgErro := E.Message;
        end;
    end;

  finally
    cdsItens.Free;
    cdsTemp.Free;
  end

end; {InscricaoConcessao}


function TCtrlEmpSimulacaoInscricao.InsereAssinaContr(const iIdTitular,
                                                            iIdBenef: Integer;
                                                      const iIdContratoPadrao: Integer;
                                                      const sNumContrato: string;
                                                      const dDataAssinatura: TDateTime): Boolean;
var sObservacao : string;
begin
   try
      Result := True;
      sObservacao := 'Assinatura via Auto-Empréstimo. ';
      //Pendência 27300 - 28/01/2008
      //if sNumContrato <> '' then sObservacao := sObservacao + 'Nr. Referência: ' + sNumContrato;
      //Fim Pendência 27300

      if not WebEmprestimo.InsertAssinaturaContr(iIdTitular, iIdBenef, iIdContratoPadrao,
                                                 sObservacao,
                                                 //Pendência 27300 - 28/01/2008
                                                 sNumContrato,
                                                 //Fim Pendência 27300
                                                 dDataAssinatura) then
         raise Exception.Create ( WebEmprestimo.MessageInfo );
    except
        On E : Exception do begin
           Result    := False;
           fsMsgErro := E.Message;
        end;
    end;
end;


//Pendência 27300 - 28/01/2008
function TCtrlEmpSimulacaoInscricao.RemoveAssinaContr(const sNumContrato: string): Boolean;
begin
   try
      Result := True;

      if not WebEmprestimo.DeleteAssinaturaContr(sNumContrato) then
         raise Exception.Create ( WebEmprestimo.MessageInfo );
    except
        On E : Exception do begin
           Result    := False;
           fsMsgErro := E.Message;
        end;
    end;
end;
//Fim Pendência 27300


function TCtrlEmpSimulacaoInscricao.ChecaAutoEmp(const fCodAutoEmp: Extended): Extended;
var fIdContratoEmptmo : Extended;
begin
   try
      Result  := -1;

      if WebEmprestimo.VerificaAutoEmprestimo(fCodAutoEmp, fIdContratoEmptmo) then
         Result := fIdContratoEmptmo;
    except
        On E : Exception do begin
           Result    := -1;
           fsMsgErro := E.Message;
        end;
    end;
end;



procedure TCtrlEmpSimulacaoInscricao.SetsMsgErro(const Value: String);
begin
  FsMsgErro := Value;
end;

function TCtrlEmpSimulacaoInscricao.GetsMsgErro: String;
begin
  Result := fsMsgErro;
end;


end.
