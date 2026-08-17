{-----------------------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freired os Santos
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
-------------------------------------------------------------------------------------------------}
unit DLookEmptmo;

//	------------------------------------------------------------------------------------------------
//
//	   Alterações realizadas para implementação da tela FrmCadParamIntegraRec
//
//	Autor             :  Marco Diniz
//	Data de Início	   :  20/07/2001
//	Data de Término   :
//	Modificações	   :  1) Inclusão da qryLookPatro;
//                      2) Inclusão da qryLookPlanPrev;
//                      3) Inclusão da qryLookContrato;
//                      4) Inclusão da qryLookItensRec;
//                      5) Inclusão da qryLookUnidNegocio;
//                      6) Inclusão da qryLookPlanPrevContab;
//                      7) Inclusão da qryLookTipoDocCAPCAR;
//                      8) Inclusão da qryLookCCredFolha;
//                      9) Inclusão da qryLookCCDebFolha;
//                     10) Inclusão da qryLookCCredFinan;
//                     11) Inclusão da qryLookCCDebFinan;
//                      8) Inclusão da qryLookSbCredFolha;
//                      9) Inclusão da qryLookSubDebFolha;
//                     10) Inclusão da qryLookSbCredFinan;
//                     11) Inclusão da qryLookSubDebFinan;
//                     12) Inclusão da qryLookPeriodicidade;
//                     13) Inclusão da qryLookProventoA;
//                     14) Inclusão da qryLookProventoN;
//                     15) Inclusão da qryLookProventoD;
//                     16) Inclusão da qryLookMotivo;
//                     17) Inclusão da qryLookDadosBancarios;
//                     18) Inclusão da qryLookPortFormaTodos;
//
// -------------------------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc, stdctrls ;

type
  TdtmLookEmptmo = class(TDataModule)
    qryLookTipOper: TwwQuery;
    qryLookTipOperTIPDESCRICAO: TStringField;
    qryLookTipOperTIPCODIGO: TStringField;
    qryLookTipoReceb: TwwQuery;
    qryLookTipoRecebDESCRICAO: TStringField;
    qryLookTipoRecebCODTIPRECDES: TStringField;
    qryLookTipoRecebRECPAG: TStringField;
    qryLookPlanoConta: TwwQuery;
    qryLookPlanoContaPLANO: TFloatField;
    qryLookPlanoContaPLACONTA: TStringField;
    qryLookPlanoContaPLATIPO: TStringField;
    qryLookPlanoContaPLANOME: TStringField;
    qryLookPortadorFormaR: TwwQuery;
    qryLookPortadorFormaRDESCRICAO: TStringField;
    qryLookPortadorFormaRCODPORTFORMA: TFloatField;
    qryLookPais: TwwQuery;
    qryLookPaisNOMEPAIS: TStringField;
    qryLookPaisIDPAIS: TFloatField;
    qryLookMoeda: TwwQuery;
    qryLookMoedaMOESIGLA: TStringField;
    qryLookMoedaMOECODIGO: TFloatField;
    qryLookMoedaMOEDESC: TStringField;
    qryLookTipoDesemb: TwwQuery;
    qryLookTipoDesembDESCRICAO: TStringField;
    qryLookTipoDesembCODTIPRECDES: TStringField;
    qryLookTipoDesembRECPAG: TStringField;
    qryLookCCredFolha: TwwQuery;
    StringField6: TStringField;
    StringField7: TStringField;
    qryLookCCDebFolha: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    qryLookSbCredFolha: TwwQuery;
    qryLookEstado: TwwQuery;
    qryLookEstadoCODESTADO: TStringField;
    qryLookEstadoNOMEESTADO: TStringField;
    qryLookEstadoIDPAIS: TFloatField;
    qryLookEstadoIDESTADO: TFloatField;
    qryLookCidade: TwwQuery;
    qryLookCidadeNOME: TStringField;
    qryLookCidadeIDCIDADES: TFloatField;
    qryLookCidadeCODESTADO: TStringField;
    qryLookCidadeIDPAIS: TFloatField;
    qryLookCidadeCODMUNICIPIO: TStringField;
    qryLookCidadeIDESTADO: TFloatField;
    qryLookCentroRespon: TwwQuery;
    qryLookCentroResponNOME: TStringField;
    qryLookCentroResponCODCENTRORESPON: TStringField;
    qryLookCentroCusto: TwwQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    qryLookBanco: TwwQuery;
    qryLookBancoRAZAOSOCIAL: TStringField;
    qryLookBancoNOME: TStringField;
    qryLookBancoNUMBANCO: TStringField;
    qryLookBancoIDPESSOA: TFloatField;
    qryLookAlterador: TwwQuery;
    qryLookAlteradorCODALTERADOR: TFloatField;
    qryLookAlteradorDESCRICAO: TStringField;
    qryLookAlteradorRECPAG: TStringField;
    qryLookAlteradorACRESDECRES: TStringField;
    qryLookPatro: TwwQuery;
    qryLookPlanPrev: TwwQuery;
    qryLookItemIntegra: TwwQuery;
    qryLookUnidNegocio: TwwQuery;
    qryLookPlanPrevContab: TwwQuery;
    qryLookCCredFinan: TwwQuery;
    StringField8: TStringField;
    StringField9: TStringField;
    qryLookCCDebFinan: TwwQuery;
    StringField10: TStringField;
    StringField11: TStringField;
    qryLookSubDebFinan: TwwQuery;
    qryLookSbCredFinan: TwwQuery;
    qryLookSubDebFolha: TwwQuery;
    qryLookSbCredFolhaCODSUBCONTA: TFloatField;
    qryLookSbCredFolhaNOMESUBCONTA: TStringField;
    qryLookSubDebFolhaCODSUBCONTA: TFloatField;
    qryLookSubDebFolhaNOMESUBCONTA: TStringField;
    qryLookSbCredFinanCODSUBCONTA: TFloatField;
    qryLookSbCredFinanNOMESUBCONTA: TStringField;
    qryLookSubDebFinanCODSUBCONTA: TFloatField;
    qryLookSubDebFinanNOMESUBCONTA: TStringField;
    qryLookRubricaNormal: TwwQuery;
    qryLookRubricaNormalIDPROVENTO: TFloatField;
    qryLookRubricaNormalDESCRICAO: TStringField;
    qryLookDadosBancarios: TwwQuery;
    qryLookDadosBancariosIDCBANCARIA: TFloatField;
    qryLookDadosBancariosFLGCONTAPREF: TFloatField;
    qryLookDadosBancariosCONTACORRENTE: TStringField;
    qryLookDadosBancariosNUMAGENCIA: TStringField;
    qryLookDadosBancariosBANCO: TStringField;
    qryLookPlanPrevIDPLANOPREV: TFloatField;
    qryLookPlanPrevNOME: TStringField;
    qryLookTipoContrato: TwwQuery;
    qryLookTipoEmptmo: TwwQuery;
    qryLookTipoEmptmoIDTIPOEMPTMO: TFloatField;
    qryLookTipoEmptmoDESCTIPOEMPTMO: TStringField;
    qryLookFormaRecPag: TwwQuery;
    qryLookFormaRecPagDESCRICAO: TStringField;
    qryLookFormaRecPagCODFORMA: TFloatField;
    qryLookFormaRecPagRECPAG: TStringField;
    qryLookFormaRecPagIDPESSOA: TFloatField;
    qryLookPortadorFormaP: TwwQuery;
    qryLookGrupoRegra: TwwQuery;
    qryLookGrupoRegraIDGRUPOREGRA: TFloatField;
    qryLookGrupoRegraDESCRICAO: TStringField;
    qryLookTipoCliente: TwwQuery;
    qryLookTipoClienteIDTIPOCLIENTE: TFloatField;
    qryLookTipoClienteDESCRICAO: TStringField;
    qryLookTipoClienteCODREDUZIDO: TStringField;
    qryLookPrograma: TwwQuery;
    qryLookProgramaIDPROGRAMA: TFloatField;
    qryLookProgramaCODPROGRAMA: TStringField;
    qryLookProgramaDESCPROGRAMA: TStringField;
    qryLookReports: TwwQuery;
    qryLookReportsNAME: TStringField;
    qryLookReportsIDREPORTS: TFloatField;
    qryLookTipoEmptmoIDEMPRESAPROP: TFloatField;
    qryLookTipoEmptmoIDREGRAELEG: TFloatField;
    qryLookTipoEmptmoIDREGRAMARGEM: TFloatField;
    qryLookTipoEmptmoIDREGRARESERVA: TFloatField;
    qryLookTipoEmptmoTEPMAXCONTRATO: TFloatField;
    qryLookTipoEmptmoTEPMAXINSCR: TFloatField;
    qryLookTipoEmptmoTEPMAXPARC: TFloatField;
    qryLookTipoEmptmoTEPMINPARC: TFloatField;
    qryLookTipoEmptmoTEPMINQUIT: TFloatField;
    qryLookPlanPrevContabIDPLANOPREV: TFloatField;
    qryLookPlanPrevContabNOME: TStringField;
    qryLookItemIntegraIDITEMEMPTMO: TFloatField;
    qryLookItemIntegraITEDESCRICAO: TStringField;
    qryLookItemIntegraITCRECPAG: TStringField;
    qryLookTipoRecebDesemb: TwwQuery;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    qryLookTipoContratoIDTIPOCONTREMPTMO: TFloatField;
    qryLookTipoContratoTCEDESCRICAO: TStringField;
    qryLookTipoContratoIDREGRAJURCONC: TFloatField;
    qryLookTipoContratoIDREGRALIMITES: TFloatField;
    qryLookTipoContratoIDREGRASUSPCOBR: TFloatField;
    qryLookTipoContratoIDREGRASLDDIA: TFloatField;
    qryLookTipoContratoIDREGRAJURANTCONC: TFloatField;
    qryLookTipoContratoIDREGRAELEG: TFloatField;
    qryLookTipoContratoIDREGRARESERVA: TFloatField;
    qryLookTipoContratoIDREGRAMARGEM: TFloatField;
    qryLookTipoContratoIDREGRAPRAZOSCONC: TFloatField;
    qryLookTipoContratoFLGSITUACAO: TStringField;
    qryLookTipoContratoFLGSUSPENSAO: TStringField;
    qryLookTipoContratoFLGSEGURO: TStringField;
    qryLookTipoContratoTCEMAXCONTRATO: TFloatField;
    qryLookTipoContratoTCEMAXINSCR: TFloatField;
    qryLookTipoContratoTCEMAXPARC: TFloatField;
    qryLookTipoContratoTCEMINPARC: TFloatField;
    qryLookTipoContratoTCEMINQUIT: TFloatField;
    qryLookTipoContratoIDREPORTS: TFloatField;
    qryLookTipoContratoTCETRATAPARCATRAS: TStringField;
    qryLookTipoContratoTCETRATAPARCPARC: TStringField;
    qryLookTipoContratoIDTIPOEMPTMO: TFloatField;
    qryLookTipoContratoDESCTIPOEMPTMO: TStringField;
    qryLookTipoDocRecDevol: TwwQuery;
    StringField15: TStringField;
    FloatField2: TFloatField;
    StringField16: TStringField;
    StringField17: TStringField;
    qryLookTipoDocRec: TwwQuery;
    StringField18: TStringField;
    FloatField3: TFloatField;
    StringField19: TStringField;
    StringField20: TStringField;
    qryLookTipoDocPag: TwwQuery;
    StringField21: TStringField;
    FloatField4: TFloatField;
    StringField22: TStringField;
    StringField23: TStringField;
    qryLookItemIntegraFLGCENTRALIZA: TFloatField;
    qryLookRubricaAtraso: TwwQuery;
    StringField24: TStringField;
    FloatField5: TFloatField;
    qryLookRubricaDevol: TwwQuery;
    StringField26: TStringField;
    FloatField7: TFloatField;
    qryLookRubricaInforma: TwwQuery;
    StringField27: TStringField;
    FloatField8: TFloatField;
    qryLookItemEmprestimo: TwwQuery;
    qryLookItemEmprestimoITEDESCRICAO: TStringField;
    qryLookItemEmprestimoIDITEMEMPTMO: TFloatField;
    qryLookPatroIDPESSOA: TFloatField;
    qryLookPatroNOME: TStringField;
    qryLookPatroANOFECHAEMPTMO: TFloatField;
    qryLookPatroMESFECHAEMPTMO: TFloatField;
    qryLookPatroANOFECHAPATROEP: TFloatField;
    qryLookPatroMESFECHAPATROEP: TFloatField;
    qryLookPatroANOFECHAFOLHAEP: TFloatField;
    qryLookPatroMESFECHAFOLHAEP: TFloatField;
    qryLookPatroMES_FECHA_CAPCAR: TStringField;
    qryLookPatroMES_FECHA_FOLHA: TStringField;
    qryLookPatroMES_FECHA_PATRO: TStringField;
    qryLookItemIntegraFLGDESTACADO: TFloatField;
    qryLookSitPart: TwwQuery;
    qryLookSitPartIDSITPART: TFloatField;
    qryLookSitPartDESCRICAO: TStringField;
    qryLookSitPartFLGINTERNO: TStringField;
    qryLookSitPartFLGTIPO: TStringField;
    qryLookTipoContratoIDREGRASALBAS: TFloatField;
    qryLookTipoContratoTCEMINRENOVA: TFloatField;
    qryLookTipoEmptmoTEPMINRENOVA: TFloatField;
    qryLookSitPlanoPrev: TwwQuery;
    qryLookSitPlanoPrevIDSITPLANOPREV: TFloatField;
    qryLookSitPlanoPrevDESCRICAO: TStringField;
    qryLookSitPlanoPrevFLGINTERNO: TStringField;
    qryLookTipoContratoMOECODIGO: TFloatField;
    qryLookTipoContratoIDREGRADATACRED: TFloatField;
    qryLookPortadorFormaPCODPORTFORMA: TFloatField;
    qryLookPortadorFormaPDESCRICAO: TStringField;
    qryLookTipoSusp: TwwQuery;
    qryLookTipoSuspIDTIPOSUSPEMPTMO: TFloatField;
    qryLookTipoSuspIDREGRAENVIOPARC: TFloatField;
    qryLookTipoSuspIDREGRARECALCIOF: TFloatField;
    qryLookTipoSuspIDREGRARECALCSEG: TFloatField;
    qryLookTipoSuspIDREGRAVALIDSUSP: TFloatField;
    qryLookTipoSuspTSEDESCRICAO: TStringField;
    qryLookTipoSuspTSEMESES: TFloatField;
    qryLookTipoSuspTSEINICIOSUSP: TDateTimeField;
    qryLookTipoSuspTSEFINALSUSP: TDateTimeField;
    qryLookTipoSuspIDRUBRICAADFERIAS: TFloatField;
    qryLookTipoSuspFLGGERAPARCELAS: TFloatField;
    qryLookTipoSuspFLGATUALSALDOPARC: TFloatField;
    qryLookTipoSuspFLGSUSPCONCESSAO: TFloatField;
    qryLookTipoSuspFLGCOBRAENCARGOS: TFloatField;
    qryLookTipoSuspFLGDEDUZPARCREST: TFloatField;
    qryLookTipoSuspFLGATUALSALDOENV: TFloatField;


  private { Private declarations }

  public { Public declarations }

     procedure PreenchePatro (Lista : TCustomListBox);   (* Popula uma Lista com todos os patrocinadores *)
     procedure PreenchePlano (Lista : TCustomListBox);   (* Popula uma Lista com todos os planos *)

  end;



var
  dtmLookEmptmo: TdtmLookEmptmo;



implementation
{$R *.DFM}



{ TdtmLookEmptmo }

procedure TdtmLookEmptmo.PreenchePatro(Lista: TCustomListBox);
begin
   (* Abre a tabela de patrocinadoras *)
   if not(qryLookPatro.Active) then
      qryLookPatro.Open;

   Lista.Items.Clear;

   (* Preenche a listbox de patrocinadoras e o vetor... *)
   qryLookPatro.First;
   while not(qryLookPatro.EOF) do
   begin
      Lista.Items.AddObject(qryLookPatroNOME.AsString,
         Pointer(qryLookPatroIDPESSOA.AsInteger));
      qryLookPatro.Next;
   end;
end;



procedure TdtmLookEmptmo.PreenchePlano(Lista: TCustomListBox);
begin
   // Abre a tabela de Planos
   if not(qryLookPlanPrev.Active) then 
      dtmLookEmptmo.qryLookPlanPrev.Open;

   Lista.Items.Clear;

   // Preenche a listbox de planos e o vetor...
   qryLookPlanPrev.First;
   while not(qryLookPlanPrev.EOF) do
   begin
      Lista.Items.AddObject(qryLookPlanPrevNOME.AsString,
         Pointer(qryLookPlanPrevIDPLANOPREV.AsInteger));
      qryLookPlanPrev.Next;
   end;

end;

end.
