{
-------------------------------- ALTERAÇÕES -------------------------------------
N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000007064)
Dt Alterações.: 11/11/2025
Responsável...: Paulo Nobre
Descrição.....: Ajuste na qry: qryLookModEmp para retirada do ";" no final do
                SQL, pois o ORACLE não o reconheceu.
---------------------------------------------------------------------------------
Pendência     : WO21209 
Responsável   : Paulo Nobre
Data          : 06/05/2025
Descrição     : Inclusa condição de só trazer as Modalidades ativas na query:
                qryLookModEmp.
---------------------------------------------------------------------------------
Autor(a)    : Petri Nocentini
Data        : 07/07/2015
Pendência   : SOL 257429 PPM 957952
Descrição   : Reimplementação do SOL 199356, que sofreu sobreposição de código
--------------------------------------------------------------------------------
Pendência   : SOL 199356 KINTANA 1931062
Responsável : MARCIO SANCHES SPINOSA SOL 199356 KINTANA 1931062
Data        : 25/07/2013
Descrição   : Criação de qrylookTipoDocPessoa
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------
Pendência   : SOL 182258 KINTANA 1697187
Responsável : TADEU PASSOS
Data        : 12/11/2012
Descrição   : Criação de qryLookRubricaParaEnvio e dsLookRubricaParaEnvio
--------------------------------------------------------------------------------
Pendência   : SOL 144458 KINTANA 1208325
Responsável : ERALDO SILVA
Data        : 14/03/2012
Descrição   : Criar campos "Prestação Atual", "Prestação Projetada" e "Margem"
--------------------------------------------------------------------------------
SOl_KINTANA : 171546_KTN1538728
Data        : 10/01/2012
Autor       : Wylliam Leite da Silva
Rotina      : qryLookSuspConc
Descrição   : Foi adicionada a SUC.SUCDATAINICIO = :PDATAINI a condição maior ou
              igual, SUC.SUCDATAINICIO >= :PDATAINI.
--------------------------------------------------------------------------------
SOl_KINTANA : 163982/7003_KTN1489901
Data        : 22/11/2011
Autor       : Vinicius Eduardo Nascimento Maciel
Rotina      : qryLookUnidNegocio e qryLookUnidNegocioPerdida
Descrição   : Foi adicionada a condição ATIVO = 'S' na qryLookUnidNegocio e foi
              criada a qryLookUnidNegocioPerdida.
--------------------------------------------------------------------------------
//Pendência   : SOL 148026 KINTANA 1031173
//Responsável : Vinicius Ferreira
//Descrição   : Permite bloquear o mutuário por modalidade, criei qryLookModEmp. 
//--------------------------------------------------------------------------------
Pendência   : SOL 142594 KTN 912858
Responsável : Ádler Souza
Data        : 25/08/2010
Descrição   : Não exibir suspensão que não seja apenas de concessão na tela de
              Inscrição / Concessão / Renovação
--------------------------------------------------------------------------------
Pendência   : SOL 132000 KINTANA 758243
Responsável : Fernando Santana
Data        : 07/07/2010
Descrição   : Na query qryLookSuspConc passar a considerar o campo SUC.FLGPRAZOINDETERMINADO.
--------------------------------------------------------------------------------
Pendência   : SOL 123125 KINTANA 612563
Responsável : BRUNO AZEVEDO
Data        : 07/06/2010
Descrição   : Envio de rubricas informativas para a folha de benefícios.
--------------------------------------------------------------------------------
}
//******************************************************************************
//Rotina: Suspensão de Concessão
//Nº SOL: 129966
//Nº KINTANA: 718118
//Data da Alteração: 08/03/2010
//Responsável: Ádler Teodoro de Souza
//Descrição: alteração na qryLookSuspConc.
//******************************************************************************
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

{ --------------------------------------------------------------------------------------------------
Pendência   : 108099 - Kintana: 487201
Responsável : Daniel Begnami
Data        : 13/04/2008
Descrição   : Criação de novas modalidades de emprestimo.
--------------------------------------------------------------------------------------------------
Rotina    : qryLookEndereco
Data      : 14/11/2007
Autor     : Alberto
Pendência : 26746
Descrição : Procura do código do estado na tabela ESTADO 
---------------------------------------------------------------------------------------------------}

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
    qryLookSuspConc: TwwQuery;
    qryLookSuspConcIDPESSOA: TFloatField;
    qryLookSuspConcNOME: TStringField;
    qryLookSuspConcSUCDATAINICIO: TDateTimeField;
    qryLookSuspConcSUCDATAFINAL: TDateTimeField;
    qryLookSuspConcSUCMOTIVOSUSP: TStringField;
    qryLookAssinatura: TwwQuery;
    qryLookDadosBancariosDADOS: TStringField;
    qryLookDadosBancariosTIPOCONTA: TStringField;
    qryLookEndereco: TwwQuery;
    qryLookEnderecoENDERECO: TStringField;
    qryLookEnderecoBAIRRO: TStringField;
    qryLookEnderecoCODESTADO: TStringField;
    qryLookEnderecoCEP: TStringField;
    qryLookEnderecoNOME_CIDADE: TStringField;
    qryLookTipoContratoIDREGRAQUITADO: TFloatField;
    qryLookTipoContratoFLGCOBRJUDIC: TFloatField;
    qryLookTipoContratoTCEMAXMESDEB: TFloatField;
    qryLookTipoContratoIDREGRAVLRMAX: TFloatField;
    qryLookTipoContratoNUMPARCDESCONTO: TFloatField;
    qryLookTipoContratoIDREGRAPRAZOMAX: TFloatField;
    qryLookContaBancaria: TwwQuery;
    qryLookContaBancariaIDCBANCARIA: TFloatField;
    qryLookContaBancariaFLGCONTAPREF: TFloatField;
    qryLookContaBancariaCONTACORRENTE: TStringField;
    qryLookContaBancariaTIPOCONTA: TStringField;
    qryLookContaBancariaNUMAGENCIA: TStringField;
    qryLookContaBancariaBANCO: TStringField;
    qryLookContaBancariaDADOS: TStringField;
    qryLookContaBancariaIDBANCO: TFloatField;
    qryLookMaxContratoPadraoObrig: TwwQuery;
    qryContratoPadraoAtivo: TwwQuery;
    qryLookMaxContratoPadraoObrigIDCONTRATOPADRAO: TFloatField;
    qryLookMaxContratoPadraoObrigCTPDATAINICIO: TDateTimeField;
    qryContratoPadraoAtivoIDCONTRATOPADRAO: TFloatField;
    qryLookDadosBancariosIDBANCO: TFloatField;
    qryLookRubricaNormalCODPROVDESC: TStringField;
    qryLookRubricaAtrasoCODPROVDESC: TStringField;
    qryLookRubricaDevolCODPROVDESC: TStringField;
    qryLookRubricaInformaCODPROVDESC: TStringField;
    qryLookTipoSusp: TwwQuery;
    qryLookAssinaturaIDPESSOA: TFloatField;
    qryLookAssinaturaIDCONTRATOPADRAO: TFloatField;
    qryLookAssinaturaACPDATAASSINAT: TDateTimeField;
    qryLookAssinaturaCTPDATAINICIO: TDateTimeField;
    qryLookAssinaturaFLGINTERNO: TStringField;
    qryLookAssinaturaIDPLANOPREV: TFloatField;
    qryLookAssinaturaCTPOBRIGATORIO: TFloatField;
    qryLookTipoContr: TwwQuery;
    StringField5: TStringField;
    FloatField6: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    StringField25: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    StringField30: TStringField;
    StringField31: TStringField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    qryLookTipoContrIDTIPOCONTREMPTMO: TFloatField;
    qryLookTipoContrIDTIPOEMPTMO: TFloatField;
    qryLookTipoContrDESCTIPOEMPTMO: TStringField;
    qryLookAssinaturaIDBENEF: TFloatField;
    qryLookAssinaturaFLGBLOQUEIO: TFloatField;
    qryLookPossuiAssinatura: TwwQuery;
    qryLookPossuiAssinaturaIDPESSOA: TFloatField;
    qryLookPossuiAssinaturaIDCONTRATOPADRAO: TFloatField;
    qryLookPossuiAssinaturaACPDATAASSINAT: TDateTimeField;
    qryLookPossuiAssinaturaIDCONTRATOPADRAO_1: TFloatField;
    qryLookPossuiAssinaturaCTPDATAINICIO: TDateTimeField;
    qryLookPossuiAssinaturaCTPOBRIGATORIO: TFloatField;
    qryLookPossuiAssinaturaIDBENEF: TFloatField;
    qryLookTipoContrIDPROVENTOVLMAX: TFloatField;
    qryLookTipoContrIDPROVENTOVLDEV: TFloatField;
    qryLookTipoContratoFLGVERPRAZOTIPOQUIT: TFloatField;
    qryLookTipoContrFLGVERPRAZOTIPOQUIT: TFloatField;
    qryLookTipoContrFLGFORMAPAG: TStringField;
    qryLookTipoContrFLGFORMAREC: TStringField;
    qryLookTipoContratoFLGFORMAPAG: TStringField;
    qryLookTipoContratoFLGFORMAREC: TStringField;
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
    qryLookTipoSuspFLGFERIAS: TFloatField;
    qryLookTipoSuspFLGCOBRJUDICIAL: TFloatField;
    qryLookTipoSuspPERCENTUAL: TFloatField;
    qryLookTipoSuspFLGSUSAPENASCONC: TFloatField;
    qryLookRubricaInfEmprestimo: TwwQuery;   //BRUNO AZEVEDO SOL 123125 KINTANA 612563
    StringField32: TStringField;
    FloatField1: TFloatField;
    StringField33: TStringField;
    qryLookRubricaInfEmprestimo2: TwwQuery;
    qryLookRubricaInfEmprestimo2IDPROVENTO: TFloatField;
    qryLookRubricaInfEmprestimo2DESCRICAO: TStringField;
    qryLookRubricaInfEmprestimo2CODPROVDESC: TStringField;
    qryLookRubricaInfEmprestimo2FLGTPRUBRICA: TStringField;
    qryLookModEmp: TwwQuery;
    qryLookUnidNegocioPerdida: TwwQuery;
    qryLookUnidNegocioPerdidaNOME: TStringField;
    qryLookTipoSuspTSEIDREGRACALCPRESTPROJETADA: TFloatField;//SOL 144458 KINTANA 1208325 - Eraldo
    qryLookTipoSuspTSEIDREGRACALCULOMARGELATUAL: TFloatField;//SOL 144458 KINTANA 1208325 - Eraldo
    // TADEU SOL 182258 KINTANA 1697187
	qryLookRubricaParaEnvio: TwwQuery;
    qryLookRubricaParaEnvioIDPROVENTO: TFloatField;
    qryLookRubricaParaEnvioCODPROVDESC: TStringField;
    qryLookRubricaParaEnvioDESCRICAO: TStringField;
    qryLookRubricaParaEnvioDESCRPROVDESC: TStringField;
    dsLookRubricaParaEnvio: TwwDataSource;
    // TADEU SOL 182258 KINTANA 1697187
    
    //MARCIO SANCHES SPINOSA SOL 199356 KINTANA 1931062 - Inicio
    qryLookTipoDocPessoa: TwwQuery;
    qryLookTipoDocPessoaIDDOCUMENTO: TFloatField;
    qryLookTipoDocPessoaNOMEDOCUMENTO: TStringField;
    qryLookDadosBancariosDADOS2: TStringField;
    qryLookDadosBancariosSTATUS: TStringField;
    //MARCIO SANCHES SPINOSA SOL 199356 KINTANA 1931062 - Fim

    procedure DataModuleCreate(Sender: TObject);
    procedure qryLookTipoSuspBeforeOpen(DataSet: TDataSet);


  private { Private declarations }

  public { Public declarations }

     procedure PreenchePatro (Lista : TCustomListBox);   (* Popula uma Lista com todos os patrocinadores *)
     procedure PreenchePlano (Lista : TCustomListBox);   (* Popula uma Lista com todos os planos *)

  end;



var
  dtmLookEmptmo: TdtmLookEmptmo;



implementation
{$R *.DFM}

uses
   USistema;

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


//Pendência 26190 - 212/09/2007 - Alberto
procedure TdtmLookEmptmo.DataModuleCreate(Sender: TObject);
begin

   qryLookPortadorFormaP.SQL.Text :=
      'SELECT PF.CODPORTFORMA, PF.DESCRICAO '                           + #13 +
      'FROM   PORTADORFORMA PF '                                        + #13 +
      'WHERE  PF.IDPESSOA = :PIDPESSOA  '                               + #13 +
      'AND    PF.RECPAG = ''P'' '                                       + #13 +
      'AND    NVL(PF.FLGATIVO,''S'') = ''S'' '                          + #13 +
      'AND    (NOT EXISTS( SELECT * '                                   + #13 +
      '                    FROM   PORTFORMAXMODULO PFM, '               + #13 +
      '                           PORTADORFORMA PFO     '               + #13 +
      '                    WHERE  PFM.CODPORTFORMA = PFO.CODPORTFORMA ' + #13 +
      '                    AND    PFO.RECPAG = ''P'' '                  + #13 +
      '                    AND    PFM.IDMODULO = '    +
                           IntToStr(Sistema.IdModulo) + ') '            + #13 +
      '        OR  EXISTS( SELECT *  '                                  + #13 +
      '                    FROM   PORTFORMAXMODULO '                    + #13 +
      '                    WHERE  IDMODULO = '        +
                           IntToStr(Sistema.IdModulo)                   + #13 +
      '                    AND    CODPORTFORMA = PF.CODPORTFORMA ) ) '  + #13 +
      'ORDER BY PF.DESCRICAO ';

   qryLookPortadorFormaR.SQL.Text :=
      'SELECT PF.CODPORTFORMA, PF.DESCRICAO '                           + #13 +
      'FROM   PORTADORFORMA PF '                                        + #13 +
      'WHERE  PF.IDPESSOA = :PIDPESSOA  '                               + #13 +
      'AND    PF.RECPAG = ''R'' '                                       + #13 +
      'AND    NVL(PF.FLGATIVO,''S'') = ''S'' '                          + #13 +
      'AND    (NOT EXISTS( SELECT * '                                   + #13 +
      '                    FROM   PORTFORMAXMODULO PFM, '               + #13 +
      '                           PORTADORFORMA PFO     '               + #13 +
      '                    WHERE  PFM.CODPORTFORMA = PFO.CODPORTFORMA ' + #13 +
      '                    AND    PFO.RECPAG = ''R'' '                  + #13 +
      '                    AND    PFM.IDMODULO = '    +
                           IntToStr(Sistema.IdModulo) + ') '            + #13 +
      '        OR  EXISTS( SELECT *  '                                  + #13 +
      '                    FROM   PORTFORMAXMODULO '                    + #13 +
      '                    WHERE  IDMODULO = '        +
                           IntToStr(Sistema.IdModulo)                   + #13 +
      '                    AND    CODPORTFORMA = PF.CODPORTFORMA ) ) '  + #13 +
      'ORDER BY PF.DESCRICAO ';

end;
//Fim Pendência 26190


procedure TdtmLookEmptmo.qryLookTipoSuspBeforeOpen(DataSet: TDataSet);
begin
  // Ádler Souza - SOL 142594 KTN 912858
  if qryLookTipoSusp.parambyname('PCONC').AsString  = '' then
    qryLookTipoSusp.parambyname('PCONC').AsInteger := 0;
  //Fim - Ádler Souza - SOL 142594 KTN 912858    
end;

end.
