unit uCtrlImportaFinanc;

// Alterações:
//--------------------------------------------------------------------------------------------------
// Rotina      : GravaContribuicoes e GravatmpDesc
// Autor(a)    : Renato Visoni
// Pendência   : SOL  111730  Kintana 515538
// Alteração   : O sistema passou a salvar o VALORBASE1 na tmpDesc ao gravar as contribuições.
//--------------------------------------------------------------------------------------------------
// Rotina      : ImportaRubricas(...)
// Autor(a)    : André Pontes
// Pendência   : 22827 e 22828
// Data        : 01/12/2006 a 12/12/2006
// Alteração   : (1) Não alterar o valor enviado (na TmpDesc) se enviado pelo Empréstimo
//               (2) Fazer uma busca pelo valor exato na hora da baixa (para quando houver mais de
//                   uma prestação enviada)
//--------------------------------------------------------------------------------------------------
// Rotina      : GravaErrosCCP
// Autor(a)    : Gleyber
// Pendência   : 22442
// Data        : 24/05/2006
// Alteração   : Acerto na rotina de gravação de erros
//------------------------------------------------------------------------------
// Rotina      : VerificaImportAnterior
// Autor(a)    : Leo
// Pendência   : 21655
// Data        : 22/02/2006
// Alteração   : coloquei a verificação de última rubrica pela HISTRUBSAL, pois,
//               pela TMPDESC pegava somente as contribuições 
//------------------------------------------------------------------------------
// Rotina      : ImportaRubricas
// Autor(a)    : Leo
// Pendência   : 20597
// Data        : 27/10/2005
// Alteração   : coloquei a cláusula FLGDESFOLHA = ''P'' na procura de registros de empréstimo na TMPDESC
//------------------------------------------------------------------------------
// Rotina      : ImportaRubricas
// Autor(a)    : Leo
// Pendência   : 20100
// Data        : 30/08/2005
// Alteração   : conversão da string de valor de acordo com de-para
//------------------------------------------------------------------------------
// Rotina      : VerificaImportAnterior
// Autor(a)    : Leo
// Pendência   : 18982
// Data        : 18/08/2005
// Alteração   : sobrecarga da função VerificaImportAnterior para buscar última rubrica
//               importada em um mês
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Pendência   : 19931
// Data        : 16/08/2005
// Alteração   : criei a função VerificaExisteRecebOrigem para buscar se houve recebimento
//               por algum módulo de origem
//------------------------------------------------------------------------------
// Rotina      : ImportaRubricas
// Autor(a)    : Leo
// Data        : 25/07/2005
// Pendência   : acerto da resolução da pendência 19424
// Alteração   : coloquei vírgula que faltava no update da tmpdesc
//------------------------------------------------------------------------------
// Rotina      : GravaHistRubSal
// Autor(a)    : Leo
// Data        : 22/06/2005
// Pendência   : 19540
// Alteração   : acerto no caso da falta de parametrização das colunas PARCELA e EQUIPARACAO
//------------------------------------------------------------------------------
// Rotina      : ImportaRubricas
// Autor(a)    : Gleyber
// Data        : 15/06/2005
// Pendência   : 19424
// Alteração   : Implementar a gravação do valor esperado acumulado, quando for o caso. 
//------------------------------------------------------------------------------
{PROCEDURES
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE CM."SP_INSERT_HISTRUBSAL"  (
      pVALORPROVENTO IN HISTRUBSAL.VALORPROVENTO%TYPE, 
      pSEQRUBRICA IN HISTRUBSAL.SEQRUBRICA%TYPE,
      pREFERENCIA IN HISTRUBSAL.REFERENCIA%TYPE,
      pMESCOBRANCA IN HISTRUBSAL.MESCOBRANCA%TYPE,
      pMES IN HISTRUBSAL.MES%TYPE,
      pIDTITULAR IN HISTRUBSAL.IDTITULAR%TYPE,
      pIDRUBRICA IN HISTRUBSAL.IDRUBRICA%TYPE,
      pIDPLANOPREV IN HISTRUBSAL.IDPLANOPREV%TYPE,
      pIDPESSOA IN HISTRUBSAL.IDPESSOA%TYPE,
      pIDPESSJUR IN HISTRUBSAL.IDPESSJUR%TYPE,
      pIDPATRO IN HISTRUBSAL.IDPATRO%TYPE,
      pIDMOTIVO IN HISTRUBSAL.IDMOTIVO%TYPE,
      pIDMODULO IN HISTRUBSAL.IDMODULO%TYPE,
      pFLGSRB IN HISTRUBSAL.FLGSRB%TYPE,
      pFLGIRRF IN HISTRUBSAL.FLGIRRF%TYPE,
      pFLGCOMPOESALPART IN HISTRUBSAL.FLGCOMPOESALPART%TYPE,
      pFLGCOMPOESALBENEF IN HISTRUBSAL.FLGCOMPOESALBENEF%TYPE,
      pFLGCOMPOEREMTOTAL IN HISTRUBSAL.FLGCOMPOEREMTOTAL%TYPE,
      pCODPROVDESC IN HISTRUBSAL.CODPROVDESC%TYPE,
      pFLGEQUIPARACAO IN HISTRUBSAL.FLGEQUIPARACAO%TYPE ) is
begin
      insert into HISTRUBSAL
      (VALORRECEBIDO,VALORPROVENTO,VALORINTEGRAL,SEQRUBRICA,
      REFERENCIA,MESCOBRANCA,MES,IDTITULAR,IDRUBRICA,
      IDPLANOPREV,IDPESSOA,IDPESSJUR,IDPATRO,IDMOTIVO,IDMODULO,
      FLGSRB,FLGIRRF,FLGCOMPOESALPART,FLGCOMPOESALBENEF,FLGCOMPOEREMTOTAL,
      CODPROVDESC, FLGEQUIPARACAO)
      values (pVALORPROVENTO,pVALORPROVENTO,pVALORPROVENTO,pSEQRUBRICA,
      pREFERENCIA,pMESCOBRANCA,pMES,pIDTITULAR,pIDRUBRICA,
      pIDPLANOPREV,pIDPESSOA,pIDPESSJUR,pIDPATRO,pIDMOTIVO,pIDMODULO,
      pFLGSRB,pFLGIRRF,pFLGCOMPOESALPART,pFLGCOMPOESALBENEF,pFLGCOMPOEREMTOTAL,
      pCODPROVDESC, FLGEQUIPARACAO);
end SP_INSERT_HISTRUBSAL;



create or replace procedure SP_INSERT_TMPDESC(
      pIDLOTE IN TMPDESC.IDLOTE%TYPE,
      pIDFUNDACAO IN TMPDESC.IDFUNDACAO%TYPE,
      pIDPESSJUR IN TMPDESC.IDPESSJUR%TYPE,
      pIDPLANOPREV IN TMPDESC.IDPLANOPREV%TYPE,
      pIDTITULAR IN TMPDESC.IDTITULAR%TYPE,
      pIDPESSOA  IN TMPDESC.IDPESSOA%TYPE,
      pIDDESCONTO  IN TMPDESC.IDDESCONTO%TYPE,
      pIDPROVENTO IN TMPDESC.IDPROVENTO%TYPE,
      pCODPROVDESC IN TMPDESC.CODPROVDESC%TYPE,
      pMESREFERENCIA  IN TMPDESC.MESREFERENCIA%TYPE,
      pMESCOBRANCA IN TMPDESC.MESCOBRANCA%TYPE,
      pFLGTIPODESC  IN TMPDESC.FLGTIPODESC%TYPE,
      pVALOR  IN TMPDESC.VALOR%TYPE,
      pVALORRECEBIDO IN TMPDESC.VALORRECEBIDO%TYPE,
      pDATACOBRANCA  IN TMPDESC.DataCOBRANCA%TYPE,
      pDATARECEBIMENTO IN TMPDESC.DataRECEBIMENTO%TYPE,
      pFLGATRASODEVOL IN TMPDESC.FLGATRASODEVOL%TYPE,
      pDATAREFERENCIA IN TMPDESC.DataREFERENCIA%TYPE,
      pDESCRICAO IN TMPDESC.DESCRICAO%TYPE,
      pMATRICULA IN TMPDESC.MATRICULA%TYPE,
      pSITENVIO IN TMPDESC.SITENVIO%TYPE,
      pNODOCUMENTO IN TMPDESC.NODOCUMENTO%TYPE,
      pCOMPLDOCUMENTO IN TMPDESC.COMPLDOCUMENTO%TYPE,
      pIDFAVORECIDO IN TMPDESC.IDFAVORECIDO%TYPE,
      pIDEMPCOBRANCA IN TMPDESC.IDEMPCOBRANCA%TYPE,
      pIDMOTIVO IN TMPDESC.IDMOTIVO%TYPE ) is
begin

      insert into  TMPDESC(IDLOTE,IDFUNDACAO, IDPESSJUR,IDPLANOPREV,IDTITULAR,
      IDPESSOA , SEQPROPOSTA, IDDESCONTO , IDPROVENTO, CODPROVDESC,
      MESREFERENCIA , MESCOBRANCA, FLGTIPODESC , VALOR , VALORRECEBIDO,
      DATACOBRANCA , DATARECEBIMENTO, FLGDESCONTO , FLGDESCFOLHA,
      FLGATRASODEVOL, FLGEXISTEHST, DATAREFERENCIA,DESCRICAO,MATRICULA,
      REFERENCIA, IDMODULO, SITENVIO,NODOCUMENTO,COMPLDOCUMENTO,IDFAVORECIDO,
      IDEMPCOBRANCA, IDMOTIVO)
      values (pIDLOTE,pIDFUNDACAO, pIDPESSJUR, pIDPLANOPREV, pIDTITULAR,
      pIDPESSOA , 1,  pIDDESCONTO , pIDPROVENTO, pCODPROVDESC,
      pMESREFERENCIA , pMESCOBRANCA, pFLGTIPODESC , pVALOR , pVALORRECEBIDO,
      pDATACOBRANCA , pDATARECEBIMENTO, 1 , 'P',
      pFLGATRASODEVOL, 0, pDATAREFERENCIA, pDESCRICAO, pMATRICULA,
      '***', 32, pSITENVIO, pNODOCUMENTO, pCOMPLDOCUMENTO, pIDFAVORECIDO,
      pIDEMPCOBRANCA, pIDMOTIVO);

end SP_INSERT_TMPDESC;



create or replace procedure SP_INSERT_CLASSERUBRICAS(
      pCODPATRO   IN CLASSERUBRICAS.CODPATRO%TYPE,
      pIDPESSOA  IN CLASSERUBRICAS.IDPESSOA%TYPE,
      pMESREFERENCIA  IN CLASSERUBRICAS.MESREFERENCIA%TYPE,
      pIDRUBRICA  IN CLASSERUBRICAS.IDRUBRICA%TYPE,
      pCODPROVDESC  IN CLASSERUBRICAS.CODPROVDESC%TYPE,
      pVALORRECEBIDO  IN CLASSERUBRICAS.VALORRECEBIDO%TYPE,
      pMESCOBRANCA  IN CLASSERUBRICAS.MESCOBRANCA%TYPE,
      pSEQINTERFACE  IN CLASSERUBRICAS.SEQINTERFACE%TYPE,
      pCODPLANO  IN CLASSERUBRICAS.CODPLANO%TYPE,
      pFLG13  IN CLASSERUBRICAS.FLG13%TYPE,
      pORDEMCALCULO  IN CLASSERUBRICAS.ORDEMCALCULO%TYPE,
      pFLGATRASODEVOL  IN CLASSERUBRICAS.FLGATRASODEVOL%TYPE,
      pIDCONTRIBUICAO  IN CLASSERUBRICAS.IDCONTRIBUICAO%TYPE,
      pDATAREFERENCIA  IN CLASSERUBRICAS.DataREFERENCIA%TYPE,
      pCHAVE  IN CLASSERUBRICAS.CHAVE%TYPE,
      pVALORCHAVE  IN CLASSERUBRICAS.VALORCHAVE%TYPE ) is
begin

      insert into  CLASSERUBRICAS(CODPATRO,IDPESSOA,MESREFERENCIA,IDRUBRICA,
      CODPROVDESC,VALORRECEBIDO,MESCOBRANCA,SEQINTERFACE,CODPLANO,FLG13,ORDEMCALCULO,
      FLGATRASODEVOL,IDCONTRIBUICAO,DATAREFERENCIA,CHAVE,VALORCHAVE)
      values (pCODPATRO,pIDPESSOA,pMESREFERENCIA,pIDRUBRICA,
      pCODPROVDESC,pVALORRECEBIDO,pMESCOBRANCA,pSEQINTERFACE,pCODPLANO,pFLG13,pORDEMCALCULO,
      pFLGATRASODEVOL,pIDCONTRIBUICAO,pDATAREFERENCIA,pCHAVE,pVALORCHAVE);

end SP_INSERT_CLASSERUBRICAS;


create or replace procedure SP_INSERT_TABERROSCCP(
      pIDCONTROLE IN TABERROSCCP.IDCONTROLE%TYPE,
      pIDPESSJUR IN TABERROSCCP.IDPESSJUR%TYPE,
      pCODPROVENTO IN TABERROSCCP.CODPROVENTO%TYPE,
      pVALOR IN TABERROSCCP.VALOR%TYPE,
      pNOMEPATROC IN TABERROSCCP.NOMEPATROC%TYPE,
      pMATRICULA IN TABERROSCCP.MATRICULA%TYPE,
      pDATAREF IN TABERROSCCP.DataREF%TYPE,
      pMSGEXPLICATIVA IN TABERROSCCP.MSGEXPLICATIVA%TYPE,
      pMESCOBRANCA IN TABERROSCCP.MESCOBRANCA%TYPE,
      pIDCONTRIBUICAO IN TABERROSCCP.IDCONTRIBUICAO%TYPE ) is
begin

      insert into  TABERROSCCP(IDCONTROLE,IDPESSJUR,CODPROVENTO,VALOR,NOMEPATROC,
      MATRICULA,DATAREF,MSGEXPLICATIVA,MESCOBRANCA,IDCONTRIBUICAO)
      values (pIDCONTROLE,pIDPESSJUR,pCODPROVENTO,pVALOR,pNOMEPATROC,
      pMATRICULA,pDATAREF,pMSGEXPLICATIVA,pMESCOBRANCA,pIDCONTRIBUICAO);

end SP_INSERT_TABERROSCCP;



}
interface

Uses DB, uDataBase, uCmControlObject, dbclient,Wwtable,  StdCtrls,
     sysutils,uSistema, provider, uDiasUteis,Wwquery, UAdmPrev,DBaseDados,
     CmEventosCadastro,uCMClientDataSet, forms, fAguarde,  grids, dbtables,
     uMidasUtil,uCMSQLParams, Classes, wwriched, uCtrlRegra,
     uCMTypes,uFuncaoGeral,uDbTaberrosccp, uDbPatro, uDbCtrlinterface,
     uDbParaminterf, uDbClasserubricas, uDbRubricaxpess, uDbParamsal13,UMensErro,
     uDbHistRubSal, uDbTmpDesc  ;

Type

  TCtrlImportaFinanc = class(TCmControlObject)

  Protected
      procedure AfterInitialize; Override;
      procedure OnCreateAppServer;override;
      procedure DoChangeDataBase; override;
  private

    sDataCobRegra, sNomePatroRegra , sDataRefRegra : String;
    iIdLoteRegra : Integer;
    bAtualizaContribPai, bAtualizaContribPai2, bAtualizaContribPai3 : Boolean;


    StrProcHistRubSal: TStoredProc;
    StrProcTmpDesc: TStoredProc;
    StrProcClasseRubricas: TStoredProc;
    StrProcTabErrosCcp: TStoredProc;
    
    SQLParam : TCMSQLParams;
    iContadorCommit : Integer;
    DbTaberrosccp: TDbTaberrosccp;
    DbCtrlinterface : TDbCtrlinterface;
    DbParaminterf : TDbParaminterf;
    DbClasserubricas : TDbClasserubricas;
    DbRubricaxpess : TDbRubricaxpess;
    DbParamsal13 : TDbParamsal13;
    DbHistRubSal : TDbHistRubSal;
    DbTmpDesc : TDbTmpDesc;
    FCdsCtrlInterface : TCMClientDataSet;
    CdsTabErrosCcp : TCMClientDataSet;
    CdsBuscaPessoa : TCMClientDataSet;
    CdsPlanPatro : TCMClientDataSet;
    CdsBuscaRubrica : TCMClientDataSet;
    CdsAux : TCMClientDataSet;
    CdsLoop : TCMClientDataSet;
    CdsClasseRubricas : TCMClientDataSet;
    CdsHistRubSal : TCMClientDataSet;
    CdsTmpDesc : TCMClientDataSet;
    cdsSalPart : TCMClientDataSet;
    CtrlRegra         : TCtrlRegra;
    cdsCalcContrib         : TCMClientDataSet;
    FbCritHistRubSal: Boolean;
    procedure SetCdsCtrlInterface(const Value: TCMClientDataSet);
    procedure SetbCritHistRubSal(const Value: Boolean);

  public
      ListaTotSalarios, ListaTotSalarios13 : TStringGrid;
      bVerHistRubSal : Boolean;
      bErroUpdateTmpdesc : boolean; 

      Constructor Create; Override;
      Destructor  Destroy;Override;
      Property  CdsCtrlInterface: TCMClientDataSet  read FCdsCtrlInterface write SetCdsCtrlInterface;
      Property  bCritHistRubSal : Boolean read FbCritHistRubSal write SetbCritHistRubSal;

      function ImportaRubricas(    qryTxt                : TwwQuery;
                                   cdsDadosArquivo       : TCMClientDataSet;
                               var F, bad                : TextFile;
                                   bMontaBad             : Boolean;
                                   bInsereClasseRubricas : Boolean;
                                   mmDivergencias        : TMemo;
                                   lbMensagens           : TMemo;
                                   memBuscaRubricasDuplo : TMemo;
                                   memBuscaRubricas      : TMemo;
                                   memErros              : TwwDBRichEdit;
                                   sIDPessjur            : String;
                                   sMesRefGr             : String;
                                   sMesRef13             : String;
                                   sMesCobGr             : String;
                                   sDataRef              : String;
                                   sDataCob              : String;
                                   sDigito               : String;
                                   sNomePatro            : String;
                                   sCodProvDescSalPart   : String;
                                   sCodProvDescSal13     : String;
                                   sCodProvDescRemTotal  : String;
                                   iIniDigito            : Integer;
                                   iIdLote               : Integer;
                                   iIdRubSalBenef        : Integer;
                                   iIdRubRemTotal        : Integer;
                                   iIdRubSalPart         : Integer;
                                   iIdRubSal13           : Integer;
                                   sRubricaInicio        : String
                              ): Boolean;


      function GravaSalarios(qryTxt : TwwQuery;
                               cdsDadosArquivo : TCMClientDataSet;
                               var F, bad : TextFile;
                               mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sIDPlanoPrev,  sMesRef , sMesRef13,sMesCobGr,
                               sCodProvDescSalPart, sCodProvDescSal13 : String;
                               iIdRubSalBenef, iIdRubRemTotal,
                               iIdRubSalPart, iIdRubSal13 : Integer) : Boolean;


      function GravaContribuicoes(qryTxt : TwwQuery;
                               cdsDadosArquivo : TCMClientDataSet;
                               var F : TextFile;
                               mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sMesRefGr, sMesRef13,sMesCobGr, sDataRef, sDataCob, sNomePatro : String;
                               cmSQLCalcContrib : TCMSQLParams;
                               iIdLote : Integer ) : Boolean;


      function GravaTotSalarios( var F : TextFile;
                               mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sMesCob : String;
                               bCobra13 : Boolean;
                               iIdRubSalPart, iIdRubSal13 : Integer) : Boolean;

      function MontaDemonstrativo(qryTxt : TwwQuery ;
                               cdsDadosArquivo : TCMClientDataSet;
                               var F, bad : TextFile;
                               mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sMesRef, sMesCob, sNomePatro : String;
                               bInsereClasseRubricas : Boolean;
                               frmaguarde : TfrmAguarde) : Boolean;

      function DesfazHistRubSal( mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sIDPlanoPrev,
                               sMesRef, sMesCob : String ) : Boolean;

      function DesfazTmpDesc( mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sIDPlanoPrev,
                               sMesRef, sMesCob : String ) : Boolean;

      function DesfazHstRubricaxPess( mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sIDPlanoPrev,
                               sMesRef, sMesCob : String ) : Boolean;


      function ListaPatro : OleVariant;
      function ListaPlano(iIdPessJur : Integer ) : OleVariant;

      function VerificaImportAnterior(sMesCob, sIDpessjur : String) : OleVariant;  overload;
      function VerificaImportAnterior(sIDPessjur,sMesCob : String ; var sUltRubrica : String) : Boolean; overload;

      function VerificaTabErrosAnterior(sMesCob, sIDpessjur  : String) : OleVariant;
      function DeletaTabErros(sMesCob, sIDpessjur : String) : Boolean;
      function VerificaExisteIda(sIDpessjur, sIDPlanoPrev : String) : OleVariant;
      function VerificaExisteRecebOrigem(sIDpessjur, sIDPlanoPrev, sMesCob : String) : OleVariant;
      function InsereLote(sMesCob, sIDpessjur, sDesc : String) : Integer;
      function ListaDadosLayOut(sIDPessjur : String) : OleVariant;
      function ExcluiClasseRubricas : Boolean;
      procedure SelecionaCodRubricas(sidpessjur : String;
                                     var iIdRubSalBenef,
                                     iIdRubRemTotal,
                                     iIdRubSalPart,
                                     iIdRubSal13 : Integer;
                                     iExercicio : Integer;
                                     var sCodProvDescSalBenef,
                                     sCodProvDescRemTotal,
                                     sCodProvDescSalPart,
                                     sCodProvDescSal13 : String ;
                                     var bCobra13 : Boolean);

      procedure GravaErrosCCP(qryTxt : Twwquery;
                              cdsDadosArquivo :  TCMClientDataSet;
                              var bad : TextFile;
                              bMontaBad : Boolean;
                              iIdControle : Integer;  sIDPessjur,
                              sMsgExplicativa, sMatricula, sCodProvento, sDataRef : String;
                              fValor: Real; sIDContribuicao, sMesCobranca,
                              sNomePatro :String);

      function  ConvMes(sMes,sFormato,sIniAno:String):String;
      function  MontaLinhaArqBad(qryTxt : TwwQuery;
                                 cdsDadosArquivo : TCMClientDataset) : String;
      function  ConvValor(cdsDadosArquivo : TCMClientDataSet ; sValor:String):String;
      function  CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;



      function GravaHistRubSal(qryTxt : TwwQuery;
                               cdsDadosArquivo : TCMClientDataSet;
                               var  bad : TextFile;
                               bMontaBad  : Boolean;
                               var mmDivergencias : TMemo ;sIDPessjur, sMes, sMesCob, sIDPessoa,
                               sSeqRubrica, sIDPlanoPrev,
                               sProvento, sFlgSalPart, sFlgSalBenef, sFlgSalRemTotal,
                               sFlgIrrf, sNomePatro  : String;
                               fValor: Real;
                               iIdRubrica : Integer;
                               bVerHistRubSal : Boolean;
                               sPrazo : String ) : Boolean;

      function GravaClasseRubricas(sIDPessjur, sMes, sMesCob, sIDPessoa,
                                     sChave, sValorChave,
                                     sIDPlanoPrev, sIDContribuicao,  sProvento,
                                     sFlg13, sOrdemCalculo, sFlgAtrasoDevol,
                                     sDataRef : String;
                                     fValorRecebido: Real;
                                     iSeqInterface, iIdRubrica : Integer ) : Boolean;

      function GravaTmpDesc(sIDPessjur        : String;
                            sMes              : String;
                            sMesCob           : String;
                            sIDPessoa         : String;
                            sChave            : String;
                            sValorChave       : String;
                            sIDPlanoPrev      : String;
                            sIDContribuicao   : String;
                            sProvento         : String;
                            sFlgAtrasoDevol   : String;
                            sDataRef          : String;
                            fValorEsperado    : Real;
                            fValorRecebido    : Real;
                            iIdLote           : Integer;
                            iIdRubrica        : Integer;
                            fValorBase1       : Real = 0     // Renato Visoni SOL 111730	KINTANA 515538
                           ): Boolean;

      procedure OnResultRegra( Sender: TObject );

      procedure AlimentaListaTotSalarios(sidPlanoprev : String ; dValor : Double ; b13 : Boolean);

  end;

const
  NumMaxRegSemCommit = 2000;



implementation


constructor TCtrlImportaFinanc.Create;
begin
  inherited;
  FCdsCtrlInterface := TCMClientDataSet.Create(nil);


  SQLParam := TCMSQLParams.Create(nil);
  SQLParam.ControlObject := Self;


  //trago estrutura para inserts em cache
  CdsHistRubSal := TCMClientDataSet.Create(nil);
  CdsHistRubSal.FieldDefs.Add('VALORRECEBIDO',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('VALORPROVENTO',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('VALORINTEGRAL',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('SEQRUBRICA',ftfloat,0,True);
  CdsHistRubSal.FieldDefs.Add('SEQHISTFUNC',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('REFERENCIA',ftString,3,True);
  CdsHistRubSal.FieldDefs.Add('MESCOBRANCA',ftString,7,True);
  CdsHistRubSal.FieldDefs.Add('MES',ftString,7,True);
  CdsHistRubSal.FieldDefs.Add('IDTITULAR',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('IDRUBRICA',ftfloat,0,True);
  CdsHistRubSal.FieldDefs.Add('IDREGRACALCULO',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('IDPLANOPREV',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('IDPESSOA',ftfloat,0,True);
  CdsHistRubSal.FieldDefs.Add('IDPESSJUR',ftfloat,0,True);
  CdsHistRubSal.FieldDefs.Add('IDPATRO',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('IDMOTIVO',ftfloat,0,True);
  CdsHistRubSal.FieldDefs.Add('IDMODULO',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('FLGTIPODESC',ftString,1,False);
  CdsHistRubSal.FieldDefs.Add('FLGSRB',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('FLGIRRF',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('FLGCONCESSAO',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('FLGCOMPOESALPART',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('FLGCOMPOESALBENEF',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('FLGCOMPOEREMTOTAL',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('DATAPAGAMENTO',ftDateTime,0,False);
  CdsHistRubSal.FieldDefs.Add('CODPROVDESC',ftString,5,False);
  CdsHistRubSal.FieldDefs.Add('CODPORTFORMA',ftfloat,0,False);
  CdsHistRubSal.FieldDefs.Add('FLGEQUIPARACAO',ftfloat,0,False);  


  CdsHistRubSal.IndexDefs.Add('PK','REFERENCIA;MESCOBRANCA;MES;IDRUBRICA;IDPESSOA;IDPESSJUR;IDMOTIVO;SEQRUBRICA',[ixPrimary, ixUnique]);
  CdsHistRubSal.IndexName := 'PK';
  CdsHistRubSal.StoreDefs := True;





  CdsTabErrosCcp := TCMClientDataSet.Create(nil);
  CdsClasseRubricas := TCMClientDataSet.Create(nil);
  CdsTmpDesc := TCMClientDataSet.Create(nil);

  CdsBuscaPessoa := TCMClientDataSet.Create(nil);
  CdsBuscaRubrica := TCMClientDataSet.Create(nil);
  CdsAux := TCMClientDataSet.Create(nil);
  CdsLoop := TCMClientDataSet.Create(nil);
  CdsPlanPatro := TCMClientDataSet.Create(nil);
  CdsCalcContrib := TCMClientDataSet.create(nil);
  CdsSalPart := TCMClientDataSet.create(nil);


  CtrlRegra         := TCtrlRegra.Create;


  StrProcHistRubSal := TStoredProc.create(nil);
  StrProcHistRubSal.StoredProcName := 'SP_INSERT_HISTRUBSAL';
  StrProcHistRubSal.Params.Clear;
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pVALORPROVENTO', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pSEQRUBRICA', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftString, 'pREFERENCIA', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftString, 'pMESCOBRANCA', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftString, 'pMES', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pIDTITULAR', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pIDRUBRICA', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pIDPLANOPREV', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pIDPESSOA', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pIDPESSJUR', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pIDPATRO', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pIDMOTIVO', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pIDMODULO', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pFLGSRB', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pFLGIRRF', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pFLGCOMPOESALPART', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pFLGCOMPOESALBENEF', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pFLGCOMPOEREMTOTAL', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftString, 'pCODPROVDESC', ptInput);
  StrProcHistRubSal.Params.CreateParam(ftFloat, 'pFLGEQUIPARACAO', ptInput);  



  StrProcTmpDesc := TStoredProc.create(nil);
  StrProcTmpDesc.StoredProcName := 'SP_INSERT_TMPDESC';
  StrProcTmpDesc.Params.Clear;
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDLOTE', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDFUNDACAO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDPESSJUR', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDPLANOPREV', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDTITULAR', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDPESSOA', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDDESCONTO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDPROVENTO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftString, 'pCODPROVDESC', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftString, 'pMESREFERENCIA', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftString, 'pMESCOBRANCA', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftString, 'pFLGTIPODESC', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pVALOR', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pVALORRECEBIDO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftDate, 'pDATACOBRANCA', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftDate, 'pDATARECEBIMENTO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftString, 'pFLGATRASODEVOL', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftDate, 'pDATAREFERENCIA', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftString, 'pDESCRICAO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftString, 'pMATRICULA', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftString, 'pSITENVIO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftString, 'pNODOCUMENTO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftString, 'pCOMPLDOCUMENTO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDFAVORECIDO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDEMPCOBRANCA', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pIDMOTIVO', ptInput);
  StrProcTmpDesc.Params.CreateParam(ftFloat, 'pVALORBASE1', ptInput); // Renato Visoni SOL 111730	KINTANA 515538



  StrProcClasseRubricas := TStoredProc.create(nil);
  StrProcClasseRubricas.StoredProcName := 'SP_INSERT_CLASSERUBRICAS';
  StrProcClasseRubricas.Params.Clear;
  StrProcClasseRubricas.Params.CreateParam(ftFloat, 'pCODPATRO', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftFloat, 'pIDPESSOA', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftString, 'pMESREFERENCIA', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftFloat, 'pIDRUBRICA', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftString, 'pCODPROVDESC', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftFloat, 'pVALORRECEBIDO', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftString, 'pMESCOBRANCA', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftFloat, 'pSEQINTERFACE', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftFloat, 'pCODPLANO', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftFloat, 'pFLG13', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftFloat, 'pORDEMCALCULO', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftString, 'pFLGATRASODEVOL', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftFloat, 'pIDCONTRIBUICAO', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftDate, 'pDATAREFERENCIA', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftString, 'pCHAVE', ptInput);
  StrProcClasseRubricas.Params.CreateParam(ftString, 'pVALORCHAVE', ptInput);


  StrProcTabErrosCcp := TStoredProc.create(nil);
  StrProcTabErrosCcp.StoredProcName := 'SP_INSERT_TABERROSCCP';
  StrProcTabErrosCcp.Params.Clear;
  StrProcTabErrosCcp.Params.CreateParam(ftFloat, 'pIDCONTROLE', ptInput);
  StrProcTabErrosCcp.Params.CreateParam(ftFloat, 'pIDPESSJUR', ptInput);
  StrProcTabErrosCcp.Params.CreateParam(ftString, 'pCODPROVENTO', ptInput);
  StrProcTabErrosCcp.Params.CreateParam(ftFloat, 'pVALOR', ptInput);
  StrProcTabErrosCcp.Params.CreateParam(ftString, 'pNOMEPATROC', ptInput);
  StrProcTabErrosCcp.Params.CreateParam(ftString, 'pMATRICULA', ptInput);
  StrProcTabErrosCcp.Params.CreateParam(ftString, 'pDATAREF', ptInput);
  StrProcTabErrosCcp.Params.CreateParam(ftString, 'pMSGEXPLICATIVA', ptInput);
  StrProcTabErrosCcp.Params.CreateParam(ftString, 'pMESCOBRANCA', ptInput);
  StrProcTabErrosCcp.Params.CreateParam(ftFloat, 'pIDCONTRIBUICAO', ptInput);


  //
  DbTaberrosccp := TDbTaberrosccp.Create(Self);
  DbCtrlinterface := TDbCtrlinterface.create(self);
  DbParaminterf := TDbParaminterf.create(self);
  DbClasserubricas := TDbClasserubricas.create(self);
  DbRubricaxpess := TDbRubricaxpess.create(self);
  DbParamsal13 := TDbParamsal13.create(self);
  DbHistRubSal := TDbHistRubSal.create(self);
  DbTmpDesc := TDbTmpDesc.create(self);


end;














function TCtrlImportaFinanc.ImportaRubricas(    qryTxt                : TwwQuery;
                                                cdsDadosArquivo       : TCMClientDataSet;
                                            var F, bad                : TextFile;
                                                bMontaBad             : Boolean;
                                                bInsereClasseRubricas : Boolean;
                                                mmDivergencias        : TMemo;
                                                lbMensagens           : TMemo;
                                                memBuscaRubricasDuplo : TMemo;
                                                memBuscaRubricas      : TMemo;
                                                memErros              : TwwDBRichEdit;
                                                sIDPessjur            : String;
                                                sMesRefGr             : String;
                                                sMesRef13             : String;
                                                sMesCobGr             : String;
                                                sDataRef              : String;
                                                sDataCob              : String;
                                                sDigito               : String;
                                                sNomePatro            : String;
                                                sCodProvDescSalPart   : String;
                                                sCodProvDescSal13     : String;
                                                sCodProvDescRemTotal  : String;
                                                iIniDigito            : Integer;
                                                iIdLote               : Integer;
                                                iIdRubSalBenef        : Integer;
                                                iIdRubRemTotal        : Integer;
                                                iIdRubSalPart         : Integer;
                                                iIdRubSal13           : Integer;
                                                sRubricaInicio        : String
                                           ): Boolean;
var
  FCdsHistRubSal        : TCMClientDataSet;
  sSQL                  : String;
  sIDPessoaProcura      : String;
  sIDPlanoPrevProcura   : String;
  sSeqRubrica           : String;
  sProventoAnt          : String;
  sIDPessoaAnt          : String;
  sSeqRubricaAnt        : String;
  sProvento             : String;
  sProventoTela         : String;
  sUltValorChave        : String;
  sUltProvento          : String;
  sErro                 : String;
  sChave                : String;
  sFlgAtrasoDev         : String;
  sPrazo                : String;
  sFlgSalPart           : String;
  sFlgSalBenef          : String;
  sFlgIrrf              : String;
  sFlgRemTotal          : String;
  sOrdemCalculo         : String;
  sValorAtu             : String;
  sMesAux               : String;
  sMatriculaAtual       : String;
  sIDContratoEmptmo     : String;
  iRubrica              : Integer;
  iContribuicao         : Integer;
  iCont                 : Integer;
  iSeqTabela            : Integer;
  rValor                : Double;
  dValorSobra           : Double;
  bAbreBuscaRubrica     : Boolean;
  bFaz                  : Boolean;
  sMesRefGrEntrada      : String;
  sMesRefAnt            : String;
  bEncontrou            : Boolean;
  IDTmpDesc             : Integer;
begin
  Result            := False;

  sMatriculaAtual   := '';
  iContadorCommit   := 0;
  iSeqTabela        := 0;
  sProventoAnt      := '';
  sIDPessoaAnt      := '';
  sSeqRubricaAnt    := '';
  sMesRefAnt        := '';
  sMesRefGrEntrada  := sMesRefGr;

  try
    cdsClasseRubricas.CancelUpdates;
    cdsHistRubSal.CancelUpdates;
    cdsTabErrosCcp.CancelUpdates;
    cdsTmpdesc.CancelUpdates;
  except
  end;

  // -----------------------------------------------------------------------------------------------
  // prepara lista de total de salários
  SQLParam.SQL.Text   := ' SELECT 1 FROM PLANPREVPATRO WHERE IDPESSJUR = ' + sIDPessjur + ' ';
  cdsAux.Data         := SQLParam.Data;

  ListaTotSalarios    := TStringGrid.Create(nil);
  ListaTotSalarios13  := TStringGrid.Create(nil);

  if cdsaux.IsEmpty then
  begin
    ListaTotSalarios.RowCount   := 0;
    ListaTotSalarios13.RowCount := 0;
  end
  else
  begin
    ListaTotSalarios.RowCount   := cdsAux.RecordCount;
    ListaTotSalarios13.RowCount := cdsAux.RecordCount;
  end;

  ListaTotSalarios.ColCount     := 1; // valores
  ListaTotSalarios13.ColCount   := 1; // valores
  // fim prepara lista de salários
  // -----------------------------------------------------------------------------------------------


  // inicia consulta de rubricas
  SQLParam.SQL.Text := memBuscaRubricas.Text;
  SQLParam.Prepare;
  SQLParam.ParamByName('CODPROVDESC').AsString  := '000';
  SQLParam.ParamByName('CODPATRO').AsString     := sIDPessjur;
  SQLParam.ParamByName('IDPLANOPREV').AsInteger := 1;

  try
     cdsBuscaRubrica.Data := SQLParam.Data;
  except
  end;


  while not(qryTxt.EOF) do
  begin
    if (trim(cdsDadosArquivo.FieldByName('INIMESREF').AsString) <> '1000') then
    begin
      // mesmo o mês estando parametrizado, testa se a coluna está preenchida para a linha em questão
      if trim(qryTxt.FieldByName('MESREF').AsString) <> '' then
      begin
        sMesRefGr := ConvMes(trim(qryTxt.FieldByName('MESREF').AsString),
                             cdsDadosArquivo.FieldByName('FMTMESREF').AsString,
                             Copy(sDataRef, 7, 2)
                            );
      end
      else
      begin
        sMesRefGr := sMesRefGrEntrada;
      end;
    end;

    // lê sequêncial de rubrica do arquivo texto
    if (trim(cdsDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) = '1000') then
    begin
      sSeqRubrica := '01';
    end
    else
    begin
      sSeqRubrica:= IntToStr(qryTxt.FieldByName('SEQINTERFA').AsInteger);
    end;

    inc(iContadorCommit);

    sIDPessoaProcura    := '';
    sIDPlanoPrevProcura := '';
    sPrazo              := '';

    try
      sIDPessoaProcura    := IntToStr(qryTxt.FieldByName('IDPESSOA').AsInteger);
      sIDPlanoPrevProcura := IntToStr(qryTxt.FieldByName('IDPLANO').AsInteger);
    except
    end;

    // ---------------------------------------------------------------------------------------------
    //caso os identificadores de pessoa e plano já estejam no arquivo não procurar
    if (
       (Trim(cdsDadosArquivo.FieldByName('INIIDPESSOA').AsString) = '1000') or
       (Trim(cdsDadosArquivo.FieldByName('INIPLANO').AsString) = '1000' )
       )  and
       (
       ( sIDPessoaProcura = '' ) or ( sIDPlanoPrevProcura   = '')
       ) then
    begin
      sSQL:=
      'SELECT '                                     + #13 +
      '  ELP.IDPESSOA, '                            + #13 +
      '  NVL(PPP.IDPLANOPREV, 0) AS IDPLANOPREV '   + #13 +

      'FROM '                                       + #13 +
      '  PARTPREVPLAN PPP, '                        + #13 +
      '  ELEGPATRO    ELP  '                        + #13 +

      'WHERE '                                      + #13 +
      '      ELP.IDPESSJUR  = ' + sIDPessjur        + #13;

      // se matrícula vem exatamente no arquivo como está cadastrada no banco
      // ex: 0000341 --> 0000341
      if cdsDadosArquivo.FieldByName('FLGMATCOMPLETA').AsInteger = 1 then
      begin
        if iIniDigito > 0 then sSQL := sSQL +
      '  AND ELP.MATRICULA  LIKE ' + QuotedStr(qryTxt.FieldByName('VALORCHAVE').AsString + sDigito + '%') + #13
        else sSQL := sSQL +
      '  AND ELP.MATRICULA  = ' + QuotedStr(IntToStr(qryTxt.FieldByName('VALORCHAVE').AsInteger))         + #13;
      end
      else
      begin
        // quando a matrícula não vem no arquivo exatamente como cadastrado no banco
        // ex: 000341 --> 341 -  então deve ser transformada em numérico
        if iIniDigito > 0 then sSQL := sSQL +
      '  AND SUBSTR(RTRIM(LTRIM(ELP.MATRICULA)),1,'+IntToStr(length(IntToStr(qryTxt.FieldByName('VALORCHAVE').AsInteger)))+') = ' +
                                    ' '''+IntToStr(qryTxt.FieldByName('VALORCHAVE').AsInteger)+''' ' + #13
        else sSQL := sSQL +
      '  AND ELP.MATRICULA  = '''+IntToStr(qryTxt.FieldByName('VALORCHAVE').AsInteger)+''' ';
      end;

      sSQL := sSQL +
      '  AND ELP.IDPESSJUR   = PPP.IDPESSJUR(+) '                                   + #13 +
      '  AND ELP.IDPESSOA    = PPP.IDPESSOA(+) '                                    + #13 +
      '  AND TO_CHAR(PPP.INSCRICAODATA(+), ''YYYY/MM'') <= ' + QuotedStr(sMesRefGr) + #13 +

      'ORDER BY '                                                                   + #13 +
      '  PPP.INSCRICAODATA DESC';

      cdsBuscaPessoa.Data := GetDataPacket(sSQL);

      if cdsBuscaPessoa.IsEmpty then
      begin
        WriteLn(F,qryTxt.FieldByName('VALORCHAVE').AsString + 'Participante não encontrado no sistema.');

        mmDivergencias.Lines.Add(qryTxt.FieldByName('VALORCHAVE').AsString+ ' - Participante não encontrado.'+
                                    ' Rubrica '+sProvento+' Valor '+ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString))+'.');

        if qryTxt.FieldByName('VALORPROVE').AsString = '' then
          rValor := 0
        else
          rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));


        GravaErrosCCP(qryTxt,
                      cdsDadosArquivo,
                      bad,
                      bMontaBad,
                      2,
                      sIDPessjur,
                      'Participante não encontrado no sistema.',
                      qryTxt.FieldByName('VALORCHAVE').AsString,
                      sProvento,
                      sMesRefGr,
                      rValor,
                      '',
                      sMesCobGr,
                      sNomePatro
                     );

        qryTxt.Next;
        Continue;
      end;

      sIDPessoaProcura := cdsBuscaPessoa.FieldByName('idpessoa').AsString;
      sIDPlanoPrevProcura := cdsBuscaPessoa.FieldByName('idplanoprev').AsString;
    end;  // if ((Trim(...
    // ---------------------------------------------------------------------------------------------


    // testa se o código da rubrica está sendo selecionada no arquivo
    if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
    begin
      sProvento := qryTxt.FieldByName('PROVENTO').AsString;
    end
    else
    begin
      // o código da rubrica deve vir no arquivo assim como está no banco.
      // se n banco esla estiver, por exemplo, como 7755 não pode
      // vir 0007755 e sim 7755 no arquivo de recebimento
      sProvento := trim(qryTxt.FieldByName('PROVENTO').AsString);
    end;


    if sProvento = '' then
    begin
      mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' - Código da rubrica em branco.');
      qryTxt.Next;
      Continue;
    end;

    if (sRubricaInicio <> '') and (trim(sProvento) < sRubricaInicio ) then
    begin
      qryTxt.Next;
      Continue;
    end;

    // vefifica seqrubrica repetido para um mesmo participante/rubrica
    if (sProventoAnt <> sProvento) or (sIDPessoaAnt <> sIDPessoaProcura) then
    begin
      sProventoAnt    := sProvento;
      sIDPessoaAnt    := sIDPessoaProcura;
      sSeqRubricaAnt  := sSeqRubrica;
      sMesRefAnt      := sMesRefGr;
    end  //crítica de chave duplicada
    else
    if (sProventoAnt = sProvento) and (sIDPessoaAnt = sIDPessoaProcura) and (sSeqRubricaAnt <> sSeqRubrica )then
    begin
      sSeqRubricaAnt  := sSeqRubrica;
      sMesRefAnt      := sMesRefGr;
    end
    else
    if (sProventoAnt = sProvento) and (sIDPessoaAnt = sIDPessoaProcura) and
       (sSeqRubricaAnt = sSeqRubrica )and (sMesRefAnt = sMesRefGr) then
    begin
      if qryTxt.FieldByName('VALORPROVE').AsString = '' then
        rValor := 0
      else
        rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString)));

      GravaErrosCCP(qryTxt,
                    cdsDadosArquivo,
                    bad,
                    bMontaBad,
                    8,
                    sIDPessjur,
                    'Rubrica não gravada. Possível duplicação.',
                    qryTxt.FieldByName('VALORCHAVE').AsString,
                    sProvento,
                    sMesRefGr,
                    rValor,
                    '',
                    sMesCobGr,
                    sNomePatro
                   );

      sSeqRubricaAnt  := sSeqRubrica;
      sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString ;
      sUltProvento    := sProvento;
      qryTxt.Next;

      sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);

      Continue;
    end;  // if (sProventoAnt...

    // ---------------------------------------------------------------------------------------------
    try
      if not(dtmbasedados.dbBaseDados.InTransaction) then StartTransacao;

      if sProvento <> sProventoTela then
      begin
        // testa por grupo de rubricas quais,
        // já foram inseridas, dados um recebimento anterior
        // caso sim ,  verificar cada um
        lbMensagens.Lines.Add(TimeToStr(Time)+' - Processando a Rubrica '+sProvento);
        sProventoTela := sProvento;
        Application.ProcessMessages;
      end;  // if sProvento <> sProventoTela


      bAbreBuscaRubrica := True;


      try
        if trim(cdsBuscaRubrica.FieldByName('CODPROVDESC').AsString) = trim(sProvento) then
        begin
          bAbreBuscaRubrica := False;
        end;
      except
        bAbreBuscaRubrica := True;
      end;


      if bAbreBuscaRubrica then
      begin
        try
          SQLParam.SQL.Text := memBuscaRubricas.Text;
          SQLParam.Prepare;
          SQLParam.ParamByName('CODPROVDESC').AsString  := trim(sProvento);
          SQLParam.ParamByName('CODPATRO').AsString     := sIDPessjur;
          SQLParam.ParamByName('IDPLANOPREV').AsInteger := StrToInt(sIDPlanoPrevProcura);

          cdsBuscaRubrica.Data := SQLParam.Data;

        except
          WriteLn(F, 'Erro ao acessar dados da rubrica ' + trim(sProvento) + '!');
          mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' - Erro ao acessar dados da rubrica ' + trim(sProvento) + '.');
          qryTxt.Next;
          sProvento := trim(qryTxt.FieldByName('PROVENTO').AsString);
          Continue;
        end;
      end;  // if bAbreBuscaRubrica


      if not(cdsBuscaRubrica.IsEmpty) then
      begin
        // se trouxe apenas um registro quer dizer que o código é próprio de algum desconto
        if cdsBuscaRubrica.Recordcount = 1 then
        begin
          iRubrica      := cdsBuscaRubrica.FieldByName('IDRUBRICA').AsInteger;
          sFlgAtrasoDev := 'N';
          sPrazo        := cdsBuscaRubrica.FieldByName('PRAZO').AsString;

          // ---------------------------------------------------------------------------------------
          if cdsBuscaRubrica.FieldByName('IDCONTRIBUICAO').AsInteger > 0 then
          begin
            sChave          := 'P';
            iContribuicao   := cdsBuscaRubrica.FieldByName('IDCONTRIBUICAO').AsInteger;
          end
          else
          if cdsBuscaRubrica.FieldByName('IDCONTRIBATRASO').AsInteger > 0 then
          begin
            iContribuicao   := cdsBuscaRubrica.FieldByName('IDCONTRIBATRASO').AsInteger;
            sFlgAtrasoDev   :='A';
            sChave          := 'P';
          end
          else
          if cdsBuscaRubrica.FieldByName('IDCONTRIBDEVOL').AsInteger > 0 then
          begin
            iContribuicao   := cdsBuscaRubrica.FieldByName('IDCONTRIBDEVOL').AsInteger;
            sFlgAtrasoDev   :='D';
            sChave          := 'P';
          end
          else
          begin
            if cdsBuscaRubrica.FieldByName('IDCONTASS').AsInteger > 0 then
            begin
              sChave        := 'A';
              iContribuicao := cdsBuscaRubrica.FieldByName('IDCONTASS').AsInteger;
            end
            else
            begin
              sChave        := cdsBuscaRubrica.FieldByName('FLGTPRUBRICA').AsString;
              iContribuicao := 0;
            end;
          end;
          // ---------------------------------------------------------------------------------------


          sFlgSalPart   := '0';
          if not(cdsBuscaRubrica.FieldByName('FLGCOMPOESALPART').isNull) then   sFlgSalPart   := trim(cdsBuscaRubrica.FieldByName('FLGCOMPOESALPART').AsString);

          sFlgSalBenef  := '0';
          if not(cdsBuscaRubrica.FieldByName('FLGCOMPOESALBENEF').isNull) then  sFlgSalBenef  := trim(cdsBuscaRubrica.FieldByName('FLGCOMPOESALBENEF').AsString);

          sFlgIrrf      := '0';
          if not(cdsBuscaRubrica.FieldByName('FLGIRRF').isNull) then            sFlgIrrf      := trim(cdsBuscaRubrica.FieldByName('FLGIRRF').AsString);

          sFlgRemTotal  := '0';
          if not(cdsBuscaRubrica.FieldByName('FLGCOMPOEREMTOTAL').isNull) then  sFlgRemTotal  := trim(cdsBuscaRubrica.FieldByName('FLGCOMPOEREMTOTAL').AsString);

          sOrdemCalculo := '0';
          if not(cdsBuscaRubrica.FieldByName('ORDEMCALCULO').isNull) then       sOrdemCalculo := trim(cdsBuscaRubrica.FieldByName('ORDEMCALCULO').AsString);


        end
        else  // if cdsBuscaRubrica.Recordcount = 1
        begin
          // se voltou mais de um código então deve-se verificar possíveis descontos esperados
          // e então desmembrar o valor entre eles
          // ex: rubricas de atraso, que podem ser de contribuições diferente para situações diferentes

          SQLParam.SQL.Text :=
          'SELECT '                                                           + #13 +
          '  T.FLGATRASODEVOL, T.MESREFERENCIA, '                             + #13 +
          '  T.IDDESCONTO AS IDCONTRIBUICAO, '                                + #13 +
          '  T.IDPROVENTO, T.VALOR, P.FLGTPRUBRICA , P.PRAZO '                + #13 +

          'FROM '                                                             + #13 +
          ' TMPDESC  T, '                                                     + #13 +
          ' PROVDESC P  '                                                     + #13 +

          'WHERE '                                                            + #13 +
          '      T.IDPESSOA                   = ' + trim(sIDPessoaProcura)    + #13 +
          '  AND T.IDPESSJUR                  = ' + sIDPessjur                + #13 +
          '  AND T.MESCOBRANCA                = ' + '''' + sMesCobGr + ''''   + #13 +
          '  AND LTRIM(RTRIM(T.CODPROVDESC))  = ' + QuotedStr(sProvento)      + #13 +
          '  AND P.IDPROVENTO                 = T.IDPROVENTO '                + #13 +
          '  AND T.FLGDESCFOLHA               = ''P'' '                       + #13 +

          'ORDER BY '                                                         + #13 +
          '  T.MESREFERENCIA, P.NUMPRIORIDADE ';

          cdsLoop.Data := SQLParam.Data;


          // fazer controle dos pagamentos a maior
          if not(cdsLoop.IsEmpty) then
          begin
            sChave := cdsLoop.FieldByName('FLGTPRUBRICA').AsString;
            sPrazo := cdsLoop.FieldByName('PRAZO').AsString;

            // se insere todas as rubricas na histrubsal
            if (Pos('G',sChave) > 0) or (cdsDadosArquivo.FieldByName('FLGGRAVAHIST').AsInteger = 1) then
            begin
              if (cdsBuscaRubrica.FieldByName('CONTRIBSOBRE13').AsInteger = 0) then
              begin
                sMesAux := sMesRefGR;
              end
              else
              begin
                sMesAux := sMesRef13;
              end;

              if not(GravaHistRubSal(qryTxt,
                                     cdsDadosArquivo,
                                     bad,
                                     bMontaBad,
                                     mmDivergencias,
                                     sIDPessjur,
                                     sMesAux,
                                     sMesCobGr,
                                     sIDPessoaProcura,
                                     sSeqRubrica,
                                     sIDPlanoPrevProcura,
                                     trim(sProvento),
                                     sFlgSalPart,
                                     sFlgSalBenef,
                                     sFlgRemTotal,
                                     sFlgIrrf,
                                     sNomePatro,
                                     StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString))),
                                     cdsLoop.FieldByName('IDPROVENTO').AsInteger,
                                     bVerHistRubSal,
                                     sPrazo
                                    )) then
              begin
                if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                begin
                  rValor := 0;
                end
                else
                begin
                  rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString)));
                end;

                GravaErrosCCP(qryTxt,
                              cdsDadosArquivo,
                              bad,
                              bMontaBad,
                              8,
                              sIDPessjur,
                              'Rubrica não gravada. Possível duplicação.',
                              qryTxt.FieldByName('VALORCHAVE').AsString,
                              sProvento,
                              sMesRefGr,
                              rValor,
                              '',
                              sMesCobGr,
                              sNomePatro
                             );

                sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString ;
                sUltProvento    := sProvento;
                sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
              end;  // if not(GravaHistRubSal(...
            end;  // if (Pos('G',sChave) > 0) or (cdsDadosArquivo.FieldByName('FLGGRAVAHIST').AsInteger = 1)


            iCont       := cdsLoop.recordcount;
            dValorSobra := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString)));

            while not(cdsLoop.EOF) and (dValorSobra > 0) do
            begin
              dec(iCont);

              // -----------------------------------------------------------------------------------
              // se é o último registro e o pagamento é maior
              // do que o esperado, então atualizar com o recebido
              if (dValorSobra > cdsLoop.FieldByName('VALOR').AsFloat) and (iCont = 0) then
              begin
                sValorAtu     := OraNumero(FloatToStr(dValorSobra));
                dValorSobra   := 0;
              end
              else
              begin
                if (cdsLoop.FieldByName('VALOR').AsFloat > dValorSobra)  then
                begin
                  // se o esparado é maior que a sobra , então receber a sobra e parar
                  sValorAtu   := OraNumero(FloatToStr(dValorSobra));
                  dValorSobra := 0;
                end
                else
                begin
                  // se ainda há sobra, atualizar com o esperado e cotinuar
                  sValorAtu   := OraNumero(cdsLoop.FieldByName('VALOR').AsString);
                  dValorSobra := dValorSobra -  cdsLoop.FieldByName('VALOR').AsFloat;
                end;
              end;
              // -----------------------------------------------------------------------------------

              if bInsereClasseRubricas then
              begin
                inc(iSeqTabela);

                if not(GravaClasseRubricas(sIDPessjur,
                                           cdsLoop.FieldByName('MESREFERENCIA').AsString,
                                           sMesCobGr, sIDPessoaProcura,
                                           sChave,
                                           trim(qryTxt.FieldByName('VALORCHAVE').AsString),
                                           sIDPlanoPrevProcura,
                                           cdsLoop.FieldByName('IDCONTRIBUICAO').AsString,
                                           sProvento,
                                           '0' {flg13}, '0'{ordemcalculo},
                                           cdsLoop.FieldByName('FLGATRASODEVOL').AsString,
                                           sDataRef ,
                                           StrToFloat(ClienteNumero(sValorAtu)),
                                            iSeqTabela,
                                           cdsLoop.FieldByName('IDPROVENTO').AsInteger
                                          )) then
                begin
                  if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                  begin
                    rValor := 0;
                  end
                  else
                  begin
                    rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));
                  end;

                  GravaErrosCCP(qryTxt,
                                cdsDadosArquivo,
                                bad,
                                bMontaBad,
                                7,
                                sIDPessjur,
                                'Erro na gravação da Contribuição.',
                                qryTxt.FieldByName('VALORCHAVE').AsString,
                                sProvento,
                                sMesRefGr,
                                rValor,
                                cdsLoop.FieldByName('IDCONTRIBUICAO').AsString,
                                sMesCobGr,
                                sNomePatro
                               );

                  sUltValorChave := qryTxt.FieldByName('ValorChave').AsString ;
                  sUltProvento := sProvento;
                  qryTxt.Next;

                  sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

                  Continue;
                end;  // if not(GravaClasseRubricas(

              end
              else //if bInsereClasseRubricas
              begin
                bErroUpdateTmpdesc := False;

                if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
                begin
                  sSQL :=
                  'UPDATE '     + #13 +
                  '  TMPDESC '  + #13 +
                  'SET '        + #13 +

                  '  VALORRECEBIDO      = NVL(VALORRECEBIDO, 0) + ' + ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) + ', '                       + #13 +
                  '  DATARECEBIMENTO    = TO_DATE(''' + sDataCob + ''', ''DD/MM/YYYY''), '                                                                              + #13 +
                  '  SITENVIO           = DECODE(VALOR, VALORRECEBIDO + ' + ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) + ', ''2'', ''1''), '  + #13 +
                  '  FLGDESCFOLHA       = ''P'', '                                                                                                                      + #13 +
                  '  VALOR              = DECODE(IDMODULO, 15, VALOR, '                                                                                                 +
                                                              'VALOR + ' + ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) + ') '                  + #13 +

                  'WHERE '                                                                                  + #13 +
                  '      IDPESSOA       = ' + sIDPessoaProcura                                              + #13 +
                  '  AND IDPESSJUR      = ' + sIDPessjur                                                    + #13 +
                  '  AND MESREFERENCIA  = ' + '''' + cdsLoop.FieldByName('MESREFERENCIA').AsString + ''''   + #13 +
                  '  AND MESCOBRANCA    = ' + '''' + sMesCobGr + ''''                                       + #13 +
                  '  AND IDDESCONTO     = ' + '''' + cdsLoop.FieldByName('IDCONTRIBUICAO').AsString + ''''  + #13 +
                  '  AND IDPROVENTO     = ' + cdsLoop.FieldByName('IDPROVENTO').AsString;

                  if not(ExecSQL(sSQL)) then bErroUpdateTmpdesc := True;
                end
                else  // if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0'
                begin
                  sSQL :=
                  'UPDATE '     + #13 +
                  '  TMPDESC '  + #13 +
                  'SET '        + #13 +

                  '  VALORRECEBIDO      = ' + ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString) + ', '                                + #13 +
                  '  DATARECEBIMENTO    = TO_DATE(''' + sDataCob + ''', ''DD/MM/YYYY''), '                                                                + #13 +
                  '  SITENVIO           = DECODE(VALOR, ' + ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString) + ', ''2'', ''1''), '   + #13 +
                  '  FLGDESCFOLHA       = ''P'', '                                                                                                        + #13 +
                  '  VALOR              = DECODE(IDMODULO, 15, VALOR, '                                                                                   +
                                                              'VALOR + ' + ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) + ') '    + #13 +

                  'WHERE '                                                                                  + #13 +
                  '      IDPESSOA       = ' + sIDPessoaProcura                                              + #13 +
                  '  AND IDPESSJUR      = ' + sIDPessjur                                                    + #13 +
                  '  AND MESREFERENCIA  = ' + '''' + cdsLoop.FieldByName('MESREFERENCIA').AsString + ''''   + #13 +
                  '  AND MESCOBRANCA    = ' + '''' + sMesCobGr + ''''                                       + #13 +
                  '  AND IDDESCONTO     = ' + '''' + cdsLoop.FieldByName('IDCONTRIBUICAO').AsString + ''''  + #13 +
                  '  AND IDPROVENTO     = ' + cdsLoop.FieldByName('IDPROVENTO').AsString;

                  if not ExecSQL(sSQL) then bErroUpdateTmpdesc := True;
                end;  // if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0'

                if bErroUpdateTmpdesc then
                begin
                  if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                    rValor := 0
                  else
                    rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString)));

                  GravaErrosCCP(qryTxt,
                                cdsDadosArquivo,
                                bad,
                                bMontaBad,
                                7,
                                sIDPessjur,
                                'Erro na gravação da Contribuição.',
                                qryTxt.FieldByName('VALORCHAVE').AsString,
                                sProvento,
                                sMesRefGr,
                                rValor,
                                cdsLoop.FieldByName('IDCONTRIBUICAO').AsString,
                                sMesCobGr,
                                sNomePatro
                               );

                  sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString ;
                  sUltProvento    := sProvento;
                  qryTxt.Next;
                  sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
                  Continue;
                end;  // if bErroUpdateTmpdesc
              end;  // if bInsereClasseRubricas

              cdsLoop.Next;
            end;  // while not(cdsLoop.EOF) and (dValorSobra > 0)

            qryTxt.Next;
            Continue;

          end
          else  // if not(cdsLoop.IsEmpty)
          begin
            // se não encontrou algo esperado na tmpdesc
            // então inserir com código da folha da patrocinadora
            // que tem 90% de chances de estar correta
            // caso não estaja cairá nas divergências ao final
            // do processamento

            iRubrica      := cdsBuscaRubrica.FieldByName('IDRUBRICA').AsInteger;
            sFlgAtrasoDev := 'N';
            sPrazo        := cdsBuscaRubrica.FieldByName('PRAZO').AsString;

            if cdsBuscaRubrica.FieldByName('IDCONTRIBUICAO').AsInteger > 0 then
            begin
              sChave          := 'P';
              iContribuicao   := cdsBuscaRubrica.FieldByName('IDCONTRIBUICAO').AsInteger;
            end
            else if cdsBuscaRubrica.FieldByName('IDCONTRIBATRASO').AsInteger > 0 then
            begin
              iContribuicao   := cdsBuscaRubrica.FieldByName('IDCONTRIBATRASO').AsInteger;
              sFlgAtrasoDev   := 'A';
              sChave          := 'P';
            end
            else if cdsBuscaRubrica.FieldByName('IDCONTRIBDEVOL').AsInteger > 0 then
            begin
              iContribuicao   := cdsBuscaRubrica.FieldByName('IDCONTRIBDEVOL').AsInteger;
              sFlgAtrasoDev   := 'D';
              sChave          := 'P';
            end
            else
            begin
              if cdsBuscaRubrica.FieldByName('IDCONTASS').AsInteger > 0 then
              begin
                sChave        := 'A';
                iContribuicao := cdsBuscaRubrica.FieldByName('IDCONTASS').AsInteger;
              end
              else
              begin
                sChave        := cdsBuscaRubrica.FieldByName('FLGTPRUBRICA').AsString;
                iContribuicao := 0;
              end;
            end;

            sFlgSalPart   := '0';
            if not(cdsBuscaRubrica.FieldByName('FLGCOMPOESALPART').isNull) then   sFlgSalPart   := trim(cdsBuscaRubrica.FieldByName('FLGCOMPOESALPART').AsString);

            sFlgSalBenef  := '0';
            if not cdsBuscaRubrica.FieldByName('FLGCOMPOESALBENEF').isNull then   sFlgSalBenef  := trim(cdsBuscaRubrica.FieldByName('FLGCOMPOESALBENEF').AsString);

            sFlgIrrf      := '0';
            if not cdsBuscaRubrica.FieldByName('FLGIRRF').isNull then             sFlgIrrf      := trim(cdsBuscaRubrica.FieldByName('FLGIRRF').AsString);

            sFlgRemTotal  := '0';
            if not cdsBuscaRubrica.FieldByName('FLGCOMPOEREMTOTAL').isNull then   sFlgRemTotal  := trim(cdsBuscaRubrica.FieldByName('FLGCOMPOEREMTOTAL').AsString);

            sOrdemCalculo := '0';
            if not cdsBuscaRubrica.FieldByName('ORDEMCALCULO').isNull then        sOrdemCalculo := trim(cdsBuscaRubrica.FieldByName('ORDEMCALCULO').AsString);


            // se a rubrica não foi identificada
            // como salário e também não foi identificada
            // como contribuição
            if not (
                   (trim(sCodProvDescSalPart) = sProvento ) or (trim(sCodProvDescSal13) = sProvento ) or
                   (trim(sCodProvDescRemTotal) = sProvento ) or (sFlgSalPart = '1') or
                   (sFlgSalBenef = '1') or (sFlgRemTotal = '1') or (iContribuicao > 0)
                   ) then
            begin
              if qryTxt.FieldByName('VALORPROVE').AsString = '' then
              begin
                rValor := 0;
              end
              else
              begin
                rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));
              end;

              GravaErrosCCP(qryTxt,
                            cdsDadosArquivo,
                            bad,
                            bMontaBad,
                            12,
                            sIDPessjur,
                            'Rubrica não identificada.',
                            qryTxt.FieldByName('VALORCHAVE').AsString,
                            sProvento,
                            sMesRefGr,
                            rValor,
                            '',
                            sMesCobGr,
                            sNomePatro
                           );

              mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString+ ' - Rubrica ' + sProvento + ' não identificada no sistema.');
              qryTxt.Next;
              Continue;
            end;  // if not (...

          end;  // if not(cdsLoop.IsEmpty)
        end;  // if cdsBuscaRubrica.Recordcount = 1
      end
      else  // if not(cdsBuscaRubrica.IsEmpty)
      begin
        if (ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) <> '0.00') and
           (cdsDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'N') and
           (
           (trim(sCodProvDescSalPart) = sProvento ) or
           (trim(sCodProvDescRemTotal) = sProvento ) or
           (trim(sCodProvDescSal13) = sProvento )
           ) then
        begin
          // ---------------------------------------------------------------------------------------
          // tratamento mês 13
          if sCodProvDescSal13 = sProvento then
          begin
            sMesAux := sMesRef13;
          end
          else
          begin
            sMesAux := sMesRefGr;
          end;

          if sCodProvDescSal13 = sProvento then
          begin
            iRubrica := iIdRubSal13;
          end
          else
          if trim(sCodProvDescRemTotal) = sProvento  then
          begin
            iRubrica := iIdRubRemTotal;
          end
          else
          begin
            iRubrica := iIdRubSalPart;
          end;
          // fim tratamento mês 13
          // ---------------------------------------------------------------------------------------

          if not(GravaHistRubSal(qryTxt,
                                 cdsDadosArquivo,
                                 bad,
                                 bMontaBad,
                                 mmDivergencias,
                                 sIDPessjur,
                                 sMesAux,
                                 sMesCobGr,
                                 sIDPessoaProcura,
                                 sSeqRubrica,
                                 sIDPlanoPrevProcura,
                                 trim(sProvento),
                                 sFlgSalPart,
                                 sFlgSalBenef,
                                 sFlgRemTotal,
                                 sFlgIrrf,
                                 sNomePatro,
                                 StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString))),
                                 iRubrica,
                                 bVerHistRubSal,
                                 sPrazo
                                )) then
          begin
            if qryTxt.FieldByName('VALORPROVE').AsString = '' then
            begin
              rValor := 0;
            end
            else
            begin
              rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));
            end;

            sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString ;
            sUltProvento    := sProvento;
            sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
          end;

          // tratamento de 13
          if sCodProvDescRemTotal = sProvento then
          begin
            sSQL :=
            'UPDATE ELEGPATRO '                                                                                           + #13 +
            'SET    SALTOTAL  = ' + OraNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)) + ' ' + #13 +
            'WHERE  IDPESSJUR = ' + sIDPessjur                                                                            + #13 +
            'AND    IDPESSOA  = ' + sIDPessoaProcura;

            if not(ExecSQL(sSQL)) then
            begin
              WriteLn(F,'Não atualizou o Salário de remuneração total.');
              mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTxt.FieldByName('VALORCHAVE').AsString+ ' - Não gravou o Salário Participação 13 no Histórico...');

              if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                rValor := 0
              else
                rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

              GravaErrosCCP(qryTxt,
                            cdsDadosArquivo,
                            bad,
                            bMontaBad,
                            5,
                            sIDPessjur,
                            'Erro ao atualizar salário de remuneração total.',
                            qryTxt.FieldByName('VALORCHAVE').AsString,
                            sProvento,
                            sMesRefGr,
                            rValor,
                            '',
                            sMesCobGr,
                            sNomePatro
                           );
            end;

            AlimentaListaTotSalarios(sIDPlanoPrevProcura,StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString))), True);
          end
          else  // if sCodProvDescRemTotal = sProvento

          if sCodProvDescSal13 = sProvento then
          begin
            sSQL :=
            'UPDATE PARTPREVPLAN PPP '                                                                                            + #13 +
            'SET    PPP.SALPARTIC13  = ' + OraNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString)) + ' ' + #13 +
            'WHERE  PPP.IDPESSJUR    = ' + sIDPessjur                                                                             + #13 +
            '  AND  PPP.IDPLANOPREV  = ' + sIDPlanoPrevProcura                                                                    + #13 +
            '  AND  PPP.IDPESSOA     = ' + sIDPessoaProcura;

            if not(ExecSQL(sSQL)) then
            begin
              WriteLn(F, 'Não atualizou o Salário Participação 13 do Arquivo Texto');
              mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' - Não gravou o Salário Participação 13 no Histórico...');

              if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                rValor := 0
              else
                rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

              GravaErrosCCP(qryTxt,
                            cdsDadosArquivo,
                            bad,
                            bMontaBad,
                            5,
                            sIDPessjur,
                            'Erro ao atualizar salário décimo terceiro.',
                            qryTxt.FieldByName('VALORCHAVE').AsString,
                            sProvento,
                            sMesRefGr,
                            rValor,
                            '',
                            sMesCobGr,
                            sNomePatro
                           );
            end;  // if not(ExecSQL(sSQL))

            AlimentaListaTotSalarios(sIDPlanoPrevProcura,StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString))), True);
          end
          else  // if sCodProvDescSal13 = sProvento
          begin
            sSQL :=
            'UPDATE PARTPREVPLAN PPP '                                                                                                + #13 +
            'SET    PPP.SALPARTICIPACAO = ' + OraNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString)) + ' '  + #13 +
            'WHERE  PPP.IDPESSJUR       = ' + sIDPessjur                                                                              + #13 +
            '  AND  PPP.IDPLANOPREV     = ' + sIDPlanoPrevProcura                                                                     + #13 +
            '  AND  PPP.IDPESSOA        = ' + sIDPessoaProcura;

            if not(ExecSQL(sSQL)) then
            begin
              WriteLn(F, 'Não atualizou o Salário Participação do Arquivo Texto');
              mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' - Não gravou o Salário Participação no Histórico...');

              if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                rValor := 0
              else
                rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

              GravaErrosCCP(qryTxt,
                            cdsDadosArquivo,
                            bad,
                            bMontaBad,
                            4,
                            sIDPessjur,
                            'Erro ao atualizar salário de participação.',
                            qryTxt.FieldByName('VALORCHAVE').AsString,
                            sProvento,
                            sMesRefGr,
                            rValor,
                            '',
                            sMesCobGr,
                            sNomePatro
                           );

            end;  // if not(ExecSQL(sSQL))

            AlimentaListaTotSalarios(sIDPlanoPrevProcura,StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString))), False);
          end;  // if sCodProvDescSal13 = sProvento

          qryTxt.Next;
          Continue;
        end;  // if (ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) <> '0.00')...

        // verifica se é uma rubrica de empréstimo
        SQLParam.SQL.Text :=
        'SELECT '                                               + #13 +
        '  P.PRAZO, P.IDPROVENTO '                              + #13 +
        'FROM '                                                 + #13 +
        '  PROVDESC     P, '                                    + #13 +
        '  RUBRICAXPESS R  '                                    + #13 +
        'WHERE '                                                + #13 +
        '      R.IDPESSOA     = ' + sIDPessjur            + ' ' + #13 +
        '  AND R.CODPROVDESC  = ' + QuotedStr(sProvento)  + ' ' + #13 +
        '  AND P.IDPROVENTO   = R.IDRUBRICA '                   + #13 +
        '  AND P.FLGTPRUBRICA LIKE ''%E%'' ';

        cdsAux.Data := SQLParam.Data;

        if cdsaux.IsEmpty then
        begin
          if qryTxt.FieldByName('VALORPROVE').AsString = '' then
            rValor := 0
          else
            rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

          GravaErrosCCP(qryTxt,
                        cdsDadosArquivo,
                        bad,
                        bMontaBad,
                        12,
                        sIDPessjur,
                        'Rubrica não identificada.',
                        qryTxt.FieldByName('VALORCHAVE').AsString,
                        sProvento,
                        sMesRefGr,
                        rValor,
                        '',
                        sMesCobGr,
                        sNomePatro
                       );

          mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' - Rubrica ' + sProvento + ' não identificada no sistema.');
          qryTxt.Next;
          Continue;
        end;  // if cdsaux.IsEmpty

        sChave          := 'E';
        iContribuicao   := 0;
        sFlgSalPart     := '0';
        sFlgSalBenef    := '0';
        sFlgIrrf        := '0';
        sFlgRemTotal    := '0';
        sOrdemCalculo   := '0';
        sFlgAtrasoDev   := 'N';
        iRubrica        := cdsaux.FieldByName('IDPROVENTO').AsInteger;
        sPrazo          := cdsaux.FieldByName('PRAZO').AsString;
      end;  // if not(cdsBuscaRubrica.IsEmpty)


      // -------------------------------------------------------------------------------------------

      // tratamento para salário base que vem em coluna separada e não em uma rubrica como vem
      // vários registros para cada participante, é feita uma crítica para verificar a já existência
      // no mês informado
      if (cdsDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'I') and
         (cdsDadosArquivo.FieldByName('INIVALORPART').AsString <> '1000') then
      begin
        // no caso de rubricas de salário em colunas deve-se procurar se já existe a cada registro
        // pois a qryTxt não está em ordem de matrícula e se por acaso o apply fizer em apenas parte
        // das rubricas de um participante e faltarem outras para inserir acusará erro de PK
        SQLParam.SQL.Text :=
        'SELECT 1 '                                         + #13 +
        'FROM '                                             + #13 +
        '  HISTRUBSAL '                                     + #13 +
        'WHERE '                                            + #13 +
        '      IDPESSJUR    = ' + sIDPessjur                + #13 +
        '  AND MES          = ''' + sMesRefGr + ''''        + #13 +
        '  AND MESCOBRANCA  = ''' + sMesCobGr + ''''        + #13 +
        '  AND IDPESSOA     = ' + sIDPessoaProcura          + #13 +
        '  AND IDPLANOPREV  = ' + sIDPlanoPrevProcura       + #13 +
        '  AND IDRUBRICA    = ' + IntToStr(iIdRubSalPart)   + '   ';

        cdsAux.Data := SQLParam.Data;

        if cdsAux.IsEmpty then
        begin
          if sMatriculaAtual <> qryTxt.FieldByName('VALORCHAVE').AsString then
          begin
            if StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPART').AsString))) > 0 then
            begin
              if not(GravaHistRubSal(qryTxt,
                                     cdsDadosArquivo,
                                     bad,
                                     bMontaBad,
                                     mmDivergencias,
                                     sIDPessjur,
                                     sMesRefGr,
                                     sMesCobGr,
                                     sIDPessoaProcura,
                                     sSeqRubrica,
                                     sIDPlanoPrevProcura,
                                     trim(sCodProvDescSalPart),
                                     '1', '0', '0', '0' ,
                                     sNomePatro,
                                     StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString))),
                                     iIdRubSalPart,
                                     bVerHistRubSal,
                                     sPrazo
                                    )) then
              begin
                if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                  rValor := 0
                else
                  rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString)));

                GravaErrosCCP(qryTxt,
                              cdsDadosArquivo,
                              bad,
                              bMontaBad,
                              8,
                              sIDPessjur,
                              'Rubrica não gravada. Possível duplicação.',
                              qryTxt.FieldByName('VALORCHAVE').AsString,
                              sProvento,
                              sMesRefGr,
                              rValor,
                              '',
                              sMesCobGr,
                              sNomePatro
                             );

                sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString ;
                sUltProvento    := sProvento;
                sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
              end;  // if not(GravaHistRubSal(...

              // tratamento de 13
              if copy(sMesRefGr, 6, 2) = '13' then
              begin
                sSQL :=
                'UPDATE PARTPREVPLAN PPP '                                                                                          + #13 +
                'SET    PPP.SALPARTIC13 = ' + OraNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPART').AsString)) + ' ' + #13 +
                'WHERE  PPP.IDPESSJUR   = ' + sIDPessjur                                                                            + #13 +
                '  AND  PPP.IDPLANOPREV = ' + sIDPlanoPrevProcura                                                                   + #13 +
                '  AND  PPP.IDPESSOA    = ' + sIDPessoaProcura;

                if not(ExecSQL(sSQL)) then
                begin
                  WriteLn(F, 'Não atualizou o Salário Participação 13 do Arquivo Texto');
                  mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' - Não gravou o Salário Participação 13 no Histórico...');

                  if qryTxt.FieldByName('VALORPART').AsString = '' then
                    rValor := 0
                  else
                    rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPART').AsString)));

                  GravaErrosCCP(qryTxt,
                                cdsDadosArquivo,
                                bad,
                                bMontaBad,
                                5,
                                sIDPessjur,
                                'Erro ao atualizar salário décimo terceiro.',
                                qryTxt.FieldByName('VALORCHAVE').AsString,
                                sProvento,
                                sMesRefGr,
                                rValor,
                                '',
                                sMesCobGr,
                                sNomePatro
                               );
                end;  // if not(ExecSQL(sSQL))

                AlimentaListaTotSalarios(sIDPlanoPrevProcura,StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPART').AsString))), True);
              end
              else  // if copy(sMesRefGr, 6, 2) = '13'
              begin
                sSQL :=
                'UPDATE PARTPREVPLAN PPP '                                                                                              + #13 +
                'SET    PPP.SALPARTICIPACAO = ' + OraNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPART').AsString)) + ' ' + #13 +
                'WHERE  PPP.IDPESSJUR       = ' + sIDPessjur                                                                            + #13 +
                '  AND  PPP.IDPLANOPREV     = ' + sIDPlanoPrevProcura                                                                   + #13 +
                '  AND  PPP.IDPESSOA        = ' + sIDPessoaProcura;

                if not ExecSQL(sSQL) then
                begin
                  WriteLn(F, 'Não atualizou o Salário Participação do Arquivo Texto');
                  mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' - Não gravou o Salário Participação no Histórico...');

                  if qryTxt.FieldByName('VALORPART').AsString = '' then
                     rValor := 0
                  else
                     rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPART').AsString)));

                  GravaErrosCCP(qryTxt, cdsDadosArquivo, bad, bMontaBad, 4, sIDPessjur, 'Erro ao atualizar salário de participação.',
                       qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                       sMesRefGr, rValor,'',sMesCobGr, sNomePatro);

                end;

                AlimentaListaTotSalarios(sIDPlanoPrevProcura,StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPART').AsString))), False);
              end;  // if copy(sMesRefGr, 6, 2) = '13'

              sMatriculaAtual := qryTxt.FieldByName('VALORCHAVE').AsString;

            end; // if StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPART').AsString))) > 0
          end;  // if sMatriculaAtual <> qryTxt.FieldByName('VALORCHAVE').AsString
        end; // if cdsAux.IsEmpty
      end;  // if (cdsDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'I')...
      //fim  do tratamento FLGCALCSALPART = 'I'

      // -------------------------------------------------------------------------------------------

      // Tipo de Rubrica NÃO É GERAL
      if (cdsBuscaRubrica.FieldByName('FLGTPRUBRICA').AsString <> 'G') then
      begin
        cdsAux.Close;

        if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
        begin
          //VERIFICA SE A RUBRICA DE CONTRA-PARTIDA JÁ EXITE
          //E ATUALIZA SÓ O VALOR
          sSQL :=
          'SELECT 1 '                                                         + #13 +
          'FROM   CLASSERUBRICAS '                                            + #13 +
          'WHERE  MESCOBRANCA               = ''' + sMesCobGr + ''''          + #13 +
          '  AND  CODPATRO                  = ' + sIDPessjur                  + #13 +
          '  AND  CODPLANO                  = ' + sIDPlanoPrevProcura         + #13 +
          '  AND  IDPESSOA                  = ' + sIDPessoaProcura            + #13 +
          '  AND  SUBSTR(CODPROVDESC, 0, 4) = ' + QuotedStr(trim(sProvento))  + ' ';

          cdsAux.Data := GetDataPacket(sSQL);
        end; // if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0'

        if not(cdsAux.IsEmpty) then
        begin
          if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
          begin
            // verifica se a mesma rubrica já foi inserida
            // no caso de duplicação no arquivo
            sSQL :=
            'SELECT 1 '                                             + #13 +
            'FROM   CLASSERUBRICAS '                                + #13 +
            'WHERE  MESCOBRANCA   = ''' + sMesCobGr + ''''          + #13 +
            '  AND  CODPATRO      = ' + sIDPessjur                  + #13 +
            '  AND  CODPLANO      = ' + sIDPlanoPrevProcura         + #13 +
            '  AND  IDPESSOA      = ' + sIDPessoaProcura            + #13 +
            '  AND  CODPROVDESC   = ' + QuotedStr(trim(sProvento))  + ' ';

            cdsAux.Data := GetDataPacket(sSQL);

            if not(cdsAux.IsEmpty) then
            begin
               qryTxt.Next;
               sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

               Continue;
            end;  // if not(cdsAux.IsEmpty)

            // -------------------------------------------------------------------------------------
            sSQL:='UPDATE CLASSERUBRICAS SET VALORRECEBIDO = (VALORRECEBIDO + ';

            if pos('P',sProvento) > 0 then
            begin
               sSQL:=sSQL+' ('+ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)+' *-1)' ;
            end
            else
            begin
               sSQL:=sSQL+ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString);
            end;

            sSQL:=sSQL+') WHERE (IDPESSOA = '+trim(sIDPessoaProcura);

            if (cdsBuscaRubrica.FieldByName('CONTRIBSOBRE13').AsInteger = 0) then
            begin
               sSQL:=sSQL+') AND   (MESREFERENCIA = '''+sMesRefGr+'''';
            end
            else
            begin
               sSQL:=sSQL+') AND   (MESREFERENCIA = '''+sMesRef13+'''';
            end;
            sSQL:=sSQL+') AND   ( SUBSTR(CODPROVDESC,0,4) = '+copy(trim(sProvento),1,4);
            sSQL:=sSQL+') AND   (CODPATRO     = '+sIDPessjur+')';

            if not(ExecSQL(sSQL)) then
            begin
              if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                       rValor := 0
                    else
                       rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

                    GravaErrosCCP(qryTxt, cdsDadosArquivo, bad, bMontaBad,6, sIDPessjur, 'Erro na atualização da contribuição.',
                                  qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                  sMesRefGr,rValor,'',sMesCobGr, sNomePatro);

                    sUltValorChave := qryTxt.FieldByName('ValorChave').AsString ;
                    sUltProvento := sProvento;
                    qryTxt.Next;

                    sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

                    Continue;
            end; // if not(ExecSQL(sSQL))
          end
          else  // if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0'
          begin
            WriteLn(F,'Codigo do Provento '+sProvento+' está Duplicado. Registro '+trim(qryTxt.FieldByName('VALORCHAVE').AsString));
          end;  // if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0'
        end
        else  // if not(cdsAux.IsEmpty)
        begin
          // verificar se a rubrica é de empréstimo
          // se for apenas alterar a tmpdesc
          if sChave = 'E' then
          begin
            if (cdsDadosArquivo.FieldByName('FLGGRAVAHIST').AsInteger = 1) then
            begin
              if not(GravaHistRubSal(qryTxt,
                                     cdsDadosArquivo,
                                     bad,
                                     bMontaBad,
                                     mmDivergencias,
                                     sIDPessjur,
                                     sMesRefGr,
                                     sMesCobGr,
                                     sIDPessoaProcura,
                                     sSeqRubrica,
                                     sIDPlanoPrevProcura,
                                     trim(sProvento),
                                     sFlgSalPart,
                                     sFlgSalBenef,
                                     sFlgRemTotal,
                                     sFlgIrrf,
                                     sNomePatro,
                                     StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString))),
                                     iRubrica,
                                     bVerHistRubSal,
                                     sPrazo
                                    )) then
              begin
                if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                  rValor := 0
                else
                  rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

                GravaErrosCCP(qryTxt,
                              cdsDadosArquivo,
                              bad,
                              bMontaBad,
                              8,
                              sIDPessjur,
                              'Rubrica não gravada. Possível duplicação.',
                              qryTxt.FieldByName('VALORCHAVE').AsString,
                              sProvento,
                              sMesRefGr,
                              rValor,
                              '',
                              sMesCobGr,
                              sNomePatro
                             );

                sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString ;
                sUltProvento    := sProvento;
                sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);

              end;  // if not(GravaHistRubSal(
            end;  // if (cdsDadosArquivo.FieldByName('FLGGRAVAHIST').AsInteger = 1)

            sIDContratoEmptmo := '';

            sSQL :=
            'SELECT MAX(IDCONTRATOEMPTMO) AS IDCONTRATOEMPTMO ' + #13 +
            'FROM   CONTRATOEMPTMO '                            + #13 +
            'WHERE  IDPESSOA = ' + trim(sIDPessoaProcura)       + ' ';

            SQLParam.SQL.Text := sSQL;
            cdsAux.Data       := SQLParam.Data;
            sIDContratoEmptmo :=  cdsaux.FieldByName('IDCONTRATOEMPTMO').AsString;

            sSQL :=
            'SELECT '                                                       + #13 +
            '  COUNT(1) CONT, SUM(VALOR) VALOR '                            + #13 +
            'FROM '                                                         + #13 +
            '  TMPDESC '                                                    + #13 +
            'WHERE '                                                        + #13 +
            '      IDPESSOA                   = ' + trim(sIDPessoaProcura)  + #13 +
            '  AND IDPESSJUR                  = ' + sIDPessjur              + #13 +
            '  AND MESCOBRANCA                = ' + '''' + sMesCobGr + '''' + #13 +
            '  AND LTRIM(RTRIM(CODPROVDESC))  = ' + QuotedStr(sProvento)    + #13 +
            '  AND FLGDESCFOLHA               = ''P'' ';

            SQLParam.SQL.Text := sSQL;
            cdsAux.Data       := SQLParam.Data;

            // se não há registro então insere
            if (cdsaux.IsEmpty) or (cdsaux.FieldByName('CONT').AsInteger <= 0 ) then
            begin
              GravaTmpDesc(sIDPessjur,
                           sMesRefGr,
                           sMesCobGr,
                           sIDPessoaProcura,
                           'E',
                           qryTxt.FieldByName('VALORCHAVE').AsString,
                           sIDPlanoPrevProcura,
                           sIDContratoEmptmo {idcontribuicao},
                           sProvento,
                           'N' {flgatrasodevol},
                           sDataRef,
                           StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString))),
                           StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString))),
                           iIdLote,
                           0 // idrubrica
                          );
            end
            else  //  if (cdsaux.IsEmpty) or (cdsaux.FieldByName('CONT').AsInteger <= 0 )
            if cdsaux.FieldByName('CONT').AsInteger = 1 then
            begin
              // se tem apenas um registro
              if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
              begin
                sSQL :=
                'UPDATE '     + #13 +
                '  TMPDESC '  + #13 +
                'SET '        + #13 +

                '  VALORRECEBIDO      = NVL(VALORRECEBIDO, 0) + ' + ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) + ', '                               + #13 +
                '  DATARECEBIMENTO    = TO_DATE(''' + sDataCob + ''', ''DD/MM/YYYY''), '                                                                                      + #13 +
                '  SITENVIO           = DECODE(VALOR, NVL(VALORRECEBIDO, 0) + ' + ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString) + ', ''2'', ''1''), ' + #13 +
                '  VALOR              = DECODE(IDMODULO, 15, VALOR, '                                                                                                         +
                                                            'VALOR + ' + ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) + ') '                          + #13 +

                'WHERE '                                                          + #13 +
                '      IDPESSOA                   = ' + sIDPessoaProcura          + #13 +
                '  AND IDPESSJUR                  = ' + sIDPessjur                + #13 +
                '  AND MESCOBRANCA                = ' + '''' + sMesCobGr + ''''   + #13 +
                '  AND LTRIM(RTRIM(CODPROVDESC))  = ' + QuotedStr(sProvento)      + ' ';
              end
              else  // if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0'
              begin
                sSQL :=
                'UPDATE '     + #13 +
                '  TMPDESC '  + #13 +
                'SET '        + #13 +

                '  VALORRECEBIDO      = ' + ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString) + ', '                              + #13 +
                '  DATARECEBIMENTO    = TO_DATE(''' + sDataCob + ''', ''DD/MM/YYYY''), '                                                              + #13 +
                '  SITENVIO           = DECODE(VALOR, ' + ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString) + ', ''2'', ''1'') '  + #13 +

                'WHERE '                                                          + #13 +
                '      IDPESSOA                   = ' + sIDPessoaProcura          + #13 +
                '  AND IDPESSJUR                  = ' + sIDPessjur                + #13 +
                '  AND MESCOBRANCA                = ' + '''' + sMesCobGr + ''''   + #13 +
                '  AND LTRIM(RTRIM(CODPROVDESC))  = ' + QuotedStr(sProvento)      + ' ';
              end;  // if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0'

              if not(ExecSQL(sSQL)) then
              begin
                if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                  rValor := 0
                else
                  rValor := qryTxt.FieldByName('VALORPROVE').AsFloat;

                GravaErrosCCP(qryTxt,
                              cdsDadosArquivo,
                              bad,
                              bMontaBad,
                              8,
                              sIDPessjur,
                              'Rubrica não gravada. Possível duplicação.',
                              qryTxt.FieldByName('VALORCHAVE').AsString,
                              sProvento,
                              sMesRefGr,
                              rValor,
                              '',
                              sMesCobGr,
                              sNomePatro
                             );

                memErros.Lines.Add('Erro no recebimento da Rubrica ' + sProvento + ', Matrícula ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' ');

                sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString;
                sUltProvento    := sProvento;
                qryTxt.Next;
                sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
                Continue;
              end;  // if not(ExecSQL(sSQL))
            end
            else
            if (cdsaux.FieldByName('CONT').AsInteger > 1) and
               (cdsaux.FieldByName('VALOR').AsFloat = StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString))) ) then
            begin
              // se há mais de um regsitro mais o total do recebido bate com o somatório dos registros
              // esperados atualizar o valorrecebido = valor
              sSQL :=
              'UPDATE '     + #13 +
              '  TMPDESC '  + #13 +
              'SET '        + #13 +

              '  VALORRECEBIDO    = VALOR, '                                        + #13 +
              '  SITENVIO         = ''2'', '                                        + #13 +
              '  DATARECEBIMENTO  = TO_DATE(''' + sDataCob + ''', ''DD/MM/YYYY'') ' + #13 +
              'WHERE '                                                              + #13 +
              '      IDPESSOA                   = ' + trim(sIDPessoaProcura)        + #13 +
              '  AND IDPESSJUR                  = ' + sIDPessjur                    + #13 +
              '  AND MESCOBRANCA                = ' + '''' + sMesCobGr + ''''       + #13 +
              '  AND LTRIM(RTRIM(CODPROVDESC))  = ' + QuotedStr(sProvento)          + ' ';

              if not(ExecSQL(sSQL)) then
              begin
                if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                  rValor := 0
                else
                  rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

                GravaErrosCCP(qryTxt,
                              cdsDadosArquivo,
                              bad,
                              bMontaBad,
                              8,
                              sIDPessjur,
                              'Rubrica não gravada. Possível duplicação.',
                              qryTxt.FieldByName('VALORCHAVE').AsString,
                              sProvento,
                              sMesRefGr,
                              rValor,
                              '',
                              sMesCobGr,
                              sNomePatro
                             );

                memErros.Lines.Add('Erro no recebimento da Rubrica '+sProvento+', Matrícula '+qryTxt.FieldByName('VALORCHAVE').AsString+' ');

                sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString;
                sUltProvento    := sProvento;
                qryTxt.Next;
                sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
                Continue;
              end;  // if not(ExecSQL(sSQL))
            end
            else  // if (cdsaux.FieldByName('CONT').AsInteger > 1) and...
            begin
              // -----------------------------------------------------------------------------------

              bEncontrou  := False;
              dValorSobra := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString)));

              sSQL :=
              'SELECT '                                                         + #13 +
              '  T.MESREFERENCIA, T.IDPROVENTO, T.VALOR, T.IDTMPDESC '          + #13 +
              'FROM '                                                           + #13 +
              '  TMPDESC  T, '                                                  + #13 +
              '  PROVDESC P  '                                                  + #13 +

              'WHERE '                                                          + #13 +
              '      T.IDPESSOA                   = ' + trim(sIDPessoaProcura)  + #13 +
              '  AND T.IDPESSJUR                  = ' + sIDPessjur              + #13 +
              '  AND T.MESCOBRANCA                = ' + '''' + sMesCobGr + '''' + #13 +
              '  AND LTRIM(RTRIM(T.CODPROVDESC))  = ' + QuotedStr(sProvento)    + #13 +
              '  AND P.IDPROVENTO                 = T.IDPROVENTO '              + #13 +

              'ORDER BY '                                                       + #13 +
              '  T.MESREFERENCIA, P.NUMPRIORIDADE ';

              SQLParam.SQL.Text := sSQL;
              cdsLoop.Data      := SQLParam.Data;

              if not(cdsLoop.IsEmpty) then iCont := cdsLoop.RecordCount;

              while not(cdsLoop.EOF) do
              begin
                if dValorSobra = cdsLoop.FieldByName('VALOR').AsCurrency then
                begin
                  IDTmpDesc   := cdsLoop.FieldByName('IDTMPDESC').AsInteger;
                  bEncontrou  := True;
                  Break;
                end;

                cdsLoop.Next;
              end;

              if bEncontrou then
              begin
                sSQL :=
                'UPDATE '     + #13 +
                '  TMPDESC '  + #13 +
                'SET '        + #13 +

                '  VALORRECEBIDO      = ' + OraNumero(FloatToStr(dValorSobra)) + ', '                               + #13 +
                '  DATARECEBIMENTO    = TO_DATE(''' + sDataCob + ''', ''DD/MM/YYYY''), '                            + #13 +
                '  SITENVIO           = DECODE(VALOR, ' + OraNumero(FloatToStr(dValorSobra)) + ', ''2'', ''1''), '  + #13 +
                '  FLGDESCFOLHA       = ''P'' '                                                                     + #13 +

                'WHERE '                                                                    + #13 +
                '      IDPESSOA                   = ' + sIDPessoaProcura                    + #13 +

                '  AND IDTMPDESC                  = ' + FormatFloat('#0', IDTmpDesc)        + #13 +

                '  AND IDPESSJUR                  = ' + sIDPessjur                          + #13 +
                '  AND MESCOBRANCA                = ' + '''' + sMesCobGr + ''''             + #13 +

                '  AND MESREFERENCIA              = ' + '''' + cdsLoop.FieldByName('MESREFERENCIA').AsString + ''''   + #13 +
                '  AND IDPROVENTO                 = ' + cdsLoop.FieldByName('IDPROVENTO').AsString                    + #13 +
                '  AND LTRIM(RTRIM(CODPROVDESC))  = ' + QuotedStr(sProvento);

                if not(ExecSQL(sSQL)) then
                begin
                  if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                    rValor := 0
                  else
                    rValor := qryTxt.FieldByName('VALORPROVE').AsFloat;

                  GravaErrosCCP(qryTxt,
                                cdsDadosArquivo,
                                bad,
                                bMontaBad,
                                8,
                                sIDpessjur,
                                'Rubrica não gravada. Possível duplicação.',
                                qryTxt.FieldByName('VALORCHAVE').AsString,
                                sProvento,
                                sMesRefGr,
                                rValor,
                                '',
                                sMesCobGr,
                                sNomePatro
                               );

                  memErros.Lines.Add('Erro no recebimento da Rubrica ' + sProvento + ', Matrícula ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' ');

                  sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString;
                  sUltProvento    := sProvento;
                  qryTxt.Next;
                  sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
                end;

                // ---------------------------------------------------------------------------------
              end
              else  // if bEncontrou
              begin
                cdsLoop.First;

                // fazer controle dos pagamentos a maior
                while not(cdsLoop.EOF) and (dValorSobra > 0) do
                begin
                  dec(iCont);

                  // se é o último registro e o pagamento é maior do que o esperado, então atualizar
                  // com o recebido
                  if (dValorSobra > cdsLoop.FieldByName('VALOR').AsFloat) and (iCont = 0) then
                  begin
                    sValorAtu     := OraNumero(FloatToStr(dValorSobra));
                    dValorSobra   := 0;
                  end
                  else  // if (dValorSobra > cdsLoop.FieldByName('VALOR').AsFloat) and (iCont = 0)
                  begin
                    if (cdsLoop.FieldByName('VALOR').AsFloat > dValorSobra) then
                    begin
                      // se o esparado é maior que a sobra , então receber a sobra e parar
                      sValorAtu   := OraNumero(FloatToStr(dValorSobra));
                      dValorSobra := 0;
                    end
                    else  // if (cdsLoop.FieldByName('VALOR').AsFloat > dValorSobra)
                    begin
                      // se ainda há sobra, atualizar com o esperado e cotinuar
                      sValorAtu   := OraNumero(cdsLoop.FieldByName('VALOR').AsString);
                      dValorSobra := dValorSobra -  cdsLoop.FieldByName('VALOR').AsFloat;
                    end;
                  end;  // if (dValorSobra > cdsLoop.FieldByName('VALOR').AsFloat) and (iCont = 0)

                  if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
                  begin
                    sSQL :=
                    'UPDATE '     + #13 +
                    '  TMPDESC '  + #13 +
                    'SET '        + #13 +

                    '  VALORRECEBIDO      = NVL(VALORRECEBIDO, 0) + ' + sValorAtu + ', '                      + #13 +
                    '  DATARECEBIMENTO    = TO_DATE(''' + sDataCob + ''', ''DD/MM/YYYY''), '                  + #13 +
                    '  SITENVIO           = DECODE(VALOR, VALORRECEBIDO + ' + sValorAtu + ', ''2'', ''1''), ' + #13 +
                    '  FLGDESCFOLHA       = ''P'', '                                                          + #13 +
                    '  VALOR              = DECODE(IDMODULO, 15, VALOR, '                                     +
                                                                'VALOR + ' + sValorAtu + ') '                 + #13 +

                    'WHERE '                                                          + #13 +
                    '      IDPESSOA                   = ' + sIDPessoaProcura          + #13 +
                    '  AND IDPESSJUR                  = ' + sIDPessjur                + #13 +
                    '  AND MESCOBRANCA                = ' + '''' + sMesCobGr + ''''   + #13 +

                    '  AND MESREFERENCIA              = ' + '''' + cdsLoop.FieldByName('MESREFERENCIA').AsString + ''''   + #13 +
                    '  AND IDPROVENTO                 = ' + cdsLoop.FieldByName('IDPROVENTO').AsString                    + #13 +
                    '  AND LTRIM(RTRIM(CODPROVDESC))  = ' + QuotedStr(sProvento)                                          + #13 +

                    // se acontercer do mesmo provento no mesmo mês...
                    '  AND VALOR                      = ' + OraNumero(cdsLoop.FieldByName('VALOR').AsString) + ' ';
                  end
                  else
                  begin
                    sSQL :=
                    'UPDATE '     + #13 +
                    '  TMPDESC '  + #13 +
                    'SET '        + #13 +

                    '  VALORRECEBIDO      = ' + sValorAtu + ', '                                + #13 +
                    '  DATARECEBIMENTO    = TO_DATE(''' + sDataCob + ''', ''DD/MM/YYYY''), '    + #13 +
                    '  SITENVIO           = DECODE(VALOR, ' + sValorAtu + ', ''2'', ''1''), '   + #13 +
                    '  FLGDESCFOLHA       = ''P'', '                                            + #13 +
                    '  VALOR              = DECODE(IDMODULO, 15, VALOR, ' + sValorAtu + ') '    + #13 +

                    'WHERE '                                                          + #13 +
                    '      IDPESSOA                   = ' + sIDPessoaProcura          + #13 +
                    '  AND IDPESSJUR                  = ' + sIDPessjur                + #13 +
                    '  AND MESCOBRANCA                = ' + '''' + sMesCobGr + ''''   + #13 +

                    '  AND MESREFERENCIA              = ' + '''' + cdsLoop.FieldByName('MESREFERENCIA').AsString + ''''   + #13 +
                    '  AND IDPROVENTO                 = ' + cdsLoop.FieldByName('IDPROVENTO').AsString                    + #13 +
                    '  AND LTRIM(RTRIM(CODPROVDESC))  = ' + QuotedStr(sProvento)                                          + #13 +

                    // se acontercer do mesmo provento no mesmo mês...
                    '  AND VALOR                      = ' + OraNumero(cdsLoop.FieldByName('VALOR').AsString) + ' ';
                  end;

                  if not(ExecSQL(sSQL)) then
                  begin
                    if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                      rValor := 0
                    else
                      rValor := qryTxt.FieldByName('VALORPROVE').AsFloat;

                    GravaErrosCCP(qryTxt,
                                  cdsDadosArquivo,
                                  bad,
                                  bMontaBad,
                                  8,
                                  sIDpessjur,
                                  'Rubrica não gravada. Possível duplicação.',
                                  qryTxt.FieldByName('VALORCHAVE').AsString,
                                  sProvento,
                                  sMesRefGr,
                                  rValor,
                                  '',
                                  sMesCobGr,
                                  sNomePatro
                                 );

                    memErros.Lines.Add('Erro no recebimento da Rubrica ' + sProvento + ', Matrícula ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' ');

                    sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString;
                    sUltProvento    := sProvento;
                    qryTxt.Next;
                    sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
                    Continue;
                  end;  // if not(ExecSQL(sSQL))

                  cdsLoop.Next;
                end;  // while not(cdsLoop.EOF) and (dValorSobra > 0)
              end;  // if bEncontrou 
            end;  // if (cdsaux.FieldByName('CONT').AsInteger > 1) and
          end
          else  // if sChave = 'E'
          begin
            // se insere todas as rubricas na histrubsal
            if (Pos('G',sChave) > 0) or
               (cdsDadosArquivo.FieldByName('FLGGRAVAHIST').AsInteger = 1) or
               (trim(sCodProvDescSalPart) = sProvento) or
               (trim(sCodProvDescRemTotal) = sProvento) or
               (trim(sCodProvDescSal13) = sProvento) or
               (sFlgSalPart = '1') or
               (sFlgSalBenef = '1') or
               (sFlgRemTotal = '1') then
            begin
              // tratamento mês 13
              if sCodProvDescSal13 = sProvento then
              begin
                sMesAux := sMesRef13;
              end
              else if (cdsBuscaRubrica.FieldByName('CONTRIBSOBRE13').AsInteger = 1) then
              begin
                sMesAux := sMesRef13;
              end
              else
              begin
                sMesAux := sMesRefGr;
              end;

              if sCodProvDescSal13 = sProvento    then iRubrica := iIdRubSal13;
              if sCodProvDescSalPart = sProvento  then iRubrica := iIdRubSalPart;
              if sCodProvDescRemTotal = sProvento then iRubrica := iIdRubRemTotal;
              // fim tratamento mês 13

              if not(GravaHistRubSal(qryTxt,
                                     cdsDadosArquivo,
                                     bad,
                                     bMontaBad,
                                     mmDivergencias,
                                     sIDPessjur,
                                     sMesAux,
                                     sMesCobGr,
                                     sIDPessoaProcura,
                                     sSeqRubrica,
                                     sIDPlanoPrevProcura,
                                     trim(sProvento),
                                     sFlgSalPart,
                                     sFlgSalBenef,
                                     sFlgRemTotal,
                                     sFlgIrrf,
                                     sNomePatro,
                                     StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString))),
                                     iRubrica,
                                     bVerHistRubSal,
                                     sPrazo
                                    )) then
              begin
                if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                  rValor := 0
                else
                  rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

                GravaErrosCCP(qryTxt,
                              cdsDadosArquivo,
                              bad,
                              bMontaBad,
                              8,
                              sIDPessjur,
                              'Rubrica não gravada. Possível duplicação.',
                              qryTxt.FieldByName('VALORCHAVE').AsString,
                              sProvento,
                              sMesRefGr,
                              rValor,
                              '',
                              sMesCobGr,
                              sNomePatro
                             );

                sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString;
                sUltProvento    := sProvento;
                sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
              end;  // if not(GravaHistRubSal(...

              // tratamento de 13
              if (sCodProvDescRemTotal = sProvento) and
                 (cdsDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'N') then
              begin
                sSQL :=
                'UPDATE ELEGPATRO '                                                                                           + #13 +
                'SET    SALTOTAL  = ' + OraNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)) + ' ' + #13 +
                'WHERE  IDPESSJUR = ' + sIDPessjur                                                                            + #13 +
                '  AND  IDPESSOA  = ' + sIDPessoaProcura;

                if not(ExecSQL(sSQL)) then
                begin
                  WriteLn(F, 'Não atualizou o Salário de Remuneração Total.');
                  mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' - Não gravou o Salário de Remuneração Total.');

                  if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                    rValor := 0
                  else
                    rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

                  GravaErrosCCP(qryTxt,
                                cdsDadosArquivo,
                                bad,
                                bMontaBad,
                                5,
                                sIDPessjur,
                                'Erro ao atualizar salário de remuneração total.',
                                qryTxt.FieldByName('VALORCHAVE').AsString,
                                sProvento,
                                sMesRefGr,
                                rValor,
                                '',
                                sMesCobGr,
                                sNomePatro
                               );
                end;  // if not(ExecSQL(sSQL))

                AlimentaListaTotSalarios(sIDPlanoPrevProcura,StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString))), True);
              end
              else  // if (sCodProvDescRemTotal = sProvento) and
              if (sCodProvDescSal13 = sProvento) and
                 (cdsDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'N') then
              begin
                sSQL :=
                'UPDATE PARTPREVPLAN PPP '                                                                                          + #13 +
                'SET    PPP.SALPARTIC13 = ' + OraNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)) + ' ' + #13 +
                'WHERE  PPP.IDPESSJUR   = ' + sIDPessjur                                                                            + #13 +
                '  AND  PPP.IDPLANOPREV = ' + sIDPlanoPrevProcura                                                                   + #13 +
                '  AND  PPP.IDPESSOA    = ' + sIDPessoaProcura;

                if not(ExecSQL(sSQL)) then
                begin
                  WriteLn(F, 'Não atualizou o Salário Participação 13 do Arquivo Texto');
                  mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' - Não gravou o Salário Participação 13 no Histórico...');

                  if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                    rValor := 0
                  else
                    rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

                  GravaErrosCCP(qryTxt,
                                cdsDadosArquivo,
                                bad,
                                bMontaBad,
                                5,
                                sIDPessjur,
                                'Erro ao atualizar salário décimo terceiro.',
                                qryTxt.FieldByName('VALORCHAVE').AsString,
                                sProvento,
                                sMesRefGr,
                                rValor,
                                '',
                                sMesCobGr,
                                sNomePatro
                               );
                end;

                AlimentaListaTotSalarios(sIDPlanoPrevProcura,StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString))), True);
              end
              else  // if (sCodProvDescSal13 = sProvento) and
              if (sCodProvDescSalPart = sProvento) and
                 (cdsDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'N') then
              begin
                sSQL :=
                'UPDATE PARTPREVPLAN PPP '                                                                                              + #13 +
                'SET    PPP.SALPARTICIPACAO = ' + OraNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)) + ' ' + #13 +
                'WHERE  PPP.IDPESSJUR       = ' + sIDPessjur                                                                            + #13 +
                '  AND  PPP.IDPLANOPREV     = ' + sIDPlanoPrevProcura                                                                   + #13 +
                '  AND  PPP.IDPESSOA        = ' + sIDPessoaProcura;

                if not(ExecSQL(sSQL)) then
                begin
                  WriteLn(F, 'Não atualizou o Salário Participação do Arquivo Texto');
                  mmDivergencias.Lines.Add(TimeToStr(Time) + ' ' + qryTxt.FieldByName('VALORCHAVE').AsString + ' - Não gravou o Salário Participação no Histórico...');

                  if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                    rValor := 0
                  else
                    rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

                  GravaErrosCCP(qryTxt,
                                cdsDadosArquivo,
                                bad,
                                bMontaBad,
                                4,
                                sIDPessjur,
                                'Erro ao atualizar salário de participação.',
                                qryTxt.FieldByName('VALORCHAVE').AsString,
                                sProvento,
                                sMesRefGr,
                                rValor,
                                '',
                                sMesCobGr,
                                sNomePatro
                               );

                end;  // if not(ExecSQL(sSQL))

                AlimentaListaTotSalarios(sIDPlanoPrevProcura,StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString))), False);
              end;  // if (sCodProvDescSalPart = sProvento) and
            end;  // if (Pos('G',sChave) > 0) or ...

            if (iContribuicao > 0) and (StrToInt(sIDPlanoPrevProcura) > 0) then
            begin
              if bInsereClasseRubricas then
              begin
                inc(iSeqTabela);

                if sCodProvDescSal13 = sProvento then
                  sMesAux := sMesRef13
                else
                  sMesAux := sMesRefGr;

                if not(GravaClasseRubricas(sIDPessjur,
                                           sMesAux,
                                           sMesCobGr,
                                           sIDPessoaProcura,
                                           sChave,
                                           trim(qryTxt.FieldByName('VALORCHAVE').AsString),
                                           sIDPlanoPrevProcura,
                                           IntToStr(iContribuicao),
                                           sProvento,
                                           cdsBuscaRubrica.FieldByName('CONTRIBSOBRE13').AsString,
                                           sOrdemCalculo,
                                           sFlgAtrasoDev,
                                           sDataRef ,
                                           StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString))),
                                           iSeqTabela,
                                           iRubrica
                                          )) then

                begin
                  if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                    rValor := 0
                  else
                    rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

                  GravaErrosCCP(qryTxt,
                                cdsDadosArquivo,
                                bad,
                                bMontaBad,
                                7,
                                sIDPessjur,
                                'Erro na gravação da Contribuição.',
                                qryTxt.FieldByName('VALORCHAVE').AsString,
                                sProvento,
                                sMesRefGr,
                                rValor,
                                IntToStr(iContribuicao),
                                sMesCobGr,
                                sNomePatro
                               );

                  sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString ;
                  sUltProvento    := sProvento;
                  qryTxt.Next;
                  sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
                  Continue;
                end;  // if not(GravaClasseRubricas(...
              end
              else  // if bInsereClasseRubricas
              begin
                try
                  sSQL :=
                  'UPDATE '     + #13 +
                  '  TMPDESC '  + #13 +
                  'SET '        + #13;

                  if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
                  begin
                    sSQL := sSQL +
                    '  VALORRECEBIDO      = NVL(VALORRECEBIDO, 0) + ' + ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString) + ', '                      + #13 +
                    '  VALOR              = DECODE(IDMODULO, 15, VALOR, '                                                                                                 +
                                                                'NVL(VALORRECEBIDO, 0) + ' + ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) + '), ' + #13;
                  end
                  else
                  begin
                    sSQL := sSQL +
                    '  VALORRECEBIDO      = ' + ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) + ', ' + #13;
                  end;

                  sSQL := sSQL +
                  '  DATARECEBIMENTO    = TO_DATE(''' + sDataCob + ''', ''DD/MM/YYYY''), '                                                              + #13 +
                  '  SITENVIO           = DECODE(VALOR, ' + ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString) + ', ''2'', ''1''), '  + #13 +
                  '  FLGDESCFOLHA       = ''P'' '                                                                                                       + #13 +

                  'WHERE '                                                                    + #13 +    
                  '      IDPESSOA       = ' + sIDPessoaProcura                                + #13 +
                  '  AND IDPESSJUR      = ' + sIDPessjur                                      + #13;

                  if (cdsBuscaRubrica.FieldByName('CONTRIBSOBRE13').AsInteger = 0) then sSQL := sSQL +
                  '  AND MESREFERENCIA  = ' + '''' + sMesRefGR + ''''                         + #13
                  else sSQL := sSQL +
                  '  AND MESREFERENCIA  = ' + '''' + sMesRef13 + ''''                         + #13;

                  sSQL := sSQL +
                  '  AND MESCOBRANCA    = ' + '''' + sMesCobGr + ''''                         + #13 +
                  '  AND IDDESCONTO     = ' + '''' + IntToStr(iContribuicao) + ''''           + #13 +
                  '  AND IDPROVENTO     = ' + IntToStr(iRubrica);

                  if not(ExecSQL(sSQL, True)) then
                  begin
                    if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                      rValor := 0
                    else
                      rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

                    if (cdsBuscaRubrica.FieldByName('CONTRIBSOBRE13').AsInteger = 0) then
                      sMesAux := sMesRefGR
                    else
                      sMesAux := sMesRef13;

                    GravaTmpDesc(sIDPessjur,
                                 sMesAux,
                                 sMesCobGr,
                                 sIDPessoaProcura,
                                 sChave,
                                 qryTxt.FieldByName('VALORCHAVE').AsString ,
                                 sIDPlanoPrevProcura,
                                 IntToStr(iContribuicao),
                                 sProvento,
                                 cdsBuscaRubrica.FieldByName('FLGATRASODEVOL').AsString,
                                 sDataRef ,
                                 rValor,
                                 rValor,
                                 iIdLote,
                                 iRubrica
                                );
                  end;  // if not(ExecSQL(sSQL, True))
                except
                  if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                    rValor := 0
                  else
                    rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

                  GravaErrosCCP(qryTxt,
                                cdsDadosArquivo,
                                bad,
                                bMontaBad,
                                7,
                                sIDPessjur,
                                'Erro na gravação da Contribuição.',
                                qryTxt.FieldByName('VALORCHAVE').AsString,
                                sProvento,
                                sMesRefGr,
                                rValor,
                                IntToStr(iContribuicao),
                                sMesCobGr,
                                sNomePatro
                               );
                end;  // try..except
              end;  // if bInsereClasseRubricas
            end;  // if (iContribuicao > 0) and (StrToInt(sIDPlanoPrevProcura) > 0)

            // se a rubrica não foi identificada como salário e também não foi identificada
            // como contribuição
            if not (
                   (Pos('G',sChave) > 0) or (cdsDadosArquivo.FieldByName('FLGGRAVAHIST').AsInteger = 1) or
                   (trim(sCodProvDescSalPart) = sProvento) or
                   (trim(sCodProvDescSal13) = sProvento) or
                   (sFlgSalPart   = '1') or
                   (sFlgSalBenef  = '1') or
                   (sFlgRemTotal  = '1') or
                   (iContribuicao > 0)
                   ) then
            begin
              if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                rValor := 0
              else
                rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

              GravaErrosCCP(qryTxt,
                            cdsDadosArquivo,
                            bad,
                            bMontaBad,
                            12,
                            sIDPessjur,
                            'Rubrica não identificada.',
                            qryTxt.FieldByName('VALORCHAVE').AsString,
                            sProvento,
                            sMesRefGr,
                            rValor,
                            '',
                            sMesCobGr,
                            sNomePatro
                           );

              mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTxt.FieldByName('VALORCHAVE').AsString+ ' - Rubrica '+sProvento+' não identificada no sistema.');
            end;  // if not Pos('G',sChave) > 0) or...
          end;  // if sChave = 'E'
        end; // if not(cdsAux.IsEmpty)
      end
      else  // if (cdsBuscaRubrica.FieldByName('FLGTPRUBRICA').AsString <> 'G')
      begin
        if (cdsBuscaRubrica.FieldByName('CONTRIBSOBRE13').AsInteger = 0) then
          sMesAux := sMesRefGR
        else
          sMesAux := sMesRef13;

        if not(GravaHistRubSal(qryTxt,
                               cdsDadosArquivo,
                               bad,
                               bMontaBad,
                               mmDivergencias,
                               sIDPessjur,
                               sMesAux,
                               sMesCobGr,
                               sIDPessoaProcura,
                               sSeqRubrica,
                               sIDPlanoPrevProcura,
                               trim(sProvento),
                               sFlgSalPart,
                               sFlgSalBenef,
                               sFlgRemTotal,
                               sFlgIrrf,
                               sNomePatro,
                               StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo, qryTxt.FieldByName('VALORPROVE').AsString))),
                               iRubrica,
                               bVerHistRubSal,
                               sPrazo
                              )) then
        begin
          if qryTxt.FieldByName('VALORPROVE').AsString = '' then
            rValor := 0
          else
            rValor := StrToFloat(ClienteNumero(ConvValor(cdsDadosArquivo,qryTxt.FieldByName('VALORPROVE').AsString)));

          GravaErrosCCP(qryTxt,
                        cdsDadosArquivo,
                        bad,
                        bMontaBad,
                        8,
                        sIDPessjur,
                        'Rubrica não gravada. Possível duplicação.',
                        qryTxt.FieldByName('VALORCHAVE').AsString,
                        sProvento,
                        sMesRefGr,
                        rValor,
                        '',
                        sMesCobGr,
                        sNomePatro
                       );

          sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString ;
          sUltProvento    := sProvento;
          qryTxt.Next;
          sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);
          Continue;
        end;  // if not(GravaHistRubSal(

      end;  // if (cdsBuscaRubrica.FieldByName('FLGTPRUBRICA').AsString <> 'G')

      // -------------------------------------------------------------------------------------------

      sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString ;
      sUltProvento    := sProvento;
      qryTxt.Next;
      sProvento       := trim(qryTxt.FieldByName('PROVENTO').AsString);

      if iContadorCommit > NumMaxRegSemCommit then
      begin
        if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
        if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;
        iContadorCommit := 0;
      end;  // if iContadorCommit > NumMaxRegSemCommit

    except
      sUltValorChave  := qryTxt.FieldByName('ValorChave').AsString ;
      sUltProvento    := sProvento;
      qryTxt.Next;
      Continue;

      WriteLn(F,'Não Consegui processar a chave de número '+qryTxt.FieldByName('VALORCHAVE').AsString+' do Arquivo de Interface. Erro: '+sErro);

      if sErro = 'Não Gravei o Arquivo' then
      begin
        WriteLn(F,sSQL);
      end;
    end;

  end;  // while not(qryTxt.EOF)

  if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
  if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;
  iContadorCommit := 0;

  Result := True;
end;













destructor TCtrlImportaFinanc.Destroy;
begin
  StrProcHistRubSal.Free;
  StrProcTmpDesc.Free;
  StrProcClasseRubricas.Free;
  StrProcTabErrosCcp.Free;

  DbTaberrosccp.Free;
  DbCtrlinterface.free;
  DbParaminterf.Free;
  DbClasserubricas.Free;
  DbRubricaxpess.Free;
  DbParamsal13.Free;
  DbHistRubSal.Free;
  DbTmpDesc.Free;

  SQLParam.Free;

  CtrlRegra.Free;

  FreeCds([FCdsCtrlInterface]);
  if isAppServer then
     FreeCds([FCdsCtrlInterface]);

  FreeCds([CdsTabErrosCcp]);
  if isAppServer then
     FreeCds([CdsTabErrosCcp]);


  FreeCds([CdsBuscaPessoa]);
  if isAppServer then
     FreeCds([CdsBuscaPessoa]);


  FreeCds([CdsBuscaRubrica]);
  if isAppServer then
     FreeCds([CdsBuscaRubrica]);

  FreeCds([CdsAux]);
  if isAppServer then
     FreeCds([CdsAux]);

  FreeCds([CdsLoop]);
  if isAppServer then
     FreeCds([CdsLoop]);

  FreeCds([CdsClasseRubricas]);
  if isAppServer then
     FreeCds([CdsClasseRubricas]);

  FreeCds([CdsHistRubSal]);
  if isAppServer then
     FreeCds([CdsHistRubSal]);

  FreeCds([CdsTmpDesc]);
  if isAppServer then
     FreeCds([CdsTmpDesc]);

  FreeCds([CdsPlanPatro]);
  if isAppServer then
     FreeCds([CdsPlanPatro]);

  FreeCds([CdsCalcContrib]);
  if isAppServer then
     FreeCds([CdsCalcContrib]);

  FreeCds([CdsSalPart]);
  if isAppServer then
     FreeCds([CdsSalPart]);

  inherited;



end;


procedure TCtrlImportaFinanc.OnCreateAppServer;
begin
  inherited;
  FCdsCtrlInterface := TCMClientDataSet.Create(nil);
  CdsTabErrosCcp :=   TCMClientDataSet.Create(nil);
  CdsBuscaPessoa :=   TCMClientDataSet.Create(nil);
  CdsBuscaRubrica :=   TCMClientDataSet.Create(nil);
  CdsAux :=  TCMClientDataSet.Create(nil);
  CdsLoop :=  TCMClientDataSet.Create(nil);
  CdsClasseRubricas :=  TCMClientDataSet.Create(nil);
  CdsHistRubSal :=  TCMClientDataSet.Create(nil);
  CdsTmpDesc :=  TCMClientDataSet.Create(nil);
  CdsPlanPatro :=  TCMClientDataSet.Create(nil);
  CdsSalPart :=  TCMClientDataSet.Create(nil);  




end;



procedure TCtrlImportaFinanc.AfterInitialize;
begin
  inherited;
  CtrlRegra.InitializeAs( Self );


  CdsTabErrosCcp.Data := GetDataPacket('SELECT * FROM TABERROSCCP WHERE  1 = 2');
  CdsClasseRubricas.Data := GetDataPacket('SELECT * FROM CLASSERUBRICAS WHERE  1 = 2');
  CdsHistRubSal.Data := GetDataPacket('SELECT * FROM HISTRUBSAL WHERE  1 = 2');
  CdsTmpDesc.Data := GetDataPacket('SELECT * FROM TMPDESC WHERE  1 = 2');

end;



procedure TCtrlImportaFinanc.DoChangeDataBase;
begin
  inherited;
  StrProcHistRubSal.DataBaseName := DataBaseName;
  StrProcTmpDesc.DataBaseName := DataBaseName;
  StrProcClasseRubricas.DataBaseName := DataBaseName;
  StrProcTabErrosCcp.DataBaseName := DataBaseName;

  DbTaberrosccp.DatabaseName := DataBaseName;
  DbCtrlinterface.DataBaseName := DataBaseName;
  DbParaminterf.DataBaseName := DataBaseName;
  DbClasserubricas.DataBaseName := DataBaseName;
  DbRubricaxpess.DataBaseName := DataBaseName;
  DbParamsal13.DataBaseName := DataBaseName;
  DbHistRubSal.DataBaseName := DataBaseName;
  DbTmpDesc.DataBaseName := DataBaseName;  

end;

function TCtrlImportaFinanc.ListaPatro : OleVariant;
begin


   with SQLparam do begin
      SQL.Clear;
      SQL.Add(' SELECT P.IDPESSOA, P.NOME, '+
           ' PT.FLGANO13,  PT.MASCMATRICULA , '+
           ' PT.IDRUBSALBENEFICIO,PT.IDREGRASALBENEFI, '+
           ' PT.IDRUBREMTOTAL,PT.IDREGRAREMTOTAL, '+
           ' PT.IDREGRACALCSALPA, PT.IDRUBSALPARTICIP, '+
           ' PT.IDRUBSALMANUT,  PT.IDRUBSALMANUTPARC,  PT.IDRUBSALAUXDOENCA '+
           ' FROM   PESSOA P, PATRO PT     '+
           ' WHERE  (PT.IDPESSOA = P.IDPESSOA) '+
           ' ORDER BY P.NOME');
   end;
   Result := SQLParam.Data;

end;



function TCtrlImportaFinanc.ListaPlano(iIdPessJur : Integer ) : OleVariant;
Var
  sSQL : String;
begin
  sSQL := 'SELECT '+
          '  P.IDPLANOPREV, P.NOME AS PLANO '+
          'FROM   '+
          '  PLANPREV P, PLANPREVPATRO PP '+
          'WHERE  '+
          '  PP.IDPESSJUR  = '+ IntToStr(iIdPessJur) +' AND '+
          '  P.IDPLANOPREV = PP.IDPLANOPREV '+
          'ORDER BY '+
          '  P.NOME ';
  SQLParam.SQL.Clear;
  SQLParam.SQL.Add(sSQL);

   Result := SQLParam.Data;
end;


function TCtrlImportaFinanc.VerificaImportAnterior(sMesCob, sIDpessjur : String) : OleVariant;
begin


   with SQLParam do begin
      SQL.Clear;
      SQL.Add('  SELECT 1 FROM HISTRUBSAL '+
              ' WHERE  MESCOBRANCA = '''+sMesCob+''' AND '+
              ' IDPESSJUR = '''+sIDPessjur+''' AND '+
              ' IDMODULO = 32 AND ROWNUM <= 1  ');
   end;
   Result := SQLParam.Data;

end;


function TCtrlImportaFinanc.VerificaTabErrosAnterior(sMesCob, sIDpessjur : String) : OleVariant;
begin


   with SQLParam do begin
      SQL.Clear;
      SQL.Add(' SELECT 1 FROM TABERROSCCP '+
              ' WHERE IDPESSJUR = '''+sIDPessjur+''' AND '+
              ' MESCOBRANCA = '''+sMesCob+''' ');
   end;
   Result := SQLParam.Data;

end;


function TCtrlImportaFinanc.DeletaTabErros(sMesCob, sIDpessjur : String) : Boolean;
begin
   ExecSQL(' DELETE TABERROSCCP WHERE MESCOBRANCA = '''+sMesCob+''' AND  '+
           ' IDPESSJUR = '+sIDPessjur+' ');
end;


function TCtrlImportaFinanc.VerificaExisteIda(sIDpessjur, sIDPlanoPrev : String) : OleVariant;
begin


   with SQLParam do begin
      SQL.Clear;
      SQL.Add(' SELECT 1 FROM   PLANPREVPATRO P, CONTPLANPATRO C, '+
         '  CONTPREV CT, CONTRIBUICAO CO '+
         '  WHERE  (C.IDPESSJUR = '''+sIDpessjur+''') ');
      if    sIDPlanoPrev  <> '' then
         SQL.Add('  AND (C.IDPLANOPREV = '''+sIDPlanoPrev+''') ')
      else SQL.Add('  AND (P.IDPLANOPREV = C.IDPLANOPREV ) ');

      SQL.Add(' AND (P.IDPESSJUR = C.IDPESSJUR) '+
         '  AND (P.IDPLANOPREV = C.IDPLANOPREV) '+
         '  AND (CT.IDPLANOPREV = C.IDPLANOPREV) '+
         '  AND (CT.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
         '  AND (CT.FLGINTERNO = ''AT'') '+         
         '  AND EXISTS (SELECT 1 FROM CONTRIBPREVPARTP '+
         '                WHERE IDPESSJUR = C.IDPESSJUR AND '+
         '                  IDPLANOPREV = C.IDPLANOPREV AND '+
         '                  IDCONTRIBUICAO = C.IDCONTRIBUICAO ) '+
         '  AND CO.IDCONTRIBUICAO = CT.IDCONTRIBUICAO  '+
         '  AND C.FLGTPVLR IN (''B'',''V'') ');
   end;
   Result := SQLParam.Data;

end;



function TCtrlImportaFinanc.VerificaExisteRecebOrigem(sIDpessjur, sIDPlanoPrev, sMesCob : String) : OleVariant;
begin

   with SQLParam do begin
      SQL.Clear;
      SQL.Add(' SELECT 1 FROM  TMPDESC '+
              ' WHERE MESCOBRANCA = '''+sMesCob+''' '+
              ' AND IDPESSJUR = '''+sIDpessjur+''' '+
              ' AND FLGDESCFOLHA    =  ''P'' '+
              ' AND SITENVIO = ''9'' ');
      if sIDPlanoPrev  <> '' then
         SQL.Add('  AND IDPLANOPREV = '''+sIDPlanoPrev+''') ');
   end;

   Result := SQLParam.Data;

end;



function TCtrlImportaFinanc.VerificaImportAnterior(sIDPessjur,sMesCob : String ; var sUltRubrica : String) : Boolean;
begin

   with SQLParam do begin
      SQL.Clear;
      SQL.Add(' SELECT MAX(CODPROVDESC) CODPROVDESC '+

              ' FROM HISTRUBSAL '+
              
              ' WHERE MESCOBRANCA = '''+sMesCob+''' '+
              ' AND IDPESSJUR = '''+sIDpessjur+''' '+
              ' AND IDMODULO = 32 ');
   end;

   cdsAux.Data := SQLParam.Data;

   if trim(cdsaux.FieldByName('CODPROVDESC').AsString) <> '' then
   begin
      result := True;
      sUltRubrica := cdsaux.FieldByName('CODPROVDESC').AsString;
   end
   else
   begin
      result := False;
      sUltRubrica := '';
   end;


end;




function TCtrlImportaFinanc.InsereLote(sMesCob, sIDpessjur, sDesc : String) : Integer;
begin
   DbCtrlinterface.Tipo.AsString  := 'P';
   DbCtrlinterface.Mesreferencia.AsString := sMesCob;
   DbCtrlinterface.Idpessoa.AsString := sIDPessjur;
   DbCtrlinterface.Descricao.AsString := sDesc;
   DbCtrlinterface.Flgatrasodevol.AsString := 'N';
   DbCtrlinterface.Flgpreparado.AsInteger := 1;
   DbCtrlinterface.Flgidatmp.AsInteger := 1;
   DbCtrlinterface.Flgvoltatmp.AsInteger := 1;
   DbCtrlinterface.Flgidainterface.AsInteger := 1;
   DbCtrlinterface.Flgvoltainterface.AsInteger := 1;
   DbCtrlinterface.Datapreparo.AsDateTime := Date;
   DbCtrlinterface.Dataidatmp.AsDateTime := Date;
   DbCtrlinterface.Datavoltatmp.AsDateTime := Date;
   DbCtrlinterface.Dataidainterface.AsDateTime := Date;
   DbCtrlinterface.Datavoltainterfa.AsDateTime := Date;
   DbCtrlinterface.Insert;

   Result := DbCtrlinterface.Idlote.AsInteger;
end;




function TCtrlImportaFinanc.ListaDadosLayOut(sIDPessjur : String) : OleVariant;
begin
   DbParaminterf.Idpessjur.AsString := sIDPessjur;
   Result := GetDataPacket(DbParaminterf.SSQLSelect);
end;


function TCtrlImportaFinanc.ExcluiClasseRubricas : Boolean;
begin
   DbClasserubricas.DeletaTodos;
end;


procedure TCtrlImportaFinanc.SelecionaCodRubricas(sidpessjur : String;
                                                  var iIdRubSalBenef,
                                                  iIdRubRemTotal,
                                                  iIdRubSalPart,
                                                  iIdRubSal13 : Integer;
                                                  iExercicio : Integer;
                                                  var sCodProvDescSalBenef,
                                                  sCodProvDescRemTotal,
                                                  sCodProvDescSalPart,
                                                  sCodProvDescSal13 : String;
                                                  var bCobra13 : Boolean );
begin

   if iIdRubSalBenef > 0 then
   begin
      DbRubricaxpess.IdPessoa.AsString := sIDPessjur;
      DbRubricaxpess.Idrubrica.AsInteger := iIdRubSalBenef;
      FCdsCtrlInterface.Data := GetDataPacket(DbRubricaxpess.SSQLSelect);
      sCodProvDescSalBenef := FCdsCtrlInterface.FieldByName('codprovdesc').AsString;
   end
   else
   begin
      iIdRubSalBenef := 0;
      sCodProvDescSalBenef := '';
   end;

   if iIdRubRemTotal > 0 then
   begin
      DbRubricaxpess.IdPessoa.AsString := sIDPessjur;
      DbRubricaxpess.Idrubrica.AsInteger:= iIdRubRemTotal;
      FCdsCtrlInterface.Data := GetDataPacket(DbRubricaxpess.SSQLSelect);
      sCodProvDescRemTotal := FCdsCtrlInterface.FieldByName('codprovdesc').AsString;
   end
   else
   begin
      iIdRubRemTotal := 0;
      sCodProvDescRemTotal := '';
   end;

   if iIdRubSalPart >  0 then
   begin
      DbRubricaxpess.IdPessoa.AsString := sIDPessjur;
      DbRubricaxpess.Idrubrica.AsInteger := iIdRubSalPart;
      FCdsCtrlInterface.Data := GetDataPacket(DbRubricaxpess.SSQLSelect);
      sCodProvDescSalPart := FCdsCtrlInterface.FieldByName('codprovdesc').AsString;
   end
   else
   begin
      iIdRubSalPart := 0;
      sCodProvDescSalPart := '';
   end;


   DbParamsal13.Mesreferencia.AsString := 'MESREFERENCIA ';
   DbParamsal13.Idpessjur.AsString := sIDPessjur;
   DbParamsal13.Exercicio.AsInteger := iExercicio;
   FCdsCtrlInterface.Data := GetDataPacket(DbParamsal13.SSQLSelect);

   if FCdsCtrlInterface.IsEmpty then
   begin
      iIdRubSal13 := 0;
      sCodProvDescSal13 := '';
   end
   else
   begin
      iIdRubSal13 := FCdsCtrlInterface.FieldByName('idrubrica').AsInteger;

      DbRubricaxpess.IdPessoa.AsString := sIDPessjur;
      DbRubricaxpess.Idrubrica.AsInteger := iIdRubSal13;
      FCdsCtrlInterface.Data := GetDataPacket(DbRubricaxpess.SSQLSelect);

      sCodProvDescSal13 := FCdsCtrlInterface.FieldByName('codprovdesc').AsString;

   end;



end;



procedure TCtrlImportaFinanc.SetCdsCtrlInterface(
  const Value: TCMClientDataSet);
begin
  FCdsCtrlInterface := Value;
end;



procedure TCtrlImportaFinanc.GravaErrosCCP(qryTxt : Twwquery;
                                     cdsDadosArquivo : TCMClientDataSet;
                                     var bad : TextFile;
                                     bMontaBad : Boolean;
                                     iIdControle : Integer;  sIDPessjur,
                                     sMsgExplicativa, sMatricula, sCodProvento, sDataRef : String;
                                     fValor: Real; sIDContribuicao, sMesCobranca,
                                     sNomePatro :String);
var sLinhaCrit : String;
begin

   StrProcTabErrosCcp.ParamByName('pIDCONTROLE').AsFloat := iIdControle;
   StrProcTabErrosCcp.ParamByName('pIDPESSJUR').AsFloat := StrToFloat(sIDPessjur);
   StrProcTabErrosCcp.ParamByName('pCODPROVENTO').AsString := sCodProvento;
   StrProcTabErrosCcp.ParamByName('pVALOR').AsFloat := fValor;
   StrProcTabErrosCcp.ParamByName('pNOMEPATROC').AsString := sNomePatro;
   StrProcTabErrosCcp.ParamByName('pMATRICULA').AsString := sMatricula;
   StrProcTabErrosCcp.ParamByName('pDATAREF').AsString := sDataRef;
   StrProcTabErrosCcp.ParamByName('pMSGEXPLICATIVA').AsString := sMsgExplicativa;
   StrProcTabErrosCcp.ParamByName('pMESCOBRANCA').AsString := sMesCobranca;
   StrProcTabErrosCcp.ParamByName('pIDCONTRIBUICAO').AsString := sIDContribuicao;

   try
      StrProcTabErrosCcp.ExecProc;
   except
   end;

   if (qryTxt.FieldCount > 1) And
      (bMontaBad) then
   begin
      sLinhaCrit := MontaLinhaArqBad(qryTxt, cdsDadosArquivo);
      WriteLn(bad,sLinhaCrit);
   end;

end;


function TCtrlImportaFinanc.ConvMes(sMes,sFormato,sIniAno:String):String;
var i : word;
begin

   sFormato := UpperCase(sFormato);
   for i := 1 to Length(sFormato) do
   begin
      if Copy(sFormato,i,1) = 'Y'
      then sFormato := Copy(sFormato, 1, i - 1)+'A'+Copy(sFormato, i+1, Length(sFormato) - i);
   end;
   sMes:=trim(sMes);
   Result:=sMes;
   if (sFormato = 'AAAA/MM')  then begin
      Result:=sMes;
   end else begin
      if sFormato = 'MM/AAAA' then begin
         Result:=copy(sMes,4,4)+'/'+copy(sMes,1,2);
      end else begin
         if sFormato = 'AAAAMM' then begin
            Result:=copy(sMes,1,4)+'/'+copy(sMes,5,2);
         end else begin
            if sFormato = 'MMAAAA' then begin
               Result:=copy(sMes,3,4)+'/'+copy(sMes,1,2);
            end else begin
               if sFormato = 'DD/MM/AAAA' then begin
                  Result:=copy(sMes,7,4)+'/'+copy(sMes,4,2);
               end else begin
                  if sFormato = 'AAAAMMDD' then begin
                     Result:=copy(sMes,1,4)+'/'+copy(sMes,5,2);
                  end else begin
                     if sFormato = 'DDMMAAAA' then begin
                        Result:=copy(sMes,5,4)+'/'+copy(sMes,3,2);
                     end else begin
                        if sFormato = 'AA/MM' then begin
                           Result:=sIniAno+copy(sMes,1,2)+'/'+copy(sMes,4,2);
                        end else begin
                           if sFormato = 'MM/AA' then begin
                              Result:=sIniAno+copy(sMes,4,2)+'/'+copy(sMes,1,2);
                           end else begin
                              if sFormato = 'AAMM' then begin
                                 Result:=sIniAno+copy(sMes,1,2)+'/'+copy(sMes,3,2);
                              end else begin
                                 if sFormato = 'MMAA' then begin
                                    Result:=sIniAno+copy(sMes,3,2)+'/'+copy(sMes,1,2);
                                 end else begin
                                    if sFormato = 'DD/MM/AA' then begin
                                       Result:=sIniAno+copy(sMes,7,2)+'/'+copy(sMes,4,2);
                                    end else begin
                                       if sFormato = 'AAMMDD' then begin
                                          Result:=sIniAno+copy(sMes,1,2)+'/'+copy(sMes,3,2);
                                       end else begin
                                          if sFormato = 'DDMMAA' then begin
                                             Result:=sIniAno+copy(sMes,5,2)+'/'+copy(sMes,3,2);
                                          end;
                                       end;
                                    end;
                                 end;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
//
end;


function TCtrlImportaFinanc.MontaLinhaArqBad(qryTxt : TwwQuery;
                                             cdsDadosArquivo : TCMClientDataset) : String;
var sLinha : String;
begin
   Result := '';
   sLinha := '';

   //linha em branco com tamanho de 200
   //para substituir com os valores em seus respectivos lugares
   sLinha := completastring(' ',' ',200,True);


   if cdsDadosArquivo.FieldByName('FLGLANCAMENTO').AsString = 'S' then begin
      if Trim(cdsDadosArquivo.FieldByName('POSLANCAMENTO').AsString) <> '1000' then begin
         sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('POSLANCAMENTO').AsInteger) +
                   completastring(qryTxt.FieldByName('LANCAMENTO').AsString,' ',1,True) +
                   copy(sLinha,cdsDadosArquivo.FieldByName('POSLANCAMENTO').AsInteger + 1 + 1,
                        length(sLinha) - cdsDadosArquivo.FieldByName('POSLANCAMENTO').AsInteger );
      end;
   end;


   if Trim(cdsDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INICIOSEQINTERFA').AsInteger) +
                completastring(qryTxt.FieldByName('SEQINTERFA').AsString,' ',cdsDadosArquivo.FieldByName('SEQINTERFA').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INICIOSEQINTERFA').AsInteger + cdsDadosArquivo.FieldByName('SEQINTERFA').AsInteger + 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INICIOSEQINTERFA').AsInteger );
   end;


   if Trim(cdsDadosArquivo.FieldByName('INIPATRO').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INIPATRO').AsInteger) +
                completastring(qryTxt.FieldByName('PATRO').AsString,' ',cdsDadosArquivo.FieldByName('PATRO').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INIPATRO').AsInteger + cdsDadosArquivo.FieldByName('PATRO').AsInteger + 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INIPATRO').AsInteger );
   end;


   if Trim(cdsDadosArquivo.FieldByName('INIPLANO').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INIPLANO').AsInteger) +
                completastring(qryTxt.FieldByName('IDPLANO').AsString,' ',cdsDadosArquivo.FieldByName('PLANO').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INIPLANO').AsInteger + cdsDadosArquivo.FieldByName('PLANO').AsInteger + 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INIPLANO').AsInteger );
   end;


   if Trim(cdsDadosArquivo.FieldByName('INIIDPESSOA').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INIIDPESSOA').AsInteger) +
                completastring(qryTxt.FieldByName('IDPESSOA').AsString,' ',cdsDadosArquivo.FieldByName('TAMIDPESSOA').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INIIDPESSOA').AsInteger + cdsDadosArquivo.FieldByName('TAMIDPESSOA').AsInteger + 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INIIDPESSOA').AsInteger );
   end;


   if Trim(cdsDadosArquivo.FieldByName('INIMESREF').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INIMESREF').AsInteger) +
                completastring(qryTxt.FieldByName('MESREF').AsString,' ',cdsDadosArquivo.FieldByName('MESREF').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INIMESREF').AsInteger +  cdsDadosArquivo.FieldByName('MESREF').AsInteger + 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INIMESREF').AsInteger );
   end;


   if Trim(cdsDadosArquivo.FieldByName('INIDATAREF').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INIDATAREF').AsInteger) +
                completastring(qryTxt.FieldByName('DATAREF').AsString,' ',cdsDadosArquivo.FieldByName('DATAREF').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INIDATAREF').AsInteger + cdsDadosArquivo.FieldByName('DATAREF').AsInteger + 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INIDATAREF').AsInteger );
   end;


   if Trim(cdsDadosArquivo.FieldByName('INIPROVENTO').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INIPROVENTO').AsInteger) +
                completastring(qryTxt.FieldByName('PROVENTO').AsString,' ',cdsDadosArquivo.FieldByName('PROVENTO').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INIPROVENTO').AsInteger + cdsDadosArquivo.FieldByName('PROVENTO').AsInteger + 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INIPROVENTO').AsInteger );
   end;


   if Trim(cdsDadosArquivo.FieldByName('INITIPOCHAVE').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INITIPOCHAVE').AsInteger) +
                completastring(qryTxt.FieldByName('TIPOCHAVE').AsString,' ',cdsDadosArquivo.FieldByName('TIPOCHAVE').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INITIPOCHAVE').AsInteger + cdsDadosArquivo.FieldByName('TIPOCHAVE').AsInteger + 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INITIPOCHAVE').AsInteger );
   end;


   if Trim(cdsDadosArquivo.FieldByName('INIVALORCHAVE').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INIVALORCHAVE').AsInteger) +
                completastring(qryTxt.FieldByName('VALORCHAVE').AsString,' ',cdsDadosArquivo.FieldByName('VALORCHAVE').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INIVALORCHAVE').AsInteger + cdsDadosArquivo.FieldByName('VALORCHAVE').AsInteger + 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INIVALORCHAVE').AsInteger );
   end;


   if Trim(cdsDadosArquivo.FieldByName('INIVALORPART').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INIVALORPART').AsInteger) +
                completastring(qryTxt.FieldByName('VALORPART').AsString,' ',cdsDadosArquivo.FieldByName('VALORPART').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INIVALORPART').AsInteger + cdsDadosArquivo.FieldByName('VALORPART').AsInteger + 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INIVALORPART').AsInteger );
   end;


   if Trim(cdsDadosArquivo.FieldByName('INIVALORPROVE').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,cdsDadosArquivo.FieldByName('INIVALORPROVE').AsInteger) +
                completastring(qryTxt.FieldByName('VALORPROVE').AsString,' ',cdsDadosArquivo.FieldByName('VALORPROVE').AsInteger,True) +
                copy(sLinha,cdsDadosArquivo.FieldByName('INIVALORPROVE').AsInteger + cdsDadosArquivo.FieldByName('VALORPROVE').AsInteger+ 1,
                     length(sLinha) - cdsDadosArquivo.FieldByName('INIVALORPROVE').AsInteger );
   end;


   Result := sLinha;


end;

function TCtrlImportaFinanc.ConvValor(cdsDadosArquivo : TCMClientDataSet ; sValor:String):String;

var sSvDec:Char;
    rValor:Double;
    iValDiv,xx:Integer;
    sValDiv:String;
    bValorNegativo : Boolean;
Begin
  sSvDec           := DecimalSeparator;

  bValorNegativo := False;

  while Pos('}', sValor) > 0 do
  begin
     sValor := Copy(sValor,1,Pos('}', sValor ) -1) + '0' +
               Copy(sValor,Pos('}', sValor ) +1 ,  length(sValor) - Pos('}', sValor ));
     bValorNegativo := True;
  end;

  while Pos('J', sValor) > 0 do
  begin
     sValor := Copy(sValor,1,Pos('J', sValor ) -1) + '1' +
               Copy(sValor,Pos('J', sValor ) +1 ,length(sValor) - Pos('J', sValor ));
     bValorNegativo := True;
  end;

  while Pos('K', sValor) > 0 do
  begin
     sValor := Copy(sValor,1,Pos('K', sValor ) -1) + '2' +
               Copy(sValor,Pos('K', sValor ) +1 ,length(sValor) - Pos('K', sValor ));
     bValorNegativo := True;
  end;

  while Pos('L', sValor) > 0 do
  begin
     sValor := Copy(sValor,1,Pos('L', sValor ) -1) + '3' +
               Copy(sValor,Pos('L', sValor ) +1 ,length(sValor) - Pos('L', sValor ));
     bValorNegativo := True;
  end;

  while Pos('M', sValor) > 0 do
  begin
     sValor := Copy(sValor,1,Pos('M', sValor ) -1) + '4' +
               Copy(sValor,Pos('M', sValor ) +1 ,length(sValor) - Pos('M', sValor ));
     bValorNegativo := True;
  end;

  while Pos('N', sValor) > 0 do
  begin
     sValor := Copy(sValor,1,Pos('N', sValor ) -1) + '5' +
               Copy(sValor,Pos('N', sValor ) +1 ,length(sValor) - Pos('N', sValor ));
     bValorNegativo := True;
  end;

  while Pos('O', sValor) > 0 do
  begin
     sValor := Copy(sValor,1,Pos('O', sValor ) -1) + '6' +
               Copy(sValor,Pos('O', sValor ) +1 ,length(sValor) - Pos('O', sValor ));
     bValorNegativo := True;
  end;

  while Pos('P', sValor) > 0 do
  begin
     sValor := Copy(sValor,1,Pos('P', sValor ) -1) + '7' +
               Copy(sValor,Pos('P', sValor ) +1 ,length(sValor) - Pos('P', sValor ));
     bValorNegativo := True;
  end;

  while Pos('Q', sValor) > 0 do
  begin
     sValor := Copy(sValor,1,Pos('Q', sValor ) -1) + '8' +
               Copy(sValor,Pos('Q', sValor ) +1 ,length(sValor) - Pos('Q', sValor ));
     bValorNegativo := True;
  end;

  while Pos('R', sValor) > 0 do
  begin
     sValor := Copy(sValor,1,Pos('R', sValor ) -1) + '9' +
               Copy(sValor,Pos('R', sValor ) +1 ,length(sValor) - Pos('R', sValor ));
     bValorNegativo := True;
  end;



  if cdsDadosArquivo.FieldByName('FLGTIPOSEPARADEC').AsString = 'P' then begin
     Result:=sValor;
  end else begin
     if cdsDadosArquivo.FieldByName('FLGTIPOSEPARADEC').AsString = 'V' then begin
        DecimalSeparator := ',';
        rValor:=StrToFloat(trim(sValor));
        DecimalSeparator := '.';
        Result:=FloatToStr(rValor);
     end else begin
        DecimalSeparator := '.';
        sValDiv:='1';
        for xx:=1 to cdsDadosArquivo.FieldByName('NUMCASASDEC').AsInteger do begin
           sValDiv := sValDiv + '0';
        end;
        iValDiv := StrToInt(sValDiv);
        rValor := StrToFloat(trim(sValor))/iValDiv;

        if bValorNegativo then
           Result :=FloatToStr(rValor * -1)
        else Result :=FloatToStr(rValor);

     end;
  end;
  Result:=Trim(Result);
  DecimalSeparator :=sSvDec;
end;

function TCtrlImportaFinanc.CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
var sResult : String;
    i ,iDif : Integer;
begin

   if  Length(trim(sEnt)) > nTam then
       sResult := copy(trim(sEnt),1,nTam)
   else
   begin
       iDif := abs(Length(trim(sEnt)) - nTam);
       sResult := trim(sEnt);

       if bDireita   then
       begin
          for i := 1 to iDif do
          sResult := sResult + sComp;
       end
       else
       begin
          for i := 1 to iDif do
          sResult := sComp + sResult;
       end;
   end;

   Result := sResult;

end;




function TCtrlImportaFinanc.GravaHistRubSal(qryTxt : TwwQuery;
                                     cdsDadosArquivo : TCMClientDataSet;
                                     var  bad : TextFile;
                                     bMontaBad  : Boolean;
                                     var mmDivergencias : TMemo; sIDPessjur, sMes, sMesCob, sIDPessoa,
                                     sSeqRubrica, sIDPlanoPrev,
                                     sProvento, sFlgSalPart , sFlgSalBenef ,
                                     sFlgSalRemTotal ,
                                     sFlgIrrf , sNomePatro  : String;
                                     fValor: Real;
                                     iIdRubrica : Integer;
                                     bVerHistRubSal : Boolean;
                                     sPrazo : String ) : Boolean;
begin
   result := False;

   if (trim(sIDPessjur) ='') or
      (trim(sIDPessoa) ='')  or
      (trim(sMes) ='')       or
      (iIdRubrica <= 0)      or
      (prmIdMotivoContrib <= 0 ) or
      (trim(sMesCob) = '')   or
      (trim(sSeqRubrica) = '')  then
   begin
      Result := True;
      Exit;
   end;


   StrProcHistRubSal.ParamByName('pIDPESSJUR').AsFloat := StrToFloat(sIDPessjur);
   StrProcHistRubSal.ParamByName('pIDPESSOA').AsFloat := StrToFloat(sIDPessoa);
   StrProcHistRubSal.ParamByName('pMES').AsString := sMes;
   StrProcHistRubSal.ParamByName('pIDRUBRICA').AsFloat := iIdRubrica;
   StrProcHistRubSal.ParamByName('pIDMOTIVO').AsFloat := prmIdMotivoContrib;

   try
      if ((trim(qryTxt.FieldByName('PARCELA').AsString) <> '000')
         and (trim(qryTxt.FieldByName('PARCELA').AsString) <> '')
         and (trim(qryTxt.FieldByName('PARCELA').AsString) <> '999'))
      then
      StrProcHistRubSal.ParamByName('pREFERENCIA').AsString := qryTxt.FieldByName('PARCELA').AsString
      else StrProcHistRubSal.ParamByName('pREFERENCIA').AsString := '***';
   except
      StrProcHistRubSal.ParamByName('pREFERENCIA').AsString := '***';
   end;


   StrProcHistRubSal.ParamByName('pMESCOBRANCA').AsString := sMesCob;
   StrProcHistRubSal.ParamByName('pSEQRUBRICA').AsFloat := StrToFloat(sSeqRubrica);
   StrProcHistRubSal.ParamByName('pIDPATRO').AsFloat := StrToFloat(sIDPessjur);
   StrProcHistRubSal.ParamByName('pCODPROVDESC').AsString := sProvento;
   StrProcHistRubSal.ParamByName('pVALORPROVENTO').AsFloat := fValor;
   StrProcHistRubSal.ParamByName('pFLGCOMPOESALPART').AsFloat := StrToFloat(sFlgSalPart);
   StrProcHistRubSal.ParamByName('pFLGCOMPOESALBENEF').AsFloat := StrToFloat(sFlgSalBenef);
   StrProcHistRubSal.ParamByName('pFLGCOMPOEREMTOTAL').AsFloat := StrToFloat(sFlgSalRemTotal);
   StrProcHistRubSal.ParamByName('pFLGIRRF').AsFloat := StrToFloat(sFlgIrrf);
   StrProcHistRubSal.ParamByName('pIDMODULO').AsFloat := 32;
   StrProcHistRubSal.ParamByName('pIDPLANOPREV').AsFloat := StrToFloat(sIDPlanoPrev);
   StrProcHistRubSal.ParamByName('pIDTITULAR').AsFloat := StrToFloat(sIDPessoa);
   if StrToFloat(sFlgSalBenef) = 1 then
      StrProcHistRubSal.ParamByName('pFLGSRB').AsFloat := 3
   else
      StrProcHistRubSal.ParamByName('pFLGSRB').AsFloat := 1;


   try
      if trim(qryTxt.FieldByName('EQUIPARA').AsString) = '' then
      StrProcHistRubSal.ParamByName('pFLGEQUIPARACAO').AsFloat := 0
      else StrProcHistRubSal.ParamByName('pFLGEQUIPARACAO').AsFloat := StrToFloat(qryTxt.FieldByName('EQUIPARA').AsString);
   except
      StrProcHistRubSal.ParamByName('pFLGEQUIPARACAO').AsFloat := 0;
   end;


   try
      StrProcHistRubSal.ExecProc;
   except
      GravaErrosCCP(qryTxt, cdsDadosArquivo,bad, bMontaBad, 8, sIDPessjur, 'Rubrica não gravada. Possível duplicação.',
                    qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                    sMes, fValor,'',sMesCob, sNomePatro);

   end;

   result := True;

end;




function TCtrlImportaFinanc.GravaClasseRubricas(sIDPessjur, sMes, sMesCob, sIDPessoa,
                                     sChave, sValorChave,
                                     sIDPlanoPrev, sIDContribuicao,  sProvento,
                                     sFlg13, sOrdemCalculo, sFlgAtrasoDevol,
                                     sDataRef : String;
                                     fValorRecebido: Real;
                                     iSeqInterface, iIdRubrica : Integer ) : Boolean;
begin

   result := False;


   StrProcClasseRubricas.ParamByName('pCODPATRO').AsFloat := StrToFloat(sIDPessjur);
   StrProcClasseRubricas.ParamByName('pIDPESSOA').AsFloat := StrToFloat(sIDPessoa);
   StrProcClasseRubricas.ParamByName('pMESREFERENCIA').AsString := sMes;
   StrProcClasseRubricas.ParamByName('pIDRUBRICA').AsFloat := iIdRubrica;
   StrProcClasseRubricas.ParamByName('pCODPROVDESC').AsString := sProvento;
   StrProcClasseRubricas.ParamByName('pVALORRECEBIDO').AsFloat := fValorRecebido;
   StrProcClasseRubricas.ParamByName('pMESCOBRANCA').AsString := sMesCob;
   StrProcClasseRubricas.ParamByName('pSEQINTERFACE').AsFloat := iSeqInterface;
   StrProcClasseRubricas.ParamByName('pCODPLANO').AsFloat := StrToFloat(sIDPlanoPrev);
   StrProcClasseRubricas.ParamByName('pFLG13').AsFloat := StrToFloat(sFlg13);
   StrProcClasseRubricas.ParamByName('pORDEMCALCULO').AsFloat := StrToFloat(sOrdemCalculo);
   StrProcClasseRubricas.ParamByName('pFLGATRASODEVOL').AsString := sFlgAtrasoDevol;
   StrProcClasseRubricas.ParamByName('pIDCONTRIBUICAO').AsFloat := StrToFloat(sIDContribuicao);
   StrProcClasseRubricas.ParamByName('pDATAREFERENCIA').AsDateTime := StrToDate(sDataRef);
   StrProcClasseRubricas.ParamByName('pCHAVE').AsString := sChave;
   StrProcClasseRubricas.ParamByName('pVALORCHAVE').AsString := sValorChave;
   try
      StrProcClasseRubricas.ExecProc;
   except
      exit;
   end;
   result := True;
end;



function TCtrlImportaFinanc.GravaTmpDesc(sIDPessjur        : String;
                                         sMes              : String;
                                         sMesCob           : String;
                                         sIDPessoa         : String;
                                         sChave            : String;
                                         sValorChave       : String;
                                         sIDPlanoPrev      : String;
                                         sIDContribuicao   : String;
                                         sProvento         : String;
                                         sFlgAtrasoDevol   : String;
                                         sDataRef          : String;
                                         fValorEsperado    : Real;
                                         fValorRecebido    : Real;
                                         iIdLote           : Integer;
                                         iIdRubrica        : Integer;
                                         fValorBase1       : Real    // Renato Visoni SOL 111730	KINTANA 515538
                                        ): Boolean;
var
  iNumRecebimento : Integer;
begin
   Result := False;

   StrProcTmpDesc.ParamByName('pIDLOTE').AsFloat                              := iIdLote;
   StrProcTmpDesc.ParamByName('pIDFUNDACAO').AsFloat                          := iIdFundacaoAtual;
   StrProcTmpDesc.ParamByName('pIDPESSJUR').AsFloat                           := StrToFloat(sIDPessjur);
   StrProcTmpDesc.ParamByName('pIDPLANOPREV').AsFloat                         := StrToFloat(sIDPlanoPrev);
   StrProcTmpDesc.ParamByName('pIDTITULAR').AsFloat                           := StrToFloat(sIDPessoa);
   StrProcTmpDesc.ParamByName('pIDPESSOA').AsFloat                            := StrToFloat(sIDPessoa);

   StrProcTmpDesc.ParamByName('pFLGATRASODEVOL').AsString                     := sFlgAtrasoDevol;

   if (sFlgAtrasoDevol = 'A') and (prmIdMotivoContribAtraso > 0) then
      StrProcTmpDesc.ParamByName('pIDMOTIVO').AsFloat                         := prmIdMotivoContribAtraso
   else if (sFlgAtrasoDevol = 'D') and (prmIdMotivoContribDevoluc > 0) then
      StrProcTmpDesc.ParamByName('pIDMOTIVO').AsFloat                         := prmIdMotivoContribDevoluc
   else StrProcTmpDesc.ParamByName('pIDMOTIVO').AsFloat                       := prmIdMotivoContrib;

   StrProcTmpDesc.ParamByName('pIDDESCONTO').AsFloat                          := StrToFloat(sIDContribuicao);
   StrProcTmpDesc.ParamByName('pIDPROVENTO').AsFloat                          := iIdRubrica;
   StrProcTmpDesc.ParamByName('pCODPROVDESC').AsString                        := sProvento;
   StrProcTmpDesc.ParamByName('pMESREFERENCIA').AsString                      := sMes;
   StrProcTmpDesc.ParamByName('pMESCOBRANCA').AsString                        := sMesCob;
   StrProcTmpDesc.ParamByName('pFLGTIPODESC').AsString                        := sChave;
   StrProcTmpDesc.ParamByName('pVALOR').AsFloat                               := fValorEsperado;
   StrProcTmpDesc.ParamByName('pVALORRECEBIDO').AsFloat                       := fValorRecebido;
   StrProcTmpDesc.ParamByName('pDATACOBRANCA').AsDateTime                     := StrToDate(sDataRef);
   StrProcTmpDesc.ParamByName('pDATARECEBIMENTO').AsDateTime                  := StrToDate(sDataRef);
   StrProcTmpDesc.ParamByName('pDATAREFERENCIA').AsDateTime                   := StrToDate(sDataRef);
   StrProcTmpDesc.ParamByName('pDESCRICAO').AsString                          := 'Contrib. desc. folha '+sValorChave;
   StrProcTmpDesc.ParamByName('pMATRICULA').AsString                          := sValorChave;

   if FormatFloat('0.00',fValorRecebido) <> FormatFloat('0.00', fValorEsperado)
   then StrProcTmpDesc.ParamByName('pSITENVIO').AsString                      := '1'
   else StrProcTmpDesc.ParamByName('pSITENVIO').AsString                      := '2';

   StrProcTmpDesc.ParamByName('pNODOCUMENTO').AsFloat                         := iNumRecebimento;
   StrProcTmpDesc.ParamByName('pCOMPLDOCUMENTO').AsString                     := copy(sMes, 6, 2);
   StrProcTmpDesc.ParamByName('pIDFAVORECIDO').AsFloat                        := StrToFloat(sIDPessoa);
   StrProcTmpDesc.ParamByName('pIDEMPCOBRANCA').AsFloat                       := StrToFloat(sIDPessJur);

   StrProcTmpDesc.ParamByName('pVALORBASE1').AsFloat                          := fValorBase1; // Renato Visoni SOL 111730	KINTANA 515538

   try
      StrProcTmpDesc.ExecProc;
   except
      Exit;
   end;

   result := True;
end;



function TCtrlImportaFinanc.GravaSalarios(qryTxt : TwwQuery;
                               cdsDadosArquivo : TCMClientDataSet;
                               var F , bad: TextFile;
                               mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sIDPlanoPrev,  sMesRef , sMesRef13,sMesCobGr,
                               sCodProvDescSalPart, sCodProvDescSal13 : String;
                               iIdRubSalBenef, iIdRubRemTotal,
                               iIdRubSalPart, iIdRubSal13 : Integer) : Boolean;
var x, iRubrica   : Integer;
    sProvento, sErro, sSQL, sValorProve,
    sFlgSalPart,  sFlgSalBenef, sFlgRemTotal, sFlgIrrf  : String;

begin

   Result := False;

   try
      cdsHistRubSal.Close;
      CdsHistRubSal.Data := GetDataPacket('SELECT * FROM HISTRUBSAL WHERE  1 = 2');
   except end;


   if (cdsDadosArquivo.FieldByName('FLGCALCSALPART').AsString <> 'C') then
   begin
      Result := True;
      exit;
   end;

   for x:=1 to 2 do begin
      if (x=2) and (trim(sCodProvDescSal13) <> '') then
      begin
         sErro:='Participação do 13o.';
         lbMensagens.Lines.Add(TimeToStr(Time)+' - Gravando o Salário Participação do 13o. salário');

         sSQL:='SELECT H.IDPESSOA,0 as PARTICIPANTE, H.IDPLANOPREV, ' +
               'SUM(DECODE(NVL(P.FLGDESCONTO,0),1,(H.VALORPROVENTO*-1),H.VALORPROVENTO)) AS VALOR '+
               'FROM HISTRUBSAL H,PROVDESC P, RUBRICAXPESS RP  WHERE (H.MES = '''+sMesRef+''') '+
               ' AND (H.IDPESSJUR = '+sIDPessjur+') ';

               if sIDPlanoPrev <> '' then
                  sSQL:=  sSQL+' AND (H.IDPLANOPREV = '+sIDPlanoPrev+') '
               else
                  sSQL:=  sSQL+' AND (H.IDPLANOPREV = H.IDPLANOPREV) ';

               sSQL:=  sSQL+' AND (P.IDPROVENTO = H.IDRUBRICA) '+
               ' AND (nvl(P.FLGDECIMOTERCEIRO,0) = 1) '+
               ' GROUP BY H.IDPESSOA, H.IDPLANOPREV ';
          iRubrica :=iIdRubSal13;
          sProvento:=sCodProvDescSal13;
      end
      else  if (x=1) and (trim(sCodProvDescSalPart) <> '') then
      begin
         sErro:='Participação';
         sSQL:='SELECT H.IDPESSOA,NVL(PPP.IDPESSOA,0) AS PARTICIPANTE, H.IDPLANOPREV, ' +
               'SUM(DECODE(NVL(P.FLGDESCONTO,0),1,(H.VALORPROVENTO*-1),H.VALORPROVENTO)) AS VALOR ' +
               'FROM HISTRUBSAL H, PARTPREVPLAN PPP, PROVDESC P  ' +
               'WHERE (H.MES = '''+sMesRef+''') '+
               'AND (H.IDPESSJUR = '+sIDPessjur+')  ';

               if sIDPlanoPrev <> '' then
                  sSQL:=  sSQL+' AND (H.IDPLANOPREV = '+sIDPlanoPrev+') '
               else
                  sSQL:=  sSQL+' AND (H.IDPLANOPREV = H.IDPLANOPREV) ';

               sSQL:=  sSQL+'AND (H.FLGCOMPOESALPART = 1) '+
               'AND (PPP.IDPESSJUR(+) = H.IDPESSJUR) ' +
               'AND (PPP.IDPESSOA(+) = H.IDPESSOA) ' +
               'AND (PPP.IDPLANOPREV = H.IDPLANOPREV) ' +
               'AND (P.IDPROVENTO = H.IDRUBRICA) ' +
               ' AND (nvl(P.FLGDECIMOTERCEIRO,0) = 0) '+
               'GROUP BY H.IDPESSOA,NVL(PPP.IDPESSOA,0), H.IDPLANOPREV';
         iRubrica :=iIdRubSalPart;
         sProvento:=sCodProvDescSalPart;
      end;


      lbMensagens.Lines.Add(TimeToStr(Time)+' - Calculando Salário '+sErro);
      Application.ProcessMessages;


      cdsBuscaRubrica.Data := GetDataPacket(' SELECT   FLGIRRF,FLGCOMPOEREMTOTAL, '+
                                             '  FLGCOMPOESALPART, FLGCOMPOESALBENEF '+
                                             '  FROM  PROVDESC WHERE IDPROVENTO = '+IntToStr(iRubrica)+' ');

      sFlgSalPart := cdsBuscaRubrica.FieldByName('FLGCOMPOESALPART').AsString;
      sFlgSalBenef := cdsBuscaRubrica.FieldByName('FLGCOMPOESALBENEF').AsString;
      sFlgRemTotal := cdsBuscaRubrica.FieldByName('FLGCOMPOEREMTOTAL').AsString;
      sFlgIrrf := cdsBuscaRubrica.FieldByName('FLGIRRF').AsString;



      cdsAux.Data := GetDataPacket(sSQL);



      try
         if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;
         cdsAux.First;

         iContadorCommit := 0;
         while not cdsAux.EOF do begin
            sValorProve      :=FloatToStr(cdsAux.FieldByName('VALOR').AsFloat);


            if  (iRubrica > 0) then
            begin

               if not GravaHistRubSal(qryTxt, cdsDadosArquivo,bad, False,
                               mmDivergencias,sIDPessjur, sMesRef, sMesCobGr,
                               cdsAux.FieldByName('idpessoa').AsString,
                               '01' {sSeqRubrica},
                               cdsAux.FieldByName('idplanoprev').AsString,
                               trim(sProvento),
                               sFlgSalPart,
                               sFlgSalBenef,
                               sFlgRemTotal,
                               sFlgIrrf , sNomePatro,
                               StrToFloat(ClienteNumero(sValorProve)),
                               iRubrica, bCritHistRubSal, '' )
               then begin
                  WriteLn(F,'Não gravou o Cálculo do Salário Participação do Participante '+trim(cdsAux.FieldByName('IDPESSOA').AsString)+' no Histórico.');
               end;
            end;


            if x = 1 then begin // atualiza o salário participação
               if StrToFloat(clientenumero(sValorProve)) > 0.00 then begin
                  if not ExecSQL(' UPDATE PARTPREVPLAN PP '+
                                 '  SET    PP.SALPARTICIPACAO = '+OraNumero(sValorProve)+' '+
                                 '  WHERE (PP.IDPESSJUR = '+sIDPessjur+' ) '+
                                 '  AND   (PP.IDPLANOPREV = '+cdsAux.FieldByName('idplanoprev').AsString+') '+
                                 '  AND   (PP.IDPESSOA = '+cdsAux.FieldByName('idpessoa').AsString+') ')

                  then begin
                     lbMensagens.Lines.Add(TimeToStr(Time)+' - Erro atualização do Salário Participação - Processo abortado...');
                     memErros.Lines.Add('Erro atualização do Salário Participação - ... ');
                     lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
                     RollBackTransacao;
                     exit;
                     WriteLn(F,'Não atualizou o Salário Participação '+sErro);
                  end;
                  AlimentaListaTotSalarios(cdsAux.FieldByName('idplanoprev').AsString,
                                           StrToFloat(ClienteNumero(sValorProve)), False);

               end;
            end;

            if x = 2 then begin  // atualiza a remuneracao total
               if StrToFloat(clientenumero(sValorProve)) > 0.00 then begin
                  if not ExecSQL(' UPDATE PARTPREVPLAN PP '+
                                 '  SET    PP.SALPARTIC13 = '+OraNumero(sValorProve)+' '+
                                 '  WHERE (PP.IDPESSJUR = '+sIDPessjur+' ) '+
                                 '  AND   (PP.IDPLANOPREV = '+cdsAux.FieldByName('idplanoprev').AsString+') '+
                                 '  AND   (PP.IDPESSOA = '+cdsAux.FieldByName('idpessoa').AsString+') ')

                  then begin
                     memErros.Lines.Add('Erro atualização da Remuneração Total... ');
                     lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
                     RollBackTransacao;
                     exit;
                     WriteLn(F,'Não atualizou o Remuneração Total '+sErro);
                  end;
                  AlimentaListaTotSalarios(cdsAux.FieldByName('idplanoprev').AsString,
                                           StrToFloat(ClienteNumero(sValorProve)), True);
               end;
            end;

            cdsAux.Next;

            inc(iContadorCommit);
            if iContadorCommit > NumMaxRegSemCommit then
            begin
               if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
               if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;
               iContadorCommit := 0;
            end;

         end;
         CommitTransacao;
      except
         lbMensagens.Lines.Add(TimeToStr(Time)+' - Erro atualização do Salário Participação - Processo abortado...');
         memErros.Lines.Add('Erro atualização do Salário Participação - ... ');
         WriteLn(F,'Não atualizou o Salário Participação '+sErro);
         lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
         RollBackTransacao;
         exit;
      end;
   end; //FOR

   Result := True;

end;


function TCtrlImportaFinanc.GravaContribuicoes(qryTxt : TwwQuery;
                               cdsDadosArquivo : TCMClientDataSet;
                               var F : TextFile;
                               mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sMesRefGr, sMesRef13,sMesCobGr, sDataRef, sDataCob, sNomePatro : String;
                               cmSQLCalcContrib : TCMSQLParams;
                               iIdLote : Integer ) : Boolean;
var
  bErro : boolean;
  sSQLAtualiza : string;

  badAux : TextFile;
  
  sMesAux : String;


begin


  SQLParam.SQL.Text := ' SELECT P.IDPESSJUR,P.IDPLANOPREV, '+
            '  C.FLGTPVLR,C.IDCONTRIBUICAO, CT.ORDEMCALCULO,  CO.NOME '+
            '  FROM   PLANPREVPATRO P, CONTPLANPATRO C, '+
            '  CONTPREV CT, CONTRIBUICAO CO '+
            '  WHERE  (C.IDPESSJUR = '''+sIDPessjur+''') ';
            if    sIDPlanoprev  <> '' then
               SQLParam.SQL.Text :=  SQLParam.SQL.Text +'  AND (C.IDPLANOPREV = '''+sIDPlanoPrev+''') ';
            SQLParam.SQL.Text :=  SQLParam.SQL.Text +'  AND (P.IDPLANOPREV = C.IDPLANOPREV ) '+
            '  AND (P.IDPESSJUR = C.IDPESSJUR) '+
            '  AND (P.IDPLANOPREV = C.IDPLANOPREV) '+
            '  AND (CT.IDPLANOPREV = C.IDPLANOPREV) '+
            '  AND (CT.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
            '  AND EXISTS (SELECT 1 FROM CONTRIBPREVPARTP '+
            '                WHERE IDPESSJUR = C.IDPESSJUR AND '+
            '                  IDPLANOPREV = C.IDPLANOPREV AND '+
            '                  IDCONTRIBUICAO = C.IDCONTRIBUICAO ) '+
            '  AND EXISTS (SELECT 1 FROM CLASSERUBRICAS CL '+
            '              WHERE CL.CODPATRO = P.IDPESSJUR AND '+
            '              CL.CODPLANO = P.IDPLANOPREV AND '+
            '              CL.IDCONTRIBUICAO = CO.IDCONTRIBUICAO )   '+
            '  AND CO.IDCONTRIBUICAO = CT.IDCONTRIBUICAO  '+
            '  ORDER BY P.IDPLANOPREV, CT.ORDEMCALCULO ';

  cdsPlanPatro.Data := SQLParam.Data;
  //


  cdsPlanPatro.First;
  while not cdsPlanPatro.EOF do
  begin
  


    lbMensagens.Lines.Add(TimeToStr(Time)+' - Calculando '+cdsPlanPatro.FieldByName('NOME').AsString+'');
    Application.ProcessMessages;



    //verifica se atualiza a contribuição associada 1
    SQLParam.SQL.Text := ' SELECT CP.IDCONTRIBUICAO    FROM   CONTPREV CP '+
                   ' WHERE CP.IDCONTRIBPAI = '''+cdsPlanPatro.FieldByName('IdContribuicao').AsString+'''  '+
                   ' AND CP.IDPLANOPREV = '''+cdsPlanPatro.FieldByName('IdPlanoPrev').AsString+'''  ';
    cdsAux.Data := SQLParam.Data;
    bAtualizaContribPai := not cdsAux.IsEmpty;


    //verifica se atualiza a contribuição associada 1
    SQLParam.SQL.Text := ' SELECT CP.IDCONTRIBUICAO    FROM   CONTPREV CP '+
                   ' WHERE CP.IDCONTRIBPAI2 = '''+cdsPlanPatro.FieldByName('IdContribuicao').AsString+'''  '+
                   ' AND CP.IDPLANOPREV = '''+cdsPlanPatro.FieldByName('IdPlanoPrev').AsString+'''  ';
    cdsAux.Data := SQLParam.Data;
    bAtualizaContribPai2 := not cdsAux.IsEmpty;


    //verifica se atualiza a contribuição associada 1
    SQLParam.SQL.Text := ' SELECT CP.IDCONTRIBUICAO    FROM   CONTPREV CP '+
                   ' WHERE CP.IDCONTRIBPAI3 = '''+cdsPlanPatro.FieldByName('IdContribuicao').AsString+'''  '+
                   ' AND CP.IDPLANOPREV = '''+cdsPlanPatro.FieldByName('IdPlanoPrev').AsString+'''  ';
    cdsAux.Data := SQLParam.Data;;
    bAtualizaContribPai3 := not cdsaux.IsEmpty;



    //

    cmSQLCalcContrib.Prepare;
    cmSQLCalcContrib.ParamByName('pDataRef').AsString     := sDataRef;
    cmSQLCalcContrib.ParamByName('pMesCob').AsString     :=  sMesCobGr;
    cmSQLCalcContrib.ParamByName('pIdPessJur').AsString      := sIDPessjur;
    cmSQLCalcContrib.ParamByName('pIdPlanoPrev').AsInteger    := cdsPlanPatro.FieldByName('IdPlanoPrev').AsInteger;
    cmSQLCalcContrib.ParamByName('pIdContribuicao').AsInteger  := cdsPlanPatro.FieldByName('IdContribuicao').AsInteger;
    cmSQLCalcContrib.ParamByName('pSeqProposta').AsInteger    := 1;
    
    cdsCalcContrib.Data := cmSQLCalcContrib.Data;


    if cdsCalcContrib.IsEmpty then
    begin
       cdsPlanPatro.Next;
       Continue;
    end;


    // Carrega dados e parametros para o ctrlRegra
    CtrlRegra.CopiaData( cdsCalcContrib.Data );
    CtrlRegra.GravaCalculo := False;
    CtrlRegra.ReloadRule   := False;
    CtrlRegra.OnGetResult  := OnResultRegra;

    //inicia variáveis usadas no GetResult
    sDataCobRegra :=  sDataCob;
    sNomePatroRegra := sNomePatro;
    sDataRefRegra := sDataRef;
    iIdLoteRegra := iIdLote;


    //se for enviado a bse , então recalcular as contribuições na volta
    if  (cdsPlanPatro.FieldByName('flgtpvlr').AsString = 'B')
    then begin

       if trim(cdsCalcContrib.FieldByName('IDREGRACALCULO').AsString) <> '' then
       begin
          CtrlRegra.RuleNumber  := cdsCalcContrib.FieldByName('IDREGRACALCULO').AsString;
          CtrlRegra.Execute;
          if (CtrlRegra.Error) or (CtrlRegra.bFinalizarRegra)
          then WriteLn(F,'Erro na execução da regra ' + cdsCalcContrib.FieldByName('IDREGRACALCULO').AsString +
                          ' - Participante: ' + cdsCalcContrib.FieldByName('MATRICULA').AsString);

       end;

    end
    else//não é feito o envio, ou há envio de valor
        //atualizar valor recebido
    begin
        cdsCalcContrib.First;
        while not cdsCalcContrib.EOF do
        begin
           try
              if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' 
              then begin
                 sSQLAtualiza := ' UPDATE TMPDESC SET VALORRECEBIDO = NVL(VALORRECEBIDO,0) + '+OraNumero(floattostr(cdsCalcContrib.FieldByName('VALORRECEBIDO').AsFloat))+' , '+
                                 ' DATARECEBIMENTO = TO_DATE('''+sDataCob+''',''DD/MM/YYYY''),  '+
                                 ' VALOR = VALOR + '+OraNumero(floattostr(cdsCalcContrib.FieldByName('VALORRECEBIDO').AsFloat))+' ,'+
                                 ' VALORBASE1 = '+OraNumero(floattostr(cdsCalcContrib.FieldByName('VALORBASE1').AsFloat))+' ,'+// Renato Visoni SOL 111730	KINTANA 515538
                                 ' SITENVIO = ''2'' , '+
                                 ' FLGDESCFOLHA = ''P'' '+
                                 ' WHERE IDPESSOA = '+IntToStr(cdsCalcContrib.FieldByName('IDPESSOA').AsInteger)+' AND '+
                                 ' IDPESSJUR = '+ IntToStr(cdsCalcContrib.FieldByName('IDPESSJUR').AsInteger)+' AND '+
                                 ' MESREFERENCIA = '+ '''' + cdsCalcContrib.FieldByName('MESREFERENCIA').AsString + '''' +' AND '+
                                 ' MESCOBRANCA   = '+ '''' + cdsCalcContrib.FieldByName('MESCOBRANCA').AsString + '''' +' AND '+
                                 ' IDDESCONTO   = '+ '''' + cdsCalcContrib.FieldByName('IDCONTRIBUICAO').AsString + '''' +' AND '+
                                 ' IDPROVENTO   = '+ IntToStr(cdsCalcContrib.FieldByName('IDRUBRICA').AsInteger);
              end
              else begin
                 sSQLAtualiza := ' UPDATE TMPDESC SET VALORRECEBIDO = '+OraNumero(floattostr(cdsCalcContrib.FieldByName('VALORRECEBIDO').AsFloat))+' , '+
                                 ' DATARECEBIMENTO = TO_DATE('''+sDataCob+''',''DD/MM/YYYY''),  '+
                                 ' VALOR = '+OraNumero(floattostr(cdsCalcContrib.FieldByName('VALORRECEBIDO').AsFloat))+' ,'+
                                 ' VALORBASE1 = '+OraNumero(floattostr(cdsCalcContrib.FieldByName('VALORBASE1').AsFloat))+' ,'+// Renato Visoni SOL 111730	KINTANA 515538
                                 ' SITENVIO = ''2'' , '+
                                 ' FLGDESCFOLHA = ''P'' '+
                                 ' WHERE IDPESSOA = '+IntToStr(cdsCalcContrib.FieldByName('IDPESSOA').AsInteger)+' AND '+
                                 ' IDPESSJUR = '+ IntToStr(cdsCalcContrib.FieldByName('IDPESSJUR').AsInteger)+' AND '+
                                 ' MESREFERENCIA = '+ '''' + cdsCalcContrib.FieldByName('MESREFERENCIA').AsString + '''' +' AND '+
                                 ' MESCOBRANCA   = '+ '''' + cdsCalcContrib.FieldByName('MESCOBRANCA').AsString + '''' +' AND '+
                                 ' IDDESCONTO   = '+ '''' + cdsCalcContrib.FieldByName('IDCONTRIBUICAO').AsString + '''' +' AND '+
                                 ' IDPROVENTO   = '+ IntToStr(cdsCalcContrib.FieldByName('IDRUBRICA').AsInteger);
              end;

              if not ExecSQL(sSQLAtualiza, True) then
              begin


                 if not GravaTmpDesc(sIDPessjur, sMesAux, sMesCobGr,
                     cdsCalcContrib.FieldByName('idpessoa').AsString,
                     'P',
                     cdsCalcContrib.FieldByName('matricula').AsString,
                     cdsCalcContrib.FieldByName('idplanoprev').AsString,
                     cdsCalcContrib.FieldByName('idcontribuicao').AsString,
                     cdsCalcContrib.FieldByName('codprovdesc').AsString,
                     cdsCalcContrib.FieldByName('flgatrasodevol').AsString,
                     sDataRef ,
                     cdsCalcContrib.FieldByName('valorrecebido').AsFloat,
                     cdsCalcContrib.FieldByName('valorrecebido').AsFloat,
                     iIdLote,
                     cdsCalcContrib.FieldByName('idrubrica').AsInteger,
                     cdsCalcContrib.FieldByName('ValorBase1').AsFloat) //Renato Visoni SOL 111730	KINTANA 515538
                 then
                 begin

                    GravaErrosCCP(qryTxt, cdsDadosArquivo, badaux, False,
                                  7, cdsCalcContrib.FieldByName('IDPESSJUR').AsString,
                                  'Erro na gravação da Contribuição.',
                                  cdsCalcContrib.FieldByName('MATRICULA').AsString,
                                  cdsCalcContrib.FieldByName('CODPROVDESC').AsString,
                                  sDataRef,
                                  cdsCalcContrib.FieldByName('ValorRecebido').AsFloat,
                                  cdsCalcContrib.FieldByName('IDCONTRIBUICAO').AsString,
                                  cdsCalcContrib.FieldByName('MESCOBRANCA').AsString,
                                  sNomePatro);

                 end;
              end;

           except
              GravaErrosCCP(qryTxt, cdsDadosArquivo, badaux, False,
                            7, cdsCalcContrib.FieldByName('IDPESSJUR').AsString,
                            'Erro na gravação da Contribuição.',
                            cdsCalcContrib.FieldByName('MATRICULA').AsString,
                            cdsCalcContrib.FieldByName('CODPROVDESC').AsString,
                            sDataRef,
                            cdsCalcContrib.FieldByName('ValorRecebido').AsFloat,
                            cdsCalcContrib.FieldByName('IDCONTRIBUICAO').AsString,
                            cdsCalcContrib.FieldByName('MESCOBRANCA').AsString,
                            sNomePatro);
           end;

           cdsCalcContrib.Next;
        end;
    end;

    cdsPlanPatro.Next;
  end;
  cdsPlanPatro.close;
  cdsCalcContrib.Close;
end; //gravacontribuições


procedure TCtrlImportaFinanc.OnResultRegra;
var fResult : Extended;
  sSQLAtualiza  : string;
  rFaltaAbater  : real;
  badAux : TextFile;
  qryaux: TwwQuery;
  cdsAux : TCMClientDataSet;
  iContadorCommit : Integer;
begin
   inherited;
   inc(iContadorCommit);


   if CtrlRegra.ClientDataSetIn.FieldByName('FLGATRASODEVOL').AsString <> 'N'
   then begin
      sSQLAtualiza := ' UPDATE TMPDESC SET   '+
                      ' IDPROVENTO = '+IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IDRUBRICA').AsInteger)+', '+
                      ' CODPROVDESC= '''+CtrlRegra.ClientDataSetIn.FieldByName('CodProvDesc').AsString+''', '+
                      ' FLGDESCFOLHA = ''P'' , '+
                      ' SITENVIO = DECODE(VALOR,'+OraNumero(CtrlRegra.ClientDataSetIn.FieldByName('VALORRECEBIDO').AsString)+','+''''+'2'+''''+','+''''+'1'+''''+') , '+
                      ' DATARECEBIMENTO = TO_DATE('''+sDataCobRegra+''',''DD/MM/YYYY'') , VALORRECEBIDO = ' + OraNumero(floattostr(CtrlRegra.ClientDataSetIn.FieldByName('VALORRECEBIDO').AsFloat))  +
                      ' WHERE IDPESSJUR    = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdPessjur').AsInteger)+
                      ' AND   IDPLANOPREV  = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdPlanoPrev').AsInteger)+
                      ' AND   IDPESSOA     = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdPessoa').AsInteger)+
                      ' AND   IDDESCONTO   = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdContribuicao').AsInteger)+
                      ' AND   MESCOBRANCA  = '+ ''''+CtrlRegra.ClientDataSetIn.FieldByName('mescobranca').AsString+''''+
                      ' AND   MESREFERENCIA= '''+CtrlRegra.ClientDataSetIn.FieldByName('MESREFERENCIA').AsString+''' '+
                      ' AND   VALOR        = ' + OraNumero(floattostr(CtrlRegra.ClientDataSetIn.FieldByName('VALORRECEBIDO').AsFloat)+
                      ' AND   FLGATRASODEVOL = '''+CtrlRegra.ClientDataSetIn.FieldByName('FLGATRASODEVOL').AsString+''' ');

      // Se não encontrou valor igual ao recebido então
      // Sendo uma rubrica de atraso/devolucao, fazer o DESMEMBRAMENTO DA RUBRICA, pois pode
      // ter vindo em uma única rubrica a cobranca de um atraso/devolucao de vários meses
      if not ExecSQL(sSQLAtualiza,True)
      then begin


         SQLParam.SQL.Text := ' SELECT T.IDDESCONTO, T.MESREFERENCIA, T.MESCOBRANCA, '+
                              ' T.IDMOTIVO, T.VALOR, T.VALORRECEBIDO '+
                              ' FROM   TMPDESC T '+
                              ' WHERE  T.IDPESSJUR      = '+CtrlRegra.ClientDataSetIn.FieldByName('IdPessjur').AsString+' '+
                              ' AND    T.IDPLANOPREV    = '+CtrlRegra.ClientDataSetIn.FieldByName('idplanoprev').AsString+' '+
                              ' AND    T.IDPESSOA       = '+CtrlRegra.ClientDataSetIn.FieldByName('idpessoa').AsString+' '+
                              ' AND    T.MESCOBRANCA    = '+CtrlRegra.ClientDataSetIn.FieldByName('mescobranca').AsString+' '+
                              ' AND    T.IDDESCONTO     = '+CtrlRegra.ClientDataSetIn.FieldByName('idcontribuicao').AsString+'  '+
                              ' AND    T.CODPROVDESC    = '+CtrlRegra.ClientDataSetIn.FieldByName('codprovdesc').AsString+' '+
                              ' AND    T.FLGATRASODEVOL = '+CtrlRegra.ClientDataSetIn.FieldByName('flgatrasodevol').AsString+' ';
         cdsLoop.Data := SQLParam.Data;

         if cdsLoop.IsEmpty
         then begin

            //se o atraso/devolução não é esperado
            //então gera crítica e não mais insere na tmpdesc
            GravaErrosCCP(qryaux,cdsAux,badaux,False,
                          11, cdsPlanPatro.FieldByName('IdPessjur').AsString,
                          'Atraso/Devolução. Mês de cob. igual ao de referência.',
                          CtrlRegra.ClientDataSetIn.FieldByName('MATRICULA').AsString,
                          CtrlRegra.ClientDataSetIn.FieldByName('CodProvDesc').AsString,
                          sDataRefRegra,
                          CtrlRegra.ClientDataSetIn.FieldByName('ValorRecebido').AsFloat,
                          '', CtrlRegra.ClientDataSetIn.FieldByName('mescobranca').AsString,
                          sNomePatroRegra);

         end
         else begin
            cdsLoop.First;
            rFaltaAbater := CtrlRegra.ClientDataSetIn.FieldByName('ValorRecebido').AsFloat;
            while not cdsLoop.EOF do
            begin
              if rFaltaAbater <= 0
              then sSQLAtualiza := ' UPDATE TMPDESC SET SITENVIO = 1,   '+
                                   '                VALORRECEBIDO  = 0  '+
                                   ' WHERE IDPESSJUR      = '+ IntToStr(cdsPlanPatro.FieldByName('IdPessjur').AsInteger)+
                                   ' AND   IDPLANOPREV    = '+ IntToStr(cdsPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                                   ' AND   IDPESSOA       = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdPessoa').AsInteger)+
                                   ' AND   IDDESCONTO     = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdContribuicao').AsInteger)+
                                   ' AND   CODPROVDESC    = '''+CtrlRegra.ClientDataSetIn.FieldByName('CodProvDesc').AsString+''''+
                                   ' AND   MESCOBRANCA    = '+ '''' +CtrlRegra.ClientDataSetIn.FieldByName('mescobranca').AsString+ ''''+
                                   ' AND   MESREFERENCIA  = '''+cdsLoop.FieldByName('MESREFERENCIA').AsString+''''+
                                   ' AND   FLGATRASODEVOL = '''+CtrlRegra.ClientDataSetIn.FieldByName('FLGATRASODEVOL').AsString+''''
              else begin
                 if (cdsLoop.FieldByName('Valor').AsFloat <= rFaltaAbater) and
                    (cdsLoop.recordcount > 1)
                 then begin
                    sSQLAtualiza := ' UPDATE TMPDESC SET SITENVIO  = 2,     '+
                                    ' DATARECEBIMENTO = TO_DATE('''+sDataCobRegra+''',''DD/MM/YYYY'')  ,  VALORRECEBIDO = VALOR ,   FLGDESCFOLHA = ''P''  '+
                                    ' WHERE IDPESSJUR      = '+ IntToStr(cdsPlanPatro.FieldByName('IdPessjur').AsInteger)+
                                    ' AND   IDPLANOPREV    = '+ IntToStr(cdsPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                                    ' AND   IDPESSOA       = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdPessoa').AsInteger)+
                                    ' AND   IDDESCONTO     = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdContribuicao').AsInteger)+
                                    ' AND   CODPROVDESC    = '''+CtrlRegra.ClientDataSetIn.FieldByName('CodProvDesc').AsString+''''+
                                    ' AND   MESCOBRANCA    = '+ '''' + CtrlRegra.ClientDataSetIn.FieldByName('mescobranca').AsString + ''''+
                                    ' AND   MESREFERENCIA  = '''+cdsLoop.FieldByName('MESREFERENCIA').AsString+''''+
                                    ' AND   FLGATRASODEVOL = '''+CtrlRegra.ClientDataSetIn.FieldByName('FLGATRASODEVOL').AsString+''' ';
                    rFaltaAbater := rFaltaAbater - cdsLoop.FieldByName('Valor').AsFloat;
                 end
                 else begin
                    sSQLAtualiza := ' UPDATE TMPDESC SET SITENVIO  = 1,     '+
                                    ' DATARECEBIMENTO = TO_DATE('''+sDataCobRegra+''',''DD/MM/YYYY'')  ,  FLGDESCFOLHA = ''P'' , VALORRECEBIDO = '+OraNumero(FloatToStr(rFaltaAbater))+
                                    ' WHERE IDPESSJUR      = '+ IntToStr(cdsPlanPatro.FieldByName('IdPessjur').AsInteger)+
                                    ' AND   IDPLANOPREV    = '+ IntToStr(cdsPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                                    ' AND   IDPESSOA       = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdPessoa').AsInteger)+
                                    ' AND   IDDESCONTO     = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdContribuicao').AsInteger)+
                                    ' AND   CODPROVDESC    = '''+CtrlRegra.ClientDataSetIn.FieldByName('CodProvDesc').AsString+''''+
                                    ' AND   MESCOBRANCA    = '+ '''' + CtrlRegra.ClientDataSetIn.FieldByName('mescobranca').AsString + ''''+
                                    ' AND   MESREFERENCIA  = '''+cdsLoop.FieldByName('MESREFERENCIA').AsString+''''+
                                    ' AND   FLGATRASODEVOL = '''+CtrlRegra.ClientDataSetIn.FieldByName('FLGATRASODEVOL').AsString+'''';
                    rFaltaAbater := 0;
                 end;
              end;


              ExecSQL(sSQLAtualiza);


              cdsLoop.Next;
            end; // while
         end;
         cdsLoop.Close;
      end
   end
   else begin


      try
         StrToFloat(clientenumero(CtrlRegra.Result));
      except
         exit;
      end;


      // Verificar se a contribuição existe na tmpdesc (tentando atualiza-la)
      // Se a atualizacao nao for feita, significa que nao existe a linha na tmpdesc
      // Entao inseri-la
      if OraNumero(formatfloat('0.00',StrToFloat(clientenumero(CtrlRegra.Result)))) = OraNumero(FormatFloat('0.00',CtrlRegra.ClientDataSetIn.FieldByName('VALORRECEBIDO').AsFloat))
      then sSQLAtualiza := ' UPDATE TMPDESC SET SITENVIO = 2, DATARECEBIMENTO = TO_DATE('''+sDataCobRegra+''',''DD/MM/YYYY'')  ,  FLGDESCFOLHA = ''P'' ,  '+
                           '                    VALOR    = '+OraNumero(formatfloat('0.00',StrToFloat(clientenumero(CtrlRegra.Result))))+','+
                           '                    VALORRECEBIDO = ' + OraNumero(floattostr(CtrlRegra.ClientDataSetIn.FieldByName('VALORRECEBIDO').AsFloat))+
                           ' WHERE IDPESSJUR     = '+ IntToStr(cdsPlanPatro.FieldByName('IdPessjur').AsInteger)+
                           ' AND   IDPLANOPREV   = '+ IntToStr(cdsPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                           ' AND   IDPESSOA      = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdPessoa').AsInteger)+
                           ' AND   IDDESCONTO    = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdContribuicao').AsInteger)+
                           ' AND   MESREFERENCIA = '''+ CtrlRegra.ClientDataSetIn.FieldByName('MesReferencia').AsString+''''+
                           ' AND   MESCOBRANCA   = '+ '''' + CtrlRegra.ClientDataSetIn.FieldByName('mescobranca').AsString + ''' '+
                           ' AND   CODPROVDESC    = '''+CtrlRegra.ClientDataSetIn.FieldByName('CodProvDesc').AsString+'''' 
      else sSQLAtualiza := 'UPDATE TMPDESC SET SITENVIO = 1, DATARECEBIMENTO = TO_DATE('''+sDataCobRegra+''',''DD/MM/YYYY'') ,  FLGDESCFOLHA = ''P'' ,  '+
                           '                   VALOR = '+OraNumero(CtrlRegra.Result)+','+
                           '                   VALORRECEBIDO = ' + OraNumero(floattostr(CtrlRegra.ClientDataSetIn.FieldByName('VALORRECEBIDO').AsFloat))+
                           ' WHERE IDPESSJUR   = '+ IntToStr(cdsPlanPatro.FieldByName('IdPessjur').AsInteger)+
                           ' AND   IDPLANOPREV   = '+ IntToStr(cdsPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                           ' AND   IDPESSOA      = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdPessoa').AsInteger)+
                           ' AND   IDDESCONTO    = '+ IntToStr(CtrlRegra.ClientDataSetIn.FieldByName('IdContribuicao').AsInteger)+
                           ' AND   MESREFERENCIA = '''+ CtrlRegra.ClientDataSetIn.FieldByName('MesReferencia').AsString+''''+
                           ' AND   MESCOBRANCA   = '+ '''' + CtrlRegra.ClientDataSetIn.FieldByName('mescobranca').AsString + ''' '+
                           ' AND   CODPROVDESC    = '''+CtrlRegra.ClientDataSetIn.FieldByName('CodProvDesc').AsString+''' ';


      if not ExecSQL(sSQLAtualiza,True)
      then   GravaTmpDesc(CtrlRegra.ClientDataSetIn.FieldByName('idpessjur').AsString,
                     CtrlRegra.ClientDataSetIn.FieldByName('MESREFERENCIA').AsString,
                     CtrlRegra.ClientDataSetIn.FieldByName('mescobranca').AsString,
                     CtrlRegra.ClientDataSetIn.FieldByName('idpessoa').AsString,
                     'P',
                     CtrlRegra.ClientDataSetIn.FieldByName('matricula').AsString,
                     CtrlRegra.ClientDataSetIn.FieldByName('idplanoprev').AsString,
                     CtrlRegra.ClientDataSetIn.FieldByName('idcontribuicao').AsString,
                     CtrlRegra.ClientDataSetIn.FieldByName('codprovdesc').AsString,
                     CtrlRegra.ClientDataSetIn.FieldByName('flgatrasodevol').AsString,
                     sDataRefRegra ,
                     CtrlRegra.ClientDataSetIn.FieldByName('valorrecebido').AsFloat,
                     CtrlRegra.ClientDataSetIn.FieldByName('valorrecebido').AsFloat,
                     iIdLoteRegra,
                     CtrlRegra.ClientDataSetIn.FieldByName('idrubrica').AsInteger );

   end;



   if bAtualizaContribPai then
   begin

      sSQLAtualiza := ' UPDATE CONTRIBPREVPARTP CPP  SET ';

      if Trim(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase1').AsString) <> '' then
      sSQLAtualiza := sSQLAtualiza +  '   CPP.ASSOC1OP1 = '+OraNumero(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase1').AsString)+' , ';
      if Trim(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase2').AsString) <> '' then
      sSQLAtualiza := sSQLAtualiza +  '   CPP.ASSOC1OP2 = '+OraNumero(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase2').AsString)+', ';
      if Trim(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase3').AsString) <> '' then
      sSQLAtualiza := sSQLAtualiza +  '   CPP.ASSOC1OP3 = '+OraNumero(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase3').AsString)+', ';

      sSQLAtualiza := sSQLAtualiza +  '       CPP.VALORASSOCIADO = '+OraNumero(CtrlRegra.result)+' '+
                    'WHERE (CPP.IDPESSJUR = '+CtrlRegra.ClientDataSetIn.FieldByName('IdPessJur').AsString+') '+
                    'AND   (CPP.IDPLANOPREV = '+CtrlRegra.ClientDataSetIn.FieldByName('idplanoprev').AsString+') '+
                    'AND   (CPP.IDPESSOA = '+CtrlRegra.ClientDataSetIn.FieldByName('idpessoa').AsString+') '+
                    'AND   (CPP.SEQPROPOSTA = '+CtrlRegra.ClientDataSetIn.FieldByName('seqproposta').AsString+' ) '+
                    'AND   (CPP.IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO '+
                    '                              FROM   CONTPREV CP '+
                    '                              WHERE  (CP.IDCONTRIBPAI = '+CtrlRegra.ClientDataSetIn.FieldByName('idcontribuicao').AsString+') '+
                    '                              AND    (CP.IDPLANOPREV = '+CtrlRegra.ClientDataSetIn.FieldByName('idplanoprev').AsString+' ))) ';
      ExecSQL(sSQLAtualiza);
   end;


   if bAtualizaContribPai2 then
   begin
      sSQLAtualiza := ' UPDATE CONTRIBPREVPARTP CPP  SET ';

      if Trim(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase1').AsString) <> '' then
      sSQLAtualiza := sSQLAtualiza +  '   CPP.ASSOC1OP1 = '+OraNumero(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase1').AsString)+' , ';
      if Trim(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase2').AsString) <> '' then
      sSQLAtualiza := sSQLAtualiza +  '   CPP.ASSOC1OP2 = '+OraNumero(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase2').AsString)+', ';
      if Trim(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase3').AsString) <> '' then
      sSQLAtualiza := sSQLAtualiza +  '   CPP.ASSOC1OP3 = '+OraNumero(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase3').AsString)+', ';

      sSQLAtualiza := sSQLAtualiza +  '       CPP.VALORASSOCIADO2 = '+OraNumero(CtrlRegra.result)+' '+
                    'WHERE (CPP.IDPESSJUR = '+CtrlRegra.ClientDataSetIn.FieldByName('IdPessJur').AsString+') '+
                    'AND   (CPP.IDPLANOPREV = '+CtrlRegra.ClientDataSetIn.FieldByName('idplanoprev').AsString+') '+
                    'AND   (CPP.IDPESSOA = '+CtrlRegra.ClientDataSetIn.FieldByName('idpessoa').AsString+') '+
                    'AND   (CPP.SEQPROPOSTA = '+CtrlRegra.ClientDataSetIn.FieldByName('seqproposta').AsString+' ) '+
                    'AND   (CPP.IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO '+
                    '                              FROM   CONTPREV CP '+
                    '                              WHERE  (CP.IDCONTRIBPAI2 = '+CtrlRegra.ClientDataSetIn.FieldByName('idcontribuicao').AsString+') '+
                    '                              AND    (CP.IDPLANOPREV = '+CtrlRegra.ClientDataSetIn.FieldByName('idplanoprev').AsString+' ))) ';
      ExecSQL(sSQLAtualiza);
   end;



   if bAtualizaContribPai3 then
   begin
      sSQLAtualiza := ' UPDATE CONTRIBPREVPARTP CPP  SET ';

      if Trim(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase1').AsString) <> '' then
      sSQLAtualiza := sSQLAtualiza +  '   CPP.ASSOC1OP1 = '+OraNumero(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase1').AsString)+' , ';
      if Trim(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase2').AsString) <> '' then
      sSQLAtualiza := sSQLAtualiza +  '   CPP.ASSOC1OP2 = '+OraNumero(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase2').AsString)+', ';
      if Trim(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase3').AsString) <> '' then
      sSQLAtualiza := sSQLAtualiza +  '   CPP.ASSOC1OP3 = '+OraNumero(CtrlRegra.ClientDataSetIn.FieldByName('ValorBase3').AsString)+', ';

      sSQLAtualiza := sSQLAtualiza +  '       CPP.VALORASSOCIADO3 = '+OraNumero(CtrlRegra.result)+' '+
                    'WHERE (CPP.IDPESSJUR = '+CtrlRegra.ClientDataSetIn.FieldByName('IdPessJur').AsString+') '+
                    'AND   (CPP.IDPLANOPREV = '+CtrlRegra.ClientDataSetIn.FieldByName('idplanoprev').AsString+') '+
                    'AND   (CPP.IDPESSOA = '+CtrlRegra.ClientDataSetIn.FieldByName('idpessoa').AsString+') '+
                    'AND   (CPP.SEQPROPOSTA = '+CtrlRegra.ClientDataSetIn.FieldByName('seqproposta').AsString+' ) '+
                    'AND   (CPP.IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO '+
                    '                              FROM   CONTPREV CP '+
                    '                              WHERE  (CP.IDCONTRIBPAI3 = '+CtrlRegra.ClientDataSetIn.FieldByName('idcontribuicao').AsString+') '+
                    '                              AND    (CP.IDPLANOPREV = '+CtrlRegra.ClientDataSetIn.FieldByName('idplanoprev').AsString+' ))) ';
      ExecSQL(sSQLAtualiza);
   end;


   if iContadorCommit > NumMaxRegSemCommit then
   begin
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
      if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;
      iContadorCommit := 0;
   end;


end;



function TCtrlImportaFinanc.GravaTotSalarios( var F : TextFile;
                               mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sMesCob : String;
                               bCobra13 : Boolean;
                               iIdRubSalPart, iIdRubSal13 : Integer ) : Boolean;
var sSQL : String;
lin, col : Integer;
begin

   //apaga os somatórios de salários
   //deve ser processado toda vez por que pode mudar
   //dependendo dos passos que já fora processados
   // se forem processados separadamente
   sSQL := ' DELETE HSTRUBRICAXPESS  WHERE ' +
           ' MESREFERENCIA = '''+sMesCob+''' AND  '+
           ' IDPESSOA =  '''+sIDPessjur+'''  ';
           if trim(sIDPlanoPrev) <> '' then
           sSQL := sSQL+' AND IDPLANOPREV =  '''+sIDPlanoPrev+''' ';

   if not  ExecSQL(sSQL) then
   begin
      WriteLn(F,'Não Apagou o Cálculo Total de Salário Participação por plano no Histórico.');
      exit;
   end;



   lbMensagens.Lines.Add(TimeToStr(Time)+' - Calculando o Valor Total do Salário Participação');
   Application.ProcessMessages;

   // A ROTINA ABAIXO FOI COMENTADA PORQUE APESAR DE TER MELHOR PERFORMANCE,
   // QUANDO PROCESSAMOS UM 2O. ARQUIVO COM UMA PESSOA SEM SALARIO DE PARTICIPACAO13, POR
   // EXEMPLO, DÁ ERRO
   sSQL := 'INSERT INTO HSTRUBRICAXPESS (                                             '+
           'MESREFERENCIA,IDRUBRICA,VALORACUMULADO,IDPESSOA,IDPLANOPREV)              '+
           'SELECT '''+sMesCob + ''','+IntToStr(iIdRubSalPart) +', SUM(VALORPROVENTO), '+
                       sIDPessJur+', IDPLANOPREV                                      '+
           'FROM   HISTRUBSAL                                                         '+
           'WHERE  MESCOBRANCA = '''+sMesCob+''' '+
           'AND    MES         = '''+sMesCob+''' '+
           'AND    IDPESSJUR   = '+sIDPessJur     +
           'AND    IDMODULO    = 32              '+
           'GROUP BY IDPLANOPREV ';

   if not  ExecSQL(sSQL) then
   begin
      WriteLn(F,'Não gravou o Cálculo Total de Salário Participação por plano no Histórico.');
      exit;
   end;
end;



function TCtrlImportaFinanc.MontaDemonstrativo(qryTxt : TwwQuery ;
                               cdsDadosArquivo : TCMClientDataSet;
                               var F, bad : TextFile;
                               mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sMesRef, sMesCob, sNomePatro : String;
                               bInsereClasseRubricas : Boolean;
                               frmaguarde : TfrmAguarde) : Boolean;
var
   sCodRub : String;
   dTotalRub , rValor : Double;


begin

   if bInsereClasseRubricas then
   begin
      //demonstrativo de rubricas que entraram na CLASSERUBRICAS mas
      //não foram incluídas na TMPDESC por algum problema, como:
      //-as contribuições recebidas não estarem associadas ao participante
      //-código de rubricas diversas não esperadas pela tmpdesc
      SQLParam.SQL.Text :=
         'SELECT C.VALORCHAVE MATRICULA, C.IDPESSOA , '+
         'C.IDCONTRIBUICAO , C.IDRUBRICA , C.CODPROVDESC , '+
         'C.VALORRECEBIDO, P.NOME '+
         'FROM PESSOA P, CLASSERUBRICAS C '+
         'WHERE '+
         'C.IDPESSOA = P.IDPESSOA AND '+
         'C.CODPATRO = '+sIDPessjur+'  AND '+
         'C.MESCOBRANCA = '''+sMesCob+''' AND '+
         'C.IDPESSOA = C.IDPESSOA  AND '+
         'NOT EXISTS (SELECT 1  FROM '+
         'TMPDESC WHERE '+
         'IDPESSJUR = C.CODPATRO AND '+
         'IDPLANOPREV = C.CODPLANO AND '+
         'IDPESSOA = C.IDPESSOA AND '+
         'IDDESCONTO = C.IDCONTRIBUICAO AND '+
         'MESCOBRANCA = C.MESCOBRANCA AND '+
         'TMPDESC.MESREFERENCIA = TMPDESC.MESREFERENCIA AND '+
         'IDPROVENTO = IDRUBRICA AND '+
         'VALORRECEBIDO = C.VALORRECEBIDO) '+
         'ORDER BY C.CODPROVDESC, C.VALORCHAVE ';
   end
   else ////caso não haja inserção na classerubricas
        //verificar contribuições não associadas ao participante
   begin
      SQLParam.SQL.Text :=  ' SELECT T.MATRICULA, T.IDPESSOA , '+
         ' T.IDDESCONTO IDCONTRIBUICAO , T.IDPROVENTO IDRUBRICA , T.CODPROVDESC , '+
         ' T.VALORRECEBIDO, P.NOME '+
         ' FROM PESSOA P, TMPDESC T '+
         ' WHERE '+
         ' T.MESREFERENCIA = T.MESREFERENCIA AND '+
         ' T.MESCOBRANCA  = '''+sMesCob+''' AND '+
         ' T.IDPESSJUR = '+sIDPessjur+' AND '+
         ' T.IDPESSOA = P.IDPESSOA AND '+
         ' T.FLGTIPODESC = ''P'' AND '+
         ' T.FLGDESCFOLHA = ''P'' AND '+
         ' NOT EXISTS (SELECT 1  FROM '+
         '            CONTRIBPREVPARTP C WHERE '+
         '            C.IDPESSJUR = T.IDPESSJUR AND '+
         '            C.IDPESSOA = T.IDPESSOA AND '+
         '            C.IDPLANOPREV = T.IDPLANOPREV AND '+
         '            C.SEQPROPOSTA = 1 AND '+
         '            C.IDCONTRIBUICAO = T.IDDESCONTO )  '+
         '            ORDER BY T.CODPROVDESC, T.MATRICULA ';
   end;

   cdsaux.Data := SQLParam.Data;

   frmaguarde.Max:= cdsaux.RecordCount;
   frmaguarde.Pos := 1;

   if not cdsaux.EOF then
   begin


      mmDivergencias.Lines.Add('');
      mmDivergencias.Lines.Add('');

      if bInsereClasseRubricas then
      mmDivergencias.Lines.Add('----Demonstrativo de Rubricas não Recebidas---')
      else  mmDivergencias.Lines.Add('----Demonstrativo de Contribuições não Associadas aos Participantes---');

      mmDivergencias.Lines.Add('MATRÍCULA       NOME                                                RUBRICA           VALOR');
      mmDivergencias.Lines.Add('-------------------------------------------------------------------------------------------');
   end;


   sCodRub := trim(cdsaux.FieldByName('CODPROVDESC').AsString);
   dTotalRub :=0;
   while not cdsaux.EOF do
   begin


      if cdsaux.FieldByName('VALORRECEBIDO').AsString = '' then
         rValor := 0
      else
         rValor := cdsaux.FieldByName('VALORRECEBIDO').AsFloat;

      if bInsereClasseRubricas then
      begin

         if trim(cdsaux.FieldByName('IDCONTRIBUICAO').AsString) = '' then
            GravaErrosCCP(qryTxt,cdsDadosArquivo,bad,False, 9, sIDPessjur, 'Contribuição não associada.',
                       cdsaux.FieldByName('MATRICULA').AsString,
                       cdsaux.FieldByName('CODPROVDESC').AsString,
                       sMesRef, rValor,'',sMesCob, sNomePatro)
         else
            GravaErrosCCP(qryTxt,cdsDadosArquivo,bad,False, 10, sIDPessjur, 'Contribuição não lida. Possível duplicação.',
                       cdsaux.FieldByName('MATRICULA').AsString,
                       cdsaux.FieldByName('CODPROVDESC').AsString,
                       sMesRef, rValor,cdsaux.FieldByName('IDCONTRIBUICAO').AsString,sMesCob,sNomePatro);
      end
      else
      begin
            GravaErrosCCP(qryTxt,cdsDadosArquivo,bad,False, 9, sIDPessjur, 'Contribuição não associada.',
                       cdsaux.FieldByName('MATRICULA').AsString,
                       cdsaux.FieldByName('CODPROVDESC').AsString,
                       sMesRef, rValor,'',sMesCob,sNomePatro)
      end;

      mmDivergencias.Lines.Add(completastring(cdsaux.FieldByName('MATRICULA').AsString,' ',15,True)+' '+
                               completastring(cdsaux.FieldByName('NOME').AsString,' ',50,True)+' '+
                               completastring(cdsaux.FieldByName('CODPROVDESC').AsString,' ',7,False)+' '+
                               completastring(cdsaux.FieldByName('VALORRECEBIDO').AsString,' ',15,False));

      frmaguarde.Pos :=   frmaguarde.Pos + 1;
      dTotalRub := dTotalRub + cdsaux.FieldByName('VALORRECEBIDO').AsFloat;

      cdsaux.Next;

      if cdsaux.EOF then
      begin
         mmDivergencias.Lines.Add('                                                                SUBTOTAL:  '+completastring(FloatToStr(dTotalRub),' ',15,False));
         mmDivergencias.Lines.Add('');
         dTotalRub :=0;
         sCodRub := cdsaux.FieldByName('CODPROVDESC').AsString;
      end
      else if (trim(cdsaux.FieldByName('CODPROVDESC').AsString) <> sCodRub) then
      begin
         mmDivergencias.Lines.Add('                                                                SUBTOTAL:  '+completastring(FloatToStr(dTotalRub),' ',15,False));
         mmDivergencias.Lines.Add('');
         dTotalRub :=0;
         sCodRub := cdsaux.FieldByName('CODPROVDESC').AsString;
      end;
   end;//while cdsaux
end;



function TCtrlImportaFinanc.DesfazHistRubSal( mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sIDPlanoPrev,
                               sMesRef, sMesCob : String ) : Boolean;
var ra : double;
    sPlano : String;
begin


   if  trim(sIDPlanoprev) <> '' then
      sPlano  := ' AND IDPLANOPREV = '+sPlano+'';



   ra := 1;
   while ra > 0 do
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

      //deleta de 1000 em 1000

      if not ExecSQL('DELETE HISTRUBSAL  '+
                     '  WHERE MESCOBRANCA = '''+sMesCob+''' '+
                     '  AND IDPESSJUR = '''+sIDPessjur+''' '+
                     sPlano+
                     '  AND IDMODULO  = 32 '+
                     '  AND ROWNUM <= 10000   ', True)  then
      begin
         ra := 0;
      end;

      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

   end;  //while
end;



function TCtrlImportaFinanc.DesfazTmpDesc( mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sIDPlanoPrev,
                               sMesRef, sMesCob : String ) : Boolean;
var sPlano : String;
begin

   Result := False;

   if  trim(sIDPlanoprev) <> '' then
      sPlano  := ' AND IDPLANOPREV = '+sPlano+'';


   // desfaz a gravação na TmpDesc
   if not ExecSQL(' DELETE TMPDESC '+
           ' WHERE MESCOBRANCA = '''+sMesCob+''' '+
           ' AND IDPESSJUR = '''+sIDPessjur+''' '+
           sPlano+
           ' AND IDMODULO  = 32 '+
           ' AND IDMOTIVO    =  '''+IntToStr(prmIdMotivoContrib)+'''    '+
           ' AND FLGDESCFOLHA  =  ''P'' ') then exit;



   // desfaz a gravação na TmpDesc de atualização do CCP - AdmPrev
   if not ExecSQL(' UPDATE TMPDESC' +
           ' SET   SITENVIO = 0, VALORRECEBIDO = NULL, DATARECEBIMENTO = NULL   '+
           ' WHERE MESCOBRANCA = '''+sMesCob+''' '+
           ' AND IDPESSJUR = '''+sIDPessjur+''' '+
           ' AND IDPLANOPREV = '+sPlano+' '+
           ' AND IDMODULO  IN (16,452,454,456,487) '+
           ' AND IDMOTIVO    =  '''+IntToStr(prmIdMotivoContrib)+'''    '+
           ' AND FLGDESCFOLHA   =  ''P'' ') then exit;

   if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
   Result := True;

end;



function TCtrlImportaFinanc.DesfazHstRubricaxPess( mmDivergencias, lbMensagens : TMemo;
                               memErros : TwwDBRichEdit;
                               sIDPessjur, sIDPlanoPrev,
                               sMesRef, sMesCob : String ) : Boolean;
var sPlano : String;
begin
  Result := False;

  if  trim(sIDPlanoprev) <> '' then
     sPlano  := ' AND IDPLANOPREV = '+sPlano+' ';


  // desfaz a gravação na HstRubricaxPess
  if not ExecSQL('DELETE HSTRUBRICAXPESS' +
          ' WHERE MESREFERENCIA = '''+sMesCob+''' '+
          ' AND IDPESSOA = '''+sIDPessjur+''' '+
          sPlano) then exit;
  Result := True;
end;

procedure TCtrlImportaFinanc.AlimentaListaTotSalarios(sidPlanoprev : String ; dValor : Double ; b13 : Boolean);
var Lin, Col : Integer;
    bNaoAlimentou : Boolean;
begin

   bNaoAlimentou := True;
   if b13 then
   begin
      For lin := 0 to  ListaTotSalarios13.RowCount -1 do
      begin
         if not  bNaoAlimentou then Continue;

         if trim(ListaTotSalarios13.Cells[0,lin]) = trim(sidPlanoprev) then
         begin
            try
               ListaTotSalarios13.cells[1,lin] := FloatToStr(StrToFloat(ListaTotSalarios13.cells[1,lin]) + dValor);
            except
               ListaTotSalarios13.cells[1,lin] := FloatTostr(dValor);
            end;
            bNaoAlimentou := False;
         end
         else if trim(ListaTotSalarios13.Cells[0,lin]) = '' then
         begin
            ListaTotSalarios13.cells[0,lin] := trim(sidPlanoprev);
            ListaTotSalarios13.cells[1,lin] := FloatTostr(dValor);
            bNaoAlimentou := False;
         end;
      end;
   end
   else
   begin
      For lin := 0 to  ListaTotSalarios.RowCount -1 do
      begin
         if not  bNaoAlimentou then Continue;

         if trim(ListaTotSalarios.Cells[0,lin]) = trim(sidPlanoprev) then
         begin
            try
               ListaTotSalarios.cells[1,lin] := FloatToStr(StrToFloat(ListaTotSalarios.cells[1,lin]) + dValor);
            except
               ListaTotSalarios.cells[1,lin] := FloatTostr(dValor);
            end;
            bNaoAlimentou := False;
         end
         else if trim(ListaTotSalarios.Cells[0,lin]) = '' then
         begin
            ListaTotSalarios.cells[0,lin] := trim(sidPlanoprev);
            ListaTotSalarios.cells[1,lin] := FloatTostr(dValor);
            bNaoAlimentou := False;
         end;
      end;
   end;

end;



procedure TCtrlImportaFinanc.SetbCritHistRubSal(const Value: Boolean);
begin
  FbCritHistRubSal := Value;
end;



end.
